/* ==============================================================================
   DATA QUALITY ASSURANCE SCRIPT - GOLD LAYER
   ------------------------------------------------------------------------------
   Objective: Validate data integrity, ensure surrogate key uniqueness, and 
              confirm referential integrity within the Gold zone (Star Schema).
   Usage:     Execute post-ETL. Empty result sets indicate passing checks.
============================================================================== */

-- ==============================================================================
-- 1.0 Validating Dimension: gold.dim_customers
-- ==============================================================================

-- 1.1 Surrogate Key Uniqueness
-- Expectation: 0 rows returned
SELECT 
    customer_key, 
    COUNT(1) AS occurrence_count 
FROM gold.dim_customers 
GROUP BY customer_key 
HAVING COUNT(1) > 1;


-- ==============================================================================
-- 2.0 Validating Dimension: gold.dim_products
-- ==============================================================================

-- 2.1 Surrogate Key Uniqueness
-- Expectation: 0 rows returned
SELECT 
    product_key, 
    COUNT(1) AS occurrence_count 
FROM gold.dim_products 
GROUP BY product_key 
HAVING COUNT(1) > 1;


-- ==============================================================================
-- 3.0 Validating Fact: gold.fact_sales
-- ==============================================================================

-- 3.1 Referential Integrity (Orphan Record Check)
-- Expectation: 0 rows returned (All fact records must map to valid dimensions)
SELECT 
    f.* 
FROM gold.fact_sales f
LEFT JOIN gold.dim_customers c 
    ON f.customer_key = c.customer_key
LEFT JOIN gold.dim_products p 
    ON f.product_key = p.product_key
WHERE c.customer_key IS NULL 
   OR p.product_key IS NULL;
