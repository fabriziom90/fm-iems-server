-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Creato il: Dic 02, 2024 alle 17:28
-- Versione del server: 8.0.33
-- Versione PHP: 8.2.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `fm-iems-database-test`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `exits`
--

CREATE TABLE `exits` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL DEFAULT '22',
  `year_id` bigint UNSIGNED NOT NULL,
  `month_id` bigint UNSIGNED NOT NULL,
  `value` double(8,2) NOT NULL,
  `customer` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dump dei dati per la tabella `exits`
--

INSERT INTO `exits` (`id`, `user_id`, `year_id`, `month_id`, `value`, `customer`, `created_at`, `updated_at`) VALUES
(2, 1, 2, 8, 1816.04, 'Jacobi, Willms and Armstrong', '2024-11-08 08:48:13', '2024-11-08 08:48:13'),
(3, 1, 2, 5, 1819.59, 'Murazik, Beatty and Hodkiewicz', '2024-11-08 08:48:13', '2024-11-08 08:48:13'),
(4, 1, 1, 3, 3726.83, 'Torphy PLC', '2024-11-08 08:48:13', '2024-11-08 08:48:13'),
(7, 1, 1, 4, 1576.45, 'Wisozk, Adams and Beahan', '2024-11-08 08:48:13', '2024-11-08 08:48:13'),
(8, 1, 2, 2, 1383.62, 'Erdman-Romaguera', '2024-11-08 08:48:13', '2024-11-08 08:48:13'),
(9, 1, 1, 1, 1499.54, 'Ruecker, Strosin and Bode', '2024-11-08 08:48:13', '2024-11-08 08:48:13'),
(11, 1, 2, 6, 592.43, 'Shanahan-Walter', '2024-11-08 08:48:13', '2024-11-08 08:48:13'),
(12, 1, 2, 4, 3109.29, 'Ryan, Welch and Toy', '2024-11-08 08:48:13', '2024-11-08 08:48:13'),
(13, 1, 2, 10, 383.26, 'Schulist Ltd', '2024-11-08 08:48:13', '2024-11-08 08:48:13'),
(15, 1, 2, 10, 3131.35, 'Eichmann, Herzog and Turcotte', '2024-11-08 08:48:13', '2024-11-08 08:48:13'),
(17, 1, 1, 8, 1000.00, 'Test modifica uscita', '2024-11-08 08:48:13', '2024-11-08 08:48:13'),
(18, 1, 2, 10, 3670.70, 'Lakin-Watsica', '2024-11-08 08:48:13', '2024-11-08 08:48:13'),
(20, 1, 1, 5, 3749.15, 'Schuppe, Waelchi and Grady', '2024-11-08 08:48:13', '2024-11-08 08:48:13'),
(82, 1, 31, 2, 3269.24, 'Kling, Wiza and Hodkiewicz', '2024-11-25 09:37:04', '2024-11-25 09:37:04'),
(83, 1, 31, 2, 1667.95, 'O\'Connell-Bradtke', '2024-11-25 09:37:04', '2024-11-25 09:37:04'),
(84, 1, 31, 8, 2805.63, 'Pacocha LLC', '2024-11-25 09:37:04', '2024-11-25 09:37:04'),
(85, 1, 31, 3, 1741.59, 'Reichel Ltd', '2024-11-25 09:37:04', '2024-11-25 09:37:04'),
(86, 1, 31, 2, 670.83, 'Mante PLC', '2024-11-25 09:37:04', '2024-11-25 09:37:04'),
(87, 1, 31, 10, 2801.31, 'Witting and Sons', '2024-11-25 09:37:04', '2024-11-25 09:37:04'),
(88, 1, 31, 9, 760.46, 'Muller, Larkin and Rempel', '2024-11-25 09:37:04', '2024-11-25 09:37:04'),
(89, 1, 31, 9, 1364.95, 'Botsford Inc', '2024-11-25 09:37:04', '2024-11-25 09:37:04'),
(90, 1, 31, 3, 536.19, 'Gorczany, Howell and Franecki', '2024-11-25 09:37:04', '2024-11-25 09:37:04'),
(91, 1, 31, 3, 3590.32, 'Reinger PLC', '2024-11-25 09:37:04', '2024-11-25 09:37:04'),
(92, 1, 31, 10, 1171.57, 'Kozey-Auer', '2024-11-25 09:37:04', '2024-11-25 09:37:04'),
(93, 1, 31, 1, 3316.52, 'Wintheiser-Casper', '2024-11-25 09:37:04', '2024-11-25 09:37:04'),
(94, 1, 31, 2, 3289.33, 'Hand and Sons', '2024-11-25 09:37:04', '2024-11-25 09:37:04'),
(95, 1, 31, 9, 2462.00, 'Grady, Dare and Feil', '2024-11-25 09:37:04', '2024-11-25 09:37:04'),
(96, 1, 31, 4, 2948.44, 'Ziemann PLC', '2024-11-25 09:37:04', '2024-11-25 09:37:04'),
(97, 1, 31, 1, 508.55, 'Treutel LLC', '2024-11-25 09:37:04', '2024-11-25 09:37:04'),
(98, 1, 31, 9, 3650.92, 'Blick, Kunde and Miller', '2024-11-25 09:37:04', '2024-11-25 09:37:04'),
(99, 1, 31, 4, 1238.93, 'Kling-Lang', '2024-11-25 09:37:04', '2024-11-25 09:37:04'),
(100, 1, 31, 3, 657.07, 'Weissnat Group', '2024-11-25 09:37:04', '2024-11-25 09:37:04'),
(101, 1, 31, 5, 703.52, 'Hahn, O\'Connell and Dibbert', '2024-11-25 09:37:04', '2024-11-25 09:37:04'),
(104, 1, 42, 1, 500.00, 'test uscita 1', '2024-12-02 14:49:52', '2024-12-02 14:49:52'),
(105, 1, 42, 2, 600.00, 'Test uscita 2', '2024-12-02 14:50:09', '2024-12-02 14:50:09'),
(106, 1, 42, 3, 400.00, 'Test uscita 3', '2024-12-02 14:50:26', '2024-12-02 14:50:26');

-- --------------------------------------------------------

--
-- Struttura della tabella `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `incomes`
--

CREATE TABLE `incomes` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL DEFAULT '22',
  `year_id` bigint UNSIGNED NOT NULL,
  `month_id` bigint UNSIGNED NOT NULL,
  `value` double(8,2) NOT NULL,
  `customer` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dump dei dati per la tabella `incomes`
--

INSERT INTO `incomes` (`id`, `user_id`, `year_id`, `month_id`, `value`, `customer`, `created_at`, `updated_at`) VALUES
(2, 1, 1, 3, 3876.26, 'Predovic, Bernier and Wiegand', '2024-11-08 08:45:58', '2024-11-08 08:45:58'),
(3, 1, 2, 7, 3450.72, 'Gorczany Ltd', '2024-11-08 08:45:58', '2024-11-08 08:45:58'),
(8, 1, 1, 2, 1000.00, 'Test modifica entrata 2', '2024-11-08 08:45:58', '2024-11-08 08:45:58'),
(10, 1, 1, 6, 3571.06, 'Gorczany, Wolf and Crona', '2024-11-08 08:45:58', '2024-11-08 08:45:58'),
(11, 1, 2, 5, 2780.79, 'Wunsch, Kohler and Hermiston', '2024-11-08 08:45:58', '2024-11-08 08:45:58'),
(12, 1, 2, 5, 3145.89, 'Bartell, Bruen and Padberg', '2024-11-08 08:45:58', '2024-11-08 08:45:58'),
(13, 1, 2, 7, 575.00, 'Barrows-Boehm', '2024-11-08 08:45:58', '2024-11-08 08:45:58'),
(14, 1, 2, 8, 1162.04, 'Jerde-Hilpert', '2024-11-08 08:45:58', '2024-11-08 08:45:58'),
(16, 1, 2, 6, 2987.55, 'Schumm PLC', '2024-11-08 08:45:58', '2024-11-08 08:45:58'),
(17, 1, 2, 2, 3619.69, 'Hahn Ltd', '2024-11-08 08:45:58', '2024-11-08 08:45:58'),
(19, 1, 2, 6, 2164.20, 'Schinner-Considine', '2024-11-08 08:45:58', '2024-11-08 08:45:58'),
(20, 1, 1, 2, 3837.66, 'Littel Group', '2024-11-08 08:45:58', '2024-11-08 08:45:58'),
(21, 1, 2, 8, 2465.77, 'Heathcote, Legros and Streich', '2024-11-08 08:45:58', '2024-11-08 08:45:58'),
(22, 1, 2, 10, 1567.78, 'Goodwin and Sons', '2024-11-08 08:48:34', '2024-11-08 08:48:34'),
(24, 1, 2, 4, 195.71, 'Ferry-Smitham', '2024-11-08 08:48:34', '2024-11-08 08:48:34'),
(25, 1, 2, 7, 2593.36, 'Stark Group', '2024-11-08 08:48:34', '2024-11-08 08:48:34'),
(26, 1, 2, 8, 2542.32, 'Strosin PLC', '2024-11-08 08:48:34', '2024-11-08 08:48:34'),
(28, 1, 1, 1, 1300.76, 'Lemke, Heidenreich and Harris', '2024-11-08 08:48:34', '2024-11-08 08:48:34'),
(30, 1, 2, 10, 3502.62, 'Carter, Monahan and Waters', '2024-11-08 08:48:34', '2024-11-08 08:48:34'),
(32, 1, 1, 2, 2956.24, 'Greenholt PLC', '2024-11-08 08:48:34', '2024-11-08 08:48:34'),
(33, 1, 2, 1, 2418.53, 'Keeling-Daugherty', '2024-11-08 08:48:34', '2024-11-08 08:48:34'),
(34, 1, 1, 7, 5000.00, 'Test modifica entrata', '2024-11-08 08:48:34', '2024-11-08 08:48:34'),
(35, 1, 1, 4, 3000.00, 'test modifica entrata', '2024-11-08 08:48:34', '2024-11-08 08:48:34'),
(38, 1, 1, 1, 2402.42, 'Heidenreich, Stokes and Bogisich', '2024-11-08 08:48:34', '2024-11-08 08:48:34'),
(39, 1, 2, 4, 3342.25, 'Lindgren Inc', '2024-11-08 08:48:34', '2024-11-08 08:48:34'),
(103, 1, 31, 12, 3880.03, 'Schumm, Daniel and West', '2024-11-25 09:36:58', '2024-11-25 09:36:58'),
(104, 1, 31, 7, 1921.12, 'Dooley-Pfannerstill', '2024-11-25 09:36:58', '2024-11-25 09:36:58'),
(105, 1, 31, 10, 3015.60, 'McClure, Dach and Kuhic', '2024-11-25 09:36:58', '2024-11-25 09:36:58'),
(106, 1, 31, 7, 2261.72, 'Cassin, Bashirian and Cummings', '2024-11-25 09:36:58', '2024-11-25 09:36:58'),
(107, 1, 31, 11, 3325.66, 'Kling Inc', '2024-11-25 09:36:58', '2024-11-25 09:36:58'),
(108, 1, 31, 5, 2618.75, 'McGlynn-Brakus', '2024-11-25 09:36:58', '2024-11-25 09:36:58'),
(109, 1, 31, 4, 2047.22, 'Botsford, Fahey and McCullough', '2024-11-25 09:36:58', '2024-11-25 09:36:58'),
(110, 1, 31, 5, 2162.65, 'Abernathy-Howe', '2024-11-25 09:36:58', '2024-11-25 09:36:58'),
(111, 1, 31, 3, 3573.32, 'Conroy and Sons', '2024-11-25 09:36:58', '2024-11-25 09:36:58'),
(112, 1, 31, 10, 3503.88, 'Connelly, Zieme and Torp', '2024-11-25 09:36:58', '2024-11-25 09:36:58'),
(113, 1, 31, 3, 632.07, 'Rath-Muller', '2024-11-25 09:36:58', '2024-11-25 09:36:58'),
(114, 1, 31, 1, 1541.25, 'Mraz, Bechtelar and O\'Hara', '2024-11-25 09:36:58', '2024-11-25 09:36:58'),
(115, 1, 31, 5, 981.18, 'Jacobi, Gislason and Turcotte', '2024-11-25 09:36:58', '2024-11-25 09:36:58'),
(116, 1, 31, 12, 3047.14, 'Sauer, McDermott and Wiegand', '2024-11-25 09:36:58', '2024-11-25 09:36:58'),
(117, 1, 31, 6, 1718.35, 'Legros Inc', '2024-11-25 09:36:58', '2024-11-25 09:36:58'),
(118, 1, 31, 8, 3397.60, 'Rau-Ferry', '2024-11-25 09:36:58', '2024-11-25 09:36:58'),
(119, 1, 31, 6, 690.21, 'Simonis, Kohler and Ratke', '2024-11-25 09:36:58', '2024-11-25 09:36:58'),
(120, 1, 31, 12, 3477.87, 'Mayert, Sporer and Hill', '2024-11-25 09:36:58', '2024-11-25 09:36:58'),
(121, 1, 31, 3, 273.70, 'Metz Group', '2024-11-25 09:36:58', '2024-11-25 09:36:58'),
(122, 1, 31, 5, 2273.79, 'Goyette Group', '2024-11-25 09:36:58', '2024-11-25 09:36:58'),
(125, 1, 42, 1, 1500.00, 'Test entrata 1', '2024-12-02 14:48:40', '2024-12-02 14:48:40'),
(126, 1, 42, 2, 1000.00, 'Test entrata 2', '2024-12-02 14:48:59', '2024-12-02 14:48:59'),
(127, 1, 42, 4, 5000.00, 'Test entrata 3', '2024-12-02 14:49:19', '2024-12-02 14:49:19');

-- --------------------------------------------------------

--
-- Struttura della tabella `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dump dei dati per la tabella `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2024_08_17_151247_create_months_table', 1),
(6, '2024_08_17_151310_create_years_table', 1),
(7, '2024_08_17_154207_create_month_year_table', 1),
(8, '2024_08_18_094340_create_incomes_table', 1),
(9, '2024_08_18_095054_create_income_month_table', 1),
(10, '2024_08_18_095152_update_months_table', 1),
(11, '2024_08_18_101043_create_exits_table', 1),
(12, '2024_08_21_172420_update_exits_table', 1),
(13, '2024_08_21_172539_update_incomes_table', 1),
(14, '2024_11_04_141540_add_fk_user_incomes_table', 1),
(15, '2024_11_04_142248_add_fk_user_incomes_table', 1),
(16, '2024_11_04_142538_add_fk_user_incomes_table', 1),
(17, '2024_11_27_095634_add_column_to_years_table', 2);

-- --------------------------------------------------------

--
-- Struttura della tabella `months`
--

CREATE TABLE `months` (
  `id` bigint UNSIGNED NOT NULL,
  `month_name` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `month_number` tinyint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dump dei dati per la tabella `months`
--

INSERT INTO `months` (`id`, `month_name`, `created_at`, `updated_at`, `month_number`) VALUES
(1, 'Gennaio', '2024-11-08 08:45:52', '2024-11-08 08:45:52', 1),
(2, 'Febbraio', '2024-11-08 08:45:52', '2024-11-08 08:45:52', 2),
(3, 'Marzo', '2024-11-08 08:45:52', '2024-11-08 08:45:52', 3),
(4, 'Aprile', '2024-11-08 08:45:52', '2024-11-08 08:45:52', 4),
(5, 'Maggio', '2024-11-08 08:45:52', '2024-11-08 08:45:52', 5),
(6, 'Giugno', '2024-11-08 08:45:52', '2024-11-08 08:45:52', 6),
(7, 'Luglio', '2024-11-08 08:45:52', '2024-11-08 08:45:52', 7),
(8, 'Agosto', '2024-11-08 08:45:52', '2024-11-08 08:45:52', 8),
(9, 'Settembre', '2024-11-08 08:45:52', '2024-11-08 08:45:52', 9),
(10, 'Ottobre', '2024-11-08 08:45:52', '2024-11-08 08:45:52', 10),
(11, 'Novembre', '2024-11-08 08:45:52', '2024-11-08 08:45:52', 11),
(12, 'Dicembre', '2024-11-08 08:45:52', '2024-11-08 08:45:52', 12);

-- --------------------------------------------------------

--
-- Struttura della tabella `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dump dei dati per la tabella `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES

-- --------------------------------------------------------

--
-- Struttura della tabella `years`
--

CREATE TABLE `years` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `year` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dump dei dati per la tabella `years`
--

INSERT INTO `years` (`id`, `user_id`, `year`, `created_at`, `updated_at`) VALUES
(1, 1, 2024, '2024-11-08 08:33:39', '2024-11-08 08:33:39'),
(2, 7, 2023, '2024-11-08 08:33:39', '2024-11-08 08:33:39'),
(31, 1, 2022, '2024-11-25 09:29:15', '2024-11-25 09:29:15'),
(37, 1, 2023, '2024-11-29 09:25:31', '2024-11-29 09:25:31'),
(41, 1, 2021, '2024-12-02 14:47:10', '2024-12-02 14:47:10'),
(42, 1, 2020, '2024-12-02 14:48:21', '2024-12-02 14:48:21');

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `exits`
--
ALTER TABLE `exits`
  ADD PRIMARY KEY (`id`),
  ADD KEY `exits_year_id_foreign` (`year_id`),
  ADD KEY `exits_month_id_foreign` (`month_id`),
  ADD KEY `exits_user_id_foreign` (`user_id`);

--
-- Indici per le tabelle `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indici per le tabelle `incomes`
--
ALTER TABLE `incomes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `incomes_year_id_foreign` (`year_id`),
  ADD KEY `incomes_month_id_foreign` (`month_id`),
  ADD KEY `incomes_user_id_foreign` (`user_id`);

--
-- Indici per le tabelle `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `months`
--
ALTER TABLE `months`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indici per le tabelle `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indici per le tabelle `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indici per le tabelle `years`
--
ALTER TABLE `years`
  ADD PRIMARY KEY (`id`),
  ADD KEY `years_user_id_foreign` (`user_id`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `exits`
--
ALTER TABLE `exits`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=107;

--
-- AUTO_INCREMENT per la tabella `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `incomes`
--
ALTER TABLE `incomes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=128;

--
-- AUTO_INCREMENT per la tabella `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT per la tabella `months`
--
ALTER TABLE `months`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT per la tabella `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT per la tabella `years`
--
ALTER TABLE `years`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `exits`
--
ALTER TABLE `exits`
  ADD CONSTRAINT `exits_month_id_foreign` FOREIGN KEY (`month_id`) REFERENCES `months` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `exits_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `exits_year_id_foreign` FOREIGN KEY (`year_id`) REFERENCES `years` (`id`) ON DELETE CASCADE;

--
-- Limiti per la tabella `incomes`
--
ALTER TABLE `incomes`
  ADD CONSTRAINT `incomes_month_id_foreign` FOREIGN KEY (`month_id`) REFERENCES `months` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `incomes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `incomes_year_id_foreign` FOREIGN KEY (`year_id`) REFERENCES `years` (`id`) ON DELETE CASCADE;

--
-- Limiti per la tabella `years`
--
ALTER TABLE `years`
  ADD CONSTRAINT `years_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
