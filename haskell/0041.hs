-- Pandigital Prime
-- We shall say that an n-digit number is pandigital if it makes use
-- of all the digits 1 to n exactly once. For example, 2143 is a
-- 4-digit pandigital and is also prime.
-- What is the largest n-digit pandigital prime that exists?

import ListUtils (getPandigitals)
import Utils (intListToInt, isPrime)

findPrime :: [Integer] -> Integer
findPrime [] = 0
findPrime (h : t) =
    if isPrime h then h else findPrime t 

result :: Integer
result =
    let pandi = reverse $ getPandigitals 1 7
        pandi2 = map intListToInt pandi in
        findPrime pandi2

-- :load 0041.hs
-- map intListToInt $ take 3 $ reverse $ getPandigitals 1 9
-- 7652413
