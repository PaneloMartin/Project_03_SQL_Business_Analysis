# 📊 SQL Business Analysis with Northwind Database

## Project 03 – Business Intelligence Portfolio

![SQL](https://img.shields.io/badge/SQL-Advanced-blue) ![SQLite](https://img.shields.io/badge/Database-SQLite-003B57?logo=sqlite&logoColor=white) ![Northwind](https://img.shields.io/badge/Dataset-Northwind-red) ![Business Intelligence](https://img.shields.io/badge/Business-Intelligence-purple) ![Status](https://img.shields.io/badge/Status-Completed-success) ![Portfolio](https://img.shields.io/badge/Portfolio-Project-orange)

Business-oriented SQL analysis using the Northwind database to answer real-world business questions through data exploration, KPI calculation, and actionable insights.

---

# 🎯 Project Overview

This project explores the Northwind database from a business perspective.

Instead of solving isolated SQL exercises, the analysis focuses on answering practical business questions such as:

- Which customers generate the highest revenue?
- Which products generate the highest revenue?
- Which products sell the largest number of units?
- Which product categories contribute the most to total revenue?
- How do sales evolve over time?
- Are there seasonal sales patterns?

Each SQL analysis includes:

- Business Question
- SQL Solution
- Finding
- Interpretation
- Business Value

The goal is to simulate the daily work of a Business Intelligence Analyst by transforming transactional data into actionable insights.

---

# 🗄 Dataset

**Database used:** Northwind

Northwind is Microsoft's classic sample database that simulates the operations of an international trading company.

The database contains information about:

- Customers
- Orders
- Order Details
- Products
- Categories
- Employees
- Suppliers
- Shippers

---

# 📂 Project Structure

```text
Project_03_SQL_Business_Analysis/
│
├── database/
│
├── queries/
│   ├── 01_learning/
│   └── 02_business_questions/
│       ├── 01_top_customers.sql
│       ├── 02_product_performance.sql
│       ├── 03_category_analysis.sql
│       └── 04_sales_trends.sql
│
├── notebooks/
├── images/
├── README.md
├── requirements.txt
└── .gitignore
```

---

# 📈 Business Questions Answered

## Customer Analysis

- Top revenue-generating customers

## Product Analysis

- Highest revenue products
- Best-selling products

## Category Analysis

- Highest revenue categories
- Highest sales volume
- Largest product portfolio
- Revenue contribution by category
- Average revenue per product

## Sales Trend Analysis

- Annual revenue analysis
- Monthly revenue analysis
- Peak revenue months
- Average monthly revenue
- Quarterly performance

---

# 🛠 SQL Concepts Covered

This project demonstrates practical usage of:

- Filtering and sorting
- Aggregate functions
- Table joins
- Common Table Expressions (CTEs)
- Window Functions
- Date functions
- CASE expressions
- NULL handling
- Business KPI calculations
- Revenue analysis
- Time-series analysis
- Percentage calculations
- Multi-level aggregations

---

# 📊 Data Visualizations

The SQL query results were imported into Python using pandas and visualized with Matplotlib. All figures are generated directly from the Northwind SQLite database.

## Top 10 Customers by Revenue

B's Beverages is the highest-revenue customer in the dataset. However, total revenue is relatively distributed across the leading customers rather than being heavily concentrated in a single account.

![Top 10 Customers by Revenue](images/top_customers_by_revenue.png)

---

## Top 10 Products by Revenue

This ranking identifies the products making the largest contribution to total net revenue after discounts.

![Top 10 Products by Revenue](images/top_products_by_revenue.png)

---

## Revenue by Product Category

Beverages is the highest-revenue category, representing approximately 20.55% of total company revenue. The distribution remains relatively balanced across the main categories.

![Revenue by Product Category](images/revenue_by_category.png)

---

## Monthly Revenue Trend

Monthly revenue remains relatively stable over most of the available sales history, with recurring fluctuations and several high-revenue periods. The first and final years contain partial data and should therefore be interpreted carefully.

![Monthly Revenue Trend](images/monthly_revenue_trend.png)

---

## Average Revenue by Calendar Month

December records the highest average monthly revenue, while February shows the lowest. The results suggest a moderate seasonal pattern, with stronger sales toward the end of the year.

![Average Revenue by Calendar Month](images/average_revenue_by_month.png)

---

# 💼 Skills Demonstrated

- SQL
- SQLite
- Business Intelligence
- Data Analysis
- KPI Analysis
- Data Aggregation
- Window Functions
- Common Table Expressions (CTEs)
- Revenue Analytics
- Time-Series Analysis
- Business Reporting
- Analytical Thinking

---

# 🚀 How to Use

1. Clone this repository.
2. Open the project in Visual Studio Code.
3. Open the Northwind SQLite database.
4. Execute the SQL scripts located in:

```text
queries/02_business_questions/
```

Each file contains:

- Business question
- SQL solution
- Business insight
- Interpretation
- Business value

---

# 👨‍💻 Author

**Martin Panelo**

Geophysicist transitioning into Data Analytics and Business Intelligence, with experience applying analytical thinking to solve real-world business problems through SQL and data-driven insights.

- **GitHub:** https://github.com/PaneloMartin
- **LinkedIn:** https://www.linkedin.com/in/martinpanelo/

---

⭐ If you found this project interesting, feel free to explore the rest of my portfolio.