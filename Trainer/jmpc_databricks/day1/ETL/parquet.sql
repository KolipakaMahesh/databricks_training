-- Databricks notebook source
/Volumes/dev/naval/raw/part-00000-7951754c-3166-4cb7-8227-a5760c654c14-c000.snappy.parquet

-- COMMAND ----------

--create table dev.naval.customer_parquet as 
select * from parquet.`/Volumes/dev/naval/raw/part-00000-7951754c-3166-4cb7-8227-a5760c654c14-c000.snappy.parquet`

-- COMMAND ----------

-- MAGIC %python
-- MAGIC df=spark.read.parquet("/Volumes/dev/naval/raw/part-00000-7951754c-3166-4cb7-8227-a5760c654c14-c000.snappy.parquet")

-- COMMAND ----------

-- MAGIC %python
-- MAGIC df.write.saveAsTable("dev.naval.customer_part")

-- COMMAND ----------

-- MAGIC %python
-- MAGIC df=spark.read.table("dev.naval.customer_part")

-- COMMAND ----------

-- MAGIC %python
-- MAGIC df1=df\
-- MAGIC .withColumn("age", df["age"].cast("int"))\
-- MAGIC .withColumn("zip", df["zip"].cast("int"))

-- COMMAND ----------

-- MAGIC %python
-- MAGIC df1.write.mode("overwrite").option("overwriteSchema", "true").saveAsTable("dev.naval.customer_part")

-- COMMAND ----------

select * from dev.naval.customer_part

-- COMMAND ----------


