#!/usr/bin/env python3
"""Inventory handwritten source files for an Agent Skill audit."""
from pathlib import Path
import argparse

EXCLUDED = {"node_modules", "dist", "build", "coverage", ".next", ".turbo", ".cache", ".git"}

def main():
    ap=argparse.ArgumentParser()
    ap.add_argument("root", nargs="?", default=".")
    ap.add_argument("--ext", action="append", required=True, help="Extension such as .ts; repeatable")
    args=ap.parse_args()
    root=Path(args.root).resolve()
    exts=set(args.ext)
    files=[]
    for p in root.rglob("*"):
        if not p.is_file() or p.suffix not in exts:
            continue
        if any(part in EXCLUDED for part in p.parts):
            continue
        if p.name.endswith('.d.ts'):
            continue
        files.append(p.relative_to(root))
    for p in sorted(files): print(p.as_posix())
    print(f"TOTAL={len(files)}")
if __name__ == "__main__": main()
