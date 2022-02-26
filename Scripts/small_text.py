#!/usr/bin/env python3.8

letters = "ᵃᵇᶜᵈᵉᶠᵍʰᶦʲᵏˡᵐⁿᵒᵖᵠʳˢᵗᵘᵛʷˣʸᶻ"
numbers = "⁰¹²³⁴⁵⁶⁷⁸⁹"

def to_small(letter):
    if letter.isalpha():
        return letters[ord(letter.lower()) - ord('a')]
    elif letter.isnumeric():
        return numbers[int(letter)]
    return letter

print(''.join(map(to_small, input())), end='')
