/*
===============================================================================
Purpose
===============================================================================
This script creates the tables for the Silver layer of the data warehouse.

The script performs the following actions:
    - Drops existing Silver tables if they already exist.
    - Creates new tables for the CRM and ERP source systems.
    - Defines the required columns and data types for storing cleansed and
      standardized data.
    - Adds a data warehouse creation timestamp (dwh_create_date) to track
      when records are loaded into the Silver layer.
    - Prepares the Silver layer for loading transformed data from the
      Bronze layer.

The Silver layer stores cleansed, validated, and standardized data that has
been transformed from the raw Bronze layer. This layer serves as the
foundation for building the Gold layer and supporting analytical reporting.

WARNING:
Running this script will drop the existing Silver tables and permanently
delete any data currently stored in them.
===============================================================================
*/

-- =============================================
-- DROP TABLES IF THEY ALREADY EXIST
-- =============================================

DROP TABLE IF EXISTS silver.crm_cust_info;
DROP TABLE IF EXISTS silver.crm_prd_info;
DROP TABLE IF EXISTS silver.crm_sales_details;
DROP TABLE IF EXISTS silver.erp_cust_az12;
DROP TABLE IF EXISTS silver.erp_loc_a101;
DROP TABLE IF EXISTS silver.erp_px_cat_g1v2;


-- =============================================
-- CREATE CRM CUSTOMER INFO
-- =============================================

CREATE TABLE silver.crm_cust_info (
    cst_id INT,
    cst_key VARCHAR(50),
    cst_firstname VARCHAR(50),
    cst_lastname VARCHAR(50),
    cst_marital_status VARCHAR(50),
    cst_gndr VARCHAR(50),
    cst_create_date DATE,
    dwh_create_date DATETIME DEFAULT CURRENT_TIMESTAMP
);


-- =============================================
-- CREATE CRM PRODUCT INFO
-- =============================================

CREATE TABLE silver.crm_prd_info (
    prd_id INT,
    cat_id VARCHAR(50),
    prd_key VARCHAR(50),
    prd_nm VARCHAR(50),
    prd_cost INT,
    prd_line VARCHAR(50),
    prd_start_dt DATETIME,
    prd_end_dt DATETIME,
    dwh_create_date DATETIME DEFAULT CURRENT_TIMESTAMP
);


-- =============================================
-- CREATE CRM SALES DETAILS
-- =============================================

CREATE TABLE silver.crm_sales_details (
    sls_ord_num VARCHAR(50),
    sls_prd_key VARCHAR(50),
    sls_cust_id INT,
    sls_order_dt DATE,
    sls_ship_dt DATE,
    sls_due_dt DATE,
    sls_sales INT,
    sls_quantity INT,
    sls_price INT,
    dwh_create_date DATETIME DEFAULT CURRENT_TIMESTAMP
);


-- =============================================
-- CREATE ERP CUSTOMER
-- =============================================

CREATE TABLE silver.erp_cust_az12 (
    cid VARCHAR(50),
    bdate DATE,
    gen VARCHAR(50),
    dwh_create_date DATETIME DEFAULT CURRENT_TIMESTAMP
);


-- =============================================
-- CREATE ERP LOCATION
-- =============================================

CREATE TABLE silver.erp_loc_a101 (
    cid VARCHAR(50),
    cntry VARCHAR(50),
    dwh_create_date DATETIME DEFAULT CURRENT_TIMESTAMP
);


-- =============================================
-- CREATE ERP PRODUCT CATEGORY
-- =============================================

CREATE TABLE silver.erp_px_cat_g1v2 (
    id VARCHAR(50),
    cat VARCHAR(50),
    subcat VARCHAR(50),
    maintenance VARCHAR(50),
    dwh_create_date DATETIME DEFAULT CURRENT_TIMESTAMP
);
