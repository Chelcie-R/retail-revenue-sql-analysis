-- 04_month_over_month_growth.sql
-- Monthly revenue with MoM change and MoM %

WITH monthly AS (
SELECT
	DATE_TRUNC('month', CAST(date AS DATE)) AS month,
    SUM(total_sales) AS revenue
FROM sales_transactions
GROUP BY 1
)
SELECT
    month,
    revenue,
    LAG(revenue) OVER (ORDER BY month) AS prev_month_revenue,
    (revenue - LAG(revenue) OVER (ORDER BY month)) AS mom_change,
    ROUND(100 * (revenue - LAG(revenue) OVER (ORDER BY month))
    / NULLIF(LAG(revenue) OVER (ORDER BY month), 0), 2) AS mom_change_pct
FROM monthly
ORDER BY month;
