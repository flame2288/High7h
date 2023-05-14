-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Май 13 2023 г., 15:25
-- Версия сервера: 8.0.24
-- Версия PHP: 7.1.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `информационная система гостиничного комплекса`
--

-- --------------------------------------------------------

--
-- Структура таблицы `комната`
--

CREATE TABLE `комната` (
  `ID` int NOT NULL COMMENT 'ID',
  `ID_building` int NOT NULL COMMENT 'ID гостиницы',
  `Number_room` int NOT NULL COMMENT 'Номер комнаты',
  `Number_of_seats` int NOT NULL COMMENT 'Количество мест',
  `Price` varchar(255) NOT NULL COMMENT 'Стоимость номера',
  `Food` varchar(255) NOT NULL COMMENT 'Питание'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `комната`
--

INSERT INTO `комната` (`ID`, `ID_building`, `Number_room`, `Number_of_seats`, `Price`, `Food`) VALUES
(1, 1, 101, 1, '1500 рублей в сутки', 'За дополнительную плату'),
(2, 1, 102, 2, '2500 рублей в сутки', 'За дополнительную плату'),
(3, 3, 1, 1, '2000 рублей в сутки', '3х разовое включено в стоимость'),
(4, 3, 2, 2, '3500 рублей в сутки', '3х разовое включено в стоимость'),
(5, 2, 1, 1, '1200 рублей в сутки', 'Отсутствует'),
(6, 2, 2, 2, '2200 рублей в сутки', 'Отсутствует');

-- --------------------------------------------------------

--
-- Структура таблицы `корпус`
--

CREATE TABLE `корпус` (
  `ID` int NOT NULL COMMENT 'Id гостиницы',
  `Name` varchar(255) DEFAULT NULL COMMENT 'Полное название гостиницы',
  `Address` varchar(255) DEFAULT NULL COMMENT 'Адрес гостиницы'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `корпус`
--

INSERT INTO `корпус` (`ID`, `Name`, `Address`) VALUES
(1, 'Гостиница Русь', 'Пушкина 25'),
(2, 'Гостиница Лара', 'Ленина 9'),
(3, 'Гостиница Маяк', 'Мира 15');

-- --------------------------------------------------------

--
-- Структура таблицы `проживание`
--

CREATE TABLE `проживание` (
  `ID` int NOT NULL COMMENT 'ID',
  `ID_room` int NOT NULL COMMENT 'ID комнаты',
  `ID_guest` int NOT NULL COMMENT 'ID гостя',
  `Start_date` date NOT NULL COMMENT 'Дата начала',
  `Finish_date` date DEFAULT NULL COMMENT 'Предполагаемая дата окончания',
  `Actual_finish_date` date DEFAULT NULL COMMENT 'Фактическая дата окончания',
  `Number_of_people` int NOT NULL COMMENT 'Количество человек'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `проживание`
--

INSERT INTO `проживание` (`ID`, `ID_room`, `ID_guest`, `Start_date`, `Finish_date`, `Actual_finish_date`, `Number_of_people`) VALUES
(1, 2, 4, '2023-05-04', '2023-05-15', NULL, 1),
(2, 5, 5, '2023-05-13', NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `бронирование`
--

CREATE TABLE `бронирование` (
  `ID` int NOT NULL COMMENT 'ID',
  `ID_room` int DEFAULT NULL COMMENT 'ID комнаты',
  `ID_guest` int NOT NULL COMMENT 'ID гостя',
  `Start_date` date DEFAULT NULL COMMENT 'Дата начала',
  `Finish_date` date DEFAULT NULL COMMENT 'Дата окончания',
  `Number_of_people` int NOT NULL COMMENT 'Количество человек'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `бронирование`
--

INSERT INTO `бронирование` (`ID`, `ID_room`, `ID_guest`, `Start_date`, `Finish_date`, `Number_of_people`) VALUES
(1, 1, 1, '2023-06-08', '2023-06-20', 1),
(2, 6, 3, '2023-06-01', '2023-06-03', 2);

-- --------------------------------------------------------

--
-- Структура таблицы `гости`
--

CREATE TABLE `гости` (
  `ID` int NOT NULL COMMENT 'ID гостя',
  `Name` varchar(255) NOT NULL COMMENT 'ФИО'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `гости`
--

INSERT INTO `гости` (`ID`, `Name`) VALUES
(1, 'Иванов Иван Иванович'),
(2, 'Петров Петр Петрович'),
(3, 'Сергеев Сергей Сергеевич'),
(4, 'Васильев Василий Васильевич'),
(5, 'Андреев Андрей Андреевич'),
(6, 'Денисов Денис Денисович');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `комната`
--
ALTER TABLE `комната`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ID_building` (`ID_building`);

--
-- Индексы таблицы `корпус`
--
ALTER TABLE `корпус`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `проживание`
--
ALTER TABLE `проживание`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ID_room` (`ID_room`),
  ADD KEY `ID_guest` (`ID_guest`);

--
-- Индексы таблицы `бронирование`
--
ALTER TABLE `бронирование`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ID_room` (`ID_room`),
  ADD KEY `ID_guest` (`ID_guest`);

--
-- Индексы таблицы `гости`
--
ALTER TABLE `гости`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `комната`
--
ALTER TABLE `комната`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT COMMENT 'ID', AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT для таблицы `корпус`
--
ALTER TABLE `корпус`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT COMMENT 'Id гостиницы', AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `проживание`
--
ALTER TABLE `проживание`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT COMMENT 'ID', AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `бронирование`
--
ALTER TABLE `бронирование`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT COMMENT 'ID', AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `гости`
--
ALTER TABLE `гости`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT COMMENT 'ID гостя', AUTO_INCREMENT=7;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `комната`
--
ALTER TABLE `комната`
  ADD CONSTRAINT `комната_ibfk_1` FOREIGN KEY (`ID_building`) REFERENCES `корпус` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `проживание`
--
ALTER TABLE `проживание`
  ADD CONSTRAINT `проживание_ibfk_1` FOREIGN KEY (`ID_room`) REFERENCES `комната` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `проживание_ibfk_2` FOREIGN KEY (`ID_guest`) REFERENCES `гости` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `бронирование`
--
ALTER TABLE `бронирование`
  ADD CONSTRAINT `бронирование_ibfk_1` FOREIGN KEY (`ID_room`) REFERENCES `комната` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `бронирование_ibfk_2` FOREIGN KEY (`ID_guest`) REFERENCES `гости` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
