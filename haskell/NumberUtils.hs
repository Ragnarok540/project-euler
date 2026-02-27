module NumberUtils where

import Data.List (permutations)
import ListUtils (intToIntList, intListToInt)

isPermutation :: Integer -> Integer -> Bool
isPermutation num1 num2 =
    let perms = map toInteger $ map intListToInt $ permutations $ intToIntList $ fromInteger num1 in
        elem num2 perms

palindromeInt :: Integer -> Bool
palindromeInt num =
    let intStr = show num in
        intStr == reverse intStr

reverseNum :: Integer -> Integer
reverseNum num = read $ reverse $ show num :: Integer
