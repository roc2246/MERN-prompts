[CmdletBinding()]
param(
    [string]$ProjectRoot = (Get-Location).Path
)

$ErrorActionPreference = 'Stop'
$AgentsRoot = Split-Path -Parent $PSScriptRoot

# GitHub Copilot expects its repository instructions under .github/.
$GitHubDir = Join-Path $ProjectRoot '.github'
New-Item -ItemType Directory -Force -Path $GitHubDir | Out-Null
Copy-Item \
    (Join-Path $AgentsRoot 'adapters/github/copilot-instructions.md') \
    (Join-Path $GitHubDir 'copilot-instructions.md') \
    -Force

# Claude Code expects CLAUDE.md at the repository root.
Copy-Item \
    (Join-Path $AgentsRoot 'adapters/CLAUDE.md') \
    (Join-Path $ProjectRoot 'CLAUDE.md') \
    -Force

Write-Host 'Installed thin agent adapters. Canonical AI architecture remains in .agents/.'
