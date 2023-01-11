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
-- SOME / ANY
SELECT products.* FROM products
WHERE id = ANY (
    SELECT product_id
    FROM orders_to_products
  );
-- ALL
SELECT order_id, product_id FROM orders_to_products
WHERE quantity > ALL (SELECT quantity FROM products);
--
UPDATE orders_to_products SET  quantity = 50000
WHERE order_id = 1 AND product_id = 5606;