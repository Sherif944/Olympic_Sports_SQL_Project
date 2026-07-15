/*******************************************************************************
   📌 Script Name: 01_creating_the_database.sql
   👤 Author: Sherif Mohammed
   🎯 Purpose: Automated environment setup and initialization for the Olympic Sports database.

   ⚠️ WARNING / WARNING / WARNING:
   -----------------------------------------------------------------------------
   This script drops the database 'OlympicSports' if it already exists on your server.
   Executing this script will PERMANENTLY DELETE and OVERWRITE any existing database 
   with the same name, including all of its tables, schemas, and loaded records.
   
   Please ensure you have backed up any critical data before running this script.
*******************************************************************************/

-- Rollback active connections safely and rebuild the environment

IF (SELECT 1 FROM sys.databases WHERE NAME = 'OlympicSports') IS NOT NULL
BEGIN
    ALTER DATABASE OlympicSports SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE OlympicSports;
END;
GO

-- Create a fresh instance of the database
CREATE DATABASE OlympicSports;
GO
