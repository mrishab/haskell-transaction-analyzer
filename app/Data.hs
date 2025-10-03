module Data (transactions) where

import Transaction

transactions :: [Transaction]
transactions =
  [ 
    Transaction "2024-03-01" "Food" 12.50 "Lunch at cafe",
    Transaction "2024-03-02" "Travel" 120.00 "Taxi and train",
    Transaction "2024-03-02" "Travel" 50.00 "Edison's car",
    Transaction "2024-03-04" "Food" 7.80 "Coffee",
    Transaction "2024-03-05" "Entertainment" 35.00 "Movie night",
    Transaction "2024-03-06" "Utilities" 80.25 "Electricity bill",
    Transaction "2024-03-07" "Groceries" 95.60 "Weekly groceries",
    Transaction "2024-03-08" "Health" 45.00 "Pharmacy visit",
    Transaction "2024-03-09" "Housing" 950.00 "Monthly rent",
    Transaction "2024-03-10" "Food" 24.30 "Family dinner",
    Transaction "2024-03-11" "Travel" 15.75 "Bus pass",
    Transaction "2024-03-12" "Education" 60.00 "Online course",
    Transaction "2024-03-13" "Shopping" 110.40 "Clothing purchases",
    Transaction "2024-03-14" "Utilities" 45.90 "Water bill",
    Transaction "2024-03-15" "Entertainment" 22.00 "Concert livestream",
    Transaction "2024-03-16" "Health" 75.00 "Dental checkup",
    Transaction "2024-03-17" "Savings" 150.00 "Emergency fund deposit",
    Transaction "2024-03-18" "Charity" 30.00 "Local shelter donation"
  ]
