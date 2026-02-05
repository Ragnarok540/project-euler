-- Amicable Numbers:
-- Let d(n) be defined as the sum of proper divisors of n (numbers less
-- than n which divide evenly into n).
-- If d(a) = b and d(b) = a, where a != b, then a and b are an amicable
-- pair and each of a and b are called amicable numbers.
-- For example, the proper divisors of 220 are 1, 2, 4, 5, 10, 11, 20,
-- 22, 44, 55, and 110; therefore d(220) = 284. The proper divisors
-- of 284 are 1, 2, 4, 71 and 142; so d(284) = 220.
-- Evaluate the sum of all the amicable numbers under 10000.

import Utils

findAmicable :: Integer -> Integer -> [(Integer, Integer)]
findAmicable num limit =
    if num >= limit then [] else
    let b = properDivisorsSum num
        a = properDivisorsSum b in
            if num == a && a /= b then (a, b) : findAmicable (b + 1) limit
            else findAmicable (num + 1) limit

sumTuples :: [(Integer, Integer)] -> Integer
sumTuples [] = 0
sumTuples (h : t) =
    let (a, b) = h in
        a + b + sumTuples t

result :: Integer
result = sumTuples (findAmicable 2 10000)

-- :load 0021.hs
-- properDivisors 220
-- findAmicable 2 1300
-- findAmicable 2 10000
-- sumTuples (findAmicable 2 10000)
-- 31626
