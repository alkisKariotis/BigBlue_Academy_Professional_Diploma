--HR database

SELECT salary
      FROM employees
      WHERE job_id =15
      
--Lets nest the previous one in a where 
SELECT first_name, last_name, job_id, salary
FROM employees
WHERE salary > all 
     (SELECT salary
      FROM employees
      WHERE job_id =15)
ORDER BY salary;


SELECT first_name, last_name, job_id, salary
FROM employees
WHERE salary > ANY ---NOTE THE DIF
     (SELECT salary
      FROM employees
      WHERE job_id =15)
ORDER BY salary;


-- ALL requires condition to meet for all records of the the nested query
--ANY requires condtion to meet for any record of the nested query





----------------------------
      

      
-- Dvd_rentals database


--find max rental_duration
select max(rental_duration) from film

--find movies with this max rental_duration
select * from film
where rental_duration = 7

--how many rentals are with this duration 
select count(*) from film 
where rental_duration = 7

--how many rentals are with this duration (like you dont know this duration)
select count(*) from film 
where rental_duration = (select max(rental_duration) from film)



-- bring title, rating and a new age_restricion  column as following 

 --          rating ='G' THEN age_restricion= 'General Audiences'

 --          rating ='PG' THEN age_restricion='Parental Guidance Suggested'

 --          rating ='PG-13' THEN age_restricion='Parents Strongly Cautioned'

 --          rating ='R' THEN age_restricion='Restricted'

 --          rating ='NC-17' THEN age_restricion='Adults Only'
SELECT title,
       rating,
       CASE rating
           WHEN 'G' THEN 'General Audiences'
           WHEN 'PG' THEN 'Parental Guidance Suggested'
           WHEN 'PG-13' THEN 'Parents Strongly Cautioned'
           WHEN 'R' THEN 'Restricted'
           WHEN 'NC-17' THEN 'Adults Only'
       END as age_restriction
FROM film
ORDER BY title;



-- bring for each customer his ID, first name, last name, PLUS payment amount and payment payment date 
SELECT
	customer.customer_id,
	first_name,
	last_name,
	amount,
	payment_date
FROM
	customer
INNER JOIN payment 
    ON payment.customer_id = customer.customer_id
ORDER BY payment_date



-- bring for each customer his ID, first name, last name, PLUS payment amount and payment payment date PLUS staff first name and staf last _name order by date
SELECT
	c.customer_id,
	c.first_name customer_first_name,
	c.last_name customer_last_name,
	s.first_name staff_first_name,
	s.last_name staff_last_name,
	amount,
	payment_date
FROM
	customer as c
INNER JOIN payment as p 
    ON p.customer_id = c.customer_id
INNER JOIN staff as s 
    ON p.staff_id = s.staff_id
ORDER BY payment_date;



--for each film bring those films with the same duration order by title
SELECT
    f1.title,
    f2.title,
    f1.length
FROM
    film f1
INNER JOIN film f2 
    ON f1.film_id <> f2.film_id AND 
       f1.length = f2.length
ORDER BY f1.title 


--find all first_name and last_name pairs that exist in actors and customers tables 
select count(*) from 
(select first_name, last_name from actor a
union all
select first_name, last_name from customer c
) as temporary_table


-- duplicates exluded
select count(*) from 
(select first_name, last_name from actor a
union 
select first_name, last_name from customer c
) as temporary_table



--find those first- last name pairs that exist in both in actor and customer tables
select count(*) from 
(select first_name, last_name from actor a
intersect
select first_name, last_name from customer c
) as temporary_table

-- let see who is this one 
select first_name, last_name from actor a
intersect
select first_name, last_name from customer c