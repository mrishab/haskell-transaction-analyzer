module Main where

import Data
import Filters
import Format (formatTransactions)
import Transaction

main :: IO ()
main = do
  putStrLn "yes"
  putStrLn (formatTransactions transactions)

-- let bigFood = filterByMinAmount 10 ( filterByCategory " Food " sampleTransactions )
-- putStrLn " Food transactions over 10: "
-- putStrLn ( formatTransactions bigFood )

-- putStrLn " Totals by category : "
-- print ( totalByCategory sampleTransactions )
