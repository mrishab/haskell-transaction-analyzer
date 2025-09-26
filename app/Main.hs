module Main where

import Format (formatTransactions)
import Filters
import Transaction
import Data

main :: IO ()
main = do
  putStrLn "yes"
  print transactions

-- let bigFood = filterByMinAmount 10 ( filterByCategory " Food " sampleTransactions )
-- putStrLn " Food ␣ transactions ␣ over ␣ 10: "
-- putStrLn ( formatTransactions bigFood )

-- putStrLn " Totals ␣ by ␣ category : "
-- print ( totalByCategory sampleTransactions )
