-- CREATE TABLE my_first_table();
-- DROP TABLE my_first_table;
CREATE TABLE cars (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid (),
  model varchar(100) NOT NULL CHECK (model != ''),
  year_of_production int NOT NULL CHECK (
    year_of_production > 1900
    AND year_of_production < 2024
  ),
  vin_number int NOT NULL UNIQUE,
  price numeric(8, 2) NOT NULL CHECK (price > 0),
  is_used boolean NOT NULL,
  created_at date NOT NULL DEFAULT current_date,
  updated_at date NOT NULL DEFAULT current_date,
  UNIQUE (model, year_of_production) -- PRIMARY KEY (model, year_of_production)
);
DROP TABLE cars;
/*
 заменители string
 * text - полная замена string, неограниченная длина
 char (N) - строка длиной в N символов '123  ' , '12345' 6
 * varchar (N) - строка длиной до N символов '123'
 
 */
/*
 numeric === decimal
 numeric (точность, масштаб)
 точность - кол-во цифр в числе
 масштаб- кол-во цифр в числе после запятой
 */
CREATE TABLE car_manufacturers (
  id serial PRIMARY KEY,
  name varchar(128) NOT NULL UNIQUE CHECK (name != ''),
  employees int NOT NULL CHECK (employees > 0),
  founding_year int NOT NULL CHECK (founding_year > 1900),
  country_of_origin varchar(128) NOT NULL CHECK (country_of_origin != ''),
  share_price numeric(10,2) NOT NULL CHECK (share_price >= 0),
  ceo varchar(128) NOT NULL CHECK ( ceo != ''), 
  -- ceo_id integer NOT NULL
  created_at date NOT NULL DEFAULT current_date,
  updated_at date NOT NULL DEFAULT current_date
);