module Summarizer where

import Data.List (groupBy, sortOn)
import Transaction

---CatogortiesTotal ::
---groupByCategory ::
---sumCategory ::
---sortCategories ::

data Summary = Summary
  { category :: String,
    totals :: Double
  }

sortCategories :: [Transaction] -> [[Transaction]]
sortCategories xs = undefined

groupByCategory :: [Transaction] -> [[Transaction]]
groupByCategory xs = undefined

sumCategory :: [Transaction] -> (String, Double)
sumCategory xs = undefined