USE ShopManager;

CREATE TABLE products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(255) NOT NULL,
    price DECIMAL(10,2) NOT NULL
);


CREATE TABLE order_items (
    order_id INT,
    product_id INT,
    quantity INT NOT NULL,
    PRIMARY KEY (order_id, product_id),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

INSERT INTO products (product_name, price) VALUES 
('Laptop Dell XPS', 25000000.00),
('iPhone 15 Pro', 28000000.00),
('Chuột không dây', 500000.00),
('Bàn phím cơ', 1500000.00),
('Tai nghe Sony', 4500000.00);
INSERT INTO order_items (order_id, product_id, quantity) VALUES 
(1, 1, 1), -- Đơn 1 mua 1 Laptop
(1, 3, 2), -- Đơn 1 mua 2 Chuột
(2, 2, 1), -- Đơn 2 mua 1 iPhone
(2, 4, 1), -- Đơn 2 mua 1 Bàn phím
(3, 5, 2); -- Đơn 3 mua 2 Tai nghe


SELECT 
    p.product_id,
    p.product_name, 
    SUM(oi.quantity) AS so_luong_da_ban, 
    SUM(oi.quantity * p.price) AS doanh_thu
FROM products p
JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY p.product_id, p.product_name
HAVING doanh_thu > 5000000;