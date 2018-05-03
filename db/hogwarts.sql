DROP TABLE IF EXISTS students;
DROP TABLE IF EXISTS houses;

CREATE TABLE houses (
  id serial4 PRIMARY KEY,
  house_name varchar(255)
);

CREATE TABLE students (
  id serial4 PRIMARY KEY,
  first_name varchar(255),
  second_name varchar(255),
  house_id int4 REFERENCES houses (id) ON DELETE CASCADE,
  age int2
);