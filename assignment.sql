use mavenmovies;
use sakila;
## Q-1. Create a table called employees with the following structure
create database raj;
use raj;
create table employees
(emp_id int primary key, emp_name varchar(50) not null,age int check(age>=18),email varchar(50) unique,salary decimal(10,2) default 30000.00);
select * from employees;

## Q-2. Explain the purpose of constraints and how they help maintain data integrity in a database. Provide examples of common types of constraints.
## Ans- Constraints are rules applied to table columns to ensure data accuracy and integrity. They prevent invalid, duplicate, or missing data and enforce business rules.

## Q-3. Why would you apply the NOT NULL constraint to a column? Can a primary key contain NULL values? Justify your answer.
## Ans- The NOT NULL constraint ensures that a column must have a value it prevents missing or incomplete data and a Primary Key cannot contain NULL values.

## Q-4. Explain the steps and SQL commands used to add or remove constraints on an existing table. Provide an example for both adding and removing a constraint.
## Ans- (1). Adding a constraint
ALTER TABLE employees add constraint unique_email UNIQUE (email);
##(2) Removing a constraint
ALTER TABLE employees drop index unique_email;

## Q-5. 
## Ans- If i try to insert, update, or delete data in a way that violates a constraint the database will Reject the operation, Return an error message, This protects data accuracy and integrity.
## Ex- If the email column has a UNIQUE constraint, and you try to insert the same email twice it will through an error.alter

## Q-6. You created a products table without constraints as follows:
CREATE TABLE products (
    product_id INT,
    product_name VARCHAR(50),
    price DECIMAL(10, 2)
);
## (1).The product_id should be a primary key. Ans-
alter table products add primary key (product_id);

## (2).Set a default price of 50.00 for the price column. Ans- 
alter table products modify price decimal(10,2) default 50.00;

## Q-7. Write a query to fetch the student_name and class_name for each student using an INNER JOIN.
## Ans-
select s.student_name,c.class_name from students s inner join classes c on s.class_id = c.class_id;

## Q-9. Write a query to find the total sales amount for each product using an INNER JOIN and the SUM() function.
## Ans-
select p.product_name, sum(s.amount) as total_amt from sales inner join products p on s.product_id = p.product_id
group by p.product_name;

## Q-10. Write a query to display the order_id, customer_name, and the quantity of products ordered by each customer using an INNER JOIN between all three tables.
## Ans-
select o.order_id,c.customer_name,od.quantity from orders o
inner join costumers c on o.customer_id = c.customer_id
inner join order_details od on o.order_id = od.order_id;
				
															## SQL COMMAND ##
                      
 use mavenmovies;
 ## Q-2.List all details of actors.
 select * from actor;
 
 ## Q-3.List all customer information from DB.
 select * from customer;
 
 ## Q-4.List different countries.
 select distinct country from country;
 
 ## Q-5.Display all active customers.
 select * from customer where active = 1;
 
 ## Q-6.List of all rental IDs for customer with ID 1.
 select rental_id,customer_id from rental where customer_id = 1;
 
## Q-7.Display all the films whose rental duration is greater than 5.
 select * from film where rental_duration > 5;
 
## Q-8.List the total number of films whose replacement cost is greater than $15 and less than $20.
  select count(*) from film where replacement_cost > 15 and replacement_cost <20;
  
## Q-9. Display the count of unique first names of actors.
  select count(distinct first_name) from actor;
  
## Q-10. Display the first 10 records from the customer table.
select * from customer limit 10;

## Q-11. Display the first 3 records from the customer table whose first name starts with ‘b’.
select * from customer where first_name like 'b%' limit 3;

## Q-12. Display the names of the first 5 movies which are rated as ‘G’.
select title from film where rating = 'G' limit 5;

## Q-13. Find all customers whose first name starts with "a".
select * from customer where first_name like 'a%';

## Q-14. Find all customers whose first name ends with "a".
select * from customer where first_name like '%a';

## Q-15. Display the list of first 4 cities which start and end with ‘a’.
select * from city where city like 'a%a' limit 4;

## Q-16. Find all customers whose first name have "NI" in any position.
select * from customer where first_name like '%NI%';


## Q-17.Find all customers whose first name have "r" in the second position.
SELECT * FROM customer WHERE first_name LIKE '_r%';

## Q-18.Find all customers whose first name starts with "a" and are at least 5 characters in length.
select * from customer where first_name like 'a%' and length(first_name) >=5;

## Q-19. Find all customers whose first name starts with "a" and ends with "o".
select * from customer where first_name like 'a%o';

## Q-20. Get the films with PG and PG-13 rating using IN operator.
select * from film where rating in ('PG','PG-13');


## Q-21. Get the films with length between 50 to 100 using BETWEEN operator.
select * from film where length between 50 and 100;

## Q-22. Get the top 50 actors using LIMIT operator.
select * from actor limit 50;

## Q-23. Get the distinct film ids from inventory table.
select distinct film_id from inventory;


                                                   ## BASIC AGGRIGATE FUNCTIONS ##
                                                   
use sakila;
## Q1. Retrieve the total number of rentals made in the Sakila database.
select count(*) from rental;

## Q2. Find the average rental duration (in days) of movies rented from the Sakila database.
select avg(rental_duration) from film;

## Q3. Display the first name and last name of customers in uppercase.
select upper(first_name),(last_name) from customer;

## Q4. Extract the month from the rental date and display it alongside the rental ID.
select rental_id, month(rental_date) from rental;

## Q5. Retrieve the count of rentals for each customer (display customer ID and the count of rentals)
select customer_id,count(*) from rental
group by customer_id;

## Q6. Find the total revenue generated by each store.
select staff_id,SUM(AMOUNT) as total_revnue from payment group by staff_id;

## Q8. Find the average rental rate of movies in each language.
select * from film;
select * from language;
select l.name as language_name,avg(f.rental_rate) as avg_ren_rate from film f
join language l on f.language_id = l.language_id group by l.name;


                              ## 
## Q9. Display the title of the movie, customer’s first name, and last name who rented it.
select * from film;
select * from customer;
select * from rental;
select * from inventory;
select f.title,c.first_name,c.last_name from rental r
join inventory i on r.inventory_id = i.inventory_id
join film f on i.film_id = f.film_id
join customer c on r.customer_id = c.customer_id;


## Q10. Retrieve the names of all actors who have appeared in the film "Gone with the Wind."
select * from film_actor;
select * from film;
select * from actor;
select a.first_name,a.last_name from film f
join film_actor fa on f.film_id = fa.film_id
join actor a on a.actor_id = fa.actor_id
where f.title = 'gone with the wind';

## Q11. Retrieve the customer names along with the total amount they've spent on rentals.
select * from customer;
select * from payment;
select * from rental;
select c.first_name,c.last_name,sum(p.amount) as total_spent from customer c
join payment p on c.customer_id = p.customer_id
group by c.first_name,c.last_name;

## Q12. List the titles of movies rented by each customer in a particular city (e.g., 'London').
select * from customer;
select * from address;
select * from city;
select * from rental;
select * from inventory;
select * from film;
select c.first_name,c.last_name,f.title,ct.city from customer c
join address a on c.address_id = a.address_id
join city ct on a.city_id = ct.city_id
join rental r on c.customer_id = r.customer_id
join inventory i on r.inventory_id = i.inventory_id
join film f on i.film_id = f.film_id
where city = 'london';

## Q13. Display the top 5 rented movies along with the number of times they've been rented.
select * from film;
select * from inventory;
select * from rental;
select f.title,count(rental_id) as times_rented from film f
join inventory i on f.film_id = i.film_id
join rental r on r.inventory_id = i.inventory_id
group by f.title order by times_rented desc limit 5;

## Q14. Determine the customers who have rented movies from both stores (store ID 1 and store ID 2).
select * from rental;
select * from inventory;
select * from customer;
select c.first_name,c.last_name,r.customer_id from rental r
join inventory i on r.inventory_id = i.inventory_id
join customer c on r.customer_id = c.customer_id
group by r.customer_id having count(distinct i.store_id) =2;

                                                     ## WINDOW FUNCTION ##
												
## Q1. Rank the customers based on the total amount they've spent on rentals.
select * from payment;
select customer_id, sum(amount) as total_spent,
rank()over(order by sum(amount) desc) as desc_rank from payment
group by customer_id;

## Q2. Calculate the cumulative revenue generated by each film over time.
SELECT f.film_id,f.title,p.payment_date,
SUM(p.amount) OVER (PARTITION BY f.film_id ORDER BY p.payment_date) AS cumulative_revenue
FROM film f
JOIN inventory i ON f.film_id = i.film_id
JOIN rental r ON i.inventory_id = r.inventory_id
JOIN payment p ON r.rental_id = p.rental_id;

## Q3. Determine the average rental duration for each film, considering films with similar lengths.
select * from film;
select title,length,avg(rental_duration) over (partition by length) as avg_dur_len
from film;

## Q5. Calculate the difference in rental counts between each customer's total rentals and the average rentals across all customers.
WITH customer_rentals AS (
    SELECT customer_id, COUNT(*) AS rental_count
    FROM rental
    GROUP BY customer_id
)
SELECT customer_id,
       rental_count,
       rental_count - AVG(rental_count) OVER () AS difference_from_avg
FROM customer_rentals;


                                                         ## NORMALISATION & CTE ##

## Q-5. Write a query using a CTE to find the total revenue generated by each customer (sum of payments) from the customer and payment tables.
select * from customer;
select * from payment;
with customer_revenue as(select customer_id,sum(amount) as total_revenue from payment group by customer_id)
select * from customer_revenue;

##Q-6. Utilize a CTE with a window function to rank films based on their rental duration from the film table.
select * from film;
with film_ranking as (select title,rental_duration,rank() over(order by rental_duration desc) as rank_duration from film)
select * from film_ranking;

## Write a query using a CTE to find the total number of rentals made each month, considering the rental_date from the rental table.
select * from rental;
with month_rental as (select date_format(rental_date,'%y-%m')as rental_month,count(*) total_rentals from rental
group by date_format(rental_date,'%y-%m'))
select * from month_rental;

## Write a query using a CTE to find the total number of rentals made each month, considering the rental_date from the rental table.
WITH monthly_rentals AS (SELECT DATE_FORMAT(rental_date, '%Y-%m') AS rental_month,COUNT(*) AS total_rentals FROM rental
GROUP BY DATE_FORMAT(rental_date, '%Y-%m')
)
SELECT * FROM monthly_rentals
ORDER BY rental_month;














































































                                               



































 

 



 
 

 
 
 




							












                                                   








































