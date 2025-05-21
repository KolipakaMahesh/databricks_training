-- Databricks notebook source
Delta : Open source framework that helps you to build lakehouse.

delta (internally)

parquet (Data)
+ 
_delta_log
1. crc
2. json
3. checkpoint (parquet)



iceberg
parquet
+ 
metadata



-- COMMAND ----------

create table dev.naval.emp(id int, name string)

-- COMMAND ----------

describe extended dev.naval.emp

-- COMMAND ----------

desc history dev.naval.emp

-- COMMAND ----------

desc detail dev.naval.emp

-- COMMAND ----------

--insert into dev.naval.emp values (1, 'Naval');
--insert into dev.naval.emp values (2, 'Saritha'),(3,'Kamal'),(4,'Divya')
insert into dev.naval.emp values (5,'Nilesh')

-- COMMAND ----------

select * from dev.naval.emp

-- COMMAND ----------

delete from dev.naval.emp where id = 3

-- COMMAND ----------

select * from dev.naval.emp version as of 9

-- COMMAND ----------

select * from dev.naval.emp --timestamp as of '2025-05-20T06:15:39.000+00:00'

-- COMMAND ----------

delete from dev.naval.emp

-- COMMAND ----------

restore table dev.naval.emp to version as of 9

-- COMMAND ----------

-- MAGIC %md
-- MAGIC - Optimize: Combine small parquet into large
-- MAGIC - z order: indexing
-- MAGIC - vacuum: help to remove slate files (unused)

-- COMMAND ----------

optimize dev.naval.emp
zorder by (id)

-- COMMAND ----------

liquid clustering: 
https://docs.databricks.com/aws/en/delta/clustering#enable-or-disable-automatic-clustering

-- COMMAND ----------

-- MAGIC %md
-- MAGIC #### Vacuum has rentention period 7 days = 168 hours 

-- COMMAND ----------

vacuum dev.naval.emp

-- COMMAND ----------

vacuum dev.naval.emp retain 0 hours

-- COMMAND ----------

SET spark.databricks.delta.retentionDurationCheck.enabled = false

-- COMMAND ----------

vacuum dev.naval.emp retain 0 hours
