-- a)
-- first :: (a, b) -> a
first (x, y) = x

-- b)
-- second :: (a, b) -> b
second (x, y) = y

-- c)
-- const' :: a -> b -> a
const' x y = x

-- d)
-- compose :: (a -> b) -> (c -> d) -> a -> b
compose f g = (\x -> f (g x))

-- e)
-- apply :: (a -> b) -> a -> b
apply f x = f x

-- f)
-- subst :: (t1 -> t2 -> t3) -> (t1 -> t2) -> t1 -> t3
-- x :: t1
-- g :: t1 -> t2
-- f :: t1 -> t2 -> t3
subst f g x = f x (g x)

-- g)
-- x :: t1
-- y :: t2
-- f1 :: t2 -> t1
-- f2 :: t1 -> t2
-- pairFunc :: (t2 -> t1, t1 -> t2) -> t1 -> t2 -> (t1, t2)
pairFunc (f1, f2) x y = (f1 (f2 x), f2 (f1 y))