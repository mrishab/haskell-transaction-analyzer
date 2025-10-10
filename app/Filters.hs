module Filters(filterByCategory, filterByMinAmount, filterBeforeDate, filterAfterDate) where

import Transaction(Transaction(..))

filterByCategory :: String -> [Transaction] -> [Transaction]
filterByCategory category = filter (\t -> category == getCategory t)
  where
    getCategory (Transaction _ c _ _) = c

filterByMinAmount :: Double -> [Transaction] -> [Transaction]
filterByMinAmount minAmount = filter (\t -> getAmount t >= minAmount)
  where
    getAmount (Transaction _ _ a _) = a

filterBeforeDate :: String -> [Transaction] -> [Transaction]
filterBeforeDate date = filter (\t -> getDate t < date)
  where
    getDate (Transaction d _ _ _) = d

filterAfterDate :: String -> [Transaction] -> [Transaction]
filterAfterDate date = filter (\t -> getDate t > date)
  where
    getDate (Transaction d _ _ _) = d
