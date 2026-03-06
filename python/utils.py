from math import isqrt


def continued_fraction_sqrt(c: int) -> tuple[int, tuple[int]]:
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
