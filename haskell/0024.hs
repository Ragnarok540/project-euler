-- Lexicographic Permutations:
-- A permutation is an ordered arrangement of objects. For example, 3124 is
-- one possible permutation of the digits 1, 2, 3 and 4. If all of the
-- permutations are listed numerically or alphabetically, we call it
-- lexicographic order. The lexicographic permutations of 0, 1 and 2 are:
-- 012   021   102   120   201   210
-- What is the millionth lexicographic permutation of the digits 0, 1, 2, 3,
-- 4, 5, 6, 7, 8 and 9?

import Data.List (permutations, sort)

getNthPerm :: Ord a => [a] -> Int -> [a]
getNthPerm ls nth = (sort $ permutations ls) !! nth

intListToInt :: [Integer] -> Integer
intListToInt ls = read $ concat $ map show ls :: Integer

result :: Integer
result = 
    let nthPerm = getNthPerm [0,1,2,3,4,5,6,7,8,9] 999999 in
        intListToInt nthPerm

-- :load 0024.hs
-- permutations [0,1,2]
-- (sort $ permutations [0,1,2,3,4,5,6,7,8,9]) !! 999999
-- getNthPerm [0,1,2,3,4,5,6,7,8,9] 999999
-- 2783915460
