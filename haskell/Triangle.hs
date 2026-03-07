module Triangle where

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
