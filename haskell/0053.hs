-- Combinatoric Selections:
-- There are exactly ten ways of selecting three from five, 12345:
-- 123, 124, 125, 134, 135, 145, 234, 235, 245, and 345
-- In combinatorics, we use the notation, choose 5 3 = 10. In general,
-- choose n k = div (factorial n) ((factorial k) * factorial (n - k))
-- It is not until n = 23, that a value exceeds one-million:
-- choose 23 10 = 1144066.
-- How many, not necessarily distinct, values of choose n k for
-- 1 <= n < 100, are greater than one-million?

import Utils (choose, rangeUp, cartProd3)

bigChoose :: Integer
bigChoose =
    let combinations = cartProd3 (rangeUp 1 1 100) (rangeUp 1 1 100) in
        bigChooseAux combinations 0 where
            bigChooseAux [] counter = counter
            bigChooseAux (h : t) counter =
                let (n, k) = h
                    val = choose n k in
                        if val > 1000000 then bigChooseAux t (counter + 1)
                        else bigChooseAux t counter

result :: Integer
result = bigChoose

-- :load 0053.hs
-- cartProd3 (rangeUp 1 1 100) (rangeUp 1 1 100)
-- 4075
