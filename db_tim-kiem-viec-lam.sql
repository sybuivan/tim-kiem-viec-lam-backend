-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 21, 2023 at 10:28 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.0.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_tim-kiem-viec-lam`
--

-- --------------------------------------------------------

--
-- Table structure for table `apply`
--

CREATE TABLE `apply` (
  `id_apply` varchar(100) NOT NULL,
  `id_job` varchar(100) NOT NULL,
  `id_user` varchar(100) NOT NULL,
  `file_cv` varchar(255) NOT NULL,
  `introducing_letter` text NOT NULL,
  `created_at` date NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `apply`
--

INSERT INTO `apply` (`id_apply`, `id_job`, `id_user`, `file_cv`, `introducing_letter`, `created_at`, `status`) VALUES
('1gcct4lgonv27c', '1gcct4lgonfk5h', '1gc710lfdu4aez', '', '123', '2023-04-20', 3);

-- --------------------------------------------------------

--
-- Table structure for table `chat`
--

CREATE TABLE `chat` (
  `id_chat` varchar(100) NOT NULL,
  `id_room` varchar(100) NOT NULL,
  `id_user` varchar(100) NOT NULL,
  `id_company` varchar(100) NOT NULL,
  `message` text NOT NULL,
  `created_at` datetime NOT NULL,
  `sender` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `chat`
--

INSERT INTO `chat` (`id_chat`, `id_room`, `id_user`, `id_company`, `message`, `created_at`, `sender`) VALUES
('1gc6zslgoojlq1', '1gcct4lgonw77g', '1gc710lfdu4aez', '1gc3uklgomt0oc', 'Chaooo', '2023-04-20 12:26:17', 'company'),
('1gc6zslgook8pz', '1gcct4lgonw77g', '1gc710lfdu4aez', '1gc3uklgomt0oc', 'Chaoo', '2023-04-20 12:26:46', 'user'),
('1gcas4lgoo7ns5', '1gcct4lgonw77g', '1gc710lfdu4aez', '1gc3uklgomt0oc', 'Chaof', '2023-04-20 12:16:59', 'user'),
('1gcct4lgonw780', '1gcct4lgonw77g', '1gc710lfdu4aez', '1gc3uklgomt0oc', 'Xin Chao\n', '2023-04-20 12:08:05', 'company');

-- --------------------------------------------------------

--
-- Table structure for table `city`
--

CREATE TABLE `city` (
  `id_city` varchar(100) NOT NULL,
  `name_city` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `city`
--

INSERT INTO `city` (`id_city`, `name_city`) VALUES
('An Giang', 'Tỉnh An Giang'),
('Bà Rịa - Vũng Tàu', 'Tỉnh Bà Rịa - Vũng Tàu'),
('Bắc Giang', 'Tỉnh Bắc Giang'),
('Bắc Kạn', 'Tỉnh Bắc Kạn'),
('Bạc Liêu', 'Tỉnh Bạc Liêu'),
('Bắc Ninh', 'Tỉnh Bắc Ninh'),
('Bến Tre', 'Tỉnh Bến Tre'),
('Bình Dương', 'Tỉnh Bình Dương'),
('Bình Định', 'Tỉnh Bình Định'),
('Bình Phước', 'Tỉnh Bình Phước'),
('Bình Thuận', 'Tỉnh Bình Thuận'),
('Cà Mau', 'Tỉnh Cà Mau'),
('Cần Thơ', 'Thành phố Cần Thơ'),
('Cao Bằng', 'Tỉnh Cao Bằng'),
('Đà Nẵng', 'Thành phố Đà Nẵng'),
('Đắk Lắk', 'Tỉnh Đắk Lắk'),
('Đắk Nông', 'Tỉnh Đắk Nông'),
('Điện Biên', 'Tỉnh Điện Biên'),
('Đồng Nai', 'Tỉnh Đồng Nai'),
('Đồng Tháp', 'Tỉnh Đồng Tháp'),
('Gia Lai', 'Tỉnh Gia Lai'),
('Hà Giang', 'Tỉnh Hà Giang'),
('Hà Nam', 'Tỉnh Hà Nam'),
('Hà Nội', 'Thành phố Hà Nội'),
('Hà Tĩnh', 'Tỉnh Hà Tĩnh'),
('Hải Dương', 'Tỉnh Hải Dương'),
('Hải Phòng', 'Thành phố Hải Phòng'),
('Hậu Giang', 'Tỉnh Hậu Giang'),
('Hồ Chí Minh', 'Thành phố Hồ Chí Minh'),
('Hoà Bình', 'Tỉnh Hoà Bình'),
('Hưng Yên', 'Tỉnh Hưng Yên'),
('Khánh Hòa', 'Tỉnh Khánh Hòa'),
('Kiên Giang', 'Tỉnh Kiên Giang'),
('Kon Tum', 'Tỉnh Kon Tum'),
('Lai Châu', 'Tỉnh Lai Châu'),
('Lâm Đồng', 'Tỉnh Lâm Đồng'),
('Lạng Sơn', 'Tỉnh Lạng Sơn'),
('Lào Cai', 'Tỉnh Lào Cai'),
('Long An', 'Tỉnh Long An'),
('Nam Định', 'Tỉnh Nam Định'),
('Nghệ An', 'Tỉnh Nghệ An'),
('Ninh Bình', 'Tỉnh Ninh Bình'),
('Ninh Thuận', 'Tỉnh Ninh Thuận'),
('Phú Thọ', 'Tỉnh Phú Thọ'),
('Phú Yên', 'Tỉnh Phú Yên'),
('Quảng Bình', 'Tỉnh Quảng Bình'),
('Quảng Nam', 'Tỉnh Quảng Nam'),
('Quảng Ngãi', 'Tỉnh Quảng Ngãi'),
('Quảng Ninh', 'Tỉnh Quảng Ninh'),
('Quảng Trị', 'Tỉnh Quảng Trị'),
('Sóc Trăng', 'Tỉnh Sóc Trăng'),
('Sơn La', 'Tỉnh Sơn La'),
('Tây Ninh', 'Tỉnh Tây Ninh'),
('Thái Bình', 'Tỉnh Thái Bình'),
('Thái Nguyên', 'Tỉnh Thái Nguyên'),
('Thanh Hóa', 'Tỉnh Thanh Hóa'),
('Thừa Thiên Huế', 'Tỉnh Thừa Thiên Huế'),
('Tiền Giang', 'Tỉnh Tiền Giang'),
('Trà Vinh', 'Tỉnh Trà Vinh'),
('Tuyên Quang', 'Tỉnh Tuyên Quang'),
('Vĩnh Long', 'Tỉnh Vĩnh Long'),
('Vĩnh Phúc', 'Tỉnh Vĩnh Phúc'),
('Yên Bái', 'Tỉnh Yên Bái');

-- --------------------------------------------------------

--
-- Table structure for table `company`
--

CREATE TABLE `company` (
  `id_company` varchar(100) NOT NULL,
  `name_company` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `total_people` varchar(255) NOT NULL,
  `introduce` text NOT NULL,
  `logo` varchar(255) NOT NULL,
  `link_website` varchar(255) NOT NULL,
  `lat` int(11) NOT NULL,
  `lng` int(11) NOT NULL,
  `cover_image` varchar(255) NOT NULL,
  `active_status` int(11) NOT NULL,
  `faxCode` varchar(255) NOT NULL,
  `phone` varchar(11) NOT NULL,
  `idCompanyField` varchar(100) NOT NULL,
  `city` varchar(155) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `company`
--

INSERT INTO `company` (`id_company`, `name_company`, `address`, `total_people`, `introduce`, `logo`, `link_website`, `lat`, `lng`, `cover_image`, `active_status`, `faxCode`, `phone`, `idCompanyField`, `city`) VALUES
('1gc3uklgomt0oc', 'Công ty DANATEQ', 'http://localhost', '10-150 người ', '123', 'http://localhost:5000/1682054142866thao-le.jpg', 'http://localhost', 0, 0, 'http://localhost:5000/1682054142866thao-le.jpg', 0, '192.168.2.3', '0947895037', 'ITPC', 'Đà Nẵng');

-- --------------------------------------------------------

--
-- Table structure for table `companyfield`
--

CREATE TABLE `companyfield` (
  `id_companyField` varchar(100) NOT NULL,
  `name_field` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `companyfield`
--

INSERT INTO `companyfield` (`id_companyField`, `name_field`) VALUES
('ITPC', 'IT phần cứng'),
('ITPM', 'IT phần mêm'),
('KD', 'Kinh doanh');

-- --------------------------------------------------------

--
-- Table structure for table `experience`
--

CREATE TABLE `experience` (
  `id_experience` varchar(100) NOT NULL,
  `name_experience` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `experience`
--

INSERT INTO `experience` (`id_experience`, `name_experience`) VALUES
('1N', '1 năm'),
('D1N', 'Dưới 1 năm');

-- --------------------------------------------------------

--
-- Table structure for table `follow`
--

CREATE TABLE `follow` (
  `id_company` varchar(100) NOT NULL,
  `id_user` varchar(100) NOT NULL,
  `type_role` varchar(100) NOT NULL,
  `created_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `follow`
--

INSERT INTO `follow` (`id_company`, `id_user`, `type_role`, `created_at`) VALUES
('1gc3uklgomt0oc', '1gc710lfdu4aez', 'company', '2023-04-20'),
('1gc3uklgomt0oc', '1gc710lfdu4aez', 'user', '2023-04-21');

-- --------------------------------------------------------

--
-- Table structure for table `job`
--

CREATE TABLE `job` (
  `id_job` varchar(100) NOT NULL,
  `id_company` varchar(100) NOT NULL,
  `city` varchar(100) NOT NULL,
  `id_field` varchar(100) NOT NULL,
  `id_type` varchar(100) NOT NULL,
  `id_range` varchar(100) NOT NULL,
  `id_experience` varchar(100) NOT NULL,
  `name_job` varchar(255) NOT NULL,
  `deadline` date NOT NULL,
  `size_number` int(11) NOT NULL,
  `description_job` text NOT NULL,
  `required_job` text NOT NULL,
  `created_at` date NOT NULL,
  `work_location` varchar(255) NOT NULL,
  `urgent_recruitment` int(11) NOT NULL,
  `id_working_form` varchar(100) NOT NULL,
  `benefits_job` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `job`
--

INSERT INTO `job` (`id_job`, `id_company`, `city`, `id_field`, `id_type`, `id_range`, `id_experience`, `name_job`, `deadline`, `size_number`, `description_job`, `required_job`, `created_at`, `work_location`, `urgent_recruitment`, `id_working_form`, `benefits_job`) VALUES
('1gcct4lgonfk5h', '1gc3uklgomt0oc', 'Cà Mau', 'ITPC', 'CTV', '3T-6T', '1N', 'https://121212121', '2023-04-27', 1, '123213', '2q3213', '2023-04-20', 'asd', 0, 'TTG', '123213');

-- --------------------------------------------------------

--
-- Table structure for table `notification`
--

CREATE TABLE `notification` (
  `id_notification` varchar(100) NOT NULL,
  `id_apply` varchar(100) DEFAULT NULL,
  `id_user` varchar(100) DEFAULT NULL,
  `id_job` varchar(100) DEFAULT NULL,
  `content` text NOT NULL,
  `created_at` datetime NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `notification`
--

INSERT INTO `notification` (`id_notification`, `id_apply`, `id_user`, `id_job`, `content`, `created_at`, `status`) VALUES
('1gc7q8lgq8ks35', '1gcct4lgonv27c', '1gc710lfdu4aez', NULL, 'Trạng thái hồ sơ ứng tuyển vị trí https://121212121 đã từ chối', '2023-04-21 14:34:50', 0),
('1gc7q8lgq8my96', '1gcct4lgonv27c', '1gc710lfdu4aez', NULL, 'Trạng thái hồ sơ ứng tuyển vị trí https://121212121 đã từ chối', '2023-04-21 14:36:31', 0),
('1gc7q8lgq8nh8f', '1gcct4lgonv27c', '1gc710lfdu4aez', NULL, 'Trạng thái hồ sơ ứng tuyển vị trí https://121212121 đã từ chối', '2023-04-21 14:36:56', 0),
('1gc7q8lgq8ovte', '1gcct4lgonv27c', '1gc710lfdu4aez', NULL, 'Trạng thái hồ sơ ứng tuyển vị trí https://121212121 đã xem hồ sơ', '2023-04-21 14:38:01', 0),
('1gc7q8lgq8q2xq', '1gcct4lgonv27c', '1gc710lfdu4aez', NULL, 'Trạng thái hồ sơ ứng tuyển vị trí https://121212121 đã xem hồ sơ', '2023-04-21 14:38:57', 0),
('1gc7q8lgq8q5tc', '1gcct4lgonv27c', '1gc710lfdu4aez', NULL, 'Trạng thái hồ sơ ứng tuyển vị trí https://121212121 đã xem hồ sơ', '2023-04-21 14:39:01', 0),
('1gc7q8lgq8tokr', '1gcct4lgonv27c', '1gc710lfdu4aez', NULL, 'Trạng thái hồ sơ ứng tuyển vị trí https://121212121 đã xem hồ sơ', '2023-04-21 14:41:45', 0),
('1gc7q8lgq8uuja', '1gcct4lgonv27c', '1gc710lfdu4aez', NULL, 'Trạng thái hồ sơ ứng tuyển vị trí https://121212121 đã xem hồ sơ', '2023-04-21 14:42:40', 0),
('1gc7q8lgq957d1', '1gcct4lgonv27c', '1gc710lfdu4aez', NULL, 'Trạng thái hồ sơ ứng tuyển vị trí https://121212121 đã liên hệ', '2023-04-21 14:50:43', 0),
('1gc7q8lgq959pa', '1gcct4lgonv27c', '1gc710lfdu4aez', NULL, 'Trạng thái hồ sơ ứng tuyển vị trí https://121212121 đã liên hệ', '2023-04-21 14:50:46', 0),
('1gc7q8lgq95ctq', '1gcct4lgonv27c', '1gc710lfdu4aez', NULL, 'Trạng thái hồ sơ ứng tuyển vị trí https://121212121 đã xem hồ sơ', '2023-04-21 14:50:50', 0),
('1gc7q8lgq96v7o', '1gcct4lgonv27c', '1gc710lfdu4aez', NULL, 'Trạng thái hồ sơ ứng tuyển vị trí https://121212121 đã xem hồ sơ', '2023-04-21 14:52:00', 0),
('1gc7q8lgq988r9', '1gcct4lgonv27c', '1gc710lfdu4aez', NULL, 'Trạng thái hồ sơ ứng tuyển vị trí https://121212121 đã xem hồ sơ', '2023-04-21 14:53:05', 0),
('1gc7q8lgq98cex', '1gcct4lgonv27c', '1gc710lfdu4aez', NULL, 'Trạng thái hồ sơ ứng tuyển vị trí https://121212121 đã xem hồ sơ', '2023-04-21 14:53:09', 0),
('1gc7q8lgq9l3yh', '1gcct4lgonv27c', '1gc710lfdu4aez', NULL, 'Trạng thái hồ sơ ứng tuyển vị trí https://121212121 đã từ chối', '2023-04-21 15:03:05', 0),
('1gc7q8lgq9lejz', '1gcct4lgonv27c', '1gc710lfdu4aez', NULL, 'Trạng thái hồ sơ ứng tuyển vị trí https://121212121 đã từ chối', '2023-04-21 15:03:19', 0),
('1gc7q8lgq9nsjg', '1gcct4lgonv27c', '1gc710lfdu4aez', NULL, 'Trạng thái hồ sơ ứng tuyển vị trí https://121212121 đã xem hồ sơ', '2023-04-21 15:05:10', 0),
('1gc7q8lgq9ozeo', '1gcct4lgonv27c', '1gc710lfdu4aez', NULL, 'Trạng thái hồ sơ ứng tuyển vị trí https://121212121 đã từ chối', '2023-04-21 15:06:06', 0),
('1gc7q8lgq9v26f', '1gcct4lgonv27c', '1gc710lfdu4aez', NULL, 'Trạng thái hồ sơ ứng tuyển vị trí https://121212121 đã xem hồ sơ', '2023-04-21 15:10:49', 0),
('1gc7q8lgq9v3r6', '1gcct4lgonv27c', '1gc710lfdu4aez', NULL, 'Trạng thái hồ sơ ứng tuyển vị trí https://121212121 đã từ chối', '2023-04-21 15:10:51', 0),
('1gc7q8lgq9v5s3', '1gcct4lgonv27c', '1gc710lfdu4aez', NULL, 'Trạng thái hồ sơ ứng tuyển vị trí https://121212121 đã từ chối', '2023-04-21 15:10:54', 0),
('1gc7q8lgq9vl0s', '1gcct4lgonv27c', '1gc710lfdu4aez', NULL, 'Trạng thái hồ sơ ứng tuyển vị trí https://121212121 đã liên hệ', '2023-04-21 15:11:14', 0),
('1gc7q8lgq9xz8u', '1gcct4lgonv27c', '1gc710lfdu4aez', NULL, 'Trạng thái hồ sơ ứng tuyển vị trí https://121212121 đã xem hồ sơ', '2023-04-21 15:13:05', 0),
('1gc7q8lgq9zcux', '1gcct4lgonv27c', '1gc710lfdu4aez', NULL, 'Trạng thái hồ sơ ứng tuyển vị trí https://121212121 đã từ chối', '2023-04-21 15:14:10', 0),
('1gc7q8lgqaesa4', '1gcct4lgonv27c', '1gc710lfdu4aez', NULL, 'Trạng thái hồ sơ ứng tuyển vị trí https://121212121 đã liên hệ', '2023-04-21 15:26:09', 0),
('1gc7q8lgqaexwu', '1gcct4lgonv27c', '1gc710lfdu4aez', NULL, 'Trạng thái hồ sơ ứng tuyển vị trí https://121212121 đã từ chối', '2023-04-21 15:26:17', 0),
('1gc7q8lgqaf48h', '1gcct4lgonv27c', '1gc710lfdu4aez', NULL, 'Trạng thái hồ sơ ứng tuyển vị trí https://121212121 đã từ chối', '2023-04-21 15:26:25', 0);

-- --------------------------------------------------------

--
-- Table structure for table `profile_cv`
--

CREATE TABLE `profile_cv` (
  `id_user` varchar(100) NOT NULL,
  `id_type_current` varchar(100) NOT NULL,
  `id_type_desired` varchar(100) NOT NULL,
  `id_city` varchar(100) NOT NULL,
  `desired_salary` int(11) NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `career_goals` varchar(255) NOT NULL,
  `is_public` int(11) NOT NULL,
  `created_at` date NOT NULL,
  `file_cv` varchar(255) NOT NULL,
  `id_company_field` varchar(100) NOT NULL,
  `id_experience` varchar(100) NOT NULL,
  `id_working_form` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `profile_cv`
--

INSERT INTO `profile_cv` (`id_user`, `id_type_current`, `id_type_desired`, `id_city`, `desired_salary`, `file_name`, `career_goals`, `is_public`, `created_at`, `file_cv`, `id_company_field`, `id_experience`, `id_working_form`) VALUES
('1gc710lfdu4aez', 'CTV', 'QLCC', 'Bắc Giang', 1000001, 'INTER_WEB_BUIVANSY.pdf', 'sybuivan1429@gmail.com', 1, '2023-03-23', 'http://localhost:5000/1679579833085INTER_WEB_BUIVANSY.pdf', 'ITPC', '1N', 'TTG');

-- --------------------------------------------------------

--
-- Table structure for table `rangewage`
--

CREATE TABLE `rangewage` (
  `id_range` varchar(100) NOT NULL,
  `name_range` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `rangewage`
--

INSERT INTO `rangewage` (`id_range`, `name_range`) VALUES
('1T-3T', '1-3 triệu'),
('3T-6T', '3 - 6 triệu');

-- --------------------------------------------------------

--
-- Table structure for table `roleuser`
--

CREATE TABLE `roleuser` (
  `id_role` varchar(100) NOT NULL,
  `name_role` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `roleuser`
--

INSERT INTO `roleuser` (`id_role`, `name_role`) VALUES
('admin', 'Quản trị viên'),
('company', 'Nhà tuyển dụng'),
('user', 'Người dùng hệ thống');

-- --------------------------------------------------------

--
-- Table structure for table `room`
--

CREATE TABLE `room` (
  `id_user` varchar(100) NOT NULL,
  `id_company` varchar(100) NOT NULL,
  `id_room` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `room`
--

INSERT INTO `room` (`id_user`, `id_company`, `id_room`) VALUES
('1gc710lfdu4aez', '1gc3uklgomt0oc', '1gcct4lgonw77g');

-- --------------------------------------------------------

--
-- Table structure for table `savejob`
--

CREATE TABLE `savejob` (
  `id_user` varchar(100) NOT NULL,
  `id_job` varchar(100) NOT NULL,
  `created_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `typerank`
--

CREATE TABLE `typerank` (
  `id_rank` varchar(100) NOT NULL,
  `name_rank` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `typerank`
--

INSERT INTO `typerank` (`id_rank`, `name_rank`) VALUES
('CTV', 'Cộng tác viên'),
('QLCC', 'Quản lý cấp cao');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id_user` varchar(100) NOT NULL,
  `id_role` varchar(100) NOT NULL,
  `fullName` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(11) DEFAULT NULL,
  `id_experience` varchar(100) DEFAULT NULL,
  `gender` varchar(5) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `birthDay` date DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `city` varchar(100) NOT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `is_update_profle` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id_user`, `id_role`, `fullName`, `email`, `phone`, `id_experience`, `gender`, `password`, `birthDay`, `address`, `city`, `avatar`, `is_update_profle`) VALUES
('1gc3uklgomt0oc', 'company', 'Lê Thị Thảo', 'sybuivan1429@gmail.com', NULL, NULL, NULL, '$2b$10$G76AUGP4Wl3ndNpWPD7mmO2ykMjjaLLcXyFnQ5NNx28mM2CWjPULm', NULL, NULL, '', NULL, NULL),
('1gc710lfdu4aez', 'user', 'Bui Van Sy', 'sybuivan1429@gmail.com', '038911223', NULL, 'Nam', '$2b$10$jN/xfi0pduESBxnc9hILs.OOWUxt.jVnyz9/Xx2bIJMIoW7tCQ7vu', '1999-04-08', 'https://api', 'Bến Tre', 'http://localhost:5000/1679316128486IMG_4414.JPG', 1),
('1gcck0lg61fe1u', 'user', 'Tran Y Tien', 'tientran14@gmail.com', NULL, NULL, NULL, '$2b$10$H9AdfbN3nHIfLPEfM..6/eOtZ62Yi/SfmXS83vcC13uImJ8IRhGjG', NULL, NULL, '', NULL, NULL),
('1gcd88lgniqadt', 'user', 'Trần y Tiến', 'tranytien@gmail.com', NULL, NULL, NULL, '$2b$10$iB57I3mhq0fwBCMxYlenluTej5J1V2I49yEXjPVySjT26LbR/tZWW', NULL, NULL, '', NULL, NULL),
('1gcekslgeljvww', 'admin', 'Quản trị viên', 'admin123@gmail.com', NULL, NULL, NULL, '$2b$10$byb3b/SFnt/Exa/H0sPAmOxhVnWpDJYODhdVm4cv2bzfgqysR9Pka', NULL, NULL, '', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `working_form`
--

CREATE TABLE `working_form` (
  `id_working_form` varchar(100) NOT NULL,
  `name_working_form` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `working_form`
--

INSERT INTO `working_form` (`id_working_form`, `name_working_form`) VALUES
('TTG', 'Toàn thời gian'),
('TTS', 'Thực tập');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `apply`
--
ALTER TABLE `apply`
  ADD PRIMARY KEY (`id_apply`),
  ADD KEY `id_job` (`id_job`),
  ADD KEY `id_user` (`id_user`);

--
-- Indexes for table `chat`
--
ALTER TABLE `chat`
  ADD PRIMARY KEY (`id_chat`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_company` (`id_company`),
  ADD KEY `chat_ibfk_1` (`id_room`);

--
-- Indexes for table `city`
--
ALTER TABLE `city`
  ADD PRIMARY KEY (`id_city`);

--
-- Indexes for table `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`id_company`),
  ADD KEY `city` (`city`),
  ADD KEY `idCompanyField` (`idCompanyField`);

--
-- Indexes for table `companyfield`
--
ALTER TABLE `companyfield`
  ADD PRIMARY KEY (`id_companyField`);

--
-- Indexes for table `experience`
--
ALTER TABLE `experience`
  ADD PRIMARY KEY (`id_experience`);

--
-- Indexes for table `follow`
--
ALTER TABLE `follow`
  ADD PRIMARY KEY (`id_company`,`id_user`,`type_role`),
  ADD KEY `follow_ibfk_1` (`id_user`);

--
-- Indexes for table `job`
--
ALTER TABLE `job`
  ADD PRIMARY KEY (`id_job`),
  ADD KEY `id_experience` (`id_experience`),
  ADD KEY `id_city` (`city`),
  ADD KEY `id_company` (`id_company`),
  ADD KEY `id_field` (`id_field`),
  ADD KEY `id_range` (`id_range`),
  ADD KEY `id_type` (`id_type`),
  ADD KEY `id_working_form` (`id_working_form`);

--
-- Indexes for table `notification`
--
ALTER TABLE `notification`
  ADD PRIMARY KEY (`id_notification`),
  ADD KEY `notification_ibfk_1` (`id_apply`),
  ADD KEY `notification_ibfk_2` (`id_user`),
  ADD KEY `notification_ibfk_3` (`id_job`);

--
-- Indexes for table `profile_cv`
--
ALTER TABLE `profile_cv`
  ADD PRIMARY KEY (`id_user`),
  ADD KEY `id_city` (`id_city`),
  ADD KEY `id_type_current` (`id_type_current`),
  ADD KEY `id_type_desired` (`id_type_desired`),
  ADD KEY `id_company_field` (`id_company_field`),
  ADD KEY `id_experience` (`id_experience`),
  ADD KEY `id_working_form` (`id_working_form`);

--
-- Indexes for table `rangewage`
--
ALTER TABLE `rangewage`
  ADD PRIMARY KEY (`id_range`);

--
-- Indexes for table `roleuser`
--
ALTER TABLE `roleuser`
  ADD PRIMARY KEY (`id_role`);

--
-- Indexes for table `room`
--
ALTER TABLE `room`
  ADD PRIMARY KEY (`id_room`),
  ADD KEY `id_company` (`id_company`),
  ADD KEY `id_user` (`id_user`);

--
-- Indexes for table `savejob`
--
ALTER TABLE `savejob`
  ADD PRIMARY KEY (`id_user`,`id_job`),
  ADD KEY `savejob_ibfk_2` (`id_job`);

--
-- Indexes for table `typerank`
--
ALTER TABLE `typerank`
  ADD PRIMARY KEY (`id_rank`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`),
  ADD KEY `id_role` (`id_role`),
  ADD KEY `users_ibfk_2` (`id_experience`);

--
-- Indexes for table `working_form`
--
ALTER TABLE `working_form`
  ADD PRIMARY KEY (`id_working_form`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `apply`
--
ALTER TABLE `apply`
  ADD CONSTRAINT `apply_ibfk_1` FOREIGN KEY (`id_job`) REFERENCES `job` (`id_job`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `apply_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `chat`
--
ALTER TABLE `chat`
  ADD CONSTRAINT `chat_ibfk_1` FOREIGN KEY (`id_room`) REFERENCES `room` (`id_room`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `chat_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`),
  ADD CONSTRAINT `chat_ibfk_3` FOREIGN KEY (`id_company`) REFERENCES `company` (`id_company`);

--
-- Constraints for table `company`
--
ALTER TABLE `company`
  ADD CONSTRAINT `company_ibfk_2` FOREIGN KEY (`city`) REFERENCES `city` (`id_city`),
  ADD CONSTRAINT `company_ibfk_3` FOREIGN KEY (`idCompanyField`) REFERENCES `companyfield` (`id_companyField`),
  ADD CONSTRAINT `company_ibfk_4` FOREIGN KEY (`id_company`) REFERENCES `users` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `follow`
--
ALTER TABLE `follow`
  ADD CONSTRAINT `follow_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`) ON DELETE CASCADE,
  ADD CONSTRAINT `follow_ibfk_2` FOREIGN KEY (`id_company`) REFERENCES `company` (`id_company`) ON DELETE CASCADE;

--
-- Constraints for table `job`
--
ALTER TABLE `job`
  ADD CONSTRAINT `job_ibfk_1` FOREIGN KEY (`id_experience`) REFERENCES `experience` (`id_experience`),
  ADD CONSTRAINT `job_ibfk_2` FOREIGN KEY (`city`) REFERENCES `city` (`id_city`),
  ADD CONSTRAINT `job_ibfk_3` FOREIGN KEY (`id_company`) REFERENCES `company` (`id_company`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `job_ibfk_4` FOREIGN KEY (`id_field`) REFERENCES `companyfield` (`id_companyField`),
  ADD CONSTRAINT `job_ibfk_5` FOREIGN KEY (`id_range`) REFERENCES `rangewage` (`id_range`),
  ADD CONSTRAINT `job_ibfk_6` FOREIGN KEY (`id_type`) REFERENCES `typerank` (`id_rank`),
  ADD CONSTRAINT `job_ibfk_7` FOREIGN KEY (`id_working_form`) REFERENCES `working_form` (`id_working_form`);

--
-- Constraints for table `notification`
--
ALTER TABLE `notification`
  ADD CONSTRAINT `notification_ibfk_1` FOREIGN KEY (`id_apply`) REFERENCES `apply` (`id_apply`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `notification_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `notification_ibfk_3` FOREIGN KEY (`id_job`) REFERENCES `job` (`id_job`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `profile_cv`
--
ALTER TABLE `profile_cv`
  ADD CONSTRAINT `profile_cv_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`),
  ADD CONSTRAINT `profile_cv_ibfk_3` FOREIGN KEY (`id_type_current`) REFERENCES `typerank` (`id_rank`),
  ADD CONSTRAINT `profile_cv_ibfk_4` FOREIGN KEY (`id_type_desired`) REFERENCES `typerank` (`id_rank`),
  ADD CONSTRAINT `profile_cv_ibfk_5` FOREIGN KEY (`id_company_field`) REFERENCES `companyfield` (`id_companyField`),
  ADD CONSTRAINT `profile_cv_ibfk_6` FOREIGN KEY (`id_experience`) REFERENCES `experience` (`id_experience`),
  ADD CONSTRAINT `profile_cv_ibfk_7` FOREIGN KEY (`id_working_form`) REFERENCES `working_form` (`id_working_form`);

--
-- Constraints for table `room`
--
ALTER TABLE `room`
  ADD CONSTRAINT `room_ibfk_1` FOREIGN KEY (`id_company`) REFERENCES `company` (`id_company`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `room_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`);

--
-- Constraints for table `savejob`
--
ALTER TABLE `savejob`
  ADD CONSTRAINT `savejob_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `savejob_ibfk_2` FOREIGN KEY (`id_job`) REFERENCES `job` (`id_job`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`id_role`) REFERENCES `roleuser` (`id_role`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_2` FOREIGN KEY (`id_experience`) REFERENCES `experience` (`id_experience`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
