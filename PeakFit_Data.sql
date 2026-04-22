-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Apr 15, 2026 at 07:23 PM
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
-- Table structure for table `class_attendance`
--

CREATE TABLE `class_attendance` (
  `schedule_id` int NOT NULL,
  `member_id` int NOT NULL,
  `attendance_status` enum('Registered','Attended','Missed','Cancelled') COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'Registered'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `class_attendance`
--

INSERT INTO `class_attendance` (`schedule_id`, `member_id`, `attendance_status`) VALUES
(1, 1, 'Attended'),
(2, 2, 'Attended'),
(3, 3, 'Registered'),
(4, 4, 'Missed'),
(5, 5, 'Attended'),
(6, 6, 'Cancelled'),
(7, 7, 'Attended'),
(8, 8, 'Registered'),
(9, 9, 'Attended'),
(10, 10, 'Attended');

-- --------------------------------------------------------

--
-- Table structure for table `class_schedules`
--

CREATE TABLE `class_schedules` (
  `schedule_id` int NOT NULL,
  `class_id` int NOT NULL,
  `trainer_id` int NOT NULL,
  `class_date` date NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL
) ;

--
-- Dumping data for table `class_schedules`
--

INSERT INTO `class_schedules` (`schedule_id`, `class_id`, `trainer_id`, `class_date`, `start_time`, `end_time`) VALUES
(1, 1, 5, '2025-03-01', '08:00:00', '09:00:00'),
(2, 2, 3, '2025-03-01', '09:30:00', '10:15:00'),
(3, 3, 6, '2025-03-01', '11:00:00', '11:45:00'),
(4, 4, 1, '2025-03-02', '08:00:00', '09:00:00'),
(5, 5, 7, '2025-03-02', '09:15:00', '10:00:00'),
(6, 6, 9, '2025-03-02', '10:30:00', '11:15:00'),
(7, 7, 4, '2025-03-03', '06:00:00', '07:00:00'),
(8, 8, 9, '2025-03-03', '12:00:00', '12:45:00'),
(9, 9, 4, '2025-03-03', '17:00:00', '18:00:00'),
(10, 10, 2, '2025-03-03', '18:30:00', '19:15:00');

-- --------------------------------------------------------

--
-- Table structure for table `equipment`
--

CREATE TABLE `equipment` (
  `equipment_id` int NOT NULL,
  `equipment_name` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `category` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `purchase_date` date DEFAULT NULL,
  `condition_status` enum('Available','In Use','Under Maintenance','Retired') COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'Available',
  `location` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `equipment`
--

INSERT INTO `equipment` (`equipment_id`, `equipment_name`, `category`, `purchase_date`, `condition_status`, `location`) VALUES
(1, 'Treadmill A', 'Cardio', '2023-01-10', 'Available', 'Cardio Zone'),
(2, 'Treadmill B', 'Cardio', '2023-01-10', 'In Use', 'Cardio Zone'),
(3, 'Elliptical A', 'Cardio', '2023-02-12', 'Available', 'Cardio Zone'),
(4, 'Rowing Machine A', 'Cardio', '2023-03-15', 'Under Maintenance', 'Cardio Zone'),
(5, 'Bench Press Station', 'Strength', '2023-04-18', 'Available', 'Weight Room'),
(6, 'Squat Rack 1', 'Strength', '2023-05-22', 'Available', 'Weight Room'),
(7, 'Leg Press Machine', 'Strength', '2023-06-27', 'Available', 'Weight Room'),
(8, 'Cable Machine', 'Strength', '2023-07-19', 'In Use', 'Weight Room'),
(9, 'Yoga Mats Set', 'Flexibility', '2023-08-08', 'Available', 'Studio A'),
(10, 'Spin Bike 1', 'Cardio', '2023-09-14', 'Retired', 'Cycle Room');

-- --------------------------------------------------------

--
-- Table structure for table `exercises`
--

CREATE TABLE `exercises` (
  `exercise_id` int NOT NULL,
  `exercise_name` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `muscle_group` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `equipment_required` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_general_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `exercises`
--

INSERT INTO `exercises` (`exercise_id`, `exercise_name`, `muscle_group`, `equipment_required`, `description`) VALUES
(1, 'Bench Press', 'Chest', 'Barbell', 'Barbell press for upper body strength'),
(2, 'Squat', 'Legs', 'Barbell', 'Compound lower body exercise'),
(3, 'Deadlift', 'Back', 'Barbell', 'Posterior chain compound movement'),
(4, 'Plank', 'Core', 'Mat', 'Static core stabilization exercise'),
(5, 'Treadmill Run', 'Cardio', 'Treadmill', 'Steady-state cardio exercise'),
(6, 'Lat Pulldown', 'Back', 'Cable Machine', 'Upper back pulling movement'),
(7, 'Shoulder Press', 'Shoulders', 'Dumbbells', 'Overhead pressing exercise'),
(8, 'Leg Press', 'Legs', 'Leg Press Machine', 'Machine-based quad and glute exercise'),
(9, 'Yoga Stretch Flow', 'Flexibility', 'None', 'Guided flexibility sequence'),
(10, 'Rowing', 'Cardio', 'Rowing Machine', 'Full-body cardio exercise');

-- --------------------------------------------------------

--
-- Table structure for table `fitness_classes`
--

CREATE TABLE `fitness_classes` (
  `class_id` int NOT NULL,
  `class_name` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `class_type` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `capacity` int NOT NULL,
  `room_name` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL
) ;

--
-- Dumping data for table `fitness_classes`
--

INSERT INTO `fitness_classes` (`class_id`, `class_name`, `class_type`, `capacity`, `room_name`) VALUES
(1, 'Morning Yoga', 'Yoga', 20, 'Studio A'),
(2, 'HIIT Blast', 'HIIT', 18, 'Studio B'),
(3, 'Spin Cycle', 'Cardio', 15, 'Cycle Room'),
(4, 'Strength Basics', 'Strength Training', 16, 'Weight Room'),
(5, 'Pilates Core', 'Pilates', 18, 'Studio A'),
(6, 'Zumba Fusion', 'Dance Fitness', 22, 'Studio B'),
(7, 'Bootcamp', 'Strength Training', 20, 'Main Floor'),
(8, 'Mobility Flow', 'Mobility', 14, 'Studio C'),
(9, 'Powerlifting Intro', 'Strength Training', 12, 'Weight Room'),
(10, 'Evening Cardio', 'Cardio', 25, 'Main Floor');

-- --------------------------------------------------------

--
-- Table structure for table `maintenance_records`
--

CREATE TABLE `maintenance_records` (
  `equipment_id` int NOT NULL,
  `maintenance_date` date NOT NULL,
  `description` text COLLATE utf8mb4_general_ci NOT NULL,
  `technician_name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `next_due_date` date DEFAULT NULL
) ;

--
-- Dumping data for table `maintenance_records`
--

INSERT INTO `maintenance_records` (`equipment_id`, `maintenance_date`, `description`, `technician_name`, `next_due_date`) VALUES
(1, '2025-02-01', 'Belt alignment and cleaning', 'Lucas Brooks', '2025-05-01'),
(2, '2025-02-03', 'Motor inspection', 'Amelia Price', '2025-05-03'),
(3, '2025-02-05', 'Resistance calibration', 'Levi Cook', '2025-05-05'),
(4, '2025-02-07', 'Handle replacement', 'Lucas Brooks', '2025-05-07'),
(5, '2025-02-09', 'Padding replacement', 'Amelia Price', '2025-05-09'),
(6, '2025-02-11', 'Safety bar adjustment', 'Levi Cook', '2025-05-11'),
(7, '2025-02-13', 'Hydraulic check', 'Lucas Brooks', '2025-05-13'),
(8, '2025-02-15', 'Cable tension tuning', 'Amelia Price', '2025-05-15'),
(9, '2025-02-17', 'Sanitization and inventory check', 'Levi Cook', '2025-05-17'),
(10, '2025-02-19', 'Brake inspection', 'Lucas Brooks', '2025-05-19');

-- --------------------------------------------------------

--
-- Table structure for table `members`
--

CREATE TABLE `members` (
  `member_id` int NOT NULL,
  `first_name` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `last_name` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `date_of_birth` date DEFAULT NULL,
  `gender` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `join_date` date NOT NULL,
  `account_status` enum('Active','Inactive','Suspended') COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'Active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `members`
--

INSERT INTO `members` (`member_id`, `first_name`, `last_name`, `date_of_birth`, `gender`, `phone`, `email`, `address`, `join_date`, `account_status`) VALUES
(1, 'Taylor', 'Bannan', '2003-04-15', 'Female', '9895551001', 'taylor.bannan@peakfit.com', '101 Center Ave, Bay City, MI', '2025-01-10', 'Active'),
(2, 'Logan', 'Traxler', '2002-08-20', 'Male', '9895551002', 'logan.traxler@peakfit.com', '202 Adams St, Saginaw, MI', '2025-01-12', 'Active'),
(3, 'Emma', 'Clark', '1999-02-11', 'Female', '9895551003', 'emma.clark@peakfit.com', '303 Pine St, Midland, MI', '2025-01-15', 'Active'),
(4, 'Noah', 'Davis', '1998-07-09', 'Male', '9895551004', 'noah.davis@peakfit.com', '404 Oak St, Bay City, MI', '2025-01-18', 'Inactive'),
(5, 'Olivia', 'Martin', '2001-11-30', 'Female', '9895551005', 'olivia.martin@peakfit.com', '505 Lakeview Dr, Essexville, MI', '2025-01-20', 'Active'),
(6, 'Liam', 'Wilson', '1997-05-22', 'Male', '9895551006', 'liam.wilson@peakfit.com', '606 River Rd, Midland, MI', '2025-01-22', 'Suspended'),
(7, 'Sophia', 'Hall', '2000-03-18', 'Female', '9895551007', 'sophia.hall@peakfit.com', '707 Johnson St, Saginaw, MI', '2025-01-24', 'Active'),
(8, 'Mason', 'Allen', '1996-09-14', 'Male', '9895551008', 'mason.allen@peakfit.com', '808 Grove St, Bay City, MI', '2025-01-26', 'Active'),
(9, 'Ava', 'Young', '2004-01-07', 'Female', '9895551009', 'ava.young@peakfit.com', '909 Maple St, Auburn, MI', '2025-01-28', 'Active'),
(10, 'Ethan', 'King', '1995-12-03', 'Male', '9895551010', 'ethan.king@peakfit.com', '100 State St, Saginaw, MI', '2025-01-30', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `memberships`
--

CREATE TABLE `memberships` (
  `membership_id` int NOT NULL,
  `member_id` int NOT NULL,
  `plan_id` int NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `membership_status` enum('Active','Expired','Cancelled','Pending') COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'Pending',
  `auto_renew` tinyint(1) NOT NULL DEFAULT '0'
) ;

--
-- Dumping data for table `memberships`
--

INSERT INTO `memberships` (`membership_id`, `member_id`, `plan_id`, `start_date`, `end_date`, `membership_status`, `auto_renew`) VALUES
(1, 1, 2, '2025-02-01', '2025-03-01', 'Active', 1),
(2, 2, 4, '2025-02-01', '2025-03-01', 'Active', 1),
(3, 3, 3, '2025-02-05', '2025-03-05', 'Active', 0),
(4, 4, 1, '2025-01-01', '2025-02-01', 'Expired', 0),
(5, 5, 6, '2025-02-10', '2026-02-10', 'Active', 1),
(6, 6, 5, '2025-02-12', '2025-03-12', 'Cancelled', 0),
(7, 7, 7, '2025-02-15', '2026-02-15', 'Active', 1),
(8, 8, 8, '2025-02-18', '2025-03-18', 'Pending', 0),
(9, 9, 9, '2025-02-20', '2025-03-20', 'Active', 1),
(10, 10, 10, '2025-02-25', '2025-03-25', 'Active', 0);

-- --------------------------------------------------------

--
-- Table structure for table `membership_plans`
--

CREATE TABLE `membership_plans` (
  `plan_id` int NOT NULL,
  `plan_name` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `duration_months` int NOT NULL,
  `benefits` text COLLATE utf8mb4_general_ci
) ;

--
-- Dumping data for table `membership_plans`
--

INSERT INTO `membership_plans` (`plan_id`, `plan_name`, `price`, `duration_months`, `benefits`) VALUES
(1, 'Basic Monthly', 29.99, 1, 'Gym access during staffed hours'),
(2, 'Standard Monthly', 39.99, 1, 'Gym and class access'),
(3, 'Premium Monthly', 54.99, 1, 'Gym, classes, and locker access'),
(4, 'Student Monthly', 24.99, 1, 'Discounted membership for students'),
(5, 'Senior Monthly', 19.99, 1, 'Discounted membership for seniors'),
(6, 'Basic Annual', 299.99, 12, 'Annual gym access during staffed hours'),
(7, 'Premium Annual', 549.99, 12, 'Annual premium membership'),
(8, 'Family Monthly', 79.99, 1, 'Monthly plan for family members'),
(9, 'Class Pack', 49.99, 1, 'Unlimited group fitness classes'),
(10, 'Training Plus', 89.99, 1, 'Membership plus training discount');

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

-- --------------------------------------------------------

--
-- Table structure for table `personal_training_sessions`
--

CREATE TABLE `personal_training_sessions` (
  `session_id` int NOT NULL,
  `member_id` int NOT NULL,
  `trainer_id` int NOT NULL,
  `session_date` date NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `session_status` enum('Scheduled','Completed','Cancelled','No Show') COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'Scheduled'
) ;

--
-- Dumping data for table `personal_training_sessions`
--

INSERT INTO `personal_training_sessions` (`session_id`, `member_id`, `trainer_id`, `session_date`, `start_time`, `end_time`, `session_status`) VALUES
(1, 1, 1, '2025-03-05', '08:00:00', '09:00:00', 'Completed'),
(2, 2, 2, '2025-03-05', '09:00:00', '10:00:00', 'Completed'),
(3, 3, 3, '2025-03-06', '10:00:00', '11:00:00', 'Scheduled'),
(4, 4, 4, '2025-03-06', '11:00:00', '12:00:00', 'Cancelled'),
(5, 5, 5, '2025-03-07', '08:30:00', '09:30:00', 'Completed'),
(6, 6, 6, '2025-03-07', '10:30:00', '11:30:00', 'No Show'),
(7, 7, 7, '2025-03-08', '07:00:00', '08:00:00', 'Completed'),
(8, 8, 8, '2025-03-08', '09:00:00', '10:00:00', 'Scheduled'),
(9, 9, 9, '2025-03-09', '12:00:00', '13:00:00', 'Completed'),
(10, 10, 10, '2025-03-09', '17:00:00', '18:00:00', 'Completed');

-- --------------------------------------------------------

--
-- Table structure for table `progress_tracking`
--

CREATE TABLE `progress_tracking` (
  `member_id` int NOT NULL,
  `record_date` date NOT NULL,
  `trainer_id` int DEFAULT NULL,
  `weight` decimal(5,2) DEFAULT NULL,
  `body_fat_percentage` decimal(5,2) DEFAULT NULL,
  `bmi` decimal(5,2) DEFAULT NULL,
  `notes` text COLLATE utf8mb4_general_ci
) ;

--
-- Dumping data for table `progress_tracking`
--

INSERT INTO `progress_tracking` (`member_id`, `record_date`, `trainer_id`, `weight`, `body_fat_percentage`, `bmi`, `notes`) VALUES
(1, '2025-03-01', 1, 145.00, 22.50, 24.10, 'Strength improving'),
(2, '2025-03-01', 2, 182.00, 19.00, 25.40, 'Lost 2 pounds'),
(3, '2025-03-02', 3, 136.00, 21.00, 23.20, 'Cardio endurance better'),
(4, '2025-03-02', 4, 190.00, 24.50, 27.10, 'Needs consistency'),
(5, '2025-03-03', 5, 128.00, 20.00, 22.00, 'Flexibility improved'),
(6, '2025-03-03', 6, 210.00, 28.00, 29.30, 'Suspended membership'),
(7, '2025-03-04', 7, 140.00, 23.00, 24.00, 'Core strength improving'),
(8, '2025-03-04', 8, 175.00, 18.50, 24.80, 'Speed work added'),
(9, '2025-03-05', 9, 122.00, 19.80, 21.50, 'Mobility is better'),
(10, '2025-03-05', 10, 205.00, 17.20, 26.70, 'Muscle mass increasing');

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `staff_id` int NOT NULL,
  `first_name` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `last_name` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `role` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `hire_date` date NOT NULL,
  `work_schedule` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`staff_id`, `first_name`, `last_name`, `role`, `phone`, `email`, `hire_date`, `work_schedule`) VALUES
(1, 'Aiden', 'Moore', 'Front Desk', '9895553001', 'aiden.moore@peakfit.com', '2024-01-05', 'Mon-Fri 8AM-4PM'),
(2, 'Ella', 'Ward', 'Admin', '9895553002', 'ella.ward@peakfit.com', '2024-01-12', 'Mon-Fri 9AM-5PM'),
(3, 'Lucas', 'Brooks', 'Maintenance', '9895553003', 'lucas.brooks@peakfit.com', '2024-01-20', 'Tue-Sat 7AM-3PM'),
(4, 'Harper', 'Gray', 'Front Desk', '9895553004', 'harper.gray@peakfit.com', '2024-02-01', 'Wed-Sun 10AM-6PM'),
(5, 'Jack', 'Bell', 'Admin', '9895553005', 'jack.bell@peakfit.com', '2024-02-10', 'Mon-Fri 8AM-4PM'),
(6, 'Amelia', 'Price', 'Maintenance', '9895553006', 'amelia.price@peakfit.com', '2024-02-18', 'Tue-Sat 6AM-2PM'),
(7, 'Wyatt', 'Kelly', 'Front Desk', '9895553007', 'wyatt.kelly@peakfit.com', '2024-03-01', 'Mon-Fri 12PM-8PM'),
(8, 'Evelyn', 'Reed', 'Admin', '9895553008', 'evelyn.reed@peakfit.com', '2024-03-09', 'Mon-Fri 9AM-5PM'),
(9, 'Levi', 'Cook', 'Maintenance', '9895553009', 'levi.cook@peakfit.com', '2024-03-15', 'Wed-Sun 7AM-3PM'),
(10, 'Abigail', 'Morgan', 'Front Desk', '9895553010', 'abigail.morgan@peakfit.com', '2024-03-22', 'Sat-Sun 8AM-4PM');

-- --------------------------------------------------------

--
-- Table structure for table `trainers`
--

CREATE TABLE `trainers` (
  `trainer_id` int NOT NULL,
  `first_name` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `last_name` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `certification` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `specialization` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `hire_date` date NOT NULL,
  `status` enum('Active','Inactive') COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'Active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `trainers`
--

INSERT INTO `trainers` (`trainer_id`, `first_name`, `last_name`, `phone`, `email`, `certification`, `specialization`, `hire_date`, `status`) VALUES
(1, 'Mia', 'Carter', '9895552001', 'mia.carter@peakfit.com', 'NASM', 'Strength Training', '2023-01-10', 'Active'),
(2, 'James', 'Turner', '9895552002', 'james.turner@peakfit.com', 'ACE', 'Weight Loss', '2023-02-14', 'Active'),
(3, 'Chloe', 'Perez', '9895552003', 'chloe.perez@peakfit.com', 'ISSA', 'HIIT', '2023-03-18', 'Active'),
(4, 'Benjamin', 'Scott', '9895552004', 'benjamin.scott@peakfit.com', 'NSCA', 'Powerlifting', '2023-04-01', 'Active'),
(5, 'Lily', 'Evans', '9895552005', 'lily.evans@peakfit.com', 'ACE', 'Yoga', '2023-05-12', 'Active'),
(6, 'Daniel', 'Baker', '9895552006', 'daniel.baker@peakfit.com', 'NASM', 'Cardio Conditioning', '2023-06-20', 'Inactive'),
(7, 'Grace', 'Rivera', '9895552007', 'grace.rivera@peakfit.com', 'ISSA', 'Pilates', '2023-07-08', 'Active'),
(8, 'Jacob', 'Mitchell', '9895552008', 'jacob.mitchell@peakfit.com', 'NSCA', 'Athletic Performance', '2023-08-16', 'Active'),
(9, 'Zoe', 'Campbell', '9895552009', 'zoe.campbell@peakfit.com', 'ACE', 'Mobility', '2023-09-03', 'Active'),
(10, 'Henry', 'Roberts', '9895552010', 'henry.roberts@peakfit.com', 'NASM', 'Bodybuilding', '2023-10-11', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `trainer_assignments`
--

CREATE TABLE `trainer_assignments` (
  `member_id` int NOT NULL,
  `trainer_id` int NOT NULL,
  `assignment_start` date NOT NULL,
  `assignment_end` date DEFAULT NULL
) ;

--
-- Dumping data for table `trainer_assignments`
--

INSERT INTO `trainer_assignments` (`member_id`, `trainer_id`, `assignment_start`, `assignment_end`) VALUES
(1, 1, '2025-02-01', NULL),
(2, 2, '2025-02-02', NULL),
(3, 3, '2025-02-05', NULL),
(4, 4, '2025-02-07', '2025-03-07'),
(5, 5, '2025-02-10', NULL),
(6, 6, '2025-02-12', '2025-02-28'),
(7, 7, '2025-02-15', NULL),
(8, 8, '2025-02-18', NULL),
(9, 9, '2025-02-20', NULL),
(10, 10, '2025-02-25', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_accounts`
--

CREATE TABLE `user_accounts` (
  `account_id` int NOT NULL,
  `username` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `password_hash` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `user_role` enum('Admin','Trainer','Staff','Member') COLLATE utf8mb4_general_ci NOT NULL,
  `member_id` int DEFAULT NULL,
  `staff_id` int DEFAULT NULL,
  `trainer_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_accounts`
--

INSERT INTO `user_accounts` (`account_id`, `username`, `password_hash`, `user_role`, `member_id`, `staff_id`, `trainer_id`) VALUES
(1, 'tbannan', 'hash_member_1', 'Member', 1, NULL, NULL),
(2, 'ltraxler', 'hash_member_2', 'Member', 2, NULL, NULL),
(3, 'eclark', 'hash_member_3', 'Member', 3, NULL, NULL),
(4, 'ndavis', 'hash_member_4', 'Member', 4, NULL, NULL),
(5, 'amoore', 'hash_staff_1', 'Staff', NULL, 1, NULL),
(6, 'eward', 'hash_staff_2', 'Admin', NULL, 2, NULL),
(7, 'lbrooks', 'hash_staff_3', 'Staff', NULL, 3, NULL),
(8, 'mcarter', 'hash_trainer_1', 'Trainer', NULL, NULL, 1),
(9, 'jturner', 'hash_trainer_2', 'Trainer', NULL, NULL, 2),
(10, 'cperez', 'hash_trainer_3', 'Trainer', NULL, NULL, 3);

-- --------------------------------------------------------

--
-- Table structure for table `workout_plans`
--

CREATE TABLE `workout_plans` (
  `workout_plan_id` int NOT NULL,
  `member_id` int NOT NULL,
  `trainer_id` int NOT NULL,
  `goal` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `created_date` date NOT NULL,
  `notes` text COLLATE utf8mb4_general_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `workout_plans`
--

INSERT INTO `workout_plans` (`workout_plan_id`, `member_id`, `trainer_id`, `goal`, `created_date`, `notes`) VALUES
(1, 1, 1, 'Improve overall strength', '2025-02-01', 'Focus on compound lifts'),
(2, 2, 2, 'Lose 10 pounds', '2025-02-02', 'Add steady-state cardio'),
(3, 3, 3, 'Build endurance', '2025-02-05', 'Increase HIIT frequency'),
(4, 4, 4, 'Learn lifting technique', '2025-02-07', 'Start with lighter weights'),
(5, 5, 5, 'Improve flexibility', '2025-02-10', 'Yoga-based stretching plan'),
(6, 6, 6, 'Cardio conditioning', '2025-02-12', 'Treadmill and bike rotation'),
(7, 7, 7, 'Core strength', '2025-02-15', 'Pilates and bodyweight work'),
(8, 8, 8, 'Athletic performance', '2025-02-18', 'Explosive training focus'),
(9, 9, 9, 'Mobility improvement', '2025-02-20', 'Daily movement prep'),
(10, 10, 10, 'Muscle growth', '2025-02-25', 'Hypertrophy split');

-- --------------------------------------------------------

--
-- Table structure for table `workout_plan_exercises`
--

CREATE TABLE `workout_plan_exercises` (
  `workout_plan_id` int NOT NULL,
  `exercise_id` int NOT NULL,
  `sets` int DEFAULT NULL,
  `reps` int DEFAULT NULL,
  `weight` decimal(6,2) DEFAULT NULL,
  `duration_minutes` int DEFAULT NULL
) ;

--
-- Dumping data for table `workout_plan_exercises`
--

INSERT INTO `workout_plan_exercises` (`workout_plan_id`, `exercise_id`, `sets`, `reps`, `weight`, `duration_minutes`) VALUES
(1, 1, 4, 8, 95.00, NULL),
(2, 5, NULL, NULL, NULL, 30),
(3, 10, NULL, NULL, NULL, 20),
(4, 2, 3, 10, 65.00, NULL),
(5, 9, NULL, NULL, NULL, 25),
(6, 5, NULL, NULL, NULL, 35),
(7, 4, 3, 60, NULL, NULL),
(8, 3, 4, 6, 135.00, NULL),
(9, 9, NULL, NULL, NULL, 20),
(10, 7, 4, 10, 30.00, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `class_attendance`
--
ALTER TABLE `class_attendance`
  ADD PRIMARY KEY (`schedule_id`,`member_id`),
  ADD KEY `fk_class_attendance_member` (`member_id`);

--
-- Indexes for table `class_schedules`
--
ALTER TABLE `class_schedules`
  ADD PRIMARY KEY (`schedule_id`),
  ADD UNIQUE KEY `class_id` (`class_id`,`trainer_id`,`class_date`,`start_time`),
  ADD KEY `fk_class_schedules_trainer` (`trainer_id`);

--
-- Indexes for table `equipment`
--
ALTER TABLE `equipment`
  ADD PRIMARY KEY (`equipment_id`);

--
-- Indexes for table `exercises`
--
ALTER TABLE `exercises`
  ADD PRIMARY KEY (`exercise_id`);

--
-- Indexes for table `fitness_classes`
--
ALTER TABLE `fitness_classes`
  ADD PRIMARY KEY (`class_id`);

--
-- Indexes for table `maintenance_records`
--
ALTER TABLE `maintenance_records`
  ADD PRIMARY KEY (`equipment_id`,`maintenance_date`);

--
-- Indexes for table `members`
--
ALTER TABLE `members`
  ADD PRIMARY KEY (`member_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `memberships`
--
ALTER TABLE `memberships`
  ADD PRIMARY KEY (`membership_id`),
  ADD UNIQUE KEY `member_id` (`member_id`,`plan_id`,`start_date`),
  ADD KEY `fk_memberships_plan` (`plan_id`);

--
-- Indexes for table `membership_plans`
--
ALTER TABLE `membership_plans`
  ADD PRIMARY KEY (`plan_id`),
  ADD UNIQUE KEY `plan_name` (`plan_name`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`payment_id`),
  ADD KEY `fk_payments_member` (`member_id`),
  ADD KEY `fk_payments_membership` (`membership_id`),
  ADD KEY `fk_payments_session` (`session_id`);

--
-- Indexes for table `personal_training_sessions`
--
ALTER TABLE `personal_training_sessions`
  ADD PRIMARY KEY (`session_id`),
  ADD UNIQUE KEY `member_id` (`member_id`,`trainer_id`,`session_date`,`start_time`),
  ADD KEY `fk_personal_training_sessions_trainer` (`trainer_id`);

--
-- Indexes for table `progress_tracking`
--
ALTER TABLE `progress_tracking`
  ADD PRIMARY KEY (`member_id`,`record_date`),
  ADD KEY `fk_progress_tracking_trainer` (`trainer_id`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`staff_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `trainers`
--
ALTER TABLE `trainers`
  ADD PRIMARY KEY (`trainer_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `trainer_assignments`
--
ALTER TABLE `trainer_assignments`
  ADD PRIMARY KEY (`member_id`,`trainer_id`,`assignment_start`),
  ADD KEY `fk_trainer_assignments_trainer` (`trainer_id`);

--
-- Indexes for table `user_accounts`
--
ALTER TABLE `user_accounts`
  ADD PRIMARY KEY (`account_id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `member_id` (`member_id`),
  ADD UNIQUE KEY `staff_id` (`staff_id`),
  ADD UNIQUE KEY `trainer_id` (`trainer_id`);

--
-- Indexes for table `workout_plans`
--
ALTER TABLE `workout_plans`
  ADD PRIMARY KEY (`workout_plan_id`),
  ADD KEY `fk_workout_plans_member` (`member_id`),
  ADD KEY `fk_workout_plans_trainer` (`trainer_id`);

--
-- Indexes for table `workout_plan_exercises`
--
ALTER TABLE `workout_plan_exercises`
  ADD PRIMARY KEY (`workout_plan_id`,`exercise_id`),
  ADD KEY `fk_workout_plan_exercises_exercise` (`exercise_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `class_schedules`
--
ALTER TABLE `class_schedules`
  MODIFY `schedule_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `equipment`
--
ALTER TABLE `equipment`
  MODIFY `equipment_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `exercises`
--
ALTER TABLE `exercises`
  MODIFY `exercise_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `fitness_classes`
--
ALTER TABLE `fitness_classes`
  MODIFY `class_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `members`
--
ALTER TABLE `members`
  MODIFY `member_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `memberships`
--
ALTER TABLE `memberships`
  MODIFY `membership_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `membership_plans`
--
ALTER TABLE `membership_plans`
  MODIFY `plan_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `payment_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `personal_training_sessions`
--
ALTER TABLE `personal_training_sessions`
  MODIFY `session_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `staff`
--
ALTER TABLE `staff`
  MODIFY `staff_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `trainers`
--
ALTER TABLE `trainers`
  MODIFY `trainer_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `user_accounts`
--
ALTER TABLE `user_accounts`
  MODIFY `account_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `workout_plans`
--
ALTER TABLE `workout_plans`
  MODIFY `workout_plan_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `class_attendance`
--
ALTER TABLE `class_attendance`
  ADD CONSTRAINT `fk_class_attendance_member` FOREIGN KEY (`member_id`) REFERENCES `members` (`member_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_class_attendance_schedule` FOREIGN KEY (`schedule_id`) REFERENCES `class_schedules` (`schedule_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `class_schedules`
--
ALTER TABLE `class_schedules`
  ADD CONSTRAINT `fk_class_schedules_class` FOREIGN KEY (`class_id`) REFERENCES `fitness_classes` (`class_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_class_schedules_trainer` FOREIGN KEY (`trainer_id`) REFERENCES `trainers` (`trainer_id`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Constraints for table `maintenance_records`
--
ALTER TABLE `maintenance_records`
  ADD CONSTRAINT `fk_maintenance_records_equipment` FOREIGN KEY (`equipment_id`) REFERENCES `equipment` (`equipment_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `memberships`
--
ALTER TABLE `memberships`
  ADD CONSTRAINT `fk_memberships_member` FOREIGN KEY (`member_id`) REFERENCES `members` (`member_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_memberships_plan` FOREIGN KEY (`plan_id`) REFERENCES `membership_plans` (`plan_id`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `fk_payments_member` FOREIGN KEY (`member_id`) REFERENCES `members` (`member_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_payments_membership` FOREIGN KEY (`membership_id`) REFERENCES `memberships` (`membership_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_payments_session` FOREIGN KEY (`session_id`) REFERENCES `personal_training_sessions` (`session_id`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Constraints for table `personal_training_sessions`
--
ALTER TABLE `personal_training_sessions`
  ADD CONSTRAINT `fk_personal_training_sessions_member` FOREIGN KEY (`member_id`) REFERENCES `members` (`member_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_personal_training_sessions_trainer` FOREIGN KEY (`trainer_id`) REFERENCES `trainers` (`trainer_id`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Constraints for table `progress_tracking`
--
ALTER TABLE `progress_tracking`
  ADD CONSTRAINT `fk_progress_tracking_member` FOREIGN KEY (`member_id`) REFERENCES `members` (`member_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_progress_tracking_trainer` FOREIGN KEY (`trainer_id`) REFERENCES `trainers` (`trainer_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `trainer_assignments`
--
ALTER TABLE `trainer_assignments`
  ADD CONSTRAINT `fk_trainer_assignments_member` FOREIGN KEY (`member_id`) REFERENCES `members` (`member_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_trainer_assignments_trainer` FOREIGN KEY (`trainer_id`) REFERENCES `trainers` (`trainer_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user_accounts`
--
ALTER TABLE `user_accounts`
  ADD CONSTRAINT `fk_user_accounts_member` FOREIGN KEY (`member_id`) REFERENCES `members` (`member_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_user_accounts_staff` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`staff_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_user_accounts_trainer` FOREIGN KEY (`trainer_id`) REFERENCES `trainers` (`trainer_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `workout_plans`
--
ALTER TABLE `workout_plans`
  ADD CONSTRAINT `fk_workout_plans_member` FOREIGN KEY (`member_id`) REFERENCES `members` (`member_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_workout_plans_trainer` FOREIGN KEY (`trainer_id`) REFERENCES `trainers` (`trainer_id`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Constraints for table `workout_plan_exercises`
--
ALTER TABLE `workout_plan_exercises`
  ADD CONSTRAINT `fk_workout_plan_exercises_exercise` FOREIGN KEY (`exercise_id`) REFERENCES `exercises` (`exercise_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_workout_plan_exercises_plan` FOREIGN KEY (`workout_plan_id`) REFERENCES `workout_plans` (`workout_plan_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
