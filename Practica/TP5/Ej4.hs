data Medida = Mm Float
    | Cm Float
    | Inch Float 
    | Foot Float

asMm :: Medida -> Medida
asMm Mm u = u * 1 
asMm Cm u = u * 10
asMm Inch u = u * 25.4
asMm Foot u = u * 304.8

asCm :: Medida -> Medida
-- ...

asInch :: Medida -> Medida
-- ...

asFoot :: Medida -> Medida
-- ...