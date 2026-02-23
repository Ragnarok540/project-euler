-- Prime Permutations:
-- The arithmetic sequence, 1487, 4817, 8147, in which each of the
-- terms increases by 3330, is unusual in two ways: (i) each of the
-- three terms are prime, and, (ii) each of the 4-digit numbers are
-- permutations of one another.
-- There are no arithmetic sequences made up of three 1-, 2-, or
-- 3-digit primes, exhibiting this property, but there is one other
-- 4-digit increasing sequence.
-- What 12-digit number do you form by concatenating the three terms
-- in this sequence?

import Data.List (permutations)
import PrimeUtils (isPrime, allPrimes)
import ListUtils (intToIntList, intListToInt)

isPermutation :: Integer -> Integer -> Bool
isPermutation num1 num2 =
    let perms = map toInteger $ map intListToInt $ permutations $ intToIntList $ fromInteger num1 in
        elem num2 perms 

addToPrimes :: [Integer] -> Integer -> [(Integer, Integer, Integer)]
addToPrimes primes num =
    [(a, a + num, a + num * 2) | a <- primes]

result :: [(Integer, Integer, Integer)]
result =
    let primes = allPrimes 1000 3316
        primesPlus = addToPrimes primes 3330 in
            resultAux primesPlus where
                resultAux [] = []
                resultAux (h : t) =
                    let (a, b, c) = h
                        p1 = isPermutation a b
                        p2 = isPermutation a c
                        ip1 = isPrime a
                        ip2 = isPrime b
                        ip3 = isPrime c in
                            if all (== True) [p1, p2, ip1, ip2, ip3] then h : resultAux t
                            else resultAux t

-- :load 0049.hs
-- allPrimes 1000 3316
-- isPermutation 1234 4321
-- addToPrimes (allPrimes 1000 3316) 3330
-- [(1487,4817,8147),(2969,6299,9629)]
-- 296962999629
