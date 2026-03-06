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

from math import isqrt


def continued_fraction_sqrt(c: int) -> tuple[int, tuple[int, ...]]:
    """
    Compute the continued fraction of sqrt(c) using integer arithmetic.
    Returns [a0, (a1, a2, ..., am)] where the second element is the
    periodic part. For perfect squares, the period is empty.
    """
    a0 = isqrt(c)

    # Perfect square: return period empty
    if a0 * a0 == c:
        return (a0, ())

    m, d, a = 0, 1, a0
    period = []
    seen = set()

    while True:
        m_next = d * a - m
        d_next = (c - m_next * m_next) // d
        a_next = (a0 + m_next) // d_next

        if (m_next, d_next, a_next) in seen:
            break

        seen.add((m_next, d_next, a_next))
        period.append(a_next)
        m, d, a = m_next, d_next, a_next

    return (a0, tuple(period))


if __name__ == "__main__":
    counter = 0

    for n in range(1, 10001):
        _, continued_fraction = continued_fraction_sqrt(n)
        periodd = len(continued_fraction)

        if periodd % 2 != 0:
            counter += 1

    print(counter)  # 1322
