-- Assignment: [lab] CRUD
-- Using the SQL Lab tool: https://sql-lab.herokuapp.com/
--
-- Write the following SQL Queries:
-- 1- Create a student record with the following attributes: first_name: John, last_name: Smith, Age: 45, email: john@smith.com registration_date: January 1st 2016, phone_number: 778.778.7787
insert into students (first_name, last_name, age, email, registration_date, phone_number, created_at, updated_at) values ('John','Smith', 45, 'john@smith.com','2016-01-01','778.778.7787', current_timestamp, current_timestamp);
--
-- 2- Select that student from the database be fetching the last record
select * from students where first_name = 'John' and last_name='Smith'

-- 3- Using the id you fetched from the previous exercise, update the age of that record to become 50
UPDATE students SET age=50 WHERE id=5008;
--
-- 4- Delete that record using its id
Delete from students WHERE id=5008;

-- Assignment: [lab] Selecting
-- From the students table:
-- 1- Select the first 10 students whose ages are between 35 and 45
select * from students where age between 35 and 45 limit 10;
-- 2- Select the third set of 10 students whose ages are more than 25 and whose first names contain `th`. The students must be ordered by their id then first name in a descending order.
select * from students where age > 25 and first_name ilike 'th%'order by id DESC, first_name DESC limit 10 offset 20
-- 3- Select the 10 oldest students (You should ignore students with an age that is `NULL`)
select * from students where age IS NOT null order by age DESC limit 10

-- 4- Select all students with age 45 whose last names contain the letter n
select * from students where age = 45 and last_name ilike '%n%';
--
-- From the products table:
-- 5- Select all the products that are on sale
select * from products where sale_price < price
-- 6- Select all the products that are on sale and have remaining items in stock ordered by the sale price in ascending order
select * from products where sale_price < price and remaining_quantity > 0 order by sale_price ASC;

-- 7- Select all the products priced between 25 and 50 (regular price) and that are on sale
select * from products where sale_price < price and price between 25 and 50;

-- Assignment: [lab] Aggregate Functions
-- From the students table:
-- 1- Find the number of students named 'Milton'.
select count(*) from students where first_name ilike 'milton';

-- 2- List the `first_name`s that occur more than once in students, with the number occurrences of that name.
select * from (
  select first_name, count(*) as firstname_count from students group by first_name
)as temp
where firstname_count > 1 order by firstname_count DESC;

-- or

select first_name, count(*) as firstname_count from students group by first_name
having count(*) > 1 order by firstname_count DESC;

-- 3- Refine the above query to list the 20 most common first_names among students, in order first of how common they are, and alphabetically when names have the same count.
select first_name, count(*) as firstname_count from students group by first_name order by firstname_count DESC, first_name ASC limit 20;
--
-- From the products table:
-- 1- Find the most expensive product
select * from products where price in (
	select max(price) from products
) order by name ASC

-- 2- Find the cheapest product that is on sale
select * from products where price in(
select min(price) from products where sale_price < price )

-- 3- Find the total value of all inventory in stock (use sale price)
select sum(sale_price * remaining_quantity) from products;
--
-- For the products table:
-- 1- Select the product whose stock has the most value (use sale price)
select * from products where sale_price*remaining_quantity in (
  select max(sale_price*remaining_quantity) as max_stock from products
  )

-- 2- Select the most expensive product whose price is between 25 and 50 with remaining quantity
select * from products where price between 25 and 50 and remaining_quantity > 0 order by price DESC limit 1 ;

-- 3- Select all products on sale with remaining quantity ordered by their price and then their name
select * from products where sale_price < price and remaining_quantity > 0 order by price DESC, name ASC

-- 4- Select the second set

-- 5- Find the average price of all products
select avg(price) from products

-- 6- Find the average price of all products that are on sale
select avg(price) from products where sale_price < price

-- 7- Find the average price of all products that are on sale with remaining quantity
select avg(price) from products where sale_price < price and remaining_quantity > 0

-- 8- Update all the products whose name contains `paper` (case insensitive) to have a remaining quantity of 0
update products SET remaining_quantity = 0 where name ilike '%paper%';

-- 9- Is it possible to revert the query in question 8?
-- not unless ran inside a transaction

-- 10- Update all the products whose name contains `paper` or `steel` to have a remaining quantity of a random number between 5 and 25
update products set remaining_quantity = floor((random()*20)+5)

-- 11- Select the second set of 10 cheapest products with remaining quantity
select * from products where remaining_quantity > 0 order by price limit 10

-- 12- Build a query that groups the products by their sale price and show the number of products in that price and the sum of remaining quantity. Label the count `product_count`
-- 13- [stretch] Update the most expensive product to have double its quantity in a single query
