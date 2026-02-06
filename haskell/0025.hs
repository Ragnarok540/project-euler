-- 1000-digit Fibonacci Number:
-- The Fibonacci sequence is defined by the recurrence relation:
-- F_n = F_(n-1) + F_(n-2), where F_1 = 1 and F_2 = 1.
-- Hence the first 7 terms will be:
-- 1, 1, 2, 3, 5, 8, 13
-- The 7th term, F_7, is the first term to contain two digits.
-- What is the index of the first term in the Fibonacci sequence
-- to contain 1000-digits?

import Utils

numDigits :: Integer -> Int
numDigits num = length $ show num

findFib :: Int -> Int
findFib digits = findFibAux 1 digits where
    findFibAux index digits =
        let fib = memoized_fib index
            num = numDigits fib in
                if num == digits then index else findFibAux (index + 1) digits

-- :load 0025.hs
-- numDigits 354224848179261915075
-- findFib 1000
-- 4782
