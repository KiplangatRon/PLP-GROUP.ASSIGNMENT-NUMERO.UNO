# Bookstore Database Management System

## Overview
This project involves designing and implementing a MySQL database for a bookstore to manage books, authors, customers, orders, and shipping operations. The goal is to create an efficient and secure relational database that supports data storage, retrieval, and analysis for real-world bookstore operations.

---

## Tools & Technologies
- MySQL: Database creation, management, and query execution.
- Draw.io: Visualizing the database schema and relationships.

---

## Prerequisites
- Basic understanding of MySQL syntax and commands.
- Experience creating tables with appropriate data types.
- Knowledge of user management and security practices in MySQL.

---

## Project Objective

## Project Objectives
- Design a relational database schema for a BookStore.
- Create tables to store data about:
  - Books (title, ISBN, price, stock/quantity)
  - Authors (name)
  - Customers (contact info, order history)
  - Orders (status, timestamps)
  - Shipping (tracking, delivery dates)
  - Order details (quantities, prices)

Build a relational database with the following core tables:
| Category         | Tables                                                                         |
|------------------|--------------------------------------------------------------------------------|
| Books            | `book`, `book_author`, `author`, `book_language`, `publisher`                  |
| Customers        | `customer`, `customer_address`, `address_status`, `address`, `country`         |
| Orders           | `cust_order`, `order_line`, `shipping_method`, `order_history`, `order_status` |


  - Implement user roles and permissions for secure access.
  - Test the database with analytical queries.

---
ERD link: https://drive.google.com/file/d/1AxMMZ81ODtDKFL6BvDQk641cLS9qSd4q/view?usp=sharing

