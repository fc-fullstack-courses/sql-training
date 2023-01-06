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