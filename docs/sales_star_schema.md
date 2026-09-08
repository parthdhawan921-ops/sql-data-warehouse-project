# Sales Data Mart — Star Schema

The Gold layer presents a sales-oriented Star Schema with one fact view and two dimension views.

```text
                 ┌────────────────────────┐
                 │   gold.dim_customers   │
                 │ PK customer_key        │
                 │ customer_id            │
                 │ customer_number       │
                 │ first_name / last_name │
                 │ country                │
                 │ marital_status         │
                 │ gender                 │
                 │ birthdate              │
                 └───────────┬────────────┘
                             │
                             │ customer_key
                             ▼
                  ┌──────────────────────┐
                  │   gold.fact_sales    │
                  │ order_number         │
                  │ FK product_key       │
                  │ FK customer_key      │
                  │ order_date           │
                  │ shipping_date        │
                  │ due_date             │
                  │ sales_amount         │
                  │ quantity              │
                  │ price                 │
                  └──────────┬───────────┘
                             │
                             │ product_key
                             ▼
                 ┌────────────────────────┐
                 │   gold.dim_products    │
                 │ PK product_key         │
                 │ product_id             │
                 │ product_number        │
                 │ product_name           │
                 │ category_id            │
                 │ category               │
                 │ subcategory            │
                 │ maintenance            │
                 │ cost                   │
                 │ product_line           │
                 │ start_date             │
                 └────────────────────────┘
```

## Fact View

### `gold.fact_sales`

Contains sales transaction measures and foreign keys used to connect each transaction to its customer and product dimensions.

Key fields:
- `order_number`
- `product_key`
- `customer_key`
- `order_date`
- `shipping_date`
- `due_date`
- `sales_amount`
- `quantity`
- `price`

## Dimension Views

### `gold.dim_customers`

Contains customer attributes including customer identifiers, name, country, marital status, gender, birthdate, and create date.

### `gold.dim_products`

Contains product attributes including product identifiers, product name, category, subcategory, maintenance, cost, product line, and start date.

## Key Business Logic

The sales model supports the relationship between transactional sales, customers, and products. The Gold dimension views generate surrogate keys using `ROW_NUMBER()`, which are then used by the sales fact view.

For sales analysis, the underlying model also supports the basic sales calculation:

```text
Sales = Quantity × Price
```
