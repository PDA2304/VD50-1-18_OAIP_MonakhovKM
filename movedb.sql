-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Ноя 09 2020 г., 00:43
-- Версия сервера: 10.4.14-MariaDB
-- Версия PHP: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `movedb`
--

-- --------------------------------------------------------

--
-- Структура таблицы `actions`
--

CREATE TABLE `actions` (
  `id_action` int(11) NOT NULL COMMENT 'Идентификатор',
  `action_name` varchar(64) NOT NULL COMMENT 'Наименование'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `actions`
--

INSERT INTO `actions` (`id_action`, `action_name`) VALUES
(1, 'Авторизация'),
(2, 'Деавторизация');

-- --------------------------------------------------------

--
-- Структура таблицы `employee`
--

CREATE TABLE `employee` (
  `id_employee` int(11) NOT NULL COMMENT 'Ключ сотрудника\r\n'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `employee`
--

INSERT INTO `employee` (`id_employee`) VALUES
(1),
(2);

-- --------------------------------------------------------

--
-- Структура таблицы `films`
--

CREATE TABLE `films` (
  `ID_Films` int(11) NOT NULL,
  `Naimenovanie_filmov` varchar(255) DEFAULT NULL,
  `ID_Zhanra (FK)` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `films`
--

INSERT INTO `films` (`ID_Films`, `Naimenovanie_filmov`, `ID_Zhanra (FK)`) VALUES
(1, 'Naimenovanie_filmov', 'ID_films');

-- --------------------------------------------------------

--
-- Структура таблицы `groups`
--

CREATE TABLE `groups` (
  `id_group` int(11) NOT NULL COMMENT 'Идентификатор',
  `group_name` varchar(32) NOT NULL COMMENT 'Наименование'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `groups`
--

INSERT INTO `groups` (`id_group`, `group_name`) VALUES
(1, 'Администратор'),
(2, 'Пользователь'),
(3, 'Администратор'),
(4, 'Пользователь');

-- --------------------------------------------------------

--
-- Структура таблицы `klient`
--

CREATE TABLE `klient` (
  `ID_klienta` varchar(18) NOT NULL,
  `Familiya_klienta` varchar(18) DEFAULT NULL,
  `Imya_klienta` varchar(18) DEFAULT NULL,
  `Otchestvo_klienta` varchar(18) DEFAULT NULL,
  `Telefon_klienta` varchar(18) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `logs`
--

CREATE TABLE `logs` (
  `id_log` int(11) NOT NULL COMMENT 'Идентификатор',
  `id_action` int(11) NOT NULL COMMENT 'Ключ действия',
  `id_user` int(11) NOT NULL COMMENT 'Ключ пользователя',
  `log_datetime` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Дата и время действия'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `logs`
--

INSERT INTO `logs` (`id_log`, `id_action`, `id_user`, `log_datetime`) VALUES
(1, 1, 1, '2020-11-08 23:03:49'),
(2, 1, 1, '2020-11-08 23:15:16'),
(3, 1, 1, '2020-11-08 23:18:19'),
(4, 1, 1, '2020-11-08 23:33:13');

-- --------------------------------------------------------

--
-- Структура таблицы `ofice`
--

CREATE TABLE `ofice` (
  `ID_Ofica` varchar(18) NOT NULL,
  `Nazvanie_ofica` varchar(18) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `prodazha_tovara`
--

CREATE TABLE `prodazha_tovara` (
  `ID_prodazhi` varchar(18) NOT NULL,
  `Data_prodazhi` varchar(18) DEFAULT NULL,
  `Nomer_cheka` varchar(18) DEFAULT NULL,
  `ID_sotrydnika` varchar(18) DEFAULT NULL,
  `ID_klienta` varchar(18) DEFAULT NULL,
  `Cena` varchar(18) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `sotrydnik`
--

CREATE TABLE `sotrydnik` (
  `ID_sotrydnika` varchar(18) NOT NULL,
  `Imya_sotrydnika` varchar(18) DEFAULT NULL,
  `Familiya_sotrydnika` varchar(18) DEFAULT NULL,
  `Otchestvo_sotrydnika` varchar(18) DEFAULT NULL,
  `Data_rozhdeniya` varchar(18) DEFAULT NULL,
  `Telefon` varchar(18) DEFAULT NULL,
  `ID_Dolzhnosti` varchar(18) DEFAULT NULL,
  `ID_films` varchar(18) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `tokens`
--

CREATE TABLE `tokens` (
  `id_token` int(11) NOT NULL COMMENT 'Идентификатор',
  `id_user` int(11) NOT NULL COMMENT 'Ключ пользователя',
  `token` varchar(64) NOT NULL COMMENT 'Ключ безопасностиv',
  `token_datetime` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Дата и время создания ключа',
  `deactivated` int(11) DEFAULT NULL COMMENT 'Ключ отключён'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `tokens`
--

INSERT INTO `tokens` (`id_token`, `id_user`, `token`, `token_datetime`, `deactivated`) VALUES
(1, 1, 'U924F8NDZ2HPGPFFUIANSIAQVVCHOUJAHSHI89DLCTLWMQCNAXA3Y6LM9MIT5GZE', '2020-11-08 23:03:49', NULL),
(2, 1, '2NGLQ8J1C04WKX9NY52ON320PEEX6CI43Q45II4XPQB74FYYY1RRMWC9UQ6M3W5A', '2020-11-08 23:15:16', NULL),
(3, 1, 'Q3L9CHT7636OTGVZG20E77Q9A22FAT8QTE48K4EX9LC22DEFZ8NEBCGSNL8KOO6M', '2020-11-08 23:18:19', NULL),
(4, 1, 'G3HTC3UFTEN7SOWX4KTS6PACC5LLX77NHP72UHMLMRM311DOAU3Y72K02ERHRJSV', '2020-11-08 23:33:13', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id_user` int(11) NOT NULL COMMENT 'Идентификатор',
  `id_group` int(11) NOT NULL COMMENT 'Ключ группы',
  `id_employee` int(11) NOT NULL COMMENT 'Ключ сотрудника',
  `last_name` varchar(32) CHARACTER SET armscii8 NOT NULL COMMENT 'Фамилия сотрудника	',
  `first_name` varchar(32) NOT NULL COMMENT 'Имя сотрудника',
  `mid_name` varchar(32) NOT NULL COMMENT 'Отчество сотрудника	',
  `user_login` varchar(32) NOT NULL COMMENT 'Имя пользователя',
  `user_email` varchar(64) NOT NULL COMMENT 'Электронная почта',
  `user_password` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'Пароль'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id_user`, `id_group`, `id_employee`, `last_name`, `first_name`, `mid_name`, `user_login`, `user_email`, `user_password`) VALUES
(1, 1, 0, '1', '1', '1', 'Monakhov.KM', 'isip_k.m.manahov@mpt.ru', 'b3a8725a2dd7e092eedf9fe3b9fec5d5');

-- --------------------------------------------------------

--
-- Структура таблицы `ychet_tovara`
--

CREATE TABLE `ychet_tovara` (
  `ID_Films` int(11) NOT NULL,
  `Nomer_nakladnoy` varchar(255) DEFAULT NULL,
  `Data_postypleniya` varchar(255) DEFAULT NULL,
  `Kolichestvo_films` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `zhanr`
--

CREATE TABLE `zhanr` (
  `ID_zhanra` varchar(18) NOT NULL,
  `Imya_zhanra` varchar(18) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `actions`
--
ALTER TABLE `actions`
  ADD PRIMARY KEY (`id_action`);

--
-- Индексы таблицы `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`id_employee`);

--
-- Индексы таблицы `films`
--
ALTER TABLE `films`
  ADD PRIMARY KEY (`ID_Films`);

--
-- Индексы таблицы `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`id_group`);

--
-- Индексы таблицы `klient`
--
ALTER TABLE `klient`
  ADD PRIMARY KEY (`ID_klienta`);

--
-- Индексы таблицы `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`id_log`),
  ADD KEY `id_action` (`id_action`),
  ADD KEY `id_user` (`id_user`);

--
-- Индексы таблицы `ofice`
--
ALTER TABLE `ofice`
  ADD PRIMARY KEY (`ID_Ofica`);

--
-- Индексы таблицы `prodazha_tovara`
--
ALTER TABLE `prodazha_tovara`
  ADD PRIMARY KEY (`ID_prodazhi`),
  ADD KEY `ID_sotrydnika` (`ID_sotrydnika`);

--
-- Индексы таблицы `sotrydnik`
--
ALTER TABLE `sotrydnik`
  ADD PRIMARY KEY (`ID_sotrydnika`),
  ADD KEY `ID_films` (`ID_films`);

--
-- Индексы таблицы `tokens`
--
ALTER TABLE `tokens`
  ADD PRIMARY KEY (`id_token`),
  ADD KEY `id_user` (`id_user`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`),
  ADD KEY `users_ibfk_1` (`id_group`),
  ADD KEY `id_employee` (`id_employee`),
  ADD KEY `id_employee_2` (`id_employee`);

--
-- Индексы таблицы `ychet_tovara`
--
ALTER TABLE `ychet_tovara`
  ADD PRIMARY KEY (`ID_Films`);

--
-- Индексы таблицы `zhanr`
--
ALTER TABLE `zhanr`
  ADD PRIMARY KEY (`ID_zhanra`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `actions`
--
ALTER TABLE `actions`
  MODIFY `id_action` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор', AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `films`
--
ALTER TABLE `films`
  MODIFY `ID_Films` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `groups`
--
ALTER TABLE `groups`
  MODIFY `id_group` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор', AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `logs`
--
ALTER TABLE `logs`
  MODIFY `id_log` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор', AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `tokens`
--
ALTER TABLE `tokens`
  MODIFY `id_token` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор', AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор', AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `ychet_tovara`
--
ALTER TABLE `ychet_tovara`
  MODIFY `ID_Films` int(11) NOT NULL AUTO_INCREMENT;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `logs`
--
ALTER TABLE `logs`
  ADD CONSTRAINT `logs_ibfk_1` FOREIGN KEY (`id_action`) REFERENCES `actions` (`id_action`) ON UPDATE CASCADE,
  ADD CONSTRAINT `logs_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`);

--
-- Ограничения внешнего ключа таблицы `tokens`
--
ALTER TABLE `tokens`
  ADD CONSTRAINT `tokens_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`) ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`id_group`) REFERENCES `groups` (`id_group`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
