module SeqUtils where

import Utils (rangeUp)

triangular :: Integer -> Integer
triangular num = sum (rangeUp 1 1 num)

triangular2 :: Integer -> Integer
triangular2 num = (div (num * (num + 1)) 2)

triangulars :: [Integer]
triangulars = triangularsAux 1 where
    triangularsAux start = triangular2 start : triangularsAux (start + 1)

