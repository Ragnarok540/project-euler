# Counting Summations:
# It is possible to write five as a sum in exactly six different ways:
# 4 + 1
# 3 + 2
# 3 + 1 + 1
# 2 + 2 + 1
# 2 + 1 + 1 + 1
# 1 + 1 + 1 + 1 + 1
# How many different ways can one hundred be written as a sum of at
# least two positive integers?
# https://en.wikipedia.org/wiki/Partition_function_(number_theory)#Recurrence_relations

def z():
    counter = 1

    while True:
        yield counter
        yield - counter
        counter += 1


def pentagonal(k):
    return int(k * (3 * k - 1) / 2)


def partition(n, memo):
    if memo.get(n):
        return memo[n]
    if n < 0:
        return 0
    if n == 0:
        return 1

    result = 0
    z_gen = z()

    while True:
        k = next(z_gen)
        step = n - pentagonal(k)

        if step < 0:
            break

        result += (- 1)**(k + 1) * partition(step, memo)

    memo[n] = int(result)
    return int(result)


def partition_memo(n):
    memo = {}
    return partition(n, memo)


if __name__ == "__main__":
    partitions = partition_memo(100)
    print(partitions - 1)
    # 190569291
