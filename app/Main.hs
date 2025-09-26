module Main where

import Transaction

sampleTransactions :: [Transaction]
sampleTransactions =
  [ Transaction " 2024-03-01 " "Food" 12.50 "Lunch ␣ at ␣ cafe",
    Transaction " 2024-03-02 " "Travel" 120.00 "Taxi ␣ and ␣ train",
    Transaction " 2024-03-04 " "Food" 7.80 "Coffee"
  ]

formatTransactions :: [Transaction] -> String
formatTransactions txs =
  unlines (header : map formatRow txs)
  where
    header = " Date ␣ ␣ ␣ ␣ ␣ ␣ ␣ | ␣ Category ␣ ␣ ␣ | ␣ Amount ␣ ␣ | ␣ Note "
    formatRow t =
      tDate t
        ++ " ␣ | ␣ "
        ++ tCategory t
        ++ " ␣ | ␣ "
        ++ show (tAmount t)
        ++ " ␣ | ␣ "
        ++ tNote t

-- filterByCategory ::
-- filterByMinAmount ::
-- totalByCategory ::

main :: IO ()
main = do
  putStrLn "yes"
  print sampleTransactions

-- let bigFood = filterByMinAmount 10 ( filterByCategory " Food " sampleTransactions )
-- putStrLn " Food ␣ transactions ␣ over ␣ 10: "
-- putStrLn ( formatTransactions bigFood )

-- putStrLn " Totals ␣ by ␣ category : "
-- print ( totalByCategory sampleTransactions )
