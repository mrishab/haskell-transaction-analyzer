import Filters
import Test.Tasty
import Test.Tasty.HUnit
import Test.Tasty.QuickCheck
import TestData
import Transaction

main :: IO ()
main = defaultMain tests

tests :: TestTree
tests =
  testGroup
    "All Tests"
    [ testGroup
        "Filters Tests"
        [ testGroup
            "filterByCategory Tests"
            [ testCase "filterByCategory returns transaction with Food category" $
                assertEqual
                  "Expected Food transaction"
                  [ Transaction " 2024-03-01 " "Food" 12.50 "Lunch at cafe",
                    Transaction " 2024-03-04 " "Food" 7.80 "Coffee"
                  ]
                  (filterByCategory "Food" testTransactions),
              testCase "filterByCategory returns empty list for non-existing category" $
                assertEqual
                  "Expected empty list"
                  []
                  (filterByCategory "Entertainment" testTransactions)
            ],
          testGroup
            "filterByMinAmount Tests"
            [ testCase "filterByMinAmount returns transactions greater than 10.0" $
                assertEqual
                  "Expected transactions with amount > 10.0"
                  [ Transaction " 2024-03-01 " "Food" 12.50 "Lunch at cafe",
                    Transaction " 2024-03-02 " "Travel" 120.00 "Taxi and train"
                  ]
                  (filterByMinAmount 10.0 testTransactions),
              testCase "filterByMinAmount returns empty list for high threshold" $
                assertEqual
                  "Expected empty list"
                  []
                  (filterByMinAmount 200.0 testTransactions)
            ]
        ]
    ]
