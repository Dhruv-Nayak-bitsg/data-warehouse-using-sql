# DATA-WAREHOUSE-PROJECT-USING-SQL
E-Commerce Data Warehouse & ETL Pipeline
# E-Commerce Data Warehouse & Analytics

A SQL-based data warehouse project that demonstrates an end-to-end **ETL pipeline, data cleaning, dimensional modeling, and analytical SQL** using e-commerce sales data.

The project follows a **Medallion Architecture** with Bronze, Silver, and Gold layers to transform raw source data into structured, analysis-ready datasets.

> **Note:** This project was built as a learning and portfolio project based on the Data With Baraa SQL Data Warehouse project. The implementation was used to understand practical data warehousing, ETL, SQL transformations, and analytical modeling.

---

## 🏗️ Architecture

The warehouse is organized into three layers:

```text
              Raw Source Data
              (CSV Files)
                   │
                   ▼
        ┌─────────────────────┐
        │    BRONZE LAYER     │
        │   Raw / Ingested    │
        └──────────┬──────────┘
                   │
                   ▼
        ┌─────────────────────┐
        │    SILVER LAYER     │
        │ Cleaned & Transformed│
        └──────────┬──────────┘
                   │
                   ▼
        ┌─────────────────────┐
        │     GOLD LAYER      │
        │ Analytics & Reporting│
        └──────────┬──────────┘
                   │
                   ▼
          Business Insights
```

### Bronze Layer

Stores raw data loaded from the source files with minimal transformation.

### Silver Layer

Cleans and transforms the raw data by handling issues such as:

* Missing and inconsistent values
* Data type conversions
* Duplicate records
* Standardization of fields
* Relationships between entities
* Data quality validation

### Gold Layer

Provides analysis-ready datasets designed for reporting and analytical queries.

---

## 📊 Data Model

The warehouse organizes business information into analytical fact and dimension structures.

Main business entities include:

* **Customers**
* **Products**
* **Orders / Sales**
* **Product Categories**
* **Customer Attributes**

The Gold layer is designed to make analytical queries easier and more efficient by organizing the data around business entities and measurable sales activity.

---

## 🔄 ETL Process

The project demonstrates a complete ETL workflow:

### 1. Extract

Raw e-commerce datasets are loaded from CSV source files.

### 2. Transform

The data is cleaned and transformed through SQL scripts.

Examples include:

* Standardizing values
* Converting data types
* Handling NULL values
* Removing duplicate records
* Joining related datasets
* Creating derived fields
* Preparing data for analytical use

### 3. Load

The transformed data is loaded into the appropriate warehouse layers and ultimately exposed through the Gold layer for analysis.

---

## 📈 Analytics

The project uses SQL to answer common business questions related to sales and customer behavior.

Examples include:

### Sales Analysis

* Revenue by month
* Revenue trends over time
* Product and category performance
* Running sales totals

### Customer Analysis

* Customer purchasing behavior
* Customer-level revenue
* Customer segmentation
* Retention-related analysis

### Product Analysis

* Best-performing products
* Category-level performance
* Product rankings

---

## 🧠 SQL Concepts Demonstrated

The project makes use of several intermediate and advanced SQL concepts:

* `JOIN`
* `GROUP BY`
* `CASE`
* Common Table Expressions (CTEs)
* Window Functions
* `RANK()`
* `DENSE_RANK()`
* `SUM() OVER()`
* Aggregations
* Date-based analysis
* Data cleaning and transformation
* Relational data modeling

These techniques are used throughout the ETL and analytics stages rather than as isolated SQL exercises.

---

## 📁 Repository Structure

```text
data-warehouse-using-sql/
│
├── datasets/
│   └── Raw source datasets
│
├── docs/
│   └── Data warehouse documentation
│
├── scripts/
│   ├── bronze/
│   │   └── Raw data ingestion
│   │
│   ├── silver/
│   │   └── Data cleaning & transformation
│   │
│   └── gold/
│       └── Analytical models
│
├── tests/
│   └── Data quality checks
│
├── LICENSE
└── README.md
```

---

## 🛠️ Technology Stack

| Technology       | Purpose                                      |
| ---------------- | -------------------------------------------- |
| **SQL**          | Data transformation and analytics            |
| **SQL Database** | Data warehouse implementation                |
| **Git & GitHub** | Version control and project management       |
| **Draw.io**      | Data architecture and modeling documentation |

---

## 🎯 Project Objectives

The main objectives of this project were to gain practical experience with:

* Designing a multi-layer data warehouse
* Building SQL-based ETL workflows
* Cleaning and transforming raw datasets
* Designing analytical data models
* Writing advanced SQL queries
* Performing sales and customer analysis
* Applying data-quality checks
* Structuring a data engineering project using Git

---

## 🔍 Key Takeaways

This project provided hands-on experience with the workflow involved in transforming raw transactional data into a structured analytical system:

```text
Raw Data
   ↓
Data Ingestion
   ↓
Data Cleaning
   ↓
Data Transformation
   ↓
Data Modeling
   ↓
Analytical Queries
   ↓
Business Insights
```

The project helped bridge the gap between writing individual SQL queries and understanding how SQL can be used as part of a complete data warehousing workflow.

---

## 📚 Learning Reference

This project was developed as a learning implementation based on the **Data With Baraa SQL Data Warehouse Project**.

The original project and learning resources can be found on the Data With Baraa GitHub repository.

Credit: **Data With Baraa — Baraa Khatib Salkini**

---

## 📄 License

This project is intended for educational and portfolio purposes.

If you use or modify material from the original learning project, please provide appropriate attribution to the original creator.

