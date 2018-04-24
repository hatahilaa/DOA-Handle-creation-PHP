-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 24, 2018 at 01:11 PM
-- Server version: 5.7.22
-- PHP Version: 7.0.29-1+ubuntu17.10.1+deb.sury.org+1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `prescription`
--

-- --------------------------------------------------------

--
-- Table structure for table `doctors`
--

CREATE TABLE `doctors` (
  `id` int(5) NOT NULL COMMENT 'Database id - auto_incremented for SQL search',
  `nid` varchar(250) NOT NULL COMMENT 'HandleId reference to NID number - issued by NIDA',
  `license` varchar(250) NOT NULL COMMENT 'Unique License of teh doctor, issued by MoH',
  `doc_id` varchar(250) NOT NULL COMMENT 'HandleID - Unique for each doctor'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `doctors`
--

INSERT INTO `doctors` (`id`, `nid`, `license`, `doc_id`) VALUES
(6, '119838007845323', 'LIC001243', '25.001/PRESCRIPTION/DOCTOR/e8a71ddf10'),
(7, '119838007845323', 'LIC001243', '25.001/PRESCRIPTION/DOCTOR/c087000117'),
(8, '119838007845323', 'LIC001243', '25.001/PRESCRIPTION/DOCTOR/79757f9264'),
(9, '119838007845323', 'LIC001243', '25.001/PRESCRIPTION/DOCTOR/3d149609'),
(10, '2343434334', 'ESSS', '25.001/PRESCRIPTION/DOCTOR/cbdaf4d0d8');

-- --------------------------------------------------------

--
-- Table structure for table `medicines`
--

CREATE TABLE `medicines` (
  `id` int(11) NOT NULL COMMENT 'Database id - auto_incremented for SQL search',
  `med_id` varchar(250) NOT NULL COMMENT 'HandleId - unique for each medecine',
  `name` varchar(250) NOT NULL COMMENT 'HandleId - reference to the medicine - unique',
  `brand` varchar(250) NOT NULL COMMENT 'Brand ',
  `admission_mode` varchar(250) NOT NULL COMMENT 'How to take the medicine',
  `batch` varchar(250) NOT NULL COMMENT 'HandleId - reference to batch',
  `cost` int(10) NOT NULL COMMENT 'Price of medicine in RWF'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `patients`
--

CREATE TABLE `patients` (
  `id` int(7) NOT NULL COMMENT 'Database id - auto_incremented for SQL search',
  `pat_id` varchar(250) NOT NULL COMMENT 'HandleId - unique for each patient',
  `nid` varchar(250) NOT NULL COMMENT 'HandleId - issued by NIDA',
  `blood_type` varchar(250) NOT NULL COMMENT 'HandleId - unique blood type',
  `allergies` text NOT NULL COMMENT 'Array of allergies of the patient - added by the doctor',
  `prescription` text NOT NULL COMMENT 'HandleID - refers to the prescption details'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pharmacies`
--

CREATE TABLE `pharmacies` (
  `id` int(11) NOT NULL COMMENT 'Database id - auto_incremented for SQL search',
  `pharma_id` varchar(250) NOT NULL COMMENT 'HandleId - unique for each pharmacy',
  `name` varchar(250) NOT NULL COMMENT 'Name of the pharmacy',
  `location` varchar(250) NOT NULL COMMENT 'LatLong - coordinates of the pharmacy'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(250) NOT NULL,
  `password` varchar(250) NOT NULL,
  `category` varchar(250) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `acount_status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `doctors`
--
ALTER TABLE `doctors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `medicines`
--
ALTER TABLE `medicines`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `patients`
--
ALTER TABLE `patients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pharmacies`
--
ALTER TABLE `pharmacies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `doctors`
--
ALTER TABLE `doctors`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT COMMENT 'Database id - auto_incremented for SQL search', AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `medicines`
--
ALTER TABLE `medicines`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Database id - auto_incremented for SQL search';
--
-- AUTO_INCREMENT for table `patients`
--
ALTER TABLE `patients`
  MODIFY `id` int(7) NOT NULL AUTO_INCREMENT COMMENT 'Database id - auto_incremented for SQL search';
--
-- AUTO_INCREMENT for table `pharmacies`
--
ALTER TABLE `pharmacies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Database id - auto_incremented for SQL search';
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
