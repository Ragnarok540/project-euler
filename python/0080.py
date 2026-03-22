# Square Root Digital Expansion:
# It is well known that if the square root of a natural number is not
# an integer, then it is irrational. The decimal expansion of such square
# roots is infinite without any repeating pattern at all.
# The square root of two is 1.41421356237309504880, and the digital
# sum of the first one hundred decimal digits is 475.
# For the first one hundred natural numbers, find the total of the
# digital sums of the first one hundred decimal digits for all the
# irrational square roots.
# https://en.wikipedia.org/wiki/Square_root_algorithms#Decimal_(base_10)

def separate_pairs(num, type_num='int'):
    result = []
    str_num = str(num)
    le = len(str_num)

    if le % 2 != 0:
        le = le + 1

        if type_num == 'int':
            str_num = str_num.zfill(le)

        if type_num == 'dec':
            str_num += '0'

    for x in range(0, le, 2):
        pair = str_num[x:x + 2]
        result.append(int(pair))

    return result


def separate(num):
    result = []
    str_num = str(num)
    sp_str_num = str_num.split('.')
    result.extend(separate_pairs(sp_str_num[0]))

    if len(sp_str_num) == 2:
        result.append('.')
        result.extend(separate_pairs(sp_str_num[1], type_num='dec'))

    return result


def sqrt_digits(pairs, digits):
    result = []
    step = 0
    p = 0
    x = 9
    c = 0
    y = 0
    pairs.extend([0] * (digits - 1))

    for pair in pairs:
        if pair == '.':
            result.append(pair)
            continue

        if step == 0:
            c = pair

        if step > 0:
            c = (c - y) * 100 + pair

        x = 9
        y = x * (20 * p + x)

        while y > c:
            x -= 1
            y = x * (20 * p + x)

        p = p * 10 + x
        result.append(x)

        if step > 0 and c == y:
            break

        if step > digits:
            break

        step += 1

    return result


def sum_digits(nums):
    result = 0

    for num in nums:
        if num == '.':
            continue

        result += num

    return result


if __name__ == "__main__":
    # digits = sqrt_digits(separate(2.0), 99)
    # print(sum_digits(digits))
    # 475

    total = 0

    for i in range(1, 100):
        digits = sqrt_digits(separate(float(i)), 99)

        if digits[-2:] == ['.', 0]:
            continue

        total += sum_digits(digits)

    print(total)
    # 40886

    # float(''.join(['1','2','.','3','4']))
    # print(separate(152.2756))
    # print(sqrt_digits(separate(152.2756), 10))
    # print(sqrt_digits(separate(4.0), 3))
    # print(sum_digits([1, '.', 4, 1, 4]))
    # print(sum_digits([1, 2, '.', 3, 4]))
    # print(sum_digits(sqrt_digits(separate(152.2756), 3)))
