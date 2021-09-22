-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 20, 2021 at 11:46 PM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 8.0.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `test1`
--

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `country_fk_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`id`, `name`, `country_fk_id`) VALUES
(1, 'Karachi', 1),
(2, 'Hyderabad', 1),
(3, 'Lahore', 1),
(4, 'IslamAbad', 1),
(5, 'Mumbai', 2),
(6, 'New Delhi', 2),
(7, 'Kolkata', 2),
(8, 'Lucknow', 2),
(9, 'Dhaka', 3),
(10, 'Khulna', 3),
(11, 'Gazipur', 3),
(12, 'Tongi', 3);

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `name`) VALUES
(1, 'Pakistan'),
(2, 'India'),
(3, 'Bangladesh');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `age` int(11) NOT NULL,
  `city` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`id`, `name`, `age`, `city`) VALUES
(1, 'ali', 17, 'Karachi'),
(2, 'faiq', 15, 'Lahore'),
(3, 'sameer', 20, 'Islamabad'),
(4, 'Faraz', 15, 'Lahore'),
(5, 'Danish', 23, 'Bahawalpur'),
(6, 'Qamar', 26, 'Karachi'),
(7, 'Mansoor', 30, 'Islamabad'),
(8, 'Javaid', 34, 'Lahore'),
(9, 'Zameer', 25, 'Bahawalpur'),
(14, 'Muneeb', 26, 'Lahore'),
(15, 'huraira', 24, 'Lahore'),
(16, 'naveen', 34, 'bahawalpur');

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `class` int(11) NOT NULL,
  `age` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`id`, `name`, `class`, `age`) VALUES
(64, 'junaid', 20, 28),
(66, 'huzaifa', 30, 50);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_emp`
--

CREATE TABLE `tbl_emp` (
  `id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `designation` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_emp`
--

INSERT INTO `tbl_emp` (`id`, `name`, `designation`) VALUES
(17, 'saif', 'manager'),
(18, 'danish', 'vloger'),
(19, 'muhammad', 'manager'),
(20, 'Ali Ahmed', 'CEO'),
(21, 'Fahad ', 'operator'),
(22, 'jameel', 'content writer'),
(23, 'imran', 'driver');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `age` int(11) NOT NULL,
  `email` varchar(30) NOT NULL,
  `country` varchar(20) NOT NULL,
  `gender` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `name`, `age`, `email`, `country`, `gender`) VALUES
(13, 'qamar', 29, 'siraj@mail.com', 'India', 'Male'),
(23, 'huzaifa', 29, 'hanif@mail.com', 'Pakistan', 'Male'),
(25, 'imran', 29, 'imran@mail.com', 'Pakistan', 'Male'),
(28, 'musharaf', 25, 'ashraf@mail.com', 'Pakistan', 'Male'),
(29, 'yasir', 20, 'yasir@mail.com', 'Pakistan', 'Male'),
(30, 'shehryar', 28, 'shehryar@mail.com', 'Pakistan', 'Male'),
(34, 'aliyarm', 30, 'aliyar@mail.com', 'Pakistan', 'Male'),
(36, 'hafiz', 20, 'hafiz@mail.com', 'Pakistan', 'Male'),
(46, 'faiqali', 20, 'faiqali23@gmail.com', 'Pakistan', 'Male'),
(47, 'faiqyaseen', 24, 'ali@mail.com', 'Pakistan', 'Male'),
(48, 'sufiyan', 40, 'talha@mai;.com', 'India', 'Male'),
(49, 'faras', 45, 'faras@mail.com', 'Sirilanka', 'Male'),
(50, 'talha', 23, 'faras@mail.com', 'Bangladesh', 'Female'),
(51, 'Faseeh', 23, 'faseeh@mail.com', 'Bangladesh', 'female'),
(52, 'kamal', 23, 'kamal@mail.com', 'Pakistan', 'female'),
(53, 'huraira', 23, 'huraira@mail.com', 'Pakistan', 'male'),
(54, 'jawad', 23, 'jawad@mail.com', 'Bangladesh', 'male'),
(55, 'faiqyaseen', 12, 'faiqali23@gmail.com', 'Pakistan', 'Male'),
(56, 'ali', 23, 'faiqali23@mail.com', 'Pakistan', 'male');

-- --------------------------------------------------------

--
-- Table structure for table `user_tbl`
--

CREATE TABLE `user_tbl` (
  `id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `language` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_tbl`
--

INSERT INTO `user_tbl` (`id`, `name`, `language`) VALUES
(1, 'ali', 'PHP,C#,Ruby'),
(2, 'faiq', 'PHP,C#,Java,Javascript'),
(3, 'hamza', 'PHP,Python,C++,C#,Ruby,Java,Javascript,Swift');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `country_fk_id` (`country_fk_id`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_emp`
--
ALTER TABLE `tbl_emp`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_tbl`
--
ALTER TABLE `user_tbl`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `student`
--
ALTER TABLE `student`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT for table `tbl_emp`
--
ALTER TABLE `tbl_emp`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `user_tbl`
--
ALTER TABLE `user_tbl`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cities`
--
ALTER TABLE `cities`
  ADD CONSTRAINT `cities_ibfk_1` FOREIGN KEY (`country_fk_id`) REFERENCES `countries` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
