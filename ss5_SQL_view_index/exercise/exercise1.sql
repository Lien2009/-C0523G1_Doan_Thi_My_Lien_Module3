CREATE DATABASE demo_ss5;
USE demo_ss5;
CREATE TABLE products(
id int primary key auto_increment,
product_code varchar(20),
product_name varchar(50),
product_price int,
product_amount int,
product_description varchar(100),
product_status varchar(50)
);
INSERT INTO products(product_code, product_name, product_price, product_amount, product_description, product_status)
VALUES 
("s1", "samsung", 10, 100, "đang có khuyến mãi", "còn hàng"),
("i1", "iphone", 25, 100, "đang có khuyến mãi", "còn hàng"),
("i2", "iphoneS", 20, 100, "hết khuyến mãi", "hết hàng");
CREATE UNIQUE INDEX index_code ON products(product_code);
EXPLAIN SELECT * FROM products
WHERE product_code = "i2";
CREATE UNIQUE INDEX index_name_price ON products(product_name,product_price);
EXPLAIN SELECT * FROM products
WHERE product_name = "iphone" and product_price = 25;
CREATE VIEW view_products AS
SELECT product_code, product_name, product_price, product_status
FROM products;
CREATE OR REPLACE VIEW view_products AS
SELECT product_code, product_name
FROM products;
DROP VIEW view_products;
delimiter //
create procedure getAllProducts()
begin
select *
from products;
end //
delimiter ;

delimiter //
create procedure addProduct(new_code varchar(20),
new_name varchar(50),
new_price int,
new_amount int,
new_description varchar(100),
new_status varchar(50))
begin
insert into products(product_code, product_name, product_price, product_amount, product_description, product_status)
values (new_code, new_name, new_price, new_amount, new_description, new_status);
end //
delimiter ;
call addProduct("s2", "samsungS", 20, 100, "nhiều tồn kho", "còn hàng");

delimiter //
create procedure editProduct(choose_id int, 
new_code varchar(20),
new_name varchar(50),
new_price int,
new_amount int,
new_description varchar(100),
new_status varchar(50))
begin
UPDATE products
SET product_code = new_code,
product_name = new_name,
product_price = new_price,
product_amount = new_amount,
product_description = new_description,
product_status = new_status
WHERE id = choose_id;
end //
delimiter ;
call editProduct(6,'s3',"samsungS", 20, 100, "nhiều tồn kho", "còn hàng");

delimiter //
create procedure deleteProduct(choose_id int)
begin
delete from products where id = choose_id;
end //
delimiter ;
call deleteProduct(6);