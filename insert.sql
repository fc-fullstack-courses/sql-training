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
    id,
    model,
    price,
    year_of_production,
    vin_number,
    is_used,
    created_at
  )
VALUES (
    1,
    'test 2',
    -175000,
    2025,
    887557,
    false,
    '27-12-2027'
  ),
  (2,'', 0, 850, 8697, true, '27-12-1850'),
  (3,'test 2', 25477, 2018, 4578, false, '27-12-2022');
-- INSERT INTO cars
-- (model)
-- VALUES 
-- ('');