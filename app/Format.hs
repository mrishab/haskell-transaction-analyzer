module Format (formatTransactions) where

import Transaction

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
