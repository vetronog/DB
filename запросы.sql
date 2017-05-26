-- 1.1 �������� ������ � 3 �� 5 �� ������� buyer
SELECT * FROM buyer WHERE id_buyer > 3 LIMIT 3;

-- 2.1 �������� id_merchants � ������� �� ��������� �������
SELECT id_merchant FROM merchant WHERE age is NULL

-- 2.2 �������� id_merchants � ������� ��������� �������
SELECT id_merchant FROM merchant WHERE age is NOT NULL

-- 2.3 �������� id_merchants ��� ������� ������ 18, �� ������ 21
SELECT id_merchant FROM merchant WHERE age BETWEEN 18 AND 21

-- 2.4 �������� id_merchants ��� ������� 18 ��� 21 ���
SELECT * FROM merchant WHERE age IN (18,  21);

-- 2.5 �������� id_sale ������ ������� �������� 1�� ��������
SELECT id_sale FROM sale WHERE id_merchant = 1;

-- 2.6 �������� id_sale ������ ������� �������� �� 1�� ��������
SELECT id_sale FROM sale WHERE id_merchant <> 1;

-- 3.1 ������������� ��������� �� ���� age �� �����������
SELECT * FROM merchant ORDER BY age;

-- 3.2 ������������� ��������� �� ���� age �� ��������
SELECT * FROM merchant ORDER BY age DESK;

-- 3.3 ������������� ������ �� ���� shelf life � price
SELECT * FROM good ORDER BY shelf_life,price;

-- 3.4 ������������� ������ �� ���� shelf life � ������� price � producer
SELECT price, producer FROM good ORDER BY shelf_life;

-- 4.1 ������� ������ �������� ��������
SELECT MIN(age) FROM merchant;

-- 4.2 ������� ������ ��������� ��������
SELECT MAX(age) FROM merchant;

-- 4.3 ������� ������� ������� ��������� 
SELECT AVG(age) FROM merchant;
	
-- 4.4 ������� ��������� ���� �������
SELECT AVG(price) FROM good;

-- 5.1 ������� ��� id ���������, ������� ������� ���-���� ���� �� ���
SELECT DISTINCT id_merchant FROM sale;

-- 5.2 ������� ���������� ����������� ������
SELECT COUNT(DISTINCT id_sale) FROM sale;

-- 6.1 ������� ���������� �������
SELECT SUM(price) FROM good GROUP BY producer

--6.2 ������� ����� ��� ��������� ������� ������ ������� ��� 150
SELECT SUM(price) FROM good WHERE price > 150 GROUP BY producer

--6.3 ������� �� ������ ��� ����� ����, ��� ����� ������� ������ ���� ������ 300
SELECT SUM(price) FROM good GROUP BY producer HAVING SUM(price) < 300