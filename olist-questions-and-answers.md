
# Olist Brazilian E-commerce Sales 2016-2018
## Questions and Answers

**Author**: Akbar Rizky Fithrawan

**Email**: akbar.fithrawan@gmail.com

**LinkedIn**: https://www.linkedin.com/in/akbar-rizky-fithrawan-04788056/

An SQL analysis about each traffic crash on city streets within the City of Chicago limits and under the jurisdiction of Chicago Police Department (CPD). Data shown as is from the electronic crash reporting system (E-Crash) at CPD, excluding any personally identifiable information.


### What are the top 10 most popular products in Olist?

````sql
SELECT 
	cat.product_category_name_english AS category_name,
	COUNT(o.order_id) AS total_product
FROM orders AS o
JOIN order_items AS oi USING(order_id)
JOIN products AS prod USING(product_id)
JOIN category_name_translation AS cat USING(product_category_name)
WHERE o.order_status NOT IN ('canceled' , 'unavailable')
GROUP BY 1
ORDER BY 2 DESC
LIMIT 10;
````
**Results:**
category_name        | total_products
---------------------|---------------
bed_bath_table       | 11097
health_beauty        | 9634
sports_leisure       | 8590
furniture_decor      | 8298
computers_accessories| 7781
housewares           | 6915
watches_gifts        | 5970
telephony            | 4527
garden_tools         | 4328
auto                 | 4204

### What is the number of order per year?
````sql
SELECT 
	EXTRACT('year' FROM order_purchase_timestamp) AS year,
	COUNT(*) AS total_order
FROM orders
GROUP BY 1
ORDER BY 1;
````
**Results:**
year|	total_order
----|--------------
2016|	329
2017|	45101
2018|	54011

### What is the total order by status?
````sql
SELECT 
	DISTINCT order_status,
	COUNT(*) AS total_order
FROM orders
GROUP BY 1
ORDER BY 2 DESC;
````
**Results:**
order_status| total_order
------------|------------
delivered   | 96478
shipped     | 1107
canceled    | 625
unavailable | 609
invoiced    | 314
processing  | 301
created     | 5
approved    | 2

### What is the total customer by state?
````sql
SELECT 
	customer_state,
	COUNT(DISTINCT customer_unique_id) AS total_customer
FROM customers
GROUP BY customer_state
ORDER BY total_customer DESC;
````
**Results:**
customer_state|total_customer
--------------|------------
SP            |40302
RJ            |12384
MG            |11259
RS            |5277
PR            |4882
SC            |3534
BA            |3277
DF            |2075
ES            |1964
GO            |1952
PE            |1609
CE            |1313
PA            |949
MT            |876
MA            |726
MS            |694
PB            |519
PI            |482
RN            |474
AL            |401
SE            |342
TO            |273
RO            |240
AM            |143
AC            |77
AP            |67
RR            |45


### What about delay in delivery?


### What is the number order by days of the week?
