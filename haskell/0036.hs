-- Double-base Palindromes:
-- The decimal number, 585 = 1001001001 (binary), is palindromic in
-- both bases.
-- Find the sum of all numbers, less than one million, which are
-- palindromic in base 10 and base 2.
-- (Please note that the palindromic number, in either base, may not
-- include leading zeros.)

import ListUtils (palindrome)
import NumberUtils (palindromeInt)

toBin :: Integer -> [Integer]
toBin 0 = [0]
toBin n = reverse (toBinAux n) where
    toBinAux 0 = []
    toBinAux n = let (q, r) = divMod n 2 in r : toBinAux q

findPalindromes :: Integer -> Integer -> [Integer]
findPalindromes start limit =
    if start == limit then [] else
    if palindromeInt start then
        if palindrome $ toBin start then
            start : findPalindromes (start + 1) limit
        else findPalindromes (start + 1) limit
    else findPalindromes (start + 1) limit

result :: Integer
result = sum $ findPalindromes 1 1000000

-- :load 0036.hs
-- palindromeInt 585
-- toBin 585
-- palindrome [1,0,0,1,0,0,1,0,0,1]
-- findPalindromes 1 100
-- sum $ findPalindromes 1 1000000
-- 872187
