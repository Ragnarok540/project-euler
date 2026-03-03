-- Convergents of e:
-- The square root of 2 can be written as an infinite continued fraction.
-- The infinite continued fraction can be written, sqrt(2) = [1; (2)],
-- (2) indicates that 2 repeats ad infinitum. In a similar way,
-- sqrt(23) = [4; (1, 3, 1, 8)].
-- It turns out that the sequence of partial values of continued
-- fractions for square roots provide the best rational approximations.
-- Let us consider the convergents for sqrt(2).
-- Hence the sequence of the first ten convergents for sqrt(2) are:
-- 1
-- 3/2 = 1.5
-- 7/5 = 1.4
-- 17/12 = 1.41666...
-- 41/29 = 1.41379...
-- What is most surprising is that the important mathematical constant,
-- e = [2; 1, 2, 1, 1, 4, 1,..., 1, 2k, 1, ...]
-- The first ten terms in the sequence of convergents for e are:
-- 2/1
-- 3/1
-- 8/3
-- 11/4
-- 19/7
-- 87/32
-- 106/39
-- 193/71
-- 1264/465
-- 1457/536
-- The sum of digits in the numerator of the 10th convergent is
-- 1 + 4 + 5 + 7 = 17.
-- Find the sum of digits in the numerator of the th convergent of the
-- continued fraction for e.

import Utils (sumDigits)

eContinuedFraction :: Integer -> [Integer]
eContinuedFraction n = 1 : n : 1 : eContinuedFraction (2 + n)

eConvergentM :: Int -> (Integer, Integer)
eConvergentM =
    (map eConvergent [0 ..] !!) where
        eConvergent 0 = (2, 1)
        eConvergent 1 = (3, 1)
        eConvergent n =
            let (a2, b2) = eConvergentM (n - 2)
                (a1, b1) = eConvergentM (n - 1)
                ecf = (eContinuedFraction 2) !! (n - 1) in
                    (a1 * ecf + a2 , b1 * ecf + b2)

result :: Integer
result = sumDigits $ fst $ eConvergentM 99

-- :load 0065.hs
-- take 100 $ eContinuedFraction 2
-- eConvergentM 99
-- sumDigits $ fst $ eConvergentM 99
-- 272
