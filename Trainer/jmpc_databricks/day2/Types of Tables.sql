-- Databricks notebook source
Managed vs External (Unmanaged) Table

-- COMMAND ----------

-- DBTITLE 1,Managed
create table emp(id int);

df=spark.read.csv("path")
df.write.saveAsTable("emp")

Create table emp as select * from json.`path`

-- COMMAND ----------

-- DBTITLE 1,Unmanage
create table emp(id int) location 'path';

df=spark.read.csv("path")
df.write.option("path","").saveAsTable("emp")

Create table emp location 'path' as select * from json.`path`

-- COMMAND ----------

create table dev.naval.emp_ext(id int, name string) location 's3://jpmctraining/metadata/naval/emp_ext'

-- COMMAND ----------

insert into dev.naval.emp_ext values (1,'Naval')

-- COMMAND ----------

describe extended dev.naval.emp_ext

-- COMMAND ----------

select * from dev.naval.emp

-- COMMAND ----------

drop table dev.naval.emp

-- COMMAND ----------

undrop table dev.naval.emp

-- COMMAND ----------

drop table dev.naval.emp_ext

-- COMMAND ----------

--create table emp location 's3://jpmctraining/metadata/naval/emp_ext2' as 
select * from delta.`s3://jpmctraining/metadata/naval/emp_ext`

-- COMMAND ----------

s3://jpmctraining/metadata/yourname/yourtablename
