--
CREATE VIEW orders_with_total AS (
  SELECT order_id, sum (otp.quantity * p.price ) total
  FROM products p
  JOIN orders_to_products otp ON product_id = p.id
  GROUP BY order_id
);
--
SELECT * FROM orders_with_total
JOIN orders ON orders_with_total.order_id = orders.id
JOIN users ON users.id = user_id;
--
CREATE MATERIALIZED VIEW mat_orders_with_total AS (
  SELECT order_id, sum (otp.quantity * p.price ) total
  FROM products p
  JOIN orders_to_products otp ON product_id = p.id
  GROUP BY order_id
);
--
SELECT * FROM mat_orders_with_total
WHERE total > (SELECT avg(total) FROM mat_orders_with_total);
-- обновить данные в вьюхе
REFRESH MATERIALIZED VIEW mat_orders_with_total;
DROP VIEW orders_with_total;
DROP MATERIALIZED VIEW mat_orders_with_total;
-- создать вьюшку, в которй будет
-- имя и фамилия юзера
-- его возраст 
-- его пол слвами, не булем