-- BAD JOIN EXAMPLE
-- не использовать
SELECT a.x, y, e
FROM a,b
WHERE a.x = b.x;
--
SELECT email, orders.*
FROM users, orders
WHERE user_id = users.id;
--
SELECT email, orders.*
FROM orders
JOIN users ON user_id = users.id;
--
SELECT *
FROM ratings
JOIN reviews ON review_id = reviews.id;
-- товары из третьего заказа
SELECT p.name, category, manufacturer
FROM orders AS o
JOIN orders_to_products AS otp ON o.id = otp.order_id
JOIN products p ON otp.product_id = p.id
WHERE o.id = 3;
-- все заказы с клавиатурами
SELECT o.*
FROM orders o
JOIN orders_to_products otp ON o.id = otp.order_id
JOIN products p ON p.id = otp.product_id
WHERE p.category = 'keyboards';
-- сколько производителей в конкретном заказе
SELECT manufacturer, count (manufacturer)
FROM products p
JOIN orders_to_products otp ON otp.product_id = p.id
JOIN orders o ON o.id = otp.order_id
WHERE o.id = 3
GROUP BY manufacturer;
