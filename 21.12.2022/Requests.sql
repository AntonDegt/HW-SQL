
-- 7 Показать все товары стоимость меньше 50 грн. И датой поставки от 01.10.2022 до вчерашнего дня
SELECT
	Product.name "Name",
	Delivery.price "Price",
	Delivery.date_of_delivery "Date of delivery"
FROM Delivery
	JOIN Product ON Product.id = Delivery.id_product
WHERE Delivery.price < 50
	AND Delivery.date_of_delivery BETWEEN '2022-10-01' AND DATEADD(DAY, -1, GETDATE())
GO

-- 8 Показать все Напитки (ID 3), количество которых более 100
SELECT
	Product.name "Name",
	Category.name "Category",
	Product.quantity "Quantity"
FROM Product
	JOIN Category ON Category.id = Product.id_category
WHERE Product.id_category = 3
	AND Product.quantity > 100
GO

-- 9 Получить информацию о товарах от 100 до 200 грн. Отсортировать по возростанию цены
SELECT
	Product.name "Name",
	Category.name "Category",
	Product.price "Price",
	Producer.name "Producer",
	Measurment.name "Measurment"
FROM Product
	JOIN Category ON Category.id = Product.id_category
	JOIN Producer ON Producer.id = Product.id_producer
	JOIN Measurment ON Measurment.id = Product.id_measurement
WHERE Product.price BETWEEN 100 AND 200
ORDER BY "Price"
GO

-- 10 Уменьшить цены на все товары на 5%
UPDATE Product
SET Product.price = Product.price * 0.95
GO

-- 11 Поставить сегоднегнюю дату на дату поставки для всех товаров у которых данная инфомация отсутствует
UPDATE Delivery
SET Delivery.date_of_delivery = GETDATE()
WHERE Delivery.date_of_delivery IS NULL
GO

-- 12 Удалить все товары количество которых меньше 100, а цена более 70 грн.
DELETE FROM Product
WHERE Product.quantity < 100
	AND Product.price > 70
GO

-- 13 Удалить все Алкогольные напитки (ID 7) и Кондитерские изделия (ID 12)
DELETE FROM Product
WHERE Product.id_category IN (7, 12)
GO

-- 15 Удалить все товарны названия которых состоит из 5 букв
DELETE FROM Product
WHERE LEN(Product.name) = 5
GO

-- 16 Удалить все товары дата поставки которых было более 3 месяцев назад
DELETE FROM Delivery
WHERE Delivery.date_of_delivery < DATEADD(MONTH, -3, GETDATE())
GO

-- 18 Удалить товары информация о производителе которых неизвестна, или же если скидка на эти товары более 10% (Markup ID 7)
DELETE FROM Product
WHERE Product.id_producer IS NULL
	OR Product.id_markup = 7
GO