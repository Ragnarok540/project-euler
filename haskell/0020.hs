-- Factorial Digit Sum:
-- n! means n * (n - 1) * ... * 2 * 1.
-- For example, 10! = 10 * 9 ... 2 * 1 = 3628800,
-- and the sum of the digits in the number 10!
-- is 3 + 6 + 2 + 8 + 8 + 0 + 0 = 27.
-- Find the sum of the digits in the number 100!.

import Utils

result :: Integer
result = sumDigits (factorial 100)

-- :load 0020.hs
-- 648
