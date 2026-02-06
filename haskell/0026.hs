-- Reciprocal Cycles:
-- A unit fraction contains 1 in the numerator. The decimal representation
-- of the unit fractions with denominators 2 to 10 are given:
-- 0.5, 0.(3), 0.25, 0.2, 0.1(6), 0.(142857), 0.125, 0.(1)
-- Where 0.1(6) means 0.1666666..., and has a 1-digit recurring cycle.
-- It can be seen that 1/7 has a 6-digit recurring cycle.
-- Find the value of d < 1000 for which 1/d contains the longest
-- recurring cycle in its decimal fraction part.

import Utils

unitFrac :: (Fractional a) => a -> a
unitFrac x = 1 / x

longDivision :: Integer -> Integer -> [Integer]
longDivision dividend divisor =
    if dividend < divisor then longDivision (dividend * 10) divisor else
        let d = div dividend divisor
            r = rem dividend divisor in
                if r == 0 then [d] else
                    d : longDivision r divisor

longDivision2 :: Integer -> Integer -> [Integer]
longDivision2 dividend divisor =
    longDivisionAux dividend divisor [] where
        longDivisionAux dividend divisor pastDividends =
            if elem dividend pastDividends then [] else
            if dividend < divisor then longDivisionAux (dividend * 10) divisor pastDividends else
                let d = div dividend divisor
                    r = rem dividend divisor in
                        if r == 0 then [d] else
                            d : longDivisionAux r divisor (dividend : pastDividends)

maxIndex :: [Int] -> Int
maxIndex xs = ownHead $ filter ((== maximum xs) . (xs !!)) [0..]

result :: Int
result =
    let divs = map length $ map (longDivision2 1) [1..1000] in
        1 + maxIndex divs

-- :load 0026.hs
-- unitFrac 2
-- longDivision2 1 3
-- longDivision2 1 6
-- longDivision2 1 7
-- map length $ map (longDivision2 1) [1..1000]
-- 983
