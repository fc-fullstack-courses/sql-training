--
SELECT * -- говорим какие столбцы мы хоти получить
FROM users;
-- говорим из какой таблицы мы их хотим достать
--
SELECT first_name, birthday FROM users;
--
SELECT 2 + 2;
--
SELECT first_name AS "First name", birthday, 2 + 2 "sum of 2 + 2" FROM users;
--
SELECT extract (year from age(birthday)), *  FROM users;
--
SELECT *
FROM users
WHERE height < 1.5;
--
SELECT *
FROM users
WHERE height < 1.5
  AND weigth < 90;
-- покажите всех женщин с ростом 1.72
SELECT *
FROM users
WHERE is_male = false
  AND height = 1.72;
--
SELECT *
FROM users
WHERE first_name IN ('Victoria', 'Julia');
-- WHERE first_name = 'Victoria' OR first_name = 'Julia';
--
SELECT *
FROM users
WHERE weigth BETWEEN 50 AND 90;
-- WHERE weigth >= 50 AND weigth <= 90;
-- найти всех пользователей которым за 30 и показать еще их вострасті
SELECT *,
  extract (
    year
    from age(birthday)
  )
FROM users
WHERE extract (
    year
    from age(birthday)
  ) > 30;
--
SELECT *
FROM users
LIMIT 10 -- показывает Х записей
  OFFSET 10 -- игнорит первые Х записей
;
--
SELECT *
FROM (
    SELECT *,
      extract (
        year
        from age(birthday)
      ) as age
    FROM users
  ) AS with_age
WHERE age > 30;
--
SELECT first_name || ' ' || last_name as full_name, * 
FROM users;
--
SELECT concat(first_name, ' ', last_name) as full_name, * 
FROM users;
-- Показать всех пользователей, полное имя которых больше 16 символов
-- для конечного решения использовать подзапрос
SELECT concat(first_name, ' ', last_name) as full_name,
  *
FROM users
WHERE length(concat(first_name, ' ', last_name)) > 16;
--
SELECT *
FROM (
    SELECT concat(first_name, ' ', last_name) as full_name,
      *
    FROM users
  ) users_with_full_name
WHERE length(full_name) > 16;
--
SELECT avg(height) "Средний рост пользователей"
FROM users;
/*
 avg - поиск среднего значения
 min - ищет минимальное значение
 max - ищет максимальное значение
 count - количество строк / кортежей 
 sum - как сумма бисконечного кол-ва цифр в JS
 */
-- максимальный вес
SELECT max(weigth),
  id,
  email
FROM users;
-- количество женщин
SELECT count (*)
FROM users
WHERE is_male != true;
-- найти средний рост мужчин и женщин
-- SELECT avg(height)
-- FROM users
-- WHERE NOT is_male;
-- --
-- SELECT avg(height)
-- FROM users
-- WHERE is_male;
SELECT is_male,
  avg(height),
  avg(weigth)
FROM users
GROUP BY is_male;
/*
 количество товаров на складе
 количество проданных товаров
 средняя цена товаров
 Цена самого дешевого повербанка
 Максимальная цена для каждого производителя
 Общая стоимость выкупа всего склада товаров
 
 пользователь и количество заказов которое он совершил
 */
-- Цена самого дешевого повербанка
SELECT min(price)
FROM products
WHERE category = 'powerstations';
-- Максимальная цена для каждого производителя
SELECT manufacturer,
  max(price)
FROM products
GROUP BY manufacturer;
-- Общая стоимость выкупа всего склада товаров
SELECT sum (price * quantity)
FROM products;
-- пользователь и количество заказов которое он совершил
SELECT user_id,
  count(*)
FROM orders
GROUP BY user_id;
--
SELECT count(*)
FROM orders
WHERE user_id = 5;
-- 
SELECT user_id,
  count(*)
FROM orders
WHERE user_id = 5
GROUP BY user_id;
-- сколько пользователей конкретных возрастов
-- показать только группы, в которых больше 15 людей
SELECT count (*) "Количество пользователей", "Возраст"
FROM (
  SELECT extract(
    years
    from age(birthday)
  ) "Возраст",
  *
  FROM users
) users_age
GROUP BY "Возраст"
HAVING count (*) > 15;
--
SELECT * FROM (
  SELECT count (*) "Количество пользователей", "Возраст"
  FROM (
    SELECT extract(
      years
      from age(birthday)
    ) "Возраст",
    *
    FROM users
  ) users_age
  GROUP BY "Возраст"
  ) as age_and_amount
WHERE "Количество пользователей" > 15;
-- Покажите всех производителей
-- у которых количество товаров на складе
-- больше 1 млн едениц
SELECT manufacturer
FROM products
GROUP BY manufacturer
HAVING sum(quantity) > 231000;
-- найти 5 самых дорогих товаров из категории еды
SELECT id, name, category, price, manufacturer
FROM products
WHERE category = 'food'
ORDER BY price DESC
LIMIT 5;
--
SELECT * FROM users
ORDER BY height ASC, birthday DESC;
-- отсортируйте пользователей по:
-- 1. весу от болего к меньшему
-- 2. отсортируйте по полу
-- 3. по имени
-- 4. по номерам телефонов 
SELECT * FROM users
ORDER BY weigth DESC, is_male, first_name DESC, phone_num ;
-- показать всех пользователей c именем, начниающимся на I
SELECT * FROM users
WHERE first_name LIKE 'I%';
-- 
SELECT * FROM users
WHERE first_name ILIKE '%o%O%';
/*
LIKE - жесткая версия
ILIKE - нежесткая
*/
-- регулярки
SELECT * FROM users 
WHERE first_name ~ '^I.*';
--
SELECT * FROM users WHERE first_name ~* '^i.*';