-- Smallest Multiple:
-- 2520 is the smallest number that can be divided by each of the numbers
-- from 1 to 10 without any remainder.
-- What is the smallest positive number that is evenly divisible by all
-- of the numbers from 1 to 20?

import Utils

evenlyDiv :: Integer -> Integer -> Bool
evenlyDiv div num =
    if div == 0 then True else
        if (mod num div) == 0 then evenlyDiv (div - 1) num else False

result :: Integer
result = ownHead (take 1 (sequ (evenlyDiv 20) 1))

-- ghci
-- :load 0005.hs
-- evenlyDiv 2520 10
-- ownHead (take 1 (sequ (evenlyDiv 10) 1))
-- ownHead (take 1 (sequ (evenlyDiv 20) 1))
-- 232792560
