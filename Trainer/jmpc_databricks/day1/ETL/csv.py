# Databricks notebook source
ETL / ELT

1. pyspark dataframe style
2. spark sql style
3. UI (Databricks)

# COMMAND ----------

https://spark.apache.org/docs/latest/api/python/reference/index.html

# COMMAND ----------

from pyspark.sql.functions import *

# COMMAND ----------

# DBTITLE 1,Reading
df=spark.read.csv("/Volumes/dev/naval/raw/circuits.csv",header=True,inferSchema=True)
#df=spark.read.option("header","True").csv("/Volumes/dev/naval/raw/circuits.csv")
#df=spark.read.option("header","True").option("inferSchema",True).csv("/Volumes/dev/naval/raw/circuits.csv")

# COMMAND ----------

df.display()

# COMMAND ----------

# DBTITLE 1,Transformation
Lazy Evaluation
Transformation 

Dataframe functions
.select
.alias
.withColumnRenamed
.withColumn

Functions
col


and 

Action
show
display
count
write

# COMMAND ----------

# MAGIC %sql
# MAGIC select * from df

# COMMAND ----------



# COMMAND ----------

#df.select("*").display()
#df.select("circuitId","circuitRef").display()
#df.select("circuitId".alias("circuit_id"))
df.select(col("circuitId").alias("circuit_id")).display()

# COMMAND ----------

df.withColumnRenamed("circuitId","circuit_id").withColumnRenamed("circuitRef","circuit_ref").display()

# COMMAND ----------

df.withColumnsRenamed({"circuitId":"circuit_id","circuitRef":"circuit_ref"}).display()

# COMMAND ----------

df.withColumn("ingestion_date",current_timestamp()).display()

# COMMAND ----------

df.withColumn("circuitRef",upper("circuitRef")).display()

# COMMAND ----------

df.display()

# COMMAND ----------

df.write.mode("overwrite").saveAsTable("dev.naval.circuits")

# COMMAND ----------

# MAGIC %sql
# MAGIC select * from dev.naval.circuits
