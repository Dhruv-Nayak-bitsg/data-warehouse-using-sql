/*
===============================================================================
DDL Script: Create Bronze Layer Tables
===============================================================================
Script Purpose:
    This script initializes the raw data tables for the 'bronze' layer of the 
    data warehouse. It establishes the schema for both CRM and ERP source 
    systems. Existing tables are intentionally dropped before creation to 
    ensure a clean, idempotent deployment.
===============================================================================
*/

-- ============================================================================
-- 1. CRM SYSTEM TABLES
-- ============================================================================

-- Table: bronze.crm_cust_info
-- Description: Raw customer information from the CRM system
IF OBJECT_ID ('[bronze].[crm_cust_info]', 'U') IS NOT NULL 
    DROP TABLE [bronze].[crm_cust_info];

CREATE TABLE [bronze].[crm_cust_info] (
    cst_id INT,
    cst_key NVARCHAR(50),
    cst_firstname NVARCHAR(50),
    cst_lastname NVARCHAR(50),
    cst_martial_status NVARCHAR(50),
    cst_gender NVARCHAR(50),
    cst_create_date DATE
);

-- Table: bronze.crm_prd_info
-- Description: Raw product catalog information from the CRM system
IF OBJECT_ID ('[bronze].[crm_prd_info]', 'U') IS NOT NULL 
    DROP TABLE [bronze].[crm_prd_info];

CREATE TABLE [bronze].[crm_prd_info] (
    prd_id INT,
    prd_key NVARCHAR(50),
    prd_nm NVARCHAR(50),
    prd_cost INT,
    prd_line NVARCHAR(50),
    prd_start_dt DATETIME,
    prd_end_dt DATETIME
);

-- Table: bronze.crm_sales_details
-- Description: Raw sales transaction records from the CRM system
IF OBJECT_ID ('[bronze].[crm_sales_details]', 'U') IS NOT NULL 
    DROP TABLE [bronze].[crm_sales_details];

CREATE TABLE [bronze].[crm_sales_details] (
    sls_order_num NVARCHAR(50),
    sls_prd_key NVARCHAR(50),
    sls_cust_id INT,
    sls_order_dt INT,
    sls_ship_dt INT,
    sls_due_dt INT,
    sls_sales_dt INT,
    sls_quantity_dt INT,
    sls_price_dt INT
);

-- ============================================================================
-- 2. ERP SYSTEM TABLES
-- ============================================================================

-- Table: bronze.erp_cust_az12
-- Description: Raw customer demographic data from the ERP system
IF OBJECT_ID ('[bronze].[erp_cust_az12]', 'U') IS NOT NULL 
    DROP TABLE [bronze].[erp_cust_az12];

CREATE TABLE [bronze].[erp_cust_az12] (
    cid NVARCHAR(50),
    bdate DATE,
    gen NVARCHAR(50)
);

-- Table: bronze.erp_loca_101
-- Description: Raw customer location mapping from the ERP system
IF OBJECT_ID ('[bronze].[erp_loca_101]', 'U') IS NOT NULL 
    DROP TABLE [bronze].[erp_loca_101];

CREATE TABLE [bronze].[erp_loca_101] (
    cid NVARCHAR(50),
    cntry NVARCHAR(50)
);

-- Table: bronze.erp_px_cat_g1v2
-- Description: Raw product category mapping from the ERP system
IF OBJECT_ID ('[bronze].[erp_px_cat_g1v2]', 'U') IS NOT NULL 
    DROP TABLE [bronze].[erp_px_cat_g1v2];

CREATE TABLE [bronze].[erp_px_cat_g1v2] (
    id NVARCHAR(50),
    cat NVARCHAR(50),
    subcat NVARCHAR(50),
    maintenance NVARCHAR(50)
);
