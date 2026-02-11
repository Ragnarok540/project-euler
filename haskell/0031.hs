-- Coin Sums:
-- In the United Kingdom the currency is made up of pound (£) and
-- pence (p). There are eight coins in general circulation:
-- 1p, 2p, 5p, 10p, 20p, 50p, £1 (100p), and £2 (200p).
-- It is possible to make £2 in the following way:
-- 1 * £1 + 1 * 50p + 2 * 20p + 1 * 5p + 1 * 2p + 3 * 1p
-- How many different ways can £2 be made using any number of coins?

coinOptions :: Integer -> [(Integer, Integer, Integer, Integer, Integer, Integer, Integer, Integer)]
coinOptions total =
    [(pou2, pou1,
      pen50, pen20,
      pen10, pen5,
      pen2, pen1) | pou2 <- [0..(div total 200)],
                    pou1 <- [0..(div total 100)],
                    pen50 <- [0..(div total 50)],
                    pen20 <- [0..(div total 20)],
                    pen10 <- [0..(div total 10)],
                    pen5 <- [0..(div total 5)],
                    pen2 <- [0..(div total 2)],
                    pen1 <- [0..total],
                    pou2 * 200 + pou1 * 100
                  + pen50 * 50 + pen20 * 20
                  + pen10 * 10 + pen5 * 5
                  + pen2 * 2 + pen1 == total] 

-- :load 0031.hs
-- coinOptions 200
