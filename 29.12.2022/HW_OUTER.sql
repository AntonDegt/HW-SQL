
-- ѕрактика на OUTER JOIN

-- 1 ѕоказать название товаров и их производителей (в том числе тех производителей, у которых нет товаров)
SELECT
	Product.name "Name", 
	Producer.name "Producer"
FROM Product
	RIGHT JOIN Producer ON Producer.id = Product.id_producer
GO

-- 2 Ќазвание товаров, дата их поставки и поставщиков (в том числе тех поставщиков, которые не успели ничего поставить)
SELECT 
	Product.name "Name",
	Delivery.date_of_delivery "Date of delivery",
	Supplier.name "Supplier name"
FROM Delivery
	INNER JOIN Product ON Delivery.id_product = Product.id
	RIGHT JOIN Supplier ON Supplier.id = Delivery.id_supplier
GO

-- 3 ќбласти в которых нет ниодного производител€


-- 4 Ќазвани€ категорий которые не производит "—упер крупа" (ID 3)


-- 5 ѕоказать производителей которые не выпускают продукты молочной категории


	
