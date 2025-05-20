# Databricks notebook source
from pyspark.sql.functions import *

# COMMAND ----------

input_path="/Volumes/dev/mahesh/raw/"

# COMMAND ----------

def add_ingestion_col(df):
    df_final=df.withColumn("ingestion_date",current_timestamp())
    return df_final
