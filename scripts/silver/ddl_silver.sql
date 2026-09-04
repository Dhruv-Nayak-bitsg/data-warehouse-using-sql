/* -----------------------------------------------------------------------------
   Schema Definition: Silver Zone
   Purpose: Refreshes the DDL structure for all Silver-tier tables.
            Existing tables will be dropped prior to recreation.
   ----------------------------------------------------------------------------- */

-- ==========================================
-- CRM: Customer Data
-- ==========================================
DROP TABLE IF EXISTS silver.crm_cust_info;
GO

CREATE TABLE silver.crm_cust_info (
    cst_id              INT,
    cst_key             NVARCHAR(50),
    cst_firstname       NVARCHAR(50),
    cst_lastname        NVARCHAR(50),
    cst_marital_status  NVARCHAR(50),
    cst_gndr            NVARCHAR(50),
    cst_create_date     DATE,
    dwh_create_date     DATETIME2 CONSTRAINT DF_crm_cust_info_dwh DEFAULT GETDATE()
);
GO

-- ==========================================
-- CRM: Product Master
-- ==========================================
DROP TABLE IF EXISTS silver.crm_prd_info;
GO

CREATE TABLE silver.crm_prd_info (
    prd_id              INT,
    cat_id              NVARCHAR(50),
    prd_key             NVARCHAR(50),
    prd_nm              NVARCHAR(50),
    prd_cost            INT,
    prd_line            NVARCHAR(50),
    prd_start_dt        DATE,
    prd_end_dt          DATE,
    dwh_create_date     DATETIME2 CONSTRAINT DF_crm_prd_info_dwh DEFAULT GETDATE()
);
GO

-- ==========================================
-- CRM: Sales Transactions
-- ==========================================
DROP TABLE IF EXISTS silver.crm_sales_details;
GO

CREATE TABLE silver.crm_sales_details (
    sls_ord_num         NVARCHAR(50),
    sls_prd_key         NVARCHAR(50),
    sls_cust_id         INT,
    sls_order_dt        DATE,
    sls_ship_dt         DATE,
    sls_due_dt          DATE,
    sls_sales           INT,
    sls_quantity        INT,
    sls_price           INT,
    dwh_create_date     DATETIME2 CONSTRAINT DF_crm_sales_details_dwh DEFAULT GETDATE()
);
GO

-- ==========================================
-- ERP: Location Data
-- ==========================================
DROP TABLE IF EXISTS silver.erp_loc_a101;
GO

CREATE TABLE silver.erp_loc_a101 (
    cid                 NVARCHAR(50),
    cntry               NVARCHAR(50),
    dwh_create_date     DATETIME2 CONSTRAINT DF_erp_loc_a101_dwh DEFAULT GETDATE()
);
GO

-- ==========================================
-- ERP: Customer Demographics
-- ==========================================
DROP TABLE IF EXISTS silver.erp_cust_az12;
GO

CREATE TABLE silver.erp_cust_az12 (
    cid                 NVARCHAR(50),
    bdate               DATE,
    gen                 NVARCHAR(50),
    dwh_create_date     DATETIME2 CONSTRAINT DF_erp_cust_az12_dwh DEFAULT GETDATE()
);
GO

-- ==========================================
-- ERP: Product Categories
-- ==========================================
DROP TABLE IF EXISTS silver.erp_px_cat_g1v2;
GO

CREATE TABLE silver.erp_px_cat_g1v2 (
    id                  NVARCHAR(50),
    cat                 NVARCHAR(50),
    subcat              NVARCHAR(50),
    maintenance         NVARCHAR(50),
    dwh_create_date     DATETIME2 CONSTRAINT DF_erp_px_cat_dwh DEFAULT GETDATE()
);
GO
