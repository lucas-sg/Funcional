module Ej3 where

data DigDec = D0 | D1 | D2 | D3 | D4 | D5 | D6 | D7 | D8 | D9

ddAsInt :: DigDec -> Int
ddAsInt D0 = 0
ddAsInt D1 = 1 
ddAsInt D2 = 2
ddAsInt D3 = 3 
ddAsInt D4 = 4
ddAsInt D5 = 5
ddAsInt D6 = 6 
ddAsInt D7 = 7
ddAsInt D8 = 8
ddAsInt D9 = 9

ddOfInt :: Int -> DigDec
ddOfInt 0 = D0
ddOfInt 1 = D1 
ddOfInt 2 = D2
ddOfInt 3 = D3 
ddOfInt 4 = D4
ddOfInt 5 = D5
ddOfInt 6 = D6 
ddOfInt 7 = D7
ddOfInt 8 = D8
ddOfInt 9 = D9

nextDD :: DigDec -> DigDec
nextDD D0 = D1
nextDD D1 = D2
nextDD D2 = D3
nextDD D3 = D4
nextDD D4 = D5
nextDD D5 = D6
nextDD D6 = D7
nextDD D7 = D8
nextDD D8 = D9
nextDD D9 = D0

prevDD :: DigDec -> DigDec
prevDD D0 = D9
prevDD D1 = D0
prevDD D2 = D1
prevDD D3 = D2
prevDD D4 = D3
prevDD D5 = D4
prevDD D6 = D5
prevDD D7 = D6
prevDD D8 = D7
prevDD D9 = D8