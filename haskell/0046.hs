-- Goldbach's Other Conjecture:
-- It was proposed by Christian Goldbach that every odd composite
-- number can be written as the sum of a prime and twice a square.
-- 9 = 7 + 2 * 1 ^ 2
-- 15 = 7 + 2 * 2 ^ 2
-- 21 = 3 + 2 * 3 ^ 2
-- It turns out that the conjecture was false.
-- What is the smallest odd composite that cannot be written as the
-- sum of a prime and twice a square?

import Data.List (sort)
import PrimeUtils (isPrime, primes)
import Utils (removeDups)

oddComposites :: [Integer]
oddComposites =
    oddCompositesAux 9 where
        oddCompositesAux start =
            if not $ isPrime start then start : oddCompositesAux (start + 2)
            else oddCompositesAux (start + 2)

twiceSquares :: [Integer]
twiceSquares =
    twiceSquaresAux 1 where
        twiceSquaresAux num =
            (num ^ 2) * 2 : twiceSquaresAux (num + 1)

sumPrimesWithTwiceSquares :: Integer -> Integer -> [Integer]
sumPrimesWithTwiceSquares limitPr limitTs =
    let pr = takeWhile (< limitPr) $ primes 2
        ts = takeWhile (< limitTs) twiceSquares in
            [a + b | a <- pr, b <- ts, odd (a + b), not $ isPrime (a + b)]

findDifferent :: [Integer] -> [Integer] -> (Integer, Integer)
findDifferent _ [] = (0, 0)
findDifferent [] _ = (0, 0)
findDifferent (h1 : t1) (h2 : t2) =
    if h1 == h2 then findDifferent t1 t2
    else (h1, h2)

result :: Integer
result =
    let oc = takeWhile (< 10000) oddComposites
        pts = removeDups $ sort $ sumPrimesWithTwiceSquares 6000 6000 in
            fst $ findDifferent oc pts

-- :load 0046.hs
-- takeWhile (< 200) oddComposites
-- takeWhile (< 2000) twiceSquares
-- removeDups $ sort $ sumPrimesWithTwiceSquares 200 200
-- removeDups $ sort $ sumPrimesWithTwiceSquares 5000 5000
-- 5777
