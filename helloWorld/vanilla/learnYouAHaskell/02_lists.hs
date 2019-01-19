first10PowersOf2 = [2^n | n <- [1..10]]

first10PowersOf2Conditional = [2^n | n <- [1..10], 2^n >= 10, 2^n <100]

removeVowels = [x | x <- "outrageous", not(elem x "aeiou")]

removeVowelsFromList = [[x | x <- word, not(elem x "aeiou")] | word <- ["bell", "book", "candle"]]

calculteX = [[x*y | y <- [1..5]] | x <- [1..5]]

