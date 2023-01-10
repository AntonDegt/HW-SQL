
-- Практика на INNER JOIN

-- 1 Показать название и категории товаров поставщиками которого являються "Закуп универсал" (ID 3) и "Супер закупка" (ID 5)
SELECT p.name "Name", c.name "Category", s.name "Supplier"
	FROM Delivery d
	INNER JOIN Product p ON d.id_product = p.id
	INNER JOIN Supplier s ON d.id_supplier = s.id
	INNER JOIN Category c ON p.id_category = c.id
WHERE s.id IN (3, 5)
GO

-- 2 Все товары имя поставщика которых не содержит (ДТ), и категория которых не "Рыбеые"(ID 5)
SELECT p.name "Name", c.name "Category", s.name "Supplier"
	FROM Delivery d
	INNER JOIN Product p ON d.id_product = p.id
	INNER JOIN Supplier s ON d.id_supplier = s.id
	INNER JOIN Category c ON p.id_category = c.id
WHERE s.name NOT LIKE '%Д%' AND s.name NOT LIKE '%Т%'
AND c.id != 5
GO

-- 3 Товары, категории и страна производителя не Польща и не Франция, цена поставки менее 500 грн., а дата поставки от 10.10.2022 и по сей день
SELECT p.name "Name", c.name "Category", Country.name "Producer Country" , s.name "Supplier", d.price "Price", d.date_of_delivery "Date of delivery"
	FROM Delivery d
	INNER JOIN Product p ON d.id_product = p.id
	INNER JOIN Supplier s ON d.id_supplier = s.id
	INNER JOIN Category c ON p.id_category = c.id
	INNER JOIN Producer ON p.id_producer = Producer.id
	INNER JOIN Address ON Producer.id_address = Address.id
	INNER JOIN City ON Address.id_city = City.id
	INNER JOIN Region ON City.id_region = Region.id
	INNER JOIN Country ON Region.id_country = Country.id
WHERE Region.id_country NOT IN (2, 3)
AND d.price < 500 
AND d.date_of_delivery BETWEEN '2022-10-10' AND GETDATE()
GO

-- 4 Показать все Мясные и Рыбные товары, которых было продано более 100 штук, показать информацию о поставщике и производителе
SELECT 
	Product.name "Name", 
	Category.name "Category",
	Delivery.quantity "Quantity", 
	Supplier.name "Supplier", 
	Address.street "Street",
	City.name "City",
	Region.name "Region",
	Country.name "Country" ,
	Producer.name "Producer", 
	Address.street "Street",
	City.name "City",
	Region.name "Region",
	Country.name "Country"
FROM Product
	INNER JOIN Category ON Category.id = Product.id_category
	INNER JOIN Delivery ON Delivery.id_product = Product.id
	INNER JOIN Supplier ON Supplier.id = Delivery.id_supplier
	INNER JOIN Producer ON Producer.id = Product.id_producer
	INNER JOIN Address ON Address.id = Supplier.id_address
	INNER JOIN City ON City.id = Address.id_city
	INNER JOIN Region ON Region.id = City.id_region
	INNER JOIN Country ON Country.id = Region.id_country
WHERE Category.id IN (4, 5)
AND Delivery.quantity > 100
GO

-- 5 Название товара, категории, поставщика, дата поставки, общую стоимость товаров. Только трёх поставщиков. Отсортировать по названию поставщиков
SELECT Product.name "Name", Category.name "Catrgory", Supplier.name "Supplyer name" ,Delivery.date_of_delivery "Date of delivery", Product.price * Product.quantity "All Price"
FROM Product
	INNER JOIN Category ON Category.id = Product.id_category
	INNER JOIN Delivery ON Delivery.id_product = Product.id
	INNER JOIN Supplier ON Supplier.id = Delivery.id_supplier
WHERE Delivery.id_supplier IN (1, 3, 4) 
ORDER BY Supplier.name
GO

-- 6 Название, производитель, полный адресс, категоряю, дата продажи, общая стоимость продажи. Кроме двух производителей (ID 3, 4). Сортировка по общей стоимости продаж
SELECT 
	Product.name "Name", 
	Producer.name "Producer",
	Address.street + ' ' + City.name + ' ' + Region.name + ' ' + Country.name "Address",
	Category.name "Category",
	Sale.date_of_sale "Date of sale",
	Sale.quantity * Sale.price "All price"
FROM Sale
	INNER JOIN Product ON Product.id = Sale.id_product
	INNER JOIN Producer ON Producer.id = Product.id_producer
	INNER JOIN Address ON Address.id = Producer.id_address
	INNER JOIN City ON City.id = Address.id_city
	INNER JOIN Region ON Region.id = City.id_region
	INNER JOIN Country ON Country.id = Region.id_country
	INNER JOIN Category ON Category.id = Product.id
WHERE Producer.id NOT IN (3, 4)
ORDER BY "All price" DESC
GO
