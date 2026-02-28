-- Square Root Convergents:
-- It is possible to show that the square root of two can be expressed
-- as an infinite continued fraction.
-- By expanding this for the first four iterations, we get:
-- 3/2 = 1.5
-- 7/5 = 1.4
-- 17/12 = 1.41666...
-- 41/29 = 1.41379...
-- The next three expansions are 99/70, 239/169, and 577/408, but the
-- eighth expansion, 1393/985, is the first example where the number
-- of digits in the numerator exceeds the number of digits in the
-- denominator.
-- In the first one-thousand expansions, how many fractions contain a
-- numerator with more digits than the denominator?

squareRootFraction :: (Integer, Integer) -> [(Integer, Integer)]
squareRootFraction (a, b) = (a, b) : squareRootFraction (a + 2 * b, a + b)

numOverDem :: (Integer, Integer) -> Bool
numOverDem (n, d) =
    let ln = length $ show n
        ld = length $ show d in
            ln > ld

result :: Int
result = sum $ map fromEnum $ map numOverDem $ take 1000 $ squareRootFraction (3, 2)

-- :load 0057.hs
-- take 10 $ squareRootFraction (3, 2)
-- 153
