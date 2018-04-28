-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 03, 2018 at 03:58 PM
-- Server version: 10.1.28-MariaDB
-- PHP Version: 5.6.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `comp3095`
--
CREATE DATABASE IF NOT EXISTS `comp3095` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `comp3095`;

-- --------------------------------------------------------

--
-- Table structure for table `attendance`
--

DROP TABLE IF EXISTS `attendance`;
CREATE TABLE `attendance` (
  `AttendanceId` int(11) NOT NULL,
  `AttendanceDate` date NOT NULL,
  `AttendanceStatus` int(11) NOT NULL DEFAULT '0',
  `EmployeeNumber` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `attendance`
--

INSERT INTO `attendance` (`AttendanceId`, `AttendanceDate`, `AttendanceStatus`, `EmployeeNumber`) VALUES
(1, '2017-01-31', 1, 100000002),
(2, '2017-01-31', 1, 100000001),
(3, '2017-01-31', 0, 100000006),
(4, '2017-01-31', 0, 100000005),
(5, '2017-01-31', 0, 100000004),
(6, '2017-01-31', 0, 100000003),
(7, '2018-01-01', 0, 100000002),
(8, '2018-01-01', 0, 100000001),
(9, '2018-01-01', 0, 100000006),
(10, '2018-01-01', 1, 100000005),
(11, '2018-01-01', 1, 100000004),
(12, '2018-01-01', 1, 100000003),
(13, '2018-01-02', 1, 100000002),
(14, '2018-01-02', 0, 100000001),
(15, '2018-01-02', 1, 100000006),
(16, '2018-01-02', 1, 100000005),
(17, '2018-01-02', 1, 100000004),
(18, '2018-01-02', 0, 100000003),
(19, '2018-01-01', 1, 100000008),
(20, '2018-01-01', 1, 100000010),
(21, '2018-01-01', 1, 100000011),
(22, '2018-01-01', 0, 100000009),
(23, '2018-01-01', 1, 100000007),
(24, '2018-01-01', 0, 100000012),
(25, '2017-01-20', 1, 100000002),
(26, '2017-01-20', 1, 100000001),
(27, '2017-01-20', 1, 100000006),
(28, '2017-01-20', 1, 100000005),
(29, '2017-01-20', 1, 100000004),
(30, '2017-01-20', 1, 100000003);

-- --------------------------------------------------------

--
-- Table structure for table `criteria`
--

DROP TABLE IF EXISTS `criteria`;
CREATE TABLE `criteria` (
  `ID` int(11) NOT NULL,
  `SectionID` int(11) NOT NULL,
  `Description` varchar(300) NOT NULL,
  `Max_Value` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `criteria`
--

INSERT INTO `criteria` (`ID`, `SectionID`, `Description`, `Max_Value`) VALUES
(23, 7, 'c1', 5),
(24, 7, 'c2', 5),
(25, 7, 'c3', 5),
(26, 7, 'c4', 5),
(27, 7, 'c5', 5),
(28, 8, 'c6', 5),
(29, 8, 'c7', 5),
(30, 8, 'c8', 5),
(31, 9, 'c9', 5),
(32, 9, 'c10', 5),
(33, 9, 'c11', 5);

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

DROP TABLE IF EXISTS `departments`;
CREATE TABLE `departments` (
  `Id` int(11) NOT NULL,
  `DepartmentName` varchar(30) NOT NULL,
  `DepartmentLocation` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`Id`, `DepartmentName`, `DepartmentLocation`) VALUES
(1, 'Accounting', 'Floor 10'),
(2, 'IT', 'Floor 2'),
(3, 'Administration', 'Floor 20'),
(4, 'Management', '6th floor');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee` (
  `EmployeeNumber` int(11) NOT NULL,
  `DepartmentId` int(11) NOT NULL,
  `JobId` int(11) NOT NULL,
  `FirstName` varchar(30) NOT NULL,
  `LastName` varchar(30) NOT NULL,
  `Email` varchar(30) NOT NULL,
  `DateHired` date NOT NULL,
  `Username` varchar(20) DEFAULT NULL,
  `Password` varchar(20) DEFAULT NULL,
  `Role` varchar(10) NOT NULL,
  `GroupID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`EmployeeNumber`, `DepartmentId`, `JobId`, `FirstName`, `LastName`, `Email`, `DateHired`, `Username`, `Password`, `Role`, `GroupID`) VALUES
(100000000, 3, 8, 'Sergio', 'Santilli', 'Sergio.Santilli@georgebrown.ca', '2017-12-03', 'admin', 'admin', 'A', 0),
(100000001, 1, 1, 'Elizabeth', 'Keen', 'e.keen@infinnov.com', '2017-12-11', 'ekeen', 'ekeen', 'U', 1),
(100000002, 1, 4, 'Harold', 'Cooper', 'h.cooper@infinnov.com', '2017-11-01', 'hcooper', 'hcooper', 'U', 1),
(100000003, 1, 3, 'Ronald', 'Ressler', 'rressler@infinnov.com', '2017-11-07', 'rressler', 'rressler', 'U', 1),
(100000004, 1, 4, 'Meera', 'Malik', 'mmalik@infinnov.com', '2017-10-09', 'mmalik', 'mmalik', 'U', 1),
(100000005, 1, 1, 'Clark', 'Ken', 'cken@infinnov.com', '2017-11-13', 'cken', 'cken', 'U', 1),
(100000006, 1, 3, 'Tom', 'Keen', 'tkeen@infinnov.com', '2017-11-14', 'tkeen', 'tkeen', 'U', 1),
(100000007, 2, 5, 'Toan', 'Nguyen', 'tnguyen@infinnov.com', '2017-09-18', 'tnguyen', 'tnguyen', 'U', 0),
(100000008, 2, 5, 'Mentesnot', 'Aboset', 'maboset@infinnov.com', '2017-10-12', 'maboset', 'maboset', 'U', 0),
(100000009, 2, 6, 'Zheng', 'Liu', 'zliu@infinnov.com', '2017-12-04', 'zliu', 'zliu', 'U', 0),
(100000010, 2, 6, 'Hamad', 'Amad', 'hamad@infinnov.com', '2017-12-04', 'hamad', 'hamad', 'U', 0),
(100000011, 2, 7, 'Keefe', 'Chan', 'kchan@infinnov.com', '2017-12-11', 'kchan', 'kchan', 'U', 0),
(100000012, 2, 7, 'Albert', 'Nguyen', 'anguyen@infinnov.com', '2017-11-19', 'anguyen', 'anguyen', 'U', 0);

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

DROP TABLE IF EXISTS `groups`;
CREATE TABLE `groups` (
  `Id` int(11) NOT NULL,
  `GroupName` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `groups`
--

INSERT INTO `groups` (`Id`, `GroupName`) VALUES
(1, 'Group Test 1');

-- --------------------------------------------------------

--
-- Table structure for table `job`
--

DROP TABLE IF EXISTS `job`;
CREATE TABLE `job` (
  `Id` int(11) NOT NULL,
  `DepartmentId` int(11) NOT NULL,
  `Position` varchar(30) NOT NULL,
  `Description` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `job`
--

INSERT INTO `job` (`Id`, `DepartmentId`, `Position`, `Description`) VALUES
(1, 1, 'Accountant', 'Prepares asset, liability, and capital account entries by compiling and analyzing account information.'),
(2, 2, 'Manager', 'Maintains organization staff by establishing a recruiting, testing, and interviewing program.'),
(3, 1, 'General Ledger', 'Records and analyzes the various revenue streams'),
(4, 1, 'Senior Financial Analyst', 'Responsible for maintaining the cash flow budget/forecast excel models'),
(5, 2, 'System Analyst', ''),
(6, 2, 'Developer', ''),
(7, 2, 'Tester', ''),
(8, 3, 'CEO', '');

-- --------------------------------------------------------

--
-- Table structure for table `reporttemplate`
--

DROP TABLE IF EXISTS `reporttemplate`;
CREATE TABLE `reporttemplate` (
  `ID` int(11) NOT NULL,
  `DepartmentID` int(11) NOT NULL,
  `Description` varchar(300) NOT NULL,
  `CreatedDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `reporttemplate`
--

INSERT INTO `reporttemplate` (`ID`, `DepartmentID`, `Description`, `CreatedDate`) VALUES
(3, 1, 'Report Test 3', '2018-01-10');

-- --------------------------------------------------------

--
-- Table structure for table `section`
--

DROP TABLE IF EXISTS `section`;
CREATE TABLE `section` (
  `ID` int(11) NOT NULL,
  `ReportTemplateID` int(11) NOT NULL,
  `Description` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `section`
--

INSERT INTO `section` (`ID`, `ReportTemplateID`, `Description`) VALUES
(7, 3, 's1'),
(8, 3, 's2'),
(9, 3, 's3');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `attendance`
--
ALTER TABLE `attendance`
  ADD PRIMARY KEY (`AttendanceId`);

--
-- Indexes for table `criteria`
--
ALTER TABLE `criteria`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`EmployeeNumber`);

--
-- Indexes for table `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `job`
--
ALTER TABLE `job`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `reporttemplate`
--
ALTER TABLE `reporttemplate`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `section`
--
ALTER TABLE `section`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `attendance`
--
ALTER TABLE `attendance`
  MODIFY `AttendanceId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `criteria`
--
ALTER TABLE `criteria`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `EmployeeNumber` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100000013;

--
-- AUTO_INCREMENT for table `groups`
--
ALTER TABLE `groups`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `job`
--
ALTER TABLE `job`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `reporttemplate`
--
ALTER TABLE `reporttemplate`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `section`
--
ALTER TABLE `section`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
