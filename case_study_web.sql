CREATE DATABASE watch_management;
USE watch_management;

CREATE TABLE roles (
role_id int primary key auto_increment,
role_name varchar(45)
);

CREATE TABLE accounts(
account_id int primary key  auto_increment,
account_user_name varchar(45),
account_pass varchar (45),
role_id int,
foreign key (role_id) references roles(role_id)
);


CREATE TABLE customers (
customer_id int primary key auto_increment,
customer_name varchar(45) ,
customer_address varchar(45) ,
customer_phone_number varchar(45) ,
customer_birthday date, 
customer_gender int,
account_id int,
foreign key (account_id) references accounts (account_id),
is_delete int
);

CREATE TABLE employee_positions (
position_id int primary key auto_increment,
position_name varchar(45)
);


CREATE TABLE employees (
employee_id int primary key auto_increment,
employee_name varchar(45),
employee_address varchar(45),
employee_phone_number varchar(45),
position_id int,
foreign key (position_id ) references employee_positions (position_id),
is_delete int
);

CREATE TABLE brands(
brand_id int primary key auto_increment,
brand_name varchar(45),
brand_description varchar(45)
);


CREATE TABLE watch_types(
watch_type_id int primary key auto_increment,
watch_type_name varchar(45)
);

CREATE TABLE watchs(
watch_id int primary key auto_increment,
watch_quantity int,
watch_status varchar(45),
watch_name varchar(45),
watch_price int,
brand_id int,
foreign key (brand_id) references brands (brand_id),
watch_type_id int,
foreign key (watch_type_id ) references watch_types (watch_type_id)
);

CREATE TABLE images(
image_id int primary key auto_increment,
image_name varchar(45),
watch_id int,
foreign key (watch_id) references watchs (watch_id)
);


CREATE TABLE carts (
cart_id int primary key auto_increment,
customer_id int,
foreign key (customer_id) references customers (customer_id),
watch_id int,
foreign key (watch_id) references watchs (watch_id)
);

CREATE TABLE cart_details(
detail_id int primary key auto_increment,
cart_id int,
watch_id int,
quantity int,
foreign key( cart_id) references carts (cart_id),
foreign key (watch_id) references watchs(watch_id)
);


CREATE TABLE orders (
order_id int primary key auto_increment,
date_of_order datetime,
date_of_dilivery datetime,
order_status int default 0,
cart_id int,
foreign key (cart_id) references carts (cart_id),
employee_id int,
foreign key (employee_id) references employees (employee_id),
is_delete int
);












