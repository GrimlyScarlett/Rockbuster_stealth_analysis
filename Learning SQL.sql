#Write a select command to find out what film generes exist in the category table 
Select category_id, name 
FROM cateogry 

#Write an INSERT statement to add 'Thriller', 'Crime', 'Mystery', 'Romance' and 'War' as a genre 
INSERT INTO cateogry (name) 
VALUES ('Thriller'), ('Crime'), ('Mystery'), ('Romance' and 'War')

#Genre for the movie 'African Egg' needs to be updated to 'Thriller' 
#Write select statement for movie 'African Egg'
SELECT film_id,title
FROM film 
WHERE title = 'African Egg'

#Now that you have film_id and cateogry_id UPDATE the command to change the category in film_cateogry table 
SELECT film_id, cateogry_id 
FROM film_cateogory
WHERE film_id=5

UPDATE film_cateogry
SET category_id = 27
WHERE film_id=5 

#checking for update 
SELECT film_id, cateogry_id
FROM film_category
WHERE film_id=5

#given lack of movies in mystery category the manager has decided to remove the cateogry --> delete it 
DELTE FROM cateogry 
WHERE name='Mystery'

#checkoutput 
SELECT category_id, name 
FROM category

#Comparing costs and optimizing code 
EXPLAIN 
SELECT * FROM film

EXPLAIN 
SELECT film_ID, title FROM film

EXPLAIN 
SELECT film_ID, title FROM film 
ORDER BY title 

EXPLAIN 
SELECT film_id, title FROM film 
ORDER BY title 
LIMIT 10 

#Sort every film in film table by most recent year and then highest to lowest rental rate 
SELECT * FROM film 
ORDER BY title ASC, releas_year DEC, rental_rate DESC

#Average rental rate for each rating cateogry with min and max rental duration 
SELECT rating, 
AVG(rental_rate) AS avg_rental_rate, 
MIN(rental_duration) AS min_rental_duration, 
MAX(rental_duration) AS max_rental_duration
FROM film 
GROUP BY rating 

#minimum and maximum repalcement costs for each rating cateogry ordered by rating 
SELECT rating, 
MIN (replacement_cost) AS min_replacement_cost, 
MAX (repalcement_cost) AS max_replacement_cost
FROM film 
GROUP BY rating 
ORDER BY CASE 
WHEN rating='G' THEN '1'
WHEN rating='PG' THEN '2'
WHEN rating='PG-13' THEN '3'
WHEN rating='R' THEN '4'
ELSE '5'
END

#Find film titles with word 'Uptown' in any position 
SELECT film_id, 
  title, 
  description
FROM film 
WHERE ttle 
LIKE '%Uptown%'

#Find film length that is more than 120 minutes and rental rate is more than 2.99 
SELECT film_id, 
  title,
  descirption 
FROM film 
WHERE length > 120
AND rental_rate > 2.99

#Find list of films where rental duration is between 3 and 7 days where 3 and 7 are not inclusive 
Select film_id,
  title, 
  descirption
FROM film
WHERE rental_duration 
BETWEEN 4 AND 6 

#Find films where replacement cost is less than 14.99 
SELECT film_id, 
  title, 
  descirption 
FROM film 
WHERE replacement_cost < 14.99 

#Find films with rating G or PG 
SELECT film_id
  title, 
  description 
FROM film
WHERE rating IN ('PG', 'G') 

#aggregate columns for count of movies, avg rental rate, and max and min rental durations for PG and G movies and group them by rating 
SELECT 
  COUNT (film_id) AS count_of_movies,
  AVG (rental_rate) AS average_movie_rental_rate, 
  MAX (rental_duration) AS maximum_rental_duration, 
  MIN (rental_duration) AS minimum_rental_duration 
    WHEN rating = 'PG' THEN 'PG'
    WHEN rating = 'G' THEN 'G'
    ELSE AS movie_rating
FROM film 
GROUP BY rating
HAVING rating IN ('PG', 'G') 
