-- SQL-команды для создания таблиц
CREATE TABLE customers
(
	customer_id char(5),
	company_name varchar(50),
	contact_name varchar(50)
);

SELECT * FROM customers;

CREATE TABLE employees
(
	employee_id int,
	first_name varchar(30),
	last_name varchar(30),
	title varchar(30),
	birth_date date,
	notes text

);

SELECT * FROM employees;

CREATE TABLE orders
(
	order_id int,
	customer_id char(5),
	employee_id int,
	order_date date,
	ship_city text
)

SELECT * FROM orders;