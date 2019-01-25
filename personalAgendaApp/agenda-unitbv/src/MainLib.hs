module MainLib
    ( mainPrompt
    ) where

import System.IO
import Control.Monad
import Data.List
--import Data.DateTime

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
    myAgenda <- readFile "data/__currentAgenda.txt"
    putStrLn "--------------------------------"
    putStrLn myAgenda
    putStrLn "Enter agenda option"
    putStrLn "1 - Your information"
    putStrLn "2 - Contacts"
    putStrLn "3 - Events"
    putStrLn "4 - Clear agenda"
    putStrLn "0 - Exit Agenda"
    userOption <- getLine
    actionResult <- performAgendaInsidePromptAction  userOption agendaInsidePrompt myAgenda
    putStrLn actionResult
    return actionResult

agendaOwnerDetailsPrompt :: IO (String) 
agendaOwnerDetailsPrompt = do
    myAgenda <- readFile "data/__currentAgenda.txt"
    putStrLn ""
    putStrLn "Owner management"
    putStrLn "1 - Update owner information"
    putStrLn "2 - List owner information"
    putStrLn "0 - Main menu"
    userOption <- getLine
    actionResult <- performAgendaOwnerDetailsAction  userOption agendaOwnerDetailsPrompt myAgenda
    return actionResult     

agendaEventsPrompt :: IO (String)
agendaEventsPrompt = do
    myAgenda <- readFile "data/__currentAgenda.txt"
    putStrLn ""
    putStrLn "Inner agenda management"
    putStrLn "1 - Show all events"
    putStrLn "2 - Add event"
    putStrLn "3 -  Clear agenda"
    putStrLn "0 - Main menu"
    userOption <- getLine
    actionResult <- performAgendaEventAction  userOption agendaOwnerDetailsPrompt myAgenda
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

performAgendaInsidePromptAction :: String -> IO (String) -> String -> IO (String)
--Owner management options
performAgendaInsidePromptAction "1" agendaInsidePrompt agendaName = do
    agendaOwnerDetailsPrompt
    return "Listing owner management options"

--Owner management options
performAgendaInsidePromptAction "3" agendaInsidePrompt agendaName = do
    agendaEventsPrompt
    return "Listing curent agenda options"


performAgendaInsidePromptAction "0" agendaInsidePrompt agendaName = do
    mainPrompt
    return "Choose another action"    
    
performAgendaOwnerDetailsAction  :: String -> IO (String) -> String -> IO (String)
--Manage owner details
performAgendaOwnerDetailsAction "1" agendaOwnerDetailsPrompt agendaName = do
    putStrLn "Your First Name:"
    fn <- getLine 
    putStrLn "Your Last Name:"
    ln <- getLine 
    putStrLn "Your Age:"
    ageAsString <- getLine
    let ag = read ageAsString :: Int
    putStrLn "Your Phone:"
    ph <- getLine
    putStrLn "Your Email:"
    em <- getLine 
    let agendaOnwer = Person {fname = fn, lname = ln, age = ag, phone = ph, email = em}
    let ownerToString = personToString (agendaOnwer)
    writeFile ("data/"++ agendaName ++ "-owenrinfo.txt") (ownerToString) 
    
    agendaOwnerDetailsPrompt
    return "Owner information updated"
 
performAgendaOwnerDetailsAction "2" agendaOwnerDetailsPrompt agendaName = do
    putStrLn "Listing your information:"
    let lines = readLines ("data/"++ agendaName ++ "-owenrinfo.txt")
    linesList <- lines
    let result = intercalate " " linesList
    putStrLn result
    putStrLn "------------------------------------------"
    agendaOwnerDetailsPrompt
    return "Owner information listed"   

 
performAgendaOwnerDetailsAction "0" agendaOwnerDetailsPrompt agendaName = do
    agendaInsidePrompt
    return "Perform another action inside agenda"   

performAgendaEventAction :: String -> IO (String) -> String -> IO (String)    
--listin all events in agenda
performAgendaEventAction "1" agendaEventsPrompt agendaName = do
    putStrLn "Listing all evemts:"
    let lines = readLines ("data/"++ agendaName ++ "-agenda.txt")
    linesList <- lines
    let result = intercalate " " linesList
    putStrLn result
    putStrLn "------------------------------------------"
    agendaEventsPrompt
    return "Event added to agenda"
 
performAgendaEventAction "2" agendaEventsPrompt agendaName = do
    putStrLn "Event Id:"
    eidString <- getLine
    let id = read eidString :: Int
    putStrLn "Event name:"
    n <- getLine
    putStrLn "Event locations:"
    l <- getLine 
    let newEvent = Event {eid = id, name = n, location = l}
    let myEventToString = eventToString (newEvent)
    appendFile ("data/"++ agendaName ++ "-agenda.txt") (myEventToString)
    
    agendaEventsPrompt
    return "Added new event to agenda"

createDatabase :: String -> IO ()
createDatabase filename = do
    appendFile ("data/_availableAgendas.txt") (filename ++ "\n")  
    writeFile ("data/"++ filename ++ "-agenda.txt") ("")  
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

data Event = Event {  eid :: Int
                    , name :: String
                    , location :: String
                    }    

eventToString (Event {eid = id, name = n, location = l}) =
    "eid: " ++ show id ++ " , name: " ++ n ++ " , location: " ++ l

    