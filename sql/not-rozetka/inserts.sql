INSERT INTO users (name, email, password, phone_num)
VALUES (
    'test',
    'test@test.test',
    'hbdaf^asf9879asfasg*G^D*',
    '087-46498-56'
  ),
  (
    'test 2',
    'test2@test.test',
    'iabfvi7t5435oq78r',
    '088-4612-13'
  ),
  (
    'test 3',
    'test3@test.test',
    'f79b47tgfb4fbw8f',
    '089-46498-52'
  );
--
INSERT INTO products (
name,
description,
price,
quantity,
manufacturer,
min_age
)
VALUES (
    'toothbrush',
    'this is toothbrush',
    100,
    15000,
    'rozetka',
    NULL
  ),
  (
    'notebook',
    'this is notebook',
    50000,
    7500,
    'asus',
    NULL
  ),
  (
    'wine',
    'this is wine',
    500,
    5231,
    'rozetka',
    18
  ),
  (
    'cat',
    'this is cat',
    19999,
    2,
    'rozetka pets',
    NULL
  );
-- orders
INSERT INTO orders
(user_id)
VALUES
(1),
(2),
(2),
(1),
(3);
--
INSERT INTO orders_to_products
(order_id, product_id, quantity)
VALUES
(1, 4, 2),
(2, 1, 2),
(3, 1, 5),
(4, 2, 2),
(4, 3, 2),
(5, 3, 20);
-- reviews
INSERT INTO reviews
(user_id, product_id, description)
VALUES
(1,4, 'малые разодрали все мебли'),
(3, 1, 'лучшие щетки в моей жизни');
--
INSERT INTO ratings
(review_id, rating)
VALUES
(1, 9.9);
UPDATE reviews SET rating_id = 1 WHERE id = 1;

