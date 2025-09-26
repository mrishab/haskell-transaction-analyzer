module Format (formatTransactions) where

import Summarizer (Summary)
import Transaction

createDivider :: String -> String
createDivider s = replicate (length s) '-'

padValue :: Int -> String -> String
padValue size val =
  let valLen = length val
      paddingReq = max 0 (size - valLen)
      paddingStr = replicate paddingReq ' '
   in val ++ paddingStr

formatTransactions :: [Transaction] -> String
formatTransactions txs =
  unlines (header : createDivider header : map formatRow txs)
  where
    header = "Date         | Category     | Amount       | Note"
    paddingSize = 12
    formatRow t =
      padValue paddingSize (tDate t)
        ++ " | "
        ++ padValue paddingSize (tCategory t)
        ++ " | "
        ++ padValue paddingSize (show (tAmount t))
        ++ " | "
        ++ tNote t

formatSummary :: [[Summary]] -> String
formatSummary s = undefined
