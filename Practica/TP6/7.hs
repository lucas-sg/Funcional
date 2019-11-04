-- (f . g) x = f (g x)

doble x = ((x + ) . (x + )) 0
cuadruple x = (doble . doble) x
-- No me acuerdo como era twice
-- Ni que era many