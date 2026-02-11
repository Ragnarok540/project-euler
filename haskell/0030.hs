-- Digit Fifth Powers:
-- Surprisingly there are only three numbers that can be written as the
-- sum of fourth powers of their digits:
-- 1634 = 1^4 + 6^4 + 3^4 + 4^4
-- 8208 = 8^4 + 2^4 + 0^4 + 8^4 
-- 9474 = 9^4 + 4^4 + 7^4 + 4^4
-- As 1^4 = 1 is not a sum it is not included.
-- The sum of these numbers is 1634 + 8208 + 9474 = 19316.
-- Find the sum of all the numbers that can be written as the sum of
-- fifth powers of their digits.

import Data.Char (digitToInt)

intToIntList :: Int -> [Int]
intToIntList num = map digitToInt $ show num

findDigitPower :: Int -> [Int]
findDigitPower num =
    let end = num * (9^num)
        range = [2..end] in
            findDigitPowerAux range where
                findDigitPowerAux [] = []
                findDigitPowerAux (h : t) =
                    let s = sum $ map (^num) $ intToIntList h in
                        if s == h then s : findDigitPowerAux t
                        else findDigitPowerAux t

result :: Int
result = sum $ findDigitPower 5

-- :load 0030.hs
-- intToIntList 1634
-- findDigitPower 4
-- 443839
