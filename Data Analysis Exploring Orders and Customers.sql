-- Data Analysis: Exploring Orders and Customers
# Find order_id, name and city by joining users and orders.
SELECT order_id,name,city FROM sample_join.users t1
JOIN sample_join.orders t2
on t1.user_id = t2.user_id;

# Find order_id, product category by joining order_details and category.
SELECT order_id,category FROM sample_join.order_details t1
JOIN sample_join.category t2
on t1.category_id = t2.category_id;

# Find all the orders placed in pune
SELECT * FROM sample_join.orders t1 
JOIN sample_join.users t2
on t1.user_id = t2.user_id
WHERE t2.city = 'pune';

# Find all orders under chairs category
SELECT * FROM sample_join.category t1
JOIN sample_join.order_details t2
ON t1.category_id=t2.category_id
WHERE t1.vertical = 'chairs';



-- 1. Find all profitable orders
SELECT t1.order_id, SUM(profit) as Profit FROM sample_join.order_details t1
JOIN sample_join.orders t2
ON t1.order_id = t2.order_id
GROUP BY t1.order_id
HAVING Profit>0;

SELECT * FROM sample_join.orders ;
SELECT * FROM sample_join.users;

-- 2. Find the customer who has placed max number of orders
SELECT name as Customer , COUNT(*) as Orders FROM sample_join.orders t1
JOIN sample_join.users t2
ON t1.user_id = t2.user_id 
GROUP BY t2.name 
ORDER BY orders DESC LIMIT 1;

-- 3. which is the most profitable category
SELECT category , SUM(profit) as net_profit FROM sample_join.category t1
JOIN sample_join.order_details t2
ON t1.category_id = t2.category_id 
GROUP BY category
ORDER BY net_profit DESC LIMIT 1;

-- 4. which is the most profitable state
SELECT state, SUM(profit) as net_profit FROM sample_join.orders t1
JOIN sample_join.order_details t2
ON  t1.order_id = t2.order_id
JOIN sample_join.users t3
on t3.user_id = t1.user_id
GROUP BY state
ORDER BY net_profit DESC LIMIT 1;

-- 5. Find all categories with profit higher than 5000
SELECT category, SUM(profit) as Profit FROM sample_join.category t1
JOIN sample_join.order_details t2
ON t1.category_id = t2.category_id
GROUP BY category
HAVING Profit > 5000;