module NumberUtils where

import Data.List (permutations, sort)
import ListUtils (intToIntList, intListToInt)
import Utils (removeDups)

getLength :: Integer -> Int
getLength num = length $ show num

getPermutations :: Integer -> [Integer]
getPermutations num =
    let len = getLength num
        perms = removeDups $ map toInteger $ map intListToInt $ permutations $ intToIntList $ fromInteger num in
            [x | x <- perms, getLength x == len]

isPermutation :: Integer -> Integer -> Bool
isPermutation num1 num2 = elem num2 $ getPermutations num1

isPermutation2 :: Integer -> Integer -> Bool
isPermutation2 num1 num2 =
    let lNum1 = sort $ intToIntList $ fromInteger num1
        lNum2 = sort $ intToIntList $ fromInteger num2 in
            lNum1 == lNum2

palindromeInt :: Integer -> Bool
palindromeInt num =
    let intStr = show num in
        intStr == reverse intStr

reverseNum :: Integer -> Integer
reverseNum num = read $ reverse $ show num :: Integer
