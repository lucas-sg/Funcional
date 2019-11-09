import Data.Bits

sauronic :: Int -> Bool
sauronic n
    | and' (dividesTo 4 (rem n 100)) (rem n 100 /= 0) = True
    | otherwise = dividesTo 400 n

dividesTo :: Int -> Int -> Bool
dividesTo a b = mod b a == 0

and' :: Bool -> Bool -> Bool
and' a b = (.&.) a b