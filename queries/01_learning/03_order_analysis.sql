/*
=================================================
Project 03 - SQL Business Analysis

File:
03_order_analysis.sql

Purpose:
Analyze customer orders and understand sales
activity over time.

Author:
Martin Panelo
=================================================
*/

-- Business Question:
-- How many orders has the company received?

SELECT
    COUNT(*) AS TotalOrders
FROM Orders;


-- Business Insight:
-- The company processed 16,282 orders.

-- Business Question:
-- What is the time span covered by the order history?

SELECT
    MIN(OrderDate) AS FirstOrderDate,
    MAX(OrderDate) AS LastOrderDate
FROM Orders;


-- Business Insight:
-- The company processed orders between July 10, 2012
-- and October 28, 2023, covering more than
-- 11 years of historical sales activity.

-- Business Question:
-- How many orders were placed each year?

SELECT
    strftime('%Y', OrderDate) AS OrderYear,
    COUNT(*) AS TotalOrders
FROM Orders
GROUP BY strftime('%Y', OrderDate)
ORDER BY OrderYear;

-- Business Insight:
-- Order volume peaked in 2017 with 1,780 orders.
-- The lowest order count appears in 2012 (654), but this
-- represents a partial year because the dataset begins on
-- July 10, 2012.
-- Likewise, 2023 is also a partial year ending on
-- October 28, 2023.

-- Business Question:
-- How many orders were placed each month?

SELECT
    strftime('%Y', OrderDate) || '-' || strftime('%m', OrderDate) AS OrderMonth,
    COUNT(*) AS TotalOrders
FROM Orders
GROUP BY
    strftime('%Y', OrderDate) || '-' || strftime('%m', OrderDate)
ORDER BY OrderMonth;

-- Business Insight:
-- The dataset contains 136 months of order history,
-- ranging from July 2012 to October 2023.
-- Monthly aggregation enables trend analysis and
-- seasonality detection over time.

-- Business Question:
-- What is the total revenue generated?

SELECT
    SUM(UnitPrice * Quantity * (1 - Discount)) AS TotalRevenue
FROM "Order Details";

-- Business Question:
-- What is the average order value?

SELECT
    SUM(UnitPrice * Quantity * (1 - Discount))
    /
    COUNT(DISTINCT OrderID) AS AverageOrderValue
FROM "Order Details";

-- Business Insight:
-- The average order value is 27,538.79.
-- This metric helps evaluate customer purchasing behavior
-- and can be used to monitor sales performance over time.

-- Business Question:
-- Which month generated the highest revenue?

SELECT
    strftime('%Y-%m', Orders.OrderDate) AS OrderMonth,
    SUM(
        "Order Details".UnitPrice
        * "Order Details".Quantity
        * (1 - "Order Details".Discount)
    ) AS TotalRevenue
FROM Orders
INNER JOIN "Order Details"
    ON Orders.OrderID = "Order Details".OrderID
GROUP BY strftime('%Y-%m', Orders.OrderDate)
ORDER BY TotalRevenue DESC
LIMIT 1;

-- Business Insight:
-- December 2021 generated the highest monthly revenue,
-- reaching 4,377,795.40.
-- Identifying peak sales periods helps support
-- business planning and forecasting.
-- This represents a single month only and
-- should not be interpreted as evidence of
-- a recurring seasonal pattern.