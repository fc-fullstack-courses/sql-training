-- EXISTS
SELECT *
FROM products
WHERE id = 4644651;
--
SELECT (EXISTS (SELECT * FROM products WHERE id = 95));
--
SELECT *
FROM users
WHERE EXISTS (
    SELECT *
    FROM orders
    WHERE user_id = users.id
  );
-- IN / NOT IN
SELECT *
FROM users
WHERE id IN (
    SELECT user_id
    FROM orders
  );
--
SELECT users.*
FROM users
  JOIN orders on user_id = users.id
WHERE users.id NOT IN (
    SELECT user_id
    FROM reviews
  )
GROUP BY users.id;