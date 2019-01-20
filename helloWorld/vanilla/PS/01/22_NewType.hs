newtype CustomerId = CustomerId Int

customer :: CustomerId
customer = CustomerId 13

customerToInt :: CustomerId -> Int
customerToInt(CustomerId i) = i

customerInt = customerToInt customer
