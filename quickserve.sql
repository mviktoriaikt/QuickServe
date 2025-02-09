-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2025. Feb 09. 20:19
-- Kiszolgáló verziója: 10.4.32-MariaDB
-- PHP verzió: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `quickserve`
--

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `eladók`
--

CREATE TABLE `eladók` (
  `Eladó_ID` int(11) DEFAULT NULL,
  `Név` varchar(30) DEFAULT NULL,
  `Telefonszám` varchar(11) DEFAULT NULL,
  `nyitvatartás` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `jelszó` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_hungarian_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `megrendelések`
--

CREATE TABLE `megrendelések` (
  `ID` int(11) NOT NULL,
  `Megrendelés_ID` int(11) DEFAULT NULL,
  `Vásárló_ID` int(11) DEFAULT NULL,
  `Cikkszám` int(11) DEFAULT NULL,
  `Dátum` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `Mennyiség` int(11) DEFAULT NULL,
  `Szünet` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_hungarian_ci;

--
-- A tábla adatainak kiíratása `megrendelések`
--

INSERT INTO `megrendelések` (`ID`, `Megrendelés_ID`, `Vásárló_ID`, `Cikkszám`, `Dátum`, `Mennyiség`, `Szünet`) VALUES
(1, 252, 1, 202, '2025-02-09 13:34:30', 1, 3),
(2, 252, 1, 203, '2025-02-09 13:37:39', 2, 3),
(3, 253, 1, 205, '2025-02-09 17:27:13', 2, 5),
(4, 111, 1, 200, '2025-02-09 18:02:00', 2, 3),
(5, 111, 1, 120, '2025-02-09 18:02:00', 1, 3),
(15, 355, 1, 117, '2025-02-09 18:28:45', 1, 2),
(16, 355, 1, 118, '2025-02-09 18:28:45', 2, 2),
(17, 355, 1, 116, '2025-02-09 18:28:45', 3, 2);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `rendelés_állapot`
--

CREATE TABLE `rendelés_állapot` (
  `Megrendelés_ID` int(11) NOT NULL,
  `Státusz` varchar(255) DEFAULT NULL,
  `Módosítás_dátuma` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_hungarian_ci;

--
-- A tábla adatainak kiíratása `rendelés_állapot`
--

INSERT INTO `rendelés_állapot` (`Megrendelés_ID`, `Státusz`, `Módosítás_dátuma`) VALUES
(111, 'Rendelés elküldve', '2025-02-09 18:04:08'),
(252, 'Teljesítve', '2025-02-09 18:06:21'),
(355, 'Rendelés elküldve', '2025-02-09 18:28:45');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `termékek`
--

CREATE TABLE `termékek` (
  `Cikkszám` int(11) NOT NULL,
  `Terméknév` varchar(255) DEFAULT NULL,
  `Típus` varchar(255) DEFAULT NULL,
  `Egységár` varchar(255) DEFAULT NULL,
  `Kategória` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_hungarian_ci;

--
-- A tábla adatainak kiíratása `termékek`
--

INSERT INTO `termékek` (`Cikkszám`, `Terméknév`, `Típus`, `Egységár`, `Kategória`) VALUES
(101, 'Topjoy', 'kaktusz', '350', 'Üditők'),
(102, 'Topjoy', 'mangó', '350', 'Üditők'),
(103, 'Mizse ásványvíz', 'szénsavmentes', '150', 'Üditők'),
(104, 'Mizse ásványvíz', 'szénsavas', '150', 'Üditők'),
(105, 'Topjoy', 'görögdinnye', '350', 'Üditők'),
(106, 'Szentkirályi ásványvíz', 'szénsavmentes', '250', 'Üditők'),
(107, 'Szentkirályi ásványvíz', 'szénsavas', '250', 'Üditők'),
(108, 'Cappy', 'multivitamin', '400', 'Üditők'),
(109, 'Cappy', 'alma-körte', '400', 'Üditők'),
(110, 'Cappy', 'eper-kiwi', '400', 'Üditők'),
(111, 'Topjoy', 'barack', '350', 'Üditők'),
(112, 'Topjoy', 'körte', '350', 'Üditők'),
(113, 'Xixo ice tea', 'barack', '200', 'Üditők'),
(114, 'Xixo ice tea', 'görögdinnye', '200', 'Üditők'),
(115, 'Xixo ice tea', 'eper', '200', 'Üditők'),
(116, 'Fuze tea', 'citrom', '450', 'Üditők'),
(117, 'Fuze tea', 'barack', '450', 'Üditők'),
(118, 'Natur aqua ásványvíz', 'szénvasas', '200', 'Üditők'),
(119, 'Natur aqua ásványvíz', 'szénsavmentes', '200', 'Üditők'),
(200, 'Szendvics', 'gyrosos', '700', 'Szendvicsek'),
(201, 'Szendvics', 'rántotthúsos', '700', 'Szendvicsek'),
(202, 'Pizza szelet', 'sonkás-kukoricás', '600', 'Szendvicsek'),
(203, 'Szendvics', 'tarjás', '650', 'Szendvicsek'),
(204, 'Szendvics', 'torpedo', '600', 'Szendvicsek'),
(205, 'Pizza szelet', 'baconson', '600', 'Szendvicsek'),
(206, 'Szendvics - borsos', 'tarjás', '700', 'Szendvicsek'),
(207, 'Szendvics - borsos', 'torpedo', '600', 'Szendvicsek'),
(208, 'Hotdog', '-', '500', 'Szendvicsek'),
(209, 'Szendvics - borsos', 'rántotthúsos', '700', 'Szendvicsek'),
(210, 'Szendvics - borsos', 'gyrosos', '700', 'Szendvicsek'),
(211, 'Milka', 'fehércsokis', '550', 'Édességek'),
(212, 'Milka', 'mogyorós', '550', 'Édességek'),
(213, 'Mars', 'classic', '340', 'Édességek'),
(214, 'Bounty', 'classic', '330', 'Édességek'),
(215, 'Knoppers', 'classic', '250', 'Édességek'),
(216, '3Bit', 'classic', '250', 'Édességek'),
(217, 'Milka', 'classic', '500', 'Édességek'),
(218, 'kinder bueno', 'classic', '340', 'Édességek'),
(219, 'kinder cards', 'classic', '230', 'Édességek'),
(220, 'KitKat', 'classic', '300', 'Édességek'),
(221, 'Balaton bumm', 'classic', '260', 'Édességek'),
(222, 'Balaton bumm', 'fehércsokis', '260', 'Édességek'),
(223, 'Twix', 'classic', '300', 'Édességek'),
(224, 'Twix', 'salted caramel', '300', 'Édességek'),
(225, 'Twix', 'fehércsokis', '300', 'Édességek'),
(226, 'Snickers', 'classic', '320', 'Édességek'),
(227, 'Snickers', 'pecan', '320', 'Édességek'),
(228, 'Tibi csokoládé', 'classic', '450', 'Édességek'),
(229, 'Tibi csokoládé', 'étcsokoládés', '450', 'Édességek'),
(230, 'Haribo', 'goldenbaren', '300', 'Édességek'),
(231, 'Haribo', 'pico-balla', '320', 'Édességek'),
(232, 'Haribo', 'spaghetti epres', '320', 'Édességek'),
(233, 'Haribo', 'quaxi', '300', 'Édességek'),
(234, 'Skittles', '-', '350', 'Édességek'),
(235, 'Smarties', 'tejcsokoládé', '270', 'Édességek'),
(236, 'Maltesers', 'tejcsokoládé', '400', 'Édességek'),
(237, 'Skittles', 'fruits', '350', 'Édességek'),
(238, 'kinder chocolate', 'tejcsokoládé', '250', 'Édességek'),
(239, 'Milka', 'waffelini', '170', 'Édességek'),
(240, 'Bonbonetti', 'dunakavics', '265', 'Édességek'),
(241, 'Croco ropi', 'sós', '100', 'Ropogós nasik'),
(242, 'Croco ropi', 'csokoládés', '280', 'Ropogós nasik'),
(243, 'Croso kréker', 'sós', '300', 'Ropogós nasik'),
(244, 'Lays chips', 'hagymás-tejfölös', '300', 'Ropogós nasik'),
(245, 'Lays chips', 'sajtos', '360', 'Ropogós nasik'),
(246, 'Lays chips', 'paprikás', '350', 'Ropogós nasik'),
(247, 'Vipa chips', 'ketchup', '300', 'Ropogós nasik'),
(248, 'Vipa chips', 'classic', '300', 'Ropogós nasik'),
(249, 'Vipa chips', 'pizza', '300', 'Ropogós nasik'),
(250, 'Vipa chips', 'sajtos', '300', 'Ropogós nasik'),
(251, 'Vipa chips', 'hagymás-tejfölös', '300', 'Ropogós nasik'),
(252, 'Vipa chips', 'paprikás', '300', 'Ropogós nasik'),
(253, 'Fripsy chips', 'classic', '230', 'Ropogós nasik'),
(254, 'Vipa chips', 'grill', '300', 'Ropogós nasik'),
(255, 'Kávé', 'fekete', '300', 'Kávék'),
(256, 'Kávé', 'cukorral', '350', 'Kávék'),
(257, 'Kávé', 'cukor és tejszínhabbal', '350', 'Kávék'),
(258, 'Kávé', 'édesítővel', '350', 'Kávék');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `vásárlók`
--

CREATE TABLE `vásárlók` (
  `Vásárló_ID` int(11) NOT NULL,
  `Név` varchar(30) DEFAULT NULL,
  `Telefonszám` varchar(11) DEFAULT NULL,
  `Lakcím` varchar(255) DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `Jelszó` varchar(255) DEFAULT NULL,
  `Osztály` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_hungarian_ci;

--
-- A tábla adatainak kiíratása `vásárlók`
--

INSERT INTO `vásárlók` (`Vásárló_ID`, `Név`, `Telefonszám`, `Lakcím`, `Email`, `Jelszó`, `Osztály`) VALUES
(1, 'Magyar Ákos', '06304300743', 'Kispalád Fő utca 4.', 'akosmagyar@gmail.com', 'janika123', 13);

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `megrendelések`
--
ALTER TABLE `megrendelések`
  ADD PRIMARY KEY (`ID`);

--
-- A tábla indexei `rendelés_állapot`
--
ALTER TABLE `rendelés_állapot`
  ADD PRIMARY KEY (`Megrendelés_ID`);

--
-- A tábla indexei `termékek`
--
ALTER TABLE `termékek`
  ADD PRIMARY KEY (`Cikkszám`);

--
-- A tábla indexei `vásárlók`
--
ALTER TABLE `vásárlók`
  ADD PRIMARY KEY (`Vásárló_ID`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `megrendelések`
--
ALTER TABLE `megrendelések`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT a táblához `vásárlók`
--
ALTER TABLE `vásárlók`
  MODIFY `Vásárló_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
