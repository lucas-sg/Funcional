-- a
ejA1 = True
ejA2 = False

-- b
ejB1 = (2, 3)

a = 5
b = 1
ejB2 = (a, b)

-- c
ejC1 :: Char -> Int
ejC1 c = 10

-- d
ejD :: (Int, Char) -> Bool
ejD (x, c) = True

-- e
ejE :: (Int -> Int) -> Int
ejE f = f 5

-- f
ejF :: Bool -> Bool
ejF var = True
ejF' = (ejF, 5)

-- g
ejG :: a -> Bool
ejG a = True

-- h
ejH :: c -> c
ejH c = c