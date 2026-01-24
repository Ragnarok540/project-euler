module Utils where

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
