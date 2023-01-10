/*
  BCNF - 3NF + отсутствуют зависимости атрибутов 
  первичного ключа от неключевых атрибутов.

*/

/*
  есть преподы, студенты и предметы

  students m : n subjects
  students m : n teachers
  teach n : 1 subject
*/
--
CREATE TABLE students (
  id serial PRIMARY KEY,
  name text
);
--
CREATE TABLE teachers (
  id serial PRIMARY KEY,
  name text
);
--
CREATE TABLE students_to_teachers_to_subjects (
  teacher_id int,
  student_id int,
  subject text,
  PRIMARY KEY (teacher_id, student_id)
);
--
INSERT INTO students_to_teachers_to_subjects (
  teacher_id,
  student_id,
  subject
) VALUES (
  1, 1, 'Math',
  1, 2 'Math',
  2, 2 'Physics',
  2, 4, 'Physical education'
);
/* BCNF */
CREATE TABLE students (
  id serial PRIMARY KEY,
  name text
);
-- 
CREATE TABLE subjects (
  id serial PRIMARY KEY,
  name text
);
--
CREATE TABLE teachers (
  id serial PRIMARY KEY,
  name text,
  subject_id int REFERENCES subjects
);
--
CREATE TABLE students_to_teachers (
  teacher_id int,
  student_id int,
  PRIMARY KEY (teacher_id, student_id)
);