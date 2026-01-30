-- Lattice Paths:
-- Starting in the top left corner of a 2 * 2 grid, and only being
-- able to move to the right and down, there are exactly 6 routes
-- to the bottom right corner.
-- How many such routes are there through a 20 * 20 grid?

-- import 

factorial :: Integer -> Integer
factorial num = foldl (*) 1 [1..num]

choose :: Integer -> Integer -> Integer
choose n k = div (factorial n) ((factorial k) * factorial (n - k))

latticePaths :: (Integer, Integer) -> Integer
latticePaths (n, k) = choose (n + k) n

result :: Integer
result = latticePaths (20, 20)

-- :load 0015.hs
-- factorial 5
-- choose 4 2
-- latticePaths (2, 2)
-- latticePaths (2, 3)
-- latticePaths (20, 20)
-- 137846528820
