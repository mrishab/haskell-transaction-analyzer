module Main (main) where

import Data (transactions)
import Filters (filterAfterDate, filterByCategory, filterByMinAmount)
import Format (formatSummary, formatTransactions)
import Summarizer (totalByCategory)

p :: String -> IO ()
p s = putStrLn (s ++ "\n")

main :: IO ()
main = do
  p "\nAll transctions "
  p (formatTransactions transactions)

  p "----------------"

  let bigFood = filterByMinAmount 10 (filterByCategory "Food" transactions)
  p "Food transactions over 10: "
  p (formatTransactions bigFood)

  let after10thTrans = filterAfterDate "2024-03-10" transactions
  p "Transactions occuring after 10th March 2024: "
  p (formatTransactions after10thTrans)

  p "Totals by category :"
  p (formatSummary (totalByCategory transactions))
