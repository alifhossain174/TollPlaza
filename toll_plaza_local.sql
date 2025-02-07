-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 07, 2025 at 09:29 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `toll_plaza`
--

-- --------------------------------------------------------

--
-- Table structure for table `counters`
--

CREATE TABLE `counters` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `terminal_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `counters`
--

INSERT INTO `counters` (`id`, `terminal_id`, `name`, `description`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'Counter-1', 'Counter No 1', '17387939354LBwC', 1, '2025-02-06 03:18:55', '2025-02-06 03:37:45'),
(3, 1, 'Counter-2', 'Counter No 2', '1738795083CMK1M', 1, '2025-02-06 03:38:03', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `counter_sessions`
--

CREATE TABLE `counter_sessions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `terminal_id` bigint(20) UNSIGNED DEFAULT NULL,
  `terminal_name` varchar(255) DEFAULT NULL,
  `counter_id` bigint(20) UNSIGNED DEFAULT NULL,
  `counter_name` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  `checkin_time` varchar(255) DEFAULT NULL,
  `checkout_time` varchar(255) DEFAULT NULL,
  `opening_balance` double DEFAULT NULL,
  `closing_balance` double DEFAULT NULL,
  `balance_missmatch` varchar(255) DEFAULT NULL COMMENT 'can be positive/negative',
  `slug` varchar(255) DEFAULT NULL,
  `counter_status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1=>Available; 0=>Occupied',
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0=>Pending; 1=>Completed',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `counter_sessions`
--

INSERT INTO `counter_sessions` (`id`, `terminal_id`, `terminal_name`, `counter_id`, `counter_name`, `user_id`, `user_name`, `checkin_time`, `checkout_time`, `opening_balance`, `closing_balance`, `balance_missmatch`, `slug`, `counter_status`, `status`, `created_at`, `updated_at`) VALUES
(3, 1, 'Terminal-1', 1, 'Counter-1', 1, 'Admin', '2025-02-08 00:19:20', '2025-02-08 00:19:52', 0, 0, '0', '17389523604s7YQ', 1, 1, '2025-02-07 23:19:20', '2025-02-07 23:27:51'),
(4, 1, 'Terminal-1', 1, 'Counter-1', 1, 'Admin', '2025-02-08 00:20:10', '2025-02-08 00:20:18', 0, 500, '0', '1738952410onkF0', 1, 1, '2025-02-07 23:20:10', '2025-02-07 23:27:53'),
(5, 1, 'Terminal-1', 1, 'Counter-1', 1, 'Admin', '2025-02-08 00:22:55', '2025-02-08 00:26:13', 500, 750, '0', '17389525751wOst', 1, 1, '2025-02-07 23:22:55', '2025-02-07 23:27:56'),
(6, 1, 'Terminal-1', 1, 'Counter-1', 1, 'Admin', '2025-02-08 00:26:27', '2025-02-08 00:35:54', 700, 800, '50', '1738952787JCkzu', 1, 0, '2025-02-07 23:26:27', '2025-02-07 23:35:54');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `general_infos`
--

CREATE TABLE `general_infos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_name` varchar(255) DEFAULT NULL,
  `short_description` longtext DEFAULT NULL,
  `contact` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `address` longtext DEFAULT NULL,
  `ticket_header` varchar(255) DEFAULT NULL,
  `ticket_title` varchar(255) DEFAULT NULL,
  `ticket_width` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `general_infos`
--

INSERT INTO `general_infos` (`id`, `company_name`, `short_description`, `contact`, `email`, `address`, `ticket_header`, `ticket_title`, `ticket_width`, `created_at`, `updated_at`) VALUES
(1, 'Bangladesh Bridge Authority', 'Minstry of Road Teansport and Bridges.', '+88012345647890', 'sample@example.com', 'Tista Bridge Toll Plaza', 'Tista Bridge Toll Ticket', 'Tista Bridge Toll Plaza', '80', NULL, '2025-02-04 09:28:45');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(13, '2014_10_12_000000_create_users_table', 1),
(14, '2014_10_12_100000_create_password_resets_table', 1),
(15, '2019_08_19_000000_create_failed_jobs_table', 1),
(16, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(17, '2023_03_29_160138_create_categories_table', 2),
(19, '2023_04_05_180729_create_child_categories_table', 4),
(21, '2023_04_06_174647_create_product_images_table', 6),
(22, '2023_04_07_060940_create_units_table', 7),
(26, '2023_04_08_190018_create_flags_table', 9),
(27, '2023_04_11_193941_create_terms_and_policies_table', 10),
(29, '2023_04_12_213408_create_faqs_table', 12),
(30, '2023_04_12_205032_create_general_infos_table', 13),
(33, '2023_04_13_014055_create_contact_requests_table', 15),
(39, '2023_04_15_042355_create_shipping_infos_table', 17),
(40, '2023_04_15_042838_create_billing_addresses_table', 18),
(41, '2023_04_15_042952_create_order_progress_table', 19),
(43, '2023_04_14_220155_create_orders_table', 20),
(44, '2023_04_15_041941_create_order_details_table', 20),
(45, '2023_04_24_104941_create_carts_table', 21),
(48, '2023_04_25_023105_create_user_cards_table', 22),
(49, '2023_04_25_112208_create_user_addresses_table', 23),
(50, '2023_04_25_164433_create_wish_lists_table', 24),
(54, '2023_04_26_124004_create_promo_codes_table', 25),
(55, '2023_05_01_230425_create_order_payments_table', 12),
(56, '2023_05_04_235947_create_support_tickets_table', 12),
(57, '2023_05_06_121329_create_support_messages_table', 13),
(58, '2023_05_14_224344_create_product_reviews_table', 26),
(59, '2023_05_19_103848_create_testimonials_table', 27),
(63, '2023_05_30_130611_create_brands_table', 28),
(64, '2023_05_31_152752_create_models_table', 29),
(65, '2023_05_31_161724_create_product_models_table', 30),
(67, '2023_06_01_085646_create_colors_table', 31),
(68, '2023_06_01_102605_create_storage_types_table', 32),
(69, '2023_06_01_143737_create_sims_table', 33),
(70, '2023_06_01_152249_create_device_conditions_table', 34),
(71, '2023_04_06_173024_create_products_table', 35),
(72, '2023_06_04_091502_create_subscribed_users_table', 0),
(73, '2023_06_04_123251_create_product_variants_table', 36),
(74, '2023_04_01_232755_create_subcategories_table', 37),
(75, '2023_06_05_153507_create_product_warrenties_table', 38),
(76, '2023_06_11_115427_create_product_question_answers_table', 12),
(77, '2023_06_11_162544_create_email_configures_table', 39),
(78, '2023_06_12_142348_create_sms_gateways_table', 1),
(79, '2023_06_13_160256_create_promotional_banners_table', 1),
(80, '2023_06_18_163118_create_payment_gateways_table', 1),
(81, '2023_06_20_111106_create_notifications_table', 1),
(82, '2023_06_22_130744_create_sms_templates_table', 1),
(83, '2023_06_25_104544_create_sms_histories_table', 1),
(84, '2023_07_03_093759_create_blog_categories_table', 40),
(85, '2023_07_03_113558_create_blogs_table', 41),
(86, '2023_07_17_212431_create_permission_routes_table', 1),
(87, '2023_07_17_222638_create_user_roles_table', 1),
(88, '2023_07_18_010659_create_role_permissions_table', 1),
(89, '2023_07_18_014657_create_user_role_permissions_table', 1),
(90, '2023_10_05_111305_create_google_recaptchas_table', 42),
(92, '2023_10_05_114505_create_social_logins_table', 43),
(93, '2023_04_13_002226_create_banners_table', 44),
(94, '2023_10_18_135527_create_about_us_table', 45),
(95, '2023_10_22_122627_create_product_sizes_table', 46),
(96, '2023_11_08_144020_create_email_templates_table', 47),
(97, '2023_12_17_125055_create_config_setups_table', 48),
(98, '2024_01_16_155239_create_custom_pages_table', 49),
(101, '2024_06_19_210846_create_vendors_table', 50),
(102, '2024_06_20_023340_create_stores_table', 50),
(103, '2024_06_20_151811_create_withdraws_table', 51),
(104, '2024_10_17_123804_create_buy_sells_table', 52),
(105, '2024_10_17_123954_create_buy_sell_images_table', 53),
(106, '2024_10_17_124400_create_buy_sell_categories_table', 54),
(107, '2024_10_17_163447_create_buy_sell_configs_table', 55),
(108, '2025_02_01_005127_create_vehicle_types_table', 56),
(111, '2025_02_01_020057_create_terminals_table', 57),
(112, '2025_02_01_025155_create_toll_tickets_table', 57),
(113, '2025_02_06_035722_create_counters_table', 58),
(115, '2025_02_06_055016_create_counter_sessions_table', 59);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permission_routes`
--

CREATE TABLE `permission_routes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `route` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `method` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permission_routes`
--

INSERT INTO `permission_routes` (`id`, `route`, `name`, `method`, `created_at`, `updated_at`) VALUES
(1, '_debugbar/open', 'debugbar.openhandler', 'GET', '2025-02-02 08:58:02', '2025-02-06 07:57:21'),
(2, '_debugbar/clockwork/{id}', 'debugbar.clockwork', 'GET', '2025-02-02 08:58:02', '2025-02-06 07:57:21'),
(3, '_debugbar/assets/stylesheets', 'debugbar.assets.css', 'GET', '2025-02-02 08:58:02', '2025-02-06 07:57:21'),
(4, '_debugbar/assets/javascript', 'debugbar.assets.js', 'GET', '2025-02-02 08:58:02', '2025-02-06 07:57:21'),
(5, '_debugbar/cache/{key}/{tags?}', 'debugbar.cache.delete', 'DELETE', '2025-02-02 08:58:02', '2025-02-06 07:57:21'),
(6, '_debugbar/queries/explain', 'debugbar.queries.explain', 'POST', '2025-02-02 08:58:02', '2025-02-06 07:57:21'),
(7, 'makesulg', NULL, 'POST', '2025-02-02 08:58:02', '2025-02-06 07:57:21'),
(8, 'filemanager', 'unisharp.lfm.show', 'GET', '2025-02-02 08:58:02', '2025-02-06 07:57:21'),
(9, 'filemanager/errors', 'unisharp.lfm.getErrors', 'GET', '2025-02-02 08:58:02', '2025-02-06 07:57:21'),
(10, 'filemanager/upload', 'unisharp.lfm.upload', 'GET', '2025-02-02 08:58:02', '2025-02-06 07:57:21'),
(11, 'filemanager/jsonitems', 'unisharp.lfm.getItems', 'GET', '2025-02-02 08:58:02', '2025-02-06 07:57:21'),
(12, 'filemanager/move', 'unisharp.lfm.move', 'GET', '2025-02-02 08:58:02', '2025-02-06 07:57:21'),
(13, 'filemanager/domove', 'unisharp.lfm.doMove', 'GET', '2025-02-02 08:58:02', '2025-02-06 07:57:21'),
(14, 'filemanager/newfolder', 'unisharp.lfm.getAddfolder', 'GET', '2025-02-02 08:58:02', '2025-02-06 07:57:21'),
(15, 'filemanager/folders', 'unisharp.lfm.getFolders', 'GET', '2025-02-02 08:58:02', '2025-02-06 07:57:21'),
(16, 'filemanager/crop', 'unisharp.lfm.getCrop', 'GET', '2025-02-02 08:58:02', '2025-02-06 07:57:21'),
(17, 'filemanager/cropimage', 'unisharp.lfm.getCropImage', 'GET', '2025-02-02 08:58:02', '2025-02-06 07:57:21'),
(18, 'filemanager/cropnewimage', 'unisharp.lfm.getNewCropImage', 'GET', '2025-02-02 08:58:02', '2025-02-06 07:57:21'),
(19, 'filemanager/rename', 'unisharp.lfm.getRename', 'GET', '2025-02-02 08:58:02', '2025-02-06 07:57:21'),
(20, 'filemanager/resize', 'unisharp.lfm.getResize', 'GET', '2025-02-02 08:58:02', '2025-02-06 07:57:21'),
(21, 'filemanager/doresize', 'unisharp.lfm.performResize', 'GET', '2025-02-02 08:58:02', '2025-02-06 07:57:21'),
(22, 'filemanager/doresizenew', 'unisharp.lfm.performResizeNew', 'GET', '2025-02-02 08:58:02', '2025-02-06 07:57:21'),
(23, 'filemanager/download', 'unisharp.lfm.getDownload', 'GET', '2025-02-02 08:58:02', '2025-02-06 07:57:21'),
(24, 'filemanager/delete', 'unisharp.lfm.getDelete', 'GET', '2025-02-02 08:58:02', '2025-02-06 07:57:21'),
(25, 'filemanager/demo', 'unisharp.lfm.', 'GET', '2025-02-02 08:58:02', '2025-02-06 07:57:21'),
(26, '/', NULL, 'GET', '2025-02-02 08:58:02', '2025-02-06 07:57:21'),
(27, 'config-clear', NULL, 'GET', '2025-02-02 08:58:02', '2025-02-06 07:57:21'),
(28, 'storage-link', NULL, 'GET', '2025-02-02 08:58:02', '2025-02-06 07:57:21'),
(29, 'login', NULL, 'POST', '2025-02-02 08:58:02', '2025-02-06 07:57:21'),
(30, 'logout', 'logout', 'POST', '2025-02-02 08:58:02', '2025-02-06 07:57:21'),
(31, 'password/confirm', NULL, 'POST', '2025-02-02 08:58:02', '2025-02-06 07:57:21'),
(32, 'home', 'home', 'GET', '2025-02-02 08:58:02', '2025-02-06 07:57:21'),
(33, 'clear/cache', 'ClearCache', 'GET', '2025-02-02 08:58:02', '2025-02-06 07:57:21'),
(34, 'change/password/page', 'changePasswordPage', 'GET', '2025-02-02 08:58:02', '2025-02-06 07:57:21'),
(35, 'change/password', 'changePassword', 'POST', '2025-02-02 08:58:02', '2025-02-06 07:57:21'),
(36, 'ckeditor', NULL, 'GET', '2025-02-02 08:58:02', '2025-02-06 07:57:21'),
(37, 'ckeditor/upload', 'ckeditor.upload', 'POST', '2025-02-02 08:58:02', '2025-02-06 07:57:21'),
(38, 'file-manager', NULL, 'GET', '2025-02-02 08:58:02', '2025-02-06 07:57:21'),
(39, 'laravel-filemanager', 'unisharp.lfm.show', 'GET', '2025-02-02 08:58:02', '2025-02-06 07:57:21'),
(40, 'laravel-filemanager/errors', 'unisharp.lfm.getErrors', 'GET', '2025-02-02 08:58:02', '2025-02-06 07:57:21'),
(41, 'laravel-filemanager/upload', 'unisharp.lfm.upload', 'GET', '2025-02-02 08:58:02', '2025-02-06 07:57:21'),
(42, 'laravel-filemanager/jsonitems', 'unisharp.lfm.getItems', 'GET', '2025-02-02 08:58:02', '2025-02-06 07:57:21'),
(43, 'laravel-filemanager/move', 'unisharp.lfm.move', 'GET', '2025-02-02 08:58:02', '2025-02-06 07:57:21'),
(44, 'laravel-filemanager/domove', 'unisharp.lfm.doMove', 'GET', '2025-02-02 08:58:02', '2025-02-06 07:57:21'),
(45, 'laravel-filemanager/newfolder', 'unisharp.lfm.getAddfolder', 'GET', '2025-02-02 08:58:02', '2025-02-06 07:57:21'),
(46, 'laravel-filemanager/folders', 'unisharp.lfm.getFolders', 'GET', '2025-02-02 08:58:02', '2025-02-06 07:57:21'),
(47, 'laravel-filemanager/crop', 'unisharp.lfm.getCrop', 'GET', '2025-02-02 08:58:02', '2025-02-06 07:57:21'),
(48, 'laravel-filemanager/cropimage', 'unisharp.lfm.getCropImage', 'GET', '2025-02-02 08:58:02', '2025-02-06 07:57:21'),
(49, 'laravel-filemanager/cropnewimage', 'unisharp.lfm.getNewCropImage', 'GET', '2025-02-02 08:58:02', '2025-02-06 07:57:21'),
(50, 'laravel-filemanager/rename', 'unisharp.lfm.getRename', 'GET', '2025-02-02 08:58:02', '2025-02-06 07:57:21'),
(51, 'laravel-filemanager/resize', 'unisharp.lfm.getResize', 'GET', '2025-02-02 08:58:02', '2025-02-06 07:57:21'),
(52, 'laravel-filemanager/doresize', 'unisharp.lfm.performResize', 'GET', '2025-02-02 08:58:02', '2025-02-06 07:57:21'),
(53, 'laravel-filemanager/doresizenew', 'unisharp.lfm.performResizeNew', 'GET', '2025-02-02 08:58:02', '2025-02-06 07:57:21'),
(54, 'laravel-filemanager/download', 'unisharp.lfm.getDownload', 'GET', '2025-02-02 08:58:02', '2025-02-06 07:57:21'),
(55, 'laravel-filemanager/delete', 'unisharp.lfm.getDelete', 'GET', '2025-02-02 08:58:02', '2025-02-06 07:57:21'),
(56, 'laravel-filemanager/demo', 'unisharp.lfm.', 'GET', '2025-02-02 08:58:02', '2025-02-06 07:57:21'),
(57, 'create/vehicle/type', 'CreateVehicleType', 'GET', '2025-02-02 08:58:02', '2025-02-06 07:57:21'),
(58, 'save/vehicle/type', 'SaveVehicleType', 'POST', '2025-02-02 08:58:02', '2025-02-06 07:57:21'),
(59, 'view/vehicle/types', 'ViewVehicleTypes', 'GET', '2025-02-02 08:58:02', '2025-02-06 07:57:21'),
(60, 'delete/vehicle/type/{id}', 'DeleteVehicleType', 'GET', '2025-02-02 08:58:02', '2025-02-06 07:57:21'),
(61, 'edit/vehicle/type/{id}', 'EditVehicleType', 'GET', '2025-02-02 08:58:02', '2025-02-06 07:57:21'),
(62, 'update/vehicle/type', 'UpdateVehicleType', 'POST', '2025-02-02 08:58:02', '2025-02-06 07:57:21'),
(63, 'create/terminal', 'CreateTerminal', 'GET', '2025-02-02 08:58:02', '2025-02-06 07:57:21'),
(64, 'save/terminal', 'SaveTerminal', 'POST', '2025-02-02 08:58:02', '2025-02-06 07:57:21'),
(65, 'view/terminals', 'ViewTerminals', 'GET', '2025-02-02 08:58:02', '2025-02-06 07:57:21'),
(66, 'delete/terminal/{id}', 'DeleteTerminal', 'GET', '2025-02-02 08:58:02', '2025-02-06 07:57:21'),
(67, 'edit/terminal/{id}', 'EditTerminal', 'GET', '2025-02-02 08:58:02', '2025-02-06 07:57:21'),
(68, 'update/terminal', 'UpdateTerminal', 'POST', '2025-02-02 08:58:02', '2025-02-06 07:57:21'),
(69, 'create/toll/ticket', 'CreateTollTicket', 'GET', '2025-02-02 08:58:02', '2025-02-06 07:57:21'),
(70, 'save/toll/ticket', 'SaveTollTicket', 'POST', '2025-02-02 08:58:02', '2025-02-06 07:57:21'),
(71, 'view/toll/tickets', 'ViewTollTickets', 'GET', '2025-02-02 08:58:02', '2025-02-06 07:57:21'),
(72, 'delete/toll/ticket/{id}', 'DeleteTollTicket', 'GET', '2025-02-02 08:58:02', '2025-02-06 07:57:21'),
(73, 'print/toll/ticket/{slug}', 'PrintTollTicket', 'GET', '2025-02-02 08:58:02', '2025-02-06 07:57:21'),
(74, 'view/system/users', 'ViewAllSystemUsers', 'GET', '2025-02-02 08:58:02', '2025-02-06 07:57:21'),
(75, 'add/new/system/user', 'AddNewSystemUsers', 'GET', '2025-02-02 08:58:02', '2025-02-06 07:57:21'),
(76, 'create/system/user', 'CreateSystemUsers', 'POST', '2025-02-02 08:58:02', '2025-02-06 07:57:21'),
(77, 'edit/system/user/{id}', 'EditSystemUser', 'GET', '2025-02-02 08:58:02', '2025-02-06 07:57:21'),
(78, 'delete/system/user/{id}', 'DeleteSystemUser', 'GET', '2025-02-02 08:58:02', '2025-02-06 07:57:21'),
(79, 'update/system/user', 'UpdateSystemUser', 'POST', '2025-02-02 08:58:02', '2025-02-06 07:57:21'),
(80, 'make/user/superadmin/{id}', 'MakeSuperAdmin', 'GET', '2025-02-02 08:58:02', '2025-02-06 07:57:21'),
(81, 'revoke/user/superadmin/{id}', 'RevokeSuperAdmin', 'GET', '2025-02-02 08:58:02', '2025-02-06 07:57:21'),
(82, 'change/user/status/{id}', 'ChangeUserStatus', 'GET', '2025-02-02 08:58:02', '2025-02-06 07:57:21'),
(83, 'delete/customer/{id}', 'DeleteCustomer', 'GET', '2025-02-02 08:58:02', '2025-02-06 07:57:21'),
(84, 'general/info', 'GeneralInfo', 'GET', '2025-02-02 08:58:02', '2025-02-06 07:57:21'),
(85, 'update/general/info', 'UpdateGeneralInfo', 'POST', '2025-02-02 08:58:02', '2025-02-06 07:57:21'),
(86, 'download/database/backup', 'DownloadDBBackup', 'GET', '2025-02-02 08:58:02', '2025-02-06 07:57:21'),
(87, 'download/vehicle/icon/backup', 'DownloadVehicleIconBackup', 'GET', '2025-02-02 08:58:02', '2025-02-06 07:57:21'),
(88, 'toll/ticket/report', 'TollTicketReport', 'GET', '2025-02-02 08:58:03', '2025-02-06 07:57:21'),
(89, 'generate/toll/ticket/report', 'GenerateTollTicketReport', 'POST', '2025-02-02 08:58:03', '2025-02-06 07:57:21'),
(90, 'view/permission/routes', 'ViewAllPermissionRoutes', 'GET', '2025-02-02 08:58:03', '2025-02-06 07:57:21'),
(91, 'regenerate/permission/routes', 'RegeneratePermissionRoutes', 'GET', '2025-02-02 08:58:03', '2025-02-06 07:57:21'),
(92, 'view/user/roles', 'ViewAllUserRoles', 'GET', '2025-02-02 08:58:03', '2025-02-06 07:57:21'),
(93, 'new/user/role', 'NewUserRole', 'GET', '2025-02-02 08:58:03', '2025-02-06 07:57:21'),
(94, 'save/user/role', 'SaveUserRole', 'POST', '2025-02-02 08:58:03', '2025-02-06 07:57:21'),
(95, 'delete/user/role/{id}', 'DeleteUserRole', 'GET', '2025-02-02 08:58:03', '2025-02-06 07:57:21'),
(96, 'edit/user/role/{id}', 'EditUserRole', 'GET', '2025-02-02 08:58:03', '2025-02-06 07:57:21'),
(97, 'update/user/role', 'UpdateUserRole', 'POST', '2025-02-02 08:58:03', '2025-02-06 07:57:22'),
(98, 'view/user/role/permission', 'ViewUserRolePermission', 'GET', '2025-02-02 08:58:03', '2025-02-06 07:57:22'),
(99, 'assign/role/permission/{id}', 'AssignRolePermission', 'GET', '2025-02-02 08:58:03', '2025-02-06 07:57:22'),
(100, 'save/assigned/role/permission', 'SaveAssignedRolePermission', 'POST', '2025-02-02 08:58:03', '2025-02-06 07:57:22'),
(101, 'rearrange/vehicle/types', 'RearrangeVehicleType', 'GET', '2025-02-06 07:57:21', NULL),
(102, 'save/rearranged/order', 'SaveRearrangedVehicleType', 'POST', '2025-02-06 07:57:21', NULL),
(103, 'create/counter', 'CreateCounter', 'GET', '2025-02-06 07:57:21', NULL),
(104, 'save/counter', 'SaveCounter', 'POST', '2025-02-06 07:57:21', NULL),
(105, 'view/counters', 'ViewCounters', 'GET', '2025-02-06 07:57:21', NULL),
(106, 'delete/counter/{id}', 'DeleteCounter', 'GET', '2025-02-06 07:57:21', NULL),
(107, 'edit/counter/{slug}', 'EditCounter', 'GET', '2025-02-06 07:57:21', NULL),
(108, 'update/counter', 'UpdateCounter', 'POST', '2025-02-06 07:57:21', NULL),
(109, 'terminal/wise/counter', 'TerminalWiseCounter', 'POST', '2025-02-06 07:57:21', NULL),
(110, 'view/counter/sessions', 'ViewCounterSessions', 'GET', '2025-02-06 07:57:21', NULL),
(111, 'complete/counter/session/{slug}', 'CompleteCounterSession', 'GET', '2025-02-06 07:57:21', NULL),
(112, 'submit/counter/checkin', 'SubmitCounterCheckin', 'POST', '2025-02-06 07:57:21', NULL),
(113, 'submit/counter/checkout', 'SubmitCounterCheckout', 'POST', '2025-02-06 07:57:21', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 45, 'GenericCommerceV1', '5f622f837408e3b7751d5294eba7e2501f361b861f1de040cb87acd546225d9a', '[\"*\"]', NULL, '2023-10-22 05:26:44', '2023-10-22 05:26:44'),
(2, 'App\\Models\\User', 45, 'GenericCommerceV1', '3a5417e30d83a07253267e1b0fd98f703eecdf6ae7335af04a0942fa69a9dc02', '[\"*\"]', NULL, '2023-10-22 05:36:17', '2023-10-22 05:36:17'),
(3, 'App\\Models\\User', 45, 'GenericCommerceV1', 'a784342214375711e75696778877abba05335936f13e535f3d2cc884bcb1016d', '[\"*\"]', NULL, '2023-10-22 05:36:20', '2023-10-22 05:36:20'),
(4, 'App\\Models\\User', 45, 'GenericCommerceV1', '5fc644144334ee3969fc639e92d92dc40b541fa00a8ffd1551aeaaa34d4145a4', '[\"*\"]', NULL, '2023-10-22 05:36:21', '2023-10-22 05:36:21'),
(5, 'App\\Models\\User', 45, 'GenericCommerceV1', '705c5e3baea430b64b630b2e88166214217a77028e25cbe47525d85c711ebbfb', '[\"*\"]', NULL, '2023-10-22 05:47:07', '2023-10-22 05:47:07'),
(6, 'App\\Models\\User', 47, 'GenericCommerceV1', '2388a53dd887103a43a847b66b124c45023240b16ce638d5ed047ab2ff8da253', '[\"*\"]', NULL, '2023-10-22 06:11:03', '2023-10-22 06:11:03'),
(7, 'App\\Models\\User', 45, 'GenericCommerceV1', 'e696aa4794f7c7d7d0eb368ff94a1fb40ead43ea4627d6eb0cc0169b0d8b2ace', '[\"*\"]', NULL, '2023-10-22 06:22:06', '2023-10-22 06:22:06'),
(8, 'App\\Models\\User', 45, 'GenericCommerceV1', '7f6f721a59c5cd621339967c1cf839ffeda8fd726433337e034b7b3cd58342b6', '[\"*\"]', NULL, '2023-10-22 06:22:25', '2023-10-22 06:22:25'),
(9, 'App\\Models\\User', 45, 'GenericCommerceV1', '8481956bea6bddc09dfff4f5ff49ef4657feed8ee5df0e2fa265710361328798', '[\"*\"]', NULL, '2023-10-22 06:22:40', '2023-10-22 06:22:40'),
(10, 'App\\Models\\User', 45, 'GenericCommerceV1', 'e41b762ed9153d989b361911717c2f8f8edb8bfee6f293096ed444c7d1b55a5a', '[\"*\"]', NULL, '2023-10-23 04:20:05', '2023-10-23 04:20:05'),
(11, 'App\\Models\\User', 45, 'GenericCommerceV1', '6f0cd41da7378f3cfbaaefe73ad3cfcc8f9c49c9f3e208497e594f320eafe249', '[\"*\"]', NULL, '2023-10-23 04:35:56', '2023-10-23 04:35:56'),
(12, 'App\\Models\\User', 45, 'GenericCommerceV1', 'd121c7e34e276d2e964b5fb7dd07870cbf5b16c142676e3474b6a2bd919086be', '[\"*\"]', NULL, '2023-10-23 04:47:34', '2023-10-23 04:47:34'),
(13, 'App\\Models\\User', 45, 'GenericCommerceV1', '95aa989c2e6d5b09e9642d2eef3a2a168f5f2733f8bdd7d4b3a67e9838804730', '[\"*\"]', NULL, '2023-10-23 06:38:35', '2023-10-23 06:38:35'),
(14, 'App\\Models\\User', 45, 'GenericCommerceV1', '68fe5ed63d3e66b6f75dcfbe8517c7e6390272dbf4308e0c40f06b9ee82fc33a', '[\"*\"]', NULL, '2023-10-23 06:38:54', '2023-10-23 06:38:54'),
(15, 'App\\Models\\User', 45, 'GenericCommerceV1', 'af231b972593f4ba67288e7b93fa01c77dcb6ee8365ac4e12e5e8b6a6211cccf', '[\"*\"]', NULL, '2023-10-23 06:40:09', '2023-10-23 06:40:09'),
(16, 'App\\Models\\User', 45, 'GenericCommerceV1', 'd0071869a685c9f90ae548a091e240d3de8f3f26e72e4c926707b49c65ed73ce', '[\"*\"]', NULL, '2023-10-23 08:32:55', '2023-10-23 08:32:55'),
(17, 'App\\Models\\User', 45, 'GenericCommerceV1', 'c0cd27c6ea6ba817851700b51d518b811474bc860120c2d147b5e4057e10e873', '[\"*\"]', NULL, '2023-10-23 09:09:32', '2023-10-23 09:09:32'),
(18, 'App\\Models\\User', 45, 'GenericCommerceV1', 'c3047b96f3bc19739d050e2c6b4c13f09894edc0be070fa017c7045f0fc8fd0c', '[\"*\"]', NULL, '2023-10-23 09:25:31', '2023-10-23 09:25:31'),
(19, 'App\\Models\\User', 45, 'GenericCommerceV1', 'a479acbec466649f17da51ad331b8f11b36e7ebd5ef80f4a26bb85c6f73aa137', '[\"*\"]', NULL, '2023-10-23 09:28:37', '2023-10-23 09:28:37'),
(20, 'App\\Models\\User', 45, 'GenericCommerceV1', 'e4a3bcd422038984c618ccd6bd472fa98fadd37ac5c8cfc12a7542917c6b435f', '[\"*\"]', NULL, '2023-10-23 09:35:44', '2023-10-23 09:35:44'),
(21, 'App\\Models\\User', 45, 'GenericCommerceV1', 'b06b9853e4893af16eb9920fa341f5983951a95ca82266d530abef97815bb56c', '[\"*\"]', NULL, '2023-10-23 09:36:07', '2023-10-23 09:36:07'),
(22, 'App\\Models\\User', 45, 'GenericCommerceV1', 'bf45877044565542a1d4750292e5398dbc59f6e9ec4c8ad86f05805a8530fe85', '[\"*\"]', NULL, '2023-10-23 09:37:51', '2023-10-23 09:37:51'),
(23, 'App\\Models\\User', 45, 'GenericCommerceV1', 'fd0c83844dc98300ce8f0d6792c7f39ec766422e68cddd82dc69529e533cc9d6', '[\"*\"]', NULL, '2023-10-23 09:38:15', '2023-10-23 09:38:15'),
(24, 'App\\Models\\User', 45, 'GenericCommerceV1', 'e6c86a6fcc9dc59acee1cc6d7f43dc953bc30668a7f4b98ef645b390f8c0ea9d', '[\"*\"]', NULL, '2023-10-23 09:38:35', '2023-10-23 09:38:35'),
(25, 'App\\Models\\User', 45, 'GenericCommerceV1', '2f92ae6b1ddc367fafdb6efeda07e5ff3b1de0ac137a47f99d5d6ea6302b7cb3', '[\"*\"]', NULL, '2023-10-23 09:43:42', '2023-10-23 09:43:42'),
(26, 'App\\Models\\User', 45, 'GenericCommerceV1', '0b6e109e3d9492a5c6ae9bf4cefe4c056cda23cad4077e047656b16325bb6733', '[\"*\"]', NULL, '2023-10-23 09:50:43', '2023-10-23 09:50:43'),
(27, 'App\\Models\\User', 45, 'GenericCommerceV1', 'd5344ce88f8d6d7a9b2bc020c69777061682c776e3d15d88845731851355e076', '[\"*\"]', NULL, '2023-10-23 09:54:37', '2023-10-23 09:54:37'),
(28, 'App\\Models\\User', 45, 'GenericCommerceV1', 'e21b1eda89d3a3d39fb483a3ea91ead6bf719d5721270c08b84d2c4b34aa921f', '[\"*\"]', NULL, '2023-10-23 09:57:39', '2023-10-23 09:57:39'),
(29, 'App\\Models\\User', 45, 'GenericCommerceV1', '22f9ab57329d754d4df61dfe023be3db9d21050726ee2976cf915d01294f3f31', '[\"*\"]', NULL, '2023-10-23 10:07:09', '2023-10-23 10:07:09'),
(30, 'App\\Models\\User', 45, 'GenericCommerceV1', '2adb7f360a7371351322b3fde7a8cdbdb6c7c304bb0e89b6c9a20c65a669f78f', '[\"*\"]', NULL, '2023-10-23 10:11:00', '2023-10-23 10:11:00'),
(31, 'App\\Models\\User', 45, 'GenericCommerceV1', 'd511440574564dba5ebc81e46be3d0205c04b6f94537be1dca9c065d1f9d193c', '[\"*\"]', NULL, '2023-10-23 10:12:33', '2023-10-23 10:12:33'),
(32, 'App\\Models\\User', 45, 'GenericCommerceV1', 'e50464b8536e832e7f2d95d9547d29aef59b4ecfe668bdb25a25c702e90ea9ae', '[\"*\"]', NULL, '2023-10-23 10:38:37', '2023-10-23 10:38:37'),
(33, 'App\\Models\\User', 55, 'GenericCommerceV1', '272548637ba2bb77556a7053a4b5dcefc4db2f47defd0be343fe90501b8e7bdd', '[\"*\"]', NULL, '2023-10-25 02:00:12', '2023-10-25 02:00:12'),
(34, 'App\\Models\\User', 55, 'GenericCommerceV1', 'cd8a8171cb4f47570e2e7dc9368373a38710722e0447a7e486445e5f6cdb3d8d', '[\"*\"]', NULL, '2023-10-25 02:16:50', '2023-10-25 02:16:50'),
(35, 'App\\Models\\User', 55, 'GenericCommerceV1', '48e2bd04a01d8217faf69b0d0033b47cb55d622ddfa4f6d637149d8dfe7c6587', '[\"*\"]', NULL, '2023-10-25 02:49:03', '2023-10-25 02:49:03'),
(36, 'App\\Models\\User', 55, 'GenericCommerceV1', '17e3532105c6a7e5d3b672f03cbb7ea2a1562bff53856b905018d443cf30a116', '[\"*\"]', '2023-10-25 04:09:51', '2023-10-25 03:03:23', '2023-10-25 04:09:51'),
(37, 'App\\Models\\User', 55, 'GenericCommerceV1', '8299d08d3ed071059fedc28f65e5318b6db08b3f6af7049dbe75138cf758c10a', '[\"*\"]', '2023-10-25 03:08:04', '2023-10-25 03:07:35', '2023-10-25 03:08:04'),
(38, 'App\\Models\\User', 55, 'GenericCommerceV1', 'ed9be3661b9874688dc66bd1c530392bc519b28620524e79c046973e57fd2e43', '[\"*\"]', '2023-10-25 04:21:21', '2023-10-25 04:10:16', '2023-10-25 04:21:21'),
(39, 'App\\Models\\User', 45, 'GenericCommerceV1', '3dbfce91ab523774683f5caa491c78b52840697dd22e91f56d7dc3d043383c1a', '[\"*\"]', NULL, '2023-10-25 04:21:09', '2023-10-25 04:21:09'),
(40, 'App\\Models\\User', 45, 'GenericCommerceV1', '4ec7d4c30481526a12dee61265e892b635a5af051441c27c2f0617e8ed7b88d1', '[\"*\"]', NULL, '2023-10-25 04:22:43', '2023-10-25 04:22:43'),
(41, 'App\\Models\\User', 45, 'GenericCommerceV1', '36aefc3f061a57cd2fd76bf88b8aad6a5fd7976057825b73f27e6d0a51e8be9a', '[\"*\"]', NULL, '2023-10-25 04:23:53', '2023-10-25 04:23:53'),
(42, 'App\\Models\\User', 45, 'GenericCommerceV1', '0b0baf35d5c1ec371c39a0299ba5a1a2ab31c4185ea229434b918c476935e169', '[\"*\"]', NULL, '2023-10-25 04:26:31', '2023-10-25 04:26:31'),
(43, 'App\\Models\\User', 45, 'GenericCommerceV1', '5cd9c60a889fbe01bd596f5bf590013c6fefa7adfcd37c849bea8ae5e22d56ee', '[\"*\"]', NULL, '2023-10-25 04:28:40', '2023-10-25 04:28:40'),
(44, 'App\\Models\\User', 45, 'GenericCommerceV1', '23c803e23fc08ad4d12348e7d9e4b63125742156989941a7f630f48b56d29f15', '[\"*\"]', NULL, '2023-10-25 04:29:17', '2023-10-25 04:29:17'),
(45, 'App\\Models\\User', 45, 'GenericCommerceV1', '70ac0543f32f1c4ed63210d95b4d61af2555049208b3b81d801a1ab1f31f713a', '[\"*\"]', NULL, '2023-10-25 04:32:48', '2023-10-25 04:32:48'),
(46, 'App\\Models\\User', 55, 'GenericCommerceV1', '4b3e83bb93fce480f9b1accaae652172c49a386b5a18eec71be4a7e3394c855c', '[\"*\"]', NULL, '2023-10-25 04:33:08', '2023-10-25 04:33:08'),
(47, 'App\\Models\\User', 45, 'GenericCommerceV1', '2ad59a41a9aed3dc35e0c30bba71da177c573bc6b0d3b85ebd6c4a785d32d7bf', '[\"*\"]', NULL, '2023-10-25 04:33:50', '2023-10-25 04:33:50'),
(48, 'App\\Models\\User', 45, 'GenericCommerceV1', 'ae11615775290b3f3c2b882f9972b3b35ef38bff6ba236b26c236d7502e976cc', '[\"*\"]', NULL, '2023-10-25 04:35:34', '2023-10-25 04:35:34'),
(49, 'App\\Models\\User', 55, 'GenericCommerceV1', '286e10cb80304d9d537f566a24061331bc6cab878c70ead75991e6a42b092894', '[\"*\"]', NULL, '2023-10-25 04:37:26', '2023-10-25 04:37:26'),
(50, 'App\\Models\\User', 55, 'GenericCommerceV1', 'aef60e51422dd7ab9e53bddefb755a429dcc0f7739edcc265bcb3696f6c51202', '[\"*\"]', NULL, '2023-10-25 04:41:01', '2023-10-25 04:41:01'),
(51, 'App\\Models\\User', 55, 'GenericCommerceV1', 'b912bc531f4f01dbbf660f851eecbde7f6456a4ea52ae91b127385d6799b087c', '[\"*\"]', NULL, '2023-10-25 04:43:54', '2023-10-25 04:43:54'),
(52, 'App\\Models\\User', 45, 'GenericCommerceV1', '912f35c8df3d0b85ed0d6e33bfbbfe404be0074d3a67b3bfd2b0b944179e5bf1', '[\"*\"]', NULL, '2023-10-25 04:45:08', '2023-10-25 04:45:08'),
(53, 'App\\Models\\User', 45, 'GenericCommerceV1', '876e48f670f83d57e3506f65473a32184c4176ab359cad2fc73ec002157dcbcd', '[\"*\"]', NULL, '2023-10-25 04:46:30', '2023-10-25 04:46:30'),
(54, 'App\\Models\\User', 55, 'GenericCommerceV1', '781403189c2f726e4e3d8e4d1afeafd6da5dff007f6b943151582ed30a13a93b', '[\"*\"]', '2023-10-25 06:37:50', '2023-10-25 04:47:23', '2023-10-25 06:37:50'),
(55, 'App\\Models\\User', 45, 'GenericCommerceV1', 'cea64887a3a44729638d9886edb283e6dcd77d4041aa7035b6035361f37f02b6', '[\"*\"]', NULL, '2023-10-25 04:55:10', '2023-10-25 04:55:10'),
(56, 'App\\Models\\User', 45, 'GenericCommerceV1', 'ecaae5d264a2c52f3a50a6771cb561f004d78e2852029576793de91151227287', '[\"*\"]', NULL, '2023-10-25 04:56:51', '2023-10-25 04:56:51'),
(57, 'App\\Models\\User', 45, 'GenericCommerceV1', '0d456d3354130d3db91e79ac027a3cb583dfe1d0a126631217967b408ebae349', '[\"*\"]', NULL, '2023-10-25 04:57:42', '2023-10-25 04:57:42'),
(58, 'App\\Models\\User', 45, 'GenericCommerceV1', '3cbdb577356b2c6952e55afe10ff1420c09ce91bcc6b2958673e9aeb12dec3ea', '[\"*\"]', NULL, '2023-10-25 04:59:00', '2023-10-25 04:59:00'),
(59, 'App\\Models\\User', 45, 'GenericCommerceV1', '586ec35334bf08cf910dda235363d86952a914b3acd31296eccc4fb59a14f048', '[\"*\"]', NULL, '2023-10-25 04:59:29', '2023-10-25 04:59:29'),
(60, 'App\\Models\\User', 45, 'GenericCommerceV1', '25edd058dd2b8a037c5842138bdf27576cb9127532ac4892b79a070a136017cc', '[\"*\"]', NULL, '2023-10-25 05:00:16', '2023-10-25 05:00:16'),
(61, 'App\\Models\\User', 45, 'GenericCommerceV1', '31fd4aa7aacec2de74746149b1cd696d9cc2ba8e815f5ab0f5c38f0941fa8e94', '[\"*\"]', NULL, '2023-10-25 05:01:35', '2023-10-25 05:01:35'),
(62, 'App\\Models\\User', 45, 'GenericCommerceV1', '62312372290ea24ea52c94ed9a327e3423c53c322bc669d776452bf7eb0c1af5', '[\"*\"]', NULL, '2023-10-25 05:03:02', '2023-10-25 05:03:02'),
(63, 'App\\Models\\User', 45, 'GenericCommerceV1', '2ea1cfdeed3fa6ba6cb38c15806cef720425b4e287a7fad60ebc0e045963f464', '[\"*\"]', NULL, '2023-10-25 05:04:56', '2023-10-25 05:04:56'),
(64, 'App\\Models\\User', 45, 'GenericCommerceV1', 'cf99b72b7974aa68ef04644c0304d59da4a7b772cff720e3709ed551e5f66a4d', '[\"*\"]', NULL, '2023-10-25 05:05:18', '2023-10-25 05:05:18'),
(65, 'App\\Models\\User', 45, 'GenericCommerceV1', '14189e48adc86bfa970d5668a55e6041b67c3a1ee1daaac31835856bd34cd5f3', '[\"*\"]', NULL, '2023-10-25 05:15:56', '2023-10-25 05:15:56'),
(66, 'App\\Models\\User', 45, 'GenericCommerceV1', 'c2f85546cd587d996521485a33bbca2d26bcba690b4459afdee3afffb0ad59b8', '[\"*\"]', NULL, '2023-10-25 05:26:43', '2023-10-25 05:26:43'),
(67, 'App\\Models\\User', 45, 'GenericCommerceV1', '0101b5e70e7e1e84afa36b7c3c00afe117bc9d77a0df4cc59752425d3b4dd1e0', '[\"*\"]', NULL, '2023-10-25 05:27:12', '2023-10-25 05:27:12'),
(68, 'App\\Models\\User', 45, 'GenericCommerceV1', '63df89bc70d1a41cca3e6486bcb4263b38b0f9631d709711a08c07f33d02bd5c', '[\"*\"]', NULL, '2023-10-25 05:29:26', '2023-10-25 05:29:26'),
(69, 'App\\Models\\User', 45, 'GenericCommerceV1', '8724faf90466374c124798566ae9d44640225144fcce7aae9ad30357d0dec7b4', '[\"*\"]', NULL, '2023-10-25 05:31:51', '2023-10-25 05:31:51'),
(70, 'App\\Models\\User', 45, 'GenericCommerceV1', 'a81f43718b47234b651605e9479d893d6ace999355d92fad812c0b47cb07f95a', '[\"*\"]', '2023-10-26 04:38:30', '2023-10-25 05:46:28', '2023-10-26 04:38:30'),
(71, 'App\\Models\\User', 45, 'GenericCommerceV1', 'f1d8f44ab51199d9e1a697b00b7b9a3947b1a06f156632992c9f99b6712b4e79', '[\"*\"]', NULL, '2023-10-25 06:05:22', '2023-10-25 06:05:22'),
(72, 'App\\Models\\User', 55, 'GenericCommerceV1', '183562a6754689a6a1aa7c12f2c2c0e8e9db2098280d41762ddee663c96d869a', '[\"*\"]', '2023-10-26 04:41:12', '2023-10-25 06:39:48', '2023-10-26 04:41:12'),
(73, 'App\\Models\\User', 45, 'GenericCommerceV1', '7363d64b17d23840e1ce98865c29f86755278390b7e0ec585f56955355950bc7', '[\"*\"]', '2023-10-25 08:36:13', '2023-10-25 08:21:44', '2023-10-25 08:36:13'),
(74, 'App\\Models\\User', 45, 'GenericCommerceV1', 'e614e6a3f893a857e93880034c7bf1d46f6872509be7238f921fdf933053a615', '[\"*\"]', '2023-10-25 09:12:06', '2023-10-25 08:42:24', '2023-10-25 09:12:06'),
(75, 'App\\Models\\User', 45, 'GenericCommerceV1', '28e537da1ceec6328c00a68f43a7ca574d52ef787983f964704e6e37fd605450', '[\"*\"]', '2023-10-25 09:12:47', '2023-10-25 09:12:27', '2023-10-25 09:12:47'),
(76, 'App\\Models\\User', 45, 'GenericCommerceV1', '67de33fac8224cef05e1e33551e54de9a3aa0b827a2cfc7310832ce3252f2e0a', '[\"*\"]', '2023-10-25 09:13:28', '2023-10-25 09:12:58', '2023-10-25 09:13:28'),
(77, 'App\\Models\\User', 45, 'GenericCommerceV1', '0b32faca29202be691f838ab939d42b090433cd25cec09ca6f83c891a2b510a6', '[\"*\"]', '2023-10-25 09:27:15', '2023-10-25 09:13:48', '2023-10-25 09:27:15'),
(78, 'App\\Models\\User', 45, 'GenericCommerceV1', '6c66b1b2209c4c125f20e2b2bf2fc7124507db661ddf5000caf7ce5a95d8eac1', '[\"*\"]', '2023-10-25 09:28:50', '2023-10-25 09:28:46', '2023-10-25 09:28:50'),
(79, 'App\\Models\\User', 45, 'GenericCommerceV1', '4d43e9c7eb7e02cd6557736ff11c2bd1d489547f77bfc619a87904d0138943a9', '[\"*\"]', '2023-10-25 09:30:17', '2023-10-25 09:30:07', '2023-10-25 09:30:17'),
(80, 'App\\Models\\User', 45, 'GenericCommerceV1', '358b3f8a24286ff800832e8e62cd0c575cc8273e06d2959b922a5cffed39f050', '[\"*\"]', '2023-10-25 09:31:21', '2023-10-25 09:31:14', '2023-10-25 09:31:21'),
(81, 'App\\Models\\User', 45, 'GenericCommerceV1', '28d6df44ca1961c115954523248a38f3316d95a57159bb3e3e4e8df86442024e', '[\"*\"]', '2023-10-25 09:33:03', '2023-10-25 09:32:53', '2023-10-25 09:33:03'),
(82, 'App\\Models\\User', 45, 'GenericCommerceV1', '46727d262692803bfcfd9fb749f1baae34e7d180ca902e01c8c74a29b1e80a5b', '[\"*\"]', '2023-10-25 09:37:53', '2023-10-25 09:36:08', '2023-10-25 09:37:53'),
(83, 'App\\Models\\User', 45, 'GenericCommerceV1', '8be31eff5f20c8ac497aa21e2a265dfd170473befa1c79d13b783f6fa681e5fb', '[\"*\"]', '2023-10-26 04:22:15', '2023-10-26 02:57:18', '2023-10-26 04:22:15'),
(84, 'App\\Models\\User', 45, 'GenericCommerceV1', '248b9102132eb03d89dc624665c9adb1610a3a94e5cf359f49ac947c90098525', '[\"*\"]', '2023-10-26 04:48:10', '2023-10-26 04:22:21', '2023-10-26 04:48:10'),
(85, 'App\\Models\\User', 45, 'GenericCommerceV1', 'a35a62b357e110c90350a0f3070b090c457e32b0a165a450bf91f1a534b6f3d0', '[\"*\"]', NULL, '2023-10-26 04:22:22', '2023-10-26 04:22:22'),
(86, 'App\\Models\\User', 45, 'GenericCommerceV1', '994a1174ebe4e0a19a9072dba394402ab1aac54de4fe05500a72e8358ab2a68c', '[\"*\"]', NULL, '2023-10-26 11:23:52', '2023-10-26 11:23:52'),
(87, 'App\\Models\\User', 45, 'GenericCommerceV1', 'e3bd135da1ee0c23ebf8530a82b52ca619ce32779225731a30dc58a3fb69ae2f', '[\"*\"]', NULL, '2023-10-26 11:23:56', '2023-10-26 11:23:56'),
(88, 'App\\Models\\User', 45, 'GenericCommerceV1', '9c2d54246cb99eae893c0ec92f99877c3cc1ab4389361143a9000a6547261e30', '[\"*\"]', NULL, '2023-10-26 11:24:10', '2023-10-26 11:24:10'),
(89, 'App\\Models\\User', 45, 'GenericCommerceV1', 'b36572bc34f9c3bf564000cff3a2724820ff0afdd3139f06f3b17eb52f94a96c', '[\"*\"]', NULL, '2023-10-26 11:24:11', '2023-10-26 11:24:11'),
(90, 'App\\Models\\User', 45, 'GenericCommerceV1', 'd11d3080463d864ed0a4725646f20990f84702f1f13fa6d9915b2de6d8a27208', '[\"*\"]', NULL, '2023-10-26 11:24:11', '2023-10-26 11:24:11'),
(91, 'App\\Models\\User', 45, 'GenericCommerceV1', '88d6944accff99c0f1b0c32adc2ef8305c20bc43066dcb931aa3b8b78240bf41', '[\"*\"]', NULL, '2023-10-26 11:25:20', '2023-10-26 11:25:20'),
(92, 'App\\Models\\User', 45, 'GenericCommerceV1', 'b4ce8757cf1db2140c8791f32d1065b8aa805cb1eb2967048642010b128311a1', '[\"*\"]', NULL, '2023-10-26 11:25:21', '2023-10-26 11:25:21'),
(93, 'App\\Models\\User', 45, 'GenericCommerceV1', '253870807dd4f64d4c8bf48f889775d56b2f165cacf45eba262de7b297251936', '[\"*\"]', NULL, '2023-10-26 11:25:22', '2023-10-26 11:25:22'),
(94, 'App\\Models\\User', 45, 'GenericCommerceV1', '177e1000127c6ac1363a361d64d485ae4770c7c035b3550967bab9d052eb8dc7', '[\"*\"]', NULL, '2023-10-26 11:25:22', '2023-10-26 11:25:22'),
(95, 'App\\Models\\User', 45, 'GenericCommerceV1', '0d972a50bd53ab615235d3c67bf42001eef1e68e0c587aa38aef34d0b419c14f', '[\"*\"]', NULL, '2023-10-26 11:25:23', '2023-10-26 11:25:23'),
(96, 'App\\Models\\User', 45, 'GenericCommerceV1', '9d96a1c4d5481d1a18da50b7a4ee9ebbe043f6c0934ab6a783b71a5cf38f7487', '[\"*\"]', NULL, '2023-10-26 11:25:24', '2023-10-26 11:25:24'),
(97, 'App\\Models\\User', 45, 'GenericCommerceV1', '8a2c828f3047f160491c5bad10a8514f7c30b535783f46fa95d8352c8eeaef26', '[\"*\"]', NULL, '2023-10-26 11:25:25', '2023-10-26 11:25:25'),
(98, 'App\\Models\\User', 45, 'GenericCommerceV1', 'f4044fbbb8b50fed3e0ee3e85038f8b8d6d297afaaf2f989b6f25e08ba9a465a', '[\"*\"]', NULL, '2023-10-26 11:25:26', '2023-10-26 11:25:26'),
(99, 'App\\Models\\User', 45, 'GenericCommerceV1', 'd4e8409f25184e006812982e22fa630054180a065bb87ba6df59df2f5affb17d', '[\"*\"]', NULL, '2023-10-26 11:25:26', '2023-10-26 11:25:26'),
(100, 'App\\Models\\User', 45, 'GenericCommerceV1', '50ac7494f898d7080ef2cc99db780a0812c55c662ffa6918aeedeea31227d279', '[\"*\"]', NULL, '2023-10-26 11:25:27', '2023-10-26 11:25:27'),
(101, 'App\\Models\\User', 45, 'GenericCommerceV1', 'fb019988ce6546f2d871dccaf6a1699584c2bfed3890d935abb4f4228c394ea3', '[\"*\"]', NULL, '2023-10-26 11:38:54', '2023-10-26 11:38:54'),
(102, 'App\\Models\\User', 45, 'GenericCommerceV1', 'a84b18d6bd3cf1977d5e6c72edd5fbbab8143ab437b5ed7ef876190ff72e7806', '[\"*\"]', '2023-11-07 09:03:17', '2023-11-07 05:48:16', '2023-11-07 09:03:17'),
(103, 'App\\Models\\User', 45, 'GenericCommerceV1', '1367baa5b2ce8f17a0c485a66aca158e18bbe4b16edb804715643b270bb8ce7d', '[\"*\"]', NULL, '2023-11-12 10:51:38', '2023-11-12 10:51:38'),
(104, 'App\\Models\\User', 45, 'GenericCommerceV1', '495ae91f603d1d4408e72221e58598332b95c158e57805be5ade629e13dcffb4', '[\"*\"]', '2023-12-18 11:56:47', '2023-12-18 11:56:15', '2023-12-18 11:56:47'),
(105, 'App\\Models\\User', 2, 'GenericCommerceV1', '8c971e81e7569d08f0e80e2d6407b519daaad27d0dc4a45d959e39d78b711d0b', '[\"*\"]', '2024-08-28 05:33:51', '2024-08-28 05:19:16', '2024-08-28 05:33:51');

-- --------------------------------------------------------

--
-- Table structure for table `role_permissions`
--

CREATE TABLE `role_permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `role_name` varchar(255) DEFAULT NULL,
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `route` varchar(255) NOT NULL,
  `route_name` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_permissions`
--

INSERT INTO `role_permissions` (`id`, `role_id`, `role_name`, `permission_id`, `route`, `route_name`, `created_at`, `updated_at`) VALUES
(102, 1, 'System Operator', 113, 'submit/counter/checkout', 'SubmitCounterCheckout', '2025-02-06 07:59:34', NULL),
(103, 1, 'System Operator', 112, 'submit/counter/checkin', 'SubmitCounterCheckin', '2025-02-06 07:59:34', NULL),
(104, 1, 'System Operator', 110, 'view/counter/sessions', 'ViewCounterSessions', '2025-02-06 07:59:34', NULL),
(105, 1, 'System Operator', 73, 'print/toll/ticket/{slug}', 'PrintTollTicket', '2025-02-06 07:59:34', NULL),
(106, 1, 'System Operator', 71, 'view/toll/tickets', 'ViewTollTickets', '2025-02-06 07:59:34', NULL),
(107, 1, 'System Operator', 70, 'save/toll/ticket', 'SaveTollTicket', '2025-02-06 07:59:34', NULL),
(108, 1, 'System Operator', 69, 'create/toll/ticket', 'CreateTollTicket', '2025-02-06 07:59:34', NULL),
(109, 1, 'System Operator', 35, 'change/password', 'changePassword', '2025-02-06 07:59:34', NULL),
(110, 1, 'System Operator', 34, 'change/password/page', 'changePasswordPage', '2025-02-06 07:59:34', NULL),
(111, 1, 'System Operator', 33, 'clear/cache', 'ClearCache', '2025-02-06 07:59:34', NULL),
(112, 1, 'System Operator', 32, 'home', 'home', '2025-02-06 07:59:34', NULL),
(113, 1, 'System Operator', 31, 'password/confirm', NULL, '2025-02-06 07:59:34', NULL),
(114, 1, 'System Operator', 30, 'logout', 'logout', '2025-02-06 07:59:34', NULL),
(115, 1, 'System Operator', 29, 'login', NULL, '2025-02-06 07:59:34', NULL),
(116, 1, 'System Operator', 27, 'config-clear', NULL, '2025-02-06 07:59:34', NULL),
(117, 1, 'System Operator', 26, '/', NULL, '2025-02-06 07:59:34', NULL),
(118, 1, 'System Operator', 7, 'makesulg', NULL, '2025-02-06 07:59:34', NULL),
(119, 1, 'System Operator', 6, '_debugbar/queries/explain', 'debugbar.queries.explain', '2025-02-06 07:59:34', NULL),
(120, 1, 'System Operator', 5, '_debugbar/cache/{key}/{tags?}', 'debugbar.cache.delete', '2025-02-06 07:59:34', NULL),
(121, 1, 'System Operator', 4, '_debugbar/assets/javascript', 'debugbar.assets.js', '2025-02-06 07:59:34', NULL),
(122, 1, 'System Operator', 3, '_debugbar/assets/stylesheets', 'debugbar.assets.css', '2025-02-06 07:59:34', NULL),
(123, 1, 'System Operator', 2, '_debugbar/clockwork/{id}', 'debugbar.clockwork', '2025-02-06 07:59:34', NULL),
(124, 1, 'System Operator', 1, '_debugbar/open', 'debugbar.openhandler', '2025-02-06 07:59:34', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `terminals`
--

CREATE TABLE `terminals` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `terminals`
--

INSERT INTO `terminals` (`id`, `name`, `description`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Terminal-1', NULL, '1738661083NCBRK', 1, '2025-02-04 09:24:43', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `toll_tickets`
--

CREATE TABLE `toll_tickets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ticket_no` varchar(255) DEFAULT NULL,
  `terminal_id` bigint(20) UNSIGNED DEFAULT NULL,
  `terminal_name` varchar(255) DEFAULT NULL,
  `counter_id` int(11) DEFAULT NULL,
  `counter_name` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  `vehicle_type_id` bigint(20) UNSIGNED DEFAULT NULL,
  `vehicle_type_name` varchar(255) DEFAULT NULL,
  `ticket_price` double NOT NULL DEFAULT 0,
  `amount_given` varchar(255) DEFAULT NULL COMMENT 'During Transaction',
  `return_change` varchar(255) DEFAULT NULL COMMENT 'During Transaction',
  `payment_method` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1=>Cash;2=>bKash;3=>nagad;4=>Card',
  `driver_name` varchar(255) DEFAULT NULL,
  `driver_contact` varchar(255) DEFAULT NULL,
  `vehicle_reg_no` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1=>Active; 0=>Inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `toll_tickets`
--

INSERT INTO `toll_tickets` (`id`, `ticket_no`, `terminal_id`, `terminal_name`, `counter_id`, `counter_name`, `user_id`, `user_name`, `vehicle_type_id`, `vehicle_type_name`, `ticket_price`, `amount_given`, `return_change`, `payment_method`, `driver_name`, `driver_contact`, `vehicle_reg_no`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(1, '1738661110Vfl', 1, 'Terminal-1', NULL, NULL, 1, 'Admin', 1, 'Trailer (Loaded/Empty)', 565, NULL, NULL, 1, NULL, NULL, NULL, '1738661110pzLN6', 1, '2025-02-04 09:25:10', NULL),
(2, '1738661268dRN', 1, 'Terminal-1', NULL, NULL, 1, 'Admin', 1, 'Trailer (Loaded/Empty)', 565, NULL, NULL, 1, NULL, NULL, NULL, '1738661268zOl3Z', 1, '2025-02-04 09:27:48', NULL),
(3, '1738661275TVq', 1, 'Terminal-1', NULL, NULL, 1, 'Admin', 1, 'Trailer (Loaded/Empty)', 565, NULL, NULL, 1, NULL, NULL, NULL, '1738661275EamAT', 1, '2025-02-04 09:27:55', NULL),
(4, '1738661335ptK', 1, 'Terminal-1', NULL, NULL, 1, 'Admin', 1, 'Trailer (Loaded/Empty)', 565, NULL, NULL, 1, NULL, NULL, NULL, '173866133523f1M', 1, '2025-02-04 09:28:55', NULL),
(5, '1738661470USW', 1, 'Terminal-1', NULL, NULL, 1, 'Admin', 1, 'Trailer (Loaded/Empty)', 565, NULL, NULL, 1, NULL, NULL, NULL, '1738661470d3QfW', 1, '2025-02-04 09:31:10', NULL),
(6, '1738671959hZT', 1, 'Terminal-1', NULL, NULL, 1, 'Admin', 7, 'Mini Bus/Coaster', 80, NULL, NULL, 1, NULL, NULL, NULL, '1738671959yvxA2', 1, '2025-02-04 12:25:59', NULL),
(7, '1738750185Z4u', 1, 'Terminal-1', NULL, NULL, 1, 'Admin', 9, 'Four-Wheel Drive Vehicle', 60, NULL, NULL, 1, NULL, NULL, NULL, '1738750185LAWau', 1, '2025-02-05 15:09:45', NULL),
(8, '1738790113BJW', 1, 'Terminal-1', NULL, NULL, 1, 'Admin', 10, 'Sedan Car', 40, NULL, NULL, 1, NULL, NULL, NULL, '1738790113nKvlS', 1, '2025-02-06 02:15:13', NULL),
(9, '250206-1', 1, 'Terminal-1', NULL, NULL, 1, 'Admin', 11, 'Four-W Passenger Vehicle', 40, NULL, NULL, 1, NULL, NULL, NULL, '17387912309E4jN', 1, '2025-02-06 02:33:50', '2025-02-06 02:33:50'),
(10, '250206-2', 1, 'Terminal-1', NULL, NULL, 1, 'Admin', 11, 'Four-W Passenger Vehicle', 40, NULL, NULL, 1, NULL, NULL, NULL, '1738791413XF8QP', 1, '2025-02-06 02:36:53', '2025-02-06 02:36:53'),
(11, '250206-3', 1, 'Terminal-1', NULL, NULL, 1, 'Admin', 11, 'Four-W Passenger Vehicle', 40, NULL, NULL, 1, NULL, NULL, NULL, '1738791432lEptO', 1, '2025-02-06 02:37:12', '2025-02-06 02:37:12'),
(12, '250206-4', 1, 'Terminal-1', NULL, NULL, 1, 'Admin', 11, 'Four-W Passenger Vehicle', 40, NULL, NULL, 1, NULL, NULL, NULL, '1738791479roGYT', 1, '2025-02-06 02:37:59', '2025-02-06 02:37:59'),
(13, '250206-5', 1, 'Terminal-1', NULL, NULL, 1, 'Admin', 11, 'Four-W Passenger Vehicle', 40, NULL, NULL, 1, NULL, NULL, NULL, '1738791517vmVZB', 1, '2025-02-06 02:38:37', '2025-02-06 02:38:37'),
(14, '250206-6', 1, 'Terminal-1', NULL, NULL, 1, 'Admin', 11, 'Four-W Passenger Vehicle', 40, NULL, NULL, 1, NULL, NULL, NULL, '1738791546u6jXM', 1, '2025-02-06 02:39:06', '2025-02-06 02:39:06'),
(15, '250206-7', 1, 'Terminal-1', NULL, NULL, 1, 'Admin', 11, 'Four-W Passenger Vehicle', 40, NULL, NULL, 1, NULL, NULL, NULL, '1738791575CDZm6', 1, '2025-02-06 02:39:35', '2025-02-06 02:39:35'),
(16, '250206-8', 1, 'Terminal-1', NULL, NULL, 1, 'Admin', 11, 'Four-W Passenger Vehicle', 40, NULL, NULL, 1, NULL, NULL, NULL, '1738791588HTV3y', 1, '2025-02-06 02:39:48', '2025-02-06 02:39:48'),
(17, '250206-9', 1, 'Terminal-1', NULL, NULL, 1, 'Admin', 11, 'Four-W Passenger Vehicle', 40, NULL, NULL, 1, NULL, NULL, NULL, '1738791742BPN7b', 1, '2025-02-06 02:42:22', '2025-02-06 02:42:22'),
(18, '250206-10', 1, 'Terminal-1', NULL, NULL, 1, 'Admin', 9, 'Four-Wheel Drive Vehicle', 60, NULL, NULL, 1, NULL, NULL, NULL, '1738791846unZRE', 1, '2025-02-06 02:44:06', '2025-02-06 02:44:06'),
(19, '250206-11', 1, 'Terminal-1', NULL, NULL, 1, 'Admin', 9, 'Four-Wheel Drive Vehicle', 60, NULL, NULL, 1, NULL, NULL, NULL, '1738791858ZSieR', 1, '2025-02-06 02:44:18', '2025-02-06 02:44:18'),
(20, '250206-12', 1, 'Terminal-1', NULL, NULL, 1, 'Admin', 5, 'Mini Truck', 170, NULL, NULL, 1, NULL, NULL, NULL, '1738791890AUhbT', 1, '2025-02-06 02:44:50', '2025-02-06 02:44:50'),
(21, '250206-13', 1, 'Terminal-1', 1, 'Counter-1', 1, 'Admin', 5, 'Mini Truck', 170, NULL, NULL, 1, NULL, NULL, NULL, '1738804262xp14P', 1, '2025-02-06 06:11:02', '2025-02-06 06:11:02'),
(22, '250206-14', 1, 'Terminal-1', 3, 'Counter-2', 1, 'Admin', 7, 'Mini Bus/Coaster', 80, NULL, NULL, 1, NULL, NULL, NULL, '1738804319XBNe7', 1, '2025-02-06 06:11:59', '2025-02-06 06:11:59');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `terminal_id` int(11) DEFAULT NULL,
  `counter_id` int(11) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `verification_code` varchar(255) DEFAULT NULL COMMENT 'Used for Forget Password Verification',
  `password` varchar(255) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `user_type` tinyint(4) NOT NULL DEFAULT 3 COMMENT '1=>Admin; 2=>User/Shop; 3=>Customer',
  `address` longtext DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1=>Active; 0=>Inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `terminal_id`, `counter_id`, `image`, `name`, `phone`, `email`, `email_verified_at`, `verification_code`, `password`, `remember_token`, `user_type`, `address`, `status`, `created_at`, `updated_at`) VALUES
(1, NULL, NULL, NULL, 'Admin', '01900000000', 'admin@gmail.com', '2025-02-02 03:54:50', '12312', '$2y$12$oHWN0HLlomKGtI9bp503POf.uujhNJmq6bS3M8f3u0PAcrHZYLzEq', NULL, 1, 'Dhaka, Bangladesh', 1, '2025-02-02 03:54:50', NULL),
(3, 1, 3, NULL, 'Forrest Burks', '+1 (726) 844-4643', 'hevyxa@mailinator.com', NULL, NULL, '$2y$10$rSrK8VtefA9bjkkBoXP68.DEiDv0rlggb8OH7kNBfWKd4LFXYHXVW', NULL, 2, 'Dolor quos laboris s', 1, '2025-02-06 02:12:25', '2025-02-06 06:00:46');

-- --------------------------------------------------------

--
-- Table structure for table `user_roles`
--

CREATE TABLE `user_roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_roles`
--

INSERT INTO `user_roles` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'System Operator', NULL, '2025-02-02 09:00:23', '2025-02-06 07:59:34');

-- --------------------------------------------------------

--
-- Table structure for table `user_role_permissions`
--

CREATE TABLE `user_role_permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED DEFAULT NULL,
  `role_name` varchar(255) DEFAULT NULL,
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `route` varchar(255) NOT NULL,
  `route_name` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_role_permissions`
--

INSERT INTO `user_role_permissions` (`id`, `user_id`, `role_id`, `role_name`, `permission_id`, `route`, `route_name`, `created_at`, `updated_at`) VALUES
(1, 2, 1, 'System Operator', 73, 'print/toll/ticket/{slug}', 'PrintTollTicket', '2025-02-02 09:01:13', NULL),
(2, 2, 1, 'System Operator', 71, 'view/toll/tickets', 'ViewTollTickets', '2025-02-02 09:01:13', NULL),
(3, 2, 1, 'System Operator', 70, 'save/toll/ticket', 'SaveTollTicket', '2025-02-02 09:01:13', NULL),
(4, 2, 1, 'System Operator', 69, 'create/toll/ticket', 'CreateTollTicket', '2025-02-02 09:01:13', NULL),
(5, 2, 1, 'System Operator', 56, 'laravel-filemanager/demo', 'unisharp.lfm.', '2025-02-02 09:01:13', NULL),
(6, 2, 1, 'System Operator', 55, 'laravel-filemanager/delete', 'unisharp.lfm.getDelete', '2025-02-02 09:01:13', NULL),
(7, 2, 1, 'System Operator', 54, 'laravel-filemanager/download', 'unisharp.lfm.getDownload', '2025-02-02 09:01:13', NULL),
(8, 2, 1, 'System Operator', 53, 'laravel-filemanager/doresizenew', 'unisharp.lfm.performResizeNew', '2025-02-02 09:01:13', NULL),
(9, 2, 1, 'System Operator', 52, 'laravel-filemanager/doresize', 'unisharp.lfm.performResize', '2025-02-02 09:01:13', NULL),
(10, 2, 1, 'System Operator', 51, 'laravel-filemanager/resize', 'unisharp.lfm.getResize', '2025-02-02 09:01:13', NULL),
(11, 2, 1, 'System Operator', 50, 'laravel-filemanager/rename', 'unisharp.lfm.getRename', '2025-02-02 09:01:13', NULL),
(12, 2, 1, 'System Operator', 49, 'laravel-filemanager/cropnewimage', 'unisharp.lfm.getNewCropImage', '2025-02-02 09:01:13', NULL),
(13, 2, 1, 'System Operator', 48, 'laravel-filemanager/cropimage', 'unisharp.lfm.getCropImage', '2025-02-02 09:01:13', NULL),
(14, 2, 1, 'System Operator', 47, 'laravel-filemanager/crop', 'unisharp.lfm.getCrop', '2025-02-02 09:01:13', NULL),
(15, 2, 1, 'System Operator', 46, 'laravel-filemanager/folders', 'unisharp.lfm.getFolders', '2025-02-02 09:01:13', NULL),
(16, 2, 1, 'System Operator', 45, 'laravel-filemanager/newfolder', 'unisharp.lfm.getAddfolder', '2025-02-02 09:01:13', NULL),
(17, 2, 1, 'System Operator', 44, 'laravel-filemanager/domove', 'unisharp.lfm.doMove', '2025-02-02 09:01:13', NULL),
(18, 2, 1, 'System Operator', 43, 'laravel-filemanager/move', 'unisharp.lfm.move', '2025-02-02 09:01:13', NULL),
(19, 2, 1, 'System Operator', 42, 'laravel-filemanager/jsonitems', 'unisharp.lfm.getItems', '2025-02-02 09:01:13', NULL),
(20, 2, 1, 'System Operator', 41, 'laravel-filemanager/upload', 'unisharp.lfm.upload', '2025-02-02 09:01:13', NULL),
(21, 2, 1, 'System Operator', 40, 'laravel-filemanager/errors', 'unisharp.lfm.getErrors', '2025-02-02 09:01:13', NULL),
(22, 2, 1, 'System Operator', 39, 'laravel-filemanager', 'unisharp.lfm.show', '2025-02-02 09:01:13', NULL),
(23, 2, 1, 'System Operator', 38, 'file-manager', NULL, '2025-02-02 09:01:13', NULL),
(24, 2, 1, 'System Operator', 37, 'ckeditor/upload', 'ckeditor.upload', '2025-02-02 09:01:13', NULL),
(25, 2, 1, 'System Operator', 36, 'ckeditor', NULL, '2025-02-02 09:01:13', NULL),
(26, 2, 1, 'System Operator', 35, 'change/password', 'changePassword', '2025-02-02 09:01:13', NULL),
(27, 2, 1, 'System Operator', 34, 'change/password/page', 'changePasswordPage', '2025-02-02 09:01:13', NULL),
(28, 2, 1, 'System Operator', 33, 'clear/cache', 'ClearCache', '2025-02-02 09:01:13', NULL),
(29, 2, 1, 'System Operator', 32, 'home', 'home', '2025-02-02 09:01:13', NULL),
(30, 2, 1, 'System Operator', 31, 'password/confirm', NULL, '2025-02-02 09:01:13', NULL),
(31, 2, 1, 'System Operator', 30, 'logout', 'logout', '2025-02-02 09:01:13', NULL),
(32, 2, 1, 'System Operator', 29, 'login', NULL, '2025-02-02 09:01:13', NULL),
(33, 2, 1, 'System Operator', 28, 'storage-link', NULL, '2025-02-02 09:01:13', NULL),
(34, 2, 1, 'System Operator', 27, 'config-clear', NULL, '2025-02-02 09:01:13', NULL),
(35, 2, 1, 'System Operator', 26, '/', NULL, '2025-02-02 09:01:13', NULL),
(36, 2, 1, 'System Operator', 25, 'filemanager/demo', 'unisharp.lfm.', '2025-02-02 09:01:13', NULL),
(37, 2, 1, 'System Operator', 24, 'filemanager/delete', 'unisharp.lfm.getDelete', '2025-02-02 09:01:13', NULL),
(38, 2, 1, 'System Operator', 23, 'filemanager/download', 'unisharp.lfm.getDownload', '2025-02-02 09:01:13', NULL),
(39, 2, 1, 'System Operator', 22, 'filemanager/doresizenew', 'unisharp.lfm.performResizeNew', '2025-02-02 09:01:13', NULL),
(40, 2, 1, 'System Operator', 21, 'filemanager/doresize', 'unisharp.lfm.performResize', '2025-02-02 09:01:13', NULL),
(41, 2, 1, 'System Operator', 20, 'filemanager/resize', 'unisharp.lfm.getResize', '2025-02-02 09:01:13', NULL),
(42, 2, 1, 'System Operator', 19, 'filemanager/rename', 'unisharp.lfm.getRename', '2025-02-02 09:01:13', NULL),
(43, 2, 1, 'System Operator', 18, 'filemanager/cropnewimage', 'unisharp.lfm.getNewCropImage', '2025-02-02 09:01:13', NULL),
(44, 2, 1, 'System Operator', 17, 'filemanager/cropimage', 'unisharp.lfm.getCropImage', '2025-02-02 09:01:13', NULL),
(45, 2, 1, 'System Operator', 16, 'filemanager/crop', 'unisharp.lfm.getCrop', '2025-02-02 09:01:13', NULL),
(46, 2, 1, 'System Operator', 15, 'filemanager/folders', 'unisharp.lfm.getFolders', '2025-02-02 09:01:13', NULL),
(47, 2, 1, 'System Operator', 14, 'filemanager/newfolder', 'unisharp.lfm.getAddfolder', '2025-02-02 09:01:13', NULL),
(48, 2, 1, 'System Operator', 13, 'filemanager/domove', 'unisharp.lfm.doMove', '2025-02-02 09:01:13', NULL),
(49, 2, 1, 'System Operator', 12, 'filemanager/move', 'unisharp.lfm.move', '2025-02-02 09:01:13', NULL),
(50, 2, 1, 'System Operator', 11, 'filemanager/jsonitems', 'unisharp.lfm.getItems', '2025-02-02 09:01:13', NULL),
(51, 2, 1, 'System Operator', 10, 'filemanager/upload', 'unisharp.lfm.upload', '2025-02-02 09:01:13', NULL),
(52, 2, 1, 'System Operator', 9, 'filemanager/errors', 'unisharp.lfm.getErrors', '2025-02-02 09:01:13', NULL),
(53, 2, 1, 'System Operator', 8, 'filemanager', 'unisharp.lfm.show', '2025-02-02 09:01:13', NULL),
(54, 2, 1, 'System Operator', 7, 'makesulg', NULL, '2025-02-02 09:01:13', NULL),
(55, 2, 1, 'System Operator', 6, '_debugbar/queries/explain', 'debugbar.queries.explain', '2025-02-02 09:01:13', NULL),
(56, 2, 1, 'System Operator', 5, '_debugbar/cache/{key}/{tags?}', 'debugbar.cache.delete', '2025-02-02 09:01:13', NULL),
(57, 2, 1, 'System Operator', 4, '_debugbar/assets/javascript', 'debugbar.assets.js', '2025-02-02 09:01:13', NULL),
(58, 2, 1, 'System Operator', 3, '_debugbar/assets/stylesheets', 'debugbar.assets.css', '2025-02-02 09:01:13', NULL),
(59, 2, 1, 'System Operator', 2, '_debugbar/clockwork/{id}', 'debugbar.clockwork', '2025-02-02 09:01:13', NULL),
(60, 2, 1, 'System Operator', 1, '_debugbar/open', 'debugbar.openhandler', '2025-02-02 09:01:13', NULL),
(122, 3, 1, 'System Operator', 110, 'view/counter/sessions', 'ViewCounterSessions', '2025-02-06 07:59:20', NULL),
(123, 3, 1, 'System Operator', 73, 'print/toll/ticket/{slug}', 'PrintTollTicket', '2025-02-06 07:59:20', NULL),
(124, 3, 1, 'System Operator', 71, 'view/toll/tickets', 'ViewTollTickets', '2025-02-06 07:59:20', NULL),
(125, 3, 1, 'System Operator', 70, 'save/toll/ticket', 'SaveTollTicket', '2025-02-06 07:59:20', NULL),
(126, 3, 1, 'System Operator', 69, 'create/toll/ticket', 'CreateTollTicket', '2025-02-06 07:59:20', NULL),
(127, 3, 1, 'System Operator', 35, 'change/password', 'changePassword', '2025-02-06 07:59:20', NULL),
(128, 3, 1, 'System Operator', 34, 'change/password/page', 'changePasswordPage', '2025-02-06 07:59:20', NULL),
(129, 3, 1, 'System Operator', 33, 'clear/cache', 'ClearCache', '2025-02-06 07:59:20', NULL),
(130, 3, 1, 'System Operator', 32, 'home', 'home', '2025-02-06 07:59:20', NULL),
(131, 3, 1, 'System Operator', 31, 'password/confirm', NULL, '2025-02-06 07:59:20', NULL),
(132, 3, 1, 'System Operator', 30, 'logout', 'logout', '2025-02-06 07:59:20', NULL),
(133, 3, 1, 'System Operator', 29, 'login', NULL, '2025-02-06 07:59:20', NULL),
(134, 3, 1, 'System Operator', 27, 'config-clear', NULL, '2025-02-06 07:59:20', NULL),
(135, 3, 1, 'System Operator', 26, '/', NULL, '2025-02-06 07:59:20', NULL),
(136, 3, 1, 'System Operator', 7, 'makesulg', NULL, '2025-02-06 07:59:20', NULL),
(137, 3, 1, 'System Operator', 6, '_debugbar/queries/explain', 'debugbar.queries.explain', '2025-02-06 07:59:20', NULL),
(138, 3, 1, 'System Operator', 5, '_debugbar/cache/{key}/{tags?}', 'debugbar.cache.delete', '2025-02-06 07:59:20', NULL),
(139, 3, 1, 'System Operator', 4, '_debugbar/assets/javascript', 'debugbar.assets.js', '2025-02-06 07:59:20', NULL),
(140, 3, 1, 'System Operator', 3, '_debugbar/assets/stylesheets', 'debugbar.assets.css', '2025-02-06 07:59:20', NULL),
(141, 3, 1, 'System Operator', 2, '_debugbar/clockwork/{id}', 'debugbar.clockwork', '2025-02-06 07:59:20', NULL),
(142, 3, 1, 'System Operator', 1, '_debugbar/open', 'debugbar.openhandler', '2025-02-06 07:59:20', NULL),
(143, 3, NULL, NULL, 113, 'submit/counter/checkout', 'SubmitCounterCheckout', '2025-02-06 07:59:20', NULL),
(144, 3, NULL, NULL, 112, 'submit/counter/checkin', 'SubmitCounterCheckin', '2025-02-06 07:59:20', NULL),
(145, 3, NULL, NULL, 110, 'view/counter/sessions', 'ViewCounterSessions', '2025-02-06 07:59:20', NULL),
(146, 3, NULL, NULL, 73, 'print/toll/ticket/{slug}', 'PrintTollTicket', '2025-02-06 07:59:20', NULL),
(147, 3, NULL, NULL, 71, 'view/toll/tickets', 'ViewTollTickets', '2025-02-06 07:59:20', NULL),
(148, 3, NULL, NULL, 70, 'save/toll/ticket', 'SaveTollTicket', '2025-02-06 07:59:20', NULL),
(149, 3, NULL, NULL, 69, 'create/toll/ticket', 'CreateTollTicket', '2025-02-06 07:59:20', NULL),
(150, 3, NULL, NULL, 35, 'change/password', 'changePassword', '2025-02-06 07:59:20', NULL),
(151, 3, NULL, NULL, 34, 'change/password/page', 'changePasswordPage', '2025-02-06 07:59:20', NULL),
(152, 3, NULL, NULL, 33, 'clear/cache', 'ClearCache', '2025-02-06 07:59:20', NULL),
(153, 3, NULL, NULL, 32, 'home', 'home', '2025-02-06 07:59:20', NULL),
(154, 3, NULL, NULL, 31, 'password/confirm', NULL, '2025-02-06 07:59:20', NULL),
(155, 3, NULL, NULL, 30, 'logout', 'logout', '2025-02-06 07:59:20', NULL),
(156, 3, NULL, NULL, 29, 'login', NULL, '2025-02-06 07:59:20', NULL),
(157, 3, NULL, NULL, 27, 'config-clear', NULL, '2025-02-06 07:59:20', NULL),
(158, 3, NULL, NULL, 26, '/', NULL, '2025-02-06 07:59:20', NULL),
(159, 3, NULL, NULL, 7, 'makesulg', NULL, '2025-02-06 07:59:20', NULL),
(160, 3, NULL, NULL, 6, '_debugbar/queries/explain', 'debugbar.queries.explain', '2025-02-06 07:59:20', NULL),
(161, 3, NULL, NULL, 5, '_debugbar/cache/{key}/{tags?}', 'debugbar.cache.delete', '2025-02-06 07:59:20', NULL),
(162, 3, NULL, NULL, 4, '_debugbar/assets/javascript', 'debugbar.assets.js', '2025-02-06 07:59:20', NULL),
(163, 3, NULL, NULL, 3, '_debugbar/assets/stylesheets', 'debugbar.assets.css', '2025-02-06 07:59:20', NULL),
(164, 3, NULL, NULL, 2, '_debugbar/clockwork/{id}', 'debugbar.clockwork', '2025-02-06 07:59:20', NULL),
(165, 3, NULL, NULL, 1, '_debugbar/open', 'debugbar.openhandler', '2025-02-06 07:59:20', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vehicle_types`
--

CREATE TABLE `vehicle_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `type_name` varchar(255) DEFAULT NULL,
  `price` double NOT NULL DEFAULT 0,
  `description` longtext DEFAULT NULL,
  `color_code` varchar(255) DEFAULT NULL COMMENT 'For Toll Collection Receipt',
  `slug` varchar(255) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `serial` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `vehicle_types`
--

INSERT INTO `vehicle_types` (`id`, `icon`, `type_name`, `price`, `description`, `color_code`, `slug`, `status`, `serial`, `created_at`, `updated_at`) VALUES
(1, 'vehicle_type_icons/txTEM1738664174.png', 'Trailer', 565, 'কন্টেনার / ভারী যন্ত্রপাতি / ভারী মালামাল / পরিবহন সমষ্ঠি যান', NULL, '1738660623Bc427', 1, 12, '2025-02-04 09:17:03', '2025-02-04 10:50:39'),
(2, 'vehicle_type_icons/TDSrT1738664164.png', 'Heavy Truck', 260, 'তিন বা ততোধিক এক্সেল বিশিষ্ট ট্রাক, কাভার্ড ট্রাক, ভ্যান, কন্টেইনারবাহী ট্রাক, বেকার, ক্রেন এবং অন্যান্য আর্টিকুলেটেড যানবাহন।', NULL, '17386619455ecKp', 1, 11, '2025-02-04 09:39:05', '2025-02-04 10:50:39'),
(3, 'vehicle_type_icons/pwv5d1738664336.png', 'Medium Truck', 200, NULL, NULL, '1738664336RyK20', 1, 10, '2025-02-04 10:18:56', '2025-02-04 10:50:39'),
(4, 'vehicle_type_icons/1TxG91738664378.png', 'Large Bus', 150, NULL, NULL, '1738664378Miz73', 1, 9, '2025-02-04 10:19:38', '2025-02-04 10:50:39'),
(5, 'vehicle_type_icons/ZyliL1738664414.png', 'Mini Truck', 170, NULL, NULL, '1738664414W3EAo', 1, 8, '2025-02-04 10:20:14', '2025-02-04 10:50:39'),
(6, 'vehicle_type_icons/Jh6cx1738664436.png', 'Agricultural Vehicle', 75, NULL, NULL, '1738664436k09Zk', 1, 5, '2025-02-04 10:20:36', '2025-02-04 10:50:39'),
(7, 'vehicle_type_icons/uDjAM1738664459.png', 'Mini Bus/Coaster', 80, NULL, NULL, '1738664459Df1hn', 1, 7, '2025-02-04 10:20:59', '2025-02-04 10:50:39'),
(8, 'vehicle_type_icons/kHlIL1738664480.png', 'Microbus', 80, NULL, NULL, '17386644800TVhH', 1, 6, '2025-02-04 10:21:20', '2025-02-04 10:50:39'),
(9, 'vehicle_type_icons/Ewgso1738664524.png', 'Four-Wheel Drive Vehicle', 60, NULL, NULL, '1738664524QPMi1', 1, 4, '2025-02-04 10:22:04', '2025-02-04 10:50:39'),
(10, 'vehicle_type_icons/YTphR1738664553.png', 'Sedan Car', 40, NULL, NULL, '1738664553bEa4j', 1, 2, '2025-02-04 10:22:33', '2025-02-04 10:50:39'),
(11, 'vehicle_type_icons/6hNop1738664581.png', 'Four-W Passenger Vehicle', 40, NULL, NULL, '1738664581EeVFS', 1, 3, '2025-02-04 10:23:01', '2025-02-04 10:51:14'),
(12, 'vehicle_type_icons/OlhgK1738664613.png', 'Motorcycle', 10, NULL, NULL, '1738664613lANlW', 1, 1, '2025-02-04 10:23:33', '2025-02-04 10:53:52'),
(13, 'vehicle_type_icons/5QXs81738664648.png', 'Rickshaw Van, Rickshaw, Bicycle, Pushcart', 20, NULL, NULL, '17386646484eRf8', 1, 13, '2025-02-04 10:24:08', '2025-02-04 10:50:39');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `counters`
--
ALTER TABLE `counters`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `counter_sessions`
--
ALTER TABLE `counter_sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `counter_id` (`counter_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `general_infos`
--
ALTER TABLE `general_infos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `permission_routes`
--
ALTER TABLE `permission_routes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `role_permissions`
--
ALTER TABLE `role_permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `terminals`
--
ALTER TABLE `terminals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `toll_tickets`
--
ALTER TABLE `toll_tickets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_role_permissions`
--
ALTER TABLE `user_role_permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vehicle_types`
--
ALTER TABLE `vehicle_types`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `counters`
--
ALTER TABLE `counters`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `counter_sessions`
--
ALTER TABLE `counter_sessions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `general_infos`
--
ALTER TABLE `general_infos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=116;

--
-- AUTO_INCREMENT for table `permission_routes`
--
ALTER TABLE `permission_routes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=114;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=106;

--
-- AUTO_INCREMENT for table `role_permissions`
--
ALTER TABLE `role_permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=125;

--
-- AUTO_INCREMENT for table `terminals`
--
ALTER TABLE `terminals`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `toll_tickets`
--
ALTER TABLE `toll_tickets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user_roles`
--
ALTER TABLE `user_roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user_role_permissions`
--
ALTER TABLE `user_role_permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=166;

--
-- AUTO_INCREMENT for table `vehicle_types`
--
ALTER TABLE `vehicle_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
