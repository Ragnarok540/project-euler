-- Pandigital Products:
-- We shall say that an n-digit number is pandigital if it makes use of
-- all the digits 1 to n exactly once; for example, the 5-digit number,
-- 15234, is 1 through 5 pandigital.
-- The product 7254 is unusual, as the identity, 39 * 186 = 7254,
-- containing multiplicand, multiplier, and product is 1 through 9
-- pandigital.
-- Find the sum of all products whose multiplicand/multiplier/product
-- identity can be written as a  through  pandigital.
-- HINT: Some products can be obtained in more than one way so be sure
-- to only include it once in your sum.

import ListUtils (getPandigitals, slice)
import Utils (intListToInt, removeDups)

pandigitalProducts :: [[Integer]] -> [Integer]
pandigitalProducts [] = []
pandigitalProducts (h : t) =
    let multiplicand = intListToInt $ slice 0 2 h
        multiplier = intListToInt $ slice 2 3 h
        product = intListToInt $ slice 5 4 h in
            if multiplicand * multiplier == product
            then product : pandigitalProducts t
            else pandigitalProducts t

pandigitalProducts2 :: [[Integer]] -> [Integer]
pandigitalProducts2 [] = []
pandigitalProducts2 (h : t) =
    let multiplicand = intListToInt $ slice 0 1 h
        multiplier = intListToInt $ slice 1 4 h
        product = intListToInt $ slice 5 4 h in
            if multiplicand * multiplier == product
            then product : pandigitalProducts2 t
            else pandigitalProducts2 t

result :: Integer
result =
    let pandi = getPandigitals 1 9
        prod1 = pandigitalProducts pandi
        prod2 = pandigitalProducts2 pandi
        prod = removeDups prod1 ++ prod2 in
            sum prod

-- :load 0032.hs
-- getPandigitals 1 3
-- slice 2 3 [1,2,3,4,5,6,7,8,9]
-- pandigitalProducts $ getPandigitals 1 9
-- 45228
