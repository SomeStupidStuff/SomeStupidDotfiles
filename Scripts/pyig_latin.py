#!/usr/bin/env python3.8
from enum import Enum, auto

class Case(Enum):
    Lower = auto()
    Upper = auto()
    Other = auto()

    def from_char(char):
        if char.islower():
            return Case.Lower
        elif char.isupper():
            return Case.Upper
        return Case.Other

    def convert_char(self, char):
        if self == Case.Lower:
            return char.lower()
        elif self == Case.Upper:
            return char.upper()
        return char

consonants = "bcdfghjklmnpqrstvwxz"

def to_pyig(word):
    if len(word) == 0:
        return ""
    case = Case.from_char(word[0])
    if case == Case.Other:
        return word
    prefix = f"{case.convert_char('p')}y"
    for i, c in enumerate(word.lower()):
        if c in consonants:
            continue
        elif c in "iy":
            i += 1
        break
    return f"{prefix}{word[i:].lower()}"

print(' '.join(map(to_pyig, input().split(' '))), end='')
