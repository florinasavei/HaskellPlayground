str :: [Char]
str = "hello"

foo :: Int -> Int
foo x = 2 * x + 1

add3Int :: Int -> Int -> Int -> Int
add3Int x y z = x + y + z

x' = show (read "123" :: Double)