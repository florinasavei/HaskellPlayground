removeOdd [] = []
removeOdd (x : xs)
    | mod x 2 == 0 = x : (removeOdd xs)
    | otherwise    = removeOdd xs
    
numsEven nums =
    let evenNums = removeOdd nums
    in length evenNums