-- Summation of Primes
-- The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
-- Find the sum of all the primes below two million.

import Utils

sumPrimes :: Integer -> Integer
sumPrimes num = foldl (+) 0 (takeWhile (< num) (primes 2))

result :: Integer
result = sumPrimes 2000000

-- :load 0010.hs
-- sumPrimes 10
-- sumPrimes 2000000
-- 142913828922
