Data preparation

Find the null values in all tables:

````sql
SELECT
	COUNT (*) FILTER (WHERE customer_id IS NULL) AS null_id,
	COUNT (*) FILTER (WHERE customer_unique_id IS NULL) AS null_unique_id,
	COUNT (*) FILTER (WHERE customer_zip_code_prefix IS NULL) AS null_zip_code,
	COUNT (*) FILTER (WHERE customer_city IS NULL) AS null_city,
	COUNT (*) FILTER (WHERE customer_state IS NULL) AS null_state
FROM customers;
````

null_id|null_unique_id|null_zip_code|null_city|null_state|
-------|--------------|-------------|---------|----------|
0      |0             |	0           |	0     |	0        |

````sql
SELECT
	COUNT (*) FILTER (WHERE geolocation_zip_code_prefix IS NULL) AS null_zip_code,
	COUNT (*) FILTER (WHERE geolocation_lat IS NULL) AS null_lat,
	COUNT (*) FILTER (WHERE geolocation_lng IS NULL) AS null_lng,
	COUNT (*) FILTER (WHERE geolocation_city IS NULL) AS null_city,
	COUNT (*) FILTER (WHERE geolocation_state IS NULL) AS null_state
FROM geolocation;
````

null_zip_code|null_lat|null_lng|null_city|null_state|
-------------|--------|--------|---------|----------|
0	     | 0      | 0      | 0       | 0        |

````sql
SELECT
	COUNT (*) FILTER (WHERE order_id IS NULL) AS null_order_id,
	COUNT (*) FILTER (WHERE order_item_id IS NULL) AS null_item_id,
	COUNT (*) FILTER (WHERE product_id IS NULL) AS null_product_id,
	COUNT (*) FILTER (WHERE seller_id IS NULL) AS null_shipping_date,
	COUNT (*) FILTER (WHERE price IS NULL) AS null_price,
	COUNT (*) FILTER (WHERE freight_value IS NULL) AS null_freight
FROM order_items;
````

null_order_id|null_item_id|null_product_id|null_shipping_date|null_price|null_freight|
-------------|------------|---------------|------------------|----------|------------|
0	     | 0	  | 0	          | 0	             | 0        |	0    |

````sql
SELECT
	COUNT (*) FILTER (WHERE order_id IS NULL) AS null_order_id,
	COUNT (*) FILTER (WHERE customer_id IS NULL) AS null_customer_id,
	COUNT (*) FILTER (WHERE order_status IS NULL) AS null_product_id,
	COUNT (*) FILTER (WHERE seller_id IS NULL) AS null_shipping_date,
	COUNT (*) FILTER (WHERE price IS NULL) AS null_price,
	COUNT (*) FILTER (WHERE freight_value IS NULL) AS null_freight
FROM orders;
````

null_order_id|null_item_id|null_product_id|null_shipping_date|null_price|null_freight|
-------------|------------|---------------|------------------|----------|------------|
0            |0           |0              |0                 |0         |0           |

````sql
SELECT
	COUNT (*) FILTER (WHERE order_id IS NULL) AS null_order_id,
	COUNT (*) FILTER (WHERE payment_sequential IS NULL) AS null_sequential,
	COUNT (*) FILTER (WHERE payment_type IS NULL) AS null_type,
	COUNT (*) FILTER (WHERE payment_installment IS NULL) AS null_installment,
	COUNT (*) FILTER (WHERE payment_value IS NULL) AS null_value
FROM payments;
````

null_order_id|null_sequential|null_type|null_installment|null_value|
-------------|---------------|---------|----------------|----------|
0	     | 0	     | 0	 0	        | 0        |

````sql
SELECT
	COUNT (*) FILTER (WHERE product_category_name IS NULL) AS null_name,
	COUNT (*) FILTER (WHERE product_category_name_english IS NULL) AS null_english
FROM product_category_name_translation;
````

null_name|null_english|
---------|------------|
0        | 0          |  

````sql
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
````

null_product_id|null_category_name|null_name_length|null_description_length|null_photos_qty|null_weight|null_length|null_height|null_width|
---------------|------------------|----------------|-----------------------|---------------|-----------|-----------|-----------|----------|
0	       |610	          |610	           |610	                   |610            |2          |2          |2          |2         |
 
````sql
SELECT 
	COUNT(*) FILTER (WHERE review_id IS NULL) AS null_review_id,
	COUNT(*) FILTER (WHERE order_id IS NULL) AS null_order_id,
	COUNT(*) FILTER (WHERE review_score IS NULL) AS null_score,
	COUNT(*) FILTER (WHERE review_comment_title IS NULL) AS null_title,
	COUNT(*) FILTER (WHERE review_comment_message IS NULL) AS null_message,
	COUNT(*) FILTER (WHERE review_creation_date IS NULL) AS null_date,
	COUNT(*) FILTER (WHERE review_answer_timestamp IS NULL) AS null_timestamp
FROM reviews;
````

null_review_id|null_order_id|null_score|null_title|null_message|null_date|null_timestamp|
--------------|-------------|----------|----------|------------|---------|--------------|
0	      | 0           | 0        |87656     |58247       |0        |0             |

````sql
SELECT
	COUNT (*) FILTER (WHERE seller_id IS NULL) AS null_id,
	COUNT (*) FILTER (WHERE seller_zip_code_prefix IS NULL) AS null_zip,
	COUNT (*) FILTER (WHERE seller_city IS NULL) AS null_city,
	COUNT (*) FILTER (WHERE seller_state IS NULL) AS null_state
FROM sellers;
````

null_id|null_zip|null_city|null_state|
-------|--------|---------|----------|
0      |0	|0	  |0         |

