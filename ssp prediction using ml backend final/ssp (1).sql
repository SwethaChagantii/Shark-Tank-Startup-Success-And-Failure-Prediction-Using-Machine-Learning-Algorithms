-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Mar 23, 2023 at 11:14 AM
-- Server version: 5.7.36
-- PHP Version: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ssp`
--
CREATE DATABASE IF NOT EXISTS `ssp` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `ssp`;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_group_id_b120cbf9` (`group_id`),
  KEY `auth_group_permissions_permission_id_84c5c92e` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  KEY `auth_permission_content_type_id_2f476e4b` (`content_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=37 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add user', 7, 'add_user'),
(26, 'Can change user', 7, 'change_user'),
(27, 'Can delete user', 7, 'delete_user'),
(28, 'Can view user', 7, 'view_user'),
(29, 'Can add dataset', 8, 'add_dataset'),
(30, 'Can change dataset', 8, 'change_dataset'),
(31, 'Can delete dataset', 8, 'delete_dataset'),
(32, 'Can view dataset', 8, 'view_dataset'),
(33, 'Can add predict', 9, 'add_predict'),
(34, 'Can change predict', 9, 'change_predict'),
(35, 'Can delete predict', 9, 'delete_predict'),
(36, 'Can view predict', 9, 'view_predict');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE IF NOT EXISTS `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_user_id_6a12ed8b` (`user_id`),
  KEY `auth_user_groups_group_id_97559544` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_user_id_a95ead1b` (`user_id`),
  KEY `auth_user_user_permissions_permission_id_1fbb5f2c` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `dataset_details`
--

DROP TABLE IF EXISTS `dataset_details`;
CREATE TABLE IF NOT EXISTS `dataset_details` (
  `data_id` int(11) NOT NULL AUTO_INCREMENT,
  `data_set` varchar(100) NOT NULL,
  `ad_accuracy` double DEFAULT NULL,
  `ad_precision` double DEFAULT NULL,
  `ad_recall` double DEFAULT NULL,
  `ad_f1_score` double DEFAULT NULL,
  `ad_algo` varchar(500) DEFAULT NULL,
  `gb_accuracy` double DEFAULT NULL,
  `gb_algo` varchar(500) DEFAULT NULL,
  `gb_f1_score` double DEFAULT NULL,
  `gb_precision` double DEFAULT NULL,
  `gb_recall` double DEFAULT NULL,
  `rf_accuracy` double DEFAULT NULL,
  `rf_algo` varchar(500) DEFAULT NULL,
  `rf_f1_score` double DEFAULT NULL,
  `rf_precision` double DEFAULT NULL,
  `rf_recall` double DEFAULT NULL,
  PRIMARY KEY (`data_id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dataset_details`
--

INSERT INTO `dataset_details` (`data_id`, `data_set`, `ad_accuracy`, `ad_precision`, `ad_recall`, `ad_f1_score`, `ad_algo`, `gb_accuracy`, `gb_algo`, `gb_f1_score`, `gb_precision`, `gb_recall`, `rf_accuracy`, `rf_algo`, `rf_f1_score`, `rf_precision`, `rf_recall`) VALUES
(5, 'datasetfile/startup_sucess_5d0JhpR.csv', 0.7837837837837838, 0.7551533433886375, 0.7706666666666666, 0.7611053719008265, 'ada_boost_classifier', 0.7621621621621621, 'gradient_boosting_classifier', 0.7309624537281861, 0.7226621417797888, 0.7504240882103477, 0.7405405405405405, 'random_forest_classifier', 0.7333267496214366, 0.7269356460532931, 0.7512626262626263),
(4, 'datasetfile/startup_sucess_znsB1Hg.csv', 0.7837837837837838, 0.7551533433886375, 0.7706666666666666, 0.7611053719008265, 'ada_boost_classifier', 0.7621621621621621, 'gradient_boosting_classifier', 0.7309624537281861, 0.7226621417797888, 0.7504240882103477, 0.7405405405405405, 'random_forest_classifier', 0.7333267496214366, 0.7269356460532931, 0.7512626262626263),
(6, 'datasetfile/startup_sucess_cnohGKQ.csv', 0.7837837837837838, 0.7551533433886375, 0.7706666666666666, 0.7611053719008265, 'ada_boost_classifier', 0.7621621621621621, 'gradient_boosting_classifier', 0.7309624537281861, 0.7226621417797888, 0.7504240882103477, 0.7405405405405405, 'random_forest_classifier', 0.7333267496214366, 0.7269356460532931, 0.7512626262626263),
(7, 'datasetfile/startup_sucess_we8zGvL.csv', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(8, 'datasetfile/startup_sucess_gUWPBb2.csv', NULL, NULL, NULL, NULL, NULL, 0.7621621621621621, 'gradient_boosting_classifier', 0.7309624537281861, 0.7226621417797888, 0.7504240882103477, NULL, NULL, NULL, NULL, NULL),
(9, 'datasetfile/startup_sucess_kTb6UDW.csv', 0.7837837837837838, 0.7551533433886375, 0.7706666666666666, 0.7611053719008265, 'ada_boost_classifier', 0.7621621621621621, 'gradient_boosting_classifier', 0.7309624537281861, 0.7226621417797888, 0.7504240882103477, 0.7405405405405405, 'random_forest_classifier', 0.7333267496214366, 0.7269356460532931, 0.7512626262626263);

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(2, 'auth', 'permission'),
(3, 'auth', 'group'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session'),
(7, 'mainapp', 'user'),
(8, 'adminapp', 'dataset'),
(9, 'userapp', 'predict');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2023-03-11 05:25:53.612291'),
(2, 'auth', '0001_initial', '2023-03-11 05:25:54.705432'),
(3, 'admin', '0001_initial', '2023-03-11 05:25:54.956980'),
(4, 'admin', '0002_logentry_remove_auto_add', '2023-03-11 05:25:54.975870'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2023-03-11 05:25:54.983843'),
(6, 'contenttypes', '0002_remove_content_type_name', '2023-03-11 05:25:55.091794'),
(7, 'auth', '0002_alter_permission_name_max_length', '2023-03-11 05:25:55.154462'),
(8, 'auth', '0003_alter_user_email_max_length', '2023-03-11 05:25:55.205293'),
(9, 'auth', '0004_alter_user_username_opts', '2023-03-11 05:25:55.212269'),
(10, 'auth', '0005_alter_user_last_login_null', '2023-03-11 05:25:55.278604'),
(11, 'auth', '0006_require_contenttypes_0002', '2023-03-11 05:25:55.280840'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2023-03-11 05:25:55.290807'),
(13, 'auth', '0008_alter_user_username_max_length', '2023-03-11 05:25:55.350959'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2023-03-11 05:25:55.398803'),
(15, 'auth', '0010_alter_group_name_max_length', '2023-03-11 05:25:55.473246'),
(16, 'auth', '0011_update_proxy_permissions', '2023-03-11 05:25:55.482215'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2023-03-11 05:25:55.531478'),
(18, 'mainapp', '0001_initial', '2023-03-11 05:25:55.576291'),
(19, 'mainapp', '0002_user_date', '2023-03-11 05:25:55.676116'),
(20, 'sessions', '0001_initial', '2023-03-11 05:25:55.770238'),
(21, 'adminapp', '0001_initial', '2023-03-11 06:11:37.716573'),
(22, 'adminapp', '0002_rename_accuracy_dataset_ad_accuracy_and_more', '2023-03-11 11:36:04.392100'),
(23, 'userapp', '0001_initial', '2023-03-13 10:45:50.488692'),
(24, 'userapp', '0002_predict_result', '2023-03-13 11:34:58.767829'),
(25, 'userapp', '0003_predict_conclusion', '2023-03-23 06:34:08.312857'),
(26, 'userapp', '0004_alter_predict_competitors', '2023-03-23 11:03:05.310426');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('ywsd2qf88z6cv5bcaf07sdyen3ayh0ee', 'eyJ1c2VyX2lkIjoxfQ:1parnX:RpBaFdMXrRYhINiHpego5DrvS1A41H-Qk_8gN8N3tF8', '2023-03-25 05:29:39.130524'),
('v7qcr4ydpr6weomyswub6o7uxkvz5yb4', 'eyJ1c2VyX2lkIjozfQ:1pfERi:xiJbIgGC2hY58gv0pyo_mk1nRwGKXDr8FArjWEKrdIQ', '2023-04-06 06:29:10.255085');

-- --------------------------------------------------------

--
-- Table structure for table `mainapp_user`
--

DROP TABLE IF EXISTS `mainapp_user`;
CREATE TABLE IF NOT EXISTS `mainapp_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `Fullname` varchar(250) NOT NULL,
  `Email` varchar(250) NOT NULL,
  `Phone` varchar(250) NOT NULL,
  `Password` varchar(250) NOT NULL,
  `city` varchar(250) NOT NULL,
  `industry` varchar(250) NOT NULL,
  `image` varchar(100) NOT NULL,
  `state` varchar(250) NOT NULL,
  `status` varchar(250) NOT NULL,
  `Date` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mainapp_user`
--

INSERT INTO `mainapp_user` (`user_id`, `Fullname`, `Email`, `Phone`, `Password`, `city`, `industry`, `image`, `state`, `status`, `Date`) VALUES
(1, 'jhon', 'jhon@email.com', '9696969696', '0000', 'hyd', 'codebook', 'Images/user/apple_LMPPvxt.jpg', 'tel', 'accepted', '2023-03-11 06:26:43.762068'),
(3, 'user', 'user1@email.com', '9696969696', '0000', 'hyderabad', 'codebook', 'Images/user/sc1.PNG', 'Telangana', 'accepted', '2023-03-23 06:28:37.710569');

-- --------------------------------------------------------

--
-- Table structure for table `prredict_details`
--

DROP TABLE IF EXISTS `prredict_details`;
CREATE TABLE IF NOT EXISTS `prredict_details` (
  `predict_id` int(11) NOT NULL AUTO_INCREMENT,
  `Participents` double DEFAULT NULL,
  `Vc` int(11) DEFAULT NULL,
  `Relationships` int(11) DEFAULT NULL,
  `Funding` int(11) DEFAULT NULL,
  `Angel` int(11) DEFAULT NULL,
  `funding_rounds` int(11) DEFAULT NULL,
  `top` int(11) DEFAULT NULL,
  `Software` int(11) DEFAULT NULL,
  `Web` int(11) DEFAULT NULL,
  `Mobile` int(11) DEFAULT NULL,
  `Advertising` int(11) DEFAULT NULL,
  `Games` int(11) DEFAULT NULL,
  `commerce` int(11) DEFAULT NULL,
  `Biotech` int(11) DEFAULT NULL,
  `Consulting` int(11) DEFAULT NULL,
  `enterprise` int(11) DEFAULT NULL,
  `Other` int(11) DEFAULT NULL,
  `a` int(11) DEFAULT NULL,
  `b` int(11) DEFAULT NULL,
  `c` int(11) DEFAULT NULL,
  `d` int(11) DEFAULT NULL,
  `investors` varchar(500) DEFAULT NULL,
  `Competitors` int(11) DEFAULT NULL,
  `Partnerships` varchar(500) DEFAULT NULL,
  `Founders` varchar(500) DEFAULT NULL,
  `Time` varchar(500) DEFAULT NULL,
  `Market` varchar(500) DEFAULT NULL,
  `result` varchar(500) DEFAULT NULL,
  `conclusion` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`predict_id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `prredict_details`
--

INSERT INTO `prredict_details` (`predict_id`, `Participents`, `Vc`, `Relationships`, `Funding`, `Angel`, `funding_rounds`, `top`, `Software`, `Web`, `Mobile`, `Advertising`, `Games`, `commerce`, `Biotech`, `Consulting`, `enterprise`, `Other`, `a`, `b`, `c`, `d`, `investors`, `Competitors`, `Partnerships`, `Founders`, `Time`, `Market`, `result`, `conclusion`) VALUES
(6, 3.333, 0, 4, 357000, 1, 3, 1, 1, 1, 0, 0, 1, 0, 0, 0, 1, 0, 1, 1, 0, 0, 'no', 0, 'no', 'no', 'yes', 'no', 'Closed', 'Our prediction says that your startup might fail.Select a product or problem statement that has a huge demand in the market'),
(7, 3.333, 0, 4, 357000, 1, 3, 1, 1, 1, 0, 0, 1, 0, 0, 0, 1, 0, 1, 1, 0, 0, 'no', 0, 'no', 'no', 'yes', 'no', 'Closed', 'Our prediction says that your startup might fail.Select a product or problem statement that has a huge demand in the market'),
(8, 4.333, 0, 4, 857000, 1, 4, 1, 1, 1, 1, 1, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 'yes', 4, 'yes', 'no', 'no', 'yes', 'Closed', 'Our prediction says that your startup might fail.Try to enter the market at the right timeForget about your competitors just focus on your customers'),
(9, 4.333, 0, 4, 857000, 1, 4, 1, 1, 1, 1, 1, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 'yes', 2, 'yes', 'no', 'no', 'yes', 'Closed', 'Our prediction says that your startup might fail.Try to enter the market at the right time'),
(10, 4.333, 0, 4, 857000, 1, 4, 1, 1, 1, 1, 1, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 'yes', 2, 'yes', 'no', 'yes', 'yes', 'Closed', 'Our prediction says that your startup might fail.'),
(11, 4.333, 0, 2, 857000, 1, 4, 1, 1, 1, 1, 1, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 'yes', 2, 'yes', 'yes', 'yes', 'yes', 'Acquired', 'Our prediction says that your startup will hopefully be a Success.');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
