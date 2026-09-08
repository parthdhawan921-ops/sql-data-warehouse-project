# Data Warehouse Architecture

## Overview

This project uses a **Bronze → Silver → Gold** architecture to move source data from raw ingestion to business-ready analytical objects.

```text
CRM / ERP CSV Files
        |
        v
+------------------+
|  Bronze Layer    |
| Raw source data  |
| Tables           |
+--------+---------+
         |
         v
+------------------+
|  Silver Layer    |
| Cleaned data     |
| Tables           |
+--------+---------+
         |
         v
+------------------+
|   Gold Layer     |
| Business-ready   |
| Views / Star     |
| Schema           |
+--------+---------+
         |
         +--------------------+
         |                    |
         v                    v
   BI / Reporting       SQL Analytics
```

## Source data

### CRM

- `cust_info.csv` — customer information
- `prd_info.csv` — product information
- `sales_details.csv` — sales transactions

### ERP

- `CUST_AZ12.csv` — additional customer information
- `LOC_A101.csv` — customer location information
- `PX_CAT_G1V2.csv` — product category information

## Warehouse layers

### Bronze

Raw source data is loaded with minimal transformation and preserved for traceability, debugging, and reprocessing.

### Silver

Source data is cleaned, standardized, and integrated into consistent analytical structures. This layer is responsible for the main data-quality and transformation work.

### Gold

The Gold layer provides business-ready views for analytical consumption. The current model contains customer and product dimensions and a sales fact view.

## Consumption

The Gold layer is designed for SQL analysis and downstream BI/reporting tools such as Power BI.
