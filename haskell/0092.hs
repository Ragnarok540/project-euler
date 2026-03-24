-- Square Digit Chains:
-- A number chain is created by continuously adding the square
-- of the digits in a number to form a new number until it has
-- been seen before. For example,
-- 44 -> 32 -> 13 -> 10 -> 1 -> 1
-- 85 -> 89 -> 145 -> 42 -> 20 -> 4 -> 16 -> 37 -> 58 -> 89
-- Therefore any chain that arrives at 1 or 89 will become stuck
-- in an endless loop. What is most amazing is that EVERY starting
-- number will eventually arrive at 1 or 89.
-- How many starting numbers below ten million will arrive at 89?

import ListUtils (intToIntList)

squareChain :: Int -> [Int]
squareChain start =
    let ls = intToIntList start
        next = sum $ map (^2) ls in
            if next == 1 || next == 89 then [next]
            else next : squareChain next

find89 :: Int -> Int
find89 limit = find89Aux 1 limit where
    find89Aux num lim =
        let sc = squareChain num
            lst = last sc in
                if num > lim then 0 else
                    if lst == 89 then 1 + find89Aux (num + 1) limit
                    else find89Aux (num + 1) limit

result :: Int
result = find89 10000000

-- :load 0092.hs
-- squareChain 44
-- squareChain 85
-- 8581146
