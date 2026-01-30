-- Power Digit Sum:
-- 2^15 = 32768 and the sum of its digits is 2 + 3 + 7 + 6 + 8 = 26.
-- What is the sum of the digits of the number 2^1000?

digitToInt :: Char -> Integer
digitToInt digit =
    case digit of
        '0' -> 0
        '1' -> 1
        '2' -> 2
        '3' -> 3
        '4' -> 4
        '5' -> 5
        '6' -> 6
        '7' -> 7
        '8' -> 8
        '9' -> 9

sumDigits :: Integer -> Integer
sumDigits num =
    let nums = map digitToInt (show num) in
        sum nums

result :: Integer
result = sumDigits (2 ^ 1000)

-- :load 0011.hs
-- digitToInt '5'
-- sumDigits 2 ^ 1000
-- 1366
