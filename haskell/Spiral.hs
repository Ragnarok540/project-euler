module Spiral where

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

spiralDiagonals :: Int -> [((Int, Int), Int)] -> [Int]
spiralDiagonals _ [] = []
spiralDiagonals size (h : t) =
    let ((i, j), v) = h in
        if i == j || i + j == size - 1 then v : spiralDiagonals size t
        else spiralDiagonals size t
