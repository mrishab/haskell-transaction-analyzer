module Format (formatTransactions) where

import Transaction

createDivider :: String -> String
createDivider s = do 
    let s_len = length s
    replicate s_len '-'




formatTransactions :: [Transaction] -> String
formatTransactions txs =
    unlines (header : createDivider header : map formatRow txs)
    where
    header = "Date       | Category     | Amount     | Note"
    formatRow t =
        tDate t
        ++ " | "
        ++ tCategory t
        ++ " | "
        ++ show (tAmount t)
        ++ " | "
        ++ tNote t
