seven _ = 7

twice f = g
    where g x = f (f x)

sign :: Int -> Int
-- sign x = if x > 0 then 1 else if x < 0 then -1 else 0
sign 0 = 0
sign x
    | x > 0 = 1
    | otherwise = -1


absolute :: Int -> Int
--absolute x
---   | sign x == -1  = -x
---   | otherwise = x
absolute x
    | x >= 0 = x
    | x < 0 = -x


and' :: Bool -> Bool -> Bool
-- and' a b = (.&.) a b
and' True True = True
and' _  _ = False

or' :: Bool -> Bool -> Bool
or' False False = False
or' _ _ = True

not' :: Bool -> Bool
not' True = False
not' False = True

xor' :: Bool -> Bool -> Bool
xor' True False = True
xor' False True = True
xor' _ _ = False

dividesTo :: Int -> Int -> Bool
dividesTo a b = mod b a == 0

isMultiple :: Int -> Int -> Bool
isMultiple a b = mod a b == 0

isCommonDivisor :: Int -> (Int, Int) -> Bool
isCommonDivisor a (b, c) = and' (dividesTo a b) (dividesTo a c)

isCommonMult :: Int -> (Int, Int) -> Bool
isCommonMult a (b, c) = and' (isMultiple a b) (isMultiple a c)

swap :: (a, b) -> (b, a)
swap (a, b) = (b, a)

-- curry :: ((Int, Int) -> Int) -> (Int -> (Int -> Int))
-- uncurry :: ((Int -> (Int -> Int)) -> ((Int, Int) -> Int))
curry' f = \x -> \y -> f (x, y)

uncurried :: (Int, Int) -> Int
uncurried (x, y) = x + y

uncurry' f = g
    where g (x, y) = f x y

curried :: Int -> (Int -> Int)
curried x y = x + y