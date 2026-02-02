-- Counting Sundays:
-- You are given the following information, but you may prefer to do some
-- research for yourself.
-- 1 Jan 1900 was a Monday.
-- Thirty days has September,
-- April, June and November.
-- All the rest have thirty-one,
-- Saving February alone,
-- Which has twenty-eight, rain or shine.
-- And on leap years, twenty-nine.
-- A leap year occurs on any year evenly divisible by 4, but not on a
-- century unless it is divisible by 400.
-- How many Sundays fell on the first of the month during the twentieth
-- century (1 Jan 1901 to 31 Dec 2000)?

import Data.Time.Calendar

accDays :: Day -> Day -> [Day]
accDays start end =
    if start == end then [] else
    if dayOfWeek start == Sunday then
        start : accDays (addGregorianMonthsClip 1 start) end
    else accDays (addGregorianMonthsClip 1 start) end

numSundaysStartofMonth :: [Day]
numSundaysStartofMonth =
    let start = fromGregorian 1901 1 1
        end = fromGregorian 2000 12 1 in
            accDays start end

result :: Int
result = length numSundaysStartofMonth

-- :load 0019.hs
-- 171
