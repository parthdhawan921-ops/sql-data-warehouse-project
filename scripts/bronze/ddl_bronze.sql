/*
===============================================================================
Purpose
===============================================================================
This script creates the tables for the Bronze layer of the data warehouse.

The script performs the following actions:
    - Drops existing Bronze tables if they already exist.
    - Creates new tables for the CRM and ERP source systems.
    - Defines the required columns and data types for storing raw source data.
    - Prepares the Bronze layer for loading data from the source CSV files.

The Bronze layer stores raw data from the source systems before any
cleaning, transformation, or standardization is performed.

WARNING:
Running this script will drop the existing Bronze tables and permanently
delete any data currently stored in them.
===============================================================================
*/

-- =============================================
-- DROP TABLES IF THEY ALREADY EXIST
-- =============================================

DROP TABLE IF EXISTS bronze.crm_cust_info;
DROP TABLE IF EXISTS bronze.crm_prd_info;
DROP TABLE IF EXISTS bronze.crm_sales_details;
DROP TABLE IF EXISTS bronze.erp_cust_az12;
DROP TABLE IF EXISTS bronze.erp_loc_a101;
DROP TABLE IF EXISTS bronze.erp_px_cat_g1v2;


-- =============================================
-- CREATE CRM CUSTOMER INFO
-- =============================================

CREATE TABLE bronze.crm_cust_info (
    cst_id INT,
    cst_key VARCHAR(50),
    cst_firstname VARCHAR(50),
    cst_lastname VARCHAR(50),
    cst_marital_status VARCHAR(50),
    cst_gndr VARCHAR(50),
    cst_create_date DATE
);


-- =============================================
-- CREATE CRM PRODUCT INFO
-- =============================================

CREATE TABLE bronze.crm_prd_info (
    prd_id INT,
    prd_key VARCHAR(50),
    prd_nm VARCHAR(50),
    prd_cost INT,
    prd_line VARCHAR(50),
    prd_start_dt DATETIME,
    prd_end_dt DATETIME
);


-- =============================================
-- CREATE CRM SALES DETAILS
-- =============================================

CREATE TABLE bronze.crm_sales_details (
    sls_ord_num VARCHAR(50),
    sls_prd_key VARCHAR(50),
    sls_cust_id INT,
    sls_order_dt INT,
    sls_ship_dt INT,
    sls_due_dt INT,
    sls_sales INT,
    sls_quantity INT,
    sls_price INT
);


-- =============================================
-- CREATE ERP CUSTOMER
-- =============================================

CREATE TABLE bronze.erp_cust_az12 (
    cid VARCHAR(50),
    bdate DATE,
    gen VARCHAR(50)
);


-- =============================================
-- CREATE ERP LOCATION
-- =============================================

CREATE TABLE bronze.erp_loc_a101 (
    cid VARCHAR(50),
    cntry VARCHAR(50)
);


-- =============================================
-- CREATE ERP PRODUCT CATEGORY
-- =============================================

CREATE TABLE bronze.erp_px_cat_g1v2 (
    id VARCHAR(50),
    cat VARCHAR(50),
    subcat VARCHAR(50),
    maintenance VARCHAR(50)
);
