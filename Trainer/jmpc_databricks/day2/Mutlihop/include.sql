-- Databricks notebook source
create schema if not exists dev.naval_bronze;
create schema if not exists dev.naval_silver;
create schema if not exists dev.naval_gold;

-- COMMAND ----------

-- MAGIC %python
-- MAGIC from pyspark.sql.functions import *

-- COMMAND ----------

-- MAGIC %python
-- MAGIC input_path='s3://jpmctraining/raw/'

-- COMMAND ----------

-- MAGIC %python
-- MAGIC def add_ingestion(df):
-- MAGIC     df1=df.withColumn("ingestion_date",current_timestamp()).withColumn("path",col("_metadata.file_path"))
-- MAGIC     return df1
