-- 1 task
SELECT first_name, last_name, email 
FROM `bigquery-public-data.thelook_ecommerce.users` 
WHERE country = 'Brasil'
AND created_at >= '2023-01-01'

-- 2 task
SELECT category,  
  COUNT(id) AS product_per_category
FROM `bigquery-public-data.thelook_ecommerce.products`
GROUP BY category
ORDER BY product_per_category DESC

-- 3 task
SELECT orders.order_id,
users.first_name, users.last_name,
orders.status
FROM `bigquery-public-data.thelook_ecommerce.orders` orders
JOIN `bigquery-public-data.thelook_ecommerce.users` users 
ON orders.user_id = users.id
WHERE orders.status = 'Shipped'

-- 4 task
SELECT order_id, user_id, 
ROUND(SUM(sale_price),2) AS sale_price
FROM `bigquery-public-data.thelook_ecommerce.order_items` 
GROUP BY order_id, user_id
ORDER BY sale_price DESC

-- 5 task
SELECT country,
COUNT(id) AS users_amount
FROM `bigquery-public-data.thelook_ecommerce.users`
GROUP BY country
HAVING COUNT(id) > 500
ORDER BY users_amount DESC