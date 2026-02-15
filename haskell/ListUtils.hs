module ListUtils where

import Data.Char (digitToInt)

intToIntList :: Int -> [Int]
intToIntList num = map digitToInt $ show num

intListToInt :: [Int] -> Int
intListToInt ls = read $ concat $ map show ls

palindrome :: Eq a => [a] -> Bool
palindrome ls = ls == reverse ls
