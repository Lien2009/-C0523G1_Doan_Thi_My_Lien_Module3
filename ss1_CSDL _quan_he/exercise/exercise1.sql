CREATE DATABASE student_management;
USE student_management;
CREATE TABLE class(
id int primary key auto_increment,
`name` varchar(200)
);
INSERT INTO class(`name`)
VALUES("Liên"),("Thiện"),("Hưng");
SELECT * FROM class;
DELETE FROM class
where id is null;
DELETE FROM class;
CREATE TABLE teacher(
id int primary key auto_increment,
`name` varchar(200),
age int,
country varchar(100)
);
INSERT INTO teacher(`name`, age, country)
VALUES("Hải",25,"Việt Nam"),("Công",30,"Mỹ"),("Chánh",32,"Lào");
SELECT * FROM teacher;
RENAME TABLE class TO classroom;
SELECT * FROM classroom;