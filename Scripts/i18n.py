#!/usr/bin/env python3.8

def i18n(word: str) -> str:
    if len(word) <= 2:
        return word
    return word[0] + str(len(word) - 2) + word[-1]

print(' '.join(map(i18n, input().split(' '))), end='')
