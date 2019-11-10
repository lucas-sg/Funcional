module Ej2 where

data DigBin = O | I
    deriving Show

dbAsInt :: DigBin -> Int
dbAsInt O = 0
dbAsInt I = 1

dbAsBool :: DigBin -> Bool
dbAsBool O = False
dbAsBool I = True

dbOfBool :: Bool -> DigBin
dbOfBool False = O 
dbOfBool True = I

negDB :: DigBin -> DigBin
negDB O = I
negDB I = O