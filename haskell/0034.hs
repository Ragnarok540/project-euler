-- Digit Factorials:
-- 145 is a curious number, as 1! + 4! + 5! = 1 + 24 + 120 = 145.
-- Find the sum of all numbers which are equal to the sum of the
-- factorial of their digits.
-- Note: As 1! = 1 and 2! = 2 are not sums they are not included.

import Data.Char (digitToInt)
import Utils (factorial)

intToIntList :: Int -> [Int]
intToIntList num = map digitToInt $ show num

findCurious :: [Integer]
findCurious =
    findCuriousAux 10 where
        findCuriousAux start =
            let st = toInteger start
                ls = intToIntList start
                fact = map (factorial . toInteger) ls
                s = sum fact in
                    if length ls == 8 then [] else
                    if s == st then s : findCuriousAux (start + 1)
                    else findCuriousAux (start + 1)

result :: Integer
result = sum findCurious

-- :load 0034.hs
-- 40730
