# data-warehouse-using-sql
E-Commerce Data Warehouse & ETL Pipeline

Overview
This project demonstrates a robust Data Warehouse architecture built entirely with SQL. It processes raw e-commerce transaction data through a complete ETL (Extract, Transform, Load) pipeline, transforming unstructured records into optimized analytical insights. The database follows the Medallion Architecture to ensure data quality, scalability, and query performance.

Data Architecture (Medallion Pattern)

Bronze Layer (Raw Data): The ingestion point for unvalidated, raw CSV data dumps representing users, orders, and inventory. Data is stored exactly as received to maintain an immutable historical source of truth.

Silver Layer (Cleansed & Conformed): The transformation stage where data is cleaned, filtered, and normalized. This step handles missing NULL values, standardizes date formats, enforces primary/foreign key relationships, and removes duplicates to create a reliable relational schema.

Gold Layer (Aggregated Analytics): The business presentation layer optimized for read-heavy queries. It contains denormalized tables and views calculating core metrics such as month-over-month revenue growth, customer retention rates, and category-level sales rankings.

Tech Stack

Database Engine: PostgreSQL / MySQL

Core Concepts: ETL Workflows, Relational Schema Design, Medallion Architecture

Querying: Advanced SQL (Window Functions, CTEs, Complex Joins, Aggregation)

Key Skills Demonstrated

Utilizing RANK(), DENSE_RANK(), and SUM() OVER() window functions for cohort ranking and running totals.

Isolating complex transformation logic into highly readable Common Table Expressions (CTEs).

Executing multi-table JOIN operations across thousands of transaction records while avoiding row-duplication traps.
