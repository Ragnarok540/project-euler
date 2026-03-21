# Passcode Derivation:
# A common security method used for online banking is to ask the user
# for three random characters from a passcode. For example, if the
# passcode was 531278, they may ask for the 2nd, 3rd, and 5th
# characters; the expected reply would be: 317.
# The text file, keylog.txt, contains fifty successful login attempts.
# Given that the three characters are always asked for in order,
# analyse the file so as to determine the shortest possible secret
# passcode of unknown length.

key_log = [(3, 1, 9),
           (6, 8, 0),
           (1, 8, 0),
           (6, 9, 0),
           (1, 2, 9),
           (6, 2, 0),
           (7, 6, 2),
           (6, 8, 9),
           (3, 1, 8),
           (3, 6, 8),
           (7, 1, 0),
           (7, 2, 0),
           (6, 2, 9),
           (1, 6, 8),
           (1, 6, 0),
           (7, 1, 6),
           (7, 3, 1),
           (7, 3, 6),
           (7, 2, 9),
           (3, 1, 6),
           (7, 6, 9),
           (2, 9, 0),
           (7, 1, 9),
           (3, 8, 9),
           (1, 6, 2),
           (2, 8, 9),
           (7, 1, 8),
           (7, 9, 0),
           (8, 9, 0),
           (3, 6, 2),
           (7, 6, 0),
           (3, 8, 0),
           (7, 2, 8)]


def digits(log):
    result = set()

    for key in log:
        a, b, c = key
        result.add(a)
        result.add(b)
        result.add(c)

    return list(result)


def previous_digits(log, digit):
    result = set()

    for key in log:
        a, b, c = key

        if digit == a:
            continue

        if digit == b:
            result.add(a)

        if digit == c:
            result.add(a)
            result.add(b)

    return list(result)


def derive_passcode(log):
    dig = digits(log)
    passcode_dict = {}

    for d in dig:
        passcode_dict[d] = len(previous_digits(log, d))

    sorted_dict = dict(sorted(passcode_dict.items(), key=lambda item: item[1]))

    return list(sorted_dict.keys())


if __name__ == "__main__":
    print(derive_passcode(key_log))
    # [7, 3, 1, 6, 2, 8, 9, 0]
    # 73162890

# print(digits(key_log))
# print(previous_digits(key_log, 1))
