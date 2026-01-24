-- Largest Prime Factor:
-- The prime factors of 13195 are 5, 7, 13 and 29.
-- What is the largest prime factor of the number 600851475143?

import Utils

primeFactors :: Integer -> [Integer]
primeFactors number =
    let pr = takeWhile (< (squareRoot number)) (primes 2) in
        factors pr number where
            factors [] n = if n > 1 then [n] else []
            factors (h : t) n =
                if (mod n h) == 0 then h : factors (h : t) (div n h)
                else factors t n

result :: Integer
result = last (primeFactors 600851475143)

-- :load 0003.hs
-- primeFactors 150
-- primeFactors 151
-- primeFactors 152
-- last (primeFactors 600851475143)
-- 6857
