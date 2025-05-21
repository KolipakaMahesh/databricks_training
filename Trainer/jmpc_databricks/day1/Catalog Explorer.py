# Databricks notebook source
# MAGIC %md
# MAGIC ![](/Volumes/dev/naval/raw/object-model-0ed879da6c005615e8a00db9bb10823c.png)

# COMMAND ----------

https://docs.databricks.com/aws/en/data-governance/unity-catalog/

# COMMAND ----------

# MAGIC %sql
# MAGIC use catalog dev;
# MAGIC --use schema naval;

# COMMAND ----------

# MAGIC %sql
# MAGIC create schema if not exists dev.naval

# COMMAND ----------

# MAGIC %sql
# MAGIC create table if not exists dev.naval.demo (id int)

# COMMAND ----------

# MAGIC %sql
# MAGIC insert into dev.naval.demo values (1)

# COMMAND ----------

# MAGIC %sql
# MAGIC select * from dev.naval.demo

# COMMAND ----------

# MAGIC %sql
# MAGIC describe detail dev.naval.demo

# COMMAND ----------

# MAGIC %sql
# MAGIC describe extended dev.naval.demo
