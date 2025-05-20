# Databricks notebook source
# MAGIC %run  /Workspace/Users/maheshkolipaka@outlook.com/Day1/ETL/includes

# COMMAND ----------

# DBTITLE 1,Reading
df=spark.read.csv(f"{input_path}/circuits.csv",header=True,inferSchema=True)


df1=df\
.withColumnsRenamed({"circuitId":"circuit_id","circuitRef":"circuit_ref"})\
.drop("url")\
.withColumn("ingestion_date",current_timestamp())



df1.write.mode("overwrite").saveAsTable("dev.mahesh.circuits")

# COMMAND ----------

# MAGIC %md
# MAGIC https://docs.databricks.com/aws/en/sql/language-manual/functions/read_files

# COMMAND ----------

# MAGIC %sql
# MAGIC --ctas
# MAGIC  --SELECT * FROM read_files(
# MAGIC  --   '/Volumes/dev/naval/raw/circuits.csv',
# MAGIC   --  format => 'csv')
