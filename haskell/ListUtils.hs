module ListUtils where

import Data.Char (digitToInt)
import Data.List (permutations, sort)

intToIntList :: Int -> [Int]
intToIntList num = map digitToInt $ show num

intListToInt :: [Int] -> Int
intListToInt ls = read $ concat $ map show ls

ownHead :: Num a => [a] -> a
ownHead (h : _) = h

ownTail :: [a] -> [a]
ownTail (_ : t) = t

palindrome :: Eq a => [a] -> Bool
palindrome ls = ls == reverse ls

getPandigitals :: Integral a => a -> a -> [[a]]
getPandigitals start end =
    sort $ permutations [start..end]

slice :: Int -> Int -> [a] -> [a]
slice start len ls =
    take len $ drop start ls
