CREATE TABLE category_name_translation (
	product_category_name varchar(50),
	product_category_name_english varchar(50)
);

COPY category_name_translation
FROM '/Users/admin/Desktop/Portfolio/Brazilian E-Commerce Public Dataset by Olist/product_category_name_translation.csv'
DELIMITER ',' CSV HEADER;

CREATE TABLE customers (
	customer_id varchar(50) NOT NULL PRIMARY KEY,
	customer_unique_id varchar(50),
	customer_zip_code_prefix int,
	customer_city varchar(50),
	customer_state varchar(50)
);
	
COPY customers
FROM '/Users/admin/Desktop/Portfolio/Brazilian E-Commerce Public Dataset by Olist/olist_customers_dataset.csv'
DELIMITER ',' CSV HEADER;

CREATE TABLE geolocation (
	geolocation_zip_code_prefix int,
	geolocation_lat float,
	geolocation_Ing float,
	geolocation_city varchar(50),
	geolocation_state varchar(10)
);
	
COPY geolocation
FROM '/Users/admin/Desktop/Portfolio/Brazilian E-Commerce Public Dataset by Olist/olist_geolocation_dataset.csv'
DELIMITER ',' CSV HEADER;

CREATE TABLE order_items (
	order_id varchar NOT NULL,
	order_item_id varchar(50),
	product_id varchar(50),
	seller_id varchar(50),
	shipping_limit_date timestamp,
	price float,
	freight_value float
); 

COPY order_items
FROM '/Users/admin/Desktop/Portfolio/Brazilian E-Commerce Public Dataset by Olist/olist_order_items_dataset.csv'
DELIMITER ',' CSV HEADER;

CREATE TABLE orders (
	order_id varchar(100) PRIMARY KEY,
	customer_id varchar(100),
	order_status varchar(50),
	order_purchase_timestamp timestamp,
	order_approved_at timestamp,
	order_delivered_carrier_date timestamp,
	order_delivered_customer_date timestamp,
	order_estimated_delivery_date timestamp
); 

COPY orders
FROM '/Users/admin/Desktop/Portfolio/Brazilian E-Commerce Public Dataset by Olist/olist_orders_dataset.csv'
DELIMITER ',' CSV HEADER;

CREATE TABLE payments (
	order_id varchar(50), 
	payment_sequential int, 
	payment_type varchar (50), 
	payment_installments int, 
	payment_value float
);

COPY payments
FROM '/Users/admin/Desktop/Portfolio/Brazilian E-Commerce Public Dataset by Olist/olist_order_payments_dataset.csv'
DELIMITER ',' CSV HEADER;

CREATE TABLE products (
	product_id varchar(50) NOT NULL PRIMARY KEY,
	product_category_name varchar(50),
	product_name_length int,
	product_description_length int,
	product_photos_qty int,
	product_weight_g int,
	product_length_cm int,
	product_height_cm int,
	product_width_cm int
); 

COPY products
FROM '/Users/admin/Desktop/Portfolio/Brazilian E-Commerce Public Dataset by Olist/olist_products_dataset.csv'
DELIMITER ',' CSV HEADER;

CREATE TABLE reviews
	 (review_id varchar (50) NOT NULL,
	 order_id varchar (100), 
	 review_score int, 
	 review_comment_title varchar(50), 
	 review_comment_message varchar(500), 
	 review_creation_date timestamp, 
	 review_answer_timestamp timestamp
);

COPY reviews
FROM '/Users/admin/Desktop/Portfolio/Brazilian E-Commerce Public Dataset by Olist/olist_order_reviews_dataset.csv'
DELIMITER ',' CSV HEADER;

CREATE TABLE sellers (
	seller_id varchar(50) NOT NULL PRIMARY KEY,
	seller_zip_code_prefix int,
	seller_city varchar(50) ,
	seller_state varchar(10)
);

COPY sellers
FROM '/Users/admin/Desktop/Portfolio/Brazilian E-Commerce Public Dataset by Olist/olist_sellers_dataset.csv'
DELIMITER ',' CSV HEADER;

--To clean the data, we need to find NULL values in all tables:

SELECT
	COUNT (*) FILTER (WHERE product_category_name IS NULL) AS null_name,
	COUNT (*) FILTER (WHERE product_category_name_english IS NULL) AS null_english
FROM category_name_translation;

null_name|null_english|
---------|------------|
0        | 0          | 

SELECT
	COUNT (*) FILTER (WHERE customer_id IS NULL) AS null_id,
	COUNT (*) FILTER (WHERE customer_unique_id IS NULL) AS null_unique_id,
	COUNT (*) FILTER (WHERE customer_zip_code_prefix IS NULL) AS null_zip_code,
	COUNT (*) FILTER (WHERE customer_city IS NULL) AS null_city,
	COUNT (*) FILTER (WHERE customer_state IS NULL) AS null_state
FROM customers;

null_id|null_unique_id|null_zip_code|null_city|null_state|
-------|--------------|-------------|---------|----------|
0      |0             |	0           |	0     |	0        |

SELECT
	COUNT (*) FILTER (WHERE geolocation_zip_code_prefix IS NULL) AS null_zip_code,
	COUNT (*) FILTER (WHERE geolocation_lat IS NULL) AS null_lat,
	COUNT (*) FILTER (WHERE geolocation_lng IS NULL) AS null_lng,
	COUNT (*) FILTER (WHERE geolocation_city IS NULL) AS null_city,
	COUNT (*) FILTER (WHERE geolocation_state IS NULL) AS null_state
FROM geolocation;

null_zip_code|null_lat|null_lng|null_city|null_state|
-------------|--------|--------|---------|----------|
0	     | 0      | 0      | 0       | 0        |

SELECT
	COUNT (*) FILTER (WHERE order_id IS NULL) AS null_order_id,
	COUNT (*) FILTER (WHERE order_item_id IS NULL) AS null_item_id,
	COUNT (*) FILTER (WHERE product_id IS NULL) AS null_product_id,
	COUNT (*) FILTER (WHERE seller_id IS NULL) AS null_seller_id,
	COUNT (*) FILTER (WHERE shipping_limit_date IS NULL) AS null_shipping_date,
	COUNT (*) FILTER (WHERE price IS NULL) AS null_price,
	COUNT (*) FILTER (WHERE freight_value IS NULL) AS null_freight
FROM order_items;

null_order_id|null_item_id|null_product_id|null_seller_id|null_shipping_date|null_price|null_freight|
-------------|------------|---------------|--------------|------------------|----------|------------|
0	     |0	          |0	          |0	         |0                 |0         |0           |

SELECT
	COUNT (*) FILTER (WHERE order_id IS NULL) AS null_order_id,
	COUNT (*) FILTER (WHERE customer_id IS NULL) AS null_customer_id,
	COUNT (*) FILTER (WHERE order_status IS NULL) AS null_status,
	COUNT (*) FILTER (WHERE order_purchase_timestamp IS NULL) AS null_timestamp,
	COUNT (*) FILTER (WHERE order_approved_at IS NULL) AS null_approve,
	COUNT (*) FILTER (WHERE order_delivered_carrier_date IS NULL) AS null_carrier_date,
	COUNT (*) FILTER (WHERE order_delivered_customer_date IS NULL) AS null_customer_date,
	COUNT (*) FILTER (WHERE order_estimated_delivery_date IS NULL) AS null_delivery_date
FROM orders;

null_order_id|null_customer_id|null_status|null_timestamp|null_approve|null_carrier_date|null_customer_date|null_delivery_date|
-------------|----------------|-----------|--------------|------------|-----------------|------------------|------------------|
0	     |0	              |0	  |0	         |160	      |1783	        |2965	           |0                 |

--There are 3 columns in the orders table that have missing values. After investigating, I found that these missing values is affected by order_status.
--When order_status is 'delivered', there are no missing values found in the table.
--When order_status is 'unavailable', 'invoiced', 'approved', 'processing', and 'cancelled', order_delivered_carrier_date and order_delivered_customer_date are null because the orders still in the process or will not be shipped because of cancellation.
--When order_status is 'shipped', order_delivered_customer_date is null because the orders haven't been received by customers.
--When order_status is 'created', order_approved_at, order_delivered_carrier_date, and order_delivered_customer_date are null because the orders haven't been approved and shipped to customers.
--Therefore, there's no need to fill the null values in this table.

SELECT
	COUNT (*) FILTER (WHERE order_id IS NULL) AS null_order_id,
	COUNT (*) FILTER (WHERE payment_sequential IS NULL) AS null_sequential,
	COUNT (*) FILTER (WHERE payment_type IS NULL) AS null_type,
	COUNT (*) FILTER (WHERE payment_installment IS NULL) AS null_installment,
	COUNT (*) FILTER (WHERE payment_value IS NULL) AS null_value
FROM payments;

null_order_id|null_sequential|null_type|null_installment|null_value|
-------------|---------------|---------|----------------|----------|
0	     | 0	     | 0       |0	        | 0        |

SELECT
	COUNT (*) FILTER (WHERE product_id IS NULL) AS null_product_id,
	COUNT (*) FILTER (WHERE product_category_name IS NULL) AS null_category_name,
	COUNT (*) FILTER (WHERE product_name_length IS NULL) AS null_name_length,
	COUNT (*) FILTER (WHERE product_description_length IS NULL) AS null_description_length,
	COUNT (*) FILTER (WHERE product_photos_qty IS NULL) AS null_photos_qty,
	COUNT (*) FILTER (WHERE product_weight_g IS NULL) AS null_weight,
	COUNT (*) FILTER (WHERE product_length_cm IS NULL) AS null_length,
	COUNT (*) FILTER (WHERE product_height_cm IS NULL) AS null_height,
	COUNT (*) FILTER (WHERE product_width_cm IS NULL) AS null_width
FROM products;

null_product_id|null_category_name|null_name_length|null_description_length|null_photos_qty|null_weight|null_length|null_height|null_width|
---------------|------------------|----------------|-----------------------|---------------|-----------|-----------|-----------|----------|
0	       |610	          |610	           |610	                   |610            |2          |2          |2          |2         |

--For the null values in product_category_name table, I will fill all of it with 'unknown'.

UPDATE products
SET product_category_name = 'unknown'
WHERE product_category_name IS NULL;

--For the rest of the null values, I will fill it with the mean of each column.

UPDATE products
SET product_name_length = (
    SELECT AVG(product_name_length)
    FROM products)
WHERE product_name_length IS NULL;

UPDATE products
SET product_description_length = (
    SELECT AVG(product_description_length)
    FROM products)
WHERE product_description_length IS NULL;

UPDATE products
SET product_photos_qty = (
    SELECT AVG(product_photos_qty)
    FROM products)
WHERE product_photos_qty IS NULL;

UPDATE products
SET product_weight_g = (
    SELECT AVG(product_weight_g)
    FROM products)
WHERE product_weight_g IS NULL;

UPDATE products
SET product_length_cm = (
    SELECT AVG(product_length_cm)
    FROM products)
WHERE product_length_cm IS NULL;

UPDATE products
SET product_height_cm = (
    SELECT AVG(product_height_cm)
    FROM products)
WHERE product_height_cm IS NULL;

UPDATE products
SET product_width_cm = (
    SELECT AVG(product_width_cm)
    FROM products)
WHERE product_width_cm IS NULL;

SELECT 
	COUNT (*) FILTER (WHERE review_id IS NULL) AS null_review_id,
	COUNT (*) FILTER (WHERE order_id IS NULL) AS null_order_id,
	COUNT (*) FILTER (WHERE review_score IS NULL) AS null_score,
	COUNT (*) FILTER (WHERE review_comment_title IS NULL) AS null_title,
	COUNT (*) FILTER (WHERE review_comment_message IS NULL) AS null_message,
	COUNT (*) FILTER (WHERE review_creation_date IS NULL) AS null_date,
	COUNT (*) FILTER (WHERE review_answer_timestamp IS NULL) AS null_timestamp
FROM reviews;

null_review_id|null_order_id|null_score|null_title|null_message|null_date|null_timestamp|
--------------|-------------|----------|----------|------------|---------|--------------|
0	      | 0           | 0        |87656     |58247       |0        |0             |

--For the null values in review_comment_title and review_comment_message, I will fill it with 'No title' and 'No message" respectively.

UPDATE reviews
SET review_comment_title = 'No title'
WHERE review_comment_title IS NULL;

UPDATE reviews
SET review_comment_message = 'No message' 
WHERE review_comment_message IS NULL;

SELECT
	COUNT (*) FILTER (WHERE seller_id IS NULL) AS null_id,
	COUNT (*) FILTER (WHERE seller_zip_code_prefix IS NULL) AS null_zip,
	COUNT (*) FILTER (WHERE seller_city IS NULL) AS null_city,
	COUNT (*) FILTER (WHERE seller_state IS NULL) AS null_state
FROM sellers;

null_id|null_zip|null_city|null_state|
-------|--------|---------|----------|
0      |0	|0	  |0         |

--Now that the data has been cleaned, it's ready to be used for analysis!




