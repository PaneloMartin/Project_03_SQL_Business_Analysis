/*
=================================================
Project 03 - SQL Business Analysis

File:
02_first_join.sql

Purpose:
Learn how to combine information from multiple
tables using INNER JOIN.

Author:
Martin Panelo
=================================================
*/

-- Display each customer along with their orders

SELECT
    Customers.CompanyName,
    Orders.OrderID
FROM Customers
INNER JOIN Orders
    ON Customers.CustomerID = Orders.CustomerID
ORDER BY Customers.CompanyName;


-- Count how many different customers appear in the INNER JOIN

SELECT
    COUNT(DISTINCT Customers.CustomerID) AS NumberOfCustomers
FROM Customers
INNER JOIN Orders
    ON Customers.CustomerID = Orders.CustomerID;

    -- Business Insight:
-- All 93 customers have placed at least one order.
-- No inactive customers were found in the current database.

-- Display the 10 customers with the highest number of orders

SELECT
    Customers.CustomerID,
    Customers.CompanyName,
    COUNT(Orders.OrderID) AS TotalOrders
FROM Customers
INNER JOIN Orders
    ON Customers.CustomerID = Orders.CustomerID
GROUP BY
    Customers.CustomerID,
    Customers.CompanyName
ORDER BY TotalOrders DESC
LIMIT 10;


-- Business Insight:
-- B's Beverages has the highest number of orders, with 210.
-- CustomerID should always be used when
-- grouping or ranking customers because
-- CompanyName is not guaranteed to be unique.



-- Identify duplicated company names

SELECT
    CompanyName,
    COUNT(*) AS NumberOfCustomers
FROM Customers
GROUP BY CompanyName
HAVING COUNT(*) > 1;


-- Data Quality Insight:
-- Two different customers share the company name "IT".
-- CompanyName is therefore not a unique customer identifier.
-- CustomerID should be used when grouping or ranking customers.