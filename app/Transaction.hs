module Transaction where

data Transaction = Transaction
  { tDate :: String,
    tCategory :: String,
    tAmount :: Double,
    tNote :: String
  }
  deriving (Show, Eq)

data Summary = Summary
  { sCategory :: String,
    sTotals :: Double
  }
  deriving (Show, Eq)

