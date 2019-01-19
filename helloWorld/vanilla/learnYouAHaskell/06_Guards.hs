noVowels :: [Char] -> [Char]
noVowels "" = ""
noVowels (x:xs)
         | x `elem` "aeiouAEIOU" = noVowels xs
         | otherwise             = x : noVowels xs