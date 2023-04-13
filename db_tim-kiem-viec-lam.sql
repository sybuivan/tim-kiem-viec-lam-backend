-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 11, 2023 at 05:51 AM
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
  `cv_file` varchar(255) NOT NULL,
  `introducing_letter` text NOT NULL,
  `created_at` date NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `apply`
--

INSERT INTO `apply` (`id_apply`, `id_job`, `id_user`, `cv_file`, `introducing_letter`, `created_at`, `status`) VALUES
('1gcbnslg9fbk3c', '1gc5b8lg62t3id', '1gc710lfdu4aez', '', '123', '2023-04-09', 0);

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
('1gc2pclg99dggt', '1gc4e8lg671ev7', '1gc710lfdu4aez', '144lfl8wp76', 'Chào sỹ. Chị là HR công ty Phạm Văn Thiên', '2023-04-09 17:25:03', 'user'),
('1gc2pclg99ehvt', '1gc4e8lg671ev7', '1gc710lfdu4aez', '144lfl8wp76', 'Chào sỹ. Chị là HR công ty Phạm Văn ThiênChào sỹ. Chị là HR công ty Phạm Văn ThiênChào sỹ. Chị là HR công ty Phạm Văn Thiên', '2023-04-09 17:25:51', 'user'),
('1gc2pclg99w0o4', '1gc4e8lg671ev7', '1gc710lfdu4aez', '144lfl8wp76', 'Hello', '2023-04-09 17:39:29', 'company'),
('1gc2pclg9bq7h8', '1gc4e8lg671ev7', '1gc710lfdu4aez', '144lfl8wp76', 'Chao', '2023-04-09 18:30:57', 'company'),
('1gc2pclg9bqg5i', '1gc4e8lg671ev7', '1gc710lfdu4aez', '144lfl8wp76', 'chaof', '2023-04-09 18:31:08', 'user'),
('1gc2pclg9bstmb', '1gc4e8lg671ev7', '1gc710lfdu4aez', '144lfl8wp76', 'Xin chao', '2023-04-09 18:32:59', 'user'),
('1gccnclgboat5d', '1gc4e8lg671ev7', '1gc710lfdu4aez', '144lfl8wp76', 'Chat', '2023-04-11 09:58:26', 'user'),
('1gccnclgbobi6l', '1gc4e8lg671ev7', '1gc710lfdu4aez', '144lfl8wp76', 'Chat tiep', '2023-04-11 09:58:58', 'company'),
('1gccnclgbobtfu', '1gc4e8lg671ev7', '1gc710lfdu4aez', '144lfl8wp76', 'Chat hah', '2023-04-11 09:59:13', 'user');

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
  `id_role` varchar(100) NOT NULL,
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
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `fullName` varchar(255) NOT NULL,
  `faxCode` varchar(255) NOT NULL,
  `phone` int(11) NOT NULL,
  `idCompanyField` varchar(100) NOT NULL,
  `city` varchar(155) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `company`
--

INSERT INTO `company` (`id_company`, `id_role`, `name_company`, `address`, `total_people`, `introduce`, `logo`, `link_website`, `lat`, `lng`, `cover_image`, `active_status`, `email`, `password`, `fullName`, `faxCode`, `phone`, `idCompanyField`, `city`) VALUES
('144lfl8wp76', 'company', 'Công ty Tifo', '192.168.2.3', '10-150 người ', '123', 'http://localhost:5000/1679669517043IMG_4414.JPG', '', 0, 0, 'http://localhost:5000/1679669517043IMG_4414.JPG', 1, 'sybuivan1429@gmail.com', '$2b$10$hDzwu2BtNGJ/Ze5bibmHyOxnzTzPczNrZ.bNa40RczSBBaHdJqB/m', 'HR Pham Van Thien', '20t1', 21, 'ITPM', 'Bắc Kạn');

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
('144lfl8wp76', '1gc710lfdu4aez', 'company', '2023-04-09'),
('144lfl8wp76', '1gcck0lg61fe1u', 'user', '2023-04-07');

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
('1gc5b8lg62t3id', '144lfl8wp76', 'Bình Phước', 'ITPM', 'CTV', '1T-3T', '1N', 'Lập trình viên Frontend(ReactJS)', '2023-04-20', 1, '123', '123', '2023-04-07', '123', 1, 'TTG', '123'),
('1gccnclgbnplzd', '144lfl8wp76', 'Đà Nẵng', 'ITPC', 'CTV', '1T-3T', '1N', 'Nhân Viên Tư Vấn Ngành Tài Chính', '2023-04-28', 12, '<ul><li>Giới thiệu, tư vấn khách hàng những thông tin về sản phẩm, dịch vụ tài chính theo data có sẵn</li><li>Tiếp nhận, hoàn thành hồ sơ vay, hướng dẫn thủ tục giải ngân cho khách hàng</li><li>Phát triển mối quan hệ khách hàng</li><li>Thời gian làm việc: 8h30 - 5h30: Thứ 2 - Thứ 6 &amp; sáng thứ 7</li><li>Địa chỉ làm việc: Toà nhà Pico - Số 20 Cộng Hoà, P.12, Q.Tân Bình</li></ul>', '<ul><li>Giới thiệu, tư vấn khách hàng những thông tin về sản phẩm, dịch vụ tài chính theo data có sẵn</li><li>Tiếp nhận, hoàn thành hồ sơ vay, hướng dẫn thủ tục giải ngân cho khách hàng</li><li>Phát triển mối quan hệ khách hàng</li><li>Thời gian làm việc: 8h30 - 5h30: Thứ 2 - Thứ 6 &amp; sáng thứ 7</li><li>Địa chỉ làm việc: Toà nhà Pico - Số 20 Cộng Hoà, P.12, Q.Tân Bình</li></ul>', '2023-04-11', 'TP.HCM', 1, 'TTG', '1'),
('1gccnclgbnrby5', '144lfl8wp76', 'Đà Nẵng', 'ITPC', 'CTV', '1T-3T', '1N', 'Nhân Viên Tư Vấn Ngành Tài Chính', '2023-04-28', 12, '<ul><li>Giới thiệu, tư vấn khách hàng những thông tin về sản phẩm, dịch vụ tài chính theo data có sẵn</li><li>Tiếp nhận, hoàn thành hồ sơ vay, hướng dẫn thủ tục giải ngân cho khách hàng</li><li>Phát triển mối quan hệ khách hàng</li><li>Thời gian làm việc: 8h30 - 5h30: Thứ 2 - Thứ 6 &amp; sáng thứ 7</li><li>Địa chỉ làm việc: Toà nhà Pico - Số 20 Cộng Hoà, P.12, Q.Tân Bình</li></ul>', '<ul><li>Giới thiệu, tư vấn khách hàng những thông tin về sản phẩm, dịch vụ tài chính theo data có sẵn</li><li>Tiếp nhận, hoàn thành hồ sơ vay, hướng dẫn thủ tục giải ngân cho khách hàng</li><li>Phát triển mối quan hệ khách hàng</li><li>Thời gian làm việc: 8h30 - 5h30: Thứ 2 - Thứ 6 &amp; sáng thứ 7</li><li>Địa chỉ làm việc: Toà nhà Pico - Số 20 Cộng Hoà, P.12, Q.Tân Bình</li></ul>', '2023-04-11', 'TP.HCM', 1, 'TTG', '1'),
('1gccnclgbnrcg9', '144lfl8wp76', 'Đà Nẵng', 'ITPC', 'CTV', '1T-3T', '1N', 'Nhân Viên Tư Vấn Ngành Tài Chính', '2023-04-28', 12, '<ul><li>Giới thiệu, tư vấn khách hàng những thông tin về sản phẩm, dịch vụ tài chính theo data có sẵn</li><li>Tiếp nhận, hoàn thành hồ sơ vay, hướng dẫn thủ tục giải ngân cho khách hàng</li><li>Phát triển mối quan hệ khách hàng</li><li>Thời gian làm việc: 8h30 - 5h30: Thứ 2 - Thứ 6 &amp; sáng thứ 7</li><li>Địa chỉ làm việc: Toà nhà Pico - Số 20 Cộng Hoà, P.12, Q.Tân Bình</li></ul>', '<ul><li>Giới thiệu, tư vấn khách hàng những thông tin về sản phẩm, dịch vụ tài chính theo data có sẵn</li><li>Tiếp nhận, hoàn thành hồ sơ vay, hướng dẫn thủ tục giải ngân cho khách hàng</li><li>Phát triển mối quan hệ khách hàng</li><li>Thời gian làm việc: 8h30 - 5h30: Thứ 2 - Thứ 6 &amp; sáng thứ 7</li><li>Địa chỉ làm việc: Toà nhà Pico - Số 20 Cộng Hoà, P.12, Q.Tân Bình</li></ul>', '2023-04-11', 'TP.HCM', 1, 'TTG', '1'),
('1gccnclgbnrcsy', '144lfl8wp76', 'Đà Nẵng', 'ITPC', 'CTV', '1T-3T', '1N', 'Nhân Viên Tư Vấn Ngành Tài Chính', '2023-04-28', 12, '<ul><li>Giới thiệu, tư vấn khách hàng những thông tin về sản phẩm, dịch vụ tài chính theo data có sẵn</li><li>Tiếp nhận, hoàn thành hồ sơ vay, hướng dẫn thủ tục giải ngân cho khách hàng</li><li>Phát triển mối quan hệ khách hàng</li><li>Thời gian làm việc: 8h30 - 5h30: Thứ 2 - Thứ 6 &amp; sáng thứ 7</li><li>Địa chỉ làm việc: Toà nhà Pico - Số 20 Cộng Hoà, P.12, Q.Tân Bình</li></ul>', '<ul><li>Giới thiệu, tư vấn khách hàng những thông tin về sản phẩm, dịch vụ tài chính theo data có sẵn</li><li>Tiếp nhận, hoàn thành hồ sơ vay, hướng dẫn thủ tục giải ngân cho khách hàng</li><li>Phát triển mối quan hệ khách hàng</li><li>Thời gian làm việc: 8h30 - 5h30: Thứ 2 - Thứ 6 &amp; sáng thứ 7</li><li>Địa chỉ làm việc: Toà nhà Pico - Số 20 Cộng Hoà, P.12, Q.Tân Bình</li></ul>', '2023-04-11', 'TP.HCM', 1, 'TTG', '1'),
('1gccnclgbnrd0j', '144lfl8wp76', 'Đà Nẵng', 'ITPC', 'CTV', '1T-3T', '1N', 'Nhân Viên Tư Vấn Ngành Tài Chính', '2023-04-28', 12, '<ul><li>Giới thiệu, tư vấn khách hàng những thông tin về sản phẩm, dịch vụ tài chính theo data có sẵn</li><li>Tiếp nhận, hoàn thành hồ sơ vay, hướng dẫn thủ tục giải ngân cho khách hàng</li><li>Phát triển mối quan hệ khách hàng</li><li>Thời gian làm việc: 8h30 - 5h30: Thứ 2 - Thứ 6 &amp; sáng thứ 7</li><li>Địa chỉ làm việc: Toà nhà Pico - Số 20 Cộng Hoà, P.12, Q.Tân Bình</li></ul>', '<ul><li>Giới thiệu, tư vấn khách hàng những thông tin về sản phẩm, dịch vụ tài chính theo data có sẵn</li><li>Tiếp nhận, hoàn thành hồ sơ vay, hướng dẫn thủ tục giải ngân cho khách hàng</li><li>Phát triển mối quan hệ khách hàng</li><li>Thời gian làm việc: 8h30 - 5h30: Thứ 2 - Thứ 6 &amp; sáng thứ 7</li><li>Địa chỉ làm việc: Toà nhà Pico - Số 20 Cộng Hoà, P.12, Q.Tân Bình</li></ul>', '2023-04-11', 'TP.HCM', 1, 'TTG', '1'),
('1gccnclgbnrd5u', '144lfl8wp76', 'Đà Nẵng', 'ITPC', 'CTV', '1T-3T', '1N', 'Nhân Viên Tư Vấn Ngành Tài Chính', '2023-04-28', 12, '<ul><li>Giới thiệu, tư vấn khách hàng những thông tin về sản phẩm, dịch vụ tài chính theo data có sẵn</li><li>Tiếp nhận, hoàn thành hồ sơ vay, hướng dẫn thủ tục giải ngân cho khách hàng</li><li>Phát triển mối quan hệ khách hàng</li><li>Thời gian làm việc: 8h30 - 5h30: Thứ 2 - Thứ 6 &amp; sáng thứ 7</li><li>Địa chỉ làm việc: Toà nhà Pico - Số 20 Cộng Hoà, P.12, Q.Tân Bình</li></ul>', '<ul><li>Giới thiệu, tư vấn khách hàng những thông tin về sản phẩm, dịch vụ tài chính theo data có sẵn</li><li>Tiếp nhận, hoàn thành hồ sơ vay, hướng dẫn thủ tục giải ngân cho khách hàng</li><li>Phát triển mối quan hệ khách hàng</li><li>Thời gian làm việc: 8h30 - 5h30: Thứ 2 - Thứ 6 &amp; sáng thứ 7</li><li>Địa chỉ làm việc: Toà nhà Pico - Số 20 Cộng Hoà, P.12, Q.Tân Bình</li></ul>', '2023-04-11', 'TP.HCM', 1, 'TTG', '1'),
('1gccnclgbnrdb5', '144lfl8wp76', 'Đà Nẵng', 'ITPC', 'CTV', '1T-3T', '1N', 'Nhân Viên Tư Vấn Ngành Tài Chính', '2023-04-28', 12, '<ul><li>Giới thiệu, tư vấn khách hàng những thông tin về sản phẩm, dịch vụ tài chính theo data có sẵn</li><li>Tiếp nhận, hoàn thành hồ sơ vay, hướng dẫn thủ tục giải ngân cho khách hàng</li><li>Phát triển mối quan hệ khách hàng</li><li>Thời gian làm việc: 8h30 - 5h30: Thứ 2 - Thứ 6 &amp; sáng thứ 7</li><li>Địa chỉ làm việc: Toà nhà Pico - Số 20 Cộng Hoà, P.12, Q.Tân Bình</li></ul>', '<ul><li>Giới thiệu, tư vấn khách hàng những thông tin về sản phẩm, dịch vụ tài chính theo data có sẵn</li><li>Tiếp nhận, hoàn thành hồ sơ vay, hướng dẫn thủ tục giải ngân cho khách hàng</li><li>Phát triển mối quan hệ khách hàng</li><li>Thời gian làm việc: 8h30 - 5h30: Thứ 2 - Thứ 6 &amp; sáng thứ 7</li><li>Địa chỉ làm việc: Toà nhà Pico - Số 20 Cộng Hoà, P.12, Q.Tân Bình</li></ul>', '2023-04-11', 'TP.HCM', 1, 'TTG', '1'),
('1gccnclgbnrdgc', '144lfl8wp76', 'Đà Nẵng', 'ITPC', 'CTV', '1T-3T', '1N', 'Nhân Viên Tư Vấn Ngành Tài Chính', '2023-04-28', 12, '<ul><li>Giới thiệu, tư vấn khách hàng những thông tin về sản phẩm, dịch vụ tài chính theo data có sẵn</li><li>Tiếp nhận, hoàn thành hồ sơ vay, hướng dẫn thủ tục giải ngân cho khách hàng</li><li>Phát triển mối quan hệ khách hàng</li><li>Thời gian làm việc: 8h30 - 5h30: Thứ 2 - Thứ 6 &amp; sáng thứ 7</li><li>Địa chỉ làm việc: Toà nhà Pico - Số 20 Cộng Hoà, P.12, Q.Tân Bình</li></ul>', '<ul><li>Giới thiệu, tư vấn khách hàng những thông tin về sản phẩm, dịch vụ tài chính theo data có sẵn</li><li>Tiếp nhận, hoàn thành hồ sơ vay, hướng dẫn thủ tục giải ngân cho khách hàng</li><li>Phát triển mối quan hệ khách hàng</li><li>Thời gian làm việc: 8h30 - 5h30: Thứ 2 - Thứ 6 &amp; sáng thứ 7</li><li>Địa chỉ làm việc: Toà nhà Pico - Số 20 Cộng Hoà, P.12, Q.Tân Bình</li></ul>', '2023-04-11', 'TP.HCM', 1, 'TTG', '1'),
('1gccnclgbnrdlp', '144lfl8wp76', 'Đà Nẵng', 'ITPC', 'CTV', '1T-3T', '1N', 'Nhân Viên Tư Vấn Ngành Tài Chính', '2023-04-28', 12, '<ul><li>Giới thiệu, tư vấn khách hàng những thông tin về sản phẩm, dịch vụ tài chính theo data có sẵn</li><li>Tiếp nhận, hoàn thành hồ sơ vay, hướng dẫn thủ tục giải ngân cho khách hàng</li><li>Phát triển mối quan hệ khách hàng</li><li>Thời gian làm việc: 8h30 - 5h30: Thứ 2 - Thứ 6 &amp; sáng thứ 7</li><li>Địa chỉ làm việc: Toà nhà Pico - Số 20 Cộng Hoà, P.12, Q.Tân Bình</li></ul>', '<ul><li>Giới thiệu, tư vấn khách hàng những thông tin về sản phẩm, dịch vụ tài chính theo data có sẵn</li><li>Tiếp nhận, hoàn thành hồ sơ vay, hướng dẫn thủ tục giải ngân cho khách hàng</li><li>Phát triển mối quan hệ khách hàng</li><li>Thời gian làm việc: 8h30 - 5h30: Thứ 2 - Thứ 6 &amp; sáng thứ 7</li><li>Địa chỉ làm việc: Toà nhà Pico - Số 20 Cộng Hoà, P.12, Q.Tân Bình</li></ul>', '2023-04-11', 'TP.HCM', 1, 'TTG', '1'),
('1gccnclgbnrdqv', '144lfl8wp76', 'Đà Nẵng', 'ITPC', 'CTV', '1T-3T', '1N', 'Nhân Viên Tư Vấn Ngành Tài Chính', '2023-04-28', 12, '<ul><li>Giới thiệu, tư vấn khách hàng những thông tin về sản phẩm, dịch vụ tài chính theo data có sẵn</li><li>Tiếp nhận, hoàn thành hồ sơ vay, hướng dẫn thủ tục giải ngân cho khách hàng</li><li>Phát triển mối quan hệ khách hàng</li><li>Thời gian làm việc: 8h30 - 5h30: Thứ 2 - Thứ 6 &amp; sáng thứ 7</li><li>Địa chỉ làm việc: Toà nhà Pico - Số 20 Cộng Hoà, P.12, Q.Tân Bình</li></ul>', '<ul><li>Giới thiệu, tư vấn khách hàng những thông tin về sản phẩm, dịch vụ tài chính theo data có sẵn</li><li>Tiếp nhận, hoàn thành hồ sơ vay, hướng dẫn thủ tục giải ngân cho khách hàng</li><li>Phát triển mối quan hệ khách hàng</li><li>Thời gian làm việc: 8h30 - 5h30: Thứ 2 - Thứ 6 &amp; sáng thứ 7</li><li>Địa chỉ làm việc: Toà nhà Pico - Số 20 Cộng Hoà, P.12, Q.Tân Bình</li></ul>', '2023-04-11', 'TP.HCM', 1, 'TTG', '1'),
('1gccnclgbnrdw7', '144lfl8wp76', 'Đà Nẵng', 'ITPC', 'CTV', '1T-3T', '1N', 'Nhân Viên Tư Vấn Ngành Tài Chính', '2023-04-28', 12, '<ul><li>Giới thiệu, tư vấn khách hàng những thông tin về sản phẩm, dịch vụ tài chính theo data có sẵn</li><li>Tiếp nhận, hoàn thành hồ sơ vay, hướng dẫn thủ tục giải ngân cho khách hàng</li><li>Phát triển mối quan hệ khách hàng</li><li>Thời gian làm việc: 8h30 - 5h30: Thứ 2 - Thứ 6 &amp; sáng thứ 7</li><li>Địa chỉ làm việc: Toà nhà Pico - Số 20 Cộng Hoà, P.12, Q.Tân Bình</li></ul>', '<ul><li>Giới thiệu, tư vấn khách hàng những thông tin về sản phẩm, dịch vụ tài chính theo data có sẵn</li><li>Tiếp nhận, hoàn thành hồ sơ vay, hướng dẫn thủ tục giải ngân cho khách hàng</li><li>Phát triển mối quan hệ khách hàng</li><li>Thời gian làm việc: 8h30 - 5h30: Thứ 2 - Thứ 6 &amp; sáng thứ 7</li><li>Địa chỉ làm việc: Toà nhà Pico - Số 20 Cộng Hoà, P.12, Q.Tân Bình</li></ul>', '2023-04-11', 'TP.HCM', 1, 'TTG', '1'),
('1gccnclgbnre1m', '144lfl8wp76', 'Đà Nẵng', 'ITPC', 'CTV', '1T-3T', '1N', 'Nhân Viên Tư Vấn Ngành Tài Chính', '2023-04-28', 12, '<ul><li>Giới thiệu, tư vấn khách hàng những thông tin về sản phẩm, dịch vụ tài chính theo data có sẵn</li><li>Tiếp nhận, hoàn thành hồ sơ vay, hướng dẫn thủ tục giải ngân cho khách hàng</li><li>Phát triển mối quan hệ khách hàng</li><li>Thời gian làm việc: 8h30 - 5h30: Thứ 2 - Thứ 6 &amp; sáng thứ 7</li><li>Địa chỉ làm việc: Toà nhà Pico - Số 20 Cộng Hoà, P.12, Q.Tân Bình</li></ul>', '<ul><li>Giới thiệu, tư vấn khách hàng những thông tin về sản phẩm, dịch vụ tài chính theo data có sẵn</li><li>Tiếp nhận, hoàn thành hồ sơ vay, hướng dẫn thủ tục giải ngân cho khách hàng</li><li>Phát triển mối quan hệ khách hàng</li><li>Thời gian làm việc: 8h30 - 5h30: Thứ 2 - Thứ 6 &amp; sáng thứ 7</li><li>Địa chỉ làm việc: Toà nhà Pico - Số 20 Cộng Hoà, P.12, Q.Tân Bình</li></ul>', '2023-04-11', 'TP.HCM', 1, 'TTG', '1'),
('1gccnclgbnre6e', '144lfl8wp76', 'Đà Nẵng', 'ITPC', 'CTV', '1T-3T', '1N', 'Nhân Viên Tư Vấn Ngành Tài Chính', '2023-04-28', 12, '<ul><li>Giới thiệu, tư vấn khách hàng những thông tin về sản phẩm, dịch vụ tài chính theo data có sẵn</li><li>Tiếp nhận, hoàn thành hồ sơ vay, hướng dẫn thủ tục giải ngân cho khách hàng</li><li>Phát triển mối quan hệ khách hàng</li><li>Thời gian làm việc: 8h30 - 5h30: Thứ 2 - Thứ 6 &amp; sáng thứ 7</li><li>Địa chỉ làm việc: Toà nhà Pico - Số 20 Cộng Hoà, P.12, Q.Tân Bình</li></ul>', '<ul><li>Giới thiệu, tư vấn khách hàng những thông tin về sản phẩm, dịch vụ tài chính theo data có sẵn</li><li>Tiếp nhận, hoàn thành hồ sơ vay, hướng dẫn thủ tục giải ngân cho khách hàng</li><li>Phát triển mối quan hệ khách hàng</li><li>Thời gian làm việc: 8h30 - 5h30: Thứ 2 - Thứ 6 &amp; sáng thứ 7</li><li>Địa chỉ làm việc: Toà nhà Pico - Số 20 Cộng Hoà, P.12, Q.Tân Bình</li></ul>', '2023-04-11', 'TP.HCM', 1, 'TTG', '1'),
('1gccnclgbnreca', '144lfl8wp76', 'Đà Nẵng', 'ITPC', 'CTV', '1T-3T', '1N', 'Nhân Viên Tư Vấn Ngành Tài Chính', '2023-04-28', 12, '<ul><li>Giới thiệu, tư vấn khách hàng những thông tin về sản phẩm, dịch vụ tài chính theo data có sẵn</li><li>Tiếp nhận, hoàn thành hồ sơ vay, hướng dẫn thủ tục giải ngân cho khách hàng</li><li>Phát triển mối quan hệ khách hàng</li><li>Thời gian làm việc: 8h30 - 5h30: Thứ 2 - Thứ 6 &amp; sáng thứ 7</li><li>Địa chỉ làm việc: Toà nhà Pico - Số 20 Cộng Hoà, P.12, Q.Tân Bình</li></ul>', '<ul><li>Giới thiệu, tư vấn khách hàng những thông tin về sản phẩm, dịch vụ tài chính theo data có sẵn</li><li>Tiếp nhận, hoàn thành hồ sơ vay, hướng dẫn thủ tục giải ngân cho khách hàng</li><li>Phát triển mối quan hệ khách hàng</li><li>Thời gian làm việc: 8h30 - 5h30: Thứ 2 - Thứ 6 &amp; sáng thứ 7</li><li>Địa chỉ làm việc: Toà nhà Pico - Số 20 Cộng Hoà, P.12, Q.Tân Bình</li></ul>', '2023-04-11', 'TP.HCM', 1, 'TTG', '1'),
('1gccnclgbnregx', '144lfl8wp76', 'Đà Nẵng', 'ITPC', 'CTV', '1T-3T', '1N', 'Nhân Viên Tư Vấn Ngành Tài Chính', '2023-04-28', 12, '<ul><li>Giới thiệu, tư vấn khách hàng những thông tin về sản phẩm, dịch vụ tài chính theo data có sẵn</li><li>Tiếp nhận, hoàn thành hồ sơ vay, hướng dẫn thủ tục giải ngân cho khách hàng</li><li>Phát triển mối quan hệ khách hàng</li><li>Thời gian làm việc: 8h30 - 5h30: Thứ 2 - Thứ 6 &amp; sáng thứ 7</li><li>Địa chỉ làm việc: Toà nhà Pico - Số 20 Cộng Hoà, P.12, Q.Tân Bình</li></ul>', '<ul><li>Giới thiệu, tư vấn khách hàng những thông tin về sản phẩm, dịch vụ tài chính theo data có sẵn</li><li>Tiếp nhận, hoàn thành hồ sơ vay, hướng dẫn thủ tục giải ngân cho khách hàng</li><li>Phát triển mối quan hệ khách hàng</li><li>Thời gian làm việc: 8h30 - 5h30: Thứ 2 - Thứ 6 &amp; sáng thứ 7</li><li>Địa chỉ làm việc: Toà nhà Pico - Số 20 Cộng Hoà, P.12, Q.Tân Bình</li></ul>', '2023-04-11', 'TP.HCM', 1, 'TTG', '1'),
('1gccnclgbnremi', '144lfl8wp76', 'Đà Nẵng', 'ITPC', 'CTV', '1T-3T', '1N', 'Nhân Viên Tư Vấn Ngành Tài Chính', '2023-04-28', 12, '<ul><li>Giới thiệu, tư vấn khách hàng những thông tin về sản phẩm, dịch vụ tài chính theo data có sẵn</li><li>Tiếp nhận, hoàn thành hồ sơ vay, hướng dẫn thủ tục giải ngân cho khách hàng</li><li>Phát triển mối quan hệ khách hàng</li><li>Thời gian làm việc: 8h30 - 5h30: Thứ 2 - Thứ 6 &amp; sáng thứ 7</li><li>Địa chỉ làm việc: Toà nhà Pico - Số 20 Cộng Hoà, P.12, Q.Tân Bình</li></ul>', '<ul><li>Giới thiệu, tư vấn khách hàng những thông tin về sản phẩm, dịch vụ tài chính theo data có sẵn</li><li>Tiếp nhận, hoàn thành hồ sơ vay, hướng dẫn thủ tục giải ngân cho khách hàng</li><li>Phát triển mối quan hệ khách hàng</li><li>Thời gian làm việc: 8h30 - 5h30: Thứ 2 - Thứ 6 &amp; sáng thứ 7</li><li>Địa chỉ làm việc: Toà nhà Pico - Số 20 Cộng Hoà, P.12, Q.Tân Bình</li></ul>', '2023-04-11', 'TP.HCM', 1, 'TTG', '1'),
('1gccnclgbnrerm', '144lfl8wp76', 'Đà Nẵng', 'ITPC', 'CTV', '1T-3T', '1N', 'Nhân Viên Tư Vấn Ngành Tài Chính', '2023-04-28', 12, '<ul><li>Giới thiệu, tư vấn khách hàng những thông tin về sản phẩm, dịch vụ tài chính theo data có sẵn</li><li>Tiếp nhận, hoàn thành hồ sơ vay, hướng dẫn thủ tục giải ngân cho khách hàng</li><li>Phát triển mối quan hệ khách hàng</li><li>Thời gian làm việc: 8h30 - 5h30: Thứ 2 - Thứ 6 &amp; sáng thứ 7</li><li>Địa chỉ làm việc: Toà nhà Pico - Số 20 Cộng Hoà, P.12, Q.Tân Bình</li></ul>', '<ul><li>Giới thiệu, tư vấn khách hàng những thông tin về sản phẩm, dịch vụ tài chính theo data có sẵn</li><li>Tiếp nhận, hoàn thành hồ sơ vay, hướng dẫn thủ tục giải ngân cho khách hàng</li><li>Phát triển mối quan hệ khách hàng</li><li>Thời gian làm việc: 8h30 - 5h30: Thứ 2 - Thứ 6 &amp; sáng thứ 7</li><li>Địa chỉ làm việc: Toà nhà Pico - Số 20 Cộng Hoà, P.12, Q.Tân Bình</li></ul>', '2023-04-11', 'TP.HCM', 1, 'TTG', '1');

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
('1gc710lfdu4aez', '144lfl8wp76', '1gc4e8lg671ev7');

-- --------------------------------------------------------

--
-- Table structure for table `savejob`
--

CREATE TABLE `savejob` (
  `id_user` varchar(100) NOT NULL,
  `id_job` varchar(100) NOT NULL,
  `created_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `savejob`
--

INSERT INTO `savejob` (`id_user`, `id_job`, `created_at`) VALUES
('1gc710lfdu4aez', '1gc5b8lg62t3id', '2023-04-09');

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
  `phone` int(11) DEFAULT NULL,
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
('1gc710lfdu4aez', 'user', 'Bui Van Sy', 'sybuivan1429@gmail.com', 14241, NULL, 'Nam', '$2b$10$jN/xfi0pduESBxnc9hILs.OOWUxt.jVnyz9/Xx2bIJMIoW7tCQ7vu', '2023-04-08', 'https://api', 'Bến Tre', 'http://localhost:5000/1679316128486IMG_4414.JPG', 1),
('1gcck0lg61fe1u', 'user', 'Tran Y Tien', 'tientran14@gmail.com', NULL, NULL, NULL, '$2b$10$H9AdfbN3nHIfLPEfM..6/eOtZ62Yi/SfmXS83vcC13uImJ8IRhGjG', NULL, NULL, '', NULL, NULL);

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
  ADD KEY `id_room` (`id_room`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_company` (`id_company`);

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
  ADD KEY `id_role` (`id_role`),
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
  ADD KEY `id_user` (`id_user`);

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
  ADD KEY `id_job` (`id_job`);

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
  ADD CONSTRAINT `chat_ibfk_1` FOREIGN KEY (`id_room`) REFERENCES `room` (`id_room`),
  ADD CONSTRAINT `chat_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`),
  ADD CONSTRAINT `chat_ibfk_3` FOREIGN KEY (`id_company`) REFERENCES `company` (`id_company`);

--
-- Constraints for table `company`
--
ALTER TABLE `company`
  ADD CONSTRAINT `company_ibfk_1` FOREIGN KEY (`id_role`) REFERENCES `roleuser` (`id_role`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `company_ibfk_2` FOREIGN KEY (`city`) REFERENCES `city` (`id_city`),
  ADD CONSTRAINT `company_ibfk_3` FOREIGN KEY (`idCompanyField`) REFERENCES `companyfield` (`id_companyField`);

--
-- Constraints for table `follow`
--
ALTER TABLE `follow`
  ADD CONSTRAINT `follow_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`),
  ADD CONSTRAINT `follow_ibfk_2` FOREIGN KEY (`id_company`) REFERENCES `company` (`id_company`);

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
  ADD CONSTRAINT `savejob_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`),
  ADD CONSTRAINT `savejob_ibfk_2` FOREIGN KEY (`id_job`) REFERENCES `job` (`id_job`);

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
