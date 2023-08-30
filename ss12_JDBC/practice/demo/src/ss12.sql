CREATE DATABASE ss12;
USE ss12;
CREATE TABLE users(
id int primary key auto_increment,
name varchar(100),
email varchar(100),
country varchar(100)
);
insert into users(name, email, country) values
('Minh','minh@codegym.vn','Viet Nam'),
('Kante','kante@che.uk','Kenia');
delete from users where id = 3;