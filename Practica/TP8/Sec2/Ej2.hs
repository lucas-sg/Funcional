import Ej1

type NU = [()]

evalNU :: NU -> Int
evalNU [] = 0
evalNU (x:xs) = 1 + evalNU xs

succNU :: NU -> NU
succNU [] = [()]
succNU (x:xs) = x:(succNU xs)

addNU :: NU -> NU -> NU
addNU [] nu = nu
addNU (x:xs) nu = succNU (addNU xs nu)

-- ¿Es necesario hacer recursion estructural aca?
nu2N :: NU -> N
nu2N nu = int2N (evalNU nu)
-- Quedaria asi:
-- nu2N [] = int2N 0
-- nu2N (x:xs) = addN (int2N 1) (nu2N xs)

n2nu :: N -> NU
n2nu Z = []
n2nu (S n) = succNU (n2nu n)