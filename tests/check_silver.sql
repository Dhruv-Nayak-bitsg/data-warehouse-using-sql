/* ==============================================================================
   DATA QUALITY ASSURANCE SCRIPT - SILVER LAYER
   ------------------------------------------------------------------------------
   Objective: Validate data integrity, standardize domains, and identify anomalies 
              within the Silver zone prior to Gold layer promotion.
   Usage:     Execute post-ETL. Empty result sets indicate passing checks.
============================================================================== */

-- ==============================================================================
-- 1.0 Validating: silver.crm_cust_info
-- ==============================================================================

-- 1.1 PK Integrity & Duplication
-- Expectation: 0 rows returned
SELECT 
    cst_id, 
    COUNT(1) AS duplicate_count 
FROM silver.crm_cust_info 
GROUP BY cst_id 
HAVING COUNT(1) > 1 OR cst_id IS NULL;

-- 1.2 Leading/Trailing Space Detection
-- Expectation: 0 rows returned
SELECT cst_key 
FROM silver.crm_cust_info 
WHERE cst_key LIKE ' %' OR cst_key LIKE '% ';

-- 1.3 Domain Values Check (Visual Inspection)
SELECT DISTINCT cst_marital_status 
FROM silver.crm_cust_info
ORDER BY 1;


-- ==============================================================================
-- 2.0 Validating: silver.crm_prd_info
-- ==============================================================================

-- 2.1 PK Integrity & Duplication
-- Expectation: 0 rows returned
SELECT 
    prd_id, 
    COUNT(1) AS duplicate_count 
FROM silver.crm_prd_info 
GROUP BY prd_id 
HAVING COUNT(1) > 1 OR prd_id IS NULL;

-- 2.2 Leading/Trailing Space Detection
-- Expectation: 0 rows returned
SELECT prd_nm 
FROM silver.crm_prd_info 
WHERE prd_nm LIKE ' %' OR prd_nm LIKE '% ';

-- 2.3 Cost Validation (No Negative or Null values)
-- Expectation: 0 rows returned
SELECT prd_cost 
FROM silver.crm_prd_info 
WHERE COALESCE(prd_cost, -1) < 0;

-- 2.4 Domain Values Check (Visual Inspection)
SELECT DISTINCT prd_line 
FROM silver.crm_prd_info
ORDER BY 1;

-- 2.5 Temporal Validity (Start vs End Date)
-- Expectation: 0 rows returned
SELECT * 
FROM silver.crm_prd_info 
WHERE prd_end_dt < prd_start_dt;


-- ==============================================================================
-- 3.0 Validating: silver.crm_sales_details
-- ==============================================================================

-- 3.1 Unreasonable Date Values (Raw Source Check)
-- Expectation: 0 rows returned
SELECT sls_due_dt 
FROM bronze.crm_sales_details
WHERE sls_due_dt <= 0 
   OR LEN(CAST(sls_due_dt AS VARCHAR)) <> 8 
   OR sls_due_dt NOT BETWEEN 19000101 AND 20500101;

-- 3.2 Logical Date Flow Constraints
-- Expectation: 0 rows returned
SELECT * 
FROM silver.crm_sales_details 
WHERE sls_order_dt > sls_ship_dt 
   OR sls_order_dt > sls_due_dt;

-- 3.3 Financial Math & Missing Value Constraints
-- Expectation: 0 rows returned
SELECT 
    sls_sales, 
    sls_quantity, 
    sls_price 
FROM silver.crm_sales_details 
WHERE sls_sales <> (sls_quantity * sls_price)
   OR COALESCE(sls_sales, 0) <= 0 
   OR COALESCE(sls_quantity, 0) <= 0 
   OR COALESCE(sls_price, 0) <= 0
ORDER BY sls_sales, sls_quantity, sls_price;


-- ==============================================================================
-- 4.0 Validating: silver.erp_cust_az12
-- ==============================================================================

-- 4.1 Logical Date Bounds
-- Expectation: 0 rows returned
SELECT DISTINCT bdate 
FROM silver.erp_cust_az12 
WHERE bdate < '1924-01-01' 
   OR bdate > CAST(GETDATE() AS DATE);

-- 4.2 Domain Values Check (Visual Inspection)
SELECT DISTINCT gen 
FROM silver.erp_cust_az12
ORDER BY 1;


-- ==============================================================================
-- 5.0 Validating: silver.erp_loc_a101
-- ==============================================================================

-- 5.1 Domain Values Check (Visual Inspection)
SELECT DISTINCT cntry 
FROM silver.erp_loc_a101 
ORDER BY 1;


-- ==============================================================================
-- 6.0 Validating: silver.erp_px_cat_g1v2
-- ==============================================================================

-- 6.1 Leading/Trailing Space Detection
-- Expectation: 0 rows returned
SELECT * 
FROM silver.erp_px_cat_g1v2 
WHERE cat LIKE ' %' OR cat LIKE '% '
   OR subcat LIKE ' %' OR subcat LIKE '% '
   OR maintenance LIKE ' %' OR maintenance LIKE '% ';

-- 6.2 Domain Values Check (Visual Inspection)
SELECT DISTINCT maintenance 
FROM silver.erp_px_cat_g1v2
ORDER BY 1;
