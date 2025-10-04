# Project Report: COMP480 MiniProject 1

## Overview and Objectives
The goal of this mini-project is to build a small, idiomatic Haskell application that models personal finance transactions and supports:
- Filtering transactions by category, amount, and date
- Summarizing totals by category
- Presenting results in a simple tabular format
- Verifying core behavior with unit tests

This project addresses these objectives by:
- Defining clear data models (`Transaction`, `Summary`) in `Transaction.hs`
- Implementing pure, composable filters in `Filters.hs`
- Producing readable tables via `Format.hs`
- Computing category totals in `Summarizer.hs`
- Demonstrating the end-to-end flow in `Main.hs`
- Capturing example data in `Data.hs` and validating logic via `test/Spec.hs`

The code favors separation of concerns, referential transparency, and simple list processing patterns that are easy to reason about and test.

## Architecture and Data Model
- `Transaction.hs` defines:
  - `Transaction { tDate :: String, tCategory :: String, tAmount :: Double, tNote :: String }`
  - `Summary { sCategory :: String, sTotals :: Double }`
- `Data.hs` provides a curated list of sample `transactions` for demonstration.
- `Main.hs` wires the modules together to print:
  1) All transactions, 2) Food transactions over 10, 3) Transactions after a date, and 4) Totals by category.

Dates are represented as ISO strings (YYYY-MM-DD). This enables lexicographic comparison for simple before/after date filters without parsing, while keeping the implementation minimal.

## Key Functions and How They Work

### Filters (`Filters.hs`)
- `filterByCategory :: String -> [Transaction] -> [Transaction]`
  - Uses `filter` and pattern matching to compare the `tCategory` field.
- `filterByMinAmount :: Double -> [Transaction] -> [Transaction]`
  - Keeps transactions whose `tAmount >= minAmount`.
- `filterBeforeDate :: String -> [Transaction] -> [Transaction]`
  - Retains items where `tDate < date`. Because dates are ISO-formatted strings, lexicographic ordering aligns with chronological ordering.
- `filterAfterDate :: String -> [Transaction] -> [Transaction]`
  - Symmetric to `filterBeforeDate` using `>`.

All four are pure list transformations with linear complexity O(n).

### Formatting (`Format.hs`)
- `createDivider :: String -> String`
  - Produces a divider line of `-` matching the header length.
- `padValue :: Int -> String -> String`
  - Right-pads values with spaces to a fixed width; used for column alignment.
- `formatTransactions :: [Transaction] -> String`
  - Builds a table with header + divider + one row per transaction using `unlines`.
- `formatSummary :: [Summary] -> String`
  - Same pattern for category totals.

These functions are presentation-only and avoid side effects. They assume monospaced display for alignment.

### Summarization (`Summarizer.hs`)
- `groupByCategory :: [Transaction] -> [[Transaction]]`
  - Sorts by `tCategory` (`sortBy (comparing tCategory)`) then groups adjacent equal categories (`groupBy`). Sorting first is essential because `groupBy` only combines adjacent elements.
- `sumCategory :: [[Transaction]] -> [Summary]`
  - Maps each group to a `Summary` by summing `tAmount` and using the common category name from `head`.
- `totalByCategory :: [Transaction] -> String`
  - Pipeline: `groupByCategory` -> `sumCategory` -> `formatSummary`. Overall complexity O(n log n) due to sorting.

### Program Entry (`Main.hs`)
- Prints:
  1) All transactions via `formatTransactions transactions`
  2) Food transactions over 10 via `filterByCategory "Food"` + `filterByMinAmount 10`
  3) Transactions after `"2024-03-10"` via `filterAfterDate`
  4) Totals by category via `totalByCategory`

### Tests (`test/Spec.hs`, `test/TestData.hs`)
- Uses `tasty` and `tasty-hunit` for unit tests around filters:
  - `filterByCategory` returns expected Food transactions
  - `filterByCategory` returns empty for a non-existent category
  - `filterByMinAmount` thresholds behavior (> 10, and a high threshold)
- `Test.Tasty.QuickCheck` is imported but not used yet; it can be leveraged for property tests later.

## Challenges and How They Were Addressed

1) Grouping by Category Correctly
- Challenge: `groupBy` only groups adjacent equal elements; applying it directly on an unsorted list can produce multiple groups for the same category.
- Resolution: Sort by `tCategory` before `groupBy` using `sortBy (comparing tCategory)`.

2) Date Comparisons Without a Date Library
- Challenge: Implementing before/after date filters without pulling in `Data.Time` and parsers.
- Resolution: Standardize date strings as ISO (YYYY-MM-DD) so lexicographic comparisons (`<`, `>`) match chronological order. This keeps the implementation minimal and sufficient for the dataset.

3) Column Alignment in Text Output
- Challenge: Readable CLI tables require consistent widths.
- Resolution: Implement `padValue` to right-pad strings and combine with a consistent header and a `createDivider` sized to the header. This yields simple, legible tables in monospaced fonts.

4) Avoiding Over-Engineering in Summation
- Challenge: Early approaches can use maps/dictionaries or custom folds; these add complexity and dependencies.
- Resolution: Use sort + group + `sum` for clarity and correctness with standard library functions. This keeps the summarizer short and testable.

5) Testing Behavior Deterministically
- Challenge: Making assertions on lists is order-sensitive.
- Resolution: Filters preserve input order, and group/sum define a deterministic order (sorted by category). Unit tests target small hand-crafted datasets for clarity.

## Complexity and Performance
- Filtering: O(n)
- Summarization: O(n log n) due to sorting; summing is O(n)
- Formatting: O(n) over number of rows

For the data sizes typical of a mini-project or small personal dataset, this is more than sufficient.

## Limitations and Possible Enhancements
- Types
  - `tDate :: String` is convenient but brittle if formats vary. Convert to `Day` from `Data.Time` for robust comparisons.
  - `tAmount :: Double` is subject to floating-point rounding. Prefer `Data.Fixed` (`Centi`) or `Decimal`/`Rational` for currency.
- Formatting
  - Format amounts to two decimals (e.g., `printf "%.2f"`) and compute column widths from content for adaptive tables.
- Summarization
  - Provide an alternative implementation using `Map` for O(n log k) accumulation without sorting full lists.
- CLI UX
  - Add argument parsing (e.g., `optparse-applicative`) to filter by category/date/amount from the command line.
- Testing
  - Add QuickCheck properties (e.g., idempotence of `filterByMinAmount`, monotonicity properties, and that grouping preserves total amounts).

## How the Objectives Were Met
- Filtering by category, amount, date: Implemented in `Filters.hs` and demonstrated in `Main.hs`.
- Summarization by category: Implemented in `Summarizer.hs` and printed by `Main.hs`.
- Readable output: Implemented in `Format.hs` with headers and padding.
- Testing core behavior: Implemented in `test/Spec.hs` using `tasty` and `tasty-hunit`.

In sum, the project delivers a clean, modular Haskell solution to explore transaction filtering and summarization, with simple, testable components and clear pathways for future enhancements.
