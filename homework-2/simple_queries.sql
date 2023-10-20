-- Напишите запросы, которые выводят следующую информацию:
-- 1. "имя контакта" и "город" (contact_name, city) из таблицы customers (только эти две колонки)
SELECT * FROM customers;
-- смотрим что у нас в таблице чтобы было понятно

SELECT contact_name, city FROM customers


-- 2. идентификатор заказа и разницу между датами формирования (order_date) заказа и его отгрузкой (shipped_date) из таблицы orders
SELECT order_id, order_date, shipped_date FROM orders;
-- смотрим что у нас в таблице чтобы было понятно

SELECT order_id, shipped_date-order_date FROM orders;

-- 3. все города без повторов, в которых зарегистрированы заказчики (customers)
SELECT city FROM customers;
-- смотрим какие у нас города в таблице, чтобы было понятно

SELECT DISTINCT city FROM customers;

-- 4. количество заказов (таблица orders)
SELECT * FROM orders;
-- как обычно сначала смотрим
SELECT COUNT(*) FROM orders

-- 5. количество стран, в которые отгружался товар (таблица orders, колонка ship_country)
SELECT COUNT(DISTINCT ship_country) FROM orders