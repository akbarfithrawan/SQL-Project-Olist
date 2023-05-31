CREATE TABLE order_items (
	order_id varchar NOT NULL,
	order_item_id varchar (50),
	product_id varchar (50),
	seller_id varchar (50),
	shipping_limit_date timestamp,
	price float,
	freight_value float) 
	
SELECT * FROM order_items;

COPY order_items (order_id, order_item_id, product_id, seller_id, shipping_limit_date, price,freight_value)
FROM 'C:\Program Files\PostgreSQL\11\data\olist\olist_order_items_dataset.csv' DELIMITER ',' CSV HEADER;

SELECT * FROM order_items;

CREATE TABLE order_payments (
	order_id varchar(50), 
	payment_sequential int, 
	payment_type varchar (50), 
	payment_installments int, 
	payment_value float)
	
SELECT * FROM order_payments

COPY order_payments (order_id, payment_sequential, payment_type, payment_installments, payment_value)
FROM 'C:\Program Files\PostgreSQL\11\data\olist\olist_order_payments_dataset.csv' DELIMITER ',' CSV HEADER;

SELECT * FROM order_payments;

CREATE TABLE customers (
	customer_id varchar (50) NOT NULL PRIMARY KEY,
	customer_unique_id varchar(50),
	customer_zip_code int,
	customer_city varchar (50),
	customer_state varchar (50)
	)
	
SELECT * FROM customers;

COPY customers (customer_id, customer_unique_id, customer_zip_code, customer_city, customer_state)
FROM 'C:\Program Files\PostgreSQL\11\data\olist\olist_customers_dataset.csv' DELIMITER ',' CSV HEADER;

SELECT * FROM customers;

DROP TABLE geolocation

CREATE TABLE geolocation
	(geolocation_zip_code_prefix int,
	 geolocation_lat float,
	 geolocation_Ing float,
	 geolocation_city varchar (50),
	 geolocation_state varchar (10)
	)
	
SELECT * FROM geolocation;

COPY geolocation (geolocation_zip_code_prefix, geolocation_lat, geolocation_Ing, geolocation_city, geolocation_state)
FROM 'C:\Program Files\PostgreSQL\11\data\olist\olist_geolocation_dataset.csv' DELIMITER ',' CSV HEADER;

SELECT * FROM geolocation;

CREATE TABLE reviews
	 (review_id varchar (50) NOT NULL,
	 order_id varchar (50), 
	 review_score int, 
	 review_comment_title varchar (50), 
	 review_comment_message varchar (500), 
	 review_creation_date timestamp, 
	 review_answer_timestamp timestamp)

SELECT * FROM reviews;

COPY reviews (review_id, order_id, review_score, review_comment_title, review_comment_message, review_creation_date, review_answer_timestamp)
FROM 'C:\Program Files\PostgreSQL\11\data\olist\olist_order_reviews_dataset.csv' DELIMITER ',' CSV HEADER;

SELECT * FROM reviews;

CREATE TABLE orders (
	order_id VARCHAR(100) PRIMARY KEY,
	customer_id VARCHAR(100),
	order_status VARCHAR(50),
	order_purchase_timestamp TIMESTAMP,
	order_approved_at TIMESTAMP,
	order_delivered_carrier_date TIMESTAMP,
	order_delivered_customer_date TIMESTAMP,
	order_estimated_delivery_date TIMESTAMP
	) 

SELECT * FROM orders;

COPY orders (order_id, customer_id, order_status, order_purchase_timestamp, order_approved_at, order_delivered_carrier_date, order_delivered_customer_date,order_estimated_delivery_date)
FROM 'C:\Program Files\PostgreSQL\11\data\olist\olist_orders_dataset.csv' DELIMITER ',' CSV HEADER;

SELECT * FROM orders;

CREATE TABLE products (
	product_id varchar(50) NOT NULL PRIMARY KEY,
	product_category_name VARCHAR(70),
	product_name_length int ,
	product_description_length int,
	product_photos_qty int,
	product_weight_g int ,
	product_length_cm int ,
	product_height_cm int ,
	product_width_cm int ) 

SELECT * FROM products;

COPY products (product_id, product_category_name, product_name_length, product_description_length, product_photos_qty, product_weight_g, product_length_cm, product_height_cm, product_width_cm)
FROM 'C:\Program Files\PostgreSQL\11\data\olist\olist_products_dataset.csv' DELIMITER ',' CSV HEADER;

SELECT * FROM products;

CREATE TABLE sellers
	(seller_id varchar(50) NOT NULL PRIMARY KEY,
	seller_zip_code_prefix int,
	seller_city varchar (100) ,
	seller_state varchar(15)
	)

SELECT * FROM sellers

COPY sellers (seller_id, seller_zip_code_prefix, seller_city, seller_state)
FROM 'C:\Program Files\PostgreSQL\11\data\olist\olist_sellers_dataset.csv' DELIMITER ',' CSV HEADER;

SELECT * FROM sellers

CREATE TABLE product_category_name_translation (
	product_category_name varchar(50),
	product_category_name_english varchar(70)
	)
	
SELECT * FROM product_category_name_translation 

COPY product_category_name_translation (product_category_name, product_category_name_english)
FROM 'C:\Program Files\PostgreSQL\11\data\olist\product_category_name_translation.csv' DELIMITER ',' CSV HEADER;

SELECT * FROM product_category_name_translation 
