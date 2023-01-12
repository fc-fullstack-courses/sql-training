CREATE SCHEMA work;

CREATE TABLE work.departments (
  id serial PRIMARY KEY,
  name varchar(128) NOT NULL,
  created_at timestamp NOT NULL DEFAULT current_timestamp
);

CREATE TABLE work.workers (
  id serial PRIMARY KEY,
  name varchar(128) NOT NULL,
  salary decimal(9,2) NOT NULL CHECK (salary > 0),
  department_id int NOT NULL REFERENCES work.departments,
  created_at timestamp NOT NULL DEFAULT current_timestamp
);
--
INSERT INTO work.departments ("name")
VALUES
('SALES'),
('BA'),
('HR'),
('IT'),
('QA');
--
INSERT INTO work.workers ("name", "salary", "department_id")
VALUES ('Test Testenko', 5000, 4),
('Jonh Doe', 1750, 1),
('Anton Doe', 1350, 1),
('Vodotrav Vodotravovich Kurilenko', 2000, 2),
('Petro Petrovich', 1170, 3),
('Inga Nechiporenko', 2000, 3),
('Intern Internovich', 200, 4),
('Loremium Ipsumus', 200, 5),
('Al Coholic Ipsumus', 500, 5);
--
SELECT d.name ,count(w.id) workers_in_departments
FROM work.departments d
JOIN work.workers w ON d.id = w.department_id
GROUP BY d.id;
--
SELECT w.name "Worker name", salary, d.name "Department name"
FROM work.departments d
JOIN work.workers w ON d.id = w.department_id;
-- средняя зп для отдела
SELECT d.name "Department name", avg(salary)
FROM work.departments d
JOIN work.workers w ON d.id = w.department_id
GROUP BY d.id;
-- имя рабочего, имя его отдела, зарплату и среднюю зарплату для отдела
SELECT w.name "Worker name", salary, d.name "Department name","Average salary for dep"
FROM work.departments d
JOIN work.workers w ON d.id = w.department_id
JOIN (
  SELECT d.name "Department name", avg(salary) "Average salary for dep"
  FROM work.departments d
  JOIN work.workers w ON d.id = w.department_id
  GROUP BY d.id
) dep_with_avg_salary ON dep_with_avg_salary."Department name" = d.name;
--
SELECT w.name "Worker name", salary, d.name "Department name",
avg(salary) OVER (PARTITION BY d.id) "Average salary for dep",
avg(salary) OVER () "Average salary for company"
FROM work.departments d
JOIN work.workers w ON d.id = w.department_id;