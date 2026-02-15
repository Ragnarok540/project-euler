-- Pandigital Multiples:
-- Take the number 192 and multiply it by each of 1, 2, and 3:
-- 192 * 1 = 192, 192 * 2 = 238, 192 * 3 = 576.
-- By concatenating each product we get the 1 to 9 pandigital, 192384576.
-- We will call 192384576 the concatenated product of 192 and [1, 2, 3].
-- The same can be achieved by starting with 9 and multiplying by 1, 2, 3,
-- 4, and 5, giving the pandigital, 918273645, which is the concatenated
-- product of 9 and [1, 2, 3, 4, 5].
-- What is the largest 1 to 9 pandigital 9-digit number that can be formed
-- as the concatenated product of an integer with [1, 2, ..., n] where n > 1?

import Utils (removeDups)
import ListUtils (intToIntList)

concatenatedProduct :: Int -> [Int] -> Int
concatenatedProduct num ls =
    read $ concat $ map show $ map (* num) ls :: Int

is19Pandigital :: Int -> Bool
is19Pandigital num =
    let observed = sum $ removeDups $ intToIntList num in
        observed == 45

findPandigital :: Int -> Int
findPandigital start =
    let con = concatenatedProduct start [1, 2] in
        if is19Pandigital con then con else findPandigital (start - 1)

result :: Int
result = findPandigital 9876

-- :load 0038.hs
-- concatenatedProduct 192 [1,2,3]
-- concatenatedProduct 9 [1,2,3,4,5]
-- is19Pandigital 918273645
-- findPandigital 9876
-- 932718654
