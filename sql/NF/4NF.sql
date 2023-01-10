/*
 4NF - BCNF + отсутствуют многозначные зависимости, 
 не являющиеся функциональными зависимостями.
 
 многозначная зависимость - когда для зависимости X -> Y
 для одного X  у нас есть много Y
 */
/*
 есть службы доставки
 доставляем разные виды товаров
 доставляем в конкретные локации
 */
--
CREATE TABLE delivery_servises (id serial PRIMARY KEY);
CREATE TABLE product_types (id serial PRIMARY KEY, name text);
--
CREATE TABLE delivery_servises_to_product_types (
servise_id INt REFERENCES delivery_servises,
product_type_id int REFERENCES product_types,
location text,
PRIMARY KEY (servise_id, product_type_id, location)
);
--
INSERT INTO delivery_servises_to_product_types (
servise_id,
product_type_id,
location
)
VALUES (1, 1, 'Kyiv'),
  (1, 1, 'Odesa'),
  (1, 1, 'Dnipro'),
  (2, 1, 'Dnipro'),
  (2, 2, 'Kharkiv');
--
CREATE TABLE delivery_servises (id serial PRIMARY KEY);
CREATE TABLE product_types (id serial PRIMARY KEY, name text);
CREATE TABLE locations (id serial PRIMARY KEY);
--
CREATE TABLE delivery_servises_to_product_types (
servise_id INt REFERENCES delivery_servises,
product_type_id int REFERENCES product_types,
PRIMARY KEY (servise_id, product_type_id)
);
--
CREATE TABLE  delivery_servises_to_locations (
  servise_id INt REFERENCES delivery_servises,
  location_id INt REFERENCES locations,
  PRIMARY KEY (servise_id, location_id)
);