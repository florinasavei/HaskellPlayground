newtype CustomerId = CustomerId Int

data Customer = Customer CustomerId String Int

alice :: Customer
alice = Customer (CustomerId 13) "Alice" 42

getCustomerId :: Customer -> CustomerId
getCustomerId (Customer cust_id _ _) = cust_id


data DialogResponse = Yes | No | Help | Quit
