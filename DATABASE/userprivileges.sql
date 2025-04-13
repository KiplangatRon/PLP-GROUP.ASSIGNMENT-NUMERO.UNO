USE bookstore;
-- ADMIN PRIVILEGES
GRANT ALL PRIVILEGES ON bookstore.* TO 'admin';
-- GRANT PERMISSIONS TO USERS(staff)
GRANT SELECT, INSERT, UPDATE ON bookstore.customer TO 'staff';
GRANT SELECT, INSERT, UPDATE ON bookstore.customer_address  TO 'staff';
GRANT SELECT, INSERT, UPDATE ON bookstore.cust_order TO 'staff';
GRANT SELECT, INSERT, UPDATE ON bookstore.order_line TO 'staff';
GRANT SELECT, INSERT, UPDATE ON bookstore.order_history TO 'staff';
GRANT SELECT, INSERT, UPDATE ON bookstore.shipping_method TO 'staff';
GRANT SELECT, INSERT, UPDATE ON bookstore.order_status TO 'staff';
GRANT SELECT, INSERT, UPDATE ON bookstore.author TO 'staff';
GRANT SELECT, INSERT, UPDATE ON bookstore.book_author TO 'staff';
GRANT SELECT, INSERT, UPDATE ON bookstore.publisher TO 'staff';
GRANT SELECT, INSERT, UPDATE ON bookstore.book_language TO 'staff';
GRANT SELECT, INSERT, UPDATE ON bookstore.address TO 'staff';
GRANT SELECT, INSERT, UPDATE ON bookstore.country TO 'staff';
GRANT SELECT, INSERT, UPDATE ON bookstore.address_status TO 'staff';
-- GRANT PERMISSIONS TO USERS(customer_support)
GRANT SELECT, INSERT, UPDATE ON bookstore.customer TO 'customer_support';
GRANT SELECT, INSERT, UPDATE ON bookstore.customer_address TO 'customer_support';
GRANT SELECT, INSERT, UPDATE ON bookstore.address TO 'customer_support';
GRANT SELECT, INSERT, UPDATE ON bookstore.cust_order TO 'customer_support';
GRANT SELECT, INSERT ON bookstore.order_history TO 'customer_support';
GRANT SELECT ON bookstore.order_status TO 'customer_support';
GRANT SELECT ON bookstore.shipping_method TO 'customer_support';
GRANT SELECT ON bookstore.country TO 'customer_support';
GRANT SELECT ON bookstore.address_status TO 'customer_support';
GRANT SELECT ON bookstore6.order_line TO 'customer_support';

