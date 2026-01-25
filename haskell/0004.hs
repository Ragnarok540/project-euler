-- Largest Palindrome Product:
-- A palindromic number reads the same both ways.
-- The largest palindrome made from the product
-- of two 2-digit numbers is 9009 = 91 * 99.
-- Find the largest palindrome made from the
-- product of two 3-digit numbers.

import Utils

palindromeInt :: Integer -> Bool
palindromeInt num =
    let intStr = show num in
        intStr == reverse intStr

pairsThreeDigits :: [(Integer, Integer)]
pairsThreeDigits = 
    let ran = rangeDown 1 999 100 in
        cartProd2 ran ran

palinds :: [(Integer, Integer)] -> [Integer]
palinds [] = []
palinds (h : t) =
    let c = fst h * snd h in
        if palindromeInt c then c : palinds t else palinds t

result :: Integer
result = maximum (palinds pairsThreeDigits)

-- :load 0004.hs
-- palindromeInt 9009
-- palindromeInt 9008
-- palinds pairsThreeDigits
-- maximum (palinds pairsThreeDigits)
-- 906609
