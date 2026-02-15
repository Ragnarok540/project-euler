module NumberUtils where

palindromeInt :: Integer -> Bool
palindromeInt num =
    let intStr = show num in
        intStr == reverse intStr
