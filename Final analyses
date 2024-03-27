#categories by revenue 

SELECT  
	F.name,
	SUM(amount) AS revenue
FROM film A 
	INNER JOIN
		inventory B on A.film_id = B.film_id 
	INNER JOIN 
		rental C on B.inventory_id = C.inventory_id 
	INNER JOIN 
		payment D on C.rental_id = D.rental_id 
	INNER JOIN 
		film_category E on A.film_id = E.film_id 
	INNER JOIN 
		category F on E.category_id = F.category_id
GROUP BY name
ORDER BY revenue DESC; 


#top 10 and lowest 10 movies by category 
#lowest 10
SELECT 
	A.title, 
	F.name,
	SUM(amount) AS revenue
FROM film A 
	INNER JOIN
		inventory B on A.film_id = B.film_id 
	INNER JOIN 
		rental C on B.inventory_id = C.inventory_id 
	INNER JOIN 
		payment D on C.rental_id = D.rental_id 
	INNER JOIN 
		film_category E on A.film_id = E.film_id 
	INNER JOIN 
		category F on E.category_id = F.category_id
GROUP BY title, name
ORDER BY revenue ASC
LIMIT 10; 

#top 10 
SELECT 
	A.title, 
	F.name,
	SUM(amount) AS revenue
FROM film A 
	INNER JOIN
		inventory B on A.film_id = B.film_id 
	INNER JOIN 
		rental C on B.inventory_id = C.inventory_id 
	INNER JOIN 
		payment D on C.rental_id = D.rental_id 
	INNER JOIN 
		film_category E on A.film_id = E.film_id 
	INNER JOIN 
		category F on E.category_id = F.category_id
GROUP BY title, name
ORDER BY revenue DESC
LIMIT 10; 


#top 10 and lowest 10 movies by revenue 
#top 10 
SELECT 
	A.title, 
	SUM(amount) AS revenue
FROM film A 
	INNER JOIN
		inventory B on A.film_id = B.film_id 
	INNER JOIN 
		rental C on B.inventory_id = C.inventory_id 
	INNER JOIN 
		payment D on C.rental_id = D.rental_id 
GROUP BY title
ORDER BY revenue DESC
LIMIT 10; 

#bottom 10
SELECT 
	A.title, 
	SUM(amount) AS revenue
FROM film A 
	INNER JOIN
		inventory B on A.film_id = B.film_id 
	INNER JOIN 
		rental C on B.inventory_id = C.inventory_id 
	INNER JOIN 
		payment D on C.rental_id = D.rental_id 
GROUP BY title
ORDER BY revenue ASC 
LIMIT 10; 


#top countries in terms of customer count
SELECT
	 D. country, 
	COUNT(A.customer_id) AS number_of_customers
FROM customer A 
INNER JOIN 
	address B on A.address_id = B.address_id 
INNER JOIN 
	city C on B.city_id = C.city_id 
INNER JOIN 
	country D on C.country_id = D.country_id 
GROUP BY country 
ORDER BY COUNT (customer_id) DESC
LIMIT 10; 


#top cities in the top countries and # of customers in each 
SELECT 
	C.city,
	D.country, 
	COUNT(A.customer_id) AS number_of_customers
FROM customer A 
INNER JOIN 
	address B on A.address_id = B.address_id 
INNER JOIN 
	city C on B.city_id = C.city_id 
INNER JOIN 
	country D on C.country_id = D.country_id 
WHERE 
	D.country IN (
		SELECT country 
		FROM customer A 
		INNER JOIN 
			address B on A.address_id = B.address_id 
		INNER JOIN t
			city C on B.city_id = C.city_id
		INNER JOIN 
			country D on C.country_id = D.country_id 
		GROUP BY country 
		ORDER BY COUNT (customer_id) DESC 
		LIMIT 10
	)
GROUP BY
	C.city, D.country 
ORDER BY number_of_customers DESC
LIMIT 10; 

#top 5 customers worldwide 
SELECT 
	A.customer_id, 
	A.first_name, 
	A.last_name,
	D.country, 
	C.city,
	SUM (B.amount) AS total_amount_paid
FROM customer A 
INNER JOIN 
	payment B on A.customer_id = B.customer_id
INNER JOIN 
	address E on A.address_id = E.address_id
INNER JOIN 
	city C on E.city_id = C.city_id 
INNER JOIN 
	country D on C.country_id = D.country_id
GROUP BY
	A.customer_id, A.first_name, A.last_name, D.country, C.city
ORDER BY total_amount_paid DESC
LIMIT 5; 


#top 5 customers in the top 10 cities 
SELECT 
	A.customer_id, 
	A.first_name, 
	A.last_name,
	D.country, 
	C.city,
	SUM (B.amount) AS total_amount_paid
FROM customer A 
INNER JOIN 
	payment B on A.customer_id = B.customer_id
INNER JOIN 
	address E on A.address_id = E.address_id
INNER JOIN 
	city C on E.city_id = C.city_id 
INNER JOIN 
	country D on C.country_id = D.country_id
WHERE 
	C.city IN (
		SELECT C.city
		FROM customer A 
		INNER JOIN 
			address B on A.address_id = B.address_id 
		INNER JOIN 
			city C on B.city_id = C.city_id
		INNER JOIN 
			country D on C.country_id = D.country_id 
		GROUP BY city
		ORDER BY COUNT (customer_id) DESC 
		LIMIT 10
	)
GROUP BY
	A.customer_id, A.first_name, A.last_name, D.country, C.city
ORDER BY total_amount_paid DESC
LIMIT 5; 


#looking at customer count and revenue by country 
SELECT country, 
	COUNT(DISTINCT A.customer_id) AS customer_count, 
	SUM(amount) AS total_payment 
FROM customer A 
INNER JOIN 
	address B on A.address_id = B.address_id 
INNER JOIN 
	city C on B.city_id = C.city_id 
INNER JOIN 
	country D on C.country_id = D.country_id 
INNER JOIN 
	payment E on A.customer_id = E.customer_id 
GROUP BY country 


#count of movies by language 
SELECT 
	B. name, 
	COUNT (Distinct film_id) 
FROM film A
	INNER JOIN 
		language B on A.language_id = B.language_id
GROUP BY name


#count of movies by release year
SELECT 
	release_year, 
	COUNT (Distinct film_id) 
FROM film 
GROUP BY releRese_year


#count of movies by category/genre 
SELECT 
	B.name, 
	COUNT (Distinct film_id) 
FROM film_category A
	INNER JOIN 
		category B on A.category_id = B.category_id
GROUP BY name
