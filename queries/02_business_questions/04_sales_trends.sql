/*
=================================================
Project 03 - SQL Business Analysis

File:
04_sales_trends.sql

Purpose:
Analyze sales trends over time.

Author:
Martin Panelo
=================================================
*/

-- =====================================================
-- Business Question 1
-- How has total revenue evolved by year?
-- =====================================================

-- Annual Revenue Analysis

SELECT
    strftime('%Y', o.OrderDate) AS SalesYear,
    ROUND(
        SUM(
            od.UnitPrice
            * od.Quantity
            * (1 - od.Discount)
        ),
        2
    ) AS TotalRevenue

FROM Orders AS o

INNER JOIN "Order Details" AS od
    ON o.OrderID = od.OrderID

GROUP BY
    SalesYear

ORDER BY
    SalesYear;

-- =====================================================
-- Business Insight
-- =====================================================
-- Finding:
-- Annual revenue remains relatively stable between
-- 2013 and 2022, with moderate year-to-year variations.
--
-- Interpretation:
-- The lower revenue observed in 2012 and 2023 is likely
-- explained by partial-year data rather than a significant
-- decline in business performance.
--
-- Business Value:
-- When analyzing long-term sales trends, partial years
-- should be interpreted carefully to avoid misleading
-- conclusions about business growth or decline.

-- =====================================================
-- Business Question 2
-- How has monthly revenue evolved over time?
-- =====================================================

-- Monthly Revenue Analysis

SELECT
    strftime('%Y-%m', o.OrderDate) AS SalesMonth,

    ROUND(
        SUM(
            od.UnitPrice
            * od.Quantity
            * (1 - od.Discount)
        ),
        2
    ) AS TotalRevenue

FROM Orders AS o

INNER JOIN "Order Details" AS od
    ON o.OrderID = od.OrderID

GROUP BY
    SalesMonth

ORDER BY
    SalesMonth;

-- =====================================================
-- Business Insight
-- =====================================================
-- Finding:
-- Monthly revenue fluctuates throughout the year,
-- with several months exceeding 3 million in revenue.
--
-- Interpretation:
-- The data suggests possible seasonal patterns,
-- with stronger sales occurring toward the end of
-- some years. Further analysis is required to
-- confirm this behavior.
--
-- Business Value:
-- Monthly revenue analysis helps identify seasonal
-- trends, supports forecasting and assists inventory
-- and marketing planning.

-- =====================================================
-- Business Question 3
-- Which 10 months generated the highest revenue?
-- =====================================================

-- Peak Revenue Months

SELECT
    strftime('%Y-%m', o.OrderDate) AS SalesMonth,

    ROUND(
        SUM(
            od.UnitPrice
            * od.Quantity
            * (1 - od.Discount)
        ),
        2
    ) AS TotalRevenue

FROM Orders AS o

INNER JOIN "Order Details" AS od
    ON o.OrderID = od.OrderID

GROUP BY
    SalesMonth

ORDER BY
    TotalRevenue DESC

LIMIT 10;

-- =====================================================
-- Business Insight
-- =====================================================
-- Finding:
-- The highest-revenue months are distributed across
-- different years and different times of the year.
--
-- Interpretation:
-- The top 10 ranking does not show a clear concentration
-- in December or at the end of the year, so there is not
-- enough evidence to confirm a strong seasonal pattern.
--
-- Business Value:
-- Identifying the strongest individual months helps
-- managers investigate the specific products, customers
-- or commercial events that may have driven those peaks.

-- =====================================================
-- Business Question 4
-- Which months of the year generate the highest average revenue?
-- =====================================================

-- Average Monthly Revenue

WITH MonthlyRevenue AS (

    SELECT
        strftime('%Y-%m', o.OrderDate) AS SalesMonth,
        strftime('%m', o.OrderDate) AS MonthNumber,

        SUM(
            od.UnitPrice
            * od.Quantity
            * (1 - od.Discount)
        ) AS TotalRevenue

    FROM Orders AS o

    INNER JOIN "Order Details" AS od
        ON o.OrderID = od.OrderID

    GROUP BY
        SalesMonth,
        MonthNumber
)

SELECT
    MonthNumber,
    CASE MonthNumber
        WHEN '01' THEN 'January'
        WHEN '02' THEN 'February'
        WHEN '03' THEN 'March'
        WHEN '04' THEN 'April'
        WHEN '05' THEN 'May'
        WHEN '06' THEN 'June'
        WHEN '07' THEN 'July'
        WHEN '08' THEN 'August'
        WHEN '09' THEN 'September'
        WHEN '10' THEN 'October'
        WHEN '11' THEN 'November'
        WHEN '12' THEN 'December'
    END AS MonthName,

    ROUND(
        AVG(TotalRevenue),
        2
    ) AS AverageMonthlyRevenue

FROM MonthlyRevenue

GROUP BY
    MonthNumber

ORDER BY
    AverageMonthlyRevenue DESC;

-- =====================================================
-- Business Insight
-- =====================================================
-- Finding:
-- December has the highest average monthly revenue,
-- while February has the lowest average revenue.
--
-- Interpretation:
-- The results suggest a moderate seasonal pattern,
-- with stronger sales toward the end of the year.
--
-- Business Value:
-- Understanding seasonal demand helps improve
-- inventory planning, marketing campaigns and
-- sales forecasting throughout the year.

-- =====================================================
-- Business Question 5
-- Which quarter generates the highest revenue?
-- =====================================================

-- Quarterly Performance

SELECT

    CASE

        WHEN strftime('%m', o.OrderDate) IN ('01','02','03') THEN 'Q1'

        WHEN strftime('%m', o.OrderDate) IN ('04','05','06') THEN 'Q2'

        WHEN strftime('%m', o.OrderDate) IN ('07','08','09') THEN 'Q3'

        ELSE 'Q4'

    END AS Quarter,

    ROUND(

        SUM(

            od.UnitPrice
            * od.Quantity
            * (1 - od.Discount)

        ),

        2

    ) AS TotalRevenue

FROM Orders AS o

INNER JOIN "Order Details" AS od

    ON o.OrderID = od.OrderID

GROUP BY Quarter

ORDER BY TotalRevenue DESC;

-- =====================================================
-- Business Insight
-- =====================================================
-- Finding:
-- Q3 generated the highest total revenue across
-- the available sales history.
--
-- Interpretation:
-- Although Q3 ranks first, the comparison should be
-- interpreted carefully because the first and last
-- years contain partial data.
--
-- Business Value:
-- Quarterly analysis helps evaluate business
-- performance at a higher level and supports
-- strategic planning and budgeting.