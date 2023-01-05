-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Nov 27, 2019 at 11:18 AM
-- Server version: 5.7.26
-- PHP Version: 7.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `forensic`
--
CREATE DATABASE IF NOT EXISTS `forensic` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `forensic`;

-- --------------------------------------------------------

--
-- Table structure for table `accesslogs`
--

DROP TABLE IF EXISTS `accesslogs`;
CREATE TABLE IF NOT EXISTS `accesslogs` (
  `ID` int(9) NOT NULL,
  `USER` varchar(30) NOT NULL,
  `LOGGEDIN` timestamp NOT NULL,
  `LOGGEDOUT` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `accesslogs`
--


-- --------------------------------------------------------

--
-- Table structure for table `cases`
--

DROP TABLE IF EXISTS `cases`;
CREATE TABLE IF NOT EXISTS `cases` (
  `CASE_ID` int(6) NOT NULL,
  `OFFICER_ID` int(4) DEFAULT NULL,
  `DATE` date NOT NULL,
  `STATUS` varchar(10) DEFAULT NULL,
  `ADDRESS` varchar(20) NOT NULL,
  PRIMARY KEY (`CASE_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cases`
--



--
-- Triggers `cases`
--
DROP TRIGGER IF EXISTS `insertLog`;
DELIMITER $$
CREATE TRIGGER `insertLog` AFTER INSERT ON `cases` FOR EACH ROW INSERT INTO writelogs VALUES(null, NEW.CASE_ID, NOW())
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `evidence`
--

DROP TABLE IF EXISTS `evidence`;
CREATE TABLE IF NOT EXISTS `evidence` (
  `PHOTO_ID` int(5) NOT NULL AUTO_INCREMENT,
  
  
  `LAB_ID` int(3) DEFAULT NULL,
  `CASE_ID` int(6) DEFAULT NULL,
  `PHOTO_DATE` date DEFAULT NULL,
  `PROCESSING_METHOD` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`PHOTO_ID`),
  KEY `FK_6` (`LAB_ID`),
  KEY `FK_7` (`CASE_ID`)
) ENGINE=MyISAM AUTO_INCREMENT=98057 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `evidence`
--



--
-- Table structure for table `firearms`
--

DROP TABLE IF EXISTS `firearms`;
CREATE TABLE IF NOT EXISTS `firearms` (
  `FIREARM_ID` int(4) NOT NULL AUTO_INCREMENT,
  `CASE_ID` int(6) DEFAULT NULL,
  `SEIZING_OFFICER` int(4) DEFAULT NULL,
  `MAKEMODEL` varchar(30) DEFAULT NULL,
  `LOCATION_FOUND` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`FIREARM_ID`),
  KEY `FK_8` (`SEIZING_OFFICER`),
  KEY `FK_10` (`CASE_ID`)
) ENGINE=MyISAM AUTO_INCREMENT=12036 DEFAULT CHARSET=latin1;






--
-- Table structure for table `known_forensics`
--

DROP TABLE IF EXISTS `known_forensics`;
CREATE TABLE IF NOT EXISTS `known_forensics` (
  `KNOWN_ID` int(4) NOT NULL AUTO_INCREMENT,
  `CASE_ID` int(6) NOT NULL,
  `DNA_RESULT` varchar(20) DEFAULT NULL,
  `DRUG_TEST_RESULT` varchar(20) DEFAULT NULL,
  `BALLISTICS_RESULT` varchar(20) DEFAULT NULL,
  `BLOOD_GROUP` varchar(10) DEFAULT NULL,
  `FIREARMS_RESULT` varchar(20) NOT NULL,
  PRIMARY KEY (`KNOWN_ID`)
) ENGINE=MyISAM AUTO_INCREMENT=1006 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `known_forensics`
--


--
-- Table structure for table `lab`
--

DROP TABLE IF EXISTS `lab`;
CREATE TABLE IF NOT EXISTS `lab` (
  `LAB_ID` int(3) NOT NULL,
  `TECH_ID` int(6) DEFAULT NULL,
  `SPECIALIST` varchar(20) DEFAULT NULL,
  `ADDRESS` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`LAB_ID`),
  KEY `FK_11` (`TECH_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;


--
-- Table structure for table `lab_techs`
--

DROP TABLE IF EXISTS `lab_techs`;
CREATE TABLE IF NOT EXISTS `lab_techs` (
  `TECH_ID` int(6) NOT NULL,
  `NAME` varchar(20) DEFAULT NULL,
  `DESIGNATION` varchar(30) DEFAULT NULL,
  `DEPARTMENT` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`TECH_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



--
-- Table structure for table `officer`
--

DROP TABLE IF EXISTS `officer`;
CREATE TABLE IF NOT EXISTS `officer` (
  `OFFICER_ID` int(4) NOT NULL,
  `NAME` varchar(20) DEFAULT NULL,
  `DESIGNATION` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`OFFICER_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



--
-- Table structure for table `suspects`
--

DROP TABLE IF EXISTS `suspects`;
CREATE TABLE IF NOT EXISTS `suspects` (
  `SUSPECT_ID` int(6) NOT NULL AUTO_INCREMENT,
  `CASE_ID` int(6) DEFAULT NULL,

  `NAME` varchar(20) DEFAULT NULL,
  `ADDRESS` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`SUSPECT_ID`),
  KEY `FK_7` (`CASE_ID`)
) ENGINE=MyISAM AUTO_INCREMENT=201965 DEFAULT CHARSET=latin1;


--
-- Table structure for table `updatelogs`
--

DROP TABLE IF EXISTS `updatelogs`;
CREATE TABLE IF NOT EXISTS `updatelogs` (
  `ID` int(6) NOT NULL AUTO_INCREMENT,
  `CASE_ID` int(6) NOT NULL,
  `USER` varchar(30) NOT NULL,
  `DATE` timestamp NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;



--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(6) NOT NULL,
  `name` varchar(30) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `contact` varchar(30) NOT NULL,
  `city` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=336706 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `contact`, `city`) VALUES
(100, 'Nithin Gowda', 'nithin@gmail.com', 'Nithin@123', '9988776655', 'Bengaluru'),
(1, 'admin', 'admin@gmail.com', 'Admin@123', '9988774433', 'Bengaluru'),
(1000, 'Nanda Kumar', 'nanda@gmail.com', 'Nanda@123', '9988665544', 'Bengaluru');


-- --------------------------------------------------------

--
-- Table structure for table `writelogs`
--

DROP TABLE IF EXISTS `writelogs`;
CREATE TABLE IF NOT EXISTS `writelogs` (
  `ID` int(6) NOT NULL AUTO_INCREMENT,
  `CASE_ID` int(6) NOT NULL,
  `DATE` timestamp NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
