# Databricks notebook source
# MAGIC %run /Workspace/Users/maheshkolipaka@outlook.com/Day1/ETL/includes

# COMMAND ----------

# DBTITLE 1,Reading
df=spark.read.json(f"{input_path}/drivers.json")

# COMMAND ----------

df1=df.withColumn("forename",col("name.forename"))\
    .withColumn("surname",col("name.surname"))\
        .drop("name","url")

# COMMAND ----------

df2=add_ingestion_col(df1)

# COMMAND ----------

df2.write.mode("overwrite").saveAsTable("dev.mahesh.drivers")

# COMMAND ----------

# MAGIC %md
# MAGIC ### Method II 
# MAGIC Spark SQL
# MAGIC
# MAGIC parquet, single line json

# COMMAND ----------

# MAGIC %sql
# MAGIC select * from file_format.`path`
# MAGIC
# MAGIC CTAS
# MAGIC -- Create Table as Select * from file_format.`path`

# COMMAND ----------

# DBTITLE 1,CTAS
# MAGIC %sql
# MAGIC create table dev.mahesh.drivers_sql as 
# MAGIC select *, current_timestamp as ingestion_date from json.`/Volumes/dev/mahesh/raw/drivers.json`

# COMMAND ----------

# MAGIC %sql
# MAGIC select *, name.forename as forename from dev.mahesh.drivers_sql

# COMMAND ----------

# MAGIC %sql
# MAGIC select * from csv.`/Volumes/dev/mahesh/raw/circuits.csv`

# COMMAND ----------

# MAGIC %sql
# MAGIC describe extended dev.mahesh.drivers

# COMMAND ----------


