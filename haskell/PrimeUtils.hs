module PrimeUtils where

import Utils (squareRoot)

isPrime :: Integer -> Bool
isPrime n = if n < 2 then False else (abs n) > 1 && isNotDivisor 2 where
    isNotDivisor d = d * d > (abs n) || ((mod (abs n) d) /= 0 && isNotDivisor (d + 1)) 

primes :: Integer -> [Integer]
primes start =
    if isPrime start then start : (primes (start + 1)) else primes (start + 1)

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
