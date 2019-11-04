length' :: [a] -> Int
lenght' [] = 0
length' (x:xs) = 1 + length' xs

sum' :: [Int] -> Int
sum' [] = 0
sum' (x:xs) = x + sum' xs

product' :: [Int] -> Int
product' [] = 1
product' (x:xs) = x * product' xs

concat' :: [[a]] -> [a]
concat' [] = []
concat' (x:xs) = x ++ concat' xs

elem' :: Eq a => a -> [a] -> Bool
elem' _ [] = False
elem' e (x:xs) = e == x || elem' e xs

all' :: (a -> Bool) -> [a] -> Bool
all' _ [] = True
all' f (x:xs) = f x && all' f xs

any' :: (a -> Bool) -> [a] -> Bool
any' _ [] = False
any' f (x:xs) = f x || all' f xs

count' :: (a -> Bool) -> [a] -> Int
count' _ [] = 0
count' f (x:xs) =
    if f x
    then 1 + count' f xs
    else count' f xs

subset' :: Eq a => [a] -> [a] -> Bool
subset' [] _ = True
subset' _ [] = False
subset' (x:xs) (y:ys) =
    if x == y
    then subset' xs (y:ys)
    else subset' (x:xs) ys

(+-+) :: [a] -> [a] -> [a]
(+-+) [] l = l
(+-+) (x:xs) l = x:((+-+) xs l)

reverse' :: [a] -> [a]
reverse' [] = []
reverse' (x:xs) = reverse' xs ++ [x]

zip' :: [a] -> [b] -> [(a, b)]
zip' [] [] = []
zip' (x:xs) (y:ys) = (x, y):(zip' xs ys)

unzip' :: [(a, b)] -> ([a], [b])
unzip' [] = []
-- ??? Check