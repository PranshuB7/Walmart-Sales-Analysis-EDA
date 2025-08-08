CREATE DATABASE walmart_sales;
USE walmart_sales;
CREATE TABLE walmart_sales (
    store INT,
    date DATE,
    weekly_sales DECIMAL(10,2),
    holiday_flag TINYINT,
    temperature DECIMAL(5,2),
    fuel_price DECIMAL(5,2),
    cpi DECIMAL(6,2),
    unemployment DECIMAL(5,2)
);
SELECT * FROM walmart_sales LIMIT 10;

-- Calculate the total sales across all stores and all weeks
SELECT ROUND(SUM(Weekly_Sales), 2) AS total_sales
FROM walmart_sales;

-- Show total sales per store, from highest to lowest
SELECT Store, 
       ROUND(SUM(Weekly_Sales), 2) AS store_sales
FROM walmart_sales
GROUP BY Store
ORDER BY store_sales DESC;

-- Get total monthly sales (formatting Date as YYYY-MM)
SELECT DATE_FORMAT(Date, '%Y-%m') AS month,
       ROUND(SUM(Weekly_Sales), 2) AS monthly_sales
FROM walmart_sales
GROUP BY month
ORDER BY month;

-- Compare average sales for holiday and non-holiday weeks
SELECT Holiday_Flag,
       ROUND(AVG(Weekly_Sales), 2) AS avg_sales
FROM walmart_sales
GROUP BY Holiday_Flag;

-- Identify stores with highest total sales during holidays
SELECT Store,
       ROUND(SUM(Weekly_Sales), 2) AS holiday_sales
FROM walmart_sales
WHERE Holiday_Flag = 1
GROUP BY Store
ORDER BY holiday_sales DESC;

-- Get minimum, maximum, and average weekly sales for each store
SELECT Store,
       ROUND(MIN(Weekly_Sales), 2) AS min_sales,
       ROUND(MAX(Weekly_Sales), 2) AS max_sales,
       ROUND(AVG(Weekly_Sales), 2) AS avg_sales
FROM walmart_sales
GROUP BY Store;

-- List top 10 weeks (by date & store) with highest sales during holidays
SELECT Date, Store, 
       ROUND(Weekly_Sales, 2) AS sales
FROM walmart_sales
WHERE Holiday_Flag = 1
ORDER BY Weekly_Sales DESC
LIMIT 10;

-- Show average of environmental and economic variables across the dataset
SELECT 
  ROUND(AVG(Temperature), 2) AS avg_temp,
  ROUND(AVG(Fuel_Price), 2) AS avg_fuel,
  ROUND(AVG(CPI), 2) AS avg_cpi,
  ROUND(AVG(Unemployment), 2) AS avg_unemployment,
  ROUND(AVG(Weekly_Sales), 2) AS avg_sales
FROM walmart_sales;




