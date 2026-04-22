-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Apr 15, 2026 at 09:32 PM
-- Server version: 8.0.44
-- PHP Version: 8.2.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `PeakFit`
--

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `payment_id` int NOT NULL,
  `member_id` int NOT NULL,
  `membership_id` int DEFAULT NULL,
  `session_id` int DEFAULT NULL,
  `amount` decimal(10,2) NOT NULL,
  `payment_date` date NOT NULL,
  `payment_method` enum('Cash','Credit Card','Debit Card','Online','Bank Transfer') COLLATE utf8mb4_general_ci NOT NULL,
  `payment_status` enum('Pending','Completed','Failed','Refunded') COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'Completed'
) ;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`payment_id`, `member_id`, `membership_id`, `session_id`, `amount`, `payment_date`, `payment_method`, `payment_status`) VALUES
(1, 1, 1, NULL, 39.99, '2025-02-01', 'Credit Card', 'Completed'),
(2, 2, 2, NULL, 24.99, '2025-02-01', 'Debit Card', 'Completed'),
(3, 3, 3, NULL, 54.99, '2025-02-05', 'Online', 'Completed'),
(4, 4, 4, NULL, 29.99, '2025-01-01', 'Cash', 'Completed'),
(5, 5, 5, NULL, 299.99, '2025-02-10', 'Bank Transfer', 'Completed'),
(6, 6, NULL, 6, 45.00, '2025-03-07', 'Credit Card', 'Pending'),
(7, 7, NULL, 7, 50.00, '2025-03-08', 'Debit Card', 'Completed'),
(8, 8, NULL, 8, 55.00, '2025-03-08', 'Online', 'Failed'),
(9, 9, NULL, 9, 40.00, '2025-03-09', 'Credit Card', 'Completed'),
(10, 10, NULL, 10, 60.00, '2025-03-09', 'Cash', 'Refunded');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`payment_id`),
  ADD KEY `fk_payments_member` (`member_id`),
  ADD KEY `fk_payments_membership` (`membership_id`),
  ADD KEY `fk_payments_session` (`session_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `payment_id` int NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `fk_payments_member` FOREIGN KEY (`member_id`) REFERENCES `members` (`member_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_payments_membership` FOREIGN KEY (`membership_id`) REFERENCES `memberships` (`membership_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_payments_session` FOREIGN KEY (`session_id`) REFERENCES `personal_training_sessions` (`session_id`) ON DELETE RESTRICT ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
