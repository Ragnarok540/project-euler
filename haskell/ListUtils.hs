module ListUtils where

import Data.Char (digitToInt)
import Data.List (permutations, sort)

intToIntList :: Int -> [Int]
intToIntList num = map digitToInt $ show num

intListToInt :: [Int] -> Int
intListToInt ls = read $ concat $ map show ls

palindrome :: Eq a => [a] -> Bool
palindrome ls = ls == reverse ls

getPandigitals :: Integer -> Integer -> [[Integer]]
getPandigitals start end =
    sort $ permutations [start..end]
