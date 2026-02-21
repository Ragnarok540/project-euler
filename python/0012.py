def triangular(num: int) -> int:
    return int(num * (num + 1) / 2)


def divisors(n: int) -> list[int]:
    result = []

    for i in reversed(range(1, n + 1)):
        if n % i == 0:
            result.append(i)

    return result


def find_triangular(target: int) -> int:
    counter = 1

    while True:
        tri = triangular(counter)
        div = divisors(tri)
        le = len(div)

        print(le)

        if le >= target:
            return tri

        counter += 1


if __name__ == "__main__":
    # print('triangular', find_triangular(500))
    # print(divisors(36))
    print([triangular(x) for x in range(1, 11)])
