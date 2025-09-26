module Summarizer where

import Data.List (groupBy, sortOn)
import Transaction

    ---CatogortiesTotal :: 
    ---groupByCategory ::
    ---sumCategory ::
    ---sortCategories ::
    
    
    sortCategories :: [Transaction] -> [[Transaction]]
    sortCategories xs = sortOn tCategory Transaction


    
    groupByCategory :: [Transaction] -> [[Transaction]]
    groupByCategory xs = 





    sumCategory :: [Transaction] -> (String, Double)
    sumCategory 