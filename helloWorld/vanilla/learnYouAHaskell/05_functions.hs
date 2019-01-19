isIncreasing :: (Ord a) => [a] -> Bool
isIncreasing xs = if xs == []
                  then True
                  else if tail xs == []
                       then True
                       else if head xs <= head (tail xs)
                            then isIncreasing (tail xs)
                            else False
