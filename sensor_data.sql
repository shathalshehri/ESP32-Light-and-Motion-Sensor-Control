-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: your-database-host
-- Generation Time: Jul 31, 2024 at 11:35 PM
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
-- Database: `Your_Database_Name`
--

-- --------------------------------------------------------

--
-- Table structure for table `sensor_data`
--

CREATE TABLE `sensor_data` (
  `id` int(11) NOT NULL,
  `light_level` int(11) DEFAULT NULL,
  `motion_detected` tinyint(1) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sensor_data`
--

INSERT INTO `sensor_data` (`id`, `light_level`, `motion_detected`, `timestamp`) VALUES
(74, 4095, 1, '2024-07-31 14:39:04'),
(75, 4095, 1, '2024-07-31 14:41:56'),
(76, 4095, 1, '2024-07-31 14:45:43'),
(77, 4095, 1, '2024-07-31 14:49:19'),
(78, 4095, 1, '2024-07-31 14:50:00'),
(79, 4095, 1, '2024-07-31 14:57:07'),
(80, 4095, 1, '2024-07-31 14:59:53'),
(81, 4095, 1, '2024-07-31 15:00:23'),
(82, 4095, 1, '2024-07-31 15:00:33'),
(83, 4095, 1, '2024-07-31 15:00:55'),
(84, 4095, 1, '2024-07-31 15:01:46'),
(85, 4095, 1, '2024-07-31 15:07:06'),
(86, 4095, 1, '2024-07-31 15:09:06'),
(87, 4095, 1, '2024-07-31 15:12:07'),
(88, 4095, 1, '2024-07-31 15:15:05'),
(89, 4095, 1, '2024-07-31 15:15:56'),
(90, 4095, 1, '2024-07-31 15:18:08'),
(91, 4095, 1, '2024-07-31 15:20:20'),
(92, 4095, 1, '2024-07-31 15:29:28');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `sensor_data`
--
ALTER TABLE `sensor_data`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `sensor_data`
--
ALTER TABLE `sensor_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=93;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
