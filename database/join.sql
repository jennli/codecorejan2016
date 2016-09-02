-- Write the following SQL Queries:
--
-- 1- Find the average line item total price for orders that were completed last month

-- line_items
-- orders
--products

select  avg(price) as line_item_avg from line_items
inner join orders on orders.id = line_items.order_id
where orders.completed_on between '2015-12-01' and '2016-01-01';

-- 2- Select product names and prices that sold last month and the lowest they were sold at.

select products.name , line_items.price, line_items.quantity, orders.completed_on from products
inner join line_items on line_items.product_id = products.id
inner join orders on orders.id = line_items.order_id
where orders.completed_on between '2015-12-01' and '2016-01-01'
order by line_items.quantity;

-- Write the following SQL Queries:
-- 1- Calculate how many items in stock we've ever had for products (remaining or sold) in the database.
select products.name, sum(products.remaining_quantity + line_items.quantity) as sum from products
inner join line_items on line_items.product_id = products.id
group by products.name
order by products.name

-- 2- Find the average order total price for all the orders in the system
select count(*), avg(order_sum) from
(select order_id, sum(line_items.price * line_items.quantity) as order_sum
from line_items
group by order_id
order by order_id
) as temp

-- 1- Select all the products that have been purchased in the last month
select products.name, orders.completed_on from products
inner join line_items on line_items.product_id = products.id
inner join orders on orders.id = line_items.order_id
where orders.completed_on between '2015-12-01' and '2016-01-01'

-- 2- Select all the products that weren't purchased during the last month

sselect products.name from products
left join (
  select line_items.product_id as pi, line_items.id as li from line_items
  inner join orders on line_items.order_id = orders.id
  where orders.completed_on between '2015-12-01' and '2016-01-01'
) as temp
on products.id = temp.pi
where temp.pi is Null
group by products.name
order by products.name


-- 3- Select top 10 products in terms of gross sales last month
select products.name, sum((line_items.price)*(line_items.quantity))as gross
from products
inner join line_items on line_items.product_id = products.id
inner join orders on orders.id = line_items.order_id
where orders.completed_on between '2015-12-01' and '2016-01-01'
group by products.id
order by gross desc
limit 10

-- You have database tables that look like this (this code works on Postgres databases):
--
-- CREATE TABLE users (
--   id  SERIAL PRIMARY KEY,
--   email VARCHAR(128) NOT NULL
-- );
--

-- CREATE TABLE groups (
--   id  SERIAL PRIMARY KEY,
--   group_name VARCHAR(128) NOT NULL
-- );
--
-- CREATE TABLE user_group_memberships (
--   id  SERIAL PRIMARY KEY,
--   user_id INTEGER NOT NULL,
--   group_id INTEGER NOT NULL
-- );
-- Please write a query to determine, given a particular user's email address, what group ids and names do they belong to? Please write an index that would improve the performance of that query.   CREATE INDEX index_name ON table_name (column_name, ...)

create index email on users (id, email)

  select user_group_memberships.group_id, groups.group_name from user_group_memberships
  inner join groups on groups.id = user_group_memberships.group_id
  inner join users where users.email = ''

  -- Select the average order total price for the `Lightweight Marble Gloves` product
  select temp.count, avg(order_total) from (
    select count(*) as count, sum(line_items.price * line_items.quantity) as order_total from line_items
    inner join orders on orders.id = line_items.order_id
    inner join (
      select * from products
      where products.name = 'Lightweight Marble Gloves') as p
      on p.id = line_items.product_id
      group by orders.id ) as temp
      group by temp.count
