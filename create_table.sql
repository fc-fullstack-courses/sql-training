-- CREATE TABLE my_first_table();
-- DROP TABLE my_first_table;
CREATE TABLE cars (
  model varchar(100),
  year_of_production int,
  price numeric(8, 2),
  is_used boolean,
  created_at date
);
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