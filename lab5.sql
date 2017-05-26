-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Май 26 2017 г., 16:22
-- Версия сервера: 5.7.14
-- Версия PHP: 5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `lab5`
--

-- --------------------------------------------------------

--
-- Структура таблицы `buyer`
--

CREATE TABLE `buyer` (
  `id_buyer` int(11) NOT NULL,
  `name` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL,
  `age` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `buyer`
--

INSERT INTO `buyer` (`id_buyer`, `name`, `age`) VALUES
(1, 'Kolya', 18),
(2, NULL, 18),
(3, 'Petr', 21),
(5, 'Maria', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `good`
--

CREATE TABLE `good` (
  `id_good` int(11) NOT NULL,
  `shelf_life` date DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `producer` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_list` int(11) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `good`
--

INSERT INTO `good` (`id_good`, `shelf_life`, `price`, `producer`, `id_list`) VALUES
(1, '2017-07-09', 150, NULL, NULL),
(2, '2018-01-08', 400, 'Bavaria', NULL),
(3, '2015-04-02', NULL, 'USA', NULL),
(4, NULL, 200, 'Bavaria', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `good_in_sale`
--

CREATE TABLE `good_in_sale` (
  `id_sale` int(11) DEFAULT NULL,
  `id_good` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Структура таблицы `merchant`
--

CREATE TABLE `merchant` (
  `id_merchant` int(11) NOT NULL,
  `full_name` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `id_organization` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `merchant`
--

INSERT INTO `merchant` (`id_merchant`, `full_name`, `age`, `id_organization`) VALUES
(1, 'Kolya', 18, NULL),
(2, 'Kolya', NULL, NULL),
(3, 'Anna', 19, NULL),
(4, 'Maria', 21, NULL),
(5, 'Kolya', 23, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `organization`
--

CREATE TABLE `organization` (
  `id_organization` int(11) NOT NULL,
  `name` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL,
  `number_worker` int(11) DEFAULT NULL,
  `hour_price` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `organization`
--

INSERT INTO `organization` (`id_organization`, `name`, `number_worker`, `hour_price`) VALUES
(1, 'Ela', 3, 100),
(2, 'Max', NULL, 150),
(3, NULL, 5, NULL),
(4, 'Home', 1, 200);

-- --------------------------------------------------------

--
-- Структура таблицы `sale`
--

CREATE TABLE `sale` (
  `id_sale` int(11) NOT NULL,
  `sale_date` date DEFAULT NULL,
  `blank_count` int(11) DEFAULT NULL,
  `id_merchant` int(11) DEFAULT NULL,
  `id_buyer` int(11) DEFAULT NULL,
  `id_list` int(11) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `sale`
--

INSERT INTO `sale` (`id_sale`, `sale_date`, `blank_count`, `id_merchant`, `id_buyer`, `id_list`) VALUES
(1, NULL, NULL, NULL, NULL, NULL),
(2, '2007-09-09', NULL, NULL, NULL, NULL),
(3, '2009-06-17', NULL, NULL, NULL, NULL),
(4, '2006-01-11', NULL, NULL, NULL, NULL),
(5, NULL, NULL, NULL, NULL, NULL);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `buyer`
--
ALTER TABLE `buyer`
  ADD PRIMARY KEY (`id_buyer`);

--
-- Индексы таблицы `good`
--
ALTER TABLE `good`
  ADD PRIMARY KEY (`id_good`),
  ADD KEY `id_list` (`id_list`);

--
-- Индексы таблицы `good_in_sale`
--
ALTER TABLE `good_in_sale`
  ADD KEY `id_sale` (`id_sale`),
  ADD KEY `id_good` (`id_good`);

--
-- Индексы таблицы `merchant`
--
ALTER TABLE `merchant`
  ADD PRIMARY KEY (`id_merchant`),
  ADD KEY `id_organization` (`id_organization`);

--
-- Индексы таблицы `organization`
--
ALTER TABLE `organization`
  ADD PRIMARY KEY (`id_organization`);

--
-- Индексы таблицы `sale`
--
ALTER TABLE `sale`
  ADD PRIMARY KEY (`id_sale`),
  ADD KEY `id_merchant` (`id_merchant`),
  ADD KEY `id_buyer` (`id_buyer`),
  ADD KEY `id_buyer_2` (`id_buyer`),
  ADD KEY `id_list` (`id_list`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `buyer`
--
ALTER TABLE `buyer`
  MODIFY `id_buyer` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT для таблицы `good`
--
ALTER TABLE `good`
  MODIFY `id_good` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT для таблицы `merchant`
--
ALTER TABLE `merchant`
  MODIFY `id_merchant` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT для таблицы `organization`
--
ALTER TABLE `organization`
  MODIFY `id_organization` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT для таблицы `sale`
--
ALTER TABLE `sale`
  MODIFY `id_sale` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `good_in_sale`
--
ALTER TABLE `good_in_sale`
  ADD CONSTRAINT `good_in_sale_ibfk_1` FOREIGN KEY (`id_good`) REFERENCES `good` (`id_good`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `good_in_sale_ibfk_2` FOREIGN KEY (`id_sale`) REFERENCES `sale` (`id_sale`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `merchant`
--
ALTER TABLE `merchant`
  ADD CONSTRAINT `merchant_ibfk_1` FOREIGN KEY (`id_organization`) REFERENCES `organization` (`id_organization`);

--
-- Ограничения внешнего ключа таблицы `sale`
--
ALTER TABLE `sale`
  ADD CONSTRAINT `sale_ibfk_3` FOREIGN KEY (`id_buyer`) REFERENCES `buyer` (`id_buyer`),
  ADD CONSTRAINT `sale_ibfk_4` FOREIGN KEY (`id_merchant`) REFERENCES `merchant` (`id_merchant`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
