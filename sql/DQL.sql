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
SELECT concat(first_name, ' ', last_name) as full_name, * 
FROM users
WHERE length( concat(first_name, ' ', last_name) ) > 16;
--
SELECT *
FROM (
  SELECT concat(first_name, ' ', last_name) as full_name, *
  FROM users
) users_with_full_name
WHERE length(full_name) > 16;