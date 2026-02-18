-- 07_region_consistency_stddev.sql
-- Purpose: Show average daily revenue and standard deviation by region to assess consistency.

WITH daily_region AS (
	SELECT
		CAST(date AS DATE) AS sales_date,
		region,
		SUM(total_sales) AS revenue
FROM sales_transactions
GROUP BY CAST(date AS DATE), region
)
	SELECT
    	region,
    	ROUND(AVG(revenue), 2) AS avg_daily_revenue,
    	ROUND(STDDEV(revenue), 2) AS revenue_stddev
FROM daily_region
GROUP BY region
ORDER BY revenue_stddev ASC, region;
