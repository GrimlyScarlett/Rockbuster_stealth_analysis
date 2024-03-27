#find the average amount paid by the top 5 customers 
WITH top_five_customers (customer_id, first_name, last_name, country, city) AS
  (SELECT A.customer_id, 
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
  LIMIT 5) 

SELECT AVG(total_amount_paid) AS average_top_five 
FROM top_five_customers

#how many of the top 5 customers are based within each country 
WITH top_five_customers_cte (customer_id, first_name, last_name, country, city) AS
  (SELECT A.customer_id, 
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
  total_amount_paid DESC
  LIMIT 5)
SELECT D.country 
COUNT (DISTINCT A.customer_id) AS all_customer_count, 
COUNT (DISTINCT top_5_customers) AS top_customer_count
FROM customer A
  INNER JOIN 
    address B on A.address_id = B.address_id 
  INNER JOIN 
    city C on B. city_id = C.city_id 
  INNER JOIN 
    country D on c.country_id = D.country_id
LEFT JOIN top_five_customers_cte ON A.customer_id = top_five_customers_cte.customer_id
GROUP BY D.country 
ORDER BY all_customer_count DESC;
