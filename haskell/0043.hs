-- Sub-string Divisibility:
-- The number, 1406357289, is a 0 to 9 pandigital number because it is
-- made up of each of the digits 0 to 9 in some order, but it also has
-- a rather interesting sub-string divisibility property.
-- Let d_1 be the 1st digit, d_2 be the 2nd digit, and so on. In this
-- way, we note the following:
-- d_2 d_3 d_4 = 406 is divisible by 2
-- d_3 d_4 d_5 = 063 is divisible by 3
-- d_4 d_5 d_6 = 635 is divisible by 5
-- d_5 d_6 d_7 = 357 is divisible by 7
-- d_6 d_7 d_8 = 572 is divisible by 11
-- d_7 d_8 d_9 = 728 is divisible by 13
-- d_8 d_9 d_10 = 289 is divisible by 17
-- Find the sum of all 0 to 9 pandigital numbers with this property.

import ListUtils (intListToInt, getPandigitals, slice)
import PrimeUtils (primes)

myPrimes :: [Integer]
myPrimes = take 7 $ primes 2

getSubStr :: [Int] -> [[Int]]
getSubStr str =
    getSubStrAux str 1 where
        getSubStrAux _ 8 = []
        getSubStrAux s start =
            slice start 3 s : getSubStrAux s (start + 1)

findPandigitals :: [[Int]]
findPandigitals =
    let pandi = getPandigitals 0 9 in
    findPandigitalsAux pandi where
        findPandigitalsAux [] = []
        findPandigitalsAux (h : t) =
            let subStr = getSubStr h
                subStr2 = map intListToInt subStr
                rems = zipWith (rem) subStr2 (map fromInteger myPrimes) in
                    if all (== 0) rems then
                        h : findPandigitalsAux t
                    else findPandigitalsAux t

result :: Int
result = resultAux findPandigitals where
    resultAux [] = 0
    resultAux (h : t) =
        intListToInt h + resultAux t

-- :load 0043.hs
-- getSubStr [1,4,0,6,3,5,7,2,8,9]
-- map intListToInt [[4,0,6],[0,6,3],[6,3,5],[3,5,7],[5,7,2],[7,2,8],[2,8,9]]
-- zipWith (rem) (map intListToInt [[4,0,6],[0,6,3],[6,3,5],[3,5,7],[5,7,2],[7,2,8],[2,8,9]]) (map fromInteger myPrimes)
-- all (== 0) [0,0,0,0]
-- 16695334890
