CREATE DATABASE ecommerce_db;
USE ecommerce_db;

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    full_name VARCHAR(255) NOT NULL,
    city VARCHAR(255)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    status ENUM('pending', 'completed', 'cancelled'),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

INSERT INTO customers (customer_id, full_name, city) VALUES
(1, 'Nguyen Van A', 'Hà Nội'),
(2, 'Tran Thi B', 'Hồ Chí Minh'),
(3, 'Le Van C', 'Đà Nẵng'),
(4, 'Pham Thi D', 'Hải Phòng'),
(5, 'Hoang Van E', 'Cần Thơ');

INSERT INTO orders (order_id, customer_id, order_date, status) VALUES
(101, 1, '2026-01-05', 'completed'),
(102, 2, '2026-01-06', 'pending'),
(103, 3, '2026-01-07', 'completed'),
(104, 1, '2026-01-08', 'cancelled'),
(105, 4, '2026-01-09', 'completed');

SELECT o.order_id, o.order_date, o.status, c.full_name
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id;

SELECT c.full_name, COUNT(o.order_id) AS total_orders
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.full_name;

SELECT c.full_name, COUNT(o.order_id) AS total_orders
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.full_name
HAVING COUNT(o.order_id) >= 1;

