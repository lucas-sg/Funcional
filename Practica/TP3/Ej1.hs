-- a)
-- -- 1
ejA1a True True = True
ejA1A _ _ = False

ejA1b False False = False
ejA1b _ _ = True

-- -- 2
ejA2a x y = x
-- no se me ocurre otro ejemplo

-- -- 3
ejA3a f g x = (y, z)
    where y = f x
          z = g x

-- -- 4
ejA4a x y = x + y

ejA4b x y = x - y

-- -- 5
ejA5a f x = f (x + 1) - 1
ejA5b f x = f (x - 1) * 2

-- -- 6
ejA6a f x y = f y x