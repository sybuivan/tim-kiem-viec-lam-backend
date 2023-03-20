-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 20, 2023 at 01:53 PM
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
('1gc8r4lfgtaldb', '1gc2sklfgsmyyb', '1gc710lfdu4aez', 'http://localhost:5000/1679315842982INTER_WEB_BUIVANSY.pdf', '123', '2023-03-20', 0);

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
('1gc6i8lfgl229r', 'company', 'Công ty Tifo', 'test1@gmail.com', '10-150 người ', 'Được thành lập vào năm 2002 Công ty Cổ phần Maison (Maison) đã nhanh chóng trở thành một trong những công ty phân phối thời trang lớn nhất trong việc giới thiệu các thương hiệu thời trang cao cấp và sang trọng tại Việt Nam. Sau thành công ngoài mong đợi của cửa hàng đầu tiên, hiện Maison đang là ngôi nhà chung của hơn 18 thương hiệu đình đám. Dự báo sẽ có nhiều thương hiệu mới được ra mắt vào năm 2022, thổi vào thị trường Việt Nam những giấc mơ thời trang bất tận.\n\nMaison không chỉ lan tỏa văn hóa thời trang đa dạng mà còn mang đến một nền tảng thời trang giá trị, dịch vụ khách hàng, có trách nhiệm, để Việt Nam là điểm đến sành điệu cho tất cả các tín đồ thời trang.\n\nLợi Ích:\n\nMaison giúp phát huy tiềm năng của nhân viên trong cả sự nghiệp lẫn cuộc sống cá nhân, đồng thời tạo nền tảng vững chắc cho các kế hoạch dài hạn.\n\nĐổi Mới:\n\nMaison giao phó trách nhiệm cho bạn và khuyến khích những sáng tạo trong công việc, bởi đây chính là chìa khóa dẫn đến thành công.\n\nPhát Triển:\n\nNgoài các khóa đào tạo chuyên môn và kỹ năng mềm, môi trường làm việc đa dạng của Maison giúp bạn va chạm và tích lũy nhiều kinh nghiệm quý báu.\n\nLiên Kết:\n\nThông qua thời trang, chúng ta là một thể thống nhất. Maison khuyến khích các hoạt động vui chơi, giải trí, xây dựng đội nhóm và các cuộc thi để kết nối và giao lưu giữa các phòng ban.', 'http://localhost:5000/1679315818659log-tifi.jpg', '', 0, 0, 'http://localhost:5000/1679307135260bk_slide.png', 1, 'sybuivan1429@gmail.com', '$2b$10$.iaTsY9zQOimlok2VeHa0eLojpGPC0ltZnUQK4oVaq7Me2BSQTBI2', 'Pham Van Thien', '12121', 212, 'ITPC', 'Bình Phước');

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
  `id_user` varchar(100) NOT NULL,
  `id_company` varchar(100) NOT NULL,
  `created_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
  `id_rank` varchar(100) NOT NULL,
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

INSERT INTO `job` (`id_job`, `id_company`, `city`, `id_field`, `id_type`, `id_range`, `id_rank`, `id_experience`, `name_job`, `deadline`, `size_number`, `description_job`, `required_job`, `created_at`, `work_location`, `urgent_recruitment`, `id_working_form`, `benefits_job`) VALUES
('1gc2sklfgsmyyb', '1gc6i8lfgl229r', 'Bình Phước', 'ITPC', 'CTV', '1T-3T', '', '1N', 'Sỹ Bùi Văn', '2023-03-30', 1, '123', '123', '2023-03-20', 'http://localssd', 1, 'TTG', '12');

-- --------------------------------------------------------

--
-- Table structure for table `profile_cv`
--

CREATE TABLE `profile_cv` (
  `id_user` varchar(100) NOT NULL,
  `id_type_current` varchar(100) NOT NULL,
  `id_type_desired` varchar(100) NOT NULL,
  `id_city` varchar(100) NOT NULL,
  `id_rank` varchar(100) NOT NULL,
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

INSERT INTO `profile_cv` (`id_user`, `id_type_current`, `id_type_desired`, `id_city`, `id_rank`, `desired_salary`, `file_name`, `career_goals`, `is_public`, `created_at`, `file_cv`, `id_company_field`, `id_experience`, `id_working_form`) VALUES
('1gc710lfdu4aez', 'CTV', 'QLCC', '', '', 20000, 'INTER_WEB_BUIVANSY.pdf', '123', 0, '2023-03-20', 'http://localhost:5000/1679316499349INTER_WEB_BUIVANSY.pdf', 'ITPC', 'D1N', 'TTG');

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
('1gc710lfdu4aez', 'user', 'Bui Van Sy', 'sybuivan1429@gmail.com', 14241, NULL, 'Nam', '$2b$10$jN/xfi0pduESBxnc9hILs.OOWUxt.jVnyz9/Xx2bIJMIoW7tCQ7vu', '0000-00-00', 'https://api', 'Bến Tre', 'http://localhost:5000/1679316128486IMG_4414.JPG', 1);

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
  ADD KEY `id_user` (`id_user`),
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
-- Constraints for table `company`
--
ALTER TABLE `company`
  ADD CONSTRAINT `company_ibfk_1` FOREIGN KEY (`id_role`) REFERENCES `roleuser` (`id_role`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `company_ibfk_2` FOREIGN KEY (`city`) REFERENCES `city` (`id_city`),
  ADD CONSTRAINT `company_ibfk_3` FOREIGN KEY (`idCompanyField`) REFERENCES `companyfield` (`id_companyField`);

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
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`id_role`) REFERENCES `roleuser` (`id_role`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_2` FOREIGN KEY (`id_experience`) REFERENCES `experience` (`id_experience`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
