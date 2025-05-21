-- Databricks notebook source
-- DBTITLE 1,ingestion
create streaming table sales_pipeline as 
select *, current_timestamp() as ingestion_date from stream read_files(
  's3://jpmctraining/raw/sales',
  format => 'csv'
);


create streaming table product_pipeline as 
select *, current_timestamp() as ingestion_date from stream read_files(
  's3://jpmctraining/raw/products',
  format => 'csv'
);

create streaming table customers_pipeline as 
select *, current_timestamp() as ingestion_date from stream read_files(
  's3://jpmctraining/raw/customers',
  format => 'csv'
)


-- COMMAND ----------

create streaming table naval_silver.sales_silver  
(CONSTRAINT valid_order_id EXPECT (order_id IS NOT NULL) ON VIOLATION DROP ROW) as
select distinct * except(_rescued_data,ingestion_date) from stream naval_bronze.sales_pipeline

-- COMMAND ----------

-- Create and populate the target table.
CREATE OR REFRESH STREAMING TABLE naval_silver.product_silver;

APPLY CHANGES INTO
  naval_silver.product_silver
FROM
  stream(naval_bronze.product_pipeline)
KEYS
  (product_id)
APPLY AS DELETE WHEN
  operation = "DELETE"
SEQUENCE BY
  seqNum
COLUMNS * EXCEPT
  (operation, seqNum,_rescued_data,ingestion_date)
STORED AS
  SCD TYPE 1;

-- COMMAND ----------

-- Create and populate the target table.
CREATE OR REFRESH STREAMING TABLE naval_silver.customer_silver;

APPLY CHANGES INTO
  naval_silver.customer_silver
FROM
  stream(naval_bronze.customers_pipeline)
KEYS
  (customer_id)
APPLY AS DELETE WHEN
  operation = "DELETE"
SEQUENCE BY
  sequenceNum
COLUMNS * EXCEPT
  (operation, sequenceNum,_rescued_data,ingestion_date)
STORED AS
  SCD TYPE 2;

-- COMMAND ----------

create materialized view naval_silver.customer_active as 
select * from naval_silver.customer_silver where `__END_AT` is null
