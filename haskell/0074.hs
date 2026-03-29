-- Digit Factorial Chains:
-- The number 145 is well known for the property that the sum of the
-- factorial of its digits is equal to 145:
-- 1! + 4! + 5! = 1 + 24 + 120 = 145.
-- Perhaps less well known is 169, in that it produces the longest
-- chain of numbers that link back to 169; it turns out that there
-- are only three such loops that exist:
-- 169 -> 363601 -> 1454 -> 169
-- 871 -> 45361 -> 871
-- 872 -> 45362 -> 872
-- It is not difficult to prove that EVERY starting number will
-- eventually get stuck in a loop. For example,
-- 69 -> 363600 -> 1454 -> 169 -> 363601 (-> 1454)
-- 78 -> 45360 -> 871 -> 45361 (-> 871)
-- 540 -> 145 (-> 145)
-- Starting with 69 produces a chain of five non-repeating terms, but
-- the longest non-repeating chain with a starting number below one
-- million is sixty terms.
-- How many chains, with a starting number below one million, contain
-- exactly sixty non-repeating terms?

import ListUtils (intToIntList)
import Utils (factorial2)

factorialChain :: Int -> [Int]
factorialChain start = start : factorialChainAux start [] where
    factorialChainAux strt seen =
        let ls = intToIntList strt
            next = sum $ map factorial2 ls in
                if elem next seen then []
                else next : factorialChainAux next (next : seen)

findResult :: Int -> Int -> Int
findResult limit number = findResultAux 0 limit number where
    findResultAux counter lim num =
        let chain = factorialChain counter
            len = length chain in
                if counter == lim then 0 else
                    if len == num then 1 + findResultAux (counter + 1) lim num
                    else findResultAux (counter + 1) lim num

result :: Int
result = findResult 1_000_000 60

-- :load 0074.hs
-- factorialChain 169
-- factorialChain 69
-- 402
