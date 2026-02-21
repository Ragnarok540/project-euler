-- Largest Prime Factor:
-- The prime factors of 13195 are 5, 7, 13 and 29.
-- What is the largest prime factor of the number 600851475143?

import PrimeUtils

result :: Integer
result = last (primeFactors 600851475143)

-- :load 0003.hs
-- primeFactors 150
-- primeFactors 151
-- primeFactors 152
-- last (primeFactors 600851475143)
-- 6857
