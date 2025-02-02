-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 02, 2025 at 04:37 AM
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
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `general_infos`
--

INSERT INTO `general_infos` (`id`, `company_name`, `short_description`, `contact`, `email`, `address`, `ticket_header`, `ticket_title`, `created_at`, `updated_at`) VALUES
(1, 'তিস্তা সড়ক সেতু', 'তিস্তা সড়ক সেতু বাংলাদেশের রংপুর বিভাগের লালমনিরহাট জেলায় অবস্থিত একটি গুরুত্বপূর্ণ সেতু। এটি তিস্তা নদীর ওপর নির্মিত হয়ে রংপুর ও লালমনিরহাট জেলার মধ্যে সংযোগ স্থাপন করেছে। সেতুটি যানবাহন ও সাধারণ মানুষের যাতায়াত সহজতর করার পাশাপাশি বাণিজ্যিক ও অর্থনৈতিক কার্যক্রমে গুরুত্বপূর্ণ ভূমিকা রাখে।', '+88012345647890', 'sample@example.com', 'রংপুর, বাংলাদেশ', 'গণপ্রজাতন্ত্রী বাংলাদেশ সরকার সেতু বিভাগ, লালমনিরহাট', 'টোল আদায় রসিদ', NULL, '2025-01-31 23:22:39');

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
(112, '2025_02_01_025155_create_toll_tickets_table', 57);

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
(1, '_debugbar/open', 'debugbar.openhandler', 'GET', '2024-11-12 06:58:34', NULL),
(2, '_debugbar/clockwork/{id}', 'debugbar.clockwork', 'GET', '2024-11-12 06:58:34', NULL),
(3, '_debugbar/assets/stylesheets', 'debugbar.assets.css', 'GET', '2024-11-12 06:58:34', NULL),
(4, '_debugbar/assets/javascript', 'debugbar.assets.js', 'GET', '2024-11-12 06:58:34', NULL),
(5, '_debugbar/cache/{key}/{tags?}', 'debugbar.cache.delete', 'DELETE', '2024-11-12 06:58:34', NULL),
(6, '_debugbar/queries/explain', 'debugbar.queries.explain', 'POST', '2024-11-12 06:58:34', NULL),
(7, 'makesulg', NULL, 'POST', '2024-11-12 06:58:34', '2024-11-12 06:58:34'),
(8, 'filemanager', 'unisharp.lfm.show', 'GET', '2024-11-12 06:58:34', NULL),
(9, 'filemanager/errors', 'unisharp.lfm.getErrors', 'GET', '2024-11-12 06:58:34', NULL),
(10, 'filemanager/upload', 'unisharp.lfm.upload', 'GET', '2024-11-12 06:58:34', NULL),
(11, 'filemanager/jsonitems', 'unisharp.lfm.getItems', 'GET', '2024-11-12 06:58:34', NULL),
(12, 'filemanager/move', 'unisharp.lfm.move', 'GET', '2024-11-12 06:58:34', NULL),
(13, 'filemanager/domove', 'unisharp.lfm.doMove', 'GET', '2024-11-12 06:58:34', NULL),
(14, 'filemanager/newfolder', 'unisharp.lfm.getAddfolder', 'GET', '2024-11-12 06:58:34', NULL),
(15, 'filemanager/folders', 'unisharp.lfm.getFolders', 'GET', '2024-11-12 06:58:34', NULL),
(16, 'filemanager/crop', 'unisharp.lfm.getCrop', 'GET', '2024-11-12 06:58:34', NULL),
(17, 'filemanager/cropimage', 'unisharp.lfm.getCropImage', 'GET', '2024-11-12 06:58:34', NULL),
(18, 'filemanager/cropnewimage', 'unisharp.lfm.getNewCropImage', 'GET', '2024-11-12 06:58:34', NULL),
(19, 'filemanager/rename', 'unisharp.lfm.getRename', 'GET', '2024-11-12 06:58:34', NULL),
(20, 'filemanager/resize', 'unisharp.lfm.getResize', 'GET', '2024-11-12 06:58:34', NULL),
(21, 'filemanager/doresize', 'unisharp.lfm.performResize', 'GET', '2024-11-12 06:58:34', NULL),
(22, 'filemanager/doresizenew', 'unisharp.lfm.performResizeNew', 'GET', '2024-11-12 06:58:34', NULL),
(23, 'filemanager/download', 'unisharp.lfm.getDownload', 'GET', '2024-11-12 06:58:34', NULL),
(24, 'filemanager/delete', 'unisharp.lfm.getDelete', 'GET', '2024-11-12 06:58:34', NULL),
(25, 'filemanager/demo', 'unisharp.lfm.', 'GET', '2024-11-12 06:58:34', NULL),
(26, '/', NULL, 'GET', '2024-11-12 06:58:34', NULL),
(27, 'clear', NULL, 'GET', '2024-11-12 06:58:34', NULL),
(28, 'login', NULL, 'POST', '2024-11-12 06:58:34', '2024-11-12 06:58:34'),
(29, 'logout', 'logout', 'POST', '2024-11-12 06:58:34', NULL),
(30, 'password/confirm', NULL, 'POST', '2024-11-12 06:58:34', '2024-11-12 06:58:34'),
(31, 'home', 'home', 'GET', '2024-11-12 06:58:34', NULL),
(32, 'clear/cache', 'ClearCache', 'GET', '2024-11-12 06:58:34', NULL),
(33, 'change/password/page', 'changePasswordPage', 'GET', '2024-11-12 06:58:34', NULL),
(34, 'change/password', 'changePassword', 'POST', '2024-11-12 06:58:34', NULL),
(35, 'ckeditor', NULL, 'GET', '2024-11-12 06:58:34', NULL),
(36, 'ckeditor/upload', 'ckeditor.upload', 'POST', '2024-11-12 06:58:34', NULL),
(37, 'sslcommerz/order/payment', 'order.payment', 'GET', '2024-11-12 06:58:34', NULL),
(38, 'sslcommerz/success', 'payment.success', 'POST', '2024-11-12 06:58:34', NULL),
(39, 'sslcommerz/failure', 'failure', 'POST', '2024-11-12 06:58:34', NULL),
(40, 'sslcommerz/cancel', 'cancel', 'POST', '2024-11-12 06:58:34', NULL),
(41, 'sslcommerz/ipn', 'payment.ipn', 'POST', '2024-11-12 06:58:34', NULL),
(42, 'file-manager', NULL, 'GET', '2024-11-12 06:58:34', NULL),
(43, 'laravel-filemanager', 'unisharp.lfm.show', 'GET', '2024-11-12 06:58:34', NULL),
(44, 'laravel-filemanager/errors', 'unisharp.lfm.getErrors', 'GET', '2024-11-12 06:58:34', NULL),
(45, 'laravel-filemanager/upload', 'unisharp.lfm.upload', 'GET', '2024-11-12 06:58:34', NULL),
(46, 'laravel-filemanager/jsonitems', 'unisharp.lfm.getItems', 'GET', '2024-11-12 06:58:34', NULL),
(47, 'laravel-filemanager/move', 'unisharp.lfm.move', 'GET', '2024-11-12 06:58:34', NULL),
(48, 'laravel-filemanager/domove', 'unisharp.lfm.doMove', 'GET', '2024-11-12 06:58:34', NULL),
(49, 'laravel-filemanager/newfolder', 'unisharp.lfm.getAddfolder', 'GET', '2024-11-12 06:58:34', NULL),
(50, 'laravel-filemanager/folders', 'unisharp.lfm.getFolders', 'GET', '2024-11-12 06:58:34', NULL),
(51, 'laravel-filemanager/crop', 'unisharp.lfm.getCrop', 'GET', '2024-11-12 06:58:34', NULL),
(52, 'laravel-filemanager/cropimage', 'unisharp.lfm.getCropImage', 'GET', '2024-11-12 06:58:34', NULL),
(53, 'laravel-filemanager/cropnewimage', 'unisharp.lfm.getNewCropImage', 'GET', '2024-11-12 06:58:34', NULL),
(54, 'laravel-filemanager/rename', 'unisharp.lfm.getRename', 'GET', '2024-11-12 06:58:34', NULL),
(55, 'laravel-filemanager/resize', 'unisharp.lfm.getResize', 'GET', '2024-11-12 06:58:34', NULL),
(56, 'laravel-filemanager/doresize', 'unisharp.lfm.performResize', 'GET', '2024-11-12 06:58:34', NULL),
(57, 'laravel-filemanager/doresizenew', 'unisharp.lfm.performResizeNew', 'GET', '2024-11-12 06:58:34', NULL),
(58, 'laravel-filemanager/download', 'unisharp.lfm.getDownload', 'GET', '2024-11-12 06:58:34', NULL),
(59, 'laravel-filemanager/delete', 'unisharp.lfm.getDelete', 'GET', '2024-11-12 06:58:34', NULL),
(60, 'laravel-filemanager/demo', 'unisharp.lfm.', 'GET', '2024-11-12 06:58:34', NULL),
(61, 'config/setup', 'ConfigSetup', 'GET', '2024-11-12 06:58:34', NULL),
(62, 'update/config/setup', 'UpdateConfigSetup', 'POST', '2024-11-12 06:58:34', NULL),
(63, 'view/all/flags', 'ViewAllFlags', 'GET', '2024-11-12 06:58:34', NULL),
(64, 'delete/flag/{slug}', 'DeleteFlag', 'GET', '2024-11-12 06:58:34', NULL),
(65, 'feature/flag/{id}', 'FeatureFlag', 'GET', '2024-11-12 06:58:34', NULL),
(66, 'get/flag/info/{slug}', 'GetFlagInfo', 'GET', '2024-11-12 06:58:34', NULL),
(67, 'update/flag', 'UpdateFlagInfo', 'POST', '2024-11-12 06:58:34', NULL),
(68, 'create/new/flag', 'CreateNewFlag', 'POST', '2024-11-12 06:58:34', NULL),
(69, 'rearrange/flags', 'RearrangeFlags', 'GET', '2024-11-12 06:58:34', NULL),
(70, 'save/rearranged/flags', 'SaveRearrangedFlags', 'POST', '2024-11-12 06:58:34', NULL),
(71, 'view/all/units', 'ViewAllUnits', 'GET', '2024-11-12 06:58:34', NULL),
(72, 'delete/unit/{id}', 'DeleteUnit', 'GET', '2024-11-12 06:58:34', NULL),
(73, 'get/unit/info/{id}', 'GetUnitInfo', 'GET', '2024-11-12 06:58:34', NULL),
(74, 'update/unit', 'UpdateUnitInfo', 'POST', '2024-11-12 06:58:34', NULL),
(75, 'create/new/unit', 'CreateNewUnit', 'POST', '2024-11-12 06:58:34', NULL),
(76, 'view/all/sims', 'ViewAllSims', 'GET', '2024-11-12 06:58:34', NULL),
(77, 'delete/sim/{id}', 'DeleteSim', 'GET', '2024-11-12 06:58:34', NULL),
(78, 'get/sim/info/{id}', 'GetSimInfo', 'GET', '2024-11-12 06:58:34', NULL),
(79, 'update/sim', 'UpdateSimInfo', 'POST', '2024-11-12 06:58:34', NULL),
(80, 'create/new/sim', 'CreateNewSim', 'POST', '2024-11-12 06:58:34', NULL),
(81, 'create/new/device/condition', 'AddNewDeviceCondition', 'POST', '2024-11-12 06:58:34', NULL),
(82, 'view/all/device/conditions', 'ViewAllDeviceConditions', 'GET', '2024-11-12 06:58:34', NULL),
(83, 'delete/device/condition/{id}', 'DeleteDeviceCondition', 'GET', '2024-11-12 06:58:34', NULL),
(84, 'get/device/condition/info/{id}', 'GetDeviceConditionInfo', 'GET', '2024-11-12 06:58:34', NULL),
(85, 'update/device/condition', 'UpdateDeviceCondition', 'POST', '2024-11-12 06:58:34', NULL),
(86, 'rearrange/device/condition', 'RearrangeDeviceCondition', 'GET', '2024-11-12 06:58:34', NULL),
(87, 'save/rearranged/device/condition', 'SaveRearrangeDeviceCondition', 'POST', '2024-11-12 06:58:34', NULL),
(88, 'create/new/warrenty', 'AddNewProductWarrenty', 'POST', '2024-11-12 06:58:34', NULL),
(89, 'view/all/warrenties', 'ViewAllProductWarrenties', 'GET', '2024-11-12 06:58:34', NULL),
(90, 'delete/warrenty/{id}', 'DeleteProductWarrenty', 'GET', '2024-11-12 06:58:35', NULL),
(91, 'get/warrenty/info/{id}', 'GetProductWarrentyInfo', 'GET', '2024-11-12 06:58:35', NULL),
(92, 'update/warrenty', 'UpdateProductWarrenty', 'POST', '2024-11-12 06:58:35', NULL),
(93, 'rearrange/warrenty', 'RearrangeWarrenty', 'GET', '2024-11-12 06:58:35', NULL),
(94, 'save/rearranged/warrenty', 'SaveRearrangeWarrenties', 'POST', '2024-11-12 06:58:35', NULL),
(95, 'add/new/brand', 'AddNewBrand', 'GET', '2024-11-12 06:58:35', NULL),
(96, 'save/new/brand', 'SaveNewBrand', 'POST', '2024-11-12 06:58:35', NULL),
(97, 'view/all/brands', 'ViewAllBrands', 'GET', '2024-11-12 06:58:35', NULL),
(98, 'rearrange/brands', 'RearrangeBrands', 'GET', '2024-11-12 06:58:35', NULL),
(99, 'save/rearranged/brands', 'saveRearrangeBrands', 'POST', '2024-11-12 06:58:35', NULL),
(100, 'feature/brand/{id}', 'FeatureBrand', 'GET', '2024-11-12 06:58:35', NULL),
(101, 'edit/brand/{slug}', 'EditBrand', 'GET', '2024-11-12 06:58:35', NULL),
(102, 'update/brand', 'UpdateBrand', 'POST', '2024-11-12 06:58:35', NULL),
(103, 'delete/brand/{slug}', 'DeleteBrand', 'GET', '2024-11-12 06:58:35', NULL),
(104, 'add/new/model', 'AddNewModel', 'GET', '2024-11-12 06:58:35', NULL),
(105, 'save/new/model', 'SaveNewModel', 'POST', '2024-11-12 06:58:35', NULL),
(106, 'view/all/models', 'ViewAllModels', 'GET', '2024-11-12 06:58:35', NULL),
(107, 'delete/model/{id}', 'DeleteModel', 'GET', '2024-11-12 06:58:35', NULL),
(108, 'edit/model/{slug}', 'EditModel', 'GET', '2024-11-12 06:58:35', NULL),
(109, 'update/model', 'UpdateModel', 'POST', '2024-11-12 06:58:35', NULL),
(110, 'brand/wise/model', 'BrandWiseModel', 'POST', '2024-11-12 06:58:35', NULL),
(111, 'create/new/color', 'AddNewColor', 'POST', '2024-11-12 06:58:35', NULL),
(112, 'view/all/colors', 'ViewAllColors', 'GET', '2024-11-12 06:58:35', NULL),
(113, 'delete/color/{id}', 'DeleteColor', 'GET', '2024-11-12 06:58:35', NULL),
(114, 'get/color/info/{id}', 'GetColorInfo', 'GET', '2024-11-12 06:58:35', NULL),
(115, 'update/color', 'UpdateColor', 'POST', '2024-11-12 06:58:35', NULL),
(116, 'create/new/storage', 'AddNewStorage', 'POST', '2024-11-12 06:58:35', NULL),
(117, 'view/all/storages', 'ViewAllStorages', 'GET', '2024-11-12 06:58:35', NULL),
(118, 'delete/storage/{id}', 'DeleteStorage', 'GET', '2024-11-12 06:58:35', NULL),
(119, 'get/storage/info/{id}', 'GetStorageInfo', 'GET', '2024-11-12 06:58:35', NULL),
(120, 'update/storage', 'UpdateStorage', 'POST', '2024-11-12 06:58:35', NULL),
(121, 'rearrange/storage/types', 'RearrangeStorage', 'GET', '2024-11-12 06:58:35', NULL),
(122, 'save/rearranged/storages', 'SaveRearrangeStorage', 'POST', '2024-11-12 06:58:35', NULL),
(123, 'view/all/sizes', 'ViewAllSizes', 'GET', '2024-11-12 06:58:35', NULL),
(124, 'delete/size/{id}', 'DeleteSize', 'GET', '2024-11-12 06:58:35', NULL),
(125, 'get/size/info/{id}', 'GetSizeInfo', 'GET', '2024-11-12 06:58:35', NULL),
(126, 'update/size', 'UpdateSizeInfo', 'POST', '2024-11-12 06:58:35', NULL),
(127, 'create/new/size', 'CreateNewSize', 'POST', '2024-11-12 06:58:35', NULL),
(128, 'rearrange/size', 'RearrangeSize', 'GET', '2024-11-12 06:58:35', NULL),
(129, 'save/rearranged/sizes', 'SaveRearrangedSizes', 'POST', '2024-11-12 06:58:35', NULL),
(130, 'view/email/credential', 'ViewEmailCredentials', 'GET', '2024-11-12 06:58:35', NULL),
(131, 'view/email/templates', 'ViewEmailTemplates', 'GET', '2024-11-12 06:58:35', NULL),
(132, 'change/mail/template/status/{templateId}', 'ChangeMailTemplateStatus', 'GET', '2024-11-12 06:58:35', NULL),
(133, 'save/new/email/configure', 'SaveEmailCredential', 'POST', '2024-11-12 06:58:35', NULL),
(134, 'delete/email/config/{slug}', 'DeleteEmailCredential', 'GET', '2024-11-12 06:58:35', NULL),
(135, 'get/email/config/info/{slug}', 'GetEmailCredentialInfo', 'GET', '2024-11-12 06:58:35', NULL),
(136, 'update/email/config', 'UpdateEmailCredentialInfo', 'POST', '2024-11-12 06:58:35', NULL),
(137, 'setup/sms/gateways', 'ViewSmsGateways', 'GET', '2024-11-12 06:58:35', NULL),
(138, 'update/sms/gateway/info', 'UpdateSmsGatewayInfo', 'POST', '2024-11-12 06:58:35', NULL),
(139, 'change/gateway/status/{provider}', 'ChangeGatewayStatus', 'GET', '2024-11-12 06:58:35', NULL),
(140, 'setup/payment/gateways', 'ViewPaymentGateways', 'GET', '2024-11-12 06:58:35', NULL),
(141, 'update/payment/gateway/info', 'UpdatePaymentGatewayInfo', 'POST', '2024-11-12 06:58:35', NULL),
(142, 'change/payment/gateway/status/{provider}', 'ChangePaymentGatewayStatus', 'GET', '2024-11-12 06:58:35', NULL),
(143, 'buy/sell/config', 'BuySellConfig', 'GET', '2024-11-12 06:58:35', NULL),
(144, 'save/buy/sell/config', 'BuySellConfigUpdate', 'POST', '2024-11-12 06:58:35', NULL),
(145, 'create/buy/sell/category', 'BuySellCategoryCreateNew', 'GET', '2024-11-12 06:58:35', NULL),
(146, 'save/buy/sell/category', 'BuySellCategorySave', 'POST', '2024-11-12 06:58:35', NULL),
(147, 'view/buy/sell/categories', 'BuySellCategoryView', 'GET', '2024-11-12 06:58:35', NULL),
(148, 'delete/buy/sell/category/{slug}', 'BuySellCategoryDelete', 'GET', '2024-11-12 06:58:35', NULL),
(149, 'edit/buy/sell/category/{slug}', 'BuySellCategoryEdit', 'GET', '2024-11-12 06:58:35', NULL),
(150, 'update/buy/sell/category', 'BuySellCategoryUpdate', 'POST', '2024-11-12 06:58:35', NULL),
(151, 'rearrange/buy/sell/categories', 'BuySellCategoryRearrange', 'GET', '2024-11-12 06:58:35', NULL),
(152, 'save/rearranged/buy/sell/categories', 'BuySellCategoryRearrangeSave', 'POST', '2024-11-12 06:58:35', NULL),
(153, 'buy/sell/listing', 'BuySellListing', 'GET', '2024-11-12 06:58:35', NULL),
(154, 'delete/buy/sell/listing/{slug}', 'BuySellListingDelete', 'GET', '2024-11-12 06:58:35', NULL),
(155, 'approve/buy/sell/listing/{slug}', 'BuySellListingApprove', 'GET', '2024-11-12 06:58:35', NULL),
(156, 'deny/buy/sell/listing/{slug}', 'BuySellListingDeny', 'GET', '2024-11-12 06:58:35', NULL),
(157, 'view/payment/history', 'ViewPaymentHistory', 'GET', '2024-11-12 06:58:35', NULL),
(158, 'add/new/category', 'AddNewCategory', 'GET', '2024-11-12 06:58:35', NULL),
(159, 'save/new/category', 'SaveNewCategory', 'POST', '2024-11-12 06:58:35', NULL),
(160, 'view/all/category', 'ViewAllCategory', 'GET', '2024-11-12 06:58:35', NULL),
(161, 'delete/category/{slug}', 'DeleteCategory', 'GET', '2024-11-12 06:58:35', NULL),
(162, 'feature/category/{slug}', 'FeatureCategory', 'GET', '2024-11-12 06:58:35', NULL),
(163, 'edit/category/{slug}', 'EditCategory', 'GET', '2024-11-12 06:58:35', NULL),
(164, 'update/category', 'UpdateCategory', 'POST', '2024-11-12 06:58:35', NULL),
(165, 'rearrange/category', 'RearrangeCategory', 'GET', '2024-11-12 06:58:35', NULL),
(166, 'save/rearranged/order', 'SaveRearrangeCategoryOrder', 'POST', '2024-11-12 06:58:35', NULL),
(167, 'add/new/subcategory', 'AddNewSubcategory', 'GET', '2024-11-12 06:58:35', NULL),
(168, 'save/new/subcategory', 'SaveNewSubcategory', 'POST', '2024-11-12 06:58:35', NULL),
(169, 'view/all/subcategory', 'ViewAllSubcategory', 'GET', '2024-11-12 06:58:35', NULL),
(170, 'delete/subcategory/{slug}', 'DeleteSubcategory', 'GET', '2024-11-12 06:58:35', NULL),
(171, 'feature/subcategory/{id}', 'FeatureSubcategory', 'GET', '2024-11-12 06:58:35', NULL),
(172, 'edit/subcategory/{slug}', 'EditSubcategory', 'GET', '2024-11-12 06:58:35', NULL),
(173, 'update/subcategory', 'UpdateSubcategory', 'POST', '2024-11-12 06:58:35', NULL),
(174, 'rearrange/subcategory', 'RearrangeSubcategory', 'GET', '2024-11-12 06:58:35', NULL),
(175, 'save/rearranged/subcategory', 'SaveRearrangedSubcategory', 'POST', '2024-11-12 06:58:35', NULL),
(176, 'add/new/childcategory', 'AddNewChildcategory', 'GET', '2024-11-12 06:58:35', NULL),
(177, 'category/wise/subcategory', 'SubcategoryCategoryWise', 'POST', '2024-11-12 06:58:35', NULL),
(178, 'save/new/childcategory', 'SaveNewChildcategory', 'POST', '2024-11-12 06:58:35', NULL),
(179, 'view/all/childcategory', 'ViewAllChildcategory', 'GET', '2024-11-12 06:58:35', NULL),
(180, 'delete/childcategory/{slug}', 'DeleteChildcategory', 'GET', '2024-11-12 06:58:35', NULL),
(181, 'edit/childcategory/{slug}', 'EditChildcategory', 'GET', '2024-11-12 06:58:35', NULL),
(182, 'update/childcategory', 'UpdateChildcategory', 'POST', '2024-11-12 06:58:35', NULL),
(183, 'add/new/product', 'AddNewProduct', 'GET', '2024-11-12 06:58:35', NULL),
(184, 'subcategory/wise/childcategory', 'ChildcategorySubcategoryWise', 'POST', '2024-11-12 06:58:35', NULL),
(185, 'save/new/product', 'SaveNewProduct', 'POST', '2024-11-12 06:58:35', NULL),
(186, 'view/all/product', 'ViewAllProducts', 'GET', '2024-11-12 06:58:35', NULL),
(187, 'delete/product/{slug}', 'DeleteProduct', 'GET', '2024-11-12 06:58:35', NULL),
(188, 'edit/product/{slug}', 'EditProduct', 'GET', '2024-11-12 06:58:35', NULL),
(189, 'update/product', 'UpdateProduct', 'POST', '2024-11-12 06:58:35', NULL),
(190, 'add/another/variant', 'AddAnotherVariant', 'POST', '2024-11-12 06:58:35', NULL),
(191, 'delete/product/variant/{id}', 'DeleteProductVariant', 'GET', '2024-11-12 06:58:35', NULL),
(192, 'products/from/excel', 'ProductsFromExcel', 'GET', '2024-11-12 06:58:35', NULL),
(193, 'upload/product/from/excel', 'UploadProductsFromExcel', 'POST', '2024-11-12 06:58:35', NULL),
(194, 'generate/demo/products', 'GenerateDemoProducts', 'GET', '2024-11-12 06:58:35', NULL),
(195, 'save/generated/demo/products', 'SaveGeneratedDemoProducts', 'POST', '2024-11-12 06:58:35', NULL),
(196, 'remove/demo/products/page', 'RemoveDemoProductsPage', 'GET', '2024-11-12 06:58:35', NULL),
(197, 'remove/demo/products', 'RemoveDemoProducts', 'GET', '2024-11-12 06:58:35', NULL),
(198, 'view/product/reviews', 'ViewAllProductReviews', 'GET', '2024-11-12 06:58:35', NULL),
(199, 'approve/product/review/{slug}', 'ApproveProductReview', 'GET', '2024-11-12 06:58:35', NULL),
(200, 'delete/product/review/{slug}', 'DeleteProductReview', 'GET', '2024-11-12 06:58:35', NULL),
(201, 'get/product/review/info/{id}', 'GetProductReviewInfo', 'GET', '2024-11-12 06:58:35', NULL),
(202, 'submit/reply/product/review', 'SubmitReplyOfProductReview', 'POST', '2024-11-12 06:58:35', NULL),
(203, 'view/product/question/answer', 'ViewAllQuestionAnswer', 'GET', '2024-11-12 06:58:35', NULL),
(204, 'delete/question/answer/{id}', 'DeleteQuestionAnswer', 'GET', '2024-11-12 06:58:35', NULL),
(205, 'get/question/answer/info/{id}', 'GetQuestionAnswerInfo', 'GET', '2024-11-12 06:58:35', NULL),
(206, 'submit/question/answer', 'SubmitAnswerOfQuestion', 'POST', '2024-11-12 06:58:35', NULL),
(207, 'terms/and/condition', 'ViewTermsAndCondition', 'GET', '2024-11-12 06:58:35', NULL),
(208, 'update/terms', 'UpdateTermsAndCondition', 'POST', '2024-11-12 06:58:35', NULL),
(209, 'view/privacy/policy', 'ViewPrivacyPolicy', 'GET', '2024-11-12 06:58:35', NULL),
(210, 'update/privacy/policy', 'UpdatePrivacyPolicy', 'POST', '2024-11-12 06:58:35', NULL),
(211, 'view/shipping/policy', 'ViewShippingPolicy', 'GET', '2024-11-12 06:58:35', NULL),
(212, 'update/shipping/policy', 'UpdateShippingPolicy', 'POST', '2024-11-12 06:58:35', NULL),
(213, 'view/return/policy', 'ViewReturnPolicy', 'GET', '2024-11-12 06:58:35', NULL),
(214, 'update/return/policy', 'UpdateReturnPolicy', 'POST', '2024-11-12 06:58:35', NULL),
(215, 'view/all/customers', 'ViewAllCustomers', 'GET', '2024-11-12 06:58:35', NULL),
(216, 'view/system/users', 'ViewAllSystemUsers', 'GET', '2024-11-12 06:58:35', NULL),
(217, 'add/new/system/user', 'AddNewSystemUsers', 'GET', '2024-11-12 06:58:35', NULL),
(218, 'create/system/user', 'CreateSystemUsers', 'POST', '2024-11-12 06:58:35', NULL),
(219, 'edit/system/user/{id}', 'EditSystemUser', 'GET', '2024-11-12 06:58:35', NULL),
(220, 'delete/system/user/{id}', 'DeleteSystemUser', 'GET', '2024-11-12 06:58:35', NULL),
(221, 'update/system/user', 'UpdateSystemUser', 'POST', '2024-11-12 06:58:35', NULL),
(222, 'make/user/superadmin/{id}', 'MakeSuperAdmin', 'GET', '2024-11-12 06:58:35', NULL),
(223, 'revoke/user/superadmin/{id}', 'RevokeSuperAdmin', 'GET', '2024-11-12 06:58:35', NULL),
(224, 'change/user/status/{id}', 'ChangeUserStatus', 'GET', '2024-11-12 06:58:35', NULL),
(225, 'delete/customer/{id}', 'DeleteCustomer', 'GET', '2024-11-12 06:58:35', NULL),
(226, 'about/us/page', 'AboutUsPage', 'GET', '2024-11-12 06:58:35', NULL),
(227, 'update/about/us', 'UpdateAboutUsPage', 'POST', '2024-11-12 06:58:35', NULL),
(228, 'general/info', 'GeneralInfo', 'GET', '2024-11-12 06:58:35', NULL),
(229, 'update/general/info', 'UpdateGeneralInfo', 'POST', '2024-11-12 06:58:35', NULL),
(230, 'website/theme/page', 'WebsiteThemePage', 'GET', '2024-11-12 06:58:35', NULL),
(231, 'update/website/theme/color', 'UpdateWebsiteThemeColor', 'POST', '2024-11-12 06:58:35', NULL),
(232, 'social/media/page', 'SocialMediaPage', 'GET', '2024-11-12 06:58:35', NULL),
(233, 'update/social/media/link', 'UpdateSocialMediaLinks', 'POST', '2024-11-12 06:58:35', NULL),
(234, 'seo/homepage', 'SeoHomePage', 'GET', '2024-11-12 06:58:35', NULL),
(235, 'update/seo/homepage', 'UpdateSeoHomePage', 'POST', '2024-11-12 06:58:35', NULL),
(236, 'custom/css/js', 'CustomCssJs', 'GET', '2024-11-12 06:58:35', NULL),
(237, 'update/custom/css/js', 'UpdateCustomCssJs', 'POST', '2024-11-12 06:58:35', NULL),
(238, 'social/chat/script/page', 'SocialChatScriptPage', 'GET', '2024-11-12 06:58:35', NULL),
(239, 'update/google/recaptcha', 'UpdateGoogleRecaptcha', 'POST', '2024-11-12 06:58:35', NULL),
(240, 'update/google/analytic', 'UpdateGoogleAnalytic', 'POST', '2024-11-12 06:58:35', NULL),
(241, 'update/google/tag/manager', 'updateGoogleTagManager', 'POST', '2024-11-12 06:58:35', NULL),
(242, 'update/social/login/info', 'UpdateSocialLogin', 'POST', '2024-11-12 06:58:35', NULL),
(243, 'update/facebook/pixel', 'UpdateFacebookPixel', 'POST', '2024-11-12 06:58:35', NULL),
(244, 'update/messenger/chat/info', 'UpdateMessengerChat', 'POST', '2024-11-12 06:58:35', NULL),
(245, 'update/tawk/chat/info', 'UpdateTawkChat', 'POST', '2024-11-12 06:58:35', NULL),
(246, 'update/crisp/chat/info', 'UpdateCrispChat', 'POST', '2024-11-12 06:58:35', NULL),
(247, 'change/guest/checkout/status', 'ChangeGuestCheckoutStatus', 'GET', '2024-11-12 06:58:35', NULL),
(248, 'view/all/faqs', 'ViewAllFaqs', 'GET', '2024-11-12 06:58:35', NULL),
(249, 'add/new/faq', 'AddNewFaq', 'GET', '2024-11-12 06:58:35', NULL),
(250, 'save/faq', 'SaveFaq', 'POST', '2024-11-12 06:58:35', NULL),
(251, 'delete/faq/{slug}', 'DeleteFaq', 'GET', '2024-11-12 06:58:35', NULL),
(252, 'edit/faq/{slug}', 'EditFaq', 'GET', '2024-11-12 06:58:35', NULL),
(253, 'update/faq', 'UpdateFaq', 'POST', '2024-11-12 06:58:35', NULL),
(254, 'view/all/sliders', 'ViewAllSliders', 'GET', '2024-11-12 06:58:35', NULL),
(255, 'add/new/slider', 'AddNewSlider', 'GET', '2024-11-12 06:58:35', NULL),
(256, 'save/new/slider', 'SaveNewSlider', 'POST', '2024-11-12 06:58:35', NULL),
(257, 'edit/slider/{slug}', 'EditSlider', 'GET', '2024-11-12 06:58:35', NULL),
(258, 'update/slider', 'UpdateSlider', 'POST', '2024-11-12 06:58:35', NULL),
(259, 'rearrange/slider', 'RearrangeSlider', 'GET', '2024-11-12 06:58:35', NULL),
(260, 'update/slider/rearranged/order', 'UpdateRearrangedSliders', 'POST', '2024-11-12 06:58:35', NULL),
(261, 'delete/data/{slug}', 'DeleteSliderBanner', 'GET', '2024-11-12 06:58:35', NULL),
(262, 'view/all/banners', 'ViewAllBanners', 'GET', '2024-11-12 06:58:35', NULL),
(263, 'add/new/banner', 'AddNewBanner', 'GET', '2024-11-12 06:58:35', NULL),
(264, 'save/new/banner', 'SaveNewBanner', 'POST', '2024-11-12 06:58:35', NULL),
(265, 'edit/banner/{slug}', 'EditBanner', 'GET', '2024-11-12 06:58:36', NULL),
(266, 'update/banner', 'UpdateBanner', 'POST', '2024-11-12 06:58:36', NULL),
(267, 'rearrange/banners', 'RearrangeBanners', 'GET', '2024-11-12 06:58:36', NULL),
(268, 'update/banners/rearranged/order', 'UpdateRearrangedBanners', 'POST', '2024-11-12 06:58:36', NULL),
(269, 'view/promotional/banner', 'ViewPromotionalBanner', 'GET', '2024-11-12 06:58:36', NULL),
(270, 'update/promotional/banner', 'UpdatePromotionalBanner', 'POST', '2024-11-12 06:58:36', NULL),
(271, 'remove/promotional/banner/header/icon', 'RemovePromotionalHeaderIcon', 'GET', '2024-11-12 06:58:36', NULL),
(272, 'remove/promotional/banner/product/image', 'RemovePromotionalProductImage', 'GET', '2024-11-12 06:58:36', NULL),
(273, 'remove/promotional/banner/bg/image', 'RemovePromotionalBackgroundImage', 'GET', '2024-11-12 06:58:36', NULL),
(274, 'view/all/contact/requests', 'ViewAllContactRequests', 'GET', '2024-11-12 06:58:36', NULL),
(275, 'delete/contact/request/{id}', 'DeleteContactRequests', 'GET', '2024-11-12 06:58:36', NULL),
(276, 'change/request/status/{id}', 'ChangeRequestStatus', 'GET', '2024-11-12 06:58:36', NULL),
(277, 'create/new/order', 'CreateNewOrder', 'GET', '2024-11-12 06:58:36', NULL),
(278, 'product/live/search', 'ProductLiveSearch', 'POST', '2024-11-12 06:58:36', NULL),
(279, 'get/pos/product/variants', 'GetProductVariants', 'POST', '2024-11-12 06:58:36', NULL),
(280, 'check/pos/product/variant', 'CheckProductVariant', 'POST', '2024-11-12 06:58:36', NULL),
(281, 'add/to/cart', 'AddToCart', 'POST', '2024-11-12 06:58:36', NULL),
(282, 'remove/cart/item/{index}', 'RemoveCartItem', 'GET', '2024-11-12 06:58:36', NULL),
(283, 'update/cart/item/{index}/{qty}', 'UpdateCartItem', 'GET', '2024-11-12 06:58:36', NULL),
(284, 'save/new/customer', 'SaveNewCustomer', 'POST', '2024-11-12 06:58:36', NULL),
(285, 'update/order/total/{shipping_charge}/{discount}', 'UpdateOrderTotal', 'GET', '2024-11-12 06:58:36', NULL),
(286, 'apply/coupon', 'ApplyCoupon', 'POST', '2024-11-12 06:58:36', NULL),
(287, 'district/wise/thana', 'DistrictWiseThana', 'POST', '2024-11-12 06:58:36', NULL),
(288, 'district/wise/thana/by/name', 'DistrictWiseThanaByName', 'POST', '2024-11-12 06:58:36', NULL),
(289, 'save/pos/customer/address', 'SaveCustomerAddress', 'POST', '2024-11-12 06:58:36', NULL),
(290, 'get/saved/address/{user_id}', 'GetSavedAddress', 'GET', '2024-11-12 06:58:36', NULL),
(291, 'change/delivery/method', 'ChangeDeliveryMethod', 'POST', '2024-11-12 06:58:36', NULL),
(292, 'place/order', 'PlaceOrder', 'POST', '2024-11-12 06:58:36', NULL),
(293, 'view/orders', 'ViewAllOrders', 'GET', '2024-11-12 06:58:36', NULL),
(294, 'order/details/{slug}', 'OrderDetails', 'GET', '2024-11-12 06:58:36', NULL),
(295, 'cancel/order/{slug}', 'CancelOrder', 'GET', '2024-11-12 06:58:36', NULL),
(296, 'approve/order/{slug}', 'ApproveOrder', 'GET', '2024-11-12 06:58:36', NULL),
(297, 'intransit/order/{slug}', 'IntransitOrder', 'GET', '2024-11-12 06:58:36', NULL),
(298, 'deliver/order/{slug}', 'DeliverOrder', 'GET', '2024-11-12 06:58:36', NULL),
(299, 'order/info/update', 'OrderInfoUpdate', 'POST', '2024-11-12 06:58:36', NULL),
(300, 'order/edit/{slug}', 'OrderEdit', 'GET', '2024-11-12 06:58:36', NULL),
(301, 'order/update', 'OrderUpdate', 'POST', '2024-11-12 06:58:36', NULL),
(302, 'add/more/product', 'AddMoreProduct', 'POST', '2024-11-12 06:58:36', NULL),
(303, 'get/product/variants', 'GetProductVariants', 'POST', '2024-11-12 06:58:36', NULL),
(304, 'delete/order/{slug}', 'DeleteOrder', 'GET', '2024-11-12 06:58:36', NULL),
(305, 'add/new/code', 'AddPromoCode', 'GET', '2024-11-12 06:58:36', NULL),
(306, 'save/promo/code', 'SavePromoCode', 'POST', '2024-11-12 06:58:36', NULL),
(307, 'view/all/promo/codes', 'ViewAllPromoCodes', 'GET', '2024-11-12 06:58:36', NULL),
(308, 'edit/promo/code/{slug}', 'EditPromoCode', 'GET', '2024-11-12 06:58:36', NULL),
(309, 'update/promo/code', 'UpdatePromoCode', 'POST', '2024-11-12 06:58:36', NULL),
(310, 'remove/promo/code/{slug}', 'RemovePromoCode', 'GET', '2024-11-12 06:58:36', NULL),
(311, 'view/customers/wishlist', 'CustomersWishlist', 'GET', '2024-11-12 06:58:36', NULL),
(312, 'pending/support/tickets', 'PendingSupportTickets', 'GET', '2024-11-12 06:58:36', NULL),
(313, 'solved/support/tickets', 'SolvedSupportTickets', 'GET', '2024-11-12 06:58:36', NULL),
(314, 'on/hold/support/tickets', 'OnHoldSupportTickets', 'GET', '2024-11-12 06:58:36', NULL),
(315, 'rejected/support/tickets', 'RejectedSupportTickets', 'GET', '2024-11-12 06:58:36', NULL),
(316, 'delete/support/ticket/{slug}', 'DeleteSupportTicket', 'GET', '2024-11-12 06:58:36', NULL),
(317, 'support/status/change/{slug}', 'ChangeStatusSupport', 'GET', '2024-11-12 06:58:36', NULL),
(318, 'support/status/on/hold/{slug}', 'ChangeStatusSupportOnHold', 'GET', '2024-11-12 06:58:36', NULL),
(319, 'support/status/in/progress/{slug}', 'ChangeStatusSupportInProgress', 'GET', '2024-11-12 06:58:36', NULL),
(320, 'support/status/rejected/{slug}', 'ChangeStatusSupportRejected', 'GET', '2024-11-12 06:58:36', NULL),
(321, 'view/support/messages/{slug}', 'ViewSupportMessage', 'GET', '2024-11-12 06:58:36', NULL),
(322, 'send/support/message', 'SendSupportMessage', 'POST', '2024-11-12 06:58:36', NULL),
(323, 'view/testimonials', 'ViewTestimonials', 'GET', '2024-11-12 06:58:36', NULL),
(324, 'add/testimonial', 'AddTestimonial', 'GET', '2024-11-12 06:58:36', NULL),
(325, 'save/testimonial', 'SaveTestimonial', 'POST', '2024-11-12 06:58:36', NULL),
(326, 'delete/testimonial/{slug}', 'DeleteTestimonial', 'GET', '2024-11-12 06:58:36', NULL),
(327, 'edit/testimonial/{slug}', 'EditTestimonial', 'GET', '2024-11-12 06:58:36', NULL),
(328, 'update/testimonial', 'UpdateTestimonial', 'POST', '2024-11-12 06:58:36', NULL),
(329, 'view/all/subscribed/users', 'ViewAllSubscribedUsers', 'GET', '2024-11-12 06:58:36', NULL),
(330, 'delete/subcribed/users/{id}', 'DeleteSubscribedUsers', 'GET', '2024-11-12 06:58:36', NULL),
(331, 'download/subscribed/users/excel', 'DownloadSubscribedUsersExcel', 'GET', '2024-11-12 06:58:36', NULL),
(332, 'download/database/backup', 'DownloadDBBackup', 'GET', '2024-11-12 06:58:36', NULL),
(333, 'download/product/files/backup', 'DownloadProductFilesBackup', 'GET', '2024-11-12 06:58:36', NULL),
(334, 'download/user/files/backup', 'DownloadUserFilesBackup', 'GET', '2024-11-12 06:58:36', NULL),
(335, 'download/banner/files/backup', 'DownloadBannerFilesBackup', 'GET', '2024-11-12 06:58:36', NULL),
(336, 'download/category/files/backup', 'DownloadCategoryFilesBackup', 'GET', '2024-11-12 06:58:36', NULL),
(337, 'download/subcategory/files/backup', 'DownloadSubcategoryFilesBackup', 'GET', '2024-11-12 06:58:36', NULL),
(338, 'download/flag/files/backup', 'DownloadFlagFilesBackup', 'GET', '2024-11-12 06:58:36', NULL),
(339, 'download/ticket/files/backup', 'DownloadTicketFilesBackup', 'GET', '2024-11-12 06:58:36', NULL),
(340, 'download/blog/files/backup', 'DownloadBlogFilesBackup', 'GET', '2024-11-12 06:58:36', NULL),
(341, 'download/other/files/backup', 'DownloadOtherFilesBackup', 'GET', '2024-11-12 06:58:36', NULL),
(342, 'send/notification/page', 'SendNotificationPage', 'GET', '2024-11-12 06:58:36', NULL),
(343, 'view/all/notifications', 'ViewAllNotifications', 'GET', '2024-11-12 06:58:36', NULL),
(344, 'delete/notification/{id}', 'DeleteNotification', 'GET', '2024-11-12 06:58:36', NULL),
(345, 'delete/notification/with/range', 'DeleteNotificationRangeWise', 'GET', '2024-11-12 06:58:36', NULL),
(346, 'send/push/notification', 'SendPushNotification', 'POST', '2024-11-12 06:58:36', NULL),
(347, 'view/sms/templates', 'ViewSmsTemplates', 'GET', '2024-11-12 06:58:36', NULL),
(348, 'create/sms/template', 'CreateSmsTemplate', 'GET', '2024-11-12 06:58:36', NULL),
(349, 'save/sms/template', 'SaveSmsTemplate', 'POST', '2024-11-12 06:58:36', NULL),
(350, 'get/sms/template/info/{id}', 'GetSmsTemplateInfo', 'GET', '2024-11-12 06:58:36', NULL),
(351, 'delete/sms/template/{id}', 'DeleteSmsTemplate', 'GET', '2024-11-12 06:58:36', NULL),
(352, 'send/sms/page', 'SendSmsPage', 'GET', '2024-11-12 06:58:36', NULL),
(353, 'get/template/description', 'GetTemplateDescription', 'POST', '2024-11-12 06:58:36', NULL),
(354, 'update/sms/template', 'UpdateSmsTemplate', 'POST', '2024-11-12 06:58:36', NULL),
(355, 'send/sms', 'SendSms', 'POST', '2024-11-12 06:58:36', NULL),
(356, 'view/sms/history', 'ViewSmsHistory', 'GET', '2024-11-12 06:58:36', NULL),
(357, 'delete/sms/with/range', 'DeleteSmsHistoryRange', 'GET', '2024-11-12 06:58:36', NULL),
(358, 'delete/sms/{id}', 'DeleteSmsHistory', 'GET', '2024-11-12 06:58:36', NULL),
(359, 'blog/categories', 'BlogCategories', 'GET', '2024-11-12 06:58:36', NULL),
(360, 'save/blog/category', 'SaveBlogCategory', 'POST', '2024-11-12 06:58:36', NULL),
(361, 'delete/blog/category/{slug}', 'DeleteBlogCategory', 'GET', '2024-11-12 06:58:36', NULL),
(362, 'feature/blog/category/{slug}', 'FeatureBlogCategory', 'GET', '2024-11-12 06:58:36', NULL),
(363, 'get/blog/category/info/{slug}', 'GetBlogCategoryInfo', 'GET', '2024-11-12 06:58:36', NULL),
(364, 'update/blog/category', 'UpdateBlogCategoryInfo', 'POST', '2024-11-12 06:58:36', NULL),
(365, 'rearrange/blog/category', 'RearrangeBlogCategory', 'GET', '2024-11-12 06:58:36', NULL),
(366, 'save/rearranged/blog/categories', 'SaveRearrangeCategory', 'POST', '2024-11-12 06:58:36', NULL),
(367, 'add/new/blog', 'AddNewBlog', 'GET', '2024-11-12 06:58:36', NULL),
(368, 'save/new/blog', 'SaveNewBlog', 'POST', '2024-11-12 06:58:36', NULL),
(369, 'view/all/blogs', 'ViewAllBlogs', 'GET', '2024-11-12 06:58:36', NULL),
(370, 'delete/blog/{slug}', 'DeleteBlog', 'GET', '2024-11-12 06:58:36', NULL),
(371, 'edit/blog/{slug}', 'EditBlog', 'GET', '2024-11-12 06:58:36', NULL),
(372, 'update/blog', 'UpdateBlog', 'POST', '2024-11-12 06:58:36', NULL),
(373, 'view/delivery/charges', 'ViewAllDeliveryCharges', 'GET', '2024-11-12 06:58:36', NULL),
(374, 'get/delivery/charge/{id}', 'GetDeliveryCharge', 'GET', '2024-11-12 06:58:36', NULL),
(375, 'update/delivery/charge', 'UpdateDeliveryCharge', 'POST', '2024-11-12 06:58:36', NULL),
(376, 'view/upazila/thana', 'ViewUpazilaThana', 'GET', '2024-11-12 06:58:36', NULL),
(377, 'get/upazila/info/{id}', 'getUpazilaInfo', 'GET', '2024-11-12 06:58:36', NULL),
(378, 'update/upazila/info', 'UpdateUpazilaInfo', 'POST', '2024-11-12 06:58:36', NULL),
(379, 'save/new/upazila', 'SaveNewUpazila', 'POST', '2024-11-12 06:58:36', NULL),
(380, 'delete/upazila/{id}', 'DeleteUpazila', 'GET', '2024-11-12 06:58:36', NULL),
(381, 'create/new/page', 'CreateNewPage', 'GET', '2024-11-12 06:58:36', NULL),
(382, 'save/custom/page', 'SaveCustomPage', 'POST', '2024-11-12 06:58:36', NULL),
(383, 'view/all/pages', 'ViewCustomPages', 'GET', '2024-11-12 06:58:36', NULL),
(384, 'delete/custom/page/{slug}', 'DeleteCustomPage', 'GET', '2024-11-12 06:58:36', NULL),
(385, 'edit/custom/page/{slug}', 'EditCustomPage', 'GET', '2024-11-12 06:58:36', NULL),
(386, 'update/custom/page', 'UpdateCustomPage', 'POST', '2024-11-12 06:58:36', NULL),
(387, 'sales/report', 'SalesReport', 'GET', '2024-11-12 06:58:36', NULL),
(388, 'generate/sales/report', 'GenerateSalesReport', 'POST', '2024-11-12 06:58:36', NULL),
(389, 'view/permission/routes', 'ViewAllPermissionRoutes', 'GET', '2024-11-12 06:58:36', NULL),
(390, 'regenerate/permission/routes', 'RegeneratePermissionRoutes', 'GET', '2024-11-12 06:58:36', NULL),
(391, 'view/user/roles', 'ViewAllUserRoles', 'GET', '2024-11-12 06:58:36', NULL),
(392, 'new/user/role', 'NewUserRole', 'GET', '2024-11-12 06:58:36', NULL),
(393, 'save/user/role', 'SaveUserRole', 'POST', '2024-11-12 06:58:36', NULL),
(394, 'delete/user/role/{id}', 'DeleteUserRole', 'GET', '2024-11-12 06:58:36', NULL),
(395, 'edit/user/role/{id}', 'EditUserRole', 'GET', '2024-11-12 06:58:36', NULL),
(396, 'update/user/role', 'UpdateUserRole', 'POST', '2024-11-12 06:58:36', NULL),
(397, 'view/user/role/permission', 'ViewUserRolePermission', 'GET', '2024-11-12 06:58:36', NULL),
(398, 'assign/role/permission/{id}', 'AssignRolePermission', 'GET', '2024-11-12 06:58:36', NULL),
(399, 'save/assigned/role/permission', 'SaveAssignedRolePermission', 'POST', '2024-11-12 06:58:36', NULL),
(400, 'create/new/vendor', 'CreateNewVendor', 'GET', '2024-11-12 06:58:36', NULL),
(401, 'save/vendor', 'SaveVendor', 'POST', '2024-11-12 06:58:36', NULL),
(402, 'view/all/vendors', 'ViewAllVendors', 'GET', '2024-11-12 06:58:36', NULL),
(403, 'view/vendor/requests', 'ViewVendorRequests', 'GET', '2024-11-12 06:58:36', NULL),
(404, 'view/inactive/vendors', 'ViewInactiveVendors', 'GET', '2024-11-12 06:58:36', NULL),
(405, 'edit/vendor/{vendor_no}', 'EditVendor', 'GET', '2024-11-12 06:58:36', NULL),
(406, 'update/vendor', 'UpdateVendor', 'POST', '2024-11-12 06:58:36', NULL),
(407, 'approve/vendor/{vendor_no}', 'ApproveVendor', 'GET', '2024-11-12 06:58:36', NULL),
(408, 'delete/vendor/{vendor_no}', 'DeleteVendor', 'GET', '2024-11-12 06:58:36', NULL),
(409, 'remove/vendor/{vendor_no}', 'RemoveVendor', 'GET', '2024-11-12 06:58:36', NULL),
(410, 'download/approved/vendors/excel', 'DownloadApprovedVendorsExcel', 'GET', '2024-11-12 06:58:36', NULL),
(411, 'create/new/store', 'CreateNewStore', 'GET', '2024-11-12 06:58:36', NULL),
(412, 'save/store', 'SaveStore', 'POST', '2024-11-12 06:58:36', NULL),
(413, 'view/all/stores', 'ViewAllStores', 'GET', '2024-11-12 06:58:36', NULL),
(414, 'inactive/store/{id}', 'InactiveStore', 'GET', '2024-11-12 06:58:36', NULL),
(415, 'activate/store/{id}', 'ActivateStore', 'GET', '2024-11-12 06:58:36', NULL),
(416, 'edit/store/{slug}', 'EditStore', 'GET', '2024-11-12 06:58:36', NULL),
(417, 'update/store', 'UpdateStore', 'POST', '2024-11-12 06:58:36', NULL),
(418, 'create/new/withdraw', 'CreateWithdrawRequest', 'GET', '2024-11-12 06:58:36', NULL),
(419, 'vendor/balance', 'CreateWithdrawRequest', 'POST', '2024-11-12 06:58:36', NULL),
(420, 'save/withdraw/request', 'SaveWithdrawRequest', 'POST', '2024-11-12 06:58:36', NULL),
(421, 'view/all/withdraws', 'ViewAllWithdraws', 'GET', '2024-11-12 06:58:36', NULL),
(422, 'view/withdraw/requests', 'ViewWithdrawRequests', 'GET', '2024-11-12 06:58:36', NULL),
(423, 'view/completed/withdraws', 'ViewCompletedWithdraws', 'GET', '2024-11-12 06:58:36', NULL),
(424, 'view/cancelled/withdraws', 'ViewCancelledWithdraws', 'GET', '2024-11-12 06:58:37', NULL),
(425, 'delete/withdraw/{id}', 'DeleteWithdraw', 'GET', '2024-11-12 06:58:37', NULL),
(426, 'get/withdraw/info/{id}', 'getWithdrawInfo', 'GET', '2024-11-12 06:58:37', NULL),
(427, 'deny/withdraw/{id}', 'DenyWithdraw', 'GET', '2024-11-12 06:58:37', NULL),
(428, 'approve/withdraw', 'ApproveWithdraw', 'POST', '2024-11-12 06:58:37', NULL);

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
(1, 'Terminal-1', 'Terminal No 1', '1738364362CaKRr', 1, '2025-02-01 03:59:22', NULL),
(2, 'Terminal-2', 'Terminal No 2', '1738364376r2zzE', 1, '2025-02-01 03:59:36', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `toll_tickets`
--

CREATE TABLE `toll_tickets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ticket_no` varchar(255) DEFAULT NULL,
  `terminal_id` bigint(20) UNSIGNED DEFAULT NULL,
  `terminal_name` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  `vehicle_type_id` bigint(20) UNSIGNED DEFAULT NULL,
  `vehicle_type_name` varchar(255) DEFAULT NULL,
  `ticket_price` double NOT NULL DEFAULT 0,
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

INSERT INTO `toll_tickets` (`id`, `ticket_no`, `terminal_id`, `terminal_name`, `user_id`, `user_name`, `vehicle_type_id`, `vehicle_type_name`, `ticket_price`, `driver_name`, `driver_contact`, `vehicle_reg_no`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(1, '1738364402QWm', 2, 'Terminal-2', 1, 'Admin', 9, 'হালকা ইঞ্জিন চালিত যান', 80, 'Fahim', '4915736108363', 'DHAKA-KA-65498', '1738364402qljQy', 1, '2025-02-01 04:00:02', NULL),
(2, '1738461110pbN', 1, 'Terminal-1', 1, 'Admin', 11, '৩/৪ চাকার মোটর যান', 30, 'Fahim', '4915736108363', 'DHAKA-KA-65498', '17384611100rFPq', 1, '2025-02-02 06:51:50', NULL),
(3, '1738461131e4k', 1, 'Terminal-1', 1, 'Admin', 11, '৩/৪ চাকার মোটর যান', 30, 'Fahim', '4915736108363', 'DHAKA-KA-65498', '1738461131AVtTn', 1, '2025-02-02 06:52:11', NULL),
(4, '17384612407az', 1, 'Terminal-1', 1, 'Admin', 11, '৩/৪ চাকার মোটর যান', 30, 'Fahim', '4915736108363', 'DHAKA-KA-65498', '17384612404iTiu', 1, '2025-02-02 06:54:00', NULL),
(5, '1738461314D56', 1, 'Terminal-1', 1, 'Admin', 11, '৩/৪ চাকার মোটর যান', 30, 'Fahim', '4915736108363', 'DHAKA-KA-65498', '1738461314Sh4fH', 1, '2025-02-02 06:55:14', NULL),
(6, '1738461327L3W', 1, 'Terminal-1', 1, 'Admin', 11, '৩/৪ চাকার মোটর যান', 30, 'Fahim', '4915736108363', 'DHAKA-KA-65498', '1738461327l4sOg', 1, '2025-02-02 06:55:27', NULL),
(7, '1738461447nWt', 1, 'Terminal-1', 1, 'Admin', 11, '৩/৪ চাকার মোটর যান', 30, 'Fahim', '4915736108363', 'DHAKA-KA-65498', '1738461447mh0Vq', 1, '2025-02-02 06:57:27', NULL),
(8, '1738461557HIV', 1, 'Terminal-1', 1, 'Admin', 11, '৩/৪ চাকার মোটর যান', 30, 'Fahim', '4915736108363', 'DHAKA-KA-65498', '1738461557En67f', 1, '2025-02-02 06:59:17', NULL),
(9, '1738461654Tgs', 1, 'Terminal-1', 1, 'Admin', 11, '৩/৪ চাকার মোটর যান', 30, 'Fahim', '4915736108363', 'DHAKA-KA-65498', '1738461654ZuTi9', 1, '2025-02-02 07:00:54', NULL),
(10, '1738461719glM', 1, 'Terminal-1', 1, 'Admin', 11, '৩/৪ চাকার মোটর যান', 30, 'Fahim', '4915736108363', 'DHAKA-KA-65498', '17384617190nULV', 1, '2025-02-02 07:01:59', NULL),
(11, '1738461801A1W', 1, 'Terminal-1', 1, 'Admin', 11, '৩/৪ চাকার মোটর যান', 30, 'Fahim', '4915736108363', 'DHAKA-KA-65498', '1738461801QeRW0', 1, '2025-02-02 07:03:21', NULL),
(12, '1738461830aBe', 1, 'Terminal-1', 1, 'Admin', 11, '৩/৪ চাকার মোটর যান', 30, 'Fahim', '4915736108363', 'DHAKA-KA-65498', '1738461830Lz823', 1, '2025-02-02 07:03:50', NULL),
(13, '1738461885MbD', 1, 'Terminal-1', 1, 'Admin', 11, '৩/৪ চাকার মোটর যান', 30, 'Fahim', '4915736108363', 'DHAKA-KA-65498', '1738461885VbvFN', 1, '2025-02-02 07:04:45', NULL),
(14, '17384619355zB', 1, 'Terminal-1', 1, 'Admin', 11, '৩/৪ চাকার মোটর যান', 30, 'Fahim', '4915736108363', 'DHAKA-KA-65498', '1738461935SA8oX', 1, '2025-02-02 07:05:35', NULL),
(15, '1738461983Dcf', 1, 'Terminal-1', 1, 'Admin', 11, '৩/৪ চাকার মোটর যান', 30, 'Fahim', '4915736108363', 'DHAKA-KA-65498', '1738461983k7khP', 1, '2025-02-02 07:06:23', NULL),
(16, '1738461994RQT', 1, 'Terminal-1', 1, 'Admin', 11, '৩/৪ চাকার মোটর যান', 30, 'Fahim', NULL, 'DHAKA-KA-65498', '1738461994dS8kY', 1, '2025-02-02 07:06:34', NULL),
(17, '173846203805R', 1, 'Terminal-1', 1, 'Admin', 11, '৩/৪ চাকার মোটর যান', 30, 'Fahim', NULL, 'DHAKA-KA-65498', '1738462038vxq7B', 1, '2025-02-02 07:07:18', NULL),
(18, '1738462059dGx', 1, 'Terminal-1', 1, 'Admin', 11, '৩/৪ চাকার মোটর যান', 30, 'Fahim', NULL, 'DHAKA-KA-65498', '1738462059KGvDI', 1, '2025-02-02 07:07:39', NULL),
(19, '1738462083eWa', 1, 'Terminal-1', 1, 'Admin', 11, '৩/৪ চাকার মোটর যান', 30, 'Fahim', NULL, 'DHAKA-KA-65498', '1738462083EGZW6', 1, '2025-02-02 07:08:03', NULL),
(20, '1738462100n86', 1, 'Terminal-1', 1, 'Admin', 11, '৩/৪ চাকার মোটর যান', 30, 'Fahim', NULL, 'DHAKA-KA-65498', '1738462100fbvfz', 1, '2025-02-02 07:08:20', NULL),
(21, '1738462141QuW', 1, 'Terminal-1', 1, 'Admin', 11, '৩/৪ চাকার মোটর যান', 30, 'Fahim', NULL, 'DHAKA-KA-65498', '1738462141ANn1B', 1, '2025-02-02 07:09:01', NULL),
(22, '1738462244oHI', 1, 'Terminal-1', 1, 'Admin', 11, '৩/৪ চাকার মোটর যান', 30, 'Fahim', NULL, 'DHAKA-KA-65498', '1738462244gnsua', 1, '2025-02-02 07:10:44', NULL),
(23, '1738462254nUP', 1, 'Terminal-1', 1, 'Admin', 11, '৩/৪ চাকার মোটর যান', 30, 'Fahim', NULL, 'DHAKA-KA-65498', '1738462254tphPY', 1, '2025-02-02 07:10:54', NULL),
(24, '17384622668Aw', 1, 'Terminal-1', 1, 'Admin', 11, '৩/৪ চাকার মোটর যান', 30, 'Fahim', NULL, 'DHAKA-KA-65498', '1738462266e0YRi', 1, '2025-02-02 07:11:06', NULL),
(25, '1738462352v7L', 1, 'Terminal-1', 1, 'Admin', 11, '৩/৪ চাকার মোটর যান', 30, 'Fahim', NULL, 'DHAKA-KA-65498', '1738462352C8Jg1', 1, '2025-02-02 07:12:32', NULL),
(26, '1738462409oZY', 1, 'Terminal-1', 1, 'Admin', 11, '৩/৪ চাকার মোটর যান', 30, 'Fahim', NULL, 'DHAKA-KA-65498', '1738462409Lif37', 1, '2025-02-02 07:13:29', NULL),
(27, '17384624451bb', 2, 'Terminal-2', 1, 'Admin', 10, 'মোটরসাইকেল', 10, 'Meghan Osborn', 'Consectetur magna id', 'Quisquam culpa eaqu', '1738462445eLvD8', 1, '2025-02-02 07:14:05', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `terminal_id` int(11) DEFAULT NULL,
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

INSERT INTO `users` (`id`, `terminal_id`, `image`, `name`, `phone`, `email`, `email_verified_at`, `verification_code`, `password`, `remember_token`, `user_type`, `address`, `status`, `created_at`, `updated_at`) VALUES
(1, NULL, NULL, 'Admin', '01969005035', 'admin@gmail.com', '2024-03-02 08:18:31', '320215', '$2y$12$oHWN0HLlomKGtI9bp503POf.uujhNJmq6bS3M8f3u0PAcrHZYLzEq', NULL, 1, 'Dhaka, Bangladesh', 1, '2023-03-28 10:20:00', '2024-04-25 07:52:00'),
(17, NULL, NULL, 'Delilah Manning', '+1 (816) 469-7934', 'sosako7271@chysir.com', '2024-10-16 14:06:35', '848882', '$2y$12$Xx2dWLRND1rlz6gKpCMyXOrgj2lDtNQVrgD/Y4ZWxMSqPl3jT4Y5G', NULL, 4, NULL, 1, '2024-10-16 14:06:11', '2024-10-16 20:50:03'),
(18, NULL, NULL, 'Md Fahim Hossain', NULL, 'alifhossain164@gmail.com', '2024-10-16 14:40:56', '267791', '$2y$12$zKSwoEohaozqpfNKKWW0AO6J4gFu/apGH5.nPE.b7jlsF6fhZQFZy', NULL, 3, NULL, 1, '2024-10-16 14:37:20', '2024-10-16 14:40:56'),
(19, NULL, NULL, 'Fahad Hossain', '01969887744', 'fahad@gmail.com', '2024-10-26 20:50:04', '0', '$2y$10$CRJPxYEEPt2ifmjDElTFj.XzA/75K3258c4iys7GxHbhIQ2TTcjAu', NULL, 3, NULL, 1, '2024-10-26 20:50:04', NULL),
(20, NULL, NULL, 'Olga Flowers', '+1 (979) 759-1711', 'alifhossain174@gmail.com', '2024-10-26 20:51:56', '0', '$2y$10$yYHz5hUa7.kqbq/TUdFTCeV033JeeGLLn72DtTltjchAEZu7svaNa', NULL, 3, NULL, 1, '2024-10-26 20:51:56', '2024-11-02 22:50:25'),
(22, NULL, NULL, 'Test User', NULL, 'testcustomer@gmail.com', NULL, '883377', '$2y$12$bRQfeSB74h9BMiQpf4GqBuGCtSCBtlx/DS9.7eX5qHBpKIMp0DNzu', NULL, 3, NULL, 1, '2024-11-13 21:13:21', '2024-11-13 21:13:21');

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
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `vehicle_types`
--

INSERT INTO `vehicle_types` (`id`, `icon`, `type_name`, `price`, `description`, `color_code`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(1, 'vehicle_type_icons/qL6kG1738359465.webp', 'ট্রাক (বোঝাই/খালি)', 65, 'ফোরটন বা তার অধিকধারী ভারী যানবাহন', '#e06666', '1738350778zFRpj', 1, '2025-02-01 00:12:58', '2025-02-01 02:37:45'),
(2, 'vehicle_type_icons/z8YGP1738359430.webp', 'কোচ/বাস (বোঝাই/খালি)', 25, 'তিন চাকার রিকশা বা মাইক্রোবাস ব্যতীত যাত্রী পরিবহনকারী বাস', '#f6b26b', '1738350803U10dn', 1, '2025-02-01 00:13:23', '2025-02-01 02:37:10'),
(3, 'vehicle_type_icons/j8scE1738359386.webp', 'মিনি ট্রাক (বোঝাই/খালি)', 30, 'তিন টনের নিচে পণ্য পরিবহনের ক্ষুদ্র ট্রাক', '#ffd966', '1738350824fs146', 1, '2025-02-01 00:13:44', '2025-02-01 02:36:26'),
(4, 'vehicle_type_icons/49WVW1738359331.webp', 'মিনিবাস (বোঝাই/খালি)', 20, 'ছোট যাত্রী পরিবহনকারী যানবাহন', '#93c47d', '1738350841jT6nT', 1, '2025-02-01 00:14:01', '2025-02-01 02:35:31'),
(5, 'vehicle_type_icons/H03121738359302.webp', 'সিএনজি অটোরিকশা', 10, 'চাকা চালিত তিন চাকার গাড়ি', '#76a5af', '1738350859NgN7J', 1, '2025-02-01 00:14:19', '2025-02-01 02:35:02'),
(6, 'vehicle_type_icons/0dc6P1738358728.webp', 'কৃষি কাজে ব্যবহৃত যান', 15, 'পণ্যবাহী ট্রাক্টর ও অন্যান্য', '#6fa8dc', '1738350876M3Yr5', 1, '2025-02-01 00:14:36', '2025-02-01 02:29:16'),
(7, 'vehicle_type_icons/SIsly1738358642.webp', 'সাইকেল (বোঝাই/খালি)', 0, 'দুই চাকার যন্ত্রচালিত বা ম্যানুয়াল সাইকেল', '#8e7cc3', '1738350894Rqa2H', 1, '2025-02-01 00:14:54', '2025-02-01 02:24:02'),
(8, 'vehicle_type_icons/sccNo1738358572.webp', 'রিকশা', 0, 'মানব চালিত তিন চাকার যান', '#c27ba0', '173835090990bBL', 1, '2025-02-01 00:15:09', '2025-02-01 02:22:52'),
(9, 'vehicle_type_icons/Dy6Q71738358531.webp', 'হালকা ইঞ্জিন চালিত যান', 80, 'প্রাইভেট কার, মাইক্রোবাস', '#f44336', '1738350938J7kAb', 1, '2025-02-01 00:15:38', '2025-02-01 02:29:00'),
(10, 'vehicle_type_icons/owahN1738358489.webp', 'মোটরসাইকেল', 10, 'দুই চাকার মোটরচালিত যান', '#ce7e00', '17383509581mOyp', 1, '2025-02-01 00:15:58', '2025-02-01 02:28:47'),
(11, 'vehicle_type_icons/6rv1n1738358450.webp', '৩/৪ চাকার মোটর যান', 30, 'ইজিবাইক, অটোরিকশা', '#8fce00', '1738350973Wi6Zc', 1, '2025-02-01 00:16:13', '2025-02-01 03:02:58'),
(12, 'vehicle_type_icons/nXPuK1738358346.webp', 'পণ্য পরিবহন যান', 0, 'পণ্য পরিবহনের বিশেষ যান', '#2986cc', '1738350995cTXOl', 1, '2025-02-01 00:16:35', '2025-02-01 02:28:27');

--
-- Indexes for dumped tables
--

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=113;

--
-- AUTO_INCREMENT for table `permission_routes`
--
ALTER TABLE `permission_routes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=429;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=106;

--
-- AUTO_INCREMENT for table `role_permissions`
--
ALTER TABLE `role_permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `terminals`
--
ALTER TABLE `terminals`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `toll_tickets`
--
ALTER TABLE `toll_tickets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `user_roles`
--
ALTER TABLE `user_roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_role_permissions`
--
ALTER TABLE `user_role_permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vehicle_types`
--
ALTER TABLE `vehicle_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
