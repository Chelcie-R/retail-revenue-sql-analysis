-- 06_biggest_spikes_and_dips.sql
-- Purpose: Identify the top daily increases (spikes) and decreases (dips) in revenue.

WITH 
daily AS (
	SELECT
    	CAST(date AS DATE) AS sales_date,
    	SUM(total_sales) AS revenue
FROM sales_transactions
GROUP BY CAST(date AS DATE)
),
chg AS (
	SELECT
		sales_date,
		revenue,
		revenue - LAG(revenue) OVER (ORDER BY sales_date) AS revenue_change
FROM daily
)
-- Top 5 spikes
(
	SELECT 
		'SPIKE' AS change_type, 
		sales_date, 
		revenue, 
		revenue_change
FROM chg
ORDER BY revenue_change DESC
LIMIT 5
)
UNION ALL
-- Top 5 dips
(
	SELECT 
		'DIP' AS change_type, 
		sales_date, 
		revenue, 
		revenue_change
FROM chg
ORDER BY revenue_change ASC
LIMIT 5
)
ORDER BY change_type DESC, revenue_change DESC, sales_date ASC;
