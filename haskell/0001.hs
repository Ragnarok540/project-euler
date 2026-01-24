-- Multiples of 3 or 5:
-- If we list all the natural numbers below 10 that
-- are multiples of 3 or 5, we get 3, 5, 6 and 9.
-- The sum of these multiples is 23.
-- Find the sum of all the multiples of 3 or 5 below 1000.

divByThreeOrFive :: Integer -> Bool
divByThreeOrFive n = (mod n 3) == 0 || (mod n 5) == 0

sequ :: (Integer -> Bool) -> Integer -> [Integer]
sequ func start =
    if func start then start : (sequ func (start + 1)) else sequ func (start + 1)

result :: Integer
result = foldl (+) 0 (takeWhile (< 1000) (sequ divByThreeOrFive 0))

-- ghci
-- :load 0001.hs
-- divByThreeOrFive 3
-- divByThreeOrFive 4
-- divByThreeOrFive 5
-- takeWhile (< 1000) (sequ divByThreeOrFive 0)
-- foldl (+) 0 (takeWhile (< 1000) (sequ divByThreeOrFive 0))
-- 233168
