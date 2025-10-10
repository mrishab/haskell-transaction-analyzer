module Main(main) where

import Data(transactions)
import Filters(filterByCategory, filterByMinAmount, filterAfterDate)
import Format (formatTransactions)
import Summarizer (totalByCategory)

main :: IO ()
main = do
  putStrLn "\nAll transactions \n"
  putStrLn (formatTransactions transactions)

  putStrLn "----------------\n"

  let bigFood = filterByMinAmount 10 (filterByCategory "Food" transactions)
  putStrLn "Food transactions over 10: \n"
  putStrLn (formatTransactions bigFood)

  let after10thTrans = filterAfterDate "2024-03-10" transactions
  putStrLn "Transactions occuring after 10th March 2024: \n"
  putStrLn (formatTransactions after10thTrans)

  putStrLn "Totals by category : "
  putStrLn (totalByCategory transactions)
