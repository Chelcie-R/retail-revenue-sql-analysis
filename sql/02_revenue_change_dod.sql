-- 02_revenue_change_dod.sql
-- Day-over-day revenue change with previous day comparison

WITH daily AS (
	SELECT 
  	CAST(date AS DATE) AS sales_date,
  	SUM(total_sales)   AS revenue
  	FROM sales_transactions
  	GROUP BY CAST(date AS DATE)
)
	SELECT
    sales_date,
    revenue,
    LAG (revenue) OVER (ORDER BY sales_date) AS prev_day_revenue,
    revenue - LAG(revenue) OVER (ORDER BY sales_date) AS revenue_change,
    ROUND (100.0 * (revenue - LAG(revenue) OVER (ORDER BY sales_date)) 
	  / NULLIF(LAG(revenue) OVER (ORDER BY sales_date), 0), 2) AS revenue_change_pct
FROM daily
ORDER BY sales_date;
