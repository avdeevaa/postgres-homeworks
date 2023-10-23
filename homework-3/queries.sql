-- Напишите запросы, которые выводят следующую информацию:
-- 1. Название компании заказчика (company_name из табл. customers) и ФИО сотрудника, работающего над заказом этой компании (см таблицу employees),
-- когда и заказчик и сотрудник зарегистрированы в городе London, а доставку заказа ведет компания United Package (company_name в табл shippers)

SELECT DISTINCT customers.company_name AS customer, CONCAT(employees.first_name, ' ', employees.last_name) AS employee FROM customers
INNER JOIN employees ON customers.city = 'London' AND employees.city = 'London'
INNER JOIN orders ON customers.customer_id = orders.customer_id
INNER JOIN shippers ON orders.ship_via = shippers.shipper_id
WHERE shippers.company_name = 'United Package';


-- 2. Наименование продукта, количество товара (product_name и units_in_stock в табл products),
-- имя поставщика и его телефон (contact_name и phone в табл suppliers) для таких продуктов,
-- которые не сняты с продажи (поле discontinued) и которых меньше 25 и которые в категориях Dairy Products и Condiments.
-- Отсортировать результат по возрастанию количества оставшегося товара.
SELECT products.product_name, products.units_in_stock, suppliers.contact_name, suppliers.phone FROM products
INNER JOIN suppliers ON suppliers.supplier_id = products.supplier_id
INNER JOIN categories ON products.category_id = categories.category_id
WHERE products.discontinued=0
AND products.units_in_stock < 25
AND (categories.category_id = 4 or categories.category_id = 2)
ORDER BY products.units_in_stock ASC

-- 3. Список компаний заказчиков (company_name из табл customers), не сделавших ни одного заказа
SELECT customers.company_name FROM customers
WHERE NOT EXISTS (SELECT customer_id FROM orders WHERE orders.customer_id=customers.customer_id)

-- 4. уникальные названия продуктов, которых заказано ровно 10 единиц (количество заказанных единиц см в колонке quantity табл order_details)
-- Этот запрос написать именно с использованием подзапроса.
SELECT products.product_name from products
WHERE products.product_id IN (SELECT order_details.product_id FROM order_details
							  WHERE order_details.quantity = 10
							  GROUP BY order_details.product_id
							 )