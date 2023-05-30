````sql
SELECT
	COUNT (*) FILTER (WHERE customer_id IS NULL) AS null_id,
	COUNT (*) FILTER (WHERE customer_unique_id IS NULL) AS null_unique_id,
	COUNT (*) FILTER (WHERE customer_zip_code_prefix IS NULL) AS null_zip_code,
	COUNT (*) FILTER (WHERE customer_city IS NULL) AS null_city,
	COUNT (*) FILTER (WHERE customer_state IS NULL) AS null_state
FROM customers;
````
