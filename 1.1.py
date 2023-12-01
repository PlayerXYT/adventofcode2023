DIGITS = "1234567890"
out = 0

with open("1i", "r") as f:
    for l in f:
        left, right = ("", "")
        for c in l:
            if c in DIGITS:
                if left == "":
                    left = c
                else:
                    right = c
        if right == "":
            right = left
        out += int(left+right)

print(out)
