-- Databricks notebook source
grant privileges on object object_name to user

-- COMMAND ----------

grant usage on catalog dev to `account users`

-- COMMAND ----------

grant usage on schema dev.naval to `account users`

-- COMMAND ----------

revoke usage on catalog dev from `account users`

-- COMMAND ----------

grant all privileges on catalog dev to `account users`

-- COMMAND ----------

show grants on catalog dev

-- COMMAND ----------


