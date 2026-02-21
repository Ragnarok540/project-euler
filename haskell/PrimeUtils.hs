module PrimeUtils where

import Utils (squareRoot, primes)

allPrimes :: Integer -> Integer -> [Integer]
allPrimes start end =
    takeWhile (<= end) (primes start)

primeFactors :: Integer -> [Integer]
primeFactors number =
    let pr = takeWhile (< (squareRoot number)) (primes 2) in
        factors pr number where
            factors [] n = if n > 1 then [n] else []
            factors (h : t) n =
                if (mod n h) == 0 then h : factors (h : t) (div n h)
                else factors t n

primeFactors2 :: [Integer] -> Integer -> [Integer]
primeFactors2 [] n = if n > 1 then [n] else []
primeFactors2 (h : t) n =
    if (mod n h) == 0 then h : primeFactors2 (h : t) (div n h)
    else primeFactors2 t n
