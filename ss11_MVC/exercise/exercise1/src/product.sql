create database product;
use product;
create table products(
id int primary key auto_increment,
product_name varchar(50),
price double,
description varchar(100),
company varchar(50)
);
insert into products(product_name, price, description, company)
values ("coca", 10, "con hang","Coca");