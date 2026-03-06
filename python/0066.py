# https://en.wikipedia.org/wiki/Pell%27s_equation#Fundamental_solution_via_continued_fractions


def convergent(n, continued_fraction):
    if n == -1:
        return (1, 0)
    if n == 0:
        a0, _ = continued_fraction
        return (a0, 1)

    a2, b2 = convergent(n - 2, continued_fraction)
    a1, b1 = convergent(n - 1, continued_fraction)
    _, period = continued_fraction
    ecf = period[n - 1]

    return (a1 * ecf + a2, b1 * ecf + b2)


print(convergent(3, (2, [1, 1, 1, 3,])))  # 7 (period - 1)
print(convergent(9, (3, [1, 1, 1, 1, 6, 1, 1, 1, 1, 6])))  # 13 (2 * period - 1)
