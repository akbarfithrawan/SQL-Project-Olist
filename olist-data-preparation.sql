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
