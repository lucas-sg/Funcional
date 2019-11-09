-- a)
-- (3 == --3) && True
-- Es un error sintactico, deberia ser:
-- 3 == -(-3) && True
-- Cualquier cosa a la que se vea aplicada un numero negativo hace que el mismo
-- vaya entre parentesis

-- b)
-- 1 && 2 == 2
-- Error sintactico o de tipos, no se puede hacer un Int && algo

-- c)
-- 1 + if (’a’ < ’b’) then 3 else 5
-- Es correcto, da 4

-- d)
-- let par = (True, 4) in (if first par then first par else second par)
-- Error de tipos, esa expresion devolveria True para (True, x) y
-- devolveria x para (False, x)

-- e)
-- (a + 23); b + 4
-- Creo que el error es sintactico, no existe el ; para delimitar expresiones