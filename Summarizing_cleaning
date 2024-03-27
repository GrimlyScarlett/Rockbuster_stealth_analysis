#check film and customer table for dirty data - specifically non-uniform or duplicate data 
#duplicates in film table 
SELECT film_id,
  title, 
  description,
  release_year, 
  language_id, 
  rental_duration, 
  rental_rate, 
  length, 
  replacement_cost, 
  rating, 
  last_update, 
  special_features, 
  fulltext
FROM film
GROUP BY film_id,
  title, 
  description,
  release_year, 
  language_id, 
  rental_duration, 
  rental_rate, 
  length, 
  replacement_cost, 
  rating, 
  last_update, 
  special_features, 
  fulltext
HAVING COUNT(*) >1; 

#checking duplicates in customer table 
SELECT customer_id, 
  store_id, 
  first_name, 
  last_name, 
  email, 
  addres_id, 
  activebool, 
  create_date, 
  last_update, 
  active
FROM customer
GROUP BY customer_id, 
  store_id, 
  first_name, 
  last_name, 
  email, 
  addres_id, 
  activebool, 
  create_date, 
  last_update, 
  active
HAVING COUNT(*) >1; 

#check filma nd customer table for missing data 
#checking film table for missing data
SELECT *
FROM FILM 
WHERE (film_id,
  title, 
  description,
  release_year, 
  language_id, 
  rental_duration, 
  rental_rate, 
  length, 
  replacement_cost, 
  rating, 
  last_update, 
  special_features, 
  fulltext) 
is null; 

#checking customer table for missing data
SELECT *
FROM Customer 
WHERE (customer_id, 
  store_id, 
  first_name, 
  last_name, 
  email, 
  addres_id, 
  activebool, 
  create_date, 
  last_update, 
  active)
is null;

#summarize the data in the film and customer tables 
#summarizing the film table for numerial data
SELECT MIN (release_year) AS min_release_year, 
  MAX (release_year) AS max_release_year, 
  AVG (release_year) AS avg_release_year, 
  COUNT (release_year) AS count_release_year, 

  MIN (rental_duration) AS min_rental_duration,
  MAX (rental_duration) AS max_rental_duration, 
  AVG (rental_duration) AS avg_rental_duration, 
  COUNT (rental_duration) AS count_rental_duration, 

  MIN (rental_rate) AS min_rental_rate,
  MAX (rental_rate) AS max_rental_rate, 
  AVG (rental_rate) AS avg_rental_rate, 
  COUNT (rental_rate) AS count_rental_rate,

  MIN (length) AS min_length,
  MAX (length) AS max_length, 
  AVG (length) AS avg_length, 
  COUNT (length) AS count_length, 

  MIN (replacement_cost) AS min_replacement_cost,
  MAX (replacement_cost) AS max_replacement_cost, 
  AVG (replacement_cost) AS avg_replacement_cost, 
  COUNT (replacement_cost) AS count_replacement_cost 
FROM film 

#summarizing non-numerical data in the film table
SELECT MODE () WITHIN GROUP (ORDER BY film_id) AS mode_film_id, 
  MODE () WITHIN GROUP (ORDER BY title) AS mode_title, 
  MODE () WITHIN GROUP (ORDER BY description) AS mode_description, 
  MODE () WITHIN GROUP (ORDER BY rating) AS mode_rating, 
  MODE () WITHIN GROUP (ORDER BY last_update) AS mode_last_update, 
  MODE () WITHIN GROUP (ORDER BY special_features) AS mode_special_features, 
  MODE () WITHIN GROUP (ORDER BY fulltext) AS mode_full_text 
FROM film

#summarixing non-numerical data from customer table --> there is no numerical data
SELECT MODE () WITHIN GROUP (ORDER BY customer_id) AS mode_customer_id, 
  MODE () WITHIN GROUP (ORDER BY store_id) AS mode_store_id, 
  MODE () WITHIN GROUP (ORDER BY first_name) AS mode_first_name, 
  MODE () WITHIN GROUP (ORDER BY last_name) AS mode_last_name, 
  MODE () WITHIN GROUP (ORDER BY email) AS mode_email, 
  MODE () WITHIN GROUP (ORDER BY address_id) AS mode_address_id, 
  MODE () WITHIN GROUP (ORDER BY activebool) AS mode_activebool,
  MODE () WITHIN GROUP (ORDER BY create_date) AS mode_create_date,
  MODE () WITHIN GROUP (ORDER BY last_update) AS mode_last_update,
  MODE () WITHIN GROUP (ORDER BY active) AS mode_active
FROM customer
