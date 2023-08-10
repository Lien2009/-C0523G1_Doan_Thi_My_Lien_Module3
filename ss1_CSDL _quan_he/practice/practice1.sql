CREATE DATABASE demo;
use demo;
create table Student(
id int,
`name` varchar(200),
age int,
country varchar(50)
);
insert into Student(`name`)
values ("Liên"),("Thiện");
select * from Student;
set sql_safe_updates = 0;
update Student
set `name` = "Hạnh"
where `name` = "Liên";
set sql_safe_updates = 1;