import Utils (cartProd5)
import Data.List (sortBy, findIndex)
import Data.Ord (Ordering)
import Data.Maybe (fromJust)

compareFraction :: (Integer, Integer) -> (Integer, Integer) -> Ordering
compareFraction (n1, d1) (n2, d2) =
    let f1 = fromIntegral n1 / fromIntegral d1
        f2 = fromIntegral n2 / fromIntegral d2 in
            if f1 < f2 then LT else
                if f1 > f2 then GT else EQ

getFractions :: Integer -> [(Integer, Integer)]
getFractions limit =
    let fractions = cartProd5 [1..(limit - 1)] [2..limit]
        rFractions = filter (\(n, d) -> gcd n d == 1) fractions in
            sortBy (compareFraction) rFractions

result :: Integer
result =
    let fractions = getFractions 8
        index = fromJust $ findIndex (==(3, 7)) fractions in
            fst $ fractions !! (index - 1)

-- :load 0071.hs
-- cartProd5 [1..7] [2..8]
-- getFractions 8
-- findIndex (==(3, 7)) $ getFractions 8
-- fromJust $ findIndex (==(3, 7)) $ getFractions 8
