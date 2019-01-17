module Lib
    ( someFunc
    ) where

someFunc :: IO ()
helloWorld = "Hello " ++ "World"
someFunc = putStrLn helloWorld
