-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Ноя 11 2020 г., 01:07
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
(2, 'Пользователь');

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
(4, 1, 1, '2020-11-08 23:33:13'),
(5, 1, 1, '2020-11-09 12:26:40'),
(6, 1, 1, '2020-11-09 12:28:27'),
(7, 1, 1, '2020-11-09 12:29:08'),
(8, 1, 1, '2020-11-09 13:19:49'),
(9, 1, 1, '2020-11-09 13:21:56'),
(10, 1, 1, '2020-11-09 13:23:38'),
(11, 1, 1, '2020-11-09 13:40:56'),
(12, 1, 1, '2020-11-09 13:52:49'),
(13, 1, 1, '2020-11-09 13:53:17'),
(14, 1, 1, '2020-11-09 14:03:59'),
(15, 1, 1, '2020-11-09 14:07:26'),
(16, 1, 1, '2020-11-09 14:10:54'),
(17, 1, 1, '2020-11-09 14:15:23'),
(18, 1, 1, '2020-11-09 14:18:16'),
(19, 1, 1, '2020-11-09 14:21:58'),
(20, 1, 1, '2020-11-09 14:23:07');

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

--
-- Дамп данных таблицы `sotrydnik`
--

INSERT INTO `sotrydnik` (`ID_sotrydnika`, `Imya_sotrydnika`, `Familiya_sotrydnika`, `Otchestvo_sotrydnika`, `Data_rozhdeniya`, `Telefon`, `ID_Dolzhnosti`, `ID_films`) VALUES
('1', 'Даниил', 'Пахомов', 'Александрович', '23.04.2002', '+7(999)9999999', '1', '1');

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
(1, 1, 'U924F8NDZ2HPGPFFUIANSIAQVVCHOUJAHSHI89DLCTLWMQCNAXA3Y6LM9MIT5GZE', '2020-11-08 23:03:49', 0),
(2, 1, '2NGLQ8J1C04WKX9NY52ON320PEEX6CI43Q45II4XPQB74FYYY1RRMWC9UQ6M3W5A', '2020-11-08 23:15:16', 0),
(3, 1, 'Q3L9CHT7636OTGVZG20E77Q9A22FAT8QTE48K4EX9LC22DEFZ8NEBCGSNL8KOO6M', '2020-11-08 23:18:19', 0),
(4, 1, 'G3HTC3UFTEN7SOWX4KTS6PACC5LLX77NHP72UHMLMRM311DOAU3Y72K02ERHRJSV', '2020-11-08 23:33:13', 0),
(5, 1, '02EW5GL9679FKLZD43ZG7PDJ4JEXG0TIPV2L7TVZ1T1SQANZTUD5EEDKY52WBX2G', '2020-11-09 12:26:40', 0),
(6, 1, '07WGVOS22Z0CD7SZ0LC1SP1P6GKKYNWT46SNAI3KRS6EBH357CI7QN9LFGJPEIEP', '2020-11-09 12:28:27', 0),
(7, 1, 'QNM89AZF9KHJ3V8NLZWY6VEXU2B3JZC0AIPIM94C8YC1MLSQJPT80QP5IZNH866J', '2020-11-09 12:29:08', 0),
(8, 1, 'OGVAS4SVIPLU4JDD60AG0BCJOVSC48RBLUB6EF10SWKAD3JXJOSMP25NELV7MP1K', '2020-11-09 13:19:49', 0),
(9, 1, 'HNLFM8WZNI6FP7175I4N7XPTKPM69Q247DD6IL6LD1PE0KHNBAD3T8HU8247WZ07', '2020-11-09 13:21:56', 0),
(10, 1, 'H9LWLAWO119G9ES6Q89B8YI3PJUL3JBWRZ7VTATFOPQCAMALTEGE0LGT1RHCPLUR', '2020-11-09 13:23:38', 0),
(11, 1, '4Q0E8O8N0JZ1NFS5IJ7F82ZH0QWMRYC8VD2W1SBS0ZPBISMZVMTNTDWB1TNS1W5B', '2020-11-09 13:40:56', 0),
(12, 1, '8HVH6NXYN5USXHPN6RU53KI7PGEUUSPD65ZPNNLUZY5SPF6JZ1M84T9Y9X10ICD4', '2020-11-09 13:52:49', 0),
(13, 1, '7RKCKWAMRGG9VUQYUWXE5OK0W5POHH9PO0XQAJO99T5SZ1CMRCC9DZQTGTPOGVEJ', '2020-11-09 13:53:17', 0),
(14, 1, '7CEDBM6S50UTSSQ4VCU12D31N7ZR5W9ZJO4Q3COBIQWMPEANW6MIISL3IN0EWOWI', '2020-11-09 14:03:59', 0),
(15, 1, 'KMJJP9LP7VJJOYMRLM2P9O3FLPL81SH4JVJWEV0ZAXF3JWDFQLJZGNP5TD79YNYO', '2020-11-09 14:07:26', 0),
(16, 1, 'F3HMKO9D64ICRG2SJ5TBVZBMQ97ZPOUIWL275RCZH25DJFVIFJ7IHXZP256KQKXR', '2020-11-09 14:10:54', 0),
(17, 1, 'VCP9JOUA74O82RTRY20J65A0BQ5TZ49UW065KJI5HH1Y5PQCRLSIXSOZBZ72TBKD', '2020-11-09 14:15:23', 0),
(18, 1, 'JEI3UO3VIH6FV1OLGLKQI5Z172GIRB41AV908XJDN8VJEJSEFSNG37TNOR61HVDH', '2020-11-09 14:18:16', 0),
(19, 1, '2EJWJRJNLYZXZT1SS5LMVT3V0VFXVZP24TVBUUR1UB6NKLVHIJUM33GJKY6YLV2V', '2020-11-09 14:21:57', 0),
(20, 1, 'APB9XUB4W52LH1BYWQ1ARE1YBO8A1SO7N7766UFWF25LWKV2RIARPOP5YM8IWBCE', '2020-11-09 14:23:07', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id_user` int(11) NOT NULL COMMENT 'Идентификатор',
  `id_group` int(11) NOT NULL COMMENT 'Ключ группы',
  `id_employee` int(11) NOT NULL COMMENT 'Ключ сотрудника',
  `last_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_croatian_ci NOT NULL COMMENT 'Фамилия сотрудника	',
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
(1, 1, 0, '1', '1', '1', 'Monakhov.KM', 'isip_k.m.manahov@mpt.ru', 'b3a8725a2dd7e092eedf9fe3b9fec5d5'),
(5, 2, 0, '2', '2', '2', '2', '2', '93d611a51df8dba8e8d7739987d1b951'),
(6, 2, 2, '3', '3', '3', '3', '3', 'eccbc87e4b5ce2fe28308fd9f2a7baf3'),
(8, 2, 1, '???????', 'Александрович', 'Александрович', '1', '2222222', '93d611a51df8dba8e8d7739987d1b951');

-- --------------------------------------------------------

--
-- Дублирующая структура для представления `users_list`
-- (См. Ниже фактическое представление)
--
CREATE TABLE `users_list` (
`Ключ` int(11)
,`Фамилия, инициалы` varchar(38)
,`Группа` varchar(32)
,`Адрес эл. почты` varchar(64)
);

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

-- --------------------------------------------------------

--
-- Структура для представления `users_list`
--
DROP TABLE IF EXISTS `users_list`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `users_list`  AS SELECT `users`.`id_user` AS `Ключ`, concat(`users`.`last_name`,' ',substr(`users`.`first_name`,1,1),'. ',substr(`users`.`mid_name`,1,1),'.') AS `Фамилия, инициалы`, `groups`.`group_name` AS `Группа`, `users`.`user_email` AS `Адрес эл. почты` FROM ((`users` join `employee`) join `groups`) WHERE `users`.`id_employee` = `users`.`id_employee` AND `users`.`id_group` = `groups`.`id_group` ;

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
  MODIFY `id_log` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор', AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT для таблицы `tokens`
--
ALTER TABLE `tokens`
  MODIFY `id_token` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор', AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор', AUTO_INCREMENT=10;

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
