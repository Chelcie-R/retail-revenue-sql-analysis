-- 03_rolling_7_day_average.sql
-- 7-day rolling average of daily revenue

WITH daily AS (
	SELECT 
  		CAST(date AS DATE) AS sales_date,
		SUM(total_sales) AS revenue
FROM sales_transactions
GROUP BY CAST(date AS DATE)
)
	SELECT
		sales_date,
		revenue,
    AVG(revenue) OVER (ORDER BY sales_date ROWS BETWEEN 6 PRECEDING AND CURRENT ROW) AS rolling_7_day_avg
FROM daily
ORDER BY sales_date;
