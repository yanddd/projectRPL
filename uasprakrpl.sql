-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 16 Jun 2021 pada 19.10
-- Versi server: 10.4.19-MariaDB
-- Versi PHP: 7.4.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `uasprakrpl`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `auth_activation_attempts`
--

CREATE TABLE `auth_activation_attempts` (
  `id` int(11) UNSIGNED NOT NULL,
  `ip_address` varchar(255) NOT NULL,
  `user_agent` varchar(255) NOT NULL,
  `token` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `auth_groups`
--

CREATE TABLE `auth_groups` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `auth_groups`
--

INSERT INTO `auth_groups` (`id`, `name`, `description`) VALUES
(1, 'admin', 'Site Administrator'),
(2, 'user', 'Regular User'),
(3, 'manajer', 'Manajer');

-- --------------------------------------------------------

--
-- Struktur dari tabel `auth_groups_permissions`
--

CREATE TABLE `auth_groups_permissions` (
  `group_id` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `permission_id` int(11) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `auth_groups_permissions`
--

INSERT INTO `auth_groups_permissions` (`group_id`, `permission_id`) VALUES
(1, 1),
(2, 2),
(3, 3);

-- --------------------------------------------------------

--
-- Struktur dari tabel `auth_groups_users`
--

CREATE TABLE `auth_groups_users` (
  `group_id` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `user_id` int(11) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `auth_groups_users`
--

INSERT INTO `auth_groups_users` (`group_id`, `user_id`) VALUES
(1, 8),
(2, 9),
(2, 10),
(3, 11);

-- --------------------------------------------------------

--
-- Struktur dari tabel `auth_logins`
--

CREATE TABLE `auth_logins` (
  `id` int(11) UNSIGNED NOT NULL,
  `ip_address` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `user_id` int(11) UNSIGNED DEFAULT NULL,
  `date` datetime NOT NULL,
  `success` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `auth_logins`
--

INSERT INTO `auth_logins` (`id`, `ip_address`, `email`, `user_id`, `date`, `success`) VALUES
(1, '::1', 'admin1', 1, '2021-06-10 05:36:22', 0),
(2, '::1', 'yandrizal299@gmail.com', 3, '2021-06-10 05:57:14', 0),
(3, '::1', 'admin1', 1, '2021-06-10 09:48:01', 0),
(4, '::1', 'admin1@gmail.com', NULL, '2021-06-10 09:50:15', 0),
(5, '::1', 'yandrizal299@gmail.com', 4, '2021-06-10 10:36:41', 1),
(6, '::1', 'yandrizal299@gmail.com', 4, '2021-06-10 10:38:06', 1),
(7, '::1', 'yandrizal299@gmail.com', 4, '2021-06-10 10:40:52', 1),
(8, '::1', 'yandrizal299@gmail.com', 4, '2021-06-10 11:04:56', 1),
(9, '::1', 'admin1@gmail.com', 3, '2021-06-10 11:05:13', 1),
(10, '::1', 'admin1@gmail.com', 3, '2021-06-10 11:05:14', 1),
(11, '::1', 'yandrizal299@gmail.com', 4, '2021-06-10 11:09:20', 1),
(12, '::1', 'admin1', NULL, '2021-06-10 11:10:00', 0),
(13, '::1', 'admin1', NULL, '2021-06-10 11:10:09', 0),
(14, '::1', 'admin1@gmail.com', 3, '2021-06-10 11:10:18', 1),
(15, '::1', 'yandrizal299@gmail.com', 4, '2021-06-10 11:14:23', 1),
(16, '::1', 'admin1', NULL, '2021-06-10 11:25:51', 0),
(17, '::1', 'admin1@gmail.com', 3, '2021-06-10 11:26:01', 1),
(18, '::1', 'imbul21@gmail.com', 6, '2021-06-10 11:27:39', 1),
(19, '::1', 'admin1@gmail.com', 3, '2021-06-10 11:59:03', 1),
(20, '::1', 'admin1@gmail.com', 3, '2021-06-10 11:59:04', 1),
(21, '::1', 'yandrizal299@gmail.com', 4, '2021-06-10 11:59:36', 1),
(22, '::1', 'admin1@gmail.com', 3, '2021-06-10 12:34:58', 1),
(23, '::1', 'admin1@gmail.com', 3, '2021-06-10 12:34:59', 1),
(24, '::1', 'yandrizal299@gmail.com', 4, '2021-06-10 12:51:10', 1),
(25, '::1', 'admin1', NULL, '2021-06-10 12:54:44', 0),
(26, '::1', 'admin1', NULL, '2021-06-10 12:54:53', 0),
(27, '::1', 'admin1@gmail.com', 3, '2021-06-10 12:55:01', 1),
(28, '::1', 'yandrizal299@gmail.com', 4, '2021-06-10 12:56:34', 1),
(29, '::1', 'yandrizal299@gmail.com', 4, '2021-06-11 02:05:52', 1),
(30, '::1', 'yandrizal299@gmail.com', 4, '2021-06-11 02:05:53', 1),
(31, '::1', 'admin1@gmail.com', 3, '2021-06-11 03:07:49', 1),
(32, '::1', 'admin1@gmail.com', 3, '2021-06-11 04:10:17', 1),
(33, '::1', 'admin1@gmail.com', 3, '2021-06-11 08:02:38', 1),
(34, '::1', 'yandrizal299@gmail.com', 4, '2021-06-11 17:21:54', 1),
(35, '::1', 'admin1@gmail.com', 3, '2021-06-11 18:04:25', 1),
(36, '::1', 'yandrizal775@gmail.com', 7, '2021-06-11 19:20:00', 1),
(37, '::1', 'admin1@gmail.com', 3, '2021-06-11 19:56:51', 1),
(38, '::1', 'yandrizal299@gmail.com', 4, '2021-06-11 21:14:44', 1),
(39, '::1', 'yandrizal299@gmail.com', 4, '2021-06-11 21:26:41', 1),
(40, '::1', 'admin1@gmail.com', 3, '2021-06-11 21:43:00', 1),
(41, '::1', 'yandrizal299@gmail.com', 4, '2021-06-11 21:45:13', 1),
(42, '::1', 'admin1', NULL, '2021-06-11 21:45:31', 0),
(43, '::1', 'admin1@gmail.com', 3, '2021-06-11 21:45:39', 1),
(44, '::1', 'yandrizal299@gmail.com', 4, '2021-06-11 21:47:41', 1),
(45, '::1', 'admin1@gmail.com', 3, '2021-06-11 21:48:58', 1),
(46, '::1', 'admin1@gmail.com', 3, '2021-06-11 22:12:55', 1),
(47, '::1', 'yandrizal299@gmail.com', 4, '2021-06-11 22:17:45', 1),
(48, '::1', 'admin1@gmail.com', 3, '2021-06-11 22:18:31', 1),
(49, '::1', 'yandrizal299@gmail.com', 4, '2021-06-11 22:41:39', 1),
(50, '::1', 'admin1@gmail.com', 3, '2021-06-11 22:43:17', 1),
(51, '::1', 'yandrizal299@gmail.com', 4, '2021-06-11 22:49:16', 1),
(52, '::1', 'yandrizal299@gmail.com', 4, '2021-06-12 02:21:16', 1),
(53, '::1', 'admin1@gmail.com', 3, '2021-06-12 02:37:01', 1),
(54, '::1', 'admin1', NULL, '2021-06-12 03:12:36', 0),
(55, '::1', 'admin1@gmail.com', 3, '2021-06-12 03:12:43', 1),
(56, '::1', 'admin1@gmail.com', 3, '2021-06-12 03:30:52', 1),
(57, '::1', 'yandrizal299@gmail.com', 4, '2021-06-12 06:08:51', 1),
(58, '::1', 'admin1@gmail.com', 3, '2021-06-12 06:14:56', 1),
(59, '::1', 'yandrizal299@gmail.com', 4, '2021-06-12 06:23:34', 1),
(60, '::1', 'admin1@gmail.com', 3, '2021-06-12 06:24:45', 1),
(61, '::1', 'yandrizal299@gmail.com', 4, '2021-06-12 16:33:08', 1),
(62, '::1', 'admin1@gmail.com', 3, '2021-06-12 17:26:09', 1),
(63, '::1', 'admin1@gmail.com', 3, '2021-06-12 19:29:40', 1),
(64, '::1', 'admin1@gmail.com', 3, '2021-06-12 19:31:42', 1),
(65, '::1', 'yandrizal299@gmail.com', 4, '2021-06-12 19:33:37', 1),
(66, '::1', 'admin1@gmail.com', 3, '2021-06-12 21:03:31', 1),
(67, '::1', 'yandrizal299@gmail.com', 4, '2021-06-12 22:13:20', 1),
(68, '::1', 'admin1@gmail.com', 3, '2021-06-12 22:18:38', 1),
(69, '::1', 'yandrizal299@gmail.com', 4, '2021-06-12 22:56:17', 1),
(70, '::1', 'admin1@gmail.com', 8, '2021-06-13 21:40:05', 1),
(71, '::1', 'yandrizal299@gmail.com', 9, '2021-06-13 21:43:33', 1),
(72, '::1', 'admin1@gmail.com', 8, '2021-06-13 22:08:30', 1),
(73, '::1', 'yandrizal299@gmail.com', 9, '2021-06-13 23:06:50', 1),
(74, '::1', 'admin1@gmail.com', 8, '2021-06-14 00:20:01', 1),
(75, '::1', 'yandrizal299@gmail.com', 9, '2021-06-14 01:22:43', 1),
(76, '::1', 'admin1@gmail.com', 8, '2021-06-14 04:17:05', 1),
(77, '::1', 'yandrizal299@gmail.com', 9, '2021-06-14 04:22:13', 1),
(78, '::1', 'admin1@gmail.com', 8, '2021-06-14 04:55:34', 1),
(79, '::1', 'yandrizal299@gmail.com', 9, '2021-06-14 17:20:07', 1),
(80, '::1', 'arif31@gmail.com', 10, '2021-06-14 18:29:45', 1),
(81, '::1', 'yandrizal299@gmail.com', 9, '2021-06-14 18:30:33', 1),
(82, '::1', 'admin1', NULL, '2021-06-14 18:32:24', 0),
(83, '::1', 'admin1@gmail.com', 8, '2021-06-14 18:32:34', 1),
(84, '::1', 'yandrizal299@gmail.com', 9, '2021-06-14 19:02:20', 1),
(85, '::1', 'admin1@gmail.com', 8, '2021-06-14 23:40:26', 1),
(86, '::1', 'yandrizal299@gmail.com', 9, '2021-06-15 02:25:23', 1),
(87, '::1', 'yandrizal299@gmail.com', 9, '2021-06-15 05:48:23', 1),
(88, '::1', 'admin1@gmail.com', 8, '2021-06-15 06:11:41', 1),
(89, '::1', 'admin1@gmail.com', 8, '2021-06-15 09:25:58', 1),
(90, '::1', 'admin1@gmail.com', 8, '2021-06-15 09:53:16', 1),
(91, '::1', 'yandrizal299@gmail.com', 9, '2021-06-15 09:56:49', 1),
(92, '::1', 'admin1', NULL, '2021-06-15 10:47:13', 0),
(93, '::1', 'admin1@gmail.com', 8, '2021-06-15 10:47:19', 1),
(94, '::1', 'yandrizal299@gmail.com', 9, '2021-06-15 11:01:26', 1),
(95, '::1', 'manajer1@gmail.com', 11, '2021-06-16 08:14:25', 1),
(96, '::1', 'yandrizal299@gmail.com', 9, '2021-06-16 08:32:03', 1),
(97, '::1', 'admin1@gmail.com', 8, '2021-06-16 08:32:42', 1),
(98, '::1', 'manajer1@gmail.com', 11, '2021-06-16 09:55:08', 1),
(99, '::1', 'manajer1@gmail.com', 11, '2021-06-16 09:59:20', 1),
(100, '::1', 'admin1@gmail.com', 8, '2021-06-16 11:03:32', 1),
(101, '::1', 'owner1@gmail.com', 11, '2021-06-16 12:05:51', 1),
(102, '::1', 'yandrizal299@gmail.com', 9, '2021-06-16 12:07:03', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `auth_permissions`
--

CREATE TABLE `auth_permissions` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `auth_permissions`
--

INSERT INTO `auth_permissions` (`id`, `name`, `description`) VALUES
(1, 'manage-data', 'Mana All Data'),
(2, 'view-upload-data', 'View and Upload Data'),
(3, 'view-data', 'View Data');

-- --------------------------------------------------------

--
-- Struktur dari tabel `auth_reset_attempts`
--

CREATE TABLE `auth_reset_attempts` (
  `id` int(11) UNSIGNED NOT NULL,
  `email` varchar(255) NOT NULL,
  `ip_address` varchar(255) NOT NULL,
  `user_agent` varchar(255) NOT NULL,
  `token` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `auth_tokens`
--

CREATE TABLE `auth_tokens` (
  `id` int(11) UNSIGNED NOT NULL,
  `selector` varchar(255) NOT NULL,
  `hashedValidator` varchar(255) NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `expires` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `auth_users_permissions`
--

CREATE TABLE `auth_users_permissions` (
  `user_id` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `permission_id` int(11) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `version` varchar(255) NOT NULL,
  `class` varchar(255) NOT NULL,
  `group` varchar(255) NOT NULL,
  `namespace` varchar(255) NOT NULL,
  `time` int(11) NOT NULL,
  `batch` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `version`, `class`, `group`, `namespace`, `time`, `batch`) VALUES
(1, '2017-11-20-223112', 'Myth\\Auth\\Database\\Migrations\\CreateAuthTables', 'default', 'Myth\\Auth', 1623314201, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `penjualan`
--

CREATE TABLE `penjualan` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `nama_pembeli` varchar(255) NOT NULL,
  `alamat_pembeli` varchar(255) NOT NULL,
  `jumlah_sepatu` int(3) NOT NULL,
  `nama_sepatu` varchar(255) NOT NULL,
  `harga_sepatu` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `penjualan`
--

INSERT INTO `penjualan` (`id`, `username`, `nama_pembeli`, `alamat_pembeli`, `jumlah_sepatu`, `nama_sepatu`, `harga_sepatu`, `total`, `created_at`, `updated_at`) VALUES
(1, 'yanddd', 'Yandri', 'Bangkinang', 1, 'Nike Sport', 200000, 220000, '2021-06-14 02:20:23', '2021-06-14 02:20:23'),
(3, 'yanddd', 'Walid', 'Pekanbaru', 5, 'Dallas', 250000, 1260000, '2021-06-15 02:26:10', '2021-06-15 02:26:10'),
(4, 'yanddd', 'Arif', 'Panam', 4, 'League', 1200000, 4812000, '2021-06-15 09:35:57', '2021-06-15 09:35:57'),
(5, 'yanddd', 'Adyah', 'Pekanbaru', 2, 'Dallas', 250000, 510000, '2021-06-15 09:49:42', '2021-06-15 09:49:42');

-- --------------------------------------------------------

--
-- Struktur dari tabel `sepatu`
--

CREATE TABLE `sepatu` (
  `id` int(11) NOT NULL,
  `nama_sepatu` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `jenis_sepatu` varchar(255) NOT NULL,
  `harga_sepatu` int(11) NOT NULL,
  `sampul` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `sepatu`
--

INSERT INTO `sepatu` (`id`, `nama_sepatu`, `slug`, `jenis_sepatu`, `harga_sepatu`, `sampul`, `created_at`, `updated_at`) VALUES
(17, 'Dallas', 'dallas', 'School', 250000, '1623732782_c62f24149c890c83e67f.jpg', '2021-06-14 23:53:02', '2021-06-14 23:53:02'),
(18, 'Playboy', 'playboy', 'Sport', 500000, '1623767377_ebd33a4010690b95d2e0.jpg', '2021-06-15 06:12:39', '2021-06-15 09:29:37'),
(19, 'Converse', 'converse', 'Basic', 100000, '1623767444_8d0f48357f663efac3f7.jpg', '2021-06-15 09:30:44', '2021-06-15 09:30:44'),
(20, 'Adidas', 'adidas', 'Sport', 250000, '1623767521_8e69b2b53f3ab5a25c87.jpg', '2021-06-15 09:31:36', '2021-06-15 09:32:01'),
(21, 'Vans', 'vans', 'School', 400000, '1623767565_275c4d8f911114870e55.jpg', '2021-06-15 09:32:45', '2021-06-15 09:32:45'),
(22, 'League', 'league', 'Sport', 1200000, '1623767679_19b2c16d5bfcab21cc9b.jpg', '2021-06-15 09:34:39', '2021-06-15 09:34:39'),
(23, 'Piero', 'piero', 'Basic', 60000, '1623767733_e03b58fa2a10cbd947d0.jpg', '2021-06-15 09:35:33', '2021-06-15 09:35:33');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` int(11) UNSIGNED NOT NULL,
  `email` varchar(255) NOT NULL,
  `username` varchar(30) DEFAULT NULL,
  `password_hash` varchar(255) NOT NULL,
  `reset_hash` varchar(255) DEFAULT NULL,
  `reset_at` datetime DEFAULT NULL,
  `reset_expires` datetime DEFAULT NULL,
  `activate_hash` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `status_message` varchar(255) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `force_pass_reset` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `email`, `username`, `password_hash`, `reset_hash`, `reset_at`, `reset_expires`, `activate_hash`, `status`, `status_message`, `active`, `force_pass_reset`, `created_at`, `updated_at`, `deleted_at`) VALUES
(8, 'admin1@gmail.com', 'admin1', '$2y$10$NzvCdjQRyl.THvz3PNZ/A.okt46dJiBtEMEsGSp.uejbrAcNzTHey', NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, '2021-06-13 21:39:56', '2021-06-13 21:39:56', NULL),
(9, 'yandrizal299@gmail.com', 'yanddd', '$2y$10$28O/4p.dyCt/8cQyj.Bf2OWH8BVyQ4jPBMo05qlhZEFij2ltxebiW', NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, '2021-06-13 21:43:26', '2021-06-13 21:43:26', NULL),
(10, 'arif31@gmail.com', 'arif21', '$2y$10$YcaZRAlU8TvnPMXTKJgbpu.kLLup/zZnMDfPoWl9UvJxthdpoepT6', NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, '2021-06-14 18:29:29', '2021-06-14 18:29:29', NULL),
(11, 'owner1@gmail.com', 'owner', '$2y$10$iLJNdWTbhIdMGk.ppC1moO2cSluj3ZGV7kZupGwEqO3Ppwe3XA7JG', NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, '2021-06-16 08:13:39', '2021-06-16 08:13:39', NULL);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `auth_activation_attempts`
--
ALTER TABLE `auth_activation_attempts`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `auth_groups`
--
ALTER TABLE `auth_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `auth_groups_permissions`
--
ALTER TABLE `auth_groups_permissions`
  ADD KEY `auth_groups_permissions_permission_id_foreign` (`permission_id`),
  ADD KEY `group_id_permission_id` (`group_id`,`permission_id`);

--
-- Indeks untuk tabel `auth_groups_users`
--
ALTER TABLE `auth_groups_users`
  ADD KEY `auth_groups_users_user_id_foreign` (`user_id`),
  ADD KEY `group_id_user_id` (`group_id`,`user_id`);

--
-- Indeks untuk tabel `auth_logins`
--
ALTER TABLE `auth_logins`
  ADD PRIMARY KEY (`id`),
  ADD KEY `email` (`email`),
  ADD KEY `user_id` (`user_id`);

--
-- Indeks untuk tabel `auth_permissions`
--
ALTER TABLE `auth_permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `auth_reset_attempts`
--
ALTER TABLE `auth_reset_attempts`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `auth_tokens`
--
ALTER TABLE `auth_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `auth_tokens_user_id_foreign` (`user_id`),
  ADD KEY `selector` (`selector`);

--
-- Indeks untuk tabel `auth_users_permissions`
--
ALTER TABLE `auth_users_permissions`
  ADD KEY `auth_users_permissions_permission_id_foreign` (`permission_id`),
  ADD KEY `user_id_permission_id` (`user_id`,`permission_id`);

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `penjualan`
--
ALTER TABLE `penjualan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `nama_sepatu` (`nama_sepatu`);

--
-- Indeks untuk tabel `sepatu`
--
ALTER TABLE `sepatu`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nama_sepatu` (`nama_sepatu`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `auth_activation_attempts`
--
ALTER TABLE `auth_activation_attempts`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `auth_groups`
--
ALTER TABLE `auth_groups`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `auth_logins`
--
ALTER TABLE `auth_logins`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=103;

--
-- AUTO_INCREMENT untuk tabel `auth_permissions`
--
ALTER TABLE `auth_permissions`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `auth_reset_attempts`
--
ALTER TABLE `auth_reset_attempts`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `auth_tokens`
--
ALTER TABLE `auth_tokens`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `penjualan`
--
ALTER TABLE `penjualan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `sepatu`
--
ALTER TABLE `sepatu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `auth_groups_permissions`
--
ALTER TABLE `auth_groups_permissions`
  ADD CONSTRAINT `auth_groups_permissions_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `auth_groups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `auth_groups_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `auth_permissions` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `auth_groups_users`
--
ALTER TABLE `auth_groups_users`
  ADD CONSTRAINT `auth_groups_users_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `auth_groups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `auth_groups_users_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `auth_tokens`
--
ALTER TABLE `auth_tokens`
  ADD CONSTRAINT `auth_tokens_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `auth_users_permissions`
--
ALTER TABLE `auth_users_permissions`
  ADD CONSTRAINT `auth_users_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `auth_permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `auth_users_permissions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
