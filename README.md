# retail-revenue-sql-analysis
SQL-based revenue trend analysis using window functions, aggregations, and BI visualization. Includes daily revenue, rolling averages, regional performance, and top-product analysis.

# Retail Revenue Trend Analysis (SQL + PostgreSQL)

## Executive Summary
Revenue trends reveal consistent performance in the West region and strong product dominance by Headphones in the East. Significant day‑over‑day volatility suggests opportunities to stabilize demand or identify campaign impacts. Rolling averages highlight underlying patterns that short-term fluctuations obscure.

## Overview
This project analyzes revenue trends using SQL window functions and aggregations.
It explores daily performance, rolling averages, regional consistency, and top products.

## Business Questions
- Which region is the most consistent in revenue?
- Which products dominate each region?
- What days show unusual revenue spikes or dips?
- How do rolling averages smooth out volatility?

## Tools Used
- PostgreSQL
- SQL (CTEs, Window Functions)
- Tableau Public (Dashboard)
- GitHub for documentation

## Key Insights
- **West** is the most consistent region (std dev: 4,638.04).
- **Headphones** are the top product in East, generating $89,342.84.
- Largest increase: **March 3, 2025** (+$35,367.62).
- Largest decrease: **January 25, 2025** (-$38,166.40).

## Files in This Repository
- `/sql` — All SQL queries used in analysis.
- `/docs` — Insight summary PDF.
- `/dashboard` — Tableau screenshots + link.

## Next Steps
- Add Power BI dashboard version.
- Add Python automation script for daily revenue refresh.

## Data Sources
- Simulated retail transaction dataset (500 records)
- Includes date, region, product, units_sold, unit_price, total_sales

## SQL Files
- [`/sql/01_daily_revenue.sql`]
- [`/sql/02_revenue_change_dod.sql`]
- [`/sql/03_rolling_7_day_average.sql`]
- [`/sql/04_month_over_month_growth.sql`]
- [`/sql/05_regional_product_rankings.sql`]
- [`/sql/06_biggest_spikes_and_dips.sql`]
- [`/sql/07_region_consistency_stddev.sql`]
- [`/sql/08_views_for_dashboarding.sql`]
- [`/sql/09_quality_checks.sql`]
