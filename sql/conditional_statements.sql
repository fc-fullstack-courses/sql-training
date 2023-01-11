SELECT first_name, last_name, email,
CASE
  WHEN is_male = TRUE THEN 'male'
  WHEN is_male != TRUE THEN 'female'
END gender,
is_male
FROM users;
--@block
SELECT first_name, last_name, email,
CASE
  WHEN is_male = TRUE THEN 'male'
  ELSE 'female'
END gender,
is_male
FROM users;
--@block
SELECT first_name, last_name, email,
CASE is_male
  WHEN TRUE THEN (
    CASE extract (YEAR FROM age(birthday)) >= 40
    WHEN TRUE THEN 'adult male'
    WHEN FALSE THEN 'child boy'
    END
  )
  WHEN FALSE THEN (
    CASE extract (YEAR FROM age(birthday)) >= 40
    WHEN TRUE THEN 'adult female'
    WHEN FALSE THEN 'child girl'
    END
  )
END gender,
-- CASE extract (YEAR FROM age(birthday)) >= 40
--   WHEN TRUE THEN 'adult'
--   WHEN FALSE THEN 'child'
-- END age_bracket,
is_male
FROM users;
-- COALESCE
--@block
SELECT COALESCE(min_age, 0), * FROM products
ORDER BY id ASC;
--
UPDATE products SET min_age = 18 WHERE id = 1;
-- NULLIF
SELECT NULLIF(2,4);
SELECT NULLIF(4,4);
SELECT NULLIF(NULL, 4);
SELECT NULLIF (COALESCE(min_age, 0), 0 ) ,* FROM products
ORDER BY id ASC;