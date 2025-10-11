# Project Report: COMP481 MiniProject 1

## Team Information


| Student Name | Email | Student ID |
|---|---|---|
| Arnav Mehta (Team Lead) | arnav.mehta@student.ufv.ca | 300196365 |
| Tejas Pathange | tejas.pathange@student.ufv.ca | 300208898 |
| Soum Majumdar | soum.majumdar@student.ufv.ca | 300206855 |
| Rishab Manocha | rishab.manocha@student.ufv.ca | 300139589 |

## Contribution Summary

- **Arnav Mehta**: Took the lead on project setup, scaffolding and implemented the core logic including formatting, summary, filter functions, types and main function.
- **Tejas Pathange**: Assisted with code reviews, manual testing, bug fixes and testing end to end functionality.
- **Soum Majumdar**: Wrote the project report and documentation, organized team meetings, and made sure all the project objectives were covered.
- **Rishab Manocha**: Set up automated testing, implemented filter functions, improved the formatting functions, and improved code quality by implementing consistent and explicit import/exports, automated linting using ormolu, splitting up the code over multiple files and bug fixes.

---

## Overview

### Objectives

The goal of this mini-project is to build a small transaction analyzer program using Haskell that will process a set of transaction records and:

- Filter them by category, amount, and date
- Summarize the totals by category
- Present the results in a simple tabular format

### How we achieve them

- By clearly defining data models (`Transaction`, `Summary`) in `Transaction.hs`
- By writing pure, composable filters in `Filters.hs`
- By creating a readable output in a table format via `Format.hs`
- By calculating the category totals in `Summarizer.hs`
- By showing the end-to-end flow in `Main.hs`
- By capturing example data in `Data.hs` and validating logic via `test/Spec.hs`

The entire codebase is written in a way to keep each part separate, use clear logic, and follow simple list patterns that are easy to understand and test.

## Project structure and data design

Here’s what each file is responsible for:

- `Transaction.hs`: defines our two types. A `Transaction` has a date, category, amount, and note. A `Summary` holds a category and its total.
- `Data.hs`: just a small list of example transactions so we can run the app and tests.
- `Filters.hs`: the filtering functions (by category, by minimum amount, and by date before/after).
- `Summarizer.hs`: groups transactions by category and adds up amounts for each group.
- `Format.hs`: builds simple text tables so the output is easy to read.
- `Main.hs`: runs a short demo that prints all transactions, a filtered view, and totals by category.

We kept dates as strings in `YYYY-MM-DD` format. That way, normal string comparisons work for “before” and “after” without extra parsing, which is good enough for this project.

## How the main functions work

**Filters** (`Filters.hs`):

- `filterByCategory category txs`: keeps only transactions in that category.
- `filterByMinAmount min txs`: keeps transactions where the amount is at least `min`.
- `filterBeforeDate date txs`: keeps transactions before `date`.
- `filterAfterDate date txs`: keeps transactions after `date`.

**Formatting** (`Format.hs`):

- `formatTransactions`: prints a header, a divider, and one line per transaction with simple spacing so columns line up.
- `formatSummary`: prints category totals with the same idea.

**Summarizing** (`Summarizer.hs`):

- We sort by category first so similar categories are next to each other, then group them.
- For each group, we add up the amounts and make a `Summary`.
- `totalByCategory` runs those steps and turns the result into a printable table.

**Program entry** (`Main.hs`):

- Prints all transactions.
- Prints “Food” transactions over 10.
- Prints transactions after 2024‑03‑10.
- Prints totals by category.

**Tests** (`test/Spec.hs`, `test/TestData.hs`):

- We check that filtering by category returns the expected items (and nothing for a category that doesn’t exist in the test data).
- We check that filtering by minimum amount keeps only transactions over the threshold.

## Challenges and what we did

1) Grouping by category
   - Problem: `groupBy` only groups items that are next to each other.
   - Fix: Sorts by category first, then the group. That gives us one group per category.

2) Comparing dates
   - Problem: We didn’t want to pull in a date library for this small assignment.
   - Fix: Keeps dates as `YYYY-MM-DD` strings and compares them as strings. That works for before/after checks here.

3) Console output that’s readable
   - Problem: Raw prints are hard to scan.
   - Fix: Adds a header, a divider line, and pad fields so columns line up.

4) Using simple types
   - Problem: `Double` isn’t perfect for money.
   - Trade‑off: It was good enough for our sample data. If we extended this, we would use a fixed‑point type.

5) Keeping tests small and clear
   - Approach: Use a tiny set of sample transactions and check a few common cases. It runs fast and is easy to understand.

## Complexity and performance

- Filters go through the list once.
- Totals by category do a sort first, then a single pass to add things up.
- Formatting goes through the list one at a time to print it.

For small to medium lists, everything runs quickly.

## Limitations and what we’d add next

- Dates: Switch to real date types (`Data.Time`) for full reliability.
- Amounts: Use a fixed‑point number type and print to two decimals.
- CLI: Add command‑line options so users can pass the category, date, and amount filters.
- Summaries: Try a `Map`based approach for "totals" as another style.
- Tests: Add QuickCheck properties (e.g., raising the min amount should never increase the number of results).

## Did we meet the objectives?

- **Yes**: we can filter by category, amount, and date.
- **Yes**: we can show totals per category.
- **Yes**: the output is readable as a small table.
- **Yes**: there are unit tests for the filter logic.

Overall, this is a small, modular Haskell program that does what we set out to do and leaves room for a few nice improvements.
