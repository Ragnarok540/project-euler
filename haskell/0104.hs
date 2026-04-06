-- Pandigital Fibonacci Ends:
-- The Fibonacci sequence is defined by the recurrence relation:
-- F_n = F_(n-1) + F_(n-2), where F_1 = 1 and F_2 = 1.
-- It turns out that F_541, which contains 113 digits, is the
-- first Fibonacci number for which the last nine digits are 1-9
-- pandigital (contain all the digits 1 to 9, but not necessarily
-- in order). And F_2749, which contains 575 digits, is the first
-- Fibonacci number for which the first nine digits are 1-9
-- pandigital. Given that F_k is the first Fibonacci number for
-- which the first nine digits AND the last nine digits are 1-9
-- pandigital, find k.

import Utils (memoized_fib)
import ListUtils (is19Pandigital)
import NumberUtils (lastDigits, firstDigits)

findFib :: Int
findFib = findFibAux 2750 where
    findFibAux index =
        let fib = memoized_fib index
            ft = firstDigits 9 $ fromInteger fib
            lt = lastDigits 9 $ fromInteger fib
            firstPan = is19Pandigital $ fromInteger ft
            lastPan = is19Pandigital $ fromInteger lt in
                if firstPan && lastPan then index
                else findFibAux (index + 1)

result :: Int
result = findFib

-- :load 0104.hs
-- memoized_fib 541
-- memoized_fib 2749
-- 329468
