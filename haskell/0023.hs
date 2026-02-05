-- Non-Abundant Sums:
-- A perfect number is a number for which the sum of its proper divisors
-- is exactly equal to the number. For example, the sum of the proper
-- divisors of 28 would be 1 + 2 + 4 + 7 + 14 = 28, which means that 28
-- is a perfect number.
-- A number n is called deficient if the sum of its proper divisors is
-- less than n and it is called abundant if this sum exceeds n.
-- As 12 is the smallest abundant number, 1 + 2 + 3 + 4 + 6 = 16, the
-- smallest number that can be written as the sum of two abundant numbers
-- is 24. By mathematical analysis, it can be shown that all integers
-- greater than 28123 can be written as the sum of two abundant numbers.
-- However, this upper limit cannot be reduced any further by analysis even
-- though it is known that the greatest number that cannot be expressed as
-- the sum of two abundant numbers is less than this limit.
-- Find the sum of all the positive integers which cannot be written as
-- the sum of two abundant numbers.

import Utils
import Data.List (sort)

data NumberType = Perfect | Deficient | Abundant deriving (Show, Eq)

numType :: Integer -> NumberType
numType num =
    let sumDiv = properDivisorsSum num in
        if sumDiv == num then Perfect else
        if sumDiv < num then Deficient else
            Abundant

findAbundant ::  Integer -> Integer -> [Integer]
findAbundant num limit =
    if num >= limit then [] else
    let t = numType num in
        if t == Abundant then num : findAbundant (num + 1) limit
        else findAbundant (num + 1) limit

abundantPairs :: Integer -> [(Integer, Integer)]
abundantPairs limit = 
    let fa = findAbundant 1 limit in
        cartProd4 fa fa

sumPairs :: [(Integer, Integer)] -> [(Integer)]
sumPairs [] = []
sumPairs (h : t) =
    let (a, b) = h in
        a + b : sumPairs t

sumNonAbundant :: Integer -> Integer
sumNonAbundant limit =
    let abundants = filter (< limit) $ sort $ removeDups $ sumPairs $ abundantPairs limit in
        sumNonAbundantAux 1 limit abundants where
            sumNonAbundantAux num limit ab =
                if num >= limit then 0 else
                if (elem num ab) then sumNonAbundantAux (num + 1) limit ab
                else num + sumNonAbundantAux (num + 1) limit ab


result :: Integer
result = sumNonAbundant 3000

-- :load 0023.hs
-- properDivisorsSum 28
-- numType 6
-- numType 28
-- findAbundant 1 100
-- findAbundant 1 28123
-- abundantPairs 100
-- removeDups $ sumPairs $ abundantPairs 100
