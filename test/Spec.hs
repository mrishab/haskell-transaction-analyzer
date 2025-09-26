import Test.Tasty
import Test.Tasty.HUnit
import Test.Tasty.QuickCheck

import Filters
import TestData
import Transaction

main :: IO ()
main = defaultMain tests

tests :: TestTree
tests = testGroup "All Tests"
    