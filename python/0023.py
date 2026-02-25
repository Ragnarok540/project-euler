# Non-Abundant Sums:
# A perfect number is a number for which the sum of its proper divisors
# is exactly equal to the number. For example, the sum of the proper
# divisors of 28 would be 1 + 2 + 4 + 7 + 14 = 28, which means that 28
# is a perfect number.
# A number n is called deficient if the sum of its proper divisors is
# less than n and it is called abundant if this sum exceeds n.
# As 12 is the smallest abundant number, 1 + 2 + 3 + 4 + 6 = 16, the
# smallest number that can be written as the sum of two abundant numbers
# is 24. By mathematical analysis, it can be shown that all integers
# greater than 28123 can be written as the sum of two abundant numbers.
# However, this upper limit cannot be reduced any further by analysis even
# though it is known that the greatest number that cannot be expressed as
# the sum of two abundant numbers is less than this limit.
# Find the sum of all the positive integers which cannot be written as
# the sum of two abundant numbers.

def divisors(n: int) -> list[int]:
    return [x for x in range(1, n) if n % x == 0]


def abundant_numbers(limit: int) -> list[int]:
    result = []

    for n in range(1, limit):
        sumd = sum(divisors(n))

        if sumd > n:
            result.append(n)

    return result


def abundant_sum(n: int, abundants: list[int]) -> bool:
    for a in abundants:
        c = n - a

        if c in abundants:
            return True

    return False


if __name__ == "__main__":
    limit_a = 28123
    sum_na = 0

    an = abundant_numbers(limit_a)

    for i in range(1, limit_a):
        if not abundant_sum(i, an):
            sum_na += i

    print(sum_na)


# print(divisors(28))
# print(sum(divisors(28)))
# print(abundant_numbers(100))
# print(len(abundant_numbers(28124)))
# 4179871
