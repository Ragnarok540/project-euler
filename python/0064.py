# Odd Period Square Roots:
# All square roots are periodic when written as continued fractions...
# The first ten continued fraction representations of (irrational)
# square roots are:
# sqrt(2) = (2,) period = 1
# sqrt(3) = (1, 2) period = 2
# sqrt(5) = (4,) period = 1
# sqrt(6) = (2, 4) period = 2
# sqrt(7) = (1, 1, 1, 4) period = 4
# sqrt(8) = (1, 4) period = 2
# sqrt(10) = (6,) period = 1
# sqrt(11) = (3, 6) period = 2
# sqrt(12) = (2, 6) period = 2
# sqrt(13) = (1, 1, 1, 1, 6) period = 5
# Exactly four continued fractions, for  N <=, have an odd period.
# How many continued fractions for N <= 10000  have an odd period?
# https://en.wikipedia.org/wiki/Integer_square_root


from utils import continued_fraction_sqrt

if __name__ == "__main__":
    counter = 0

    for n in range(1, 10001):
        _, period = continued_fraction_sqrt(n)
        period_len = len(period)

        if period_len % 2 != 0:
            counter += 1

    print(counter)  # 1322
