-- 10001st Prime:
-- By listing the first six prime numbers:
-- 2, 3, 5, 7, 11 and 13, we can see that the 6th prime is 13.
-- What is the 10001st prime number?

import Utils

nthPrime :: Int -> Integer
nthPrime num = last (take num (primes 2))

result :: Integer
result = nthPrime 10001

-- ghci
-- :load 0007.hs
-- nthPrime 6
-- nthPrime 10001
-- 104743
