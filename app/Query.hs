module Query(totalByCategory) where

    import Transaction
    import Data.List (foldr')

    totalByCategory :: [Transaction] -> [(String, Double)]
    totalByCategory transactions = foldr addToTotal [] transactions
    where
        addToTotal (Transaction _ category amount _) totals =
            case lookup category totals of
                Just total -> (category, total + amount) : filter ((/= category) . fst) totals
                Nothing    -> (category, amount) : totals``