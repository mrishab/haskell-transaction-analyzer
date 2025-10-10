module Main(main) where

import Data(transactions)
import Filters(filterByCategory, filterByMinAmount, filterAfterDate)
import Format (formatTransactions, formatSummary)
import Summarizer (totalByCategory)

main :: IO ()
main = do
  putStrLn "\nAll transactions \n"
  putStrLn (formatTransactions transactions)

  let bigFood = filterByMinAmount 10 (filterByCategory "Food" transactions)
  putStrLn "Food transactions over 10: \n"
  putStrLn (formatTransactions bigFood)

  let after10th = filterAfterDate "2024-03-10" transactions
  putStrLn "Transactions occurring after 10th March 2024: \n"
  putStrLn (formatTransactions after10th)

  putStrLn "Totals by category: \n"
  putStrLn (formatSummary (totalByCategory transactions))
