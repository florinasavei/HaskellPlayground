module Main where

import MainLib

main :: IO ()
main = do
    result <- mainPrompt
    putStrLn "Program completed!"
