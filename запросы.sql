-- 1.1 ѕолучить записи с 3 по 5 из таблицы buyer
SELECT * FROM buyer WHERE id_buyer > 3 LIMIT 3;

-- 2.1 ѕолучить id_merchants у которых не определен возраст
SELECT id_merchant FROM merchant WHERE age is NULL

-- 2.2 ѕолучить id_merchants у которых определен возраст
SELECT id_merchant FROM merchant WHERE age is NOT NULL

-- 2.3 ѕолучить id_merchants чей возраст старше 18, но моложе 21
SELECT id_merchant FROM merchant WHERE age BETWEEN 18 AND 21

-- 2.4 ѕолучить id_merchants чей возраст 18 или 21 год
SELECT * FROM merchant WHERE age IN (18,  21);

-- 2.5 ѕолучить id_sale продаж которые совершил 1ый продавец
SELECT id_sale FROM sale WHERE id_merchant = 1;

-- 2.6 ѕолучить id_sale продаж которые совершил не 1ый продавец
SELECT id_sale FROM sale WHERE id_merchant <> 1;

-- 3.1 ќтсортировать продавцов по полю age по возрастанию
SELECT * FROM merchant ORDER BY age;

-- 3.2 ќтсортировать продавцов по полю age по убыванию
SELECT * FROM merchant ORDER BY age DESK;

-- 3.3 ќтсортировать товары по полю shelf life и price
SELECT * FROM good ORDER BY shelf_life,price;

-- 3.4 ќтсортировать товары по полю shelf life и извлечь price и producer
SELECT price, producer FROM good ORDER BY shelf_life;

-- 4.1 выбрать самого молодого продавца
SELECT MIN(age) FROM merchant;

-- 4.2 выбрать самого взрослого продавца
SELECT MAX(age) FROM merchant;

-- 4.3 выбрать средний возраст продавцов 
SELECT AVG(age) FROM merchant;
	
-- 4.4 выбрать суммарную цену товаров
SELECT AVG(price) FROM good;

-- 5.1 вывести все id торговцев, которые продали что-либо хот€ бы раз
SELECT DISTINCT id_merchant FROM sale;

-- 5.2 вывести количество совершенных сделок
SELECT COUNT(DISTINCT id_sale) FROM sale;

-- 6.1 ¬ыручка полученна€ фирмами
SELECT SUM(price) FROM good GROUP BY producer

--6.2 выручку фирмы при стоимости единицы товара большей чем 150
SELECT SUM(price) FROM good WHERE price > 150 GROUP BY producer

--6.3 выручку от товара при учете того, что обща€ выручка должна быть меньше 300
SELECT SUM(price) FROM good GROUP BY producer HAVING SUM(price) < 300