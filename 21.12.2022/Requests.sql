
-- 7 �������� ��� ������ ��������� ������ 50 ���. � ����� �������� �� 01.10.2022 �� ���������� ���
SELECT
	Product.name "Name",
	Delivery.price "Price",
	Delivery.date_of_delivery "Date of delivery"
FROM Delivery
	JOIN Product ON Product.id = Delivery.id_product
WHERE Delivery.price < 50
	AND Delivery.date_of_delivery BETWEEN '2022-10-01' AND DATEADD(DAY, -1, GETDATE())
GO

-- 8 �������� ��� ������� (ID 3), ���������� ������� ����� 100
SELECT
	Product.name "Name",
	Category.name "Category",
	Product.quantity "Quantity"
FROM Product
	JOIN Category ON Category.id = Product.id_category
WHERE Product.id_category = 3
	AND Product.quantity > 100
GO

-- 9 �������� ���������� � ������� �� 100 �� 200 ���. ������������� �� ����������� ����
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

-- 10 ��������� ���� �� ��� ������ �� 5%
UPDATE Product
SET Product.price = Product.price * 0.95
GO

-- 11 ��������� ����������� ���� �� ���� �������� ��� ���� ������� � ������� ������ ��������� �����������
UPDATE Delivery
SET Delivery.date_of_delivery = GETDATE()
WHERE Delivery.date_of_delivery IS NULL
GO

-- 12 ������� ��� ������ ���������� ������� ������ 100, � ���� ����� 70 ���.
DELETE FROM Product
WHERE Product.quantity < 100
	AND Product.price > 70
GO

-- 13 ������� ��� ����������� ������� (ID 7) � ������������ ������� (ID 12)
DELETE FROM Product
WHERE Product.id_category IN (7, 12)
GO

-- 15 ������� ��� ������� �������� ������� ������� �� 5 ����
DELETE FROM Product
WHERE LEN(Product.name) = 5
GO

-- 16 ������� ��� ������ ���� �������� ������� ���� ����� 3 ������� �����
DELETE FROM Delivery
WHERE Delivery.date_of_delivery < DATEADD(MONTH, -3, GETDATE())
GO

-- 18 ������� ������ ���������� � ������������� ������� ����������, ��� �� ���� ������ �� ��� ������ ����� 10% (Markup ID 7)
DELETE FROM Product
WHERE Product.id_producer IS NULL
	OR Product.id_markup = 7
GO