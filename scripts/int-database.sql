/*
=========================================================
Create Database and Schemas
=========================================================
Script Purpose;
  This script creates a new database named 'DataWarehouse' after checking if it already exists.
  If the database exists, it is dropped and recreated. Additionally, the script sets up three schemas 
  within the database: 'bronze', 'silver', 'gold'.

WARNING:
Running this script will drop the entire 'DataWarehouse' database if it exists.
All data in the database will be permanently deleted. Proceed with caution
and ensure you have proper backups running this script.
*/

USE MASTER;
GO

  
/* Here, Baraa is teaching how to drop and recreate datawarehouse, maybe to
	start on a new sheet or table*/

	--Drop and recreate the datawarehouse database
  
  IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'DataWarehouse')
  -- Checks whether a database named Datawarehouse already exists.
  
  BEGIN
    ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE; /*(restricts the database so only one 
	connection is allowed.)*/
	/*Forces all other users to disconnect.
Rolls back any uncommitted transactions :'Commit = save the changes permanently.
Rollback = discard the changes and restore the previous state.
WITH ROLLBACK IMMEDIATE = immediately disconnect users and automatically undo any work they haven't committed yet, 
so the database can be safely dropped.'
Ensures the database can be dropped.*/
/* we would not be able to drop the database succesfully without the alter because trying to drop the database
while people are still trying to put transactions the database might scatter it, infact you cant even drop it 
while people are still working on it*/

    DROP DATABASE Datawarehouse;
END;
GO 
  
CREATE DATABASE Datawarehouse;
GO

use Datawarehouse;
GO

CREATE SCHEMA bronze;
GO
  
CREATE SCHEMA silver;
GO
  
CREATE SCHEMA gold;
GO
