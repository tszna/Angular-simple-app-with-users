-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 05, 2021 at 04:05 PM
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
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cars`
--

INSERT INTO `cars` (`id`, `user_id`, `brand`, `model`, `year_of_premiere`, `created_at`, `updated_at`) VALUES
(2, 7, 'Audi', '80', '1996', '2021-07-24 08:08:38', '2021-07-24 08:08:38'),
(3, 9, 'Volkswagen', 'Passat', '2000', '2021-07-24 08:11:44', '2021-07-24 08:11:44'),
(4, 9, 'Volkswagen', 'Polo', '2000', '2021-07-24 08:11:52', '2021-07-24 08:11:52'),
(5, 4, 'BMW', 'Lincol', '1900', '2021-07-24 08:14:13', '2021-07-24 08:14:13'),
(6, 7, 'Seat', 'leon', '2000', '2021-07-24 08:14:53', '2021-07-24 08:14:53'),
(7, 6, 'rover', 'Lila', '2012', '2021-07-24 19:43:43', '2021-07-24 19:43:43'),
(8, 9, 'linux', 'nati', '2003', '2021-07-26 15:42:15', '2021-07-26 15:42:15'),
(9, 8, 'Audi', 'cba', '1999', '2021-07-30 13:15:43', '2021-07-30 13:15:43'),
(10, 6, 'Audi', 'Cira', '1996', '2021-11-18 14:29:46', '2021-11-18 14:29:46');

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
(2, '2021_07_23_232156_create_cars_table', 1);

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
(4, 'Prof. Marvin Shanahan PhD', 'Brekke', 'russel.bethel@example.net', '800-716-5663', '2021-07-23 21:34:37', '2021-07-23 21:34:37'),
(5, 'Prof. Dolores Hauck', 'Reinger', 'schiller.rodolfo@example.org', '(844) 430-0573', '2021-07-23 21:34:37', '2021-07-23 21:34:37'),
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
  ADD KEY `cars_user_id_foreign` (`user_id`);

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
  ADD CONSTRAINT `cars_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
