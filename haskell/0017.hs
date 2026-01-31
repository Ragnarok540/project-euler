-- Number Letter Counts:
-- If the numbers 1 to 5 are written out in words: one, two, three, four,
-- five, then there are 3 + 3 + 5 + 4 + 4 = 19 letters used in total.
-- If all the numbers from 1 to 1000 (one thousand) inclusive were written
-- out in words, how many letters would be used?
-- NOTE: Do not count spaces or hyphens. For example, 342 (three hundred
-- and forty-two) contains 23 letters and 115 (one hundred and fifteen)
-- contains 20 letters. The use of "and" when writing out numbers is in
-- compliance with British usage.

import Data.List (intercalate, words)

numberToWord :: Integer -> String
numberToWord num =
    case num of
        1 -> "one"
        2 -> "two"
        3 -> "three"
        4 -> "four"
        5 -> "five"
        6 -> "six"
        7 -> "seven"
        8 -> "eigth"
        9 -> "nine"
        10 -> "ten"
        11 -> "eleven"
        12 -> "twelve"
        13 -> "thirteen"
        14 -> "fourteen"
        15 -> "fifteen"
        16 -> "sixteen"
        17 -> "seventeen"
        18 -> "eighteen"
        19 -> "nineteen"

numberToWord2 :: Integer -> String
numberToWord2 num =
    case num of
        2 -> "twenty"
        3 -> "thirty"
        4 -> "forty"
        5 -> "fifty"
        6 -> "sixty"
        7 -> "seventy"
        8 -> "eighty"
        9 -> "ninety"

ones :: Integer -> Integer
ones num = mod num 10

tens :: Integer -> Integer
tens num = mod (div num 10) 10

hundreds :: Integer -> Integer
hundreds num = mod (div num 100) 10

thousands :: Integer -> Integer
thousands num = mod (div num 1000) 10

tens2 :: Integer -> Integer
tens2 num = mod num 100

numberToWords :: Integer -> String
numberToWords num =
    if num <= 19 then
        numberToWord num
    else
        if num <= 99 then
            let t = tens num
                o = ones num in
                    if o == 0 then
                        numberToWord2 t
                    else
                        numberToWord2 t ++ " " ++ numberToWord o
        else
            if num <= 999 then
                let t2 = tens2 num
                    h = hundreds num in
                        if t2 == 0 then
                            numberToWord h ++ " hundred"
                        else
                            numberToWord h ++ " hundred and " ++ numberToWords t2
            else
                "one thousand"

numberLetterCount :: [Integer] -> Int
numberLetterCount ran =
    let wrds = map numberToWords ran
        joined = intercalate " " wrds
        splitted = words joined
        lens = map length splitted in
            sum lens

result :: Int
result = numberLetterCount [1..1000]

-- :load 0017.hs
-- hundreds 256
-- tens 256
-- ones 256
-- map numberToWords [1..1000]
-- intercalate " " (map numberToWords [1..1000])
-- words (intercalate " " (map numberToWords [1..1000]))
-- map length (words (intercalate " " (map numberToWords [1..1000])))
-- numberLetterCount [1..5]
-- sum (map length (words (intercalate " " (map numberToWords [1..1000]))))
-- 21124
