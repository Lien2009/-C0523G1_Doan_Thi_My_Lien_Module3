CREATE DATABASE quan_ly_ban_hang_ss3;
USE quan_ly_ban_hang_ss3;
CREATE TABLE customer (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_name VARCHAR(25),
    customer_age TINYINT
);
CREATE TABLE `order` (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    FOREIGN KEY (customer_id)
        REFERENCES customer (customer_id),
    order_date DATETIME,
    order_total_price INT
);
CREATE TABLE product (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(25),
    product_price INT
);
CREATE TABLE order_detail (
    order_id INT,
    product_id INT,
    PRIMARY KEY (order_id , product_id),
    FOREIGN KEY (order_id)
        REFERENCES `order` (order_id),
    FOREIGN KEY (product_id)
        REFERENCES product (product_id),
    order_quantity INT
);
INSERT INTO customer (customer_name, customer_age)
VALUES
  ('Minh Quan', 10),
  ('Ngoc Oanh', 20),
  ('Hong Ha', 50);
INSERT INTO `order` (customer_id, order_date)
VALUES
  (1, '2006-03-21'),
  (2, '2006-03-23'),
  (1, '2006-03-16');
INSERT INTO product (product_name, product_price)
VALUES
  ('May Giat', 3),
  ('Tu Lanh', 5),
  ('Dieu Hoa', 7),
  ('Quat', 1),
  ('Bep Dien', 2);
INSERT INTO order_detail (order_id, product_id, order_quantity)
VALUES
  (1, 1, 3),
  (1, 3, 7),
  (1, 4, 2),
  (2, 1, 1),
  (3, 1, 8),
  (2, 5, 4),
  (2, 3, 3);
-- Hiển thị các thông tin  gồm oID, oDate, oPrice của tất cả các hóa đơn trong bảng Order
SELECT order_id, order_date, order_total_price
FROM `order`;
-- Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách
SELECT customer.customer_id, customer.customer_name, product.product_name
FROM customer
JOIN `order` ON customer.customer_id = `order`.customer_id
JOIN order_detail ON `order`.order_id = order_detail.order_id
JOIN product ON order_detail.product_id = product.product_id;
-- Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào
SELECT customer.customer_name
FROM customer
LEFT JOIN `order` ON customer.customer_id = `order`.customer_id
WHERE `order`.customer_id IS NULL;
-- Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn 
SELECT `order`.order_id, `order`.order_date, SUM(order_detail.order_quantity*product.product_price) AS total_price
FROM `order`
JOIN order_detail ON `order`.order_id = order_detail.order_id
JOIN product ON order_detail.product_id = product.product_id
GROUP BY `order`.order_id;