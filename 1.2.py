DIGITS = "1234567890"
TEXTS = {
        "o": ["one"],
        "t": ["two", "three"],
        "f": ["four", "five"],
        "s": ["six", "seven"],
        "e": ["eight"],
        "n": ["nine"],
        "z": ["zero"]
       }
TEXT_MAP = {
        "one": "1",
        "two": "2",
        "three": "3",
        "four": "4",
        "five": "5",
        "six": "6",
        "seven": "7",
        "eight": "8",
        "nine": "9",
        "zero": "0"
       }
out = 0

with open("1i", "r") as f:
    for l in f:
        l = l.lower() # You never know if they do a little trolling
        left, right = ("", "")
        for i, c in enumerate(l):
            if c in DIGITS:
                if left == "":
                    left = c
                else:
                    right = c
            elif c in TEXTS:
                for t in TEXTS[c]:
                    if l[i:i+len(t)] == t:
                        if left == "":
                            left = TEXT_MAP[t]
                            break
                        else:
                            right = TEXT_MAP[t]
                            break
        if right == "":
            right = left
        out += int(left+right)
print(out)
