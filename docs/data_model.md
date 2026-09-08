# Data Model & Table Relationships

## Source Integration Model

The warehouse integrates CRM and ERP datasets around two primary business subjects: **Sales** and **Customers**, with product information shared between CRM and ERP.

```text
                    ┌─────────────────────┐
                    │  erp_px_cat_g1v2    │
                    │   Product Category  │
                    └──────────┬──────────┘
                               │ id
                               │
crm_prd_info.prd_key ──────────┘

crm_sales_details.prd_key ───► crm_prd_info
crm_sales_details.cst_id  ───► crm_cust_info

crm_cust_info.cst_key ───────► erp_cust_az12.cid
a                             └► erp_loc_a101.cid
```

## Business Objects

### Sales
`crm_sales_details` contains transactional records about sales and orders. Key fields represented in the model include `prd_key` and `cst_id`.

### Product
`crm_prd_info` contains current and historical product information. Product categories are enriched from `erp_px_cat_g1v2`.

### Customer
`crm_cust_info` contains customer information. Additional customer birthdate information comes from `erp_cust_az12`, while customer location/country information comes from `erp_loc_a101`.

## Integration Relationships

| Source Object | Related Object | Relationship Key | Purpose |
|---|---|---|---|
| `crm_sales_details` | `crm_prd_info` | `prd_key` | Link sales transactions to products |
| `crm_sales_details` | `crm_cust_info` | `cst_id` | Link sales transactions to customers |
| `crm_prd_info` | `erp_px_cat_g1v2` | `prd_key` → `id` | Enrich products with category information |
| `crm_cust_info` | `erp_cust_az12` | `cst_key` → `cid` | Enrich customers with birthdate information |
| `crm_cust_info` | `erp_loc_a101` | `cst_key` → `cid` | Enrich customers with location information |
