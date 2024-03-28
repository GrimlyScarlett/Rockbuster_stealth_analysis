#query top 10 countries for rockbuster in terms of customer numbers 
SELECT D.country, 
  COUNT (customer_id)
FROM customer A
  INNER JOIN 
    address B ON A.address_id = B.address_id 
  INNER JOIN 
    city C ON B.city_id = C.city_id
  INNER JOIN 
    country D on C.country_ID = D.country_ID
GROUP BY country 
ORDER BY COUNT (customer_id) DESC
LIMIT 10; 

#top 10 cities in the top 10 countries
SELECT C.city, 
  D.country, 
  COUNT (A.customer_id) AS number_of_customers, 
FROM customer A 
  INNER JOIN 
    address B on A.address_id = B.address_id
  INNER JOIN 
    city C on B.city_id = C.city_id 
  INNER JOIN 
    country D ON C.country_ID = D.country_ID
WHERE
  D.country IN (
    SELECT country 
    FROM customer A
      INNER JOIN 
        address B on A.address_id = B.address_id
      INNER JOIN 
        city C on B.city_id = C.city_id 
      INNER JOIN 
        country D ON C.country_ID = D.country_ID
      GROUP BY country 
      ORDER BY COUNT (customer_id) DESC
      LIMIT 10 
) 
GROUP BY 
  C. city, D.country 
ORDER BY 
  number_of_customers DESC
LIMIT 10; 


#top 5 customers in top 10 cities
SELECT A.customer_id, 
  A.first_name 
  A.last_name,
  D.country, 
  C.city
  SUM (B.amount) AS total_amount_paid, 
FROM customer A 
  INNER JOIN 
   payment B on A.customer_id = B.customer_id
  INNER JOIN 
    address E on A.address_id = E.address_id
  INNER JOIN 
    city C ON E.city_id = C.city_id
WHERE
  D.country IN (
    SELECT C.city
    FROM customer A
      INNER JOIN 
        address B on A.address_id = B.address_id
      INNER JOIN 
        city C on B.city_id = C.city_id 
      INNER JOIN 
        country D ON C.country_ID = D.country_ID
      GROUP BY C.city
      ORDER BY COUNT (customer_id) DESC
      LIMIT 10 
) 
GROUP BY 
  A.customer_id, A.first_name, A.last_name, D.country, C.city
ORDER BY 
  number_of_customers DESC
LIMIT 5; 
    
