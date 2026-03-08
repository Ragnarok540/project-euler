-- Cubic Permutations:
-- The cube, 41063625 (345^3), can be permuted to produce two other
-- cubes: 56623104 (384^3) and 66430125 (405^3). In fact, 41063625
-- is the smallest cube which has exactly three permutations of its
-- digits which are also cube.
-- Find the smallest cube for which exactly five permutations of its
-- digits are cube.

import NumberUtils (isPermutation2)

cubeRoot :: Double -> Double
cubeRoot x = exp $ log x / 3

cubeRootInt :: Integer -> Integer
cubeRootInt x = let x1 = fromIntegral x in
    truncate $ cubeRoot x1

isCube :: Integer -> Bool
isCube x = let x3 = cubeRootInt x in
    x3 ^ 3 == x

getCubes :: Integer -> Integer -> [Integer]
getCubes start end = map (^3) [start..end]

findCube :: [Integer] -> [Integer] -> Int -> Integer
findCube [] _ _ = 0
findCube (h : t) cubes nPerms =
    let n = sum $ map fromEnum $ map (isPermutation2 h) cubes in
        if n == nPerms then h
        else findCube t cubes nPerms

result :: Integer
result =
    let cubes = getCubes 1 10000 in
        findCube cubes cubes 5

-- :load 0062.hs
-- cubeRootInt 41063625
-- isCube 41063625
-- isCube 41063626
-- 127035954683
