module Utils where

sequ :: (Integer -> Bool) -> Integer -> [Integer]
sequ func start =
    if func start then start : (sequ func (start + 1)) else sequ func (start + 1)

evens :: [Integer] -> [Integer]
evens [] = []
evens [e] = []
evens (_ : e : t) = e : (evens t)

isPrime :: Integer -> Bool
isPrime n = if n < 2 then False else (abs n) > 1 && isNotDivisor 2 where
    isNotDivisor d = d * d > (abs n) || ((mod (abs n) d) /= 0 && isNotDivisor (d + 1)) 

primes :: Integer -> [Integer]
primes start =
    if isPrime start then start : (primes (start + 1)) else primes (start + 1)

intSquareRoot :: Integer -> Integer
intSquareRoot n = aux n
  where
    aux x
      | x * x > n = aux (x - 1)
      | otherwise = x

ownHead :: [a] -> a
ownHead (h : _) = h

ownTail :: [a] -> [a]
ownTail (_ : t) = t

(^!) :: Num a => a -> Int -> a
(^!) x n = x ^ n

squareRoot :: Integer -> Integer
squareRoot 0 = 0
squareRoot 1 = 1
squareRoot n =
    let twopows = iterate (^!2) 2
        (lowerRoot, lowerN) = last $ takeWhile ((n>=) . snd) $ zip (1 : twopows) twopows
        newtonStep x = div (x + div n x) 2
        iters = iterate newtonStep (squareRoot (div n lowerN) * lowerRoot)
        isRoot r = r ^! 2 <= n && n < (r + 1) ^! 2
    in ownHead $ dropWhile (not . isRoot) iters

rangeUp :: Integer -> Integer -> Integer -> [Integer]
rangeUp step start end = takeWhile (<=end) $ iterate (+step) start

rangeDown :: Integer -> Integer -> Integer -> [Integer]
rangeDown step start end =
    let up = rangeUp step end start in
        reverse up

cartProd :: [a] -> [b] -> [(a, b)]
cartProd xs ys = [(x, y) | x <- xs, y <- ys]

cartProd2 :: [Integer] -> [Integer] -> [(Integer, Integer)]
cartProd2 xs ys = [(x, y) | x <- xs, y <- ys, x >= y]

cartProd3 :: [Integer] -> [Integer] -> [(Integer, Integer)]
cartProd3 xs ys = [(x, y) | x <- xs, y <- ys, x > y]

cartProd4 :: [Integer] -> [Integer] -> [(Integer, Integer)]
cartProd4 xs ys = [(x, y) | x <- xs, y <- ys, x <= y]

cartProd5 :: [Integer] -> [Integer] -> [(Integer, Integer)]
cartProd5 xs ys = [(x, y) | x <- xs, y <- ys, x < y]

allNums :: Integer -> [Integer]
allNums start = start:(allNums (start + 1))

divisors :: Integer -> [Integer]
divisors num = divisorsAux num num where
    divisorsAux div num =
        if div == 1 then [1] else
            if (mod num div) == 0 then div : divisorsAux (div - 1) num
            else divisorsAux (div - 1) num

properDivisorsSum :: Integer -> Integer
properDivisorsSum num = sum (drop 1 (divisors num))

-- triangle funcs

-- getElem :: (Int, Int) -> Integer
-- getElem (a, b) = triangle !! a !! b

bellow :: (Int, Int) -> [(Int, Int)]
bellow (a, b) = [(a + 1, b), (a + 1, b + 1)]

above :: (Int, Int) -> [(Int, Int)]
above (a, b) =
    if b == 0 then [(a - 1, 0)] else
    if a == b then [(a - 1, b - 1)] else
    [(a - 1, b - 1), (a - 1, b)]

factorial :: Integer -> Integer
factorial 0 = 1
factorial num = foldl (*) 1 [1..num]

choose :: Integer -> Integer -> Integer
choose n k = div (factorial n) ((factorial k) * factorial (n - k))

digitToInt :: Char -> Integer
digitToInt digit =
    case digit of
        '0' -> 0
        '1' -> 1
        '2' -> 2
        '3' -> 3
        '4' -> 4
        '5' -> 5
        '6' -> 6
        '7' -> 7
        '8' -> 8
        '9' -> 9

sumDigits :: Integer -> Integer
sumDigits num =
    let nums = map digitToInt (show num) in
        sum nums

removeDups :: Eq a => [a] -> [a]
removeDups = rdHelper []
    where rdHelper seen [] = seen
          rdHelper seen (x:xs)
              | x `elem` seen = rdHelper seen xs
              | otherwise = rdHelper (seen ++ [x]) xs

slow_fib :: Int -> Integer
slow_fib 0 = 0
slow_fib 1 = 1
slow_fib n = slow_fib (n - 2) + slow_fib (n - 1)

memoized_fib :: Int -> Integer
memoized_fib =
    (map fib [0 ..] !!) where
        fib 0 = 0
        fib 1 = 1
        fib n = memoized_fib (n - 2) + memoized_fib (n - 1)

intListToInt :: [Integer] -> Integer
intListToInt ls = read $ concat $ map show ls :: Integer
