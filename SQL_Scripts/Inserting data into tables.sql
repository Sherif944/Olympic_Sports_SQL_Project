/*******************************************************************************
   📌 Script Name: 03_Inserting_data_into_tables.sql
   👤 Author: Sherif Mohammed
   🎯 Purpose: High-performance bulk data ingestion from raw CSV sources.

   ⚠️ WARNING / WARNING / WARNING:
   -----------------------------------------------------------------------------
   This script utilizes 'TRUNCATE TABLE' before execution. Running this script 
   will IMMEDIATELY WIPED OUT and EMPTY all existing records in 'OLYMPIC_HISTORY' 
   and 'OLYMPIC_HISTORY_NOC_REGIONS' before inserting the new records.
   
   👉 CRUCIAL STEP BEFORE RUNNING:
      You MUST modify the file paths in the 'FROM' clauses below to match the exact 
      local directory where your CSV files are saved.
*******************************************************************************/

TRUNCATE TABLE OLYMPIC_HISTORY;
GO

BULK INSERT [dbo].[OLYMPIC_HISTORY]
FROM 'D:\Data Analysis\Olympic Sports\athlete_events.csv'
WITH (
    FIRSTROW = 2,
    FORMAT = 'CSV',
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    TABLOCK
);
GO

TRUNCATE TABLE OLYMPIC_HISTORY_NOC_REGIONS;
GO

BULK INSERT [dbo].[OLYMPIC_HISTORY_NOC_REGIONS]
FROM 'D:\Data Analysis\Olympic Sports\noc_regions.CSV'
WITH (
    FIRSTROW = 2,
    FORMAT = 'CSV',
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    TABLOCK
);
GO
