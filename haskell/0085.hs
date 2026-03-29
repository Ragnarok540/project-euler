-- Counting Rectangles:
-- By counting carefully it can be seen that a rectangular grid
-- measuring 3 by 2 contains eighteen rectangles:
-- Although there exists no rectangular grid that contains exactly
-- two million rectangles, find the area of the grid with the
-- nearest solution.

import Utils (cartProd, cartProd2)
import Data.List (sort)

numRectangles :: Integer -> Integer -> Integer
numRectangles a b =
    let rectangles = cartProd [1..a] [1..b]
        rectangles' = map (\(i, j) -> i * j) rectangles in
            sum rectangles'

areaRectangles :: Integer -> Integer -> [(Integer, Integer, Integer, Integer)]
areaRectangles a b =
    let sides = cartProd2 [a..b] [a..b] in
        areaRectanglesAux sides where
            areaRectanglesAux [] = []
            areaRectanglesAux (h : t) =
                let (i, j) = h
                    numRects = numRectangles i j
                    area = i * j in
                        (numRects, i, j, area) : areaRectanglesAux t

findArea :: Integer -> Integer
findArea limit =
    let ar = areaRectangles 1 100
        ar' = sort $ ar
        ar'' = filter (\(nr, _, _, _) -> nr <= limit) ar'
        ar''' = last ar''
        (_, _, _, area) = ar''' in
            area

result :: Integer
result = findArea 2_000_000

-- :load 0085.hs
-- numRectangles 2 3
-- areaRectangles 30 80
-- numRectangles 77 36
-- 77 * 36
-- 2772
