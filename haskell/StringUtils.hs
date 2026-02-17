module StringUtils where

wordValue :: String -> Int
wordValue [] = 0
wordValue (h : t) =
    (fromEnum h - 64) + wordValue t
