DROP TABLE IF EXISTS orders_to_products;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS reviews CASCADE;
DROP TABLE IF EXISTS ratings CASCADE;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS users;
--
CREATE TABLE users (
  id serial PRIMARY KEY,
  first_name varchar(256) NOT NULL CHECK (first_name != ''),
  last_name varchar(256) NOT NULL CHECK (last_name != ''),
  email varchar(256) NOT NULL CHECK (email != ''),
  password varchar(256) NOT NULL CHECK (password != ''),
  phone_num varchar(20) NOT NULL CHECK(phone_num != ''),
  birthday date CHECK (birthday < current_date),
  is_male boolean,
  height numeric(3,2) CHECK (height > 0.2),
  weigth smallint CHECK (weigth < 1500),
  created_at timestamp NOT NULL DEFAULT current_timestamp,
  updated_at timestamp NOT NULL DEFAULT current_timestamp
);
-- 
CREATE TABLE products (
  id serial PRIMARY KEY,
  name varchar(256) NOT NULL CHECK (name != ''),
  description varchar(5000),
  price numeric(10, 2) NOT NULL CHECK(price > 0),
  quantity int NOT NULL CHECK (quantity >= 0),
  category varchar(256) NOT NULL CHECK (category != ''),
  -- могла быть еще таблица производителей
  manufacturer varchar (256) NOT NULL CHECK(manufacturer != ''),
  min_age smallint CHECK (min_age > 0),
  created_at timestamp NOT NULL DEFAULT current_timestamp,
  updated_at timestamp NOT NULL DEFAULT current_timestamp
);
-- 1 : n
CREATE TABLE reviews (
  id serial PRIMARY KEY,
  user_id int NOT NULL REFERENCES users (id),
  product_id int NOT NULL REFERENCES products,
  rating_id int UNIQUE,
  description text,
  created_at timestamp NOT NULL DEFAULT current_timestamp,
  updated_at timestamp NOT NULL DEFAULT current_timestamp
);
-- 1 : 1
CREATE TABLE ratings (
  id serial PRIMARY KEY,
  review_id int NOT NULL UNIQUE REFERENCES reviews,
  rating numeric(3,1) NOT NULL CHECK(rating > 0 AND rating <= 10),
  created_at timestamp NOT NULL DEFAULT current_timestamp,
  updated_at timestamp NOT NULL DEFAULT current_timestamp  
);
--
ALTER TABLE reviews
ADD FOREIGN KEY (rating_id) REFERENCES ratings (id);
-- n : m - через связующую таблицу
CREATE TABLE orders (
  id serial PRIMARY KEY,
  user_id int NOT NULL REFERENCES users,
  created_at timestamp NOT NULL DEFAULT current_timestamp,
  updated_at timestamp NOT NULL DEFAULT current_timestamp  
);
-- создаем связующую таблицу
CREATE TABLE orders_to_products(
  order_id int REFERENCES orders,
  product_id int REFERENCES products,
  quantity int NOT NULL CHECK (quantity > 0),
  created_at timestamp NOT NULL DEFAULT current_timestamp,
  updated_at timestamp NOT NULL DEFAULT current_timestamp,
  PRIMARY KEY (order_id, product_id)
);
/*
  замовлення:
  айді : 1, 2 , 3
  товари
  айді : 1, 2, 3, 4, 5

  orders_to_products (замовлення, товар)
  (1, 3), (1, 4) +
  (2, 2) +
  (3, 1), (3, 2), (3, 3), (3, 4), (3, 5), (3, 5) -
*/
-- ALTER TABLE users
-- ADD COLUMN birthday date,
-- ADD COLUMN height numeric(3,2) CHECK (height > 0.2),
-- ADD COLUMN weigth smallint CHECK (weigth < 1500);