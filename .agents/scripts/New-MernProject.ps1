[CmdletBinding()]
param(
    [switch]$SkipInstall
)

$ErrorActionPreference = "Stop"

function Write-Step {
    param([string]$Message)
    Write-Host "`n==> $Message" -ForegroundColor Cyan
}

function Assert-Command {
    param([string]$Command)

    if (-not (Get-Command $Command -ErrorAction SilentlyContinue)) {
        throw "'$Command' was not found. Install Node.js and npm, then run this script again."
    }
}

function Invoke-Npm {
    param(
        [Parameter(Mandatory)]
        [string[]]$Arguments
    )

    & npm @Arguments

    if ($LASTEXITCODE -ne 0) {
        throw "npm command failed: npm $($Arguments -join ' ')"
    }
}

function Set-PackageJsonScripts {
    param(
        [Parameter(Mandatory)]
        [string]$PackageJsonPath,

        [Parameter(Mandatory)]
        [hashtable]$Scripts
    )

    $packageJson = Get-Content $PackageJsonPath -Raw | ConvertFrom-Json

    if (-not $packageJson.scripts) {
        $packageJson | Add-Member -NotePropertyName scripts -NotePropertyValue ([PSCustomObject]@{})
    }

    foreach ($entry in $Scripts.GetEnumerator()) {
        $packageJson.scripts | Add-Member `
            -NotePropertyName $entry.Key `
            -NotePropertyValue $entry.Value `
            -Force
    }

    $packageJson | ConvertTo-Json -Depth 20 | Set-Content $PackageJsonPath
}

Assert-Command "node"
Assert-Command "npm"
Assert-Command "git"

$projectPath = (Get-Location).Path
$projectName = Split-Path $projectPath -Leaf

if (Test-Path (Join-Path $projectPath "client")) {
    throw "A 'client' directory already exists in '$projectPath'. Remove or rename it before running this script."
}

if (Test-Path (Join-Path $projectPath "server")) {
    throw "A 'server' directory already exists in '$projectPath'. Remove or rename it before running this script."
}

Write-Step "Initializing Git repository"

if (-not (Test-Path (Join-Path $projectPath ".git"))) {
    & git init

    if ($LASTEXITCODE -ne 0) {
        throw "git init failed."
    }
}
else {
    Write-Host "Git repository already initialized." -ForegroundColor DarkGray
}

Set-Location $projectPath

# ---------------------------------------------------------------------------
# Root workspace
# ---------------------------------------------------------------------------

Write-Step "Creating root package.json"

if (-not (Test-Path (Join-Path $projectPath "package.json"))) {
    Invoke-Npm @("init", "-y")
}

Set-PackageJsonScripts `
    -PackageJsonPath (Join-Path $projectPath "package.json") `
    -Scripts @{
        "dev"            = 'concurrently -n SERVER,CLIENT -c auto "npm run dev --prefix server" "npm run dev --prefix client"'
        "dev:server"     = "npm run dev --prefix server"
        "dev:client"     = "npm run dev --prefix client"
        "build"          = 'npm run build --prefix server && npm run build --prefix client'
        "start"          = "npm run start --prefix server"
        "typecheck"      = 'npm run typecheck --prefix server && npm run typecheck --prefix client'
    }

if (-not $SkipInstall) {
    Invoke-Npm @("install", "--save-dev", "concurrently")
}

# ---------------------------------------------------------------------------
# Express + MongoDB + Mongoose + TypeScript server
# ---------------------------------------------------------------------------

Write-Step "Creating TypeScript Express server"
$serverPath = Join-Path $projectPath "server"
New-Item -ItemType Directory -Path $serverPath | Out-Null
Set-Location $serverPath

Invoke-Npm @("init", "-y")

if (-not $SkipInstall) {
    Invoke-Npm @("install", "express", "mongoose", "cors", "dotenv")
    Invoke-Npm @(
        "install",
        "--save-dev",
        "typescript",
        "tsx",
        "@types/node",
        "@types/express",
        "@types/cors"
    )
}

Set-PackageJsonScripts `
    -PackageJsonPath (Join-Path $serverPath "package.json") `
    -Scripts @{
        "dev"       = "tsx watch src/index.ts"
        "build"     = "tsc"
        "start"     = "node dist/index.js"
        "typecheck" = "tsc --noEmit"
    }

$serverPackageJson = Get-Content (Join-Path $serverPath "package.json") -Raw | ConvertFrom-Json
$serverPackageJson | Add-Member -NotePropertyName type -NotePropertyValue "module" -Force
$serverPackageJson | ConvertTo-Json -Depth 20 | Set-Content (Join-Path $serverPath "package.json")

@'
{
  "compilerOptions": {
    "target": "ES2022",
    "module": "NodeNext",
    "moduleResolution": "NodeNext",
    "rootDir": "src",
    "outDir": "dist",
    "strict": true,
    "esModuleInterop": true,
    "forceConsistentCasingInFileNames": true,
    "skipLibCheck": true,
    "noUncheckedIndexedAccess": true,
    "resolveJsonModule": true,
    "sourceMap": true
  },
  "include": ["src/**/*.ts"],
  "exclude": ["node_modules", "dist"]
}
'@ | Set-Content (Join-Path $serverPath "tsconfig.json")

$serverDirectories = @(
    "src",
    "src/config",
    "src/controllers",
    "src/middleware",
    "src/models",
    "src/routes",
    "src/services",
    "src/types",
    "src/utils"
)

foreach ($directory in $serverDirectories) {
    New-Item -ItemType Directory -Path (Join-Path $serverPath $directory) -Force | Out-Null
}

@'
import mongoose from "mongoose";

export async function connectDatabase(uri: string): Promise<void> {
  try {
    await mongoose.connect(uri);
    console.log("MongoDB connected");
  } catch (error) {
    console.error("MongoDB connection failed:", error);
    process.exit(1);
  }
}
'@ | Set-Content (Join-Path $serverPath "src/config/database.ts")

@'
import { Router } from "express";

const healthRouter = Router();

healthRouter.get("/", (_request, response) => {
  response.status(200).json({
    success: true,
    message: "Server is healthy",
    timestamp: new Date().toISOString()
  });
});

export default healthRouter;
'@ | Set-Content (Join-Path $serverPath "src/routes/health.routes.ts")

@'
import type { ErrorRequestHandler } from "express";

export const errorHandler: ErrorRequestHandler = (
  error,
  _request,
  response,
  _next
) => {
  console.error(error);

  response.status(500).json({
    success: false,
    message: "Internal server error"
  });
};
'@ | Set-Content (Join-Path $serverPath "src/middleware/errorHandler.ts")

@'
import cors from "cors";
import dotenv from "dotenv";
import express from "express";
import { connectDatabase } from "./config/database.js";
import { errorHandler } from "./middleware/errorHandler.js";
import healthRouter from "./routes/health.routes.js";

dotenv.config();

const app = express();
const port = Number(process.env.PORT) || 5000;
const mongoUri =
  process.env.MONGODB_URI ?? "mongodb://127.0.0.1:27017/mern_app";

app.use(
  cors({
    origin: process.env.CLIENT_URL ?? "http://localhost:5173"
  })
);
app.use(express.json());

app.get("/", (_request, response) => {
  response.json({ message: "MERN API is running" });
});

app.use("/api/health", healthRouter);
app.use(errorHandler);

async function startServer(): Promise<void> {
  await connectDatabase(mongoUri);

  app.listen(port, () => {
    console.log(`Server running at http://localhost:${port}`);
  });
}

void startServer();
'@ | Set-Content (Join-Path $serverPath "src/index.ts")

@'
PORT=5000
MONGODB_URI=mongodb://127.0.0.1:27017/mern_app
CLIENT_URL=http://localhost:5173
'@ | Set-Content (Join-Path $serverPath ".env.example")

Copy-Item `
    -Path (Join-Path $serverPath ".env.example") `
    -Destination (Join-Path $serverPath ".env")

# ---------------------------------------------------------------------------
# React + TypeScript + Sass client
# ---------------------------------------------------------------------------

Write-Step "Creating React TypeScript client with Vite"
Set-Location $projectPath

if ($SkipInstall) {
    Invoke-Npm @(
        "create",
        "vite@latest",
        "client",
        "--",
        "--template",
        "react-ts",
        "--no-interactive"
    )
} else {
    Invoke-Npm @(
        "create",
        "vite@latest",
        "client",
        "--",
        "--template",
        "react-ts",
        "--no-interactive"
    )

    Set-Location (Join-Path $projectPath "client")
    Invoke-Npm @("install")
    Invoke-Npm @("install", "--save-dev", "sass")
}

$clientPath = Join-Path $projectPath "client"

@'
VITE_API_URL=http://localhost:5000/api
'@ | Set-Content (Join-Path $clientPath ".env.example")

Copy-Item `
    -Path (Join-Path $clientPath ".env.example") `
    -Destination (Join-Path $clientPath ".env")

Write-Step "Creating SCSS 7-1 architecture"

$scssRoot = Join-Path $clientPath "src/scss"

$scssDirectories = @(
    "abstracts",
    "base",
    "components",
    "layout",
    "pages",
    "themes",
    "vendors"
)

foreach ($directory in $scssDirectories) {
    New-Item -ItemType Directory `
        -Path (Join-Path $scssRoot $directory) `
        -Force | Out-Null
}

@'
$color-background: #f4f5f7;
$color-surface: #ffffff;
$color-text: #1f2937;
$color-primary: #2563eb;
$color-border: #d1d5db;

$font-family-base:
  Inter,
  system-ui,
  -apple-system,
  BlinkMacSystemFont,
  "Segoe UI",
  sans-serif;

$border-radius: 0.5rem;
'@ | Set-Content (Join-Path $scssRoot "abstracts/_variables.scss")

@'
@function rem($pixels) {
  @return calc($pixels / 16) * 1rem;
}
'@ | Set-Content (Join-Path $scssRoot "abstracts/_functions.scss")

@'
@mixin flex-center {
  display: flex;
  align-items: center;
  justify-content: center;
}
'@ | Set-Content (Join-Path $scssRoot "abstracts/_mixins.scss")

@'
*,
*::before,
*::after {
  box-sizing: border-box;
}

html,
body,
#root {
  min-height: 100%;
}

body {
  margin: 0;
}

button,
input,
textarea,
select {
  font: inherit;
}
'@ | Set-Content (Join-Path $scssRoot "base/_reset.scss")

@'
@use "../abstracts/variables" as *;

body {
  font-family: $font-family-base;
  color: $color-text;
  background: $color-background;
}

h1,
h2,
h3,
p {
  margin-top: 0;
}
'@ | Set-Content (Join-Path $scssRoot "base/_typography.scss")

@'
@use "../abstracts/variables" as *;

.button {
  padding: 0.65rem 1rem;
  color: #ffffff;
  cursor: pointer;
  background: $color-primary;
  border: 0;
  border-radius: $border-radius;
}
'@ | Set-Content (Join-Path $scssRoot "components/_buttons.scss")

@'
.site-header {
  width: 100%;
}
'@ | Set-Content (Join-Path $scssRoot "layout/_header.scss")

@'
.site-footer {
  width: 100%;
}
'@ | Set-Content (Join-Path $scssRoot "layout/_footer.scss")

@'
@use "../abstracts/variables" as *;

.home {
  display: grid;
  min-height: 100vh;
  padding: 2rem;
  place-items: center;

  &__card {
    width: min(100%, 42rem);
    padding: 2rem;
    background: $color-surface;
    border: 1px solid $color-border;
    border-radius: $border-radius;
  }

  &__status {
    margin-bottom: 0;
    font-weight: 600;
  }
}
'@ | Set-Content (Join-Path $scssRoot "pages/_home.scss")

@'
:root {
  color-scheme: light;
}
'@ | Set-Content (Join-Path $scssRoot "themes/_default.scss")

@'
/*
  Add third-party/vendor stylesheet overrides here when needed.
*/
'@ | Set-Content (Join-Path $scssRoot "vendors/_vendor.scss")

@'
@use "abstracts/variables";
@use "abstracts/functions";
@use "abstracts/mixins";

@use "vendors/vendor";

@use "base/reset";
@use "base/typography";

@use "layout/header";
@use "layout/footer";

@use "components/buttons";

@use "pages/home";

@use "themes/default";
'@ | Set-Content (Join-Path $scssRoot "main.scss")

@'
import { useEffect, useState } from "react";

interface HealthResponse {
  success: boolean;
  message: string;
  timestamp: string;
}

const apiUrl = import.meta.env.VITE_API_URL ?? "http://localhost:5000/api";

function App() {
  const [status, setStatus] = useState("Checking API connection...");

  useEffect(() => {
    const controller = new AbortController();

    async function checkApi(): Promise<void> {
      try {
        const response = await fetch(`${apiUrl}/health`, {
          signal: controller.signal
        });

        if (!response.ok) {
          throw new Error(`API returned ${response.status}`);
        }

        const data = (await response.json()) as HealthResponse;
        setStatus(`${data.message} — ${data.timestamp}`);
      } catch (error) {
        if (error instanceof DOMException && error.name === "AbortError") {
          return;
        }

        setStatus(
          error instanceof Error
            ? `API unavailable: ${error.message}`
            : "API unavailable"
        );
      }
    }

    void checkApi();

    return () => controller.abort();
  }, []);

  return (
    <main className="home">
      <section className="home__card">
        <h1>MERN TypeScript Starter</h1>
        <p>
          React and Sass are running. The message below verifies the Express and
          MongoDB backend.
        </p>
        <p className="home__status">{status}</p>
      </section>
    </main>
  );
}

export default App;
'@ | Set-Content (Join-Path $clientPath "src/App.tsx")

$mainPath = Join-Path $clientPath "src/main.tsx"
$mainContent = Get-Content $mainPath -Raw
$mainContent = $mainContent.Replace('import "./index.css"', 'import "./scss/main.scss"')
Set-Content $mainPath $mainContent

Remove-Item (Join-Path $clientPath "src/index.css") -ErrorAction SilentlyContinue
Remove-Item (Join-Path $clientPath "src/App.css") -ErrorAction SilentlyContinue

# ---------------------------------------------------------------------------
# Project-level files
# ---------------------------------------------------------------------------

Write-Step "Creating project documentation and Git configuration"
Set-Location $projectPath

@'
node_modules/
dist/
.env
.env.*
!.env.example
*.log
.DS_Store
.vscode/
.idea/
'@ | Set-Content (Join-Path $projectPath ".gitignore")

$readme = @'
# MERN TypeScript Starter

MERN starter project using:

- MongoDB and Mongoose
- Express
- React with Vite
- Node.js
- TypeScript
- Sass with a 7-1 folder architecture

## Development

Make sure MongoDB is running locally, or update `server/.env` with a MongoDB
connection string.

```powershell
npm run dev
```

Client: http://localhost:5173
Server: http://localhost:5000
Health check: http://localhost:5000/api/health

## SCSS structure

```text
client/src/scss/
├── abstracts/
├── base/
├── components/
├── layout/
├── pages/
├── themes/
├── vendors/
└── main.scss
```

## Other commands

```powershell
npm run build
npm run typecheck
npm run dev:client
npm run dev:server
```
'@

Set-Content `
    -Path (Join-Path $projectPath "README.md") `
    -Value $readme

Write-Step "Setup complete"
Write-Host ""
Write-Host "Project initialized at: $projectPath" -ForegroundColor Green
Write-Host "Git repository initialized." -ForegroundColor Green
Write-Host "SCSS 7-1 architecture created under client/src/scss." -ForegroundColor Green
Write-Host ""
Write-Host "Next step:" -ForegroundColor Yellow
if ($SkipInstall) {
    Write-Host "  npm install"
    Write-Host "  npm install --prefix server"
    Write-Host "  npm install --prefix client"
}
Write-Host "  npm run dev"
Write-Host ""
Write-Host "MongoDB must be running, or server/.env must contain a valid MONGODB_URI."
