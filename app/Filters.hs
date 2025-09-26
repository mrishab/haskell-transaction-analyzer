module Filters(filterByCategory, filterByMinAmount) where
    import Transaction

    filterByCategory :: String -> [Transaction] -> [Transaction]
    filterByCategory category transactions = filter (\t -> category == getCategory t) transactions
    where
        getCategory (Transaction _ c _ _) = c

    filterByMinAmount :: Double -> [Transaction] -> [Transaction]
    filterByMinAmount minAmount transactions = filter (\t -> minAmount < getAmount t) transactions
    where
        getAmount (Transaction _ _ a _) = a

    
