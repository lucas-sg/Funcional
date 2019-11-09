-- a)
-- Esta bien porque else recibe una sola expresion, y power4 2 es una sola expresion
ejA = if (seven 'a' < 1) then 5 else power4 2
seven _ = 7
power4 x = x * x * x * x

-- b)
-- Tira error porque la expresion es if ... then ... else ...
-- ejB = if False then True
ejB = if False then True else False

-- c)
-- ????? No vimos el := y no lo vamos a ver en esta materia
-- a := 4

-- c)
-- Es un error de tipos, primero esta comparando x como si fuera un numero y
-- despues como si fuera un booleano
-- ejC x = (1 < x && x < 100) || x == True || x == False

-- d)
-- Todo bien
ejD = False == (1 < 3)

-- e)
-- Error sintactico, tendria que ser 1 < x && x < 3
-- ejE = 1 < x < 3
ejE x = 1 < x && x < 3