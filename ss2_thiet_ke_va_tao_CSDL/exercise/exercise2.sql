CREATE DATABASE quan_ly_ban_hang;
USE quan_ly_ban_hang;
CREATE TABLE customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_name VARCHAR(30),
    customer_age INT
);
CREATE TABLE orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    FOREIGN KEY (customer_id)
        REFERENCES customer (customer_id),
    order_date DATETIME,
    order_total_price DOUBLE
);
CREATE TABLE products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(30),
    product_price DOUBLE
);
CREATE TABLE order_details (
    order_id INT,
    product_id INT,
    PRIMARY KEY (order_id , product_id),
    FOREIGN KEY (order_id)
        REFERENCES `order` (order_id),
    FOREIGN KEY (product_id)
        REFERENCES product (product_id),
    order_quantity INT
);
