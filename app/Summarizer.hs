module Summarizer where

import Data.List (groupBy, sortBy)
import Data.Ord (comparing)
import Format (formatSummary)
import Transaction

groupByCategory :: [Transaction] -> [[Transaction]]
groupByCategory = groupBy (\a b -> tCategory a == tCategory b) . sortBy (comparing tCategory)

sumCategory :: [[Transaction]] -> [Summary]
sumCategory =
  map
    ( \s ->
        let total = sum (map tAmount s)
            categoryName = tCategory (head s)
         in Summary {sCategory = categoryName, sTotals = total}
    )

totalByCategory :: [Transaction] -> String
totalByCategory ts = formatSummary (sumCategory (groupByCategory ts))
