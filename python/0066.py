# Diophantine Equation:
# Consider quadratic Diophantine equations of the form:
# x^2 - D * y^2 = 1
# For example, when D = 13, the minimal solution in x is
# 649^2 - 13 * 180 = 1.
# It can be assumed that there are no solutions in positive
# integers when D is square.
# By finding minimal solutions in x for D = {2, 3, 5, 6, 7},
# we obtain the following:
# 3^2 - 2 * 2^2 = 1
# 2^2 - 3 * 1^2 = 1
# 9^2 - 5 * 4^2 = 1
# 5^2 - 6 * 2^2 = 1
# 8^2 - 7 * 3^2 = 1
# Hence, by considering minimal solutions in  for D <= 7, the
# largest x is obtained when  D = 5.
# Find the value of D <= 1000  in minimal solutions of x for
# which the largest value of x is obtained.
# https://en.wikipedia.org/wiki/Pell%27s_equation#Fundamental_solution_via_continued_fractions


from utils import continued_fraction_sqrt


def convergent(n, a0, period, memo):
    if memo.get((n, a0, period)):
        return memo[(n, a0, period)]

    if n == -1:
        return (1, 0)
    if n == 0:
        return (a0, 1)

    a2, b2 = convergent(n - 2, a0, period, memo)
    a1, b1 = convergent(n - 1, a0, period, memo)
    ecf = period[n - 1]

    result = (a1 * ecf + a2, b1 * ecf + b2)
    memo[(n, a0, period)] = result
    return result


def convergent_memo(n, a0, period):
    memo = {}
    return convergent(n, a0, period, memo)


def find_convergent(c):
    a0, period = continued_fraction_sqrt(c)
    period_len = len(period)

    if period_len % 2 == 0:
        n = period_len - 1
    else:
        n = 2 * period_len - 1
        period *= 2

    return convergent_memo(n, a0, period)


if __name__ == "__main__":
    maximum = 0
    maximum_d = 0

    for d in range(1, 1001):
        x, y = find_convergent(d)

        if x > maximum:
            maximum = x
            maximum_d = d

    print(maximum_d)  # 661
