newtype CustomerId = MakeCustomerId Int

data Customer = MakeCustomer
    {    customerId     :: CustomerId
    ,    name           :: String
    ,    luckyNumber    :: Int
    }

alice :: Customer

alice = MakeCustomer
    {   customerId = MakeCustomerId 13
    ,   name = "Alice"
    ,   luckyNumber = 42
    }

sally = alice {name = "Sally", luckyNumber = 84}    