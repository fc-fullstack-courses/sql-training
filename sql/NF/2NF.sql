/*
 2NF - в первой + неключи функционально полно завият от ключей
 */

 /* Без 2NF */
CREATE TABLE IF NOT EXISTS teachers_to_coureses (
  teacher_id int,
  course varchar(128),
  is_male BOOLEAN,
  PRIMARY KEY (teacher_id, course)
);
/* 2NF */
CREATE TABLE IF NOT EXISTS teachers_to_coureses (
  teacher_id int,
  course varchar(128),
  PRIMARY KEY (teacher_id, course)
);
-- 
CREATE TABLE IF NOT EXISTS teachers_data (
  teacher_id int,
  is_male BOOLEAN
);