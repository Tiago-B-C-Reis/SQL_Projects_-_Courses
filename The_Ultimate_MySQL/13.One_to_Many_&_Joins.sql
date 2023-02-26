# SECTION 13: One_to_Many_&_Joins

CREATE DATABASE shop;

USE shop;

DROP TABLE customers;
DROP TABLE orders;

CREATE TABLE customers (
	id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(50)
);

create table orders (
	id INT PRIMARY KEY AUTO_INCREMENT,
    order_date DATE,
    amount DECIMAL(8,2),
    customer_id INT,
    FOREIGN KEY (customer_id) REFERENCES customers (id)
);

SHOW TABLES;

INSERT INTO customers (first_name, last_name, email) 
VALUES ('Boy', 'George', 'george@gmail.com'),
       ('George', 'Michael', 'gm@gmail.com'),
       ('David', 'Bowie', 'david@gmail.com'),
       ('Blue', 'Steele', 'blue@gmail.com'),
       ('Bette', 'Davis', 'bette@aol.com');

SELECT * FROM customers;

INSERT INTO orders (order_date, amount, customer_id)
VALUES ('2016-02-10', 99.99, 1),
       ('2017-11-11', 35.50, 1),
       ('2014-12-12', 800.67, 2),
       ('2015-01-03', 12.50, 2),
       ('1999-04-11', 450.25, 5);

SELECT * FROM orders;

# this one doesn't work because the is no customer_id nº 54 on that customer
INSERT INTO orders (order_date, amount, customer_id) VALUES ('2022-11-11', 54);

SELECT id FROM customers WHERE last_name = 'George';
SELECT * FROM orders WHERE customer_id = 1;

SELECT * FROM orders WHERE customer_id = (SELECT id FROM customers WHERE last_name = 'George');

# this is thecnicaly a tables join, but is useless
SELECT * FROM customers, orders;
 
 # Inner Join:
 SELECT * FROM customers
 JOIN orders ON orders.customer_id = customers.id;
 
 # same information but in diferent order:
 SELECT * FROM orders
 JOIN customers ON orders.customer_id = customers.id;
 
 SELECT first_name, last_name, amount FROM customers
 JOIN orders ON orders.customer_id = customers.id;
 
 --
SELECT first_name, last_name, SUM(amount) AS total FROM customers
JOIN orders ON orders.customer_id = customers.id
GROUP BY first_name, last_name
ORDER BY total;

# In this case orders is the "customers" and the "left side" is the right side
SELECT first_name, last_name, order_date, amount FROM customers
LEFT JOIN orders ON orders.customer_id = customers.id;

# In this case orders is the "left side" and the "customers is the right side"
SELECT 
   order_date, amount, first_name, last_name
FROM
    orders
        LEFT JOIN
    customers ON orders.customer_id = customers.id;

# If Null function:
SELECT first_name, last_name, IFNULL(SUM(amount), 0) FROM customers
LEFT JOIN orders ON customers.id = orders.customer_id
GROUP BY first_name, last_name;

# RIGHT join:
INSERT INTO orders (amount, order_date) VALUES (100, CURDATE());

SELECT first_name, last_name, order_date, amount FROM customers
RIGHT JOIN orders ON customers.id = orders.customer_id;

# on delete cascade, alows to delete the order or customer from the tables. Whitout this is not possible becase the table are conected.
create table orders (
	id INT PRIMARY KEY AUTO_INCREMENT,
    order_date DATE,
    amount DECIMAL(8,2),
    customer_id INT,
    FOREIGN KEY (customer_id) REFERENCES customers (id) ON DELETE CASCADE
);

DELETE FROM customers WHERE last_name = 'George';
SELECT * FROM customers;
SELECT * FROM orders;

# Exercises S13.238:
CREATE TABLE students (
	id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50)
);

CREATE TABLE papers (
	id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(100),
    grade DECIMAL(5,2),
    student_id INT,
    FOREIGN KEY (student_id) REFERENCES students (id)
);

INSERT INTO students (first_name) VALUES 
('Caleb'), ('Samantha'), ('Raj'), ('Carlos'), ('Lisa');

INSERT INTO papers (student_id, title, grade ) VALUES
(1, 'My First Book Report', 60),
(1, 'My Second Book Report', 75),
(2, 'Russian Lit Through The Ages', 94),
(2, 'De Montaigne and The Art of The Essay', 98),
(4, 'Borges and Magical Realism', 89);

SELECT first_name, title, grade FROM students
JOIN papers ON papers.student_id = students.id
ORDER BY grade DESC;

SELECT first_name, title, grade FROM students
LEFT JOIN papers ON papers.student_id = students.id;

SELECT first_name, IFNULL(title, 'MISSING'), IFNULL(grade, 0) AS average FROM students
LEFT JOIN papers ON papers.student_id = students.id;

SELECT first_name, IFNULL(AVG(grade), 0) AS average FROM students
LEFT JOIN papers ON papers.student_id = students.id
GROUP BY first_name ORDER BY average DESC;

SELECT 
  first_name, 
  IFNULL(AVG(grade), 0) AS average, 
  CASE 
    WHEN IFNULL(AVG(grade), 0) >= 70 THEN 'PASSING' 
    ELSE 'FAILING' 
    END AS passing_status 
FROM 
  students 
  LEFT JOIN papers ON papers.student_id = students.id 
GROUP BY 
  first_name 
ORDER BY 
  average DESC;