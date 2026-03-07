-- Totient Maximum:
-- Euler's totient function, phi(n) [sometimes called the phi
-- function], is defined as the number of positive integers not
-- exceeding n which are relatively prime to n. For example, as
-- 1, 2, 4, 5, 7, and 8, are all less than or equal to nine and
-- relatively prime to nine, phi(9) = 6.
-- n   Relatively Prime phi(n) n/phi(n)
-- 2   1                1      2
-- 3   1,2              2      1.5
-- 4   1,3              2      2
-- 5   1,2,3,4          4      1.25
-- 6   1,5              2      3
-- 7   1,2,3,4,5,6      6      1.1666...
-- 8   1,3,5,7          4      2
-- 9   1,2,4,5,7,8      6      1.5
-- 10  1,3,7,9          4      2.5
-- It can be seen that n = 6 produces a maximum n/phi(n) for n <= 10.
-- Find the value of n <= 1000000 for which n/phi(n) is a maximum.

import PrimeUtils (factors)

coprime :: Integer -> Integer -> Bool
coprime n m = gcd n m == 1

phi :: Integer -> Integer
phi m = phiAux m 1 where
    phiAux n r =
        if r == m then 0
        else if coprime n r then
            1 + phiAux m (r + 1)
        else
            phiAux m (r + 1)

collectRatio :: (Ord a, Fractional a) => [Integer] -> [(a, Integer)]
collectRatio [] = []
collectRatio (h : t) =
    (fromIntegral h / fromIntegral (phi h), h) : collectRatio t

getMaxRatio :: Integer -> Integer
getMaxRatio num = snd $ maximum $ collectRatio [2..num]

result :: Integer
result = getMaxRatio 1000000

-- :load 0069.hs
-- collectRatio [2..10]
-- 
