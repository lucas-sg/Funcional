length' :: [a] -> Int
length' [] = 0
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
subset' (x:xs) l = elem' x l && subset' xs l

(+-+) :: [a] -> [a] -> [a]
(+-+) [] l = l
(+-+) (x:xs) l = x:(xs +-+ l)

reverse' :: [a] -> [a]
reverse' [] = []
reverse' (x:xs) = reverse' xs ++ [x]

zip' :: [a] -> [b] -> [(a, b)]
zip' [] _ = []
zip' (x:xs) l = 
    if (length' l > 0)
        then let (y:ys) = l
             in (x, y):(zip' xs ys)
    else []

unzip' :: [(a, b)] -> ([a], [b])
unzip' [] = ([], [])
unzip' (x:xs) = let p = unzip' xs
                in let pa = (fst x):(fst p)
                       pb = (snd x):(snd p)
                   in (pa, pb)
