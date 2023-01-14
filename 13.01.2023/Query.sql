

-- -------------------- ������� �� * � ����� --------------------


-- 1 �������� ����� ���������� ����� �������� (������ ����� ��� ����������)
SELECT * FROM Product WHERE id = (
	SELECT id_product FROM Delivery WHERE quantity = (SELECT MAX(quantity) FROM Delivery))
GO

-- 2 ��������� ���������� ����������� �������� ������� ������ ��������� ���������
SELECT name,
	(SELECT SUM("sum") FROM
	(SELECT name, id_category, 
		(SELECT SUM(quantity) FROM Delivery WHERE id_product = Product.id) "sum"
			FROM Product WHERE id_category = Category.id) t) 
/
	(SELECT SUM("sum") FROM
		(SELECT name, id_category, 
			(SELECT SUM(quantity) FROM Delivery WHERE id_product = Product.id) "sum"
				FROM Product) t) 
* 100 
"percent" 
FROM Category
GO

-- 3 �������� �������� ����������� ������� �� ���������� ������
SELECT name FROM Supplier
EXCEPT
SELECT name FROM Supplier WHERE id IN
	(SELECT id_supplier FROM Delivery WHERE id_product = 
		(SELECT id FROM Product WHERE name LIKE '������'))
GO

-- 5 �������� ���� ���������������, ���������� ������������� ������� ������� � �������� ������, 
-- ��� ���������� ������������ ���� ������� ����� "��������� �5"
SELECT * FROM
	(SELECT name, 
		(SELECT COUNT(id) FROM 
			(SELECT * From Product WHERE id_producer = Producer.id
		) t) "count"
	FROM Producer)  tt
WHERE "count" >
	(SELECT COUNT(id) FROM 
		(SELECT * From Product WHERE id_producer = 
			(SELECT id FROM Producer WHERE name LIKE '��������� �5')
	) t)
GO

-- 6 �������� ����� ���������� ������ �� ������� ���, ������� �� 15.11.2022, � �� ��� ����.
-- ������������� �� �������� ����
SELECT date_of_sale, 
	(SELECT SUM(quantity) FROM Sale s2 WHERE s2.date_of_sale = s.date_of_sale) "count"
FROM (SELECT DISTINCT date_of_sale FROM Sale WHERE date_of_sale BETWEEN '2022-11-15' AND GETDATE()) s
ORDER BY date_of_sale
GO



-- 4* �������� �� ����� ������ ��������������, ������� ����� � ��� �� ������, ��� � "����� �����" 
SELECT name FROM Producer
	WHERE (SELECT id_country FROM Region
		WHERE id = (SELECT id_region FROM City
			WHERE id = (SELECT id_city FROM Address 
				WHERE id = id_address)))
=
(SELECT id_country FROM Region
	WHERE id = (SELECT id_region FROM City
		WHERE id = (SELECT id_city FROM Address 
			WHERE id = (SELECT id_address FROM Producer WHERE name LIKE '����� �����'))))
GO

-- 7* ��������� ���������� ������� ������ ���������, ������� ���� ���������
-- (�� ���������� ��������, � ��� �� ����������� ��� ��� ��� ������)
SELECT * FROM
	(SELECT 
		name, 
		(SELECT SUM("quantity")	
			FROM
			(SELECT 
				(SELECT id_category FROM Product WHERE t3.id_product = Product.id) "id_category",
				quantity
			FROM
				(SELECT id_product, 
					(SELECT SUM(quantity) FROM 
						(SELECT id_product, quantity FROM Delivery d 
							WHERE d.id_product = t1.id_product 
								AND date_of_delivery < DATEADD(month, -3, GETDATE()))t2) "quantity"
					FROM 
						(SELECT DISTINCT id_product FROM Delivery WHERE date_of_delivery < DATEADD(month, -3, GETDATE())) t1) t3) t4 WHERE id_category = Category.id) "quantity"
	FROM Category) t4
WHERE "quantity" IS NOT NULL
GO