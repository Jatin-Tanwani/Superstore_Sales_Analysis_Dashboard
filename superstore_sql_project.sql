create database superstore_db;
use superstore_db;

CREATE TABLE clean_superstore (
    row_id INT,
    order_id VARCHAR(50),
    order_date DATE,
    ship_date DATE,
    delivery_days INT,
    ship_mode VARCHAR(50),
    customer_id VARCHAR(50),
    customer_name VARCHAR(100),
    segment VARCHAR(50),
    country VARCHAR(50),
    city VARCHAR(50),
    state VARCHAR(50),
    postal_code VARCHAR(20),
    region VARCHAR(50),
    product_id VARCHAR(50),
    category VARCHAR(50),
    sub_category VARCHAR(50),
    product_name VARCHAR(200),
    sales DOUBLE,
    quantity INT,
    discount DOUBLE,
    profit DOUBLE,
    profit_margin DOUBLE,
    months VARCHAR(20),
    years INT,
    year INT,
    month INT
);
set global local_infile=1;
show variables like 'local_infile';
select count(*) from clean_superstore;
select * from clean_superstore;
show warnings;
TRUNCATE TABLE clean_superstore;
LOAD DATA LOCAL INFILE 'C:/FuturePython/PROJECT/clean_superstore.csv'
INTO TABLE clean_superstore
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;
SHOW VARIABLES LIKE 'secure_file_priv';
TRUNCATE TABLE clean_superstore;

select count(*) from clean_superstore;
select * from clean_superstore limit 5;
select round(sum(sales),2) as total_sales from clean_superstore;
select round(sum(profit),2) as total_profit from clean_superstore;
-- category wise profit

select category,
round(sum(profit),2) as total_profit from clean_superstore group by category order by total_profit desc;
select region , round(sum(profit),2) as total_profit from clean_superstore group by region having sum(profit)<0;
select years, round(sum(sales),2) as total_sales from clean_superstore group by years order by total_sales desc;
-- top 5 customers
select customer_name,
round(sum(sales),2) as total_sales from clean_superstore group by customer_name order by total_sales desc limit 5;

select region,sum(profit) from clean_superstore group by region;
select min(profit),max(profit) from clean_superstore;

