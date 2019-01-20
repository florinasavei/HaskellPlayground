double nums = case nums of
    []          -> []
    (x : xs)    -> (2*x) : (double xs)

removeOdd [] = []
removeOdd (x : xs)
    | mod x 2 == 0 = x : (removeOdd xs)
    | otherwise    = removeOdd xs
    
anyEven nums = case (removeOdd nums) of
    []      -> False
    (x : xs) -> True    