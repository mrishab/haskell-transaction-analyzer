module Query (totalByCategory) where

import Data.List (foldr')
import Transaction

totalByCategory :: [Transaction] -> [(String, Double)]
totalByCategory transactions = foldr addToTotal [] transactions
  where
    addToTotal (Transaction _ category amount _) totals =
      case lookup category totals of
        Just total -> (category, total + amount) : filter ((/= category) . fst) totals
        Nothing -> (category, amount) : totals
