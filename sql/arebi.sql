-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Aug 09, 2016 at 09:37 AM
-- Server version: 10.1.13-MariaDB
-- PHP Version: 5.6.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `arebi`
--

-- --------------------------------------------------------

--
-- Table structure for table `api`
--

CREATE TABLE `api` (
  `id_api` int(11) NOT NULL,
  `name` varchar(150) NOT NULL,
  `email` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `api`
--

INSERT INTO `api` (`id_api`, `name`, `email`) VALUES
(8, 'Jhon', 'jhon@gmail.com'),
(10, 'Joko', 'joko@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `book`
--

CREATE TABLE `book` (
  `id_book` int(11) NOT NULL,
  `book_name` varchar(150) NOT NULL,
  `rating` enum('1','2','3','4','5') NOT NULL,
  `content` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `book`
--

INSERT INTO `book` (`id_book`, `book_name`, `rating`, `content`) VALUES
(1, 'Design', '5', '<p>Content</p>\r\n'),
(2, 'PHP', '3', '<p>PHP Code</p>\r\n');

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

CREATE TABLE `groups` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `name` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `groups`
--

INSERT INTO `groups` (`id`, `name`, `description`) VALUES
(1, 'admin', 'Administrator'),
(2, 'members', 'General User');

-- --------------------------------------------------------

--
-- Table structure for table `groups_menu`
--

CREATE TABLE `groups_menu` (
  `id_groups` int(11) NOT NULL,
  `id_menu` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `groups_menu`
--

INSERT INTO `groups_menu` (`id_groups`, `id_menu`) VALUES
(1, 1),
(2, 1),
(1, 4),
(2, 4),
(1, 21),
(2, 21),
(1, 5),
(2, 5),
(1, 6),
(2, 6),
(1, 7),
(2, 7),
(1, 8),
(2, 8),
(1, 10),
(2, 10),
(1, 28),
(2, 28),
(1, 3),
(2, 3),
(1, 30),
(2, 30);

-- --------------------------------------------------------

--
-- Table structure for table `login_attempts`
--

CREATE TABLE `login_attempts` (
  `id` int(11) UNSIGNED NOT NULL,
  `ip_address` varchar(15) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` int(11) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

CREATE TABLE `menu` (
  `id_menu` int(11) NOT NULL,
  `sort` int(11) NOT NULL DEFAULT '99',
  `level` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `icon` varchar(125) NOT NULL,
  `label` varchar(25) NOT NULL,
  `link` varchar(125) NOT NULL,
  `id` varchar(25) NOT NULL DEFAULT '#',
  `id_menu_type` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`id_menu`, `sort`, `level`, `parent_id`, `icon`, `label`, `link`, `id`, `id_menu_type`) VALUES
(1, 0, 1, 0, '', 'MAIN NAVIGATION', '', '#', 1),
(3, 1, 2, 1, 'dashboard', 'Dashboard', 'sketsanet/dashboard', '#', 1),
(4, 2, 2, 1, 'table', 'CRUD Builder', 'sketsanet/crud_builder', '', 1),
(5, 5, 2, 1, 'user', 'Users', '#', '', 1),
(6, 6, 3, 5, 'circle-o', 'Users', 'sketsanet/users', '#', 1),
(7, 7, 3, 5, 'circle-o', 'Groups', 'sketsanet/groups', '#', 1),
(8, 8, 2, 1, 'bars', 'Menu', 'sketsanet/menu/side-menu', 'navMenu', 1),
(10, 10, 2, 1, 'cloud', 'API', 'api/user', '#', 1),
(19, 0, 1, 0, '', 'Home', '', '', 2),
(20, 1, 1, 0, '', 'About', 'page/about', '', 2),
(21, 3, 2, 1, 'file-o', 'Page Builder', 'sketsanet/page_builder', '', 1),
(28, 4, 2, 1, 'th', 'Module Extensions', 'sketsanet/modules', 'module', 1),
(29, 4, 1, 0, '', 'Dashboard', 'sketsanet/dashboard', '', 2),
(30, 9, 2, 1, 'book', 'Documentation', 'documentation/welcome', '', 1),
(31, 2, 1, 0, '', 'Hello World', 'example', '', 2),
(33, 3, 1, 0, '', 'Get Started', 'documentation', '', 2);

-- --------------------------------------------------------

--
-- Table structure for table `menu_type`
--

CREATE TABLE `menu_type` (
  `id_menu_type` int(11) NOT NULL,
  `type` varchar(125) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `menu_type`
--

INSERT INTO `menu_type` (`id_menu_type`, `type`) VALUES
(1, 'Side menu'),
(2, 'Top menu');

-- --------------------------------------------------------

--
-- Table structure for table `page`
--

CREATE TABLE `page` (
  `id_page` int(11) NOT NULL,
  `title` varchar(150) NOT NULL,
  `featured_image` varchar(255) NOT NULL,
  `slug` varchar(150) NOT NULL,
  `template` varchar(125) NOT NULL,
  `breadcrumb` text NOT NULL,
  `content` text NOT NULL,
  `keyword` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `view` varchar(150) NOT NULL DEFAULT 'default'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `page`
--

INSERT INTO `page` (`id_page`, `title`, `featured_image`, `slug`, `template`, `breadcrumb`, `content`, `keyword`, `description`, `view`) VALUES
(1, 'About', '', 'about', 'frontend', '[{"label":"About","link":""}]', '<p>Tentang Kami</p>\r\n', '', '', 'default'),
(2, 'Home', '', 'home', 'frontend', '[{"label":"Home","link":""}]', '<p>this is custom page can be found in <span class="marker">view/page</span></p>\r\n', 'myIgniter', 'myIgniter is custom framework based Codeigniter 3 with combine Grocery CRUD, AdminLTE, Ion auth, Gulp, and Bower. myIgniter for web developer who want to speed up their projects.', 'home'),
(3, 'Simple Backend', '', 'simple-backend', 'backend', '[{"label":"Simple Backend","link":""}]', '<p>This is simple example Page Builder for backend.</p>\r\n', '', '', 'callout');

-- --------------------------------------------------------

--
-- Table structure for table `table`
--

CREATE TABLE `table` (
  `id_table` int(11) NOT NULL,
  `table_name` varchar(150) NOT NULL,
  `subject` varchar(150) NOT NULL,
  `title` varchar(150) NOT NULL,
  `required` text NOT NULL,
  `columns` text NOT NULL,
  `field` text NOT NULL,
  `uploads` text NOT NULL,
  `relation_1` text NOT NULL,
  `action` text NOT NULL,
  `breadcrumb` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `table`
--

INSERT INTO `table` (`id_table`, `table_name`, `subject`, `title`, `required`, `columns`, `field`, `uploads`, `relation_1`, `action`, `breadcrumb`) VALUES
(1, 'book', 'Book', 'Book', '["book_name","rating"]', '["book_name","rating"]', '', '', 'null', '["Action","Create","Read","Update","Delete"]', '[{"label":"Book","link":""}]');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) UNSIGNED NOT NULL,
  `ip_address` varchar(15) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `salt` varchar(255) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `activation_code` varchar(40) DEFAULT NULL,
  `forgotten_password_code` varchar(40) DEFAULT NULL,
  `forgotten_password_time` int(11) UNSIGNED DEFAULT NULL,
  `remember_code` varchar(40) DEFAULT NULL,
  `created_on` int(11) UNSIGNED NOT NULL,
  `last_login` int(11) UNSIGNED DEFAULT NULL,
  `active` tinyint(1) UNSIGNED DEFAULT NULL,
  `full_name` varchar(255) NOT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `additional` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `ip_address`, `username`, `password`, `salt`, `email`, `activation_code`, `forgotten_password_code`, `forgotten_password_time`, `remember_code`, `created_on`, `last_login`, `active`, `full_name`, `photo`, `additional`) VALUES
(1, '127.0.0.1', 'admin', '$2y$08$0mQjC9osSWK/7TxNskCoZu/x4mxBOyxVFeAT5lqCGFwVPKAVmW8gO', NULL, 'admin@admin.com', NULL, NULL, NULL, 'gOqL46/.mhzfuNC0pSFzY.', 1268889823, 1470719430, 1, 'Administrator', 'b9d76-avatar04.png', NULL),
(2, '127.0.0.1', 'member', '$2y$08$0wId8k6W86c1vfsiTuQlaOWhlMCeWdUEsPEa4VFNYGy9bNxTIn0qW', NULL, 'member@member.com', NULL, NULL, NULL, NULL, 1441451078, 1442838976, 1, 'Member', '', NULL),
(3, '127.0.0.1', 'asrul-2', '$2y$08$UvTFS0Y5TJtQKVAsTSlJcetWnzLgoDjdbzBccswXZjkfU2FKh11Bi', NULL, 'hanafi.asrul@gmail.com', '78ba5c861a7f5f19af3c9cdd812e4d315b9d77bb', NULL, NULL, NULL, 1450683974, NULL, 0, 'Asrul Hanafi', NULL, ''),
(4, '::1', 'arief', '$2y$08$JBtfskE2Fz1I.U39k9RtBu1iZWdt3EFXn7lJ8FUHI8zPKDM0jo5Ya', NULL, 'arief@sketsa.net', NULL, NULL, NULL, NULL, 1470719341, 1470719341, 1, 'arief', '', NULL),
(5, '::1', 'yudi', '$2y$08$kV88QV3dbEP4y1AmLS8YiOwgBanra2B8gL626sMgcSvEKA0aU6PNq', NULL, 'yudi@sketsa.net', NULL, NULL, NULL, NULL, 1470719383, 1470720796, 1, 'yudi', '', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users_groups`
--

CREATE TABLE `users_groups` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `group_id` mediumint(8) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users_groups`
--

INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES
(35, 3, 2),
(54, 2, 2),
(55, 2, 1),
(61, 1, 1),
(62, 4, 1),
(63, 4, 2),
(64, 5, 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `api`
--
ALTER TABLE `api`
  ADD PRIMARY KEY (`id_api`);

--
-- Indexes for table `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`id_book`);

--
-- Indexes for table `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `login_attempts`
--
ALTER TABLE `login_attempts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id_menu`);

--
-- Indexes for table `menu_type`
--
ALTER TABLE `menu_type`
  ADD PRIMARY KEY (`id_menu_type`);

--
-- Indexes for table `page`
--
ALTER TABLE `page`
  ADD PRIMARY KEY (`id_page`);

--
-- Indexes for table `table`
--
ALTER TABLE `table`
  ADD PRIMARY KEY (`id_table`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users_groups`
--
ALTER TABLE `users_groups`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `api`
--
ALTER TABLE `api`
  MODIFY `id_api` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `book`
--
ALTER TABLE `book`
  MODIFY `id_book` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `groups`
--
ALTER TABLE `groups`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `login_attempts`
--
ALTER TABLE `login_attempts`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `menu`
--
ALTER TABLE `menu`
  MODIFY `id_menu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;
--
-- AUTO_INCREMENT for table `menu_type`
--
ALTER TABLE `menu_type`
  MODIFY `id_menu_type` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `page`
--
ALTER TABLE `page`
  MODIFY `id_page` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `table`
--
ALTER TABLE `table`
  MODIFY `id_table` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `users_groups`
--
ALTER TABLE `users_groups`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
