-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 23, 2022 at 12:54 AM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.0.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `angular`
--

-- --------------------------------------------------------

--
-- Table structure for table `cars`
--

CREATE TABLE `cars` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `brand` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `year_of_premiere` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `city_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cars`
--

INSERT INTO `cars` (`id`, `user_id`, `brand`, `model`, `year_of_premiere`, `created_at`, `updated_at`, `city_id`) VALUES
(23, 4, 'Audi', 'TT', '2003', '2022-01-14 12:58:45', '2022-01-14 12:58:45', 166),
(24, 5, 'Mazda', 'Carso', '2005', '2022-01-14 12:59:25', '2022-01-14 12:59:25', 60),
(25, 6, 'BMW', 'm5', '2000', '2022-01-14 13:00:10', '2022-01-14 13:00:10', 108);

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`id`, `name`, `country_id`, `created_at`, `updated_at`) VALUES
(1, 'Watersshire', 9, '2022-01-05 16:16:58', '2022-01-05 16:16:58'),
(2, 'Jeffreyfurt', 5, '2022-01-05 16:16:58', '2022-01-05 16:16:58'),
(3, 'East Beaufurt', 10, '2022-01-05 16:16:58', '2022-01-05 16:16:58'),
(4, 'Keeblerport', 4, '2022-01-05 16:16:58', '2022-01-05 16:16:58'),
(5, 'Catalinaborough', 1, '2022-01-05 16:16:58', '2022-01-05 16:16:58'),
(6, 'West Betty', 8, '2022-01-05 16:16:58', '2022-01-05 16:16:58'),
(7, 'North Elijahfort', 9, '2022-01-05 16:16:58', '2022-01-05 16:16:58'),
(8, 'Lake Imogeneville', 7, '2022-01-05 16:16:58', '2022-01-05 16:16:58'),
(9, 'Nikolauschester', 2, '2022-01-05 16:16:58', '2022-01-05 16:16:58'),
(10, 'Lake Leathafurt', 3, '2022-01-05 16:16:58', '2022-01-05 16:16:58'),
(11, 'Lake Oranville', 3, '2022-01-05 16:16:58', '2022-01-05 16:16:58'),
(12, 'Port Delilahchester', 2, '2022-01-05 16:16:58', '2022-01-05 16:16:58'),
(13, 'Clementside', 8, '2022-01-05 16:16:58', '2022-01-05 16:16:58'),
(14, 'Lake Rociobury', 1, '2022-01-05 16:16:58', '2022-01-05 16:16:58'),
(15, 'Lindstad', 4, '2022-01-05 16:16:58', '2022-01-05 16:16:58'),
(16, 'Wayneside', 7, '2022-01-05 16:16:58', '2022-01-05 16:16:58'),
(17, 'New Ezequielmouth', 6, '2022-01-05 16:16:58', '2022-01-05 16:16:58'),
(18, 'Deshawnport', 9, '2022-01-05 16:16:58', '2022-01-05 16:16:58'),
(19, 'Agustinaside', 10, '2022-01-05 16:16:58', '2022-01-05 16:16:58'),
(20, 'Therontown', 9, '2022-01-05 16:16:58', '2022-01-05 16:16:58'),
(21, 'New Giuseppe', 6, '2022-01-05 16:16:58', '2022-01-05 16:16:58'),
(22, 'New Christopherbury', 10, '2022-01-05 16:16:58', '2022-01-05 16:16:58'),
(23, 'East Litzy', 4, '2022-01-05 16:16:58', '2022-01-05 16:16:58'),
(24, 'New Bernie', 1, '2022-01-05 16:16:58', '2022-01-05 16:16:58'),
(25, 'Lake Elaina', 9, '2022-01-05 16:16:58', '2022-01-05 16:16:58'),
(26, 'Malliemouth', 10, '2022-01-05 16:16:58', '2022-01-05 16:16:58'),
(27, 'Goldnertown', 7, '2022-01-05 16:16:58', '2022-01-05 16:16:58'),
(28, 'Port Darianbury', 2, '2022-01-05 16:16:58', '2022-01-05 16:16:58'),
(29, 'Port Yessenia', 10, '2022-01-05 16:16:58', '2022-01-05 16:16:58'),
(30, 'Gracielaport', 5, '2022-01-05 16:16:58', '2022-01-05 16:16:58'),
(31, 'East Candice', 10, '2022-01-05 16:16:58', '2022-01-05 16:16:58'),
(32, 'West Benjaminchester', 9, '2022-01-05 16:16:58', '2022-01-05 16:16:58'),
(33, 'Port Savannahshire', 6, '2022-01-05 16:16:58', '2022-01-05 16:16:58'),
(34, 'New Vincenza', 7, '2022-01-05 16:16:58', '2022-01-05 16:16:58'),
(35, 'New Gerda', 9, '2022-01-05 16:16:58', '2022-01-05 16:16:58'),
(36, 'Donnyfurt', 5, '2022-01-05 16:16:59', '2022-01-05 16:16:59'),
(37, 'Lubowitzbury', 2, '2022-01-05 16:16:59', '2022-01-05 16:16:59'),
(38, 'Emmittshire', 1, '2022-01-05 16:16:59', '2022-01-05 16:16:59'),
(39, 'Port Kellen', 9, '2022-01-05 16:16:59', '2022-01-05 16:16:59'),
(40, 'Jaidaburgh', 5, '2022-01-05 16:16:59', '2022-01-05 16:16:59'),
(41, 'Aubreyton', 7, '2022-01-05 16:16:59', '2022-01-05 16:16:59'),
(42, 'Goldnerborough', 6, '2022-01-05 16:16:59', '2022-01-05 16:16:59'),
(43, 'New Cyrusmouth', 3, '2022-01-05 16:16:59', '2022-01-05 16:16:59'),
(44, 'McClureberg', 8, '2022-01-05 16:16:59', '2022-01-05 16:16:59'),
(45, 'Lake Catharineport', 10, '2022-01-05 16:16:59', '2022-01-05 16:16:59'),
(46, 'Bashirianmouth', 2, '2022-01-05 16:16:59', '2022-01-05 16:16:59'),
(47, 'Satterfieldburgh', 2, '2022-01-05 16:16:59', '2022-01-05 16:16:59'),
(48, 'Serenabury', 9, '2022-01-05 16:16:59', '2022-01-05 16:16:59'),
(49, 'Marjolainetown', 4, '2022-01-05 16:16:59', '2022-01-05 16:16:59'),
(50, 'Beierville', 7, '2022-01-05 16:16:59', '2022-01-05 16:16:59'),
(51, 'Lake Emmanuelle', 8, '2022-01-05 16:16:59', '2022-01-05 16:16:59'),
(52, 'North Allanmouth', 10, '2022-01-05 16:16:59', '2022-01-05 16:16:59'),
(53, 'Lake Hildegardmouth', 8, '2022-01-05 16:16:59', '2022-01-05 16:16:59'),
(54, 'South Marceloburgh', 10, '2022-01-05 16:16:59', '2022-01-05 16:16:59'),
(55, 'East Bridgettefort', 5, '2022-01-05 16:16:59', '2022-01-05 16:16:59'),
(56, 'New Clementina', 5, '2022-01-05 16:16:59', '2022-01-05 16:16:59'),
(57, 'South Lunaberg', 10, '2022-01-05 16:16:59', '2022-01-05 16:16:59'),
(58, 'Port Jamaltown', 7, '2022-01-05 16:16:59', '2022-01-05 16:16:59'),
(59, 'Kulasfurt', 5, '2022-01-05 16:16:59', '2022-01-05 16:16:59'),
(60, 'Hesselville', 2, '2022-01-05 16:16:59', '2022-01-05 16:16:59'),
(61, 'Jessycachester', 7, '2022-01-05 16:16:59', '2022-01-05 16:16:59'),
(62, 'West Dariusshire', 9, '2022-01-05 16:16:59', '2022-01-05 16:16:59'),
(63, 'Port Lennie', 5, '2022-01-05 16:16:59', '2022-01-05 16:16:59'),
(64, 'Lockmanberg', 9, '2022-01-05 16:16:59', '2022-01-05 16:16:59'),
(65, 'South Donnaside', 6, '2022-01-05 16:16:59', '2022-01-05 16:16:59'),
(66, 'Lake Clotilde', 7, '2022-01-05 16:16:59', '2022-01-05 16:16:59'),
(67, 'Geovannytown', 10, '2022-01-05 16:16:59', '2022-01-05 16:16:59'),
(68, 'Port Valeriestad', 3, '2022-01-05 16:16:59', '2022-01-05 16:16:59'),
(69, 'Jacobiberg', 6, '2022-01-05 16:16:59', '2022-01-05 16:16:59'),
(70, 'Wiegandmouth', 6, '2022-01-05 16:16:59', '2022-01-05 16:16:59'),
(71, 'New Kathleen', 7, '2022-01-05 16:16:59', '2022-01-05 16:16:59'),
(72, 'Luisaville', 1, '2022-01-05 16:16:59', '2022-01-05 16:16:59'),
(73, 'Botsfordport', 9, '2022-01-05 16:16:59', '2022-01-05 16:16:59'),
(74, 'Port Jamirside', 9, '2022-01-05 16:16:59', '2022-01-05 16:16:59'),
(75, 'Devantetown', 8, '2022-01-05 16:16:59', '2022-01-05 16:16:59'),
(76, 'Smithamshire', 5, '2022-01-05 16:16:59', '2022-01-05 16:16:59'),
(77, 'South Caden', 2, '2022-01-05 16:16:59', '2022-01-05 16:16:59'),
(78, 'Delphineland', 8, '2022-01-05 16:16:59', '2022-01-05 16:16:59'),
(79, 'North Queen', 4, '2022-01-05 16:16:59', '2022-01-05 16:16:59'),
(80, 'Brownhaven', 2, '2022-01-05 16:16:59', '2022-01-05 16:16:59'),
(81, 'New Nikoview', 8, '2022-01-05 16:16:59', '2022-01-05 16:16:59'),
(82, 'Schultzburgh', 5, '2022-01-05 16:16:59', '2022-01-05 16:16:59'),
(83, 'West Bridgette', 6, '2022-01-05 16:16:59', '2022-01-05 16:16:59'),
(84, 'Lolitafort', 2, '2022-01-05 16:16:59', '2022-01-05 16:16:59'),
(85, 'Stanleymouth', 3, '2022-01-05 16:16:59', '2022-01-05 16:16:59'),
(86, 'New Emilio', 5, '2022-01-05 16:16:59', '2022-01-05 16:16:59'),
(87, 'Lake Chaya', 8, '2022-01-05 16:16:59', '2022-01-05 16:16:59'),
(88, 'Denesikchester', 9, '2022-01-05 16:16:59', '2022-01-05 16:16:59'),
(89, 'East Annabelle', 10, '2022-01-05 16:16:59', '2022-01-05 16:16:59'),
(90, 'South Terrence', 3, '2022-01-05 16:16:59', '2022-01-05 16:16:59'),
(91, 'Lake Sylvia', 6, '2022-01-05 16:16:59', '2022-01-05 16:16:59'),
(92, 'Windlerstad', 5, '2022-01-05 16:16:59', '2022-01-05 16:16:59'),
(93, 'South Yasmeen', 3, '2022-01-05 16:16:59', '2022-01-05 16:16:59'),
(94, 'Kieramouth', 3, '2022-01-05 16:16:59', '2022-01-05 16:16:59'),
(95, 'Martafurt', 10, '2022-01-05 16:16:59', '2022-01-05 16:16:59'),
(96, 'Yundtstad', 5, '2022-01-05 16:16:59', '2022-01-05 16:16:59'),
(97, 'East Alexanneshire', 5, '2022-01-05 16:16:59', '2022-01-05 16:16:59'),
(98, 'South Glennie', 8, '2022-01-05 16:16:59', '2022-01-05 16:16:59'),
(99, 'Betsystad', 10, '2022-01-05 16:16:59', '2022-01-05 16:16:59'),
(100, 'Destinyburgh', 5, '2022-01-05 16:16:59', '2022-01-05 16:16:59'),
(101, 'Mayertbury', 6, '2022-01-05 16:16:59', '2022-01-05 16:16:59'),
(102, 'Hayleyberg', 1, '2022-01-05 16:16:59', '2022-01-05 16:16:59'),
(103, 'Kuhnhaven', 5, '2022-01-05 16:16:59', '2022-01-05 16:16:59'),
(104, 'Kuphalside', 9, '2022-01-05 16:16:59', '2022-01-05 16:16:59'),
(105, 'Paulaside', 1, '2022-01-05 16:16:59', '2022-01-05 16:16:59'),
(106, 'North Osbornehaven', 7, '2022-01-05 16:16:59', '2022-01-05 16:16:59'),
(107, 'South Kristytown', 7, '2022-01-05 16:16:59', '2022-01-05 16:16:59'),
(108, 'Langshire', 6, '2022-01-05 16:16:59', '2022-01-05 16:16:59'),
(109, 'East Vickie', 9, '2022-01-05 16:16:59', '2022-01-05 16:16:59'),
(110, 'Lake Domenicaport', 1, '2022-01-05 16:16:59', '2022-01-05 16:16:59'),
(111, 'Bahringermouth', 3, '2022-01-05 16:16:59', '2022-01-05 16:16:59'),
(112, 'West Wyattmouth', 6, '2022-01-05 16:16:59', '2022-01-05 16:16:59'),
(113, 'North Jillian', 3, '2022-01-05 16:16:59', '2022-01-05 16:16:59'),
(114, 'Bergstromstad', 2, '2022-01-05 16:16:59', '2022-01-05 16:16:59'),
(115, 'Wolfhaven', 2, '2022-01-05 16:16:59', '2022-01-05 16:16:59'),
(116, 'South Alexandrinemouth', 4, '2022-01-05 16:16:59', '2022-01-05 16:16:59'),
(117, 'Freddieland', 8, '2022-01-05 16:16:59', '2022-01-05 16:16:59'),
(118, 'East Lelah', 4, '2022-01-05 16:16:59', '2022-01-05 16:16:59'),
(119, 'East Hailee', 9, '2022-01-05 16:16:59', '2022-01-05 16:16:59'),
(120, 'Sammyland', 4, '2022-01-05 16:16:59', '2022-01-05 16:16:59'),
(121, 'East Myrtie', 8, '2022-01-05 16:16:59', '2022-01-05 16:16:59'),
(122, 'Saraiview', 6, '2022-01-05 16:16:59', '2022-01-05 16:16:59'),
(123, 'East Budbury', 9, '2022-01-05 16:16:59', '2022-01-05 16:16:59'),
(124, 'Lake Donnaland', 1, '2022-01-05 16:16:59', '2022-01-05 16:16:59'),
(125, 'North Brennanbury', 7, '2022-01-05 16:16:59', '2022-01-05 16:16:59'),
(126, 'South Amiyastad', 3, '2022-01-05 16:16:59', '2022-01-05 16:16:59'),
(127, 'Nakiaside', 10, '2022-01-05 16:16:59', '2022-01-05 16:16:59'),
(128, 'South Alvis', 10, '2022-01-05 16:16:59', '2022-01-05 16:16:59'),
(129, 'Lockmanmouth', 5, '2022-01-05 16:16:59', '2022-01-05 16:16:59'),
(130, 'Greenfelderton', 4, '2022-01-05 16:16:59', '2022-01-05 16:16:59'),
(131, 'East Darwin', 10, '2022-01-05 16:16:59', '2022-01-05 16:16:59'),
(132, 'Port Suzanne', 8, '2022-01-05 16:16:59', '2022-01-05 16:16:59'),
(133, 'Port Milo', 8, '2022-01-05 16:16:59', '2022-01-05 16:16:59'),
(134, 'New Chase', 8, '2022-01-05 16:16:59', '2022-01-05 16:16:59'),
(135, 'Brantstad', 7, '2022-01-05 16:16:59', '2022-01-05 16:16:59'),
(136, 'Murraymouth', 10, '2022-01-05 16:16:59', '2022-01-05 16:16:59'),
(137, 'North Germainefort', 6, '2022-01-05 16:16:59', '2022-01-05 16:16:59'),
(138, 'North Geraldinebury', 5, '2022-01-05 16:16:59', '2022-01-05 16:16:59'),
(139, 'Aliyahaven', 4, '2022-01-05 16:16:59', '2022-01-05 16:16:59'),
(140, 'Retaberg', 3, '2022-01-05 16:16:59', '2022-01-05 16:16:59'),
(141, 'New Casimer', 2, '2022-01-05 16:16:59', '2022-01-05 16:16:59'),
(142, 'West Helenburgh', 2, '2022-01-05 16:16:59', '2022-01-05 16:16:59'),
(143, 'Goodwinhaven', 4, '2022-01-05 16:16:59', '2022-01-05 16:16:59'),
(144, 'West Kelton', 5, '2022-01-05 16:16:59', '2022-01-05 16:16:59'),
(145, 'New Odie', 4, '2022-01-05 16:16:59', '2022-01-05 16:16:59'),
(146, 'Haneville', 3, '2022-01-05 16:16:59', '2022-01-05 16:16:59'),
(147, 'Henrihaven', 8, '2022-01-05 16:16:59', '2022-01-05 16:16:59'),
(148, 'Maximusside', 5, '2022-01-05 16:16:59', '2022-01-05 16:16:59'),
(149, 'Port Cory', 7, '2022-01-05 16:16:59', '2022-01-05 16:16:59'),
(150, 'Vanceshire', 1, '2022-01-05 16:16:59', '2022-01-05 16:16:59'),
(151, 'Fadelshire', 4, '2022-01-05 16:16:59', '2022-01-05 16:16:59'),
(152, 'South Alicia', 3, '2022-01-05 16:16:59', '2022-01-05 16:16:59'),
(153, 'Port Bridget', 4, '2022-01-05 16:16:59', '2022-01-05 16:16:59'),
(154, 'Simton', 1, '2022-01-05 16:16:59', '2022-01-05 16:16:59'),
(155, 'Krystinaland', 8, '2022-01-05 16:16:59', '2022-01-05 16:16:59'),
(156, 'Windlerfurt', 2, '2022-01-05 16:16:59', '2022-01-05 16:16:59'),
(157, 'Blickfort', 8, '2022-01-05 16:16:59', '2022-01-05 16:16:59'),
(158, 'North Casimer', 2, '2022-01-05 16:16:59', '2022-01-05 16:16:59'),
(159, 'Rigobertoview', 5, '2022-01-05 16:16:59', '2022-01-05 16:16:59'),
(160, 'Rosellaside', 4, '2022-01-05 16:16:59', '2022-01-05 16:16:59'),
(161, 'Hannahfurt', 6, '2022-01-05 16:16:59', '2022-01-05 16:16:59'),
(162, 'Citlallibury', 7, '2022-01-05 16:16:59', '2022-01-05 16:16:59'),
(163, 'Townehaven', 4, '2022-01-05 16:16:59', '2022-01-05 16:16:59'),
(164, 'West Krystelhaven', 1, '2022-01-05 16:16:59', '2022-01-05 16:16:59'),
(165, 'Bernadineport', 3, '2022-01-05 16:16:59', '2022-01-05 16:16:59'),
(166, 'North Jany', 7, '2022-01-05 16:16:59', '2022-01-05 16:16:59'),
(167, 'North Tyrell', 9, '2022-01-05 16:16:59', '2022-01-05 16:16:59'),
(168, 'Bradtkebury', 4, '2022-01-05 16:16:59', '2022-01-05 16:16:59'),
(169, 'Sengerport', 7, '2022-01-05 16:16:59', '2022-01-05 16:16:59'),
(170, 'West Jarred', 5, '2022-01-05 16:16:59', '2022-01-05 16:16:59'),
(171, 'Lake Daijaville', 8, '2022-01-05 16:16:59', '2022-01-05 16:16:59'),
(172, 'West Jessicaport', 7, '2022-01-05 16:16:59', '2022-01-05 16:16:59'),
(173, 'North Eliseoborough', 10, '2022-01-05 16:16:59', '2022-01-05 16:16:59'),
(174, 'South Rebekabury', 6, '2022-01-05 16:16:59', '2022-01-05 16:16:59'),
(175, 'Port Stephanfort', 5, '2022-01-05 16:16:59', '2022-01-05 16:16:59'),
(176, 'Mitchelltown', 2, '2022-01-05 16:16:59', '2022-01-05 16:16:59'),
(177, 'North Jordane', 3, '2022-01-05 16:16:59', '2022-01-05 16:16:59'),
(178, 'Port Beulahfort', 6, '2022-01-05 16:16:59', '2022-01-05 16:16:59'),
(179, 'Houstonfurt', 2, '2022-01-05 16:16:59', '2022-01-05 16:16:59'),
(180, 'Koleport', 1, '2022-01-05 16:16:59', '2022-01-05 16:16:59'),
(181, 'West Amarifort', 4, '2022-01-05 16:16:59', '2022-01-05 16:16:59'),
(182, 'New Maurice', 4, '2022-01-05 16:16:59', '2022-01-05 16:16:59'),
(183, 'Florineview', 8, '2022-01-05 16:16:59', '2022-01-05 16:16:59'),
(184, 'East Gerardohaven', 5, '2022-01-05 16:16:59', '2022-01-05 16:16:59'),
(185, 'New Gracieport', 9, '2022-01-05 16:16:59', '2022-01-05 16:16:59'),
(186, 'South Prudencehaven', 3, '2022-01-05 16:16:59', '2022-01-05 16:16:59'),
(187, 'Lake Carroll', 10, '2022-01-05 16:16:59', '2022-01-05 16:16:59'),
(188, 'South Chrishaven', 6, '2022-01-05 16:16:59', '2022-01-05 16:16:59'),
(189, 'Lake Monteport', 1, '2022-01-05 16:16:59', '2022-01-05 16:16:59'),
(190, 'Kianmouth', 9, '2022-01-05 16:16:59', '2022-01-05 16:16:59'),
(191, 'Moniqueberg', 10, '2022-01-05 16:16:59', '2022-01-05 16:16:59'),
(192, 'Lowestad', 7, '2022-01-05 16:16:59', '2022-01-05 16:16:59'),
(193, 'Hollybury', 5, '2022-01-05 16:16:59', '2022-01-05 16:16:59'),
(194, 'Purdyview', 6, '2022-01-05 16:16:59', '2022-01-05 16:16:59'),
(195, 'Marinaville', 1, '2022-01-05 16:16:59', '2022-01-05 16:16:59'),
(196, 'Rickville', 6, '2022-01-05 16:16:59', '2022-01-05 16:16:59'),
(197, 'McDermottview', 6, '2022-01-05 16:16:59', '2022-01-05 16:16:59'),
(198, 'Boganmouth', 9, '2022-01-05 16:16:59', '2022-01-05 16:16:59'),
(199, 'Delbertview', 8, '2022-01-05 16:16:59', '2022-01-05 16:16:59'),
(200, 'Milanport', 2, '2022-01-05 16:16:59', '2022-01-05 16:16:59');

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Niger', '2022-01-05 16:16:58', '2022-01-05 16:16:58'),
(2, 'Barbados', '2022-01-05 16:16:58', '2022-01-05 16:16:58'),
(3, 'Finland', '2022-01-05 16:16:58', '2022-01-05 16:16:58'),
(4, 'Western Sahara', '2022-01-05 16:16:58', '2022-01-05 16:16:58'),
(5, 'Chile', '2022-01-05 16:16:58', '2022-01-05 16:16:58'),
(6, 'Israel', '2022-01-05 16:16:58', '2022-01-05 16:16:58'),
(7, 'Uruguay', '2022-01-05 16:16:58', '2022-01-05 16:16:58'),
(8, 'Somalia', '2022-01-05 16:16:58', '2022-01-05 16:16:58'),
(9, 'Trinidad and Tobago', '2022-01-05 16:16:58', '2022-01-05 16:16:58'),
(10, 'Tokelau', '2022-01-05 16:16:58', '2022-01-05 16:16:58');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2021_07_23_141700_create_cars_table', 1),
(3, '2022_01_05_170441_create_countries_table', 2),
(4, '2022_01_05_170516_create_cities_table', 2),
(6, '2022_01_12_153611_add_city_column_to_cars_table', 3);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `email`, `phone`, `created_at`, `updated_at`) VALUES
(4, 'Prof. Marvin Shanahan PhD', 'Brekkesimn', 'russel.bethel@example.net', '800-716-5663', '2021-07-23 21:34:37', '2022-01-12 16:04:45'),
(5, 'Prof. Dolores Hauc', 'Forenter', 'schiller.rodolfo@example.org', '(844) 430-0573', '2021-07-23 21:34:37', '2022-01-12 16:03:31'),
(6, 'Prof. Moises Schamberger', 'Erdman', 'kozey.june@example.org', '(844) 591-3530', '2021-07-23 21:34:37', '2021-07-23 21:34:37'),
(7, 'Geoffrey Dietrich', 'Ziemann', 'rodolfo35@example.net', '(844) 703-2549', '2021-07-23 21:34:37', '2021-07-23 21:34:37'),
(8, 'Stephania Schroeder', 'Pfannerstill', 'florence67@example.com', '800-346-8693', '2021-07-23 21:34:37', '2021-07-23 21:34:37'),
(9, 'Shayna Weber', 'Kassulke', 'maye38@example.net', '1-844-448-2238', '2021-07-23 21:34:37', '2021-07-23 21:34:37'),
(10, 'Kevin Wyman', 'Howe', 'rhayes@example.com', '(888) 754-6239', '2021-07-23 21:34:37', '2021-07-23 21:34:37');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cars`
--
ALTER TABLE `cars`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cars_user_id_foreign` (`user_id`),
  ADD KEY `cars_city_id_foreign` (`city_id`);

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cities_country_id_foreign` (`country_id`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cars`
--
ALTER TABLE `cars`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=201;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cars`
--
ALTER TABLE `cars`
  ADD CONSTRAINT `cars_city_id_foreign` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`),
  ADD CONSTRAINT `cars_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `cities`
--
ALTER TABLE `cities`
  ADD CONSTRAINT `cities_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
