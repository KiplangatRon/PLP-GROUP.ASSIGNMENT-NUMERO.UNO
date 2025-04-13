CREATE DATABASE bookstore;
USE bookstore;

-- Country Table
CREATE TABLE country (
    country_id INT AUTO_INCREMENT PRIMARY KEY,
    country_name VARCHAR(100) NOT NULL
);

-- Address Status
CREATE TABLE address_status (
    status_id INT AUTO_INCREMENT PRIMARY KEY,
    status_name VARCHAR(50) NOT NULL
);

-- Address
CREATE TABLE address (
    address_id INT AUTO_INCREMENT PRIMARY KEY,
    street_name VARCHAR(200),
    city VARCHAR(100),
    postal_code VARCHAR(10),
    country_id INT NOT NULL,
    FOREIGN KEY (country_id) REFERENCES country(country_id)
);

-- Customer
CREATE TABLE customer (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    phone VARCHAR(20)
);-- AUTO_INCREMENT = 101;

-- Customer Address
CREATE TABLE customer_address (
    customer_id INT,
    address_id INT,
    status_id INT NOT NULL,
    PRIMARY KEY (customer_id, address_id),
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
    FOREIGN KEY (address_id) REFERENCES address(address_id),
    FOREIGN KEY (status_id) REFERENCES address_status(status_id)
);

-- Publisher
CREATE TABLE publisher (
    publisher_id INT AUTO_INCREMENT PRIMARY KEY,
    publisher_name VARCHAR(255) NOT NULL
);

-- Book Language
CREATE TABLE book_language (
    language_id INT AUTO_INCREMENT PRIMARY KEY,
    language_name VARCHAR(100) NOT NULL
);

-- Author
CREATE TABLE author (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL
);

-- Book
CREATE TABLE book (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    isbn VARCHAR(17) UNIQUE,
    publication_year INT,
    language_id INT NOT NULL,
    publisher_id INT NOT NULL,
    genre VARCHAR(50) NOT NULL,
    currency CHAR(3) NOT NULL DEFAULT 'Ksh',
    price DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (language_id) REFERENCES book_language(language_id),
    FOREIGN KEY (publisher_id) REFERENCES publisher(publisher_id)
);

-- Book Author (M-M Relationship)
CREATE TABLE book_author (
    book_id INT,
    author_id INT,
    PRIMARY KEY (book_id, author_id),
    FOREIGN KEY (book_id) REFERENCES book(book_id),
    FOREIGN KEY (author_id) REFERENCES author(author_id)
);

-- Order Status
CREATE TABLE order_status (
    status_id INT AUTO_INCREMENT PRIMARY KEY,
    status_value VARCHAR(50) NOT NULL
);

-- Shipping Method
CREATE TABLE shipping_method (
    method_id INT AUTO_INCREMENT PRIMARY KEY,
    method_name VARCHAR(100) NOT NULL,
    currency CHAR(3) NOT NULL DEFAULT 'Ksh',
    cost DECIMAL(6,2) NOT NULL,
    INDEX idx_method_name (method_name)
);

-- Customer Order
CREATE TABLE cust_order (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    order_date DATETIME NOT NULL,
    shipping_method_id INT NOT NULL,
    status_id INT,
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
    FOREIGN KEY (shipping_method_id) REFERENCES shipping_method(method_id),
    FOREIGN KEY (status_id) REFERENCES order_status(status_id)
);

-- Order Line
CREATE TABLE order_line (
    order_line_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    book_id INT NOT NULL,
    quantity INT NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES cust_order(order_id),
    FOREIGN KEY (book_id) REFERENCES book(book_id)
);

-- Order History
CREATE TABLE order_history (
    history_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    status_id INT NOT NULL,
    status_date DATETIME NOT NULL,
    FOREIGN KEY (order_id) REFERENCES cust_order(order_id),
    FOREIGN KEY (status_id) REFERENCES order_status(status_id)
);

-- Sample Data
--  USE bookstore;
START TRANSACTION;

-- 1. Country Data
INSERT INTO country (country_name) VALUES
('Kenya'),
('United States'),
('United Kingdom'),
('France');

-- 2. Address Status
INSERT INTO address_status (status_name) VALUES
('current'),
('old');

-- 3. Addresses
INSERT INTO address (street_name, city, postal_code, country_id) VALUES
('Lavington', 'Nairobi', '00100', 1),
( 'Tudor', 'Mombasa', '20200', 1),
( 'Westlands', 'Nairobi', '00800', 1),
('Moyne Drive', 'Mombasa', '80100', 1);

-- 4. Customers
INSERT INTO customer (first_name, last_name, email, phone) VALUES
('Hazel', 'Ashley', 'hazelashley03@mail.com', '+254 759 789 630'),
('Kibor', 'Ron', 'kibor259@gmail.com', '+254 799 561 598'),
('Kimi', 'Anton', 'kimianto@gmail.com', '+254 66 334 488'),
('Andrew', 'Baraka', 'barakaandrew901@gmail.com', '+254 717 016 894');

-- 5. Customer Addresses
INSERT INTO customer_address (customer_id, address_id, status_id) VALUES
(1, 1, 1),  -- Hazel's's current address
(1, 2, 2),  -- Ron's old address
(2, 3, 1);  -- Andrew's current address

-- 6. Publishers
INSERT INTO publisher (publisher_name) VALUES
('Pocket Books'),
('Random House Publishing'),
('Grasset and Gallimard'),
('East African Educational');

-- 7. Book Languages
INSERT INTO book_language (language_name) VALUES
('English'),
('French'),
('German'),
('Gikuyu');

-- 8. Authors
INSERT INTO author (first_name, last_name) VALUES
('Sandra', 'Brown'),
('Jordan', 'Peterson'),
('Marcel', 'Proust'),
('Ngugi', 'Wa Thiongo');

-- 9. Books
INSERT INTO book (title, isbn, publication_year, language_id, publisher_id, genre, price) VALUES
('Chill Factor', '978-0743466776', 1997, 1, 1, 'Romantic Suspense', 1750.00),
('12 Rules For Life', '978-0345816023', 2018, 1, 2, 'Self-help', 2200.00),
('In Search of Lost Time', '978-9360075590', 1913, 2, 3, 'Fiction', 4900.00),
('Kenda Muiyuru: Rugano Rwa Gikuyu na Mumbi', '978-9966563828', 2018, 4, 4, 'Poetry', 1900.00);

-- 10. Book Authors
INSERT INTO book_author (book_id, author_id) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4);

-- 11. Order Statuses
INSERT INTO order_status (status_value) VALUES
('Delivered'),
('Processing'),
('Pending'),
('Shipped'),
('Cancelled');

-- 12. Shipping Methods
INSERT INTO shipping_method (method_name, cost) VALUES
('Local Shipping', 500.00),
('Regional Shipping', 1200.00),
('International', 2300.00);

-- 13. Customer Orders
INSERT INTO cust_order (customer_id, order_date, shipping_method_id, status_id) VALUES
(1, NOW(), 1, 1),
(2, NOW(), 3, 4);

-- 14. Order Lines
INSERT INTO order_line (order_id, book_id, quantity, price) VALUES
(1, 1, 2, 1750.00), 
(1, 2, 5, 2200.00),
(2, 3, 3, 4900.00);  

-- 15. Order History
INSERT INTO order_history (order_id, status_id, status_date) VALUES
(1, 1, '2025-01-10 09:01:25'),
(1, 3, '2025-03-17 14:33:11'),
(2, 1, '2024-09-30 11:40:21'),
(2, 2, '2024-04-13 15:33:25');

COMMIT;
