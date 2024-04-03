-- phpMyAdmin SQL Dump
-- version 5.3.0-dev+20221220.e5e070c814
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 23, 2023 at 10:59 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.4

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
(1, 2, 'Honda', 'ABC33', 12, 'purple'),
(6, 2, 'nissan', 'abv12', 22, 'blue'),
(10, 10, 'hh', 'ABC33', 123, 'black'),
(15, 11, 'yamaha', 'ABC33', 9, 'brown');

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
(95, NULL, 11),
(96, 97, 11),
(97, 98, 10),
(98, NULL, 10),
(99, 110, 10);

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
(1, ' Good Management\r\n', 28, '2023-06-01 12:43:24'),
(2, ' thanks', 28, '2023-06-12 16:43:15'),
(3, ' A friendly Website', 29, '2023-06-19 15:29:57');

-- --------------------------------------------------------

--
-- Table structure for table `customer_reservation`
--

CREATE TABLE `customer_reservation` (
  `id` int(11) NOT NULL,
  `reservationId` int(11) NOT NULL,
  `customerName` varchar(255) NOT NULL,
  `customerEmail` varchar(255) NOT NULL,
  `customerPhoneNumber` varchar(255) NOT NULL,
  `customerEmergencyPhoneNumber` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customer_reservation`
--

INSERT INTO `customer_reservation` (`id`, `reservationId`, `customerName`, `customerEmail`, `customerPhoneNumber`, `customerEmergencyPhoneNumber`) VALUES
(11, 93, 'customer1', 'customer1@gmail.com', '019212', '123'),
(13, 99, 'customer1', 'customer1@gmail.com', '019212', '675'),
(14, 100, 'customer1', 'customer1@gmail.com', '019212', '123');

-- --------------------------------------------------------

--
-- Table structure for table `guest_reservation`
--

CREATE TABLE `guest_reservation` (
  `guestId` int(11) NOT NULL,
  `reservationId` int(11) NOT NULL,
  `guestName` varchar(255) NOT NULL,
  `guestEmail` varchar(255) NOT NULL,
  `guestPhoneNumber` varchar(255) NOT NULL,
  `guestEmergencyPhoneNumber` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `guest_reservation`
--

INSERT INTO `guest_reservation` (`guestId`, `reservationId`, `guestName`, `guestEmail`, `guestPhoneNumber`, `guestEmergencyPhoneNumber`) VALUES
(17, 92, 'ikmal hakim', 'ikmal@gmail.com', '0123456789', '123'),
(18, 95, 'GUEST', 'abubakar@gmail.com', '87778', '89987798'),
(19, 96, 'customer1', 'customer1@gmail.com', '019212', '019212'),
(20, 97, 'GUEST', 'req@gmail.com', '1234512345', '1111'),
(21, 98, 'GUEST', 'gueset@gmail.com', '111111', '3443'),
(22, 101, 'GUEST', 'mali@gmail.com', '9876', '6789'),
(23, 102, 'GUEST', 'zirahesmes@gmail.com', '1112', '352'),
(24, 103, 'GUEST', 'guess2@gmail.com', '1231231234', '65'),
(25, 104, 'hazirah', 'hazirah@gmail.com', '1020', '1020'),
(26, 105, 'GUEST', 'poqw@gmail.coom', '9087', '6544'),
(27, 106, 'GUEST', 'uy@gmail.com', '9086', '8888'),
(28, 107, 'hazirah', 'hazirah@gmail.com', '0123456789', '123231'),
(29, 108, 'hazirah', 'hazirah@gmail.com', '434', '444'),
(30, 109, 'GUEST', 'e@gmail.com', '1', '1'),
(31, 110, 'julia', 'julia@gmail.com', '0123717049', '0192200905');

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
(39, 'Thank you!', 1, '2023-06-01 12:43:43'),
(40, 'Thank you so much', 1, '2023-06-03 12:42:33'),
(41, ' ', 1, '2023-06-12 10:01:10'),
(42, ' ok', 1, '2023-06-12 10:01:15'),
(43, 'welcome', 2, '2023-06-19 11:53:00'),
(44, 'Thanks for using our website', 3, '2023-06-19 15:30:26');

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
(92, '0123456789', '03/05/2023', '1', '3', 'PENDING PAYMENT'),
(93, '019212', '03/05/2023', '1', '3', 'RESERVED'),
(97, '1234512345', '02/06/2023', '1', '2', 'RESERVED'),
(98, '111111', '04/06/2023', '1', '2', 'RESERVED'),
(101, '9876', '12/06/2023', '1', '2', 'RESERVED'),
(102, '1112', '14/06/2023', '1', '1', 'RESERVED'),
(103, '1231231234', '18/06/2023', '1', '2', 'RESERVED'),
(104, '1020', '24/08/2023', '1', '4', 'RESERVED'),
(105, '9087', '19/06/2023', '1', '4', 'RESERVED'),
(106, '9086', '19/06/2023', '1', '6', 'RESERVED'),
(107, '0123456789', '19/06/2023', '1', '2', 'RESERVED'),
(108, '434', '19/06/2023', '2', '3', 'PENDING PAYMENT'),
(109, '1', '19/06/2023', '3', '4', 'RESERVED'),
(110, '0123717049', '23/07/2023', '1', '6', 'RESERVED');

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
(1, 'abubakar@gmail.com', '123', 'Abu Bakar', '01231231', 'No 1 Kuala Lumpur', 'license', 'Staff', 'ACTIVE'),
(10, 'ownerboat1@gmail.com', '123', 'ownerboat1', '0123456789', 'UMT', 'sfs', 'Owner Boat', 'ACTIVE'),
(11, 'ownerboat2@gmail.com', '123', 'ownerboat2', '123231', 'owner 1 jalan indah', '1', 'Owner Boat', 'ACTIVE'),
(12, 'ownerboat2@gmail.com', '123', 'ownerboat1', '123231', 'owner 1 jalan indah', 'dffs', 'Owner Boat', 'ACTIVE');

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
(28, 'customer1@gmail.com', '123', 'customer1', '019212', 'Customer'),
(29, 'customer2@gmail.com', '123', 'customer2', '0192122', 'Customer');

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
-- Indexes for table `customer_reservation`
--
ALTER TABLE `customer_reservation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `guest_reservation`
--
ALTER TABLE `guest_reservation`
  ADD PRIMARY KEY (`guestId`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `boats`
--
ALTER TABLE `boats`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100;

--
-- AUTO_INCREMENT for table `customer_reservation`
--
ALTER TABLE `customer_reservation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `guest_reservation`
--
ALTER TABLE `guest_reservation`
  MODIFY `guestId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `replies`
--
ALTER TABLE `replies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `reservations`
--
ALTER TABLE `reservations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=111;

--
-- AUTO_INCREMENT for table `staffs`
--
ALTER TABLE `staffs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `staffs_backup`
--
ALTER TABLE `staffs_backup`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `boats`
--
ALTER TABLE `boats`
  ADD CONSTRAINT `reservationID` FOREIGN KEY (`reservationID`) REFERENCES `reservations` (`id`) ON DELETE SET NULL ON UPDATE SET NULL;

--
-- Constraints for table `replies`
--
ALTER TABLE `replies`
  ADD CONSTRAINT `comment` FOREIGN KEY (`comment_id`) REFERENCES `comments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
