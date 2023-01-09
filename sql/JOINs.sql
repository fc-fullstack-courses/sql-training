-- BAD JOIN EXAMPLE
-- не использовать
SELECT a.x,
    y,
    e
FROM a,
    b
WHERE a.x = b.x;
--
SELECT email, orders.*
FROM users,
    orders
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
SELECT p.name,
    category,
    manufacturer
FROM orders AS o
    INNER JOIN orders_to_products AS otp ON o.id = otp.order_id
    INNER JOIN products p ON otp.product_id = p.id
WHERE o.id = 3;
-- все заказы с клавиатурами
SELECT o.*
FROM orders o
    JOIN orders_to_products otp ON o.id = otp.order_id
    JOIN products p ON p.id = otp.product_id
WHERE p.category = 'keyboards';
-- сколько производителей в конкретном заказе
SELECT manufacturer,
    count (manufacturer)
FROM products p
    JOIN orders_to_products otp ON otp.product_id = p.id
    JOIN orders o ON o.id = otp.order_id
WHERE o.id = 3
GROUP BY manufacturer;
-- LEFT JOIN - все строки из левой таблицы
-- все данные из правой таблицы
-- там где данных для левой записи нет то засовуются нулы
SELECT u.id,
    count(o.id)
FROM users u -- левая таблица 
    LEFT JOIN orders o -- правая таблица
    ON o.user_id = u.id
GROUP BY u.id
ORDER BY u.id DESC;
-- RIGHT JOIN - все строки из правой таблицы
-- все данные из левой таблицы
-- там где данных для правой записи нет то засовуются нулы
SELECT u.id,
    count(o.id)
FROM orders o
    RIGHT JOIN users u ON o.user_id = u.id
WHERE o.user_id
GROUP BY u.id
ORDER BY u.id DESC;
-- исключающий JOIN
SELECT u.id
FROM orders o
    RIGHT JOIN users u ON o.user_id = u.id
WHERE o.user_id IS NULL -- волшебная часть
GROUP BY u.id
ORDER BY u.id DESC;
-- FULL JOIN - данные из обеих таблиц где возомжно,
-- нулы если нет каких то строк
SELECT *
FROM orders o
    FULL JOIN users u ON o.user_id = u.id
ORDER BY u.id DESC;
-- посчитайте стоимость каждого заказа
-- количество категорий в конкретном заказе
SELECT order_id,
    count (*)
FROM (
        SELECT otp.order_id,
            p.category
        FROM orders_to_products otp
            JOIN products p ON p.id = product_id
        GROUP BY order_id,
            p.category
    ) as orders_with_unique_categories
WHERE order_id = 1
GROUP BY order_id;
--
SELECT order_id, count (DISTINCT p.category)
FROM orders_to_products otp
JOIN products p ON p.id = product_id
WHERE order_id = 1
GROUP BY order_id;
-- данные о товаре и в скольких заказах он есть
SELECT p.*, count(*)
FROM products p
JOIN orders_to_products otp ON product_id = p.id
GROUP BY p.id 
ORDER BY count(*) ASC;
/*
показать все отзывы и оценки

количество заказов каждого пользователя и его имя и фамилию

данные о пользователе, товаре который он купил и его отзыв с рейтингом

найти самый популярный товар (находится в наибольшем количестве заказов)

все товары с максимальной оценкой отзыва и количество таких отзывов

пользователи и количество купленных ими уникальных товаров (подзапросы)

**все заказы со стоимостью заказа выше средней стоимости заказа (подзапросы)

*/

--@block показать все отзывы и оценки
SELECT rev.id, user_id, product_id, rating, description 
FROM reviews rev
JOIN ratings rat ON rat.review_id = rev.id;
--@block количество заказов каждого пользователя и его имя и фамилию
SELECT u.id, first_name, last_name, count(o.id)
FROM users u
LEFT JOIN orders o ON user_id = u.id
GROUP BY u.id;