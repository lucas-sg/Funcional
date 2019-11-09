-- a)
-- twice f x = f (f x)
twice = \f -> \x -> f (f x)

-- b)
-- flip' f x y = f y x
flip' = \f -> \x -> \y -> f y x

-- c)
-- inc = (+1)
-- Preguntar por la notacion de una funcion sin argumentos y los parentesis esos
inc = \x -> x + 1
suma1 = (+) 1