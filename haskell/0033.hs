-- Digit Cancelling Fractions:
-- The fraction 49/98 is a curious fraction, as an inexperienced
-- mathematician in attempting to simplify it may incorrectly believe
-- that 49/98 = 4/8, which is correct, is obtained by cancelling the 9s.
-- We shall consider fractions like, 30/50 = 3/5, to be trivial examples.
-- There are exactly four non-trivial examples of this type of fraction,
-- less than one in value, and containing two digits in the numerator
-- and denominator.
-- If the product of these four fractions is given in its lowest common
-- terms, find the value of the denominator.

import Utils (cartProd5)

ones :: Integer -> Integer
ones num = mod num 10

tens :: Integer -> Integer
tens num = mod (div num 10) 10

testFraction :: (Integer, Integer) -> Bool
testFraction (x, y) =
    let x1 = tens x
        x2 = ones x
        y1 = tens y
        y2 = ones y in
            x1 == y1 || x1 == y2 || x2 == y1 || x2 == y2

naiveSimplify :: (Integer, Integer) -> Bool
naiveSimplify (x, y) =
    let d = fromIntegral x / fromIntegral y
        x1 = tens x
        x2 = ones x
        y1 = tens y
        y2 = ones y in
            if x1 == y1 then fromIntegral x2 / fromIntegral y2 == d else
            if x1 == y2 then fromIntegral x2 / fromIntegral y1 == d else
            if x2 == y1 then fromIntegral x1 / fromIntegral y2 == d else
            if x2 == y2 then fromIntegral x1 / fromIntegral y1 == d else False

generateFractions :: [(Integer, Integer)]
generateFractions =
    let numerators = [10..98]
        denominators = [11..99]
        fractions = cartProd5 numerators denominators
        fr1 = filter (\(x, y) -> (mod x 10) /= 0) fractions
        fr2 = filter (\(x, y) -> (mod y 10) /= 0) fr1
        fr3 = filter testFraction fr2
        fr4 = filter naiveSimplify fr3 in
            fr4

multiplyFractions :: [(Integer, Integer)] -> (Integer, Integer)
multiplyFractions fractions =
    multiplyFractionsAux fractions (1, 1) where
        multiplyFractionsAux [] (x, y) = (x, y)
        multiplyFractionsAux (h : t) (x, y) =
            let (x1, y1) = h in
                multiplyFractionsAux t (x1 * x, y1 * y)

simplifyFraction :: (Integer, Integer) -> (Integer, Integer)
simplifyFraction (x, y) =
    let g = gcd x y in
        if g == 1 then (x, y)
        else simplifyFraction (div x g, div y g)

result :: Integer
result =
    let fractions = generateFractions
        mult = multiplyFractions fractions in
            snd $ simplifyFraction mult

-- :load 0033.hs
-- multiplyFractions [(16,64),(19,95),(26,65),(49,98)] (1, 1)
-- snd $ simplifyFraction (387296, 38729600)
-- 100
