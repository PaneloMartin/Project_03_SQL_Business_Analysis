/*
=================================================
Project 03 - SQL Business Analysis

File:
01_explore_customers.sql

Purpose:
Explore the Customers table to understand its
structure before starting the business analysis.

Author:
Martin Panelo
=================================================
*/

-- Display all customer information

SELECT *
FROM Customers;

-- Display selected customer information

SELECT
    CustomerID,
    CompanyName,
    ContactName,
    City,
    Country
FROM Customers;

-- Count the total number of customers

SELECT
    COUNT(*) AS TotalCustomers
FROM Customers;

-- Display all countries where customers are located

SELECT
    Country
FROM Customers;

-- Display unique customer countries

SELECT DISTINCT
    Country
FROM Customers;

-- Count customers by country

SELECT
    Country,
    COUNT(*) AS NumberOfCustomers
FROM Customers
GROUP BY Country
ORDER BY NumberOfCustomers DESC;

