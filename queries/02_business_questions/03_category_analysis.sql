/*
=================================================
Project 03 - SQL Business Analysis

File:
03_category_analysis.sql

Purpose:
Analyze sales performance across product categories.

Author:
Martin Panelo
=================================================
*/

-- =====================================================
-- Business Question 1
-- Which product categories generate the highest revenue?
-- =====================================================

SELECT
    c.CategoryID,
    c.CategoryName,
    SUM(
        od.UnitPrice
        * od.Quantity
        * (1 - od.Discount)
    ) AS TotalRevenue

FROM Categories AS c

INNER JOIN Products AS p
    ON c.CategoryID = p.CategoryID

INNER JOIN "Order Details" AS od
    ON p.ProductID = od.ProductID

GROUP BY
    c.CategoryID,
    c.CategoryName

ORDER BY
    TotalRevenue DESC;

-- =====================================================
-- Business Insight
-- =====================================================
-- Finding:
-- Beverages is the highest revenue-generating category,
-- with more than 92 million in total revenue.
--
-- Interpretation:
-- Beverage products contribute the largest share of
-- company sales, indicating strong and consistent demand.
--
-- Business Value:
-- Understanding category performance helps managers
-- prioritize inventory, marketing investments and
-- strategic product planning.

-- =====================================================
-- Business Question 2
-- Which product categories sell the highest number of units?
-- =====================================================

SELECT
    c.CategoryID,
    c.CategoryName,
    SUM(od.Quantity) AS TotalUnitsSold

FROM Categories AS c

INNER JOIN Products AS p
    ON c.CategoryID = p.CategoryID

INNER JOIN "Order Details" AS od
    ON p.ProductID = od.ProductID

GROUP BY
    c.CategoryID,
    c.CategoryName

ORDER BY
    TotalUnitsSold DESC;

-- =====================================================
-- Business Insight
-- =====================================================
-- Finding:
-- Confections is the category with the highest sales volume,
-- with more than 2.6 million units sold.
--
-- Interpretation:
-- Although Beverages generates the highest revenue,
-- Confections sells the largest number of units.
--
-- Business Value:
-- Comparing revenue and sales volume helps distinguish
-- high-value categories from high-demand categories,
-- supporting pricing, inventory and marketing decisions.


-- =====================================================
-- Business Question 3
-- Which category contains the largest number of products?
-- =====================================================

SELECT
    c.CategoryID,
    c.CategoryName,
    COUNT(p.ProductID) AS TotalProducts

FROM Categories AS c

INNER JOIN Products AS p
    ON c.CategoryID = p.CategoryID

GROUP BY
    c.CategoryID,
    c.CategoryName

ORDER BY
    TotalProducts DESC;

-- =====================================================
-- Business Insight
-- =====================================================
-- Finding:
-- Confections contains the largest number of products,
-- with a total of 13 products.
--
-- Interpretation:
-- A larger product portfolio does not necessarily
-- translate into higher revenue or sales volume.
--
-- Business Value:
-- Comparing the number of products with revenue and
-- sales volume helps evaluate category efficiency and
-- identify opportunities for portfolio optimization.

-- =====================================================
-- Business Question 4
-- What percentage of total revenue does each category contribute?
-- =====================================================

WITH CategoryRevenue AS (

    SELECT
        c.CategoryID,
        c.CategoryName,
        SUM(
            od.UnitPrice
            * od.Quantity
            * (1 - od.Discount)
        ) AS TotalRevenue

    FROM Categories AS c

    INNER JOIN Products AS p
        ON c.CategoryID = p.CategoryID

    INNER JOIN "Order Details" AS od
        ON p.ProductID = od.ProductID

    GROUP BY
        c.CategoryID,
        c.CategoryName
)

SELECT
    CategoryID,
    CategoryName,
    ROUND(TotalRevenue, 2) AS TotalRevenue,
    ROUND(
        TotalRevenue
        * 100.0
        / SUM(TotalRevenue) OVER (),
        2
    ) AS RevenuePercentage

FROM CategoryRevenue

ORDER BY
    RevenuePercentage DESC;

-- =====================================================
-- Business Insight
-- =====================================================
-- Finding:
-- Beverages is the highest revenue-generating category,
-- contributing approximately 20.55% of total company revenue.
--
-- Interpretation:
-- Revenue is relatively well distributed across categories,
-- with no single category accounting for a dominant share
-- of total sales.
--
-- Business Value:
-- A diversified revenue distribution reduces dependence
-- on a single product category and supports a more balanced
-- business portfolio.

-- =====================================================
-- Business Question 5
-- Which categories generate the highest average revenue per product?
-- =====================================================

WITH CategoryMetrics AS (

    SELECT
        c.CategoryID,
        c.CategoryName,
        COUNT(DISTINCT p.ProductID) AS TotalProducts,
        SUM(
            od.UnitPrice
            * od.Quantity
            * (1 - od.Discount)
        ) AS TotalRevenue

    FROM Categories AS c

    INNER JOIN Products AS p
        ON c.CategoryID = p.CategoryID

    INNER JOIN "Order Details" AS od
        ON p.ProductID = od.ProductID

    GROUP BY
        c.CategoryID,
        c.CategoryName
)

SELECT
    CategoryID,
    CategoryName,
    TotalProducts,
    ROUND(TotalRevenue, 2) AS TotalRevenue,
    ROUND(
        TotalRevenue * 1.0 / TotalProducts,
        2
    ) AS AverageRevenuePerProduct

FROM CategoryMetrics

ORDER BY
    AverageRevenuePerProduct DESC;

-- =====================================================
-- Business Insight
-- =====================================================
-- Finding:
-- Meat/Poultry generates the highest average revenue
-- per product, despite having one of the smallest product portfolios.
--
-- Interpretation:
-- Categories with fewer products can still outperform
-- larger categories if each product generates strong sales.
--
-- Business Value:
-- Average revenue per product helps evaluate category
-- efficiency and supports product portfolio and pricing
-- decisions.
