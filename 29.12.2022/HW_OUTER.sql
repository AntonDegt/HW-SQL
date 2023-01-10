
-- Практика на OUTER JOIN

-- 1 Показать название товаров и их производителей (в том числе тех производителей, у которых нет товаров)
SELECT
	Product.name "Name", 
	Producer.name "Producer"
FROM Product
	RIGHT JOIN Producer ON Producer.id = Product.id_producer
GO

-- 2 Название товаров, дата их поставки и поставщиков (в том числе тех поставщиков, которые не успели ничего поставить)
SELECT 
	Product.name "Name",
	Delivery.date_of_delivery "Date of delivery",
	Supplier.name "Supplier name"
FROM Delivery
	INNER JOIN Product ON Delivery.id_product = Product.id
	RIGHT JOIN Supplier ON Supplier.id = Delivery.id_supplier
GO

-- 3 Области в которых нет ниодного производителя
SELECT Region.name "Name" FROM Region
EXCEPT
SELECT
	Region.name "Name"
FROM Producer
	JOIN Address ON Address.id = Producer.id
	JOIN City ON City.id = Address.id_city
	JOIN Region ON Region.id = City.id_region

-- 4 Названия категорий которые не производит "Супер крупа" (ID 3)
SELECT Category.name FROM Category
EXCEPT
SELECT
	Category.name "Categoty"
FROM Producer
	JOIN Product ON Product.id_producer = Producer.id
	JOIN Category ON Category.id = Product.id_category
WHERE Producer.id = 3

-- 5 Показать производителей которые не выпускают продукты молочной (ID 1) категории
SELECT Producer.name "Name" FROM Producer
EXCEPT
SELECT
	Producer.name "Name"
FROM Producer
	JOIN Product ON Product.id_producer = Producer.id
	JOIN Category ON Category.id = Product.id_category
WHERE Category.id = 1


	
