notNull xs = not (null xs)
result1 = filter notNull ["", "abc", "", "hello", ""]

isEven x = x `mod` 2 == 0
removeOdd = filter isEven
result2 = removeOdd [1,2,3,4,5,6,7,8,9]

extractTrue xs = map snd (filter fst xs)
result3 = extractTrue [(True,1), (False,7), (True,11)]