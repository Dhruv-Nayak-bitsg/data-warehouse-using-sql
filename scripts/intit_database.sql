/* 
CREATING A DATABSE AND SCHEMAS
---------------------------------------------
SCRIPT PURPOSE:
THIS SCRIPT CREATES A DATABSE CALLED DataWarehouse after checking it if already exists.
If it already exists then it is dropped and recreated. This also generates 3 schemas called-bronze,silver and gold.
---------------------------------------------
WARNING:
*/
USE MASTER;
GO

-- Drop and recreate the 'DataWarehouse' database
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'DataWarehouse')
BEGIN
    ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE DataWarehouse;
END;
GO

CREATE DATABASE DataWarehouse;
GO
USE DataWarehouse;
GO

-- Clean up existing schemas if you are rerunning this script to avoid duplicates
DROP SCHEMA IF EXISTS BRONZE;
DROP SCHEMA IF EXISTS SILVER;
DROP SCHEMA IF EXISTS GOLD;
GO

CREATE SCHEMA BRONZE;
GO

CREATE SCHEMA SILVER;
GO

CREATE SCHEMA GOLD;
GO




















