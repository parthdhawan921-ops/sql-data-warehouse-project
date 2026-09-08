# Data Flow & Lineage

## Source to Gold Flow

The project integrates CRM and ERP source files through the three warehouse layers.

```text
CRM CSVs ──► Bronze ──► Silver ──┬──► gold.fact_sales
                                  ├──► gold.dim_customers
                                  └──► gold.dim_products

ERP CSVs ──► Bronze ──► Silver ────┘
```

## Source Tables

### CRM
- `crm_sales_details`
- `crm_cust_info`
- `crm_prd_info`

### ERP
- `erp_cust_az12`
- `erp_loc_a101`
- `erp_px_cat_g1v2`

Each source dataset is first loaded into Bronze and then processed into the corresponding Silver tables.

## Gold Outputs

### `gold.fact_sales`
Built from Silver sales data and linked to the Gold customer and product dimensions.

### `gold.dim_customers`
Combines customer information with ERP customer and location information.

### `gold.dim_products`
Combines CRM product information with ERP product-category information.

## Lineage Summary

```text
CRM / ERP Sources
      │
      ▼
Bronze Tables
      │
      ▼
Silver Tables
      │
      ├──────────────┐
      ▼              ▼
Gold Dimensions   Gold Fact
      │              │
      └──────┬───────┘
             ▼
      Reporting / Analytics
```
