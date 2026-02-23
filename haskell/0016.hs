-- Power Digit Sum:
-- 2^15 = 32768 and the sum of its digits is 2 + 3 + 7 + 6 + 8 = 26.
-- What is the sum of the digits of the number 2^1000?

import Utils (sumDigits)

result :: Integer
result = sumDigits (2 ^ 1000)

-- :load 0016.hs
-- digitToInt '5'
-- sumDigits 2 ^ 1000
-- 1366
