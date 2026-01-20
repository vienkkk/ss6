CREATE DATABASE ShopManager;
USE ShopManager;

CREATE TABLE customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_name VARCHAR(100) NOT NULL,
    email VARCHAR(100)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

INSERT INTO customers (customer_name, email) VALUES 
('Nguyễn Văn A', 'vana@gmail.com'),
('Trần Thị B', 'thib@gmail.com');

INSERT INTO orders (customer_id, order_date, total_amount) VALUES 
(1, '2023-10-01', 150.00),
(1, '2023-10-05', 300.50),
(2, '2023-10-02', 200.00),
(2, '2023-10-06', 750.00);


UPDATE orders 
SET total_amount = 250.00 
WHERE order_id = 1;

UPDATE orders 
SET total_amount = 420.50 
WHERE order_id = 2;

UPDATE orders 
SET total_amount = 150.00 
WHERE order_id = 3;

SELECT customer_id, SUM(total_amount) AS tong_chi_tieu
FROM orders
GROUP BY customer_id;

SELECT customer_id, MAX(total_amount) AS don_hang_cao_nhat
FROM orders
GROUP BY customer_id;

SELECT customer_id, SUM(total_amount) AS tong_chi_tieu
FROM orders
GROUP BY customer_id
ORDER BY tong_chi_tieu DESC;