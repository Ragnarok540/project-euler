-- Truncatable Primes:
-- The number 3797 has an interesting property. Being prime itself,
-- it is possible to continuously remove digits from left to right,
-- and remain prime at each stage: 3797, 797, 97, and 7. Similarly
-- we can work from right to left: 3797, 379, 37, and 3.
-- Find the sum of the only eleven primes that are both truncatable
-- from left to right and right to left.
-- NOTE: 2, 3, 4, and 7 are not considered to be truncatable primes.

import PrimeUtils (isPrime)
import ListUtils (intToIntList, intListToInt)

truncateLeft :: Integer -> [Integer]
truncateLeft num =
    reverse $ truncateAux num 10 where
        truncateAux n digit =
            let d = mod n digit in
                if d == n then [d] else
                    d : truncateAux n (digit * 10)

reverseNum :: Integer -> Integer
reverseNum num =
    let ls = reverse $ intToIntList $ fromIntegral num in
        toInteger $ intListToInt ls

truncateRight :: Integer -> [Integer]
truncateRight num =
    let rev = reverseNum num in
        map reverseNum $ truncateLeft rev

findTruncatablePrimes :: Integer -> [Integer]
findTruncatablePrimes start =
    if notElem '0' $ show start then
        if isPrime start then
            let pieces = (truncateLeft start) ++ (truncateRight start) in
                if all isPrime pieces then
                    start : findTruncatablePrimes (start + 1)
                else findTruncatablePrimes (start + 1)
        else findTruncatablePrimes (start + 1)
    else findTruncatablePrimes (start + 1)

result :: Integer
result = sum $ take 11 $ findTruncatablePrimes 11

-- :load 0037.hs
-- truncateLeft 3797
-- reverseNum 3797
-- truncateRight 3797
-- take 11 $ findTruncatablePrimes 11
-- 748317
