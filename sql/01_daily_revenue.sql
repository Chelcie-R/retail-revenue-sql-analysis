-- 01_daily_revenue.sql
-- Daily revenue rollup from sales_transactions

WITH daily AS (
  SELECT
      CAST(date AS DATE)       AS sales_date,
      SUM(total_sales)         AS revenue
  FROM sales_transactions
  GROUP BY CAST(date AS DATE)
)
SELECT *
FROM daily
ORDER BY sales_date;
