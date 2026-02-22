-- Self Powers:
-- The series, 1^1 + 2^2  + ... + 10^10 = 10405071317.
-- Find the last ten digits of the series,
-- 1^1 + 2^2  + ... + 1000^1000.

sumSelfPowers :: Integer -> Integer
sumSelfPowers num =
    sum $ map (\x -> x ^ x) [1..num]

lastDigits :: Int -> Integer -> Integer
lastDigits last digits =
    read $ reverse $ take last $ reverse $ show digits :: Integer

result :: Integer
result = lastDigits 10 $ sumSelfPowers 1000

-- :load 0048.hs
-- sumSelfPowers 10
-- lastDigits 3 10405071317
-- lastDigits 10 $ sumSelfPowers 1000
-- 9110846700
