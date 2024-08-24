-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 24, 2024 at 08:35 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `survey_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `answers`
--

CREATE TABLE `answers` (
  `id` int(30) NOT NULL,
  `survey_id` int(30) NOT NULL,
  `user_id` int(30) NOT NULL,
  `answer` text NOT NULL,
  `question_id` int(30) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `answers`
--

INSERT INTO `answers` (`id`, `survey_id`, `user_id`, `answer`, `question_id`, `date_created`) VALUES
(7, 6, 5, '[OCXBI]', 5, '2024-08-25 00:05:47'),
(8, 6, 5, '[CJkrF]', 6, '2024-08-25 00:05:47'),
(9, 6, 5, '[eyqIP]', 7, '2024-08-25 00:05:47'),
(10, 7, 5, '[oQJUc]', 10, '2024-08-25 01:34:33');

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `id` int(30) NOT NULL,
  `question` text NOT NULL,
  `frm_option` text NOT NULL,
  `type` varchar(50) NOT NULL,
  `order_by` int(11) NOT NULL,
  `survey_id` int(30) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`id`, `question`, `frm_option`, `type`, `order_by`, `survey_id`, `date_created`) VALUES
(5, 'Seberapa Puas Terhadap fasilitas Kampus?', '{\"yxjVC\":\"Kurang Puas\",\"reLXE\":\"Puas\",\"SLsrx\":\"Sangat Puas\"}', 'radio_opt', 0, 6, '2024-08-25 00:02:28'),
(6, 'Seberpa puas terhadap MBKM', '{\"TzwBp\":\"Kurang Puas\",\"XwDrH\":\"Puas\",\"Conpz\":\"Sangat Puas\"}', 'radio_opt', 0, 6, '2024-08-25 00:03:04'),
(7, 'Seberapa Puas Pelayanan TU Kampus?', '{\"Gswfh\":\"Kurang Puas\",\"OYyVu\":\"Puas\",\"HwpTs\":\"Sangat Puas\"}', 'radio_opt', 0, 6, '2024-08-25 00:03:56'),
(9, 'Tulis keluh kesah saat menjalani semester pendek mata kuliah ini.', '', 'textfield_s', 0, 8, '2024-08-25 01:19:50'),
(10, 'Saran untuk penambahan fasilitas olahraga kampus', '{\"DwKWk\":\"Lapang Sepak Bola\",\"ysWJK\":\"Lapang Futsal\",\"NPKVO\":\"Lapang Volly\",\"baXJS\":\"Lapang Basket\",\"oQJUc\":\"Lapang Badminton\",\"PxDpE\":\"Lapang Tennis\"}', 'check_opt', 0, 7, '2024-08-25 01:27:16');

-- --------------------------------------------------------

--
-- Table structure for table `survey_set`
--

CREATE TABLE `survey_set` (
  `id` int(30) NOT NULL,
  `title` varchar(200) NOT NULL,
  `description` text NOT NULL,
  `user_id` int(30) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `survey_set`
--

INSERT INTO `survey_set` (`id`, `title`, `description`, `user_id`, `start_date`, `end_date`, `date_created`) VALUES
(6, 'Survey Kepuasan Mahasiswa', 'Survey Kepuasan Mahasiswa Unviersiatas Buana Perjuangan Karawang', 0, '2024-08-21', '2024-08-31', '2024-08-25 00:00:47'),
(7, 'Saran penambahan fasilitas olahraga kampus', 'Tuliskan sarana olahraga berupa lapangan yang banyak diminati.', 0, '2024-08-24', '2024-08-26', '2024-08-25 00:07:38'),
(8, 'Survey Semester Pendek Mobile Framework', 'Tulis keluh kesah saat menjalani semester pendek mata kuliah ini.', 0, '2024-08-01', '2024-08-31', '2024-08-25 01:17:20');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(30) NOT NULL,
  `firstname` varchar(200) NOT NULL,
  `lastname` varchar(200) NOT NULL,
  `middlename` varchar(200) NOT NULL,
  `contact` varchar(100) NOT NULL,
  `address` text NOT NULL,
  `email` varchar(200) NOT NULL,
  `password` text NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 3 COMMENT '1=Admin,2 = Staff, 3= Subscriber',
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstname`, `lastname`, `middlename`, `contact`, `address`, `email`, `password`, `type`, `date_created`) VALUES
(1, 'Admin', 'Admin', '', '+123456789', 'Sample address', 'admin@admin.com', '0192023a7bbd73250516f069df18b500', 1, '2020-11-10 08:43:06'),
(5, 'saepul', 's', 'hidayat', '085860291106', 'karawang', 'if23.saepulhidayat@mhs.ubpkarawang.ac.id', '0192023a7bbd73250516f069df18b500', 3, '2024-08-25 00:05:31');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `answers`
--
ALTER TABLE `answers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `survey_set`
--
ALTER TABLE `survey_set`
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
-- AUTO_INCREMENT for table `answers`
--
ALTER TABLE `answers`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `survey_set`
--
ALTER TABLE `survey_set`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
