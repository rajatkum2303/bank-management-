-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 11, 2019 at 09:13 PM
-- Server version: 10.1.36-MariaDB
-- PHP Version: 7.2.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bank`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `myproc` ()  BEGIN
select acc_no,name,bal from trans;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `account`
--

CREATE TABLE `account` (
  `Question` text NOT NULL,
  `acc_no` int(11) NOT NULL,
  `name` text NOT NULL,
  `pin` int(11) NOT NULL,
  `acc_type` text NOT NULL,
  `nationality` text NOT NULL,
  `caste` text NOT NULL,
  `gender` text NOT NULL,
  `mobile` int(11) NOT NULL,
  `address` text NOT NULL,
  `balance` int(11) NOT NULL,
  `Question_sol` text NOT NULL,
  `Sec_PSWD` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `account`
--

INSERT INTO `account` (`Question`, `acc_no`, `name`, `pin`, `acc_type`, `nationality`, `caste`, `gender`, `mobile`, `address`, `balance`, `Question_sol`, `Sec_PSWD`) VALUES
('What is your Nick Name?', 11, 'shri', 11, 'saving', 'muslim', 'hgjf', 'male', 8764765, 'cmr', 2000, 's', 11),
('', 20, 'raj', 22, 'saving', 'hindu', 'hg', 'male', 90280742, 'cmr', 1000, '', 0),
('What is your Nick Name?', 30, 'aditya', 1, 'saving', 'hindu', 'indian', 'male', 872872365, 'cmr', 2000, 'raj', 1),
('What is your Nick Name?', 60, 'sagar', 6, 'saving', 'hindu', 'a/s,b', 'male', 983476, 'dkweglarhf', 7000, '.lwj,afsd', 6),
('What is your Nick Name?', 77, 'harish', 22, 'saving', 'hindu', 'sc', 'male', 852963214, 'jhgjdhgdeja', 40000, 'hari', 7722);

-- --------------------------------------------------------

--
-- Table structure for table `balances`
--

CREATE TABLE `balances` (
  `Name` text NOT NULL,
  `Acc_no` int(11) NOT NULL,
  `Balance` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `balances`
--

INSERT INTO `balances` (`Name`, `Acc_no`, `Balance`) VALUES
('shri', 11, 5500),
('raj', 20, 5000),
('aditya', 30, 2500),
('sagar', 60, 2000),
('harish', 77, 42000);

--
-- Triggers `balances`
--
DELIMITER $$
CREATE TRIGGER `trans` AFTER UPDATE ON `balances` FOR EACH ROW insert into trans(name,acc_no,bal)values(new.Name,new.Acc_no,new.Balance-old.Balance)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `bank`
--

CREATE TABLE `bank` (
  `Name` text NOT NULL,
  `B_ID` int(11) NOT NULL,
  `SSN` int(11) NOT NULL,
  `E_type` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bank`
--

INSERT INTO `bank` (`Name`, `B_ID`, `SSN`, `E_type`) VALUES
('SBI Bank', 12, 469, 'Worker'),
('SBI Bank', 12, 30, 'Worker'),
('SBI Bank', 13, 13, 'Manager');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `Name` text NOT NULL,
  `Address` text NOT NULL,
  `SSN` int(11) NOT NULL,
  `Gender` text NOT NULL,
  `Mobile` int(11) NOT NULL,
  `Nationality` text NOT NULL,
  `E_Type` text NOT NULL,
  `B_Name` text NOT NULL,
  `B_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`Name`, `Address`, `SSN`, `Gender`, `Mobile`, `Nationality`, `E_Type`, `B_Name`, `B_ID`) VALUES
('rajev', 'cr', 469, 'male', 865765, 'Hindhu', 'Worker', 'SBI Bank', 12),
('harry', 'cmrit', 30, 'male', 41253698, 'Hindhu', 'Worker', 'SBI Bank', 12),
('rajat', 'aecs', 13, 'male', 62645992, 'Hindhu', 'Manager', 'SBI Bank', 13);

-- --------------------------------------------------------

--
-- Table structure for table `security_process`
--

CREATE TABLE `security_process` (
  `acc_no` int(11) NOT NULL,
  `Sec_Question` text NOT NULL,
  `Sec_Sol` text NOT NULL,
  `Sec_PSWD` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `security_process`
--

INSERT INTO `security_process` (`acc_no`, `Sec_Question`, `Sec_Sol`, `Sec_PSWD`) VALUES
(11, 'comboBoxChanged', 's', 11),
(77, 'comboBoxChanged', 'hari', 7722),
(60, 'comboBoxChanged', '.lwj,afsd', 6),
(30, 'comboBoxChanged', 'raj', 1);

-- --------------------------------------------------------

--
-- Table structure for table `trans`
--

CREATE TABLE `trans` (
  `name` text NOT NULL,
  `acc_no` int(11) NOT NULL,
  `bal` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `trans`
--

INSERT INTO `trans` (`name`, `acc_no`, `bal`) VALUES
('raj', 20, 100),
('raj', 20, -50),
('raj', 20, 50),
('shri', 11, 50),
('shri', 11, 50),
('shri', 11, -200),
('raj', 20, 200),
('raj', 20, 700),
('raj', 20, -1000),
('harish', 77, -500),
('raj', 20, 500),
('harish', 77, 500),
('shri', 11, -400),
('raj', 20, 200),
('raj', 20, -700),
('shri', 11, 700),
('shri', 11, 500),
('shri', 11, -500),
('raj', 20, 500),
('raj', 20, 500),
('raj', 20, -200),
('shri', 11, 200),
('raj', 20, -200),
('shri', 11, 200),
('raj', 20, -600),
('shri', 11, 600),
('raj', 20, -100),
('raj', 20, 100),
('raj', 20, -100),
('shri', 11, 100),
('raj', 20, 100),
('raj', 20, 200),
('shri', 11, -300),
('raj', 20, 500),
('raj', 20, 0),
('shri', 11, -500),
('raj', 20, 500),
('sagar', 60, -1000),
('sagar', 60, -1000),
('raj', 20, 1000),
('sagar', 60, -1000),
('sagar', 60, -1000),
('shri', 11, 1000),
('shri', 11, 500),
('raj', 20, 800),
('raj', 20, 1000),
('raj', 20, -1000),
('sagar', 60, -1200),
('raj', 20, 1000),
('raj', 20, -1000),
('shri', 11, 1000),
('sagar', 60, 200),
('shri', 11, 2000),
('raj', 20, -2000),
('harish', 77, 2000),
('sagar', 60, -450),
('raj', 20, 5600),
('raj', 20, -600),
('aditya', 30, -500),
('aditya', 30, -500),
('shri', 11, 500),
('shri', 11, -350),
('sagar', 60, 350),
('raj', 20, 500),
('raj', 20, -500),
('sagar', 60, 500),
('sagar', 60, -400),
('shri', 11, -150),
('raj', 20, -1500),
('aditya', 30, 1500),
('shri', 11, -2000),
('raj', 20, -500),
('shri', 11, 500);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`acc_no`);

--
-- Indexes for table `balances`
--
ALTER TABLE `balances`
  ADD PRIMARY KEY (`Acc_no`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
