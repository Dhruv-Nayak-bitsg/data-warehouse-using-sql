CREATE OR ALTER PROCEDURE bronze.load_bronze 
AS
BEGIN
    -- ==============================================================================
    -- Procedure: bronze.load_bronze
    -- Description: Truncates and bulk loads data into the Bronze layer tables 
    --              from raw CSV files (CRM and ERP systems). 
    --              Includes execution time tracking for performance monitoring.
    -- ==============================================================================
    
    DECLARE @start_time DATETIME, @end_time DATETIME; 
    DECLARE @batch_start_time DATETIME, @batch_end_time DATETIME;

    BEGIN TRY
        SET @batch_start_time = GETDATE();
        
        PRINT '=========================================';
        PRINT 'LOADING BRONZE LAYER';
        PRINT '=========================================';

        -- --------------------------------------------------------------------------
        -- 1. LOAD CRM DATA
        -- --------------------------------------------------------------------------
        PRINT '-----------------------------------------';
        PRINT 'LOADING CRM FILES';
        PRINT '-----------------------------------------';

        -- Table: bronze.crm_cust_info
        SET @start_time = GETDATE();
        TRUNCATE TABLE [bronze].[crm_cust_info];
        
        BULK INSERT [bronze].[crm_cust_info]
        FROM 'C:\Users\Nayak\Downloads\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\cust_info.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            TABLOCK
        );
        
        SELECT COUNT(*) AS crm_cust_info_row_count FROM [bronze].[crm_cust_info];
        SET @end_time = GETDATE();
        PRINT '>> LOAD TIME: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';

        -- Table: bronze.crm_prd_info
        SET @start_time = GETDATE();
        TRUNCATE TABLE [bronze].[crm_prd_info];
        
        BULK INSERT [bronze].[crm_prd_info]
        FROM 'C:\Users\Nayak\Downloads\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\prd_info.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            TABLOCK
        );
        
        SELECT COUNT(*) AS crm_prd_info_row_count FROM [bronze].[crm_prd_info];
        SET @end_time = GETDATE();
        PRINT '>> LOAD TIME: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';

        -- Table: bronze.crm_sales_details
        SET @start_time = GETDATE();
        TRUNCATE TABLE [bronze].[crm_sales_details];
        
        BULK INSERT [bronze].[crm_sales_details]
        FROM 'C:\Users\Nayak\Downloads\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\sales_details.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            TABLOCK
        );
        
        SELECT COUNT(*) AS crm_sales_details_row_count FROM [bronze].[crm_sales_details];
        SET @end_time = GETDATE();
        PRINT '>> LOAD TIME: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';


        -- --------------------------------------------------------------------------
        -- 2. LOAD ERP DATA
        -- --------------------------------------------------------------------------
        PRINT '-----------------------------------------';
        PRINT 'LOADING ERP FILES';
        PRINT '-----------------------------------------';

        -- Table: bronze.erp_cust_az12
        SET @start_time = GETDATE();
        TRUNCATE TABLE [bronze].[erp_cust_az12];
        
        BULK INSERT [bronze].[erp_cust_az12]
        FROM 'C:\Users\Nayak\Downloads\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\CUST_AZ12.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            TABLOCK
        );
        
        SELECT COUNT(*) AS erp_cust_az12_row_count FROM [bronze].[erp_cust_az12];
        SET @end_time = GETDATE();
        PRINT '>> LOAD TIME: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';

        -- Table: bronze.erp_loca_101
        SET @start_time = GETDATE();
        TRUNCATE TABLE [bronze].[erp_loca_101];
        
        BULK INSERT [bronze].[erp_loca_101]
        FROM 'C:\Users\Nayak\Downloads\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\LOC_A101.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            TABLOCK
        );
        
        SELECT COUNT(*) AS erp_loca_101_row_count FROM [bronze].[erp_loca_101];
        SET @end_time = GETDATE();
        PRINT '>> LOAD TIME: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';

        -- Table: bronze.erp_px_cat_g1v2
        SET @start_time = GETDATE();
        TRUNCATE TABLE [bronze].[erp_px_cat_g1v2];
        
        BULK INSERT [bronze].[erp_px_cat_g1v2]
        FROM 'C:\Users\Nayak\Downloads\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\PX_CAT_G1V2.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            TABLOCK
        );
        
        SELECT COUNT(*) AS erp_px_cat_g1v2_row_count FROM [bronze].[erp_px_cat_g1v2];
        SET @end_time = GETDATE();
        PRINT '>> LOAD TIME: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';


        -- --------------------------------------------------------------------------
        -- 3. BATCH COMPLETION
        -- --------------------------------------------------------------------------
        SET @batch_end_time = GETDATE();
        PRINT '=========================================';
        PRINT '<<< BATCH LOADING COMPLETE >>>';
        PRINT 'TOTAL BATCH TIME: ' + CAST(DATEDIFF(second, @batch_start_time, @batch_end_time) AS NVARCHAR) + ' seconds';
        PRINT '=========================================';

    END TRY
    BEGIN CATCH 
        PRINT '=========================================';
        PRINT 'ERROR OCCURRED DURING LOAD PROCESS';
        PRINT 'ERROR MESSAGE: ' + ERROR_MESSAGE();
        PRINT '=========================================';
    END CATCH
END;
