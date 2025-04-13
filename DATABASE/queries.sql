-- Retrieval and Analysis Queries

-- View all books with their authors:
SELECT b.title, a.first_name, a.last_name, p.publisher_name 
FROM book b
JOIN book_author ba ON b.book_id = ba.book_id
JOIN author a ON ba.author_id = a.author_id
JOIN publisher p ON b.publisher_id = p.publisher_id;

-- Check customer orders with details:
SELECT c.first_name, c.last_name, o.order_date, sm.method_name, ol.quantity, b.title
FROM cust_order o
JOIN customer c ON o.customer_id = c.customer_id
JOIN shipping_method sm ON o.shipping_method_id = sm.method_id
JOIN order_line ol ON o.order_id = ol.order_id
JOIN book b ON ol.book_id = b.book_id;

-- View order status history:
SELECT o.order_id, c.first_name, c.last_name, os.status_value, oh.status_date
FROM order_history oh
JOIN cust_order o ON oh.order_id = o.order_id
JOIN customer c ON o.customer_id = c.customer_id
JOIN order_status os ON oh.status_id = os.status_id
ORDER BY oh.status_date DESC;

