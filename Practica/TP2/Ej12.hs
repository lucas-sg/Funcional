-- a)
-- iff = \x -> \y -> if x then not y else y
iff x y = if x then not y else y

-- b)
-- alpha = \x -> \x -> x
-- Es lo mismo que alpha x = una funcion que recibe un parametro y lo devuelve.
-- Preguntar por que es que devuelve el segundo x, y no es lo mismo que hacer
-- alpha x = \x -> x   o sea lo mismo que hacia el second en el 11b de esta guia
-- Es decir, por que en este caso se entiende cual es el x y antes no
alpha x y = y