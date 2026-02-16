-- Champernowne's Constant:
-- An irrational decimal fraction is created by concatenating the
-- positive integers:
-- 0.123456789101112131415161718192021...
-- It can be seen that the 12th digit of the fractional part is 1.
-- If d_n represents the nth digit of the fractional part, find
-- the value of the following expression:
-- d_1 * d_10 * d_100 * d_1000 * d_10000 * d_100000 * d_1000000

import ListUtils (intToIntList)

champernowne :: Int -> [Int]
champernowne start =
    let ls = intToIntList start in
        ls ++ champernowne (start + 1)

result :: Int
result =
    let champ = take 1000000 $ champernowne 1 in
        champ !! 0 * champ !! 9 * champ !! 99 * champ !! 999 * champ !! 9999 * champ !! 99999 * champ !! 999999

-- :load 0040.hs
-- take 12 $ champernowne 1
-- 210
