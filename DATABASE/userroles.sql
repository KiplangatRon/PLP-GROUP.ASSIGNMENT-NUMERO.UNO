USE bookstore;
-- USER AND USER ROLES
-- Create Roles
CREATE ROLE 'admin','staff','customer_support';
-- Create Users & Assign Roles
CREATE USER 'Ron'@'localhost' IDENTIFIED BY 'admin123';
GRANT 'admin' TO 'Ron'@'localhost';

CREATE USER 'Andrew'@'localhost' IDENTIFIED BY 'staff123';
GRANT 'staff' TO 'Andrew'@'localhost';

CREATE USER 'Hazel'@'localhost' IDENTIFIED BY 'cus123';
GRANT 'customer_support' TO 'Hazel'@'localhost';
