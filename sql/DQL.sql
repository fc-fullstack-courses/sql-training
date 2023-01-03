--
SELECT * -- говорим какие столбцы мы хоти получить
FROM users; -- говорим из какой таблицы мы их хотим достать
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
WHERE height < 2;
-- найти всех пользователей которым за 30 и показать еще их вострасті
SELECT *, extract (year from age(birthday)) 
FROM users
WHERE extract (year from age(birthday)) > 30;