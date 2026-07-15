/*******************************************************************************
   📌 Script Name: 02_creating_tables.sql
   👤 Author: Sherif Mohammed
   🎯 Purpose: Define the relational schema (DDL) for the Olympic database.

   ⚠️ WARNING / WARNING / WARNING:
   -----------------------------------------------------------------------------
   This script contains 'DROP TABLE IF EXISTS' statements. Executing this code 
   will PERMANENTLY DELETE the tables 'OLYMPIC_HISTORY' and 'OLYMPIC_HISTORY_NOC_REGIONS' 
   along with all their loaded data if they already exist in the database.
   
   Make sure you have completed the environment setup in script '01_creating_the_database.sql'
   before executing this file.
*******************************************************************************/

DROP TABLE IF EXISTS OLYMPIC_HISTORY;
CREATE TABLE OLYMPIC_HISTORY(
    ID     INT,
    Name   VARCHAR(255),
    Sex    VARCHAR(10),
    Age    VARCHAR(10),
    Height VARCHAR(10),
    Weight VARCHAR(10),
    Team   VARCHAR(255),
    NOC    VARCHAR(10),
    Games  VARCHAR(255),
    Year   INT,
    Season VARCHAR(50),
    City   VARCHAR(255),
    Sport  VARCHAR(255),
    Event  VARCHAR(255),
    Medal  VARCHAR(50)
);

DROP TABLE IF EXISTS OLYMPIC_HISTORY_NOC_REGIONS;
CREATE TABLE OLYMPIC_HISTORY_NOC_REGIONS(
    NOC    VARCHAR(10),
    region VARCHAR(255),
    notes  VARCHAR(255)
);
