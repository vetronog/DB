-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Май 26 2017 г., 16:31
-- Версия сервера: 5.7.14
-- Версия PHP: 5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `lab4`
--

-- --------------------------------------------------------

--
-- Структура таблицы `athlete`
--

CREATE TABLE `athlete` (
  `id_athlete` int(11) NOT NULL,
  `full_name` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL,
  `growth` int(11) DEFAULT NULL,
  `weight` int(11) DEFAULT NULL,
  `rating` int(11) DEFAULT NULL,
  `birth_day` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `competition`
--

CREATE TABLE `competition` (
  `id_competition` int(11) NOT NULL,
  `action_type` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `date_competition` date DEFAULT NULL,
  `id_sponsor` int(11) DEFAULT NULL,
  `id_location` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `location`
--

CREATE TABLE `location` (
  `id_location` int(11) NOT NULL,
  `country` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_competition` int(11) DEFAULT NULL,
  `town` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `perfomance`
--

CREATE TABLE `perfomance` (
  `id_perfomance` int(11) NOT NULL,
  `id_competition` int(11) DEFAULT NULL,
  `id_athlete` int(11) DEFAULT NULL,
  `perfomance_result` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `sponsors`
--

CREATE TABLE `sponsors` (
  `id_sponsor` int(11) NOT NULL,
  `delegate` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL,
  `contribution` int(11) DEFAULT NULL,
  `id_competition` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `athlete`
--
ALTER TABLE `athlete`
  ADD PRIMARY KEY (`id_athlete`);

--
-- Индексы таблицы `competition`
--
ALTER TABLE `competition`
  ADD PRIMARY KEY (`id_competition`),
  ADD KEY `id_sponsor` (`id_sponsor`),
  ADD KEY `id_location` (`id_location`);

--
-- Индексы таблицы `location`
--
ALTER TABLE `location`
  ADD PRIMARY KEY (`id_location`),
  ADD KEY `id_competition` (`id_competition`);

--
-- Индексы таблицы `perfomance`
--
ALTER TABLE `perfomance`
  ADD PRIMARY KEY (`id_perfomance`),
  ADD UNIQUE KEY `id_competition` (`id_competition`,`id_athlete`),
  ADD UNIQUE KEY `id_competition_2` (`id_competition`),
  ADD KEY `id_competition_3` (`id_competition`),
  ADD KEY `id_athlete` (`id_athlete`);

--
-- Индексы таблицы `sponsors`
--
ALTER TABLE `sponsors`
  ADD PRIMARY KEY (`id_sponsor`),
  ADD KEY `id_competition` (`id_competition`),
  ADD KEY `id_competition_2` (`id_competition`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `athlete`
--
ALTER TABLE `athlete`
  MODIFY `id_athlete` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `competition`
--
ALTER TABLE `competition`
  MODIFY `id_competition` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `location`
--
ALTER TABLE `location`
  MODIFY `id_location` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `perfomance`
--
ALTER TABLE `perfomance`
  MODIFY `id_perfomance` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `sponsors`
--
ALTER TABLE `sponsors`
  MODIFY `id_sponsor` int(11) NOT NULL AUTO_INCREMENT;
--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `competition`
--
ALTER TABLE `competition`
  ADD CONSTRAINT `competition_ibfk_2` FOREIGN KEY (`id_location`) REFERENCES `location` (`id_location`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `competition_ibfk_3` FOREIGN KEY (`id_sponsor`) REFERENCES `sponsors` (`id_sponsor`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `location`
--
ALTER TABLE `location`
  ADD CONSTRAINT `location_ibfk_1` FOREIGN KEY (`id_competition`) REFERENCES `competition` (`id_competition`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `perfomance`
--
ALTER TABLE `perfomance`
  ADD CONSTRAINT `perfomance_ibfk_1` FOREIGN KEY (`id_competition`) REFERENCES `competition` (`id_competition`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `perfomance_ibfk_2` FOREIGN KEY (`id_athlete`) REFERENCES `athlete` (`id_athlete`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
