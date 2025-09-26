module Data (transactions) where

import Transaction

transactions :: [Transaction]
transactions =
  [ Transaction "2024-03-01" "Food" 12.50 "Lunch at cafe",
    Transaction "2024-03-02" "Travel" 120.00 "Taxi and train",
    Transaction "2024-03-04" "Food" 7.80 "Coffee"
  ]
