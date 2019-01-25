module MainLib
    ( mainPrompt
    ) where

import System.IO
import Control.Monad
import Data.List

mainPrompt :: IO (String)
mainPrompt = do
    putStrLn ""
    putStrLn "Enter your option (main menu)"
    putStrLn "1 - Create New Agenda"
    putStrLn "2 - Load Agenda"
    putStrLn "3 - Delete Agenda"
    putStrLn "0 - Exit Program"
    userOption <- getLine
    actionResult <- performMainPromptAction  userOption mainPrompt
    putStrLn actionResult
    return actionResult

agendaInsidePrompt  :: IO (String)  
agendaInsidePrompt = do
    --let myAgenda = do readFile "data/__currentAgenda.txt"
    --currentAgenda <- return myAgenda
    putStrLn ""
    --putStrLn "Enter agenda " ++ currentAgenda ++ " option"
    putStrLn "1 - Your information"
    putStrLn "2 - Contacts"
    putStrLn "3 - Events"
    putStrLn "4 - Clear agenda"
    putStrLn "0 - Exit Agenda"
    userOption <- getLine
    actionResult <- performAgendaInsidePromptAction  userOption agendaInsidePrompt
    putStrLn actionResult
    return actionResult

agendaOwnerDetailsPrompt :: IO (String) 
agendaOwnerDetailsPrompt = do
    putStrLn ""
    putStrLn "Owner management"
    putStrLn "1 - Update owner information"
    putStrLn "2 - List owner information"
    putStrLn "0 - Main menu"
    userOption <- getLine
    actionResult <- performAgendaOwnerDetailsAction  userOption agendaOwnerDetailsPrompt
    --putStrLn actionResult
    return actionResult     


performMainPromptAction :: String -> IO (String) -> IO (String)
--Creating Agenda
performMainPromptAction "1" mainPrompt = do
    putStrLn "Enter agenda name:"
    agendaName <- getLine
    createDatabase  agendaName
    let result = "Creating agenda " ++ agendaName ++ " completed!"
    mainPrompt
    return result

--Listing Agendas 
performMainPromptAction "2" mainPrompt = do
    putStrLn "Available agendas: "
    listAllAvailableAgendas
    putStrLn "Enter agenda name to load:"
    agendaName <- getLine
    writeFile ("data/__currentAgenda.txt") (agendaName) 
    let result = "Loded " ++ agendaName ++ " agenda"
    agendaInsidePrompt
    return result

performMainPromptAction "0" mainPrompt = do
    return "Goodby!"    

performAgendaInsidePromptAction :: String -> IO (String) -> IO (String)
--Owner management options
performAgendaInsidePromptAction "1" agendaInsidePrompt = do
    agendaOwnerDetailsPrompt
    return "Listing owner management options"

performAgendaInsidePromptAction "0" agendaInsidePrompt = do
    mainPrompt
    return "Choose another action"    
    
performAgendaOwnerDetailsAction  :: String -> IO (String) -> IO (String)
--Manage owner details
performAgendaOwnerDetailsAction "1" agendaOwnerDetailsPrompt = do
    putStrLn "Your First Name:"
    firstName <- getLine 
    putStrLn "Your lat Name:"
    lastName <- getLine 
    agendaOwnerDetailsPrompt
    return "Owner information updated"
 
performAgendaOwnerDetailsAction "2" agendaOwnerDetailsPrompt = do
    putStrLn "Listing your information:"
    agendaOwnerDetailsPrompt
    return "Owner information listed"   

 
performAgendaOwnerDetailsAction "0" agendaOwnerDetailsPrompt = do
    agendaInsidePrompt
    return "Perform another action inside agenda"   
                

createDatabase :: String -> IO ()
createDatabase filename = do
    appendFile ("data/_availableAgendas.txt") (filename ++ "\n")  
    writeFile ("data/"++ filename ++ "-agenda.txt") ("Agenda " ++ filename ++ " : ")  
    writeFile ("data/"++ filename ++ "-owenrinfo.txt") ("")  

listAllAvailableAgendas :: IO ()
listAllAvailableAgendas = do
    let lines = readLines "data/_availableAgendas.txt"
    linesList <- lines
    let result = intercalate ", " linesList
    putStrLn result
    putStrLn "------------------------------------------"

readLines :: FilePath -> IO [String]
readLines = fmap lines . readFile

data Person = Person{ fname :: String
                    , lname :: String
                    , age :: Int
                    , phone :: String
                    , email :: String
                    } deriving (Eq,Ord,Show,Read)


personToString :: Person -> String
personToString (Person {fname = fn, lname = ln, age = ag, phone = ph, email = em}) =
    "fname: " ++ fn ++ " , lname: " ++ ln ++ " , age: " ++ show ag ++ " , phone: " ++ ph ++ " , email: " ++ em ++ " \n"

