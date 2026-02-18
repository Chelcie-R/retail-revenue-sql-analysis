-- 05_regional_product_rankings.sql
-- Ranks products by revenue within each region

SELECT
	region,
	product,
	SUM(total_sales) AS revenue,
	DENSE_RANK() OVER (PARTITION BY region ORDER BY SUM(total_sales) DESC) AS rank_in_region
FROM sales_transactions
GROUP BY region, product
ORDER BY region, rank_in_region, product;
