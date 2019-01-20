length2 :: [a] -> Int
length2 [] = 0
length2 (x:xs) = length2 xs + 1