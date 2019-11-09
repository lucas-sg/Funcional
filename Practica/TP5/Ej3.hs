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
nextDD D0 = 1
nextDD D1 = 2
nextDD D2 = 3
nextDD D3 = 4
nextDD D4 = 5
nextDD D5 = 6
nextDD D6 = 7
nextDD D7 = 8
nextDD D8 = 9
nextDD D9 = 0

prevDD :: DigDec -> DigDec
prevDD D0 = 9
prevDD D1 = 0
prevDD D2 = 1
prevDD D3 = 2
prevDD D4 = 3
prevDD D5 = 4
prevDD D6 = 5
prevDD D7 = 6
prevDD D8 = 7
prevDD D9 = 8