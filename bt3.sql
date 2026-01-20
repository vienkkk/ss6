USE ShopManager;

SELECT 
    order_date AS ngay, 
    SUM(total_amount) AS tong_doanh_thu,
    COUNT(order_id) AS so_luong_don_hang
FROM orders
GROUP BY order_date
HAVING SUM(total_amount) > 10000000;