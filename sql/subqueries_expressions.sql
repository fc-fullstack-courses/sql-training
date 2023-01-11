-- EXISTS
SELECT * FROM products WHERE id = 4644651;
--
SELECT (EXISTS (SELECT * FROM products WHERE id = 95));
--
SELECT *
FROM users
WHERE EXISTS (SELECT * FROM orders WHERE user_id = users.id );