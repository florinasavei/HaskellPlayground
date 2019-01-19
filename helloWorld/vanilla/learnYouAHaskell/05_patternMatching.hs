noVowels :: [Char] -> [Char]
noVowels word = if word == ""
                then ""
                else if head word `elem` "aeiouAEIOU"
                     then noVowels (tail word)
                     else (head word) : noVowels (tail word)


noVowelsPM :: [Char] -> [Char]
noVowelsPM "" = ""
noVowelsPM (x:xs) = if x `elem` "aeiouAEIOU"
                    then noVowelsPM xs
                    else x : noVowelsPM xs 
                    
isIt7 :: Int -> [Char]
isIt7 7= "7 o'clock ... SHARKNADO!"
isIt7 n = show n ++ " o'clock and all's well"  

isCase7 :: Int -> [Char]
isCase7 n = show n++ " o'clock and " ++ case n of 7 -> " ... SHARKNADO!"
                                                  _ -> "all's well."