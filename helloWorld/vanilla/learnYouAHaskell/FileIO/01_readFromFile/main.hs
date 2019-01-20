import System.IO  
  
main = do  
    handle <- openFile "hello.txt" ReadMode  
    contents <- hGetContents handle  
    putStr contents  
    hClose handle  