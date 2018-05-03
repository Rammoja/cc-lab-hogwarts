DROP TABLE IF EXISTS students;

CREATE TABLE students(
  id serial4 PRIMARY KEY,
  first_name varchar(255),
  second_name varchar(255),
  house_name varchar(255),
  age int2
);