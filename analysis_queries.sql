-- E-commerce Sales Analysis
-- Practice project: SQL queries for business analysis

-- 1. Total sales, cost and profit
SELECT
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(cost), 2) AS total_cost,
    ROUND(SUM(profit), 2) AS total_profit
FROM ecommerce_sales;

-- 2. Sales and profit by category
SELECT
    category,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit
FROM ecommerce_sales
GROUP BY category
ORDER BY total_sales DESC;

-- 3. Top 10 products by sales
SELECT
    product,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    SUM(quantity) AS units_sold
FROM ecommerce_sales
GROUP BY product
ORDER BY total_sales DESC
LIMIT 10;

-- 4. Regional performance
SELECT
    region,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit
FROM ecommerce_sales
GROUP BY region
ORDER BY total_sales DESC;

-- 5. Monthly sales trend
SELECT
    SUBSTR(order_date, 1, 7) AS month,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit
FROM ecommerce_sales
GROUP BY SUBSTR(order_date, 1, 7)
ORDER BY month;

-- 6. Sales by channel
SELECT
    sales_channel,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit
FROM ecommerce_sales
GROUP BY sales_channel
ORDER BY total_sales DESC;

-- 7. Average order value
SELECT
    ROUND(AVG(sales), 2) AS average_order_value
FROM ecommerce_sales;

-- 8. Profit margin by category
SELECT
    category,
    ROUND(SUM(profit) * 100.0 / NULLIF(SUM(sales), 0), 2) AS profit_margin_pct
FROM ecommerce_sales
GROUP BY category
ORDER BY profit_margin_pct DESC;
