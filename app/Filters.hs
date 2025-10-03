module Filters (filterByCategory, filterByMinAmount) where

import Transaction

filterByCategory :: String -> [Transaction] -> [Transaction]
filterByCategory category = filter (\t -> category == getCategory t)
  where
    getCategory (Transaction _ c _ _) = c

filterByMinAmount :: Double -> [Transaction] -> [Transaction]
filterByMinAmount minAmount = filter (\t -> getAmount t >= minAmount)
  where
    getAmount (Transaction _ _ a _) = a
