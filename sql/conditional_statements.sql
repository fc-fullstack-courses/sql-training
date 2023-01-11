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