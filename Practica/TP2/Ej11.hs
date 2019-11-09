-- a)
-- smaller (x,y,z)
--    | x <= y && x <= z = x
--    | y <= x && y <= z = y
--    | z <= x && z <= y = z
smaller :: Int -> Int -> Int -> Int
-- smaller = \x -> \y -> \z -> min x (min y z)
smaller = \x -> \y -> \z ->
    if x <= y && x <= z then x
    else if y <= x && y <= z then y
    else if z <= x && z <= y then z
    else error "esto no puede pasar"

-- b)
second x = \y -> y

-- c)
-- andThen True y = y
-- andThen False y = False
andThen True = \y -> y
andThen False = \y -> False