-- Special Pythagorean Triplet:
-- A Pythagorean triplet is a set of three natural
-- numbers, a < b < c, for which
-- a^2 + b^2 = c^2
-- For example, 3^2 + 4^2 = 9 + 16 = 25 = 5^2.
-- There exists exactly one Pythagorean triplet for which
-- a + b + c = 1000.
-- Find the product a * b * c.

import Utils (rangeUp, cartProd3)

pairs :: [(Integer, Integer)]
pairs = 
    let ran = rangeUp 1 1 20 in
        cartProd3 ran ran

euclidFormula :: (Integer, Integer) -> (Integer, Integer, Integer)
euclidFormula pair =
    let m = fst pair
        n = snd pair
        a = m^2 - n^2
        b = 2 * m * n
        c = m^2 + n^2 in
            (a, b, c)
    
findTriple :: [(Integer, Integer, Integer)] -> (Integer, Integer, Integer)
findTriple (h : t) =
    let (a, b, c) = h in
        if a + b + c == 1000 then (a, b, c) else findTriple t

result :: Integer
result =
    let (a, b, c) = findTriple (map euclidFormula pairs) in
        a * b * c

-- :load 0009.hs
-- euclidFormula (2, 1)
-- map euclidFormula pairs
-- findTriple (map euclidFormula pairs)
-- 31875000
