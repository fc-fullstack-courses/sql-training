INSERT INTO cars
VALUES (
    'Best model',
    2022,
    19999.99,
    false,
    '26-12-2022'
  );
--
INSERT INTO cars
VALUES (
    'Best model',
    2022,
    19999.99,
    false,
    '26-12-2022'
  ),
  (
    'Best model',
    2022,
    19999.99,
    false,
    '26-12-2022'
  ),
  (
    'Best model',
    2022,
    19999.99,
    false,
    '26-12-2022'
  ),
  (
    'Best model',
    2022,
    19999.99,
    false,
    '26-12-2022'
  );
-- SELECT * FROM cars;
--
-- INSERT INTO cars
-- (model, price, year_of_production, is_used, created_at)
-- VALUES ('Test model', 75000, 2025, false, '27-12-2022');
INSERT INTO cars (
    model,
    price,
    year_of_production,
    vin_number,
    is_used
  )
VALUES (
    'test 2',
    175000,
    2019,
    887557,
    false
  ),
  ('safdsaf', 10, 2005, 8697, true),
  ('test 2', 25477, 2018, 4578, false);
-- INSERT INTO cars
-- (model)
-- VALUES 
-- ('');
INSERT INTO car_manufacturers (
    name,
    employees,
    founding_year,
    country_of_origin,
    share_price,
    ceo
  )
VALUES (
    'Toyota',
    5000,
    1950,
    'Japan',
    4.5,
    'Miyamoto Toyota'
  );
-- UPDATE
UPDATE users -- в какой таблице обновляем
SET name = 'Anton Antonovich' -- Говорите новое значение для поля
WHERE name = 'test'; -- пишем условие, все строки соблюдающие его будут изменены
-- обновление всех строк
UPDATE users
SET height = 1.50;
-- обновление нескольки полей
UPDATE users
SET weigth = 75, birthday = '03-03-1994'
WHERE id = 20;
-- DELETE
DELETE FROM users -- удаляем из таблицы
WHERE id > 3 AND id < 1000 -- условие удаления
RETURNING id, name, email; -- вернуть в качестве реузльтатов анные из указанных столбцов. * возвращает все столбцы по порядку
--
DELETE FROM orders_to_products; -- удаление всех данных в таблице
TRUNCATE TABLE orders_to_products; -- более быстрое удаление всех данных