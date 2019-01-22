module MainLib
    ( mainPrompt
    ) where

mainPrompt :: IO (String)
mainPrompt = do
    putStrLn "Enter your option"
    putStrLn "1 - Create New Agenda"
    putStrLn "2 - Load Agenda"
    putStrLn "3 - Delete Agenda"
    userOption <- getLine
    let actionResult = performPromtAction  userOption
    return actionResult

performPromtAction  :: String -> String
performPromtAction userOption = case (userOption) of
    "1" -> 
         "Creating new agenda"
    "2" -> 
         "Loading Agenda"

        