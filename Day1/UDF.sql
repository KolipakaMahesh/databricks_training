-- Databricks notebook source
create function function_name(para)
returns datatype
return logic

-- COMMAND ----------

create or replace function dev.naval.full_name(first_name string, last_name string)
returns string
return concat(first_name," ",last_name)

-- COMMAND ----------

select *, dev.naval.full_name(forename,surname) as fullname from dev.naval.drivers
