CREATE TABLE a (x char(10), y int);
CREATE TABLE b (x char(10), e boolean);
--
INSERT INTO a (x, y)
VALUES ('aaa', 10),
  ('aab', 11),
  ('aac', 12),
  ('aba', 21),
  ('abb', 22),
  ('bbb', 29),
  ('caa', 315);
--
INSERT INTO b (x, e)
VALUES ('ccc', false),
  ('cbc', true),
  ('acc', true),
  ('aaa', true),
  ('aba', false);
--
SELECT * FROM a;
SELECT * FROM b;
--
SELECT * FROM a, b;
-- Обьединение уникальных значений - UNION
SELECT x FROM a
UNION
SELECT x FROM b;
-- INTERSECT - возвращает совпадающие значения
SELECT id FROM users
INTERSECT
SELECT user_id FROM orders;
-- EXCEPT - возаращает значения из 1 таблиці, которых
-- нет во второй
SELECT id FROM users
EXCEPT
SELECT user_id FROM orders;
