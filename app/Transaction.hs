module Transaction where

data Transaction = Transaction
  { tDate :: String,
    tCategory :: String,
    tAmount :: Double,
    tNote :: String
  }
  deriving (Show, Eq)
