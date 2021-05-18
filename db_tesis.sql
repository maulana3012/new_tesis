-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 18 Bulan Mei 2021 pada 10.54
-- Versi server: 10.4.17-MariaDB
-- Versi PHP: 7.3.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_tesis`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_access_karyawan`
--

CREATE TABLE `tb_access_karyawan` (
  `ID` int(10) NOT NULL,
  `NIK` int(12) NOT NULL,
  `FULLNAME` varchar(225) NOT NULL,
  `TEMPORARY_PASSWORD` varchar(225) NOT NULL,
  `PASSWORD` varchar(225) DEFAULT NULL,
  `EMAIL` varchar(50) NOT NULL,
  `gambar` varchar(220) DEFAULT NULL,
  `STATUS` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_access_karyawan`
--

INSERT INTO `tb_access_karyawan` (`ID`, `NIK`, `FULLNAME`, `TEMPORARY_PASSWORD`, `PASSWORD`, `EMAIL`, `gambar`, `STATUS`) VALUES
(1, 19185, 'Muhamad Maulana', '$2y$10$.V.P1h8CxFxqHqWtFi87p.ktQDW2njKoCWOInMHq2duw9I1TSHp0G', NULL, 'muhamadmaulanarachman@gmail.com', '', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_devisi`
--

CREATE TABLE `tb_devisi` (
  `ID` int(11) NOT NULL,
  `KODE` varchar(20) NOT NULL,
  `DEVISI` varchar(225) NOT NULL,
  `STATUS` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_devisi`
--

INSERT INTO `tb_devisi` (`ID`, `KODE`, `DEVISI`, `STATUS`) VALUES
(1, 'QSI-0001', 'IT PRODUCT SPECIALIST', 2),
(2, 'QSI-0002', 'IT MOBILE APPS', 2),
(3, 'QSI-0003', 'IT IMAGING PRODCUT', 2),
(4, 'QSI-0004', 'IT SUPPORT', 2),
(5, 'QSI-0005', 'PRODUCT MANGER OWNER', 2),
(6, 'QSI-0006', 'BUSINESS ANALYST', 2),
(7, 'QSI-0007', 'IT PRINTING', 2),
(8, 'QSI-0008', 'UI/UX', 2),
(10, 'QSI-0009', 'TEST', 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_image`
--

CREATE TABLE `tb_image` (
  `ID` int(11) NOT NULL,
  `ID_KARYAWAN` int(12) NOT NULL,
  `NAME_IMAGE` varchar(225) NOT NULL,
  `RGB_IMAGE` varchar(220) NOT NULL,
  `GRAY_IMAGE` varchar(220) NOT NULL,
  `CROP_IMAGE` varchar(220) NOT NULL,
  `SIZE_IMAGE` int(20) NOT NULL,
  `DIRECTORY_IMAGE` varchar(100) NOT NULL,
  `CREATED_DATE` datetime NOT NULL,
  `STATUS_IMAGE` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_image`
--

INSERT INTO `tb_image` (`ID`, `ID_KARYAWAN`, `NAME_IMAGE`, `RGB_IMAGE`, `GRAY_IMAGE`, `CROP_IMAGE`, `SIZE_IMAGE`, `DIRECTORY_IMAGE`, `CREATED_DATE`, `STATUS_IMAGE`) VALUES
(1, 19185, 'Muhamad', 'asset/_upload/dataset/Wihtout-Mask-608d1a4136e568.07124643.jpg', '', '', 0, '', '2021-05-01 11:07:13', 0),
(2, 19185, 'Muhamad', 'asset/_upload/dataset/Wihtout-Mask-608d1a41673547.26488454.jpg', '', '', 0, '', '2021-05-01 11:07:13', 0),
(3, 19185, 'Muhamad', 'asset/_upload/dataset/Wihtout-Mask-608d1a41708da4.76585679.jpg', '', '', 0, '', '2021-05-01 11:07:13', 0),
(4, 19185, 'Muhamad', 'asset/_upload/dataset/With-Mask-608d1a4a14a362.51007250.jpg', '', '', 0, '', '2021-05-01 11:07:22', 1),
(5, 19185, 'Muhamad', 'asset/_upload/dataset/With-Mask-608d1a4a692bc3.94761414.jpg', '', '', 0, '', '2021-05-01 11:07:22', 1),
(6, 19185, 'Muhamad', 'asset/_upload/dataset/With-Mask-608d1a4a8f25f1.98872685.jpg', '', '', 0, '', '2021-05-01 11:07:22', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_jam_absen`
--

CREATE TABLE `tb_jam_absen` (
  `ID` int(11) NOT NULL,
  `JAM_MASUK` time(6) NOT NULL,
  `JAM_PULUANG` time(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_karyawan`
--

CREATE TABLE `tb_karyawan` (
  `ID` int(11) NOT NULL,
  `NIK` int(12) NOT NULL,
  `FRISTNAME` varchar(225) NOT NULL,
  `LASTNAME` varchar(225) NOT NULL,
  `TEMPAT_LAHIR` varchar(225) NOT NULL,
  `TANGGAL_LAHIR` date NOT NULL,
  `JENIS_KELAMIN` varchar(50) NOT NULL,
  `AGAMA` varchar(50) NOT NULL,
  `ALAMAT` text NOT NULL,
  `NOMOR_HANDPHONE` int(12) NOT NULL,
  `EMAIL` varchar(225) NOT NULL,
  `DEVISI` varchar(50) NOT NULL,
  `JABATAN` varchar(50) NOT NULL,
  `TANGGAL_BAERGABUNG` date NOT NULL,
  `STATUS` varchar(100) NOT NULL,
  `TANGGAL_CRATED` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_karyawan`
--

INSERT INTO `tb_karyawan` (`ID`, `NIK`, `FRISTNAME`, `LASTNAME`, `TEMPAT_LAHIR`, `TANGGAL_LAHIR`, `JENIS_KELAMIN`, `AGAMA`, `ALAMAT`, `NOMOR_HANDPHONE`, `EMAIL`, `DEVISI`, `JABATAN`, `TANGGAL_BAERGABUNG`, `STATUS`, `TANGGAL_CRATED`) VALUES
(1, 19185, 'Muhamad', 'Maulana', 'Jakarta', '1992-12-31', 'Laki-Laki', 'Islam', 'Jakarta Timur', 2147483647, 'muhamadmaulanarachman@gmail.com', 'IT PRODUCT SPECIALIST', 'Programmer', '2021-05-01', '1', '2021-05-01 11:06:40');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_user`
--

CREATE TABLE `tb_user` (
  `ID` int(10) NOT NULL,
  `FRISTNAME` varchar(225) NOT NULL,
  `LASTNAME` varchar(225) NOT NULL,
  `PASSWORD` varchar(225) NOT NULL,
  `CONFIRM_PASSWORD` varchar(225) NOT NULL,
  `EMAIL` varchar(225) NOT NULL,
  `IMAGE` varchar(225) NOT NULL,
  `USERMANAGER` int(2) NOT NULL,
  `ADMINISTRATOR` int(2) NOT NULL,
  `DEVELOPER` int(2) NOT NULL,
  `DATA_ADMINISTRATOR` int(2) NOT NULL,
  `REPORTING` int(2) NOT NULL,
  `READONLY` int(2) NOT NULL,
  `PROJECTCREATOR` int(2) NOT NULL,
  `DATE_CREATED` datetime NOT NULL,
  `STATUS` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_user`
--

INSERT INTO `tb_user` (`ID`, `FRISTNAME`, `LASTNAME`, `PASSWORD`, `CONFIRM_PASSWORD`, `EMAIL`, `IMAGE`, `USERMANAGER`, `ADMINISTRATOR`, `DEVELOPER`, `DATA_ADMINISTRATOR`, `REPORTING`, `READONLY`, `PROJECTCREATOR`, `DATE_CREATED`, `STATUS`) VALUES
(7, 'Muhamad Maulana', 'Rachman', '$2y$10$KM.F3sNCGg9F4swZwypyse5Ro6zLtxwb5A8DxgVB3nS6/ET31jnl.', '$2y$10$KM.F3sNCGg9F4swZwypyse5Ro6zLtxwb5A8DxgVB3nS6/ET31jnl.', 'muhamadmaulanarachman@gmail.com', 'asset/_images/undraw_profile.svg', 1, 1, 1, 1, 1, 1, 1, '2021-01-09 05:46:10', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_user_log`
--

CREATE TABLE `tb_user_log` (
  `id` int(11) NOT NULL,
  `tanggal` datetime NOT NULL,
  `expired` datetime NOT NULL,
  `token` varchar(40) NOT NULL,
  `username` varchar(50) NOT NULL,
  `ip` varchar(20) NOT NULL,
  `useragent` varchar(150) NOT NULL,
  `status` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_user_log`
--

INSERT INTO `tb_user_log` (`id`, `tanggal`, `expired`, `token`, `username`, `ip`, `useragent`, `status`) VALUES
(24, '2021-01-09 05:46:54', '2021-01-09 05:46:54', '', 'muhamadmaulanarachman@gmail.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 9),
(25, '2021-01-09 05:47:12', '2021-01-09 11:47:12', 'ca3ceff17c0d7190af1ea3534d58faf19c63a91a', 'muhamadmaulanarachman@gmail.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 1),
(26, '2021-01-09 06:44:52', '2021-01-09 06:45:34', 'e22236a16c951c5b72be31a183cca6492ec418ed', 'muhamadmaulanarachman@gmail.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 1),
(27, '2021-01-09 06:45:40', '2021-01-09 12:45:40', 'a7121f375b8fbc521e7e3d4db81495dea6199a14', 'muhamadmaulanarachman@gmail.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 1),
(28, '2021-01-09 12:40:12', '2021-01-09 12:40:25', '78b3156caec29551bf81cde7c1a7935ddb3016f2', 'muhamadmaulanarachman@gmail.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 1),
(29, '2021-01-09 12:41:10', '2021-01-09 18:41:10', '9e17018fba93f2220f38674696547c0bdb083ddd', 'muhamadmaulanarachman@gmail.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 1),
(30, '2021-01-09 13:17:30', '2021-01-09 17:14:07', '4faf8e9c4d9ad5ef7d8bda4d890ab7fce1d9c457', 'muhamadmaulanarachman@gmail.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 1),
(31, '2021-01-09 17:14:17', '2021-01-09 23:14:17', 'c53f2033ea8e9e655371d4b43acc63233abf94fa', 'muhamadmaulanarachman@gmail.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 1),
(32, '2021-01-09 22:44:58', '2021-01-09 23:21:58', '7d1b29823de358efd0a0d1699d44a72c6c5b7cf2', 'muhamadmaulanarachman@gmail.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 1),
(33, '2021-01-09 23:22:06', '2021-01-09 23:22:06', '', 'muhamadmaulanarachman@gmail.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 9),
(34, '2021-01-09 23:22:20', '2021-01-09 23:22:20', '', 'muhamadmaulanarachman@gmail.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 9),
(35, '2021-01-09 23:22:34', '2021-01-09 23:29:47', 'e940eee336d5efa81bb8d70a20b501e87f94c17f', 'muhamadmaulanarachman@gmail.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 1),
(36, '2021-01-09 23:29:54', '2021-01-09 23:29:54', '', 'muhamadmaulanarachman@gmail.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 9),
(37, '2021-01-09 23:30:21', '2021-01-09 23:30:21', 'aee61e1218113b66bd2c5a2a89e9d5144f4d02c4', 'muhamadmaulanarachman@gmail.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 1),
(38, '2021-01-09 23:34:23', '2021-01-09 23:34:57', '2fc4a9bcf719d2bc78421cec437f118492da3709', 'muhamadmaulanarachman@gmail.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 1),
(39, '2021-01-09 23:35:05', '2021-01-09 23:35:21', '1c9e573cb4cfaf178c8b4db32ee473a6149c6827', 'muhamadmaulanarachman@gmail.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 1),
(40, '2021-01-09 23:35:39', '2021-01-09 23:37:03', '46011d9c22a7abda7ab428eb0670d55aa7c907d0', 'muhamadmaulanarachman@gmail.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 1),
(41, '2021-01-09 23:37:10', '2021-01-09 23:38:40', 'e55cbda6b335135f64f63fabd392c4d0985a59a2', 'muhamadmaulanarachman@gmail.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 1),
(42, '2021-01-09 23:38:54', '2021-01-09 23:38:54', '', 'muhamadmaulanarachman@gmail.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 9),
(43, '2021-01-09 23:39:11', '2021-01-09 23:40:42', '9fc9214abe578f71022dfeeff58a36e0c361fcc3', 'muhamadmaulanarachman@gmail.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 1),
(44, '2021-01-09 23:40:49', '2021-01-09 23:41:29', '3a3c601405f2d0aa3c431ba4100c4d1dde0f6129', 'muhamadmaulanarachman@gmail.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 1),
(45, '2021-01-09 23:41:45', '2021-01-09 23:45:29', '6a72e7656883fa1be3f616012a03640df3d28bd6', 'muhamadmaulanarachman@gmail.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 1),
(46, '2021-01-09 23:48:41', '2021-01-09 23:48:41', '', 'muhamadmaulanarachman@gmail.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 9),
(47, '2021-01-09 23:48:58', '2021-01-09 23:49:04', '37d862362ebc51cb24a7063f5cb58024fb374cfa', 'muhamadmaulanarachman@gmail.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 1),
(48, '2021-01-10 11:47:06', '2021-01-10 11:47:06', '', 'muhamadmaulanarachman@gmail.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 9),
(49, '2021-01-10 11:47:17', '2021-01-10 11:47:17', '', 'muhamadmaulanarachman@gmail.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 9),
(50, '2021-01-10 11:51:40', '2021-01-10 17:51:40', 'ad3c977346ac0104c9a16a65a285141569eaf00d', 'muhamadmaulanarachman@gmail.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 1),
(51, '2021-01-11 15:11:16', '2021-01-11 15:41:31', 'f3e750d8cb64972b164ff4f25afdad39cfc1604e', 'muhamadmaulanarachman@gmail.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 1),
(52, '2021-01-11 15:51:08', '2021-01-11 21:51:08', 'abbd6151847657a703264509d5dcc7569251386c', 'muhamadmaulanarachman@gmail.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 1),
(53, '2021-01-14 10:15:41', '2021-01-14 16:15:41', 'e9236c32e73b99439d343f5eeeb600b6027388ac', 'muhamadmaulanarachman@gmail.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 1),
(54, '2021-01-15 14:31:34', '2021-01-15 17:29:52', 'fa520d0dd7acfcb453c24bcb92fd3848270f9e36', 'muhamadmaulanarachman@gmail.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 1),
(55, '2021-01-16 11:42:43', '2021-01-16 17:42:43', '88b9726fb91dfc5c944d4e9bf4f17b7c9d05a6c6', 'muhamadmaulanarachman@gmail.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 1),
(56, '2021-01-17 04:45:20', '2021-01-17 10:45:20', 'bc98cb739ffe54279a39387f94e4064b129e055c', 'muhamadmaulanarachman@gmail.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 1),
(57, '2021-01-18 05:06:47', '2021-01-18 11:06:47', '258f9de64d5e0f57a2ccc8624e1df9c125bf4fd8', 'muhamadmaulanarachman@gmail.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 1),
(58, '2021-01-21 14:53:09', '2021-01-21 14:53:09', '', 'muhamadmaulanarachman@gmail.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 9),
(59, '2021-01-21 14:53:15', '2021-01-21 20:53:15', 'd4f0f53a7596c2cffcc5da98895e0fa1bc44c67c', 'muhamadmaulanarachman@gmail.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 1),
(60, '2021-04-13 07:48:42', '2021-04-13 13:48:42', 'e5736a3bd2202a4c84d3f4cb78bbe3350bc674d0', 'muhamadmaulanarachman@gmail.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 1),
(61, '2021-04-17 17:19:53', '2021-04-17 17:19:53', '', 'muhamadmaulanarachman@gmail.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.128 Safari/537.36', 9),
(62, '2021-04-17 17:19:58', '2021-04-17 19:04:30', '82202f4743ca31aba07f6ede25273d1e5d7f8f85', 'muhamadmaulanarachman@gmail.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.128 Safari/537.36', 1),
(63, '2021-04-26 15:02:42', '2021-04-26 15:02:42', '', 'muhamadmaulanarachman@gmail.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.85 Safari/537.36', 9),
(64, '2021-04-26 15:02:48', '2021-04-26 21:02:48', 'e06c80dcb1844a7d3f5230135f6e314938881861', 'muhamadmaulanarachman@gmail.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.85 Safari/537.36', 1),
(65, '2021-04-26 16:25:11', '2021-04-26 16:25:11', '', 'muhamadmaulanarachman@gmail.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.85 Safari/537.36', 9),
(66, '2021-04-26 16:25:17', '2021-04-26 22:25:17', '02f23e75f0fc6ba372fc5f0431dbfe521571e745', 'muhamadmaulanarachman@gmail.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.85 Safari/537.36', 1),
(84, '2021-05-01 13:07:51', '2021-05-01 13:07:51', '', 'muhamadmaulanarachman@gmail.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', 9),
(85, '2021-05-01 13:08:41', '2021-05-01 13:08:41', '', 'muhamadmaulanarachman@gmail.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', 9),
(86, '2021-05-01 13:09:00', '2021-05-01 19:09:00', '752dd40fd7ce5c0ec8bfd1db77ab7552c8b74b31', 'muhamadmaulanarachman@gmail.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', 1),
(87, '2021-05-01 13:12:50', '2021-05-01 19:12:50', 'f1a61e569a5fc24c80d531e83c2b3747da5c77a5', '19185', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', 1),
(88, '2021-05-01 13:35:18', '2021-05-01 13:35:18', '', '19185', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', 9),
(89, '2021-05-01 13:35:27', '2021-05-01 19:35:27', '2eec34fd4d0f870bd5d2a92b82ed9988c97158e2', '19185', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', 1),
(90, '2021-05-01 14:47:19', '2021-05-01 18:52:21', 'ad5c30a70b2c592bb1ccfeec1b2bccf21a0af998', '19185', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', 1),
(91, '2021-05-01 18:14:24', '2021-05-01 18:14:24', '', '19185', '192.168.1.7', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', 0),
(92, '2021-05-01 18:41:13', '2021-05-02 00:41:13', '2c9d59f4272951655740aa700f374632a6d008fd', '19185', '192.168.1.2', 'Mozilla/5.0 (iPhone; CPU iPhone OS 12_5 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/87.0.4280.163 Mobile/15E148 Safari/604.1', 1),
(93, '2021-05-01 18:52:34', '2021-05-01 18:52:34', '', 'muhamadmaulanarachman@gmail.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', 9),
(94, '2021-05-01 18:52:42', '2021-05-01 18:52:42', '', 'muhamadmaulanarachman@gmail.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', 9),
(95, '2021-05-01 18:52:47', '2021-05-01 18:55:02', '586e83f09fdd6c308da9cabf1f2bdda5f9188896', 'muhamadmaulanarachman@gmail.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', 1),
(96, '2021-05-01 19:36:15', '2021-05-02 01:36:15', 'ed38ea99e93e6358b50205a72a3574a5a14b00ab', '19185', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', 1),
(97, '2021-05-01 19:53:54', '2021-05-02 01:53:54', '64cc62275e6a24b530dae7fcf21ac67763d8ae22', '19185', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', 1),
(98, '2021-05-01 20:23:50', '2021-05-01 20:23:50', '', '19185', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', 9),
(99, '2021-05-01 20:23:59', '2021-05-02 02:23:59', 'd5fd4637d2226c92dd838617f8695969e7e57e28', '19185', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', 1),
(100, '2021-05-02 07:30:24', '2021-05-02 07:30:24', '', '19185', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', 9),
(101, '2021-05-02 07:30:34', '2021-05-02 13:30:34', 'd61ef24c5b455f435559e52fc051a8e06394b073', '19185', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', 1),
(102, '2021-05-02 08:00:30', '2021-05-02 08:45:37', 'e1b4873667b4c266bd062833cabd26500a326fd3', '19185', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', 1),
(103, '2021-05-02 08:45:50', '2021-05-02 08:45:50', '', 'muhamadmaulanarachman@gmail.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', 9),
(104, '2021-05-02 08:45:55', '2021-05-02 08:46:49', '7cd6d87452651b616728e2a7bd84d65023465de6', 'muhamadmaulanarachman@gmail.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', 1),
(105, '2021-05-02 08:48:57', '2021-05-02 14:48:57', 'b01bf28f8ee82bdd1b309f81d3c69661b3d30876', '19185', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', 1),
(106, '2021-05-02 09:13:34', '2021-05-02 09:16:56', 'de2c29be4c39ec97e08918a80c6cec41f182f14d', '19185', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', 1),
(107, '2021-05-02 09:17:06', '2021-05-02 15:17:06', '5d4424bf88b5b7915d8bd275f74b8665eaa09350', 'muhamadmaulanarachman@gmail.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', 1),
(108, '2021-05-06 10:42:24', '2021-05-06 10:42:24', '', '19185', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', 9),
(109, '2021-05-06 10:42:31', '2021-05-06 10:42:31', '', '19185', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', 9),
(110, '2021-05-06 10:42:39', '2021-05-06 16:42:39', '2e952f914fa0f9bc8520896e361745d8dace527d', '19185', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', 1),
(111, '2021-05-06 11:03:33', '2021-05-06 17:03:33', '1b756b2013b27be01549c9451385f8cdf0ab5a3a', '19185', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', 1),
(112, '2021-05-06 11:35:17', '2021-05-06 13:02:12', 'db8643bc71c19a38a12542691f447fc793ddcbe0', '19185', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', 1),
(113, '2021-05-06 13:06:35', '2021-05-06 13:07:33', 'e00cbcf2b5ecf99cf0790d98cba6cc0b55291b81', '19185', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', 1),
(114, '2021-05-06 13:08:45', '2021-05-06 13:09:03', 'b2c02158b1f3d834df4378513b7812e9a949495f', '19185', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', 1),
(115, '2021-05-06 13:09:34', '2021-05-06 13:09:34', '', 'muhamadmaulanarachman@gmail.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', 9),
(116, '2021-05-06 13:09:40', '2021-05-06 13:10:35', '2ee04f8e4a44ae45db6ed151617d53ea25462be9', 'muhamadmaulanarachman@gmail.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', 1),
(117, '2021-05-06 13:11:49', '2021-05-06 19:11:49', '64d10b4574af8fa51480f753d6c93e894ebf6fc3', '19185', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', 1),
(118, '2021-05-06 20:04:51', '2021-05-06 20:04:51', '', '19185', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', 9),
(119, '2021-05-06 20:04:57', '2021-05-07 02:04:57', 'c02830098d7f1870a12a6d8abd5a0f235308baec', '19185', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', 1),
(120, '2021-05-09 19:10:54', '2021-05-10 01:10:54', '0a0f06cb70119ca363aa038e0df1a125cb8385a7', '19185', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', 1),
(121, '2021-05-18 10:15:42', '2021-05-18 10:15:42', '', '19185', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.212 Safari/537.36', 9),
(122, '2021-05-18 10:15:56', '2021-05-18 10:15:56', '', '19185', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.212 Safari/537.36', 9),
(123, '2021-05-18 10:16:09', '2021-05-18 10:16:42', 'cb4622058330309045f0d6b73ab225b7b92049d9', '19185', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.212 Safari/537.36', 1),
(124, '2021-05-18 10:16:57', '2021-05-18 16:16:57', 'b2009e5d8cde0d232a2ab2333baad28fe0e3c040', '19185', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.212 Safari/537.36', 1);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `tb_access_karyawan`
--
ALTER TABLE `tb_access_karyawan`
  ADD PRIMARY KEY (`ID`);

--
-- Indeks untuk tabel `tb_devisi`
--
ALTER TABLE `tb_devisi`
  ADD PRIMARY KEY (`ID`);

--
-- Indeks untuk tabel `tb_image`
--
ALTER TABLE `tb_image`
  ADD PRIMARY KEY (`ID`);

--
-- Indeks untuk tabel `tb_jam_absen`
--
ALTER TABLE `tb_jam_absen`
  ADD PRIMARY KEY (`ID`);

--
-- Indeks untuk tabel `tb_karyawan`
--
ALTER TABLE `tb_karyawan`
  ADD PRIMARY KEY (`ID`);

--
-- Indeks untuk tabel `tb_user`
--
ALTER TABLE `tb_user`
  ADD PRIMARY KEY (`ID`);

--
-- Indeks untuk tabel `tb_user_log`
--
ALTER TABLE `tb_user_log`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `tb_access_karyawan`
--
ALTER TABLE `tb_access_karyawan`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `tb_devisi`
--
ALTER TABLE `tb_devisi`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `tb_image`
--
ALTER TABLE `tb_image`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `tb_jam_absen`
--
ALTER TABLE `tb_jam_absen`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `tb_karyawan`
--
ALTER TABLE `tb_karyawan`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `tb_user`
--
ALTER TABLE `tb_user`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `tb_user_log`
--
ALTER TABLE `tb_user_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=125;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
