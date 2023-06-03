
# Olist Brazilian E-commerce Sales 2016-2018
## Questions and Answers

**Author**: Akbar Rizky Fithrawan

**Email**: akbar.fithrawan@gmail.com

**LinkedIn**: https://www.linkedin.com/in/akbar-rizky-fithrawan-04788056/

An SQL analysis about Brazilian E-commerce Olist from 2016 to 2018. This dataset was generously provided by Olist, the largest department store in Brazilian marketplaces.
The merchants are able to sell their products through the Olist Store and ship them directly to the customers using Olist logistics partners. After a customer purchases the product from Olist Store a seller gets notified to fulfill that order. Once the customer receives the product, or the estimated delivery date is due, the customer gets a satisfaction survey by email where he can give a note for the purchase experience and write down some comments.


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
GROUP BY category_name
ORDER BY total_product DESC
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
GROUP BY year
ORDER BY year;
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
GROUP BY order_status
ORDER BY total_order DESC;
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
	c.customer_state,
	COUNT(DISTINCT o.customer_id) AS total_customer
FROM orders AS o
JOIN customers AS c USING(customer_id)
GROUP BY customer_state
ORDER BY total_customer DESC;
````
**Results:**
customer_state|total_customer
--------------|--------------
SP            |41746
RJ            |12852
MG            |11635
RS            |5466
PR            |5045
SC            |3637
BA            |3380
DF            |2140
ES            |2020
GO            |1652
PE            |1609
CE            |1336
PA            |975
MT            |907
MA            |747
MS            |715
PB            |536
PI            |495
RN            |485
AL            |413
SE            |350
TO            |280
RO            |253
AM            |148
AC            |81
AP            |68
RR            |46

### What time is the most order created at?
````sql
WITH order_hour AS (
	SELECT 
		EXTRACT('hour' FROM order_purchase_timestamp) AS hour,
		COUNT(order_id) AS total_order
	FROM orders
	GROUP BY hour
)

SELECT
	CASE WHEN hour BETWEEN 6 AND 9 THEN 'Early morning'
		WHEN hour BETWEEN 9 AND 12 THEN 'Late morning'
		WHEN hour BETWEEN 12 AND 15 THEN 'Early afternoon'
		WHEN hour BETWEEN 15 AND 18 THEN 'Late afternoon'
		WHEN hour BETWEEN 18 AND 21 THEN 'Evening'
		WHEN hour BETWEEN 21 AND 24 THEN 'Late evening'
		WHEN hour BETWEEN 0 AND 3 THEN 'Night'
		WHEN hour BETWEEN 3 AND 6 THEN 'Toward morning'
		END AS hour_group,
	SUM(total_order) AS total
FROM order_hour
GROUP BY hour_group
ORDER BY total DESC;
````
**Results:**
hour_group      | total
----------------|-------
Early afternoon | 19541
Late morning    | 18750
Late afternoon  | 18594
Evening         | 18392
Late evening    | 9939
Early morning   | 9485
Night           | 4346
Toward morning  | 394

### What is frequency of orders delivered by month?
````sql
SELECT 
	DATE(DATE_TRUNC('month', order_delivered_customer_date)) AS month,
	COUNT(*) AS total_delivered_order
FROM orders
WHERE order_delivered_customer_date IS NOT NULL
GROUP BY month
ORDER BY month;
````
**Results:**
month      |total_delivered_order
-----------|------------
2016-10-01 |208
2016-11-01 |60
2016-12-01 |4
2017-01-01 |283
2017-02-01 |1351
2017-03-01 |2382
2017-04-01 |1849
2017-05-01 |3751
2017-06-01 |3223
2017-07-01 |3455
2017-08-01 |4302
2017-09-01 |3965
2017-10-01 |4494
2017-11-01 |4670
2017-12-01 |7205
2018-01-01 |6597
2018-02-01 |5850
2018-03-01 |6825
2018-04-01 |7850
2018-05-01 |7111
2018-06-01 |6829
2018-07-01 |5839
2018-08-01 |8314
2018-09-01 |56
2018-10-01 |3

### What about delay in delivery?
````sql
SELECT 
	DATE(order_estimated_delivery_date) - DATE(order_delivered_customer_date) AS delay_days,
	COUNT(order_id) AS total_order
FROM orders
WHERE order_delivered_customer_date IS NOT NULL
GROUP BY delay_days
HAVING (DATE(order_estimated_delivery_date) - DATE(order_delivered_customer_date)) > 0
ORDER BY total_order DESC;
````
**Results:**
delay_days |total_order
-----------|-----------
14	|7126
13	|5963
15	|5345
7	|4837
8	|4828
10	|4646
9	|4626
11	|4619
12	|4556
16	|3903
6	|3625
17	|3412
18	|3128
20	|2960
21	|2810
19	|2712
5	|2219
4	|1917
22	|1845
3	|1731
2	|1550
1	|1462
23	|1263
24	|1067
25	|913
27	|816
26	|793
28	|753
29	|492
30	|377
31	|304
32	|277
33	|261
35	|256
34	|247
36	|168
38	|96
37	|92
42	|83
41	|77
40	|64
39	|58
43	|56
46	|40
44	|40
45	|34
48	|31
47	|26
49	|22
50	|19
52	|15
56	|11
53	|10
54	|8
51	|8
55	|7
58	|6
78	|3
61	|3
69	|3
57	|2
64	|2
60	|2
73	|2
75	|2
71	|2
66	|2
62	|2
77	|1
135	|1
65	|1
147	|1
59	|1
83	|1
84	|1
124	|1
140	|1
67	|1
63	|1
76	|1
109	|1
68	|1

### What are the 5 top cities with highest number of order?
````sql
SELECT 
	c.customer_city,
	COUNT(o.order_id) AS total_order
FROM orders AS o
JOIN customers AS c USING(customer_id)
GROUP BY customer_city
ORDER BY 2 DESC
LIMIT 5;
````
**Results:**
customer_city  | total_order
---------------|-------------
sao paulo      |15540
rio de janeiro |6882
belo horizonte |2773
brasilia       |2131
curitiba       |1521

### What is the average customer order price by state?
````sql
SELECT 
	cust.customer_state,
	AVG(oi.order_item_id * oi.price + oi.freight_value) AS avg_price
FROM customers AS cust
JOIN orders AS o USING(customer_id)
JOIN order_items AS oi USING(order_id)
GROUP BY cust.customer_state
ORDER BY avg_price DESC;
````

**Results:**
customer_state| avg_price
--------------|-----------
PB            |254.9220265780731
AC	      |235.44010869565224
AL	      |230.23581081081076
AP	      |224.04231707317075
PI	      |219.86848708487068
RO	      |216.66420863309347
PA	      |216.15749074074085
RR	      |210.93134615384616
TO	      |207.6947301587301
CE	      |206.1667388362647
SE	      |205.05420779220773
MT	      |203.74744075829383
RN	      |202.12102079395083
MA	      |198.72445388349516
PE	      |188.99063122923585
AM	      |183.80533333333332
MS	      |180.05310134310125
BA	      |179.8372545406687
GO	      |178.20496356622377
RJ	      |164.28613622333444
SC	      |162.26056034482798
DF	      |160.20909808811302
ES	      |159.08660017730503
RS	      |158.83072493985603
PR	      |157.7499111498259
MG	      |155.78080584964502
SP	      |139.50150919934995

### What is the frequency by each of payment type?
````sql
SELECT 
	p.payment_type,
	COUNT(o.order_id) AS total_order
FROM payments AS p
JOIN orders AS o USING(order_id)
GROUP BY payment_type
ORDER BY total_order DESC;
````
**Results:**
payment_type| total_order
------------|-----------
credit_card | 76795
boleto      | 19784
voucher     | 5775
debit_card  | 1529
not_defined | 3



