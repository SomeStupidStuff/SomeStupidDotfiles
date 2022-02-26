#!/usr/bin/env python3.8

vowels = "aiueo"
consonants = "kgsztdcsjnfhbpmryw"

hira_table = {
    "a" : "あ",
    "i" : "い",
    "u" : "う",
    "e" : "え",
    "o" : "お",
    "n" : "ん",
    "k" : {
        "a" : "か",
        "i" : "き",
        "u" : "く",
        "e" : "け",
        "o" : "こ",
    },
    "g" : {
        "a" : "が",
        "i" : "ぎ",
        "u" : "ぐ",
        "e" : "げ",
        "o" : "ご",
    },
    "s" : {
        "a" : "さ",
        "i" : "し",
        "u" : "す",
        "e" : "せ",
        "o" : "そ",
    },
    "z" : {
        "a" : "ざ",
        "i" : "じ",
        "u" : "ず",
        "e" : "ぜ",
        "o" : "ぞ",
    },
    "t" : {
        "a" : "た",
        "i" : "ち",
        "u" : "つ",
        "e" : "て",
        "o" : "と",
    },
    "d" : {
        "a" : "だ",
        "i" : "ぢ",
        "u" : "づ",
        "e" : "で",
        "o" : "ど",
    },
    "ch" : {
        "a" : "ちゃ",
        "i" : "ち",
        "u" : "ちゅ",
        "o" : "ちょ",
    },
    "sh" : {
        "a" : "しゃ",
        "i" : "し",
        "u" : "しゅ",
        "o" : "しょ",
    },
    "j" : {
        "a" : "じゃ",
        "i" : "じ",
        "u" : "じゅ",
        "o" : "じょ",
    },
    "n" : {
        "a" : "な",
        "i" : "に",
        "u" : "ぬ",
        "e" : "ね",
        "o" : "の",
    },
    "f" : {
        "u" : "ふ",
    },
    "h" : {
        "a" : "は",
        "i" : "ひ",
        "u" : "ふ",
        "e" : "へ",
        "o" : "ほ",
    },
    "b" : {
        "a" : "ば",
        "i" : "び",
        "u" : "ぶ",
        "e" : "べ",
        "o" : "ぼ",
    },
    "p" : {
        "a" : "ぱ",
        "i" : "ぴ",
        "u" : "ぷ",
        "e" : "ぺ",
        "o" : "ぽ",
    },
    "m" : {
        "a" : "ま",
        "i" : "み",
        "u" : "む",
        "e" : "め",
        "o" : "も",
    },
    "r" : {
        "a" : "ら",
        "i" : "り",
        "u" : "る",
        "e" : "れ",
        "o" : "ろ",
    },
    "y" : {
        "a" : "や",
        "u" : "ゆ",
        "o" : "よ",
        "A" : "ゃ",
        "U" : "ゅ",
        "O" : "ょ",
    },
    "w" : {
        "a" : "わ",
        "o" : "を",
    },
}

class Consonant:
    def __init__(self, con, vowel, sokuon):
        self.con = con
        self.vowel = vowel
        self.sokuon = sokuon

    def to_romaji(self):
        sokuon = (self.con if self.sokuon else "")
        if self.con == "h" and self.vowel == "u":
            return sokuon + "fu"
        return sokuon + self.con + self.vowel

    def to_hira(self):
        sokuon = ("っ" if self.sokuon else "")
        return sokuon + hira_table[self.con][self.vowel]

class AloneConsonant:
    def __init__(self, con):
        self.con = con

    def to_romaji(self):
        return self.con

    def to_hira(self):
        return hira_table[self.con]

class Vowel:
    def __init__(self, vowel):
        self.vowel = vowel

    def to_romaji(self):
        return self.vowel

    def to_hira(self):
        return hira_table[self.vowel]

class Combo:
    def __init__(self, first, second, sokuon):
        self.first = first
        self.second = second
        self.sokuon = sokuon

    def to_romaji(self):
        sokuon = (self.first[0] if self.sokuon else "")
        return sokuon + self.first.con + self.second.to_romaji()

    def to_hira(self):
        sokuon = ("っ" if self.sokuon else "")
        first = self.first.to_hira()
        second = hira_table[self.second.con][self.second.vowel.upper()]
        return sokuon + first + second

class Converter:
    def __init__(self, text):
        self.text = text
        self.index = 0

    def peek(self):
        if self.index + 1 >= len(self.text):
            return ""
        return self.text[self.index + 1]

    def next(self):
        if self.index >= len(self.text):
            return None
        current = self.text[self.index]
        sokuon = False
        if current in "aiueo":
            self.index += 1
            return Vowel(current)
        elif current == "n" and self.peek() == "n":
            self.index += 1
            return AloneConsonant("n")
        elif current in consonants and self.peek() == current:
            self.index += 1
            sokuon = True
        if current in consonants and (vowel := self.peek()) in vowels:
            self.index += 2
            return Consonant(current, vowel, sokuon)
        elif current in consonants and self.peek() == "h":
            con = self.text[self.index:self.index + 2]
            vowel = self.text[self.index + 2]
            self.index += 3
            return Consonant(con, vowel, sokuon)
        elif current in consonants and self.peek() == "y":
            if current in "cs":
                output = Consonant(current + "h", self.text[self.index + 2], sokuon)
                self.index += 3
                return output
            first = Consonant(current, "i", False)
            second = Consonant(self.text[self.index + 1], self.text[self.index + 2], False)
            self.index += 3
            return Combo(first, second, sokuon)

    def collect(self):
        letters = []
        while (letter := self.next()) is not None:
            letters.append(letter)
        return letters

c = Converter(input())
letters = c.collect()
print(''.join(l.to_hira() for l in letters), end='')
