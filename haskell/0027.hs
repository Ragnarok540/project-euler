-- Quadratic Primes:
-- Euler discovered the remarkable quadratic formula:
-- n^2 + n + 41
-- It turns out that the formula will produce  primes for the consecutive
-- integer values 0 <= n <= 39. However, when n = 40, 40^2 + 40 + 41 is
-- divisible by 41, and certainly when n = 41, 40^2 + 40 + 41 is clearly
-- divisible by 41.
-- The incredible formula n^2 -79 * n + 1601 was discovered, which
-- produces 80 primes for the consecutive values 0 <= n <= 79. The
-- product of the coefficients, -79 and 1601, is -126479.
-- Considering quadratics of the form:
-- n^2 + a * n + b, where |a| < 1000 and |b| <= 1000
-- where |n| is the modulus/absolute value of n
-- e.g. |11| = 11 and |-4| = 4  
-- Find the product of the coefficients, a and b, for the quadratic
-- expression that produces the maximum number of primes for consecutive
-- values of n, starting with n = 0.

import Utils (cartProd)
import PrimeUtils (isPrime, primes)

quadForm :: Integer -> Integer
quadForm n = n^2 + n + 41

quadForm2 :: Integer -> Integer
quadForm2 n = n^2 - 79 * n + 1601

createQuadForm :: Integer -> Integer -> (Integer -> Integer)
createQuadForm a b = \n -> n^2 + a * n + b

getPrimes :: (Integer -> Integer) -> [Integer]
getPrimes func =
    getPrimesAux func 0 where
        getPrimesAux func num =
            let p = func num in
                if isPrime p then p : getPrimesAux func (num + 1) else []

getCoefficients :: Integer -> [(Integer, Integer)]
getCoefficients limit =
    let prs = takeWhile (< limit) (primes 2)
        negPrs = map negate prs in
            cartProd negPrs prs

findCoefficients :: Integer -> [(Int, (Integer, Integer))]
findCoefficients limit =
    let coeff = getCoefficients limit in
        findCoefficientsAux coeff where
            findCoefficientsAux [] = []
            findCoefficientsAux (h : t) =
                let (a, b) = h
                    qForm = createQuadForm a b
                    prs = getPrimes qForm
                    len = length prs in
                        (len, (a, b)) : findCoefficientsAux t

getMax :: Integer -> (Integer, Integer)
getMax num = snd $ maximum $ findCoefficients num

result :: Integer
result =
    let (a, b) = getMax 1000 in
        a * b

-- :load 0027.hs
-- quadForm 1
-- getPrimes quadForm
-- length $ getPrimes quadForm
-- getPrimes quadForm2
-- length $ getPrimes quadForm2
-- getPrimes (createQuadForm (-79) 1601)
-- getCoefficients 5
-- findCoefficients 10
-- getMax 1000
-- (-61,971)
-- -59231
