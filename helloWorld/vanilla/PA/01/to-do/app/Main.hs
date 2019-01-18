module Main where

import Options.Applicative    

import Lib

itemIndexParser :: Parser IntemIndex
itemIndexParser = arguments auto

main :: IO ()
main = someFunc
