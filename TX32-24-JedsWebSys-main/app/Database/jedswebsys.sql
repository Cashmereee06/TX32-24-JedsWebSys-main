-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 26, 2024 at 01:03 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `jedswebsys`
--

-- --------------------------------------------------------

--
-- Table structure for table `cv`
--

CREATE TABLE `cv` (
  `ID` int(11) NOT NULL,
  `Fields` text DEFAULT NULL,
  `Experience` text DEFAULT NULL,
  `HomeAddress` varchar(150) DEFAULT NULL,
  `Credentials` text DEFAULT NULL,
  `Portfolio` text DEFAULT NULL,
  `Location` varchar(100) DEFAULT NULL,
  `Income` decimal(10,2) DEFAULT NULL,
  `Public_Private` enum('Public','Private') NOT NULL,
  `Template` varchar(100) DEFAULT NULL,
  `FK_ID_Member` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `ID` int(11) NOT NULL,
  `WorkContacts` varchar(100) DEFAULT NULL,
  `FK_ID_Users` int(11) NOT NULL,
  `FK_ID_CV` int(11) NOT NULL,
  `FK_ID_View` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `employer`
--

CREATE TABLE `employer` (
  `ID` int(11) NOT NULL,
  `CompanyName` varchar(100) NOT NULL,
  `CompanyAddress` varchar(150) DEFAULT NULL,
  `CompanyDescription` text DEFAULT NULL,
  `FK_ID_Users` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pageview`
--

CREATE TABLE `pageview` (
  `ID` int(11) NOT NULL,
  `ViewCount` int(11) NOT NULL,
  `ViewerName` varchar(100) DEFAULT NULL,
  `ViewerID` int(11) DEFAULT NULL,
  `Time` datetime NOT NULL,
  `FK_ID_Viewer` int(11) NOT NULL,
  `FK_ID_CV` int(11) NOT NULL,
  `FK_ID_Employee` int(11) NOT NULL,
  `FK_ID_Employer` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `ID` int(11) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Password` varchar(100) NOT NULL,
  `EmailAddress` varchar(100) NOT NULL,
  `PhoneNum` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cv`
--
ALTER TABLE `cv`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_ID_Member` (`FK_ID_Member`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_ID_Users` (`FK_ID_Users`);

--
-- Indexes for table `employer`
--
ALTER TABLE `employer`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_ID_Users` (`FK_ID_Users`);

--
-- Indexes for table `pageview`
--
ALTER TABLE `pageview`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_ID_Viewer` (`FK_ID_Viewer`),
  ADD KEY `FK_ID_CV` (`FK_ID_CV`),
  ADD KEY `FK_ID_Employee` (`FK_ID_Employee`),
  ADD KEY `FK_ID_Employer` (`FK_ID_Employer`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `EmailAddress` (`EmailAddress`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cv`
--
ALTER TABLE `cv`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `employer`
--
ALTER TABLE `employer`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pageview`
--
ALTER TABLE `pageview`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cv`
--
ALTER TABLE `cv`
  ADD CONSTRAINT `cv_ibfk_1` FOREIGN KEY (`FK_ID_Member`) REFERENCES `users` (`ID`);

--
-- Constraints for table `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`FK_ID_Users`) REFERENCES `users` (`ID`) ON DELETE CASCADE;

--
-- Constraints for table `employer`
--
ALTER TABLE `employer`
  ADD CONSTRAINT `employer_ibfk_1` FOREIGN KEY (`FK_ID_Users`) REFERENCES `users` (`ID`);

--
-- Constraints for table `pageview`
--
ALTER TABLE `pageview`
  ADD CONSTRAINT `pageview_ibfk_1` FOREIGN KEY (`FK_ID_Viewer`) REFERENCES `users` (`ID`),
  ADD CONSTRAINT `pageview_ibfk_2` FOREIGN KEY (`FK_ID_CV`) REFERENCES `cv` (`ID`),
  ADD CONSTRAINT `pageview_ibfk_3` FOREIGN KEY (`FK_ID_Employee`) REFERENCES `employee` (`ID`),
  ADD CONSTRAINT `pageview_ibfk_4` FOREIGN KEY (`FK_ID_Employer`) REFERENCES `employer` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
