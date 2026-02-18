-- 09_quality_checks.sql
-- Purpose: Simple data quality checks for sales_transactions.

-- 1) Total rows
SELECT COUNT(*) AS row_count
FROM sales_transactions;

-- 2) Date coverage
SELECT
	MIN(CAST(date AS DATE)) AS min_date,
	MAX(CAST(date AS DATE)) AS max_date
FROM sales_transactions;

-- 3) Null or negative revenue guard
SELECT COUNT(*) AS suspect_revenue_rows
FROM sales_transactions
WHERE total_sales IS NULL OR total_sales < 0;

-- 4) Units and price sanity check
SELECT
	SUM(CASE WHEN units_sold <= 0 THEN 1 ELSE 0 END) AS nonpositive_units,
	SUM(CASE WHEN unit_price <= 0 THEN 1 ELSE 0 END) AS nonpositive_price
FROM sales_transactions;
