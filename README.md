# SQL Data Warehouse Project (MySQL)

## 📌 Project Overview

This project demonstrates the design and implementation of a modern **SQL Data Warehouse** using **MySQL** and the **Medallion Architecture** (Bronze, Silver, and Gold layers).

The project implements a complete ETL pipeline that extracts raw CRM and ERP data from CSV files, transforms and cleans the data, and builds analytical models for reporting and business intelligence.

---

## 🏗️ Data Architecture

The project follows the **Medallion Architecture**, consisting of three layers:

### 🥉 Bronze Layer
- Stores raw data loaded directly from source CSV files.
- Preserves original source data.
- No transformations are applied.

### 🥈 Silver Layer
- Cleans and transforms the Bronze data.
- Removes duplicates.
- Standardizes values.
- Handles missing and invalid data.
- Prepares data for analytics.

### 🥇 Gold Layer
- Contains business-ready analytical data.
- Implements a Star Schema.
- Provides dimension and fact tables for reporting.

---

## 🎯 Project Objectives

- Build a SQL Data Warehouse using MySQL.
- Design a Medallion Architecture.
- Develop ETL processes for loading and transforming data.
- Perform data cleansing and validation.
- Create analytical data models.
- Support business intelligence and reporting.

---

## 📊 Analytics & Reporting

The Gold layer enables analysis of:

- Customer Behavior
- Product Performance
- Sales Trends
- Business KPIs

---

## 🛠️ Technologies Used

- MySQL 8.0+
- SQL
- MySQL Workbench
- CSV Files

---

## 📂 Project Structure

```text
data-warehouse-project/
│
├── datasets/
│   ├── source_crm/
│   └── source_erp/
│
├── scripts/
│   ├── bronze/
│   │   ├── ddl_bronze.sql
│   │   └── load_bronze.sql
│   │
│   ├── silver/
│   │   ├── ddl_silver.sql
│   │   ├── load_silver.sql
│   │   └── quality_checks.sql
│   │
│   └── gold/
│       ├── ddl_gold.sql
│       ├── create_views.sql
│       └── quality_checks.sql
│
├── README.md
└── .gitignore
```

---

## ⚙️ ETL Workflow

```text
CSV Files
    │
    ▼
Bronze Layer
(Raw Data)
    │
    ▼
Silver Layer
(Cleaned & Transformed Data)
    │
    ▼
Gold Layer
(Analytical Models)
```

---

## ✅ Data Quality Checks

Quality validation is performed throughout the project, including:

- Duplicate primary keys
- NULL value checks
- Data consistency validation
- Invalid date detection
- Data standardization
- Referential integrity between fact and dimension tables

---

## ⭐ Gold Layer Data Model

### Dimension Tables
- `dim_customers`
- `dim_products`

### Fact Table
- `fact_sales`

---

## 🚀 How to Run

1. Create the databases:
   - `bronze`
   - `silver`
   - `gold`

2. Execute the Bronze scripts:
   - Create Bronze tables
   - Load raw CSV data

3. Execute the Silver scripts:
   - Create Silver tables
   - Clean and transform the data

4. Execute the Gold scripts:
   - Create dimension tables
   - Create fact tables and analytical views

5. Run the quality check scripts to validate the data.

---

## 📄 License

This project is intended for educational and portfolio purposes.
