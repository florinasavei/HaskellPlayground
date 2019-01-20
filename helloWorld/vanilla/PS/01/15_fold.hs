result1 = foldl (+) 0 [1,2,3,4]

showPlus s x = "(" ++ s ++ "+" ++ (show x) ++ ")"
result2 = showPlus "(1+2)" 3

result3 = foldr (+) 0 [1,2,3,4]
