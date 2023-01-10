
-- �������� �� OUTER JOIN

-- 1 �������� �������� ������� � �� �������������� (� ��� ����� ��� ��������������, � ������� ��� �������)
SELECT
	Product.name "Name", 
	Producer.name "Producer"
FROM Product
	RIGHT JOIN Producer ON Producer.id = Product.id_producer
GO

-- 2 �������� �������, ���� �� �������� � ����������� (� ��� ����� ��� �����������, ������� �� ������ ������ ���������)
SELECT 
	Product.name "Name",
	Delivery.date_of_delivery "Date of delivery",
	Supplier.name "Supplier name"
FROM Delivery
	INNER JOIN Product ON Delivery.id_product = Product.id
	RIGHT JOIN Supplier ON Supplier.id = Delivery.id_supplier
GO

-- 3 ������� � ������� ��� �������� �������������
SELECT Region.name "Name" FROM Region
EXCEPT
SELECT
	Region.name "Name"
FROM Producer
	JOIN Address ON Address.id = Producer.id
	JOIN City ON City.id = Address.id_city
	JOIN Region ON Region.id = City.id_region

-- 4 �������� ��������� ������� �� ���������� "����� �����" (ID 3)
SELECT Category.name FROM Category
EXCEPT
SELECT
	Category.name "Categoty"
FROM Producer
	JOIN Product ON Product.id_producer = Producer.id
	JOIN Category ON Category.id = Product.id_category
WHERE Producer.id = 3

-- 5 �������� �������������� ������� �� ��������� �������� �������� (ID 1) ���������
SELECT Producer.name "Name" FROM Producer
EXCEPT
SELECT
	Producer.name "Name"
FROM Producer
	JOIN Product ON Product.id_producer = Producer.id
	JOIN Category ON Category.id = Product.id_category
WHERE Category.id = 1


	
