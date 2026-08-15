#!/usr/bin/env python3
"""List handwritten files for deterministic audits."""
from pathlib import Path
import argparse

EXCLUDED={"node_modules","dist","build","coverage",".next",".turbo",".cache",".git"}

def main():
    p=argparse.ArgumentParser()
    p.add_argument("root", nargs="?", default=".")
    p.add_argument("--ext", action="append", required=True)
    a=p.parse_args(); root=Path(a.root).resolve(); exts=set(a.ext)
    files=[x.relative_to(root) for x in root.rglob("*") if x.is_file() and x.suffix in exts and not x.name.endswith('.d.ts') and not any(part in EXCLUDED for part in x.parts)]
    for x in sorted(files): print(x.as_posix())
    print(f"TOTAL={len(files)}")
if __name__=="__main__": main()
