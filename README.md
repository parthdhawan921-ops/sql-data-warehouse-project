# SQL Data Warehouse Project — MySQL

> A portfolio-grade SQL data warehouse built with **MySQL 8.0+**, using a **Bronze → Silver → Gold (Medallion)** architecture to transform raw CRM and ERP data into a reporting-ready **Star Schema**.

## 📌 Project Overview

This project demonstrates an end-to-end data warehousing workflow:

**CSV source data → Bronze (raw) → Silver (cleaned) → Gold (business-ready) → BI / analytics**

The Gold layer exposes analytical views for **customers, products, and sales**, designed for reporting and BI tools such as Power BI.

## 🎯 Objectives

- Design a layered SQL data warehouse using the Medallion Architecture.
- Load and preserve raw source data in the Bronze layer.
- Clean, standardize, validate, and integrate data in the Silver layer.
- Build business-ready dimensional and fact views in the Gold layer.
- Apply a Star Schema suitable for analytical reporting.
- Add SQL-based data quality checks across the warehouse.

## 🏗️ Architecture

```text
                         ┌─────────────────────┐
                         │   CRM / ERP CSVs    │
                         └──────────┬──────────┘
                                    │
                                    ▼
                         ┌─────────────────────┐
                         │   🥉 Bronze Layer   │
                         │     Raw / Source    │
                         └──────────┬──────────┘
                                    │
                                    ▼
                         ┌─────────────────────┐
                         │   🥈 Silver Layer   │
                         │ Cleaned / Integrated│
                         └──────────┬──────────┘
                                    │
                                    ▼
                         ┌─────────────────────┐
                         │    🥇 Gold Layer    │
                         │  Star Schema Views  │
                         └──────────┬──────────┘
                                    │
                    ┌───────────────┴───────────────┐
                    ▼                               ▼
             BI / Dashboards                 SQL Analytics
               (e.g. Power BI)                 & Reporting
```

### Bronze
Raw data loaded with minimal transformation, preserving source values for traceability and reprocessing.

### Silver
Cleans and standardizes source data, handles duplicates and invalid values, and integrates CRM/ERP datasets into consistent analytical structures.

### Gold
Provides business-ready views organized as a Star Schema:

- `gold.dim_customers`
- `gold.dim_products`
- `gold.fact_sales`

The Gold dimension views use generated surrogate keys, while the sales fact view connects transactional records to customer and product dimensions.

## 📊 Analytical Model

| Object | Type | Purpose |
|---|---|---|
| `dim_customers` | Dimension | Customer attributes such as name, country, gender, marital status, and birthdate |
| `dim_products` | Dimension | Product, category, subcategory, cost, product line, and start-date attributes |
| `fact_sales` | Fact | Orders, dates, customers, products, sales amount, quantity, and price |

## ✅ Data Quality

Validation scripts cover areas such as:

- Duplicate key detection
- NULL checks
- Data consistency
- Invalid date checks
- Standardization checks
- Referential integrity between fact and dimension data

## 🛠️ Tech Stack

- **MySQL 8.0+**
- **SQL**
- **MySQL Workbench**
- **CSV**
- **Power BI** (for downstream reporting)

## 📂 Repository Structure

```text
sql-data-warehouse-project/
│
├── datasets/
│   ├── source_crm/
│   │   ├── cust_info.csv
│   │   ├── prd_info.csv
│   │   └── sales_details.csv
│   │
│   └── source_erp/
│       ├── CUST_AZ12.csv
│       ├── LOC_A101.csv
│       └── PX_CAT_G1V2.csv
│
├── scripts/
│   ├── bronze/
│   │   ├── ddl_bronze.sql
│   │   └── proc_load_bronze.sql
│   │
│   ├── silver/
│   │   ├── ddl_silver.sql
│   │   └── proc_load_silver.sql
│   │
│   └── gold/
│       └── ddl_gold.sql
│
├── tests/
│   ├── quality_check_silver.sql
│   └── quality_check_gold.sql
│
├── LICENSE
└── README.md
```

## ▶️ How to Run

### 1. Prerequisites

Install **MySQL 8.0+** and a SQL client such as **MySQL Workbench**.

### 2. Prepare databases

Create the required databases/schemas used by the Bronze, Silver, and Gold scripts.

### 3. Run Bronze

Execute:

```text
scripts/bronze/ddl_bronze.sql
scripts/bronze/proc_load_bronze.sql
```

This creates the raw layer and loads the source CSV data.

### 4. Run Silver

Execute:

```text
scripts/silver/ddl_silver.sql
scripts/silver/proc_load_silver.sql
```

This creates the cleaned and transformed layer.

### 5. Run Gold

Execute:

```text
scripts/gold/ddl_gold.sql
```

This creates the analytical Gold views and Star Schema model.

### 6. Validate the warehouse

Run the SQL checks in:

```text
tests/quality_check_silver.sql
tests/quality_check_gold.sql
```

## 🔍 What This Project Demonstrates

This project highlights practical data analyst / analytics engineering skills including:

- SQL data transformation
- ETL pipeline design
- Data cleansing and standardization
- Dimensional modeling
- Star Schema design
- Surrogate key generation
- Data quality validation
- CRM + ERP data integration
- BI-ready data preparation

## 📈 Example Reporting Use Cases

The Gold model can support analysis of:

- Customer demographics and distribution
- Product and category performance
- Sales volume and revenue
- Order trends over time
- Customer-to-product purchasing relationships

## 📄 License

This project is intended for educational and portfolio purposes and is distributed under the included license.
