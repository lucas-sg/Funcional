module Ej1 where

data N = Z | S N

evalN :: N -> Int
evalN Z = 0
evalN (S n) = 1 + evalN n

addN :: N -> N -> Int
addN Z n = evalN n
addN (S n1) n2 = addN n1 (S n2)

prodN :: N -> N -> Int
prodN Z n = evalN Z
prodN (S n1) n2 = addN n2 (int2N (prodN n1 n2))

int2N :: Int -> N
int2N 0 = Z
int2N n = S (int2N (n - 1))