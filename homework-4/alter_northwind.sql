-- Подключиться к БД Northwind и сделать следующие изменения:
-- 1. Добавить ограничение на поле unit_price таблицы products (цена должна быть больше 0)
ALTER TABLE products ADD CONSTRAINT pk_unit_price CHECK (unit_price > 0);


-- 2. Добавить ограничение, что поле discontinued таблицы products может содержать только значения 0 или 1
ALTER TABLE products ADD CONSTRAINT chk_products_discontinued CHECK (discontinued IN (0, 1));

-- 3. Создать новую таблицу, содержащую все продукты, снятые с продажи (discontinued = 1)
CREATE TABLE discontinued_products
(
    product_id integer,
    product_name varchar(40),
    quantity_per_unit varchar(20),

    CONSTRAINT pk_disc_prod_id PRIMARY KEY (product_id),

    CONSTRAINT fk_disc_product_id
		FOREIGN KEY (product_id)
    	REFERENCES products(product_id)
);

--таблица создана, теперь её наполняем её данными из таблицы products
INSERT INTO discontinued_products (product_id, product_name, quantity_per_unit)
SELECT product_id, product_name, quantity_per_unit FROM products WHERE discontinued = 1;

--смотрим, если получилось
SELECT * FROM discontinued_products;

-- 4. Удалить из products товары, снятые с продажи (discontinued = 1)
-- Для 4-го пункта может потребоваться удаление ограничения, связанного с foreign_key. Подумайте, как это можно решить, чтобы связь с таблицей order_details все же осталась.

ALTER TABLE order_details ALTER CONSTRAINT fk_order_details_products;
ALTER TABLE order_details DROP CONSTRAINT fk_order_details_products;
DELETE FROM products WHERE discontinued = 1;