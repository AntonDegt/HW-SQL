
-- ПРАКТИКА на функции агрегирования, GROUP BY и HAVING


-- 1 Вывести названия товаров, и минимальные цены их продажи 
-- (один и тот же товар должен продавать более одного раза)
SELECT 
	(SELECT name FROM Product WHERE Sale.id_product = id) as name,
	MIN(price) as min_price 
FROM Sale
GROUP BY id_product

-- 2 Показать товары, средняя цена продажи которых была более 50 грн.
SELECT
	(SELECT name FROM Product WHERE Sale.id_product = id) as name,
	AVG(price) as avg_price
FROM Sale
GROUP BY id_product
HAVING AVG(price) > 50
GO

-- 3 Вывести количество товаров каждой категори, средняя цена поставки которых была больше 100 грн
SELECT 
	(SELECT name FROM Category WHERE id = temp_table.id_category) AS category,
	COUNT(*) as products_count,
	AVG(price) as avg_price
FROM
	(SELECT 
		(SELECT id_category FROM Product WHERE id = Delivery.id_product) AS id_category,
		price
	FROM Delivery) temp_table
GROUP BY id_category
HAVING AVG(price) > 100
GO

-- 4 Показать категории "Молочные" и "Хлебо-булочные", принадлежащие им товары, и общую сумму их продажи
SELECT
	(SELECT name FROM Category WHERE id = Product.id_category) AS category,
	STRING_AGG(name,', ') AS products,
	SUM(price*quantity) AS all_price
FROM Product
GROUP BY id_category
HAVING id_category IN 
	(SELECT id FROM Category WHERE name LIKE 'Молочные' OR name LIKE 'Хлебо-булочные')
GO

-- 5 Показать информацию о наименьшей стоимости поставки товаров за последний месяц для каждого поставщика.
-- Отсортировать стоимость по возрастанию
SELECT
	(SELECT name FROM Supplier WHERE id = Delivery.id_supplier) AS name,
	MIN(price) AS min_price
FROM Delivery 
WHERE date_of_delivery BETWEEN DATEADD(MONTH, -3, GETDATE()) AND  GETDATE()
GROUP BY id_supplier
ORDER BY min_price
GO

-- 6 Показать информацию о производителе, его полном адресе, и количестве товаров, которые он выпускает.
-- Общая стоимость продаж товаров каждого производителя при этом должна быть от 10 000 до 40 000 грн.
SELECT * FROM
	(SELECT 
		name,
		(SELECT CONCAT(
			(SELECT CONCAT( 
				(SELECT CONCAT(
					(SELECT name FROM Country WHERE id = Region.id_country), ' ,', name)
				FROM Region WHERE id = City.id_region), ' ,', name)
			FROM City WHERE id = Address.id_city), ' ,', street)
		FROM Address WHERE id = Producer.id_address) AS full_address,
		(SELECT COUNT(*) FROM Product GROUP BY id_producer HAVING id_producer = Producer.id) AS count_product,
		(SELECT SUM(price * quantity) FROM Product GROUP BY id_producer HAVING id_producer = Producer.id) AS all_price
	FROM Producer) temp_table
WHERE all_price BETWEEN 10000 AND 40000
GO

-- 7 Показать категорию, товаров которой в магазине меньше всего
SELECT TOP(1)
	*
FROM
	(SELECT 
		(SELECT name FROM Category WHERE id = Product.id_category) AS category,
		COUNT(*) AS product_count
	FROM Product
	GROUP BY id_category) temp_table
ORDER BY product_count
GO

-- 8 Показать количество товаров каждой катогории, при этом учитываеться только те товары, 
-- стоимость поставки которых превышала 100 грн. 
-- Выведеная информация касаться только поставщиков - "Супер закупка", "Снабд торг", "Хлебная поставка"
SELECT 
	(SELECT name FROM Category WHERE id = Product.id_category) AS category,
	COUNT(*) AS count_product
FROM Product 
WHERE 100 < 
	(SELECT TOP(1) price FROM Delivery 
	WHERE id_product = Product.id AND id_supplier IN (SELECT id FROM Supplier WHERE
	name LIKE 'Супер закупка' OR name LIKE 'Снабд торг' OR name LIKE 'Хлебная поставка')
	ORDER BY price DESC)
GROUP BY id_category
GO