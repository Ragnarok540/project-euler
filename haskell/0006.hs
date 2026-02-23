-- Sum Square Difference:
-- The sum of the squares of the first ten natural numbers is,
-- 1^2 + 2^2 + ... + 10^2 = 385
-- The square of the sum of the first ten natural numbers is,
-- (1 + 2 + ... + 10)^2 = 55^2 = 3025
-- Hence the difference between the sum of the squares of the
-- first ten natural numbers and the square of the sum
-- is 3025 - 385 = 2640.
-- Find the difference between the sum of the squares of the
-- first one hundred natural numbers and the square of the sum.

import Utils (rangeUp)

sumSquares :: Integer -> Integer
sumSquares num =
    let ran = rangeUp 1 1 num in
        foldl (+) 0 (map (^2) ran)

squareSum :: Integer -> Integer
squareSum num =
    let ran = rangeUp 1 1 num in
        (foldl (+) 0 ran) ^ 2

result :: Integer
result = squareSum 100 - sumSquares 100

-- ghci
-- :load 0006.hs
-- sumSquares 10
-- squareSum 10
-- squareSum 100 - sumSquares 100
-- 25164150
