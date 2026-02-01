-- Maximum Path Sum I:
-- By starting at the top of the triangle below and moving to adjacent
-- numbers on the row below, the maximum total from top to bottom is 23.

--    3
--   7 4
--  2 4 6
-- 8 5 9 3

-- That is, 3 + 7 + 4 + 9 = 23.

-- Find the maximum total from top to bottom of the triangle below:

-- NOTE: As there are only  routes, it is possible to solve this
-- problem by trying every route. However, Problem 67, is the same
-- challenge with a triangle containing one-hundred rows; it cannot
-- be solved by brute force, and requires a clever method! ;o)

triangle :: [[Integer]]
triangle = [[75],
            [95, 64],
            [17, 47, 82],
            [18, 35, 87, 10],
            [20, 04, 82, 47, 65],
            [19, 01, 23, 75, 03, 34],
            [88, 02, 77, 73, 07, 63, 67],
            [99, 65, 04, 28, 06, 16, 70, 92],
            [41, 41, 26, 56, 83, 40, 80, 70, 33],
            [41, 48, 72, 33, 47, 32, 37, 16, 94, 29],
            [53, 71, 44, 65, 25, 43, 91, 52, 97, 51, 14],
            [70, 11, 33, 28, 77, 73, 17, 78, 39, 68, 17, 57],
            [91, 71, 52, 38, 17, 14, 91, 43, 58, 50, 27, 29, 48],
            [63, 66, 04, 68, 89, 53, 67, 30, 73, 16, 69, 87, 40, 31],
            [04, 62, 98, 27, 23, 09, 70, 98, 73, 93, 38, 53, 60, 04, 23]]

triangle2 :: [[Integer]]
triangle2 = [[3],
             [7, 4],
             [2, 4, 6],
             [8, 5, 9, 3]]

triangle3 :: [[Integer]]
triangle3 = [[3],
             [7, 4]]

addFstSnd :: [Integer] -> [Integer] -> [Integer]
addFstSnd _ [] = []
addFstSnd (f1 : s1 : t1) (f2 : t2) =
    maximum [f1 + f2, s1 + f2] : addFstSnd (s1 : t1) t2

redux :: [[Integer]] -> [[Integer]]
redux (f : s : t) =
    if t == [] then [addFstSnd f s] else
    let newFst = addFstSnd f s in
        redux (newFst : t)
    
maxSum :: [[Integer]] -> Integer
maxSum tri =
    let revTri = reverse tri
        rdx = redux revTri in
            rdx !! 0 !! 0

result :: Integer
result = maxSum triangle

-- :load 0018.hs
-- (f : s : t) = reverse triangle
-- addFstSnd f s
-- maxSum triangle3
-- maxSum triangle2
-- maxSum triangle
-- 1074
