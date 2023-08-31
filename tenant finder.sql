-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 14, 2023 at 12:48 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tenant finder`
--

-- --------------------------------------------------------

--
-- Table structure for table `appointment`
--

CREATE TABLE `appointment` (
  `APPID` int(11) NOT NULL,
  `USERID` int(11) NOT NULL,
  `OWNERID` int(11) NOT NULL,
  `HOUSEID` int(11) NOT NULL,
  `ROOMID` int(11) NOT NULL,
  `BOOKINGID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `appointment`
--

INSERT INTO `appointment` (`APPID`, `USERID`, `OWNERID`, `HOUSEID`, `ROOMID`, `BOOKINGID`) VALUES
(1502, 1, 3, 2, 0, 1725),
(1503, 1, 3, 2, 0, 1725),
(1504, 1, 3, 2, 0, 1724),
(1505, 1, 3, 2, 0, 1726),
(1506, 1, 2, 1, 0, 1724);

-- --------------------------------------------------------

--
-- Table structure for table `house`
--

CREATE TABLE `house` (
  `ID` int(11) NOT NULL,
  `HOUSENO` varchar(6) NOT NULL,
  `STREETNAME` varchar(40) NOT NULL,
  `CITY` varchar(30) NOT NULL,
  `PROVINCE` varchar(25) NOT NULL,
  `OWNERID` int(13) NOT NULL,
  `CODE` varchar(4) NOT NULL,
  `PICTURE` varchar(70) NOT NULL,
  `PRICE` varchar(12) NOT NULL,
  `DESCRIPTION` varchar(700) DEFAULT NULL,
  `APPROVED` varchar(12) NOT NULL,
  `DOCUMENT` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `house`
--

INSERT INTO `house` (`ID`, `HOUSENO`, `STREETNAME`, `CITY`, `PROVINCE`, `OWNERID`, `CODE`, `PICTURE`, `PRICE`, `DESCRIPTION`, `APPROVED`, `DOCUMENT`) VALUES
(1, '40', 'PLUMER STREET', 'Emalahleni', 'MPUMALANGA', 2, '1039', 'houses/IMG_0316.JPG', '800', 'single room with shared bathroom and kitchen', 'TRUE', 'houses/TITLE DEEDS_1.pdf'),
(2, '3357', 'THOKOZILE ZWANE STREET EXT 5', 'EMALAHLENI', 'MPUMALANGA', 3, '1039', 'houses/IMG_0337.JPG', '3500', 'full house with 3 bedrooms, large main bedroom with a built in bathroom, kitchen, lounge, and bathroom', 'FALSE', 'houses/TITLE DEEDS_1.pdf');

-- --------------------------------------------------------

--
-- Table structure for table `house pictures`
--

CREATE TABLE `house pictures` (
  `PICID` int(11) NOT NULL,
  `HOUSEID` int(11) NOT NULL,
  `PICNAME` varchar(70) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `house pictures`
--

INSERT INTO `house pictures` (`PICID`, `HOUSEID`, `PICNAME`) VALUES
(3921, 1, 'houses/IMG_0309.JPG'),
(3922, 1, 'houses/IMG_0310.JPG'),
(3923, 1, 'houses/IMG_0311.JPG'),
(3924, 1, 'houses/IMG_0312.JPG'),
(3925, 2, 'houses/IMG_0314.JPG'),
(3926, 2, 'houses/IMG_0319.JPG'),
(3927, 2, 'houses/IMG_0320.JPG'),
(3928, 2, 'houses/IMG_0321.JPG'),
(3929, 2, 'houses/IMG_0323.JPG'),
(3930, 2, 'houses/IMG_0324.JPG'),
(3931, 2, 'houses/IMG_0325.JPG'),
(3932, 2, 'houses/IMG_0326.JPG'),
(3933, 2, 'houses/IMG_0327.JPG'),
(3934, 2, 'houses/IMG_0328.JPG');

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `TRANSID` int(11) NOT NULL,
  `CARDNO` varchar(16) NOT NULL,
  `CVVNO` varchar(3) NOT NULL,
  `CARDHOLDERNAME` varchar(60) NOT NULL,
  `HOUSEID` int(11) NOT NULL,
  `ROOMID` int(11) NOT NULL,
  `USERID` int(11) NOT NULL,
  `OWNERID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`TRANSID`, `CARDNO`, `CVVNO`, `CARDHOLDERNAME`, `HOUSEID`, `ROOMID`, `USERID`, `OWNERID`) VALUES
(4235, '11111111111', '098', '11111111111', 2, 26, 0, 2),
(4236, '519234443123', '098', '519234443123', 2, 26, 0, 2),
(4237, '51920982280', '134', '51920982280', 2, 26, 0, 2),
(4238, '4562299039221', '876', '4562299039221', 2, 26, 0, 2);

-- --------------------------------------------------------

--
-- Table structure for table `room`
--

CREATE TABLE `room` (
  `ROOMID` int(11) NOT NULL,
  `ROOMTYPE` varchar(60) NOT NULL,
  `ROOMDESC` text NOT NULL,
  `PRICE` double NOT NULL,
  `HOUSEID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `room`
--

INSERT INTO `room` (`ROOMID`, `ROOMTYPE`, `ROOMDESC`, `PRICE`, `HOUSEID`) VALUES
(26, 'single', 'single room with shared bathroom and kitchen', 800, 1);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `ID` int(11) NOT NULL,
  `NAME` text NOT NULL,
  `SURNAME` text NOT NULL,
  `EMAIL` varchar(60) NOT NULL,
  `CONTACT` varchar(10) NOT NULL,
  `BIRTHDATE` varchar(20) NOT NULL,
  `ADDRESS` varchar(100) NOT NULL,
  `PASSWORD` varchar(20) NOT NULL,
  `IDENTITYNUMBER` varchar(13) NOT NULL,
  `ROLE` varchar(12) NOT NULL,
  `APPROVED` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`ID`, `NAME`, `SURNAME`, `EMAIL`, `CONTACT`, `BIRTHDATE`, `ADDRESS`, `PASSWORD`, `IDENTITYNUMBER`, `ROLE`, `APPROVED`) VALUES
(1, 'lehlogonolo', 'malapane', 'hlogs23@gmail.com', '0763421453', '2000-05-31', '37 plumer street', '1234', '0005315932086', 'tenant', '0'),
(2, 'jabulani', 'phakathi', 'jabulani@gmail.com', '0735674325', '2000-12-08', '3357 THOKOZILE ZWANE STREET EXT 5', '0000', '9712085932087', 'owner', '0'),
(3, 'Hlogi', 'malapane', 'lehlogonolomalapane88@gmail.com', '0735674325', '1997-12-28', '3357 THOKOZILE ZWANE STREET EXT 5', '0011', 'lehlogonoloma', 'owner', '0'),
(4, 'Admin', 'Admin', 'admin@admin.com', '0763421453', '', '', 'admin', '', 'admin', '0');

-- --------------------------------------------------------

--
-- Table structure for table `viewing date`
--

CREATE TABLE `viewing date` (
  `BOOKINGID` int(11) NOT NULL,
  `DATE` varchar(12) NOT NULL,
  `TIME` varchar(12) NOT NULL,
  `HOUSEID` int(11) NOT NULL,
  `OWNID` int(11) NOT NULL,
  `ROOMID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `viewing date`
--

INSERT INTO `viewing date` (`BOOKINGID`, `DATE`, `TIME`, `HOUSEID`, `OWNID`, `ROOMID`) VALUES
(1724, '2023-06-14', '16:15', 1, 2, 0),
(1725, '2023-06-14', '09:10', 1, 2, 0),
(1726, '2023-06-08', '16:15', 1, 2, 0),
(1727, '2023-06-14', '16:15', 2, 3, 0),
(1728, '2023-06-14', '09:10', 2, 3, 0),
(1729, '2023-06-08', '16:15', 2, 3, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appointment`
--
ALTER TABLE `appointment`
  ADD PRIMARY KEY (`APPID`),
  ADD KEY `USERID` (`USERID`),
  ADD KEY `BOOKINGID` (`BOOKINGID`),
  ADD KEY `OWNERID` (`OWNERID`),
  ADD KEY `appointment_ibfk_8` (`HOUSEID`),
  ADD KEY `appointment_ibfk_9` (`ROOMID`);

--
-- Indexes for table `house`
--
ALTER TABLE `house`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `OWNERID` (`OWNERID`);

--
-- Indexes for table `house pictures`
--
ALTER TABLE `house pictures`
  ADD PRIMARY KEY (`PICID`),
  ADD KEY `HOUSEID` (`HOUSEID`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`TRANSID`),
  ADD KEY `HOUSEID` (`HOUSEID`),
  ADD KEY `ROOMID` (`ROOMID`);

--
-- Indexes for table `room`
--
ALTER TABLE `room`
  ADD PRIMARY KEY (`ROOMID`),
  ADD KEY `HOUSEID` (`HOUSEID`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `viewing date`
--
ALTER TABLE `viewing date`
  ADD PRIMARY KEY (`BOOKINGID`),
  ADD KEY `ROOMID` (`ROOMID`),
  ADD KEY `booking_ibfk_2` (`OWNID`),
  ADD KEY `HOUSEID` (`HOUSEID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `appointment`
--
ALTER TABLE `appointment`
  MODIFY `APPID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1507;

--
-- AUTO_INCREMENT for table `house pictures`
--
ALTER TABLE `house pictures`
  MODIFY `PICID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3935;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `TRANSID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4239;

--
-- AUTO_INCREMENT for table `room`
--
ALTER TABLE `room`
  MODIFY `ROOMID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `viewing date`
--
ALTER TABLE `viewing date`
  MODIFY `BOOKINGID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1730;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `appointment`
--
ALTER TABLE `appointment`
  ADD CONSTRAINT `appointment_ibfk_5` FOREIGN KEY (`USERID`) REFERENCES `user` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `appointment_ibfk_6` FOREIGN KEY (`BOOKINGID`) REFERENCES `viewing date` (`BOOKINGID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `appointment_ibfk_7` FOREIGN KEY (`OWNERID`) REFERENCES `user` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `appointment_ibfk_8` FOREIGN KEY (`HOUSEID`) REFERENCES `house` (`ID`) ON UPDATE NO ACTION,
  ADD CONSTRAINT `appointment_ibfk_9` FOREIGN KEY (`ROOMID`) REFERENCES `viewing date` (`ROOMID`) ON UPDATE NO ACTION;

--
-- Constraints for table `house`
--
ALTER TABLE `house`
  ADD CONSTRAINT `house_ibfk_1` FOREIGN KEY (`OWNERID`) REFERENCES `user` (`ID`);

--
-- Constraints for table `house pictures`
--
ALTER TABLE `house pictures`
  ADD CONSTRAINT `house pictures_ibfk_1` FOREIGN KEY (`HOUSEID`) REFERENCES `house` (`ID`);

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`HOUSEID`) REFERENCES `house` (`ID`),
  ADD CONSTRAINT `payment_ibfk_2` FOREIGN KEY (`ROOMID`) REFERENCES `room` (`ROOMID`);

--
-- Constraints for table `room`
--
ALTER TABLE `room`
  ADD CONSTRAINT `room_ibfk_1` FOREIGN KEY (`HOUSEID`) REFERENCES `house` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `viewing date`
--
ALTER TABLE `viewing date`
  ADD CONSTRAINT `viewing date_ibfk_2` FOREIGN KEY (`OWNID`) REFERENCES `user` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `viewing date_ibfk_3` FOREIGN KEY (`HOUSEID`) REFERENCES `house` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
