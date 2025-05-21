# Databricks notebook source
# DBTITLE 1,Sales
df=spark.table("dev.naval_bronze.sales")


df1=df.dropDuplicates().dropna().drop("ingestion_date","path")


df1.write.mode("overwrite").saveAsTable("dev.naval_silver.sales")
