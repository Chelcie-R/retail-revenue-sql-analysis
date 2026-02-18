-- 08_views_for_dashboarding.sql
-- Purpose: Create reusable views for BI tools (Tableau/Power BI).

-- 1) Daily revenue view
CREATE OR REPLACE VIEW vw_daily_revenue AS
SELECT
	CAST(date AS DATE) AS sales_date,
	SUM(total_sales) AS revenue
FROM sales_transactions
GROUP BY CAST(date AS DATE);

-- 2) Rolling 7-day average view
CREATE OR REPLACE VIEW vw_daily_revenue_rolling7 AS
SELECT
	sales_date,
	revenue,
	AVG(revenue) OVER (ORDER BY sales_date ROWS BETWEEN 6 PRECEDING AND CURRENT ROW) AS rolling_7_day_avg
FROM vw_daily_revenue;

-- 3) Regional product rankings view (gap-free ranks for readability)
CREATE OR REPLACE VIEW vw_region_product_rankings AS
SELECT
	region,
	product,
	SUM(total_sales) AS revenue,
	DENSE_RANK() OVER (PARTITION BY region ORDER BY SUM(total_sales) DESC) AS rank_in_region
FROM sales_transactions
GROUP BY region, product;
