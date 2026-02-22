-- Circular Primes:
-- The number, 197, is called a circular prime because all rotations
-- of the digits: 197, 971, and 719, are themselves prime.
-- There are thirteen such primes below : 100: 2, 3, 5, 7, 11, 13,
-- 17, 31, 37, 71, 73, 79 and 97.
-- How many circular primes are there below one million?

import PrimeUtils (isPrime, primes)
import ListUtils (intToIntList, intListToInt)

rotate :: Int -> [a] -> [a]
rotate = drop <> take

rotations :: Int -> [Int]
rotations num =
    let ls = intToIntList num in
        rotationsAux ls 1 where
            rotationsAux list n =
                if n == length list then [intListToInt list] else
                    intListToInt (rotate n list) : rotationsAux list (n + 1) 

findCircularPrimes :: Integer -> [Int]
findCircularPrimes limit =
    let prs = takeWhile (< limit) $ primes 2
        prs2 = map fromInteger prs in
        findCircularPrimesAux prs2 where
            findCircularPrimesAux [] = []
            findCircularPrimesAux (h : t) =
                let prsRots = rotations h in
                    if all isPrime $ map toInteger prsRots then
                        h : findCircularPrimesAux t
                    else findCircularPrimesAux t

result :: Int
result = length $ findCircularPrimes 1000000

-- :load 0035.hs
-- rotate 1 [1,9,7]
-- intToIntList 197
-- intListToInt [1,9,7]
-- rotations 197
-- findCircularPrimes 1000000
-- 55
