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
CRM / ERP CSVs
      │
      ▼
🥉 Bronze — Raw source data
      │
      ▼
🥈 Silver — Cleaned & standardized data
      │
      ▼
🥇 Gold — Business-ready analytical views
      │
      ├──────────────► BI / Dashboards
      └──────────────► SQL Analytics
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

## 📚 Documentation

Detailed project documentation is available in the [`docs/`](docs/) directory:

- [`data_layers.md`](docs/data_layers.md) — Bronze, Silver, and Gold responsibilities and workflow
- [`data_warehouse_architecture.md`](docs/data_warehouse_architecture.md) — warehouse architecture and layer design
- [`data_flow.md`](docs/data_flow.md) — source-to-Gold data lineage
- [`data_model.md`](docs/data_model.md) — CRM/ERP integration and table relationships
- [`data_catalog.md`](docs/data_catalog.md) — analytical objects and business definitions
- [`sales_star_schema.md`](docs/sales_star_schema.md) — Gold sales Star Schema and relationships

> The original visual architecture and data-model diagrams can also be kept in this `docs/` area as PDF references.

## ✅ Data Quality

Validation scripts cover:

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
- **Power BI** for downstream reporting

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
│   ├── silver/
│   └── gold/
│
├── tests/
├── docs/
├── LICENSE
└── README.md
```

## ▶️ How to Run

### 1. Prerequisites

Install **MySQL 8.0+** and a SQL client such as **MySQL Workbench**.

### 2. Run Bronze

Execute the Bronze DDL and loading procedure:

```text
scripts/bronze/ddl_bronze.sql
scripts/bronze/proc_load_bronze.sql
```

### 3. Run Silver

Execute the Silver DDL and loading procedure:

```text
scripts/silver/ddl_silver.sql
scripts/silver/proc_load_silver.sql
```

### 4. Run Gold

Execute:

```text
scripts/gold/ddl_gold.sql
```

### 5. Validate

Run the checks in:

```text
tests/quality_check_silver.sql
tests/quality_check_gold.sql
```

## 🔍 Skills Demonstrated

- SQL data transformation
- ETL pipeline design
- Data cleansing and standardization
- Dimensional modeling
- Star Schema design
- Surrogate key generation
- Data quality validation
- CRM + ERP data integration
- BI-ready data preparation

## 📈 Reporting Use Cases

The Gold model supports analysis of:

- Customer demographics and distribution
- Product and category performance
- Sales volume and revenue
- Order trends over time
- Customer-to-product purchasing relationships

## 📄 License

This project is intended for educational and portfolio purposes and is distributed under the included license.
