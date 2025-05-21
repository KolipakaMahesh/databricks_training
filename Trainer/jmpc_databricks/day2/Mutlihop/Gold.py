# Databricks notebook source
#df=spark.table("dev.naval_silver.sales")
#df1=df.groupBy("customer_id").count()

# COMMAND ----------

# MAGIC %sql
# MAGIC create or replace view dev.naval_gold.customer_count as
# MAGIC select customer_id,count(*) as count from dev.naval_silver.sales group by customer_id

# COMMAND ----------

# MAGIC %sql
# MAGIC create or replace view dev.naval_gold.total_sales as                       
# MAGIC select round(sum (total_amount)) as total from dev.naval_silver.sales

# COMMAND ----------

# MAGIC %sql
# MAGIC select * from dev.naval_gold.total_sales

# COMMAND ----------

# MAGIC %sql
# MAGIC select * from dev.naval_gold.customer_count
