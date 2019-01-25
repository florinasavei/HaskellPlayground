data Person = Person{ fname :: String
                    , lname :: String
                    , age :: Int
                    , phone :: String
                    , email :: String
                    } deriving (Eq,Ord,Show,Read)


showPerson :: Person -> String
showPerson (Person {fname = fn, lname = ln, age = ag, phone = ph, email = em}) =
    fn ++ " " ++ ln ++ " , age: " ++ show ag ++ " , phone: " ++ ph ++ " , email: " ++ em ++ " \n"


--let myPerson = Person { fname = "Florin", lname = "Asavei", age = 27, phone = "0752189098", email = "asaveiflorin@gmail.com" }

