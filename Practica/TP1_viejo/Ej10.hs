import Data.Bits

-- ver con max y con min
sort3 :: Int -> Int -> Int -> (Int, Int, Int)
sort3 x y z
    | and' (x <= y) (y <= z) = (x, y, z)
    | and' (x <= z) (z <= y) = (x, z, y)
    | and' (y <= x) (x <= z) = (y, x, z)
    | and' (y <= z) (z <= x) = (y, z, x)
    | and' (z <= x) (x <= y) = (z, x, y)
    | otherwise = (z, y, x)

and' :: Bool -> Bool -> Bool
and' a b = (.&.) a b