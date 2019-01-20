result1 = zip [1,2] [3,4,5,6]
result2 = zipWith (+) [1,2,3] [4,5,6]

plus3 x y z = x + y +z
result3 = zipWith3 plus3 [1,2,3] [4,5,6] [7,8,9]