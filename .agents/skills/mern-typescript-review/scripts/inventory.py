#!/usr/bin/env python3
"""Deterministically inventory handwritten source files for an Agent Skill audit."""
from pathlib import Path
import argparse

DEFAULT_EXCLUDED = {
    "node_modules", "dist", "build", "coverage", ".next", ".turbo",
    ".cache", ".git", ".vite", "out",
}

def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("root", nargs="?", default=".")
    parser.add_argument("--ext", action="append", required=True, help="Extension such as .ts; repeatable")
    parser.add_argument("--exclude", action="append", default=[], help="Directory name to exclude; repeatable")
    args = parser.parse_args()

    root = Path(args.root).resolve()
    extensions = set(args.ext)
    excluded = DEFAULT_EXCLUDED | set(args.exclude)
    files = []

    for path in root.rglob("*"):
        if not path.is_file() or path.suffix not in extensions:
            continue
        relative = path.relative_to(root)
        if any(part in excluded for part in relative.parts):
            continue
        if path.name.endswith(".d.ts"):
            continue
        files.append(relative)

    for path in sorted(files):
        print(path.as_posix())
    print(f"TOTAL={len(files)}")

if __name__ == "__main__":
    main()
