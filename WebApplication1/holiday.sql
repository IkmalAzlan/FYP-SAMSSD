-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 17, 2023 at 01:53 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `holiday`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `ID` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`ID`, `email`, `password`, `name`, `phone`, `role`) VALUES
(1, 'ikmal@admin.com', 'admin', 'Ikmal', '0147852369', 'ADMIN');

-- --------------------------------------------------------

--
-- Table structure for table `boatinfo`
--

CREATE TABLE `boatinfo` (
  `id` int(11) NOT NULL,
  `boatOwner` int(11) NOT NULL,
  `brand` varchar(255) NOT NULL,
  `plate` varchar(255) NOT NULL,
  `capacity` int(11) NOT NULL,
  `color` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `boatinfo`
--

INSERT INTO `boatinfo` (`id`, `boatOwner`, `brand`, `plate`, `capacity`, `color`) VALUES
(1, 2, 'Nissan', 'ABC333', 12, 'RED'),
(2, 2, 'Nissan', 'ABC444', 20, 'BLUE'),
(6, 4, 'Nissan', 'ABC323', 20, 'PURPLE'),
(7, 4, 'Nissan', 'ABC331', 20, 'PINK');

-- --------------------------------------------------------

--
-- Table structure for table `boats`
--

CREATE TABLE `boats` (
  `ID` int(11) NOT NULL,
  `reservationID` int(11) DEFAULT NULL,
  `boatID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `boats`
--

INSERT INTO `boats` (`ID`, `reservationID`, `boatID`) VALUES
(30, 1, 2),
(31, 1, 2),
(34, 5, 4);

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `comment` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  `datetime` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `comment`, `user_id`, `datetime`) VALUES
(1, 'Nice memory!', 16, '2023-05-02 06:04:59');

-- --------------------------------------------------------

--
-- Table structure for table `replies`
--

CREATE TABLE `replies` (
  `id` int(11) NOT NULL,
  `reply` varchar(255) NOT NULL,
  `comment_id` int(11) NOT NULL,
  `datetime` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `replies`
--

INSERT INTO `replies` (`id`, `reply`, `comment_id`, `datetime`) VALUES
(17, 'testing', 1, '2023-05-05 13:02:03'),
(19, '', 1, '2023-05-05 13:02:22'),
(22, 'thanks for the nice memory too!', 1, '2023-05-05 13:24:18'),
(23, 'Thanks', 1, '2023-05-06 00:33:53'),
(24, 'Thanks', 1, '2023-05-08 14:12:37'),
(25, 'Thanks!', 1, '2023-05-08 14:12:41');

-- --------------------------------------------------------

--
-- Table structure for table `reservations`
--

CREATE TABLE `reservations` (
  `id` int(11) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `date` varchar(255) NOT NULL,
  `session` varchar(255) NOT NULL,
  `passenger` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `reservations`
--

INSERT INTO `reservations` (`id`, `phone`, `date`, `session`, `passenger`, `status`) VALUES
(1, '012324223', '10/01/2023', '1', '1', 'RESERVED'),
(2, '0123221231', '02/10/2023', '1', '2', 'PENDING PAYMENT'),
(4, '012457866', '01/02/2023', '1', '3', 'PENDING PAYMENT'),
(5, '0123231331', '19/01/2023', '1', '6', 'RESERVED'),
(6, '012345687', '19/01/2023', '1', '1', 'PENDING PAYMENT'),
(7, '03121654541', '19/01/2023', '2', '4', 'RESERVED'),
(8, '0123123323', '19/01/2023', '3', '2', 'RESERVED'),
(9, '0123123123', '19/01/2023', '3', '6', 'PENDING PAYMENT'),
(10, '0123123323', '19/01/2023', '1', '1', 'RESERVED'),
(11, '0121545478', '02/10/2023', '3', '2', 'PENDING PAYMENT'),
(13, '0123231331', '06/07/2023', '1', '5', 'PENDING PAYMENT'),
(14, '123', '21/04/2023', '1', '4', 'RESERVED'),
(15, '123123', '21/04/2023', '1', '1', 'PENDING PAYMENT'),
(16, '123123123', '21/04/2023', '3', '2', 'RESERVED'),
(17, '312', '21/04/2023', '1', '2', 'RESERVED'),
(18, '111', '04/05/2023', '1', '6', 'RESERVED'),
(19, '122', '04/05/2023', '1', '6', 'PENDING PAYMENT'),
(20, '0123123323', '04/05/2023', '1', '6', 'CANCELLED'),
(21, '333', '04/05/2023', '2', '6', 'RESERVED'),
(22, '444', '04/05/2023', '2', '6', 'RESERVED'),
(23, '0123123323', '04/05/2023', '3', '6', 'CANCELLED'),
(24, '111', '04/05/2023', '1', '6', 'CANCELLED'),
(25, '111', '04/05/2023', '1', '4', 'CANCELLED'),
(26, '111', '04/05/2023', '1', '6', 'RESERVED'),
(27, '111', '04/05/2023', '3', '6', 'RESERVED'),
(28, '0123123323', '04/05/2023', '3', '5', 'RESERVED'),
(29, '0123123323', '05/05/2023', '1', '5', 'CANCELLED'),
(30, '0123123323', '05/05/2023', '1', '5', 'CANCELLED'),
(31, '0123123323', '05/05/2023', '1', '5', 'CANCELLED'),
(32, '0123123323', '05/05/2023', '1', '5', 'CANCELLED'),
(33, '0123123323', '05/05/2023', '1', '5', 'CANCELLED'),
(34, '0123123323', '05/05/2023', '1', '5', 'RESERVED'),
(35, '0123123323', '05/05/2023', '3', '3', 'RESERVED'),
(36, '0123123323', '05/05/2023', '2', '3', 'CANCELLED'),
(37, '0123123323', '05/05/2023', '2', '4', 'CANCELLED'),
(38, '0123123323', '05/05/2023', '2', '4', 'CANCELLED'),
(39, '0123123323', '05/05/2023', '2', '4', 'RESERVED'),
(40, '0123123323', '05/05/2023', '2', '3', 'CANCELLED'),
(41, '0123123323', '05/05/2023', '1', '2', 'CANCELLED'),
(42, '0123123323', '05/05/2023', '1', '5', 'RESERVED'),
(43, '0123123323', '05/05/2023', '1', '5', 'CANCELLED'),
(44, '0123123323', '05/05/2023', '1', '5', 'CANCELLED'),
(45, '1111', '05/05/2023', '2', '4', 'CANCELLED'),
(46, '1234', '05/05/2023', '2', '3', 'RESERVED');

-- --------------------------------------------------------

--
-- Table structure for table `staffs`
--

CREATE TABLE `staffs` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `licence` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `staffs`
--

INSERT INTO `staffs` (`id`, `email`, `password`, `name`, `phone`, `address`, `licence`, `role`, `status`) VALUES
(1, 'abubakar@gmail.com', '123', 'Abu Bakar', '0123123123', 'No 11, Jalan Stonor, Kuala Lumpur', 'license', 'Staff', 'ACTIVE'),
(2, 'abubakarali@gmail.com', '123', 'Abu Bakar Ali', '01231231231', 'No 22, Jalan Stonor, Kuala Lumpur', 'AC22333', 'Owner Boat', 'ACTIVE'),
(3, 'abb@staff.com', '123', 'Ab. Bakar', '01231231232', 'No 33, Jalan Stonor, Kuala Lumpur', 'license', 'Staff', 'ACTIVE'),
(4, 'benali@gmail.com', '123', 'Ben Ali', '0123222133', 'No 1111, Jalan Stonor, Kuala Lumpur', 'AC32212', 'Owner Boat', 'ACTIVE'),
(5, 'benalii@staff.com', '123', 'Ben Alii', '011113323', 'No 11, Jalan Stonor, Kuala Lumpur', 'AC22222', 'Owner Boat', 'INACTIVE');

-- --------------------------------------------------------

--
-- Table structure for table `staffs_backup`
--

CREATE TABLE `staffs_backup` (
  `ID` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `staffs_backup`
--

INSERT INTO `staffs_backup` (`ID`, `email`, `password`, `name`, `phone`, `role`, `status`) VALUES
(1, 'abubakar@gmail.com', '123', 'Abu Bakar', '0121548772', 'Staff', 'ACTIVE'),
(2, 'abubakarali@gmail.com', '123', 'Abu Bakar Ali', '0121548172', 'Owner Boat', 'ACTIVE'),
(3, 'abb@staff.com', '123', 'Abu Bakar Ab', '0121454474', 'Staff', 'ACTIVE');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `name`, `phone`, `role`) VALUES
(10, 'fauzan@gmail.com', '123', 'fauzan', '0105661698', 'Customer'),
(15, 'abu@gmail.com', '123', 'Abu', '0123123323', 'Customer'),
(16, 'ab123u@gmail.com', '123', 'aliabu', '0121221231', 'Customer'),
(22, 'bladen@admin.com', '123', 'Ben Laden', '020321112', 'Customer'),
(28, 'A@gmail.com', '123', 'A', '01211323', 'Customer'),
(29, 'B@gmail.com', '123', 'B', '0122222323', 'Customer');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `boatinfo`
--
ALTER TABLE `boatinfo`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `boats`
--
ALTER TABLE `boats`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `reservationID` (`reservationID`),
  ADD KEY `boatID` (`boatID`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user` (`user_id`);

--
-- Indexes for table `replies`
--
ALTER TABLE `replies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comment` (`comment_id`);

--
-- Indexes for table `reservations`
--
ALTER TABLE `reservations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `staffs`
--
ALTER TABLE `staffs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `staffs_backup`
--
ALTER TABLE `staffs_backup`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `boatinfo`
--
ALTER TABLE `boatinfo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `boats`
--
ALTER TABLE `boats`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `replies`
--
ALTER TABLE `replies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `reservations`
--
ALTER TABLE `reservations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `staffs`
--
ALTER TABLE `staffs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `staffs_backup`
--
ALTER TABLE `staffs_backup`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `boats`
--
ALTER TABLE `boats`
  ADD CONSTRAINT `boatID` FOREIGN KEY (`boatID`) REFERENCES `staffs` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `reservationID` FOREIGN KEY (`reservationID`) REFERENCES `reservations` (`id`) ON DELETE SET NULL ON UPDATE SET NULL;

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `replies`
--
ALTER TABLE `replies`
  ADD CONSTRAINT `comment` FOREIGN KEY (`comment_id`) REFERENCES `comments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
