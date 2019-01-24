data Expression = Number Int
                | Add Expression Expression
                | Substract Expression Expression
                deriving (Eq, Ord, Show)

calculate :: Expression -> Int
calculate (Number x) = x                