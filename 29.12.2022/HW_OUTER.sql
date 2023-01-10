
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


-- 4 �������� ��������� ������� �� ���������� "����� �����" (ID 3)


-- 5 �������� �������������� ������� �� ��������� �������� �������� ���������


	
