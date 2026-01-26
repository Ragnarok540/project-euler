module Utils where

sequ :: (Integer -> Bool) -> Integer -> [Integer]
sequ func start =
    if func start then start : (sequ func (start + 1)) else sequ func (start + 1)

evens :: [Integer] -> [Integer]
evens [] = []
evens [e] = []
evens (_ : e : t) = e : (evens t)

isPrime :: Integer -> Bool
isPrime n = (abs n) > 1 && isNotDivisor 2 where
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

allNums :: Integer -> [Integer]
allNums start = start:(allNums (start + 1))
