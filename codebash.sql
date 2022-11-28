-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 28, 2022 at 03:45 AM
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
-- Database: `codebash`
--

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `sno` int(1) NOT NULL,
  `name` text NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone_no` varchar(50) NOT NULL,
  `message` text NOT NULL,
  `date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`sno`, `name`, `email`, `phone_no`, `message`, `date`) VALUES
(1, 'vis', 'vis@gmailcom', '', 'hello everyone', NULL),
(15, 'shamith', 'shamithkumar7244@gmail.com', '4593495', 'hiii i am shamith kumar jain kp', '2022-11-14 11:39:25'),
(16, 'shamith', 'shamithkumar7244@gmail.com', '4593495', 'dsfasdf', '2022-11-15 07:19:52'),
(17, 'Vishnu M', 'shamithkumar7244@gmail.com', '4593495', 'hiii vishnu', '2022-11-15 07:39:21'),
(18, 'shamith', 'shamithkumar7244@gmail.com', '4593495', 'adsfasdf', '2022-11-15 07:40:55'),
(19, 'shamith', 'vappu5429@gmail.com', '4593495', 'adsfasdf', '2022-11-15 07:41:44'),
(20, 'Vishnu M', 'shamithkumar7244@gmail.com', '4593495', 'dsfadsf', '2022-11-15 07:43:34'),
(21, 'shamith', 'vappu5429@gmail.com', '4593495', 'dfs', '2022-11-15 07:45:03'),
(22, 'shamith', 'vappu5429@gmail.com', '4593495', 'dfs', '2022-11-15 07:45:15'),
(23, 'shamith', 'shamithkumar7244@gmail.com', '4593495', 'fgresg', '2022-11-15 07:49:47'),
(24, 'shamith', 'shamithkumar7244@gmail.com', '4593495', 'fgresg', '2022-11-15 07:50:24'),
(25, 'shamith', 'shamithkumar7244@gmail.com', '4593495', 'bklgug', '2022-11-15 07:53:36'),
(26, 'shamith', 'shamithkumar7244@gmail.com', '4593495', 'ertgdfgdfg', '2022-11-15 07:55:07'),
(27, 'shamith', 'vappu5429@gmail.com', '4593495', 'ertgdfgdfg', '2022-11-15 07:55:21'),
(28, 'shamith', 'vappu5429@gmail.com', '4593495', 'adsfsdf', '2022-11-15 07:57:45');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `sno` int(11) NOT NULL,
  `title` text NOT NULL,
  `tagline` text NOT NULL,
  `slug` varchar(25) NOT NULL,
  `content` text NOT NULL,
  `image_file` varchar(25) NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`sno`, `title`, `tagline`, `slug`, `content`, `image_file`, `date`) VALUES
(1, 'Let\'s Learn About Dijstra\'s algo', 'This is my edited tagline', 'second-post', 'This is  a;sp converted to the edited post. Dijkstra\'s original algorithm found the shortest path between two given nodes,[6] but a more common variant fixes a single node as the \"source\" node and finds shortest paths from the source to all other nodes in the graph, producing a shortest-path tree.\r\n\r\n', 'This.jpg', '2022-11-23 07:40:02'),
(6, 'vishnu', 'hello ', 'sluggy', 'this is a dummy content', 'image.jpg', '2022-11-23 02:43:48'),
(7, 'ds;fawgawea', 'gfaagadsgf', 'dfds', 'asdfagrawt', 'adf', '2022-11-23 03:01:21'),
(8, 'asdgrwh', 'garh354y', 'hwe5yrh', 'jwtejwer', 're54wy', '2022-11-23 03:01:34'),
(9, 'h5q3wey', '54wuhrgr', 'wyw5', 'asehq35y', 'qhq35', '2022-11-23 03:01:45'),
(10, 'tq4wt', 'yq43yt', 'hyq34y', 'hq34hq34y', 'yhq34', '2022-11-23 07:45:52'),
(11, 'anandanna', 'ashwinanna', 'shakespeare', 'shake abdullah', 'shakila.jpg', '2022-11-23 07:46:37');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`sno`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`sno`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `sno` int(1) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `sno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
