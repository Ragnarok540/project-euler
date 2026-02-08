-- Number Spiral Diagonals:
-- Starting with the number 1 and moving to the right in a clockwise
-- directiona 5 by 5 spiral is formed as follows:
-- 21 22 23 24 25
-- 20  7  8  9 10
-- 19  6  1  2 11
-- 18  5  4  3 12
-- 17 16 15 14 13
-- It can be verified that the sum of the numbers on the diagonals is 101.
-- What is the sum of the numbers on the diagonals in a 1001 by 1001
-- spiral formed in the same way?

-- https://stackoverflow.com/questions/57569623/coordinates-for-clockwise-outwards-spiral

data Dir = R | D | L | U deriving (Show)

spiralSeq :: Int -> [Dir]
spiralSeq n = rn R ++ rn D ++ rn1 L ++ rn1 U
    where rn = replicate n
          rn1 = replicate (n + 1)

spiral :: [Dir]
spiral = concatMap spiralSeq [1, 3..]

move :: (Int, Int) -> Dir -> (Int, Int)
move (x, y) = go
    where go R = (x + 1, y)
          go D = (x, y + 1)
          go L = (x - 1, y)
          go U = (x, y - 1)

spiralPos :: (Int, Int) -> [(Int, Int)]
spiralPos start = scanl move start spiral

ulamSpiral :: Int -> [((Int, Int), Int)]
ulamSpiral size =
    let center = div (size - 1) 2
        sizeSq = size ^ 2 in
        zip (take sizeSq $ spiralPos (center, center)) [1..sizeSq]

sumDiagonals :: Int -> [((Int, Int), Int)] -> Int
sumDiagonals _ [] = 0
sumDiagonals size (h : t) =
    let ((i, j), v) = h in
        if i == j || i + j == size - 1 then v + sumDiagonals size t
        else sumDiagonals size t

result :: Int
result = sumDiagonals 1001 $ ulamSpiral 1001

-- :load 0028.hs
-- take 9 spiral
-- take 9 $ spiralPos (2, 2)
-- sort $ zip (take 25 $ spiralPos (2, 2)) [1..25]
-- ulamSpiral 5
-- sumDiagonals 5 $ ulamSpiral 5
-- 669171001
