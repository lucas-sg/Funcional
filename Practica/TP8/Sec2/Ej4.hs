import Ej3

type NDec = [DigDec]

evalND :: NDec -> Int
evalND [] = 0
evalND (x:xs) = ddAsInt x * (10 ^ (length xs)) + evalND xs

normalizarND :: NDec -> NDec
normalizarND [] = []
normalizarND (x:xs) = if ddAsInt x == 0
                      then normalizarND xs
                      else x:xs

-- Check este, quedo feo
succNDec :: NDec -> NDec
succNDec [] = []
succNDec (x:xs) = if acarrea (x:xs)
                  then D1:(anular (x:xs))
                  else if acarrea xs
                       then (nextDD x):(anular xs)
                       else if length xs == 1
                            then x:[(nextDD (first' xs))]
                            else x:(succNDec xs)

acarrea :: NDec -> Bool
acarrea [] = True
acarrea (x:xs) = first' x == 9 && acarrea xs

anular :: NDec -> NDec
anular [] = []
anular (x:xs) = D0:(anular xs)

first' :: NDec -> DigDec
first' (x:xs) = x