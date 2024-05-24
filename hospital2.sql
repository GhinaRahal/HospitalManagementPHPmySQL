-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 29, 2021 at 06:38 PM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.0.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hospital2`
--

-- --------------------------------------------------------

--
-- Table structure for table `bill`
--

CREATE TABLE `bill` (
  `Bill_number` int(11) NOT NULL,
  `Amount` int(11) DEFAULT NULL,
  `patient_Id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bill`
--

INSERT INTO `bill` (`Bill_number`, `Amount`, `patient_Id`) VALUES
(1001, 100, 1),
(1002, 1000, 2),
(1003, 2000, 3),
(1004, 3000, 4),
(1005, 1500, 5);

-- --------------------------------------------------------

--
-- Table structure for table `doctor`
--

CREATE TABLE `doctor` (
  `ID` int(11) NOT NULL,
  `Name` varchar(30) DEFAULT NULL,
  `Department` varchar(20) DEFAULT NULL,
  `Dphone_number` varchar(20) DEFAULT NULL,
  `Gender` varchar(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `doctor`
--

INSERT INTO `doctor` (`ID`, `Name`, `Department`, `Dphone_number`, `Gender`) VALUES
(101, 'Youssef', 'Pediatrician', '+961 3123456', 'Male'),
(102, 'Hassan', 'Gynecologist', '+961 70123456', 'Male'),
(103, 'Sama', 'Neurologist', '+961 71123456', 'Female'),
(104, 'Fadi', 'Surgeon', '+961 81123456', 'Male');

-- --------------------------------------------------------

--
-- Table structure for table `patient`
--

CREATE TABLE `patient` (
  `ID` int(11) NOT NULL,
  `Name` varchar(10) DEFAULT NULL,
  `Pphone_number` varchar(20) DEFAULT NULL,
  `Gender` varchar(6) DEFAULT NULL,
  `Age` int(11) DEFAULT NULL,
  `Disease` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `patient`
--

INSERT INTO `patient` (`ID`, `Name`, `Pphone_number`, `Gender`, `Age`, `Disease`) VALUES
(1, 'Alaa', '+961 3123401', 'Female', 3, 'Measles'),
(2, 'Sara', '+961 3123457', 'Female', 27, 'Pregnancy'),
(3, 'Mark', '+961 3123458', 'Male', 35, 'Nerve Inflammation'),
(4, 'Ali', '+961 3123459', 'Male', 45, 'Clogged Arteries'),
(5, 'Patrick', '+961 3123450', 'Male', 20, 'Lung Thrombosis'),
(6, 'Rayan', '+961 3000000', 'Male', 3, 'Flu');

-- --------------------------------------------------------

--
-- Table structure for table `treat`
--

CREATE TABLE `treat` (
  `doctor_Id` int(11) NOT NULL,
  `patient_Id` int(11) NOT NULL,
  `treat_details` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `treat`
--

INSERT INTO `treat` (`doctor_Id`, `patient_Id`, `treat_details`) VALUES
(101, 1, 'Medicine'),
(101, 6, 'Medicine'),
(102, 2, 'Operation'),
(103, 3, 'Radiotherapy'),
(104, 4, 'Operation'),
(104, 5, 'Operation');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bill`
--
ALTER TABLE `bill`
  ADD PRIMARY KEY (`Bill_number`),
  ADD KEY `fk_Bill_Patient` (`patient_Id`);

--
-- Indexes for table `doctor`
--
ALTER TABLE `doctor`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `patient`
--
ALTER TABLE `patient`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `treat`
--
ALTER TABLE `treat`
  ADD PRIMARY KEY (`doctor_Id`,`patient_Id`),
  ADD KEY `fk_Treat_Patient` (`patient_Id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bill`
--
ALTER TABLE `bill`
  ADD CONSTRAINT `fk_Bill_Patient` FOREIGN KEY (`patient_Id`) REFERENCES `patient` (`ID`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `treat`
--
ALTER TABLE `treat`
  ADD CONSTRAINT `fk_Treat_Doctor` FOREIGN KEY (`doctor_Id`) REFERENCES `doctor` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_Treat_Patient` FOREIGN KEY (`patient_Id`) REFERENCES `patient` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
