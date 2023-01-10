/*
  3NF - 2NF + отсутствуют транзитивные зависомости неключей

  транзитивная зависимость - зависимость не только от ключа 
  но и от другого атрибута

  id < attr1 - норма
  id < attr1 < attr2 - транзитивная зависимость, плохо
*/
CREATE TABLE employees (
  id serial PRIMARY KEY,
  name text,
  email text UNIQUE,
  department text,
  department_boss int -- неключ зависиит от другого неключевог аттрибута
);

/* 3NF */
CREATE TABLE employees (
  id serial PRIMARY KEY,
  name text,
  email text UNIQUE,
  department_id int,
);
--
CREATE TABLE departments (
  id serial PRIMARY KEY,
  name text,
  department_boss int 
);