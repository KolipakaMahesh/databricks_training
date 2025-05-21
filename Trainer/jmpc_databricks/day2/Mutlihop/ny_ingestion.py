# Databricks notebook source
# MAGIC %run /Workspace/Users/naval@thedatamaster.in/day2/Mutlihop/include

# COMMAND ----------

dbutils.widgets.text("catalog","dev")
dbutils.widgets.text("schema","default")
dbutils.widgets.text("table","tblname")
catalog=dbutils.widgets.get("catalog")
schema=dbutils.widgets.get("schema")
table=dbutils.widgets.get("table")

# COMMAND ----------

df=spark.read.csv(f"{input_path}{table}.csv",header=True,inferSchema=True)


df1=add_ingestion(df)


df1.write.mode("overwrite").saveAsTable(f"{catalog}.{schema}.{table}")

# COMMAND ----------

df=spark.read.table(f"{catalog}.{schema}.{table}")
display(df)
