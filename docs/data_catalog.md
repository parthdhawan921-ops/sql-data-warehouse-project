# Data Catalog

This catalog documents the main CRM, ERP, and Gold objects represented in the warehouse design.

## Source Objects

| Object | Source | Business Area | Description |
|---|---|---|---|
| `crm_sales_details` | CRM | Sales | Transactional records about sales and orders |
| `crm_cust_info` | CRM | Customer | Customer information |
| `crm_prd_info` | CRM | Product | Current and historical product information |
| `erp_cust_az12` | ERP | Customer | Additional customer information, including birthdate |
| `erp_loc_a101` | ERP | Customer | Customer location information, including country |
| `erp_px_cat_g1v2` | ERP | Product | Product category information |

## Gold Objects

| Object | Type | Business Role |
|---|---|---|
| `gold.dim_customers` | Dimension View | Customer attributes for analysis |
| `gold.dim_products` | Dimension View | Product and category attributes for analysis |
| `gold.fact_sales` | Fact View | Sales transactions and measures |

## Gold Customer Attributes

`gold.dim_customers` includes:

- `customer_key`
- `customer_id`
- `customer_number`
- `first_name`
- `last_name`
- `country`
- `marital_status`
- `gender`
- `birthdate`
- `create_date`

## Gold Product Attributes

`gold.dim_products` includes:

- `product_key`
- `product_id`
- `product_number`
- `product_name`
- `category_id`
- `category`
- `subcategory`
- `maintenance`
- `cost`
- `product_line`
- `start_date`

## Gold Sales Attributes

`gold.fact_sales` includes:

- `order_number`
- `product_key`
- `customer_key`
- `order_date`
- `shipping_date`
- `due_date`
- `sales_amount`
- `quantity`
- `price`
