-- Longest Collatz Sequence:
-- The following iterative sequence is defined for the set of
-- positive integers:
-- n -> n / 2     (n is even)
-- n -> 3 * n + 1 (n is odd)
-- Using the rule above and starting with 13, we generate the
-- following sequence:
-- 13 -> 40 -> 20 -> 10 -> 5 -> 16 -> 8 -> 4 -> 2 -> 1  
-- It can be seen that this sequence (starting at 13 and
-- finishing at 1) contains 10 terms. Although it has not
-- been proved yet (Collatz Problem), it is thought that all
-- starting numbers finish at 1.
-- Which starting number, under one million, produces the
-- longest chain?
-- NOTE: Once the chain starts the terms are allowed to go
-- above one million.

import Utils

collatz :: Integer -> [Integer]
collatz start = start : collatzAux start where
    collatzAux num =
        if num == 1 then [] else
            if even num then
                let next = div num 2 in next : collatzAux (next)
            else
                let next = 3 * num + 1 in next : collatzAux (next)

collectLengths :: [Integer] -> [(Int, Integer)]
collectLengths [] = []
collectLengths (h : t) =
    (length (collatz h), h) : collectLengths t

getMaxLength :: Integer -> Integer
getMaxLength num = snd (maximum (collectLengths (rangeUp 1 1 num)))

result :: Integer
result = getMaxLength 1000000

-- :load 0014.hs
-- collatz 13
-- collectLengths (rangeUp 1 1 13)
-- getMaxLength 1000000
-- 837799
