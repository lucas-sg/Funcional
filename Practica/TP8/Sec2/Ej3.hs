import Ej2
import TP8.Sec2.Ej1

type NBin = [DigBin]

evalNB :: NBin -> Int
evalNB []     = 0
evalNB (x:xs) = 2 * evalNB xs + dbAsInt x
    
normalizarNB :: NBin -> NBin
normalizarNB []     = []
normalizarNB (x:xs) = if evalNB xs == 0
                      then [x]
                      else x:(normalizarNB xs)

succNB :: NBin -> NBin
succNB []     = []
succNB (x:xs) = if dbAsInt x == 0
                then I:xs
                else if length xs == 0
                     then [O, I]
                     else O:(succNB xs)

-- Check este que quedo horrible
addNB :: NBin -> NBin -> NBin
addNB []     nb = nb
addNB (x:xs) nb = if length (x:xs) > length nb
                  then addNB nb (x:xs)
                  else let (y:ys) = nb
                       in if carry (addDB x y)
                          then if length ys == 0
                               then O:(addNB xs [I])
                               else O:(addNB xs (succNB ys))
                          else (biggest x y):(addNB xs ys)

addDB :: DigBin -> DigBin -> NBin
addDB O db = [db]
addDB I db = if dbAsInt db == 1
             then [O, I]
             else [I]

carry :: NBin -> Bool
carry [O, I] = True
carry _      = False

biggest :: DigBin -> DigBin -> DigBin
biggest x y = dbOfBool (dbAsBool x || dbAsBool y)

nb2N :: NBin -> N
nb2N [] = Z
nb2N nb = int2N (evalNB nb) -- Esto parece medio shortcut...

n2nb :: N -> NBin
n2nb Z     = [O]
n2nb (S n) = succNB (n2nb n)