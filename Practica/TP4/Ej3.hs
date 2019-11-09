doble :: Integer -> Integer
doble x = 2 * x

twice :: (a -> a) -> a -> a
twice = \f -> \x -> f (f x)

-- twice doble
-- Es una funcion que recibe un Integer x y le aplica dos veces doble, o sea queda
-- doble doble x
-- Esto es equivalente a hacer 2 * (2 * x), o sea 4 * x


-- twice doble 2
-- Esto queda 8 por lo explicado en el punto anterior


-- twice
-- La funcion twice recibe una funcion f que devuelva el mismo tipo de dato que recibe y
-- un dato en el cual evaluar a esa f, luego la aplica dos veces