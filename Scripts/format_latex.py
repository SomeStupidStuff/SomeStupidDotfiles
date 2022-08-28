#!/usr/bin/env python3
from sys import argv
from re import search

assert len(argv) == 2

with open(argv[1]) as f:
    lines = [line.rstrip() for line in f.readlines()]

if len(lines) == 1:
    print(f"\\[ {lines[0]} \\]", end="")
elif len(lines) > 1:
    has_env = any(search("\\\\begin", line) for line in lines)
    # Should we change this any() to an all()?
    has_align_char = any(search("&", line) for line in lines)
    if has_env:
        print('\n'.join(lines), end="")
    else:
        body = [4 * " " + line + (" \\\\" if i < len(lines) - 1 else "") for i, line in enumerate(lines)]
        env_type = "align" if has_align_char else "math"
        full = ["\\begin{%s}" % env_type, *body, "\\end{%s}" % env_type]
        print('\n'.join(full), end="")
