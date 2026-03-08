-- Permuted Multiples:
-- It can be seen that the number, 125874, and its double, 251748,
-- contain exactly the same digits, but in a different order.
-- Find the smallest positive integer, x, such that 2 * x,  3 * x,
-- 4 * x, 5 * x, and 6 * x, contain the same digits.

import NumberUtils (isPermutation2)

findX :: Integer -> Integer
findX start =
    let x2 = start * 2
        x3 = start * 3
        x4 = start * 4
        x5 = start * 5
        x6 = start * 6
        p2 = isPermutation2 start x2
        p3 = isPermutation2 start x3
        p4 = isPermutation2 start x4
        p5 = isPermutation2 start x5
        p6 = isPermutation2 start x6 in
            if all (== True) [p2, p3, p4, p5, p6] then start
            else findX (start + 1)

result :: Integer
result = findX 1

-- :load 0052.hs
-- isPermutation 125874 251748
-- 142857
