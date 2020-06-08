-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 08, 2020 at 09:43 PM
-- Server version: 10.3.16-MariaDB
-- PHP Version: 7.3.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `private_tutor`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `AFrist_Name` varchar(50) NOT NULL,
  `ALast_Name` varchar(50) DEFAULT NULL,
  `AEmail` varchar(100) NOT NULL,
  `Apassword` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE `course` (
  `ID` int(11) NOT NULL,
  `Name` varchar(30) NOT NULL,
  `Subject` varchar(30) NOT NULL,
  `Tutor_Email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ebook`
--

CREATE TABLE `ebook` (
  `Book_Name` varchar(50) DEFAULT NULL,
  `Book_ID` int(11) NOT NULL,
  `Book_Subject` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `parent`
--

CREATE TABLE `parent` (
  `PFrist_Name` varchar(50) NOT NULL,
  `PLast_Name` varchar(50) DEFAULT NULL,
  `PEmail` varchar(100) NOT NULL,
  `Ppassword` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `review`
--

CREATE TABLE `review` (
  `Review` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tutor`
--

CREATE TABLE `tutor` (
  `TFrist_Name` varchar(50) NOT NULL,
  `TLast_Name` varchar(50) DEFAULT NULL,
  `TEmail` varchar(100) NOT NULL,
  `Tpassword` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`AEmail`);

--
-- Indexes for table `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`Subject`),
  ADD UNIQUE KEY `ID` (`ID`),
  ADD KEY `get_tutor` (`Tutor_Email`);

--
-- Indexes for table `ebook`
--
ALTER TABLE `ebook`
  ADD PRIMARY KEY (`Book_ID`),
  ADD KEY `book_course` (`Book_Subject`);

--
-- Indexes for table `parent`
--
ALTER TABLE `parent`
  ADD PRIMARY KEY (`PEmail`);

--
-- Indexes for table `tutor`
--
ALTER TABLE `tutor`
  ADD PRIMARY KEY (`TEmail`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `course`
--
ALTER TABLE `course`
  ADD CONSTRAINT `get_tutor` FOREIGN KEY (`Tutor_Email`) REFERENCES `tutor` (`TEmail`);

--
-- Constraints for table `ebook`
--
ALTER TABLE `ebook`
  ADD CONSTRAINT `book_course` FOREIGN KEY (`Book_Subject`) REFERENCES `course` (`Subject`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
