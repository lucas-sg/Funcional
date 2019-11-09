-- (f . g) x = f (g x)

doble :: Num a => a -> a
doble x = ((x + ) . (x + )) 0

cuadruple :: Num a => a -> a
cuadruple x = (doble . doble) x
-- No me acuerdo como era twice
-- Ni que era many