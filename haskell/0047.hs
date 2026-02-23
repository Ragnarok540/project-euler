-- Distinct Primes Factors:
-- The first two consecutive numbers to have two distinct prime
-- factors are:
-- 14 = 2 * 7
-- 15 = 3 * 5
-- The first three consecutive numbers to have three distinct prime
-- factors are:
-- 644 = 2^2 * 7 * 23
-- 645 = 3 * 5 * 43
-- 646 = 2 * 17 * 19
-- Find the first four consecutive integers to have four distinct
-- prime factors each. What is the first of these numbers?

import ListUtils (slice, ownHead)
import PrimeUtils (allPrimes, primeFactors2)
import Utils (removeDups)

factors :: [[Integer]]
factors =
    let primes = allPrimes 2 1000 in
        factorsAux primes 2 where
            factorsAux pr start =
                primeFactors2 pr start : factorsAux pr (start + 1)

factorWindow :: Int -> Int -> [[Integer]] -> [[[Integer]]]
factorWindow start size facts =
    slice start size facts : factorWindow (start + 1) size facts

processWindows :: [[[Integer]]] -> Integer
processWindows [[[]]] = 0
processWindows (h : t) =
    let len = length h
        h2 = map removeDups $ h
        h3 = map length h2 in
            if all (== len) h3 then foldl (*) 1 (h !! 0)
            else processWindows t

result :: Integer
result = processWindows $ take 199996 $ factorWindow 0 4 (take 200000 factors)

-- :load 0047.hs
-- take 20 factors
-- take 18 $ factorWindow 0 2 (take 20 factors)
-- take 16 $ factorWindow 0 4 (take 20 factors)
-- processWindows $ take 18 $ factorWindow 0 2 (take 20 factors)
-- processWindows $ take 997 $ factorWindow 0 3 (take 1000 factors)
-- processWindows $ take 199996 $ factorWindow 0 4 (take 200000 factors)
-- 134043
