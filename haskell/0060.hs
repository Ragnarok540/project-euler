import PrimeUtils (allPrimes) -- (isPrime, primes)
import NumberUtils (concatNumbers)
import Utils (cartProd6)

remarkablePrimes :: [Integer]
remarkablePrimes = [3, 7, 109] -- , 673]

containsAll :: [Integer] -> [Integer] -> Bool
containsAll [] _ = True
containsAll (h : t) ls =
    if elem h ls then True && containsAll t ls
    else False

findNextRemarkablePrime :: Integer
findNextRemarkablePrime =
    let l = 1 + last remarkablePrimes
        primes1 = allPrimes l 30000
        primes2 = allPrimes 2 30000 in
        findNextRemarkablePrimeAux primes1 primes2 where
            findNextRemarkablePrimeAux [] _ = 0
            findNextRemarkablePrimeAux (h : t) pr =
                let rp = h : remarkablePrimes
                    rp1 = map concatNumbers $ cartProd6 rp rp in
                        if containsAll rp1 pr then h
                        else findNextRemarkablePrimeAux t pr



-- :load 0060.hs
-- cartProd6 remarkablePrimes remarkablePrimes
-- map concatNumbers $ cartProd6 remarkablePrimes remarkablePrimes

