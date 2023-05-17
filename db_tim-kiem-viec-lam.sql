-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 13, 2023 at 04:11 AM
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
  `id_profile` varchar(100) DEFAULT NULL,
  `id_user` varchar(100) NOT NULL,
  `file_cv` varchar(255) NOT NULL,
  `introducing_letter` text NOT NULL,
  `created_at` date NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `apply`
--

INSERT INTO `apply` (`id_apply`, `id_job`, `id_profile`, `id_user`, `file_cv`, `introducing_letter`, `created_at`, `status`) VALUES
('1gc3wglhatjklf', '1gc2e0lhaekdrp', '1gc5holhar2fnt', '1gc5holhaquou5', '', 'Chao', '2023-05-06', 1),
('1gc3wglhbb59vq', '1gc5holhap28q6', NULL, '1gc710lfdu4aez', 'http://localhost:5000/1683336595361Fresher-Frontend-BuiVanSy.pdf', 'Chao nha tuyen dung', '2023-05-06', 2),
('1gc5holharb1d5', '1gc2e0lhafcs3a', '1gc5holhar2fnt', '1gc5holhaquou5', '', 'Xin Chao', '2023-05-05', 1),
('1gc7dslhj6cmvm', '1gc2e0lhafcs3a', '1gcggklhbkiy4k', '1gc710lfdu4aez', '', '122', '2023-05-11', 2),
('1gc8uglhem5zzv', '1gc5holhapx1yb', '1gcggklhbkiy4k', '1gc710lfdu4aez', '', 'Chaof', '2023-05-08', 0);

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
('123', '1234', '1gc3uklgomt0oc', '1gc5holhapoh73', '123', '2023-05-06 09:00:09', 'user'),
('1gc3wglhatcsy1', '1gc3wglhatcsvw', '1gc5holhaquou5', '1gc3uklgomt0oc', '\nChào bạn,\n\nTôi xin gửi lời chào thân ái đến bạn và cảm ơn bạn đã quan tâm đến công ty/chúng tôi. Chúng tôi rất trân trọng và đánh giá cao những nỗ lực của bạn trong việc tìm kiếm cơ hội nghề nghiệp mới.\n\nTôi rất vui khi nhận được CV của bạn và xem xét các kỹ năng và kinh nghiệm mà bạn có. Chúng tôi luôn tìm kiếm những người có năng lực và đam mê để tham gia cùng chúng tôi trong công việc. Chúng tôi sẽ xem xét và đánh giá CV của bạn kỹ lưỡng, và nếu có bất kỳ cơ hội nào phù hợp với kỹ năng và sở thích của bạn, chúng tôi sẽ liên hệ với bạn để thảo luận thêm về công việc.\n\nNếu bạn có bất kỳ câu hỏi nào về công ty/chúng tôi hoặc các cơ hội việc làm hiện có, đừng ngần ngại liên hệ với chúng tôi. Chúng tôi luôn sẵn sàng hỗ trợ bạn trong quá trình tìm kiếm việc làm và trả lời mọi thắc mắc của bạn.', '2023-05-06 00:11:53', 'company'),
('1gc3wglhbbdptg', '1gc3wglhbbdpt9', '1gc710lfdu4aez', '8z0lhalx9m5', '\nChào bạn,\n\nTôi xin gửi lời chào thân ái đến bạn và cảm ơn bạn đã quan tâm đến công ty/chúng tôi. \nChúng tôi rất trân trọng và đánh giá cao những nỗ lực của bạn trong việc tìm kiếm cơ hội nghề nghiệp mới.\n\nTôi rất vui khi nhận được CV của bạn và xem xét các kỹ năng và kinh nghiệm mà bạn có. Chúng tôi luôn tìm kiếm những người có năng lực \nvà đam mê để tham gia cùng chúng tôi trong công việc. Chúng tôi sẽ xem xét và đánh giá CV của bạn kỹ lưỡng, \nvà nếu có bất kỳ cơ hội nào phù hợp với kỹ năng và sở thích của bạn, chúng tôi sẽ liên hệ với bạn để thảo luận thêm về công việc.\n\nNếu bạn có bất kỳ câu hỏi nào về công ty/chúng tôi hoặc các cơ hội việc làm hiện có, đừng ngần ngại liên hệ với chúng tôi. \nChúng tôi luôn sẵn sàng hỗ trợ bạn trong quá trình tìm kiếm việc làm và trả lời mọi thắc mắc của bạn.', '2023-05-06 08:36:29', 'company'),
('1gc6zslgoojlq1', '1gcct4lgonw77g', '1gc710lfdu4aez', '1gc3uklgomt0oc', 'Chaooo', '2023-04-20 12:26:17', 'company'),
('1gc6zslgook8pz', '1gcct4lgonw77g', '1gc710lfdu4aez', '1gc3uklgomt0oc', 'Chaoo', '2023-04-20 12:26:46', 'user'),
('1gc8uglhem6n7b', '1gc3wglhatcsvw', '1gc5holhaquou5', '1gc3uklgomt0oc', 'as', '2023-05-08 16:02:13', 'company'),
('1gc8uglhem72p8', '1gc3wglhatcsvw', '1gc5holhaquou5', '1gc3uklgomt0oc', 'sdf', '2023-05-08 16:02:33', 'company'),
('1gc8uglhem738s', '1gc3wglhatcsvw', '1gc5holhaquou5', '1gc3uklgomt0oc', 'asd', '2023-05-08 16:02:34', 'company'),
('1gc8uglhem73sv', '1gc3wglhatcsvw', '1gc5holhaquou5', '1gc3uklgomt0oc', 'assd', '2023-05-08 16:02:35', 'company'),
('1gc8uglhem7a3d', '1gc3wglhatcsvw', '1gc5holhaquou5', '1gc3uklgomt0oc', 'fffffff', '2023-05-08 16:02:43', 'company'),
('1gc9bwlhfzh0h6', '1gc3wglhatcsvw', '1gc5holhaquou5', '1gc3uklgomt0oc', 'asd', '2023-05-09 15:01:58', 'company'),
('1gc9fwlhbmzvbt', '1gc3wglhatcsvw', '1gc5holhaquou5', '1gc3uklgomt0oc', 'sas', '2023-05-06 14:01:38', 'company'),
('1gc9fwlhbn007x', '1gcct4lgonw77g', '1gc710lfdu4aez', '1gc3uklgomt0oc', 'as', '2023-05-06 14:01:45', 'company'),
('1gcas4lgoo7ns5', '1gcct4lgonw77g', '1gc710lfdu4aez', '1gc3uklgomt0oc', 'Chaof', '2023-04-20 12:16:59', 'user'),
('1gcct4lgonw780', '1gcct4lgonw77g', '1gc710lfdu4aez', '1gc3uklgomt0oc', 'Xin Chao\n', '2023-04-20 12:08:05', 'company'),
('1gcggklhbiwfgb', '1gc3wglhbbdpt9', '1gc710lfdu4aez', '8z0lhalx9m5', 'dasher', '2023-05-06 12:06:59', 'user');

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
  `idCompanyField` varchar(100) NOT NULL,
  `city` varchar(155) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `company`
--

INSERT INTO `company` (`id_company`, `name_company`, `address`, `total_people`, `introduce`, `logo`, `link_website`, `lat`, `lng`, `cover_image`, `active_status`, `faxCode`, `idCompanyField`, `city`) VALUES
('1gc2holhitg82w', 'CÔNG TY CỔ PHẦN GIẢI PHÁP CÔNG NGHỆ DANATEQ', 'Số 26 Dương Trí Trạch, Phường An Hải Bắc, Quận Sơn Trà, Thành phố Đà Nẵng, Việt Nam', '10-150 người ', '', '', '', 0, 0, '', 1, '0402142269', 'ITPM', 'Đà Nẵng'),
('1gc3uklgomt0oc', 'Công ty DANATEQ', 'http://localhost', '10-150 người ', '<p><br></p><p>Được thành lập vào năm 2002 Công ty Cổ phần Maison (Maison) đã nhanh chóng trở thành một trong những công ty phân phối thời trang lớn nhất trong việc giới thiệu các thương hiệu thời trang cao cấp và sang trọng tại Việt Nam. Sau thành công ngoài mong đợi của cửa hàng đầu tiên, hiện Maison đang là ngôi nhà chung của hơn 18 thương hiệu đình đám. Dự báo sẽ có nhiều thương hiệu mới được ra mắt vào năm 2022, thổi vào thị trường Việt Nam những giấc mơ thời trang bất tận.</p><p><br></p><p>Maison không chỉ lan tỏa văn hóa thời trang đa dạng mà còn mang đến một nền tảng thời trang giá trị, dịch vụ khách hàng, có trách nhiệm, để Việt Nam là điểm đến sành điệu cho tất cả các tín đồ thời trang.</p><p><br></p><p><strong>Lợi Ích:</strong></p><p>Maison giúp phát huy tiềm năng của nhân viên trong cả sự nghiệp lẫn cuộc sống cá nhân, đồng thời tạo nền tảng vững chắc cho các kế hoạch dài hạn.</p><p><br></p><p><strong>Đổi Mới:</strong></p><p>Maison giao phó trách nhiệm cho bạn và khuyến khích những sáng tạo trong công việc, bởi đây chính là chìa khóa dẫn đến thành công.</p><p><br></p><p><strong>Phát Triển:</strong></p><p>Ngoài các khóa đào tạo chuyên môn và kỹ năng mềm, môi trường làm việc đa dạng của Maison giúp bạn va chạm và tích lũy nhiều kinh nghiệm quý báu.</p><p><br></p><p><strong>Liên Kết:</strong></p><p>Thông qua thời trang, chúng ta là một thể thống nhất. Maison khuyến khích các hoạt động vui chơi, giải trí, xây dựng đội nhóm và các cuộc thi để kết nối và giao lưu giữa các phòng ban.</p>', 'http://localhost:5000/1683293894827dana.png', 'http://localhost', 0, 0, 'http://localhost:5000/1683293894827dana.png', 1, '192.168.2.3', 'ITPC', 'Đà Nẵng'),
('1gc5holhapoh73', 'Công Ty Tài Chính TNHH Hd Saison', 'Tầng 3, Tòa nhà VIT, 519 Kim Mã, Quận Ba Đình, Hà Nội', 'Dưới 10 người ', '<p><br></p><p>Thành lập ngày 7 tháng 9 năm 2007, Công ty TNHH MTV Tài Chính Việt Société Générale (SGVF), tên ban đầu của HD SAISON, là công ty tài chính phi ngân hàng 100% vốn nước ngoài đầu tiên được Ngân hàng Nhà nước Việt Nam cấp giấy phép hoạt động với số vốn đầu tư lên đến 520 tỷ đồng. Mục tiêu hoạt động của SGVF là cung cấp những giải pháp tài chính trong lĩnh vực tiêu dùng cá nhân.</p><p><br></p><p>Tháng 10 / 2013, SGVF trực thuộc Ngân hàng TMCP Phát triển TP.HCM (\'HDBank\") và đổi tên thành Công ty Tài chính TNHH MTV Ngân hàng TMCP Phát triển TP.HCM, gọi tắt là HDFinance.</p><p><br></p><p>Năm 2014, HDFinance có mặt tại khắp 63 tỉnh thành Việt Nam và phục vụ hơn 750.000 lượt khách hàng. Tháng 4 / 2015, công ty ra mắt dịch vụ Du lịch đi trước, trả sau.</p>', 'http://localhost:5000/1683300598410log1.png', '', 0, 0, '', 1, '121212', 'KD', 'Hồ Chí Minh'),
('1gc5holhapzuw9', 'Abbott Việt Nam', 'số 18 Lũy Bán Bích, Phường Tân Thới Hòa, Quận Tân Phú, TP.HCM', '10-150 người ', '<p><br></p><p>Abbott Vietnam was established in the year 1995. Since then, IT has undergone extraordinary development and was soon perceived as one of the premier healthcare providers in the market.</p><p><br></p><p>Abbott International Nutrition- Trade Nutrition Division belongs to Abbott Laboratory. Our business is to distribute a wide range of nutritional products, such as: Formance, Isomil, Gain, Gain IQ, Grow, Grow School, Pediasure, Ensure, Glucerna and a new nutrilite named Advance IQ, including: Similac Mom, Similac Advance IQ, Gain Advance IQ, Gain Plus Advance IQ, Grow Advance IQ.</p><p><br></p><p>Abbott Vietnam provides a superior range of customer-focused healthcare solutions, built on credible science and values. Our diverse family of pharmaceutical, medical and nutritional products includes a broad range of</p>', 'http://localhost:5000/1683301114898Abbott.jpeg', '', 0, 0, '', 1, '120DS', 'KD', 'Hồ Chí Minh'),
('1gc5holhaq7j4l', 'Công ty Cổ Phần Vacxin Việt Nam', '98 Hoàng Văn Thụ Phường 9 Phú Nhuận', '10-150 người ', '<p>​<span style=\"color: rgb(65, 64, 69);font-size: 16px;background-color: rgb(250, 250, 255)\">Hệ thống tiêm chủng VNVC (thuộc Công ty Cổ phần Vacxin Việt Nam - Tập đoàn của Eco (TP.Hà Nội)) chính thức đi vào hoạt động từ tháng 6 năm 2017. Trong bối cảnh thế giới đang phải đương đầu với tình trạng biến đổi phức tạp của các chủng vi khuẩn gây bệnh cũng như sự thiếu hụt vắc xin tại Việt Nam như hiện nay, Hệ thống tiêm chủng VNVC ra đời nhằm cung cấp cho trẻ em Việt Nam những loại vắc xin có chất lượng tốt nhất cùng với hệ thống phòng tiêm chủng an toàn, hiện đại và cao cấp.</span>​<br></p>', 'http://localhost:5000/1683301452478vaxin.png', ' https://vnvc.vn', 0, 0, '', 1, '11AS', 'KD', 'Bình Dương'),
('1gc5holhaqext1', 'Công Ty Cổ Phần Dịch Vụ Thương Mại Tổng Hợp Wincommerce', 'Tầng 5, Mplaza SaiGon, số 39 Lê Duẩn - Phường Bến Nghé - Quận 1 - TP. Hồ Chí Minh', '10-150 người ', '<p>​<span style=\"color: rgb(65, 64, 69);font-size: 16px;background-color: rgb(250, 250, 255)\">WinMart và WinMart+ là 2 thương hiệu chuỗi bán lẻ thuộc tập đoàn Vingroup, tập đoàn kinh tế đa ngành hàng đầu ở Việt Nam và trong khu vực. Trên tinh thần phát triển bền vững, chuyên nghiệp, với phương châm “Vì chất lượng cuộc sống của mọi nhà”, hệ thống WinMart &amp; WinMart+ mang đến cho người tiêu dùng sự lựa chọn đa dạng về hàng hoá và dịch vụ, tính tiện ích, đáp ứng nhu cầu mua sắm từ bình dân đến cao cấp của khách hàng. Đặc biệt, khi mua sắm tại hệ thống WinMart và WinMart+, khách hàng còn nhận được nhiều giá trị vượt trội thông qua các hình thức khuyến mại, ưu đãi hấp dẫn.</span>​<br></p>', 'http://localhost:5000/1683302347821anh.png', '', 0, 0, 'http://localhost:5000/1683301801178la.png', 1, '13121', 'ITPM', 'Hồ Chí Minh'),
('1gc7kwlhilr5ep', 'Công ty một thành viên', '168.190.1.1', '10-150 người ', '', '', '', 0, 0, '', 1, '123', 'ITPM', 'Đà Nẵng'),
('1gcatolhfrlnwt', 'Asdfgh112@', 'Sỹ Bùi Văn', '150-300 người ', '', '', '', 0, 0, '', 1, 'tranvanphuc11@gmail.com', 'ITPM', 'Bình Dương'),
('8z0lhalx9m5', 'Công Ty Tài Chính TNHH MTV Quốc Tế Việt Nam Jaccs', 'ầng 15, Tòa nhà Centec, 72 -74 Nguyễn Thị Minh Khai, Phường Võ Thị Sáu, Quận 3, Thành Phố Hồ Chí Minh, Việt Nam', '10-150 người ', '<p>​<span style=\"color: rgb(65, 64, 69);font-size: 16px;background-color: rgb(250, 250, 255)\">JIVF mong muốn mang đến cho khách hàng các dịch vụ tài chính trả góp đáng tin cậy thông qua mạng lưới các cửa hàng thành viên. Mục tiêu của chúng tôi là phục vụ khách hàng nhanh chóng, hiệu quả và tiết kiệm chi phí với phong cách chuyên nghiệp.</span>​<br></p>', 'http://localhost:5000/1683295262897logoass.png', '', 0, 0, '', 1, 'KD01111', 'KD', 'Hồ Chí Minh');

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
('1gc3uklgomt0oc', '1gc710lfdu4aez', 'user', '2023-05-08'),
('1gc3uklgomt0oc', '1gcdt4lhiwvya4', 'user', '2023-05-11'),
('8z0lhalx9m5', '1gc710lfdu4aez', 'user', '2023-05-08');

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
  `id_working_form` varchar(100) NOT NULL,
  `benefits_job` text NOT NULL,
  `id_history` varchar(100) NOT NULL,
  `is_lock` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `job`
--

INSERT INTO `job` (`id_job`, `id_company`, `city`, `id_field`, `id_type`, `id_range`, `id_experience`, `name_job`, `deadline`, `size_number`, `description_job`, `required_job`, `created_at`, `work_location`, `id_working_form`, `benefits_job`, `id_history`, `is_lock`) VALUES
('1gc2e0lhaehizk', '1gc3uklgomt0oc', 'Bến Tre', 'KD', 'CTV', '3T-6T', '1N', 'Rạch Giá - Nhân Viên Bán Hàng Kiêm Thu Ngân Skechers', '2023-05-31', 1, '<p><br></p><p><strong>*Bán hàng:</strong></p><ul><li>Tuân Thủ việc chấp hành Nội quy lao động, các quy định, quy chế bán hàng, phục vụ khách hàng của Công ty.</li><li>Bán hàng đạt chỉ tiêu doanh số, đồng thời có những đề xuất, sang kiến nhằm đảm bảo đạt hoặc vượt chỉ tiêu doanh số do Công ty đặt ra.</li><li>Tư vấn bán hàng cho khách hàng trực tiếp sản phẩm đang đảm nhận</li><li>Vệ sinh quầy kệ, khu vực làm việc trong cửa hàng…</li></ul><p><br></p><p><strong>*Thu ngân:</strong></p><ul><li>Chịu trách nhiệm tính tiền, in hóa đơn cho khách hàng, ghi thông tin khách trên hóa đơn, thực hiện các thủ tục cần thiết nếu khách cần lấy hóa đơn đỏ.</li><li>Hoàn tất các thủ tục nộp tiền bán hàng theo quy định khi kết thúc ca</li><li>Gửi báo cáo doanh thu hàng ngày cho các bộ phận có liên quan (nếu có yêu cầu)</li><li>Giải đáp thắc mắc của khách hàng về các vấn đề liên quan đến quy trình tính tiền và thu tiền.</li></ul><p><br></p><p><strong>*Trưng bày:</strong></p><ul><li>Chịu trách nhiệm việc trưng bày trong cửa hàng, đảm bảo hàng hóa trưng bày đã có đầy đủ giá, xuất xứ hàng bán, alarm…</li><li>Chịu trách nhiệm bảo quản, quản lý dụng cụ trưng bày trong khu vực dành riêng</li><li>Đảm bảo trưng bày theo đúng chủ đề do hãng đưa ra, nếu không có đủ tất cả các sản phẩm trong chủ đề, đảm bảo sử dụng tối đa các sản phẩm đã được mua theo chủ đề. hay đổi trưng bày hàng hóa 1 tuần hoặc 2 tuần 1 lần (tùy theo từng nhãn hàng)</li><li>Thực hiện đúng tất cả những quy định của hãng về hướng dẫn trưng bày trong cửa hàng.</li></ul><p><br></p><p><strong>*Kiểm kho:</strong></p><ul><li>Đảm bảo kho hàng được sắp xếp đúng tiêu chuẩn theo yêu cầu, quy định của nhãn hàng</li><li>Chịu trách nhiệm kiểm, đếm hàng hóa nhập, xuất, tồn</li><li>Thực hiện luân chuyển hàng hóa giữa các kho của cửa hàng</li><li>Kiểm kho định kỳ theo quy định của Công ty</li><li>Bảo quản hàng hóa trong điều kiện tốt nhất</li></ul><p><br></p><p><strong>*Nơi làm việc:&nbsp;</strong>231 Nguyễn Trung Trực, P. Vĩnh Bảo, Rạch Giá, Kiên Giang</p>', '<ul><li>Độ tuổi 18 - 29 tuổi</li><li>Có kỹ năng tư vấn, chăm sóc và thấu hiểu tâm lý khách hàng</li><li>Am hiểu thời trang</li><li>Ưu tiên ứng viên có kinh nghiệm làm việc trong ngành thời trang, bán lẻ</li><li>Ngoại hình ưa nhìn</li><li>Có tinh thần trách nhiệm, làm việc nhóm tốt</li><li>Nhanh nhẹn, siêng năng</li></ul>', '2023-05-05', 'Kiên Giang, 231 Nguyễn Trung Trực, Rạch Giá', 'TTG', '<ul><li>Lương cứng + thưởng (theo doanh số)</li><li>Được hỗ trợ tiền cơm</li><li>Được hỗ trợ tiền gửi xe</li><li>Được công ty mua bảo hiểm tai nạn 24/24 sau 6 tháng làm việc</li><li>Đầy đủ chế độ theo Luật lao động (BHXH, BHYT, BTTN, .....)</li><li>Được đào tạo về nghiệp vụ, kỹ năng cần thiết để trở thành nhân viên chuyên nghiệp</li><li>Có nhiều cơ hội thăng tiến</li></ul>', '1N013167TY165484P', 0),
('1gc2e0lhaekdrp', '1gc3uklgomt0oc', 'Bình Thuận', 'ITPM', 'CTV', '1T-3T', '1N', '222', '2023-05-31', 12, '<p><u>123</u><br></p>', '<p>123</p>', '2023-05-05', '12', 'TTG', '<p>123</p>', '47X02375C4123950S', 0),
('1gc2e0lhafcs3a', '1gc3uklgomt0oc', 'Hà Nội', 'ITPC', 'QLCC', '1T-3T', '1N', 'Hà Nội - Nhân Viên IT (IT Support Service)', '2023-05-18', 3, '<p>1.Theo dõi hàng ngày với hoạt động của bộ phận trợ giúp công nghệ thông tin , quản lý, bảo trì máy tính để bàn, máy tính xách tay, máy in, và các thiết bị công nghệ thông tin</p><p>2.Hỗ trợ trực tiếp ở cấp độ 1 với khắc phục sự cố, xác định nguyên nhân gốc rễ của quản lý máy tính để bàn, viễn thông, máy ảnh, máy chấm công, máy họp trực tuyến, cửa hàng, hỗ trợ kho hàng, mạng Lan…Đảm bảo không có sự cố tương tự xảy ra trong tương lai và cũng đảm bảo rằng các sự cố được giải quyết theo tiêu chuẩn SLA đã thoả thuận</p><p>3.Quản lý và cập nhật các tài sản công nghệ thông tin (máy tính xách tay, máy tính để bàn, danh sách máy tính, máy in,…)</p><p>4.Chịu trách nhiệm hỗ trợ công nghệ thông tin tại trụ sở chính, nhà kho và các cửa hàng (mở cửa, đóng cửa, các vấn đề liên quan đến công nghệ thông tin ở các cửa hàng,…) ở khu vực phía Bắc</p><p>5.Thực hiện kế hoạch bảo trì các thiết bị công nghệ thông tin hàng năm cho khu vực phía Bắc</p><p>6.Phối hợp với các nhà cung cấp để kiểm tra và sửa chữa các thiết bị máy tính, và các thiết bị công nghệ thông tin,…</p><p>7.Báo cáo định kỳ cho trưởng bộ phận IT khu vực miền Bắc/ Quản lý bộ phận IT</p><p>8.Thực hiện các nhiệm vụ khác theo sự phân công của trưởng bộ phận IT khu vực miền Bắc/ Quản lý bộ phận IT</p>', '<p>- Tốt nghiệp Cao Đẳng, đại học về ngành CNTT, Điện tử viễn thông</p><p>- Có các kỹ năng về máy tính và thiết bị IT</p><p>- Giới tính: Nam</p><p>- Tuổi: 25-30</p>', '2023-05-05', 'Tòa nhà Phú Điền, 83A Lý Thường Kiệt, Hoàn Kiếm', 'TTG', '<p>Lương tháng 13, thưởng lễ tết, thưởng KPI theo tình hình doanh thu hàng năm, tăng lương 1 năm/lần</p><p>Chế độ BHXH theo quy định của Nhà nước, mua thêm bảo hiểm chăm sóc sức khoẻ Generali, công đoàn</p><p>Du lịch, team building, tiệc tất niên, mua hàng giảm giá,...</p>', '1N013167TY165484P', 0),
('1gc3wglhbbcly5', '8z0lhalx9m5', 'Đà Nẵng', 'KD', 'CTV', '3T-6T', '1N', 'Nhân Viên Bán Hàng Cửa Hàng Th - Truemart', '2023-05-31', 1, '<p>* MÔ TẢ CÔNG VIỆC\n<br>\n<br>- Chào đón, tư vấn và giới thiệu sản phẩm tới khách hàng\n<br>\n<br>- Tuân thủ nghiêm ngặt các tiêu chuẩn liên quan trưng bày và quản lý tồn kho.\n<br>\n<br>- Duy trì hình ảnh sạch sẽ, chuyên nghiệp, thân thiện bên trong và ngoài cửa hàng.\n<br>\n<br>- Thu ngân, kiểm kê hàng, giao hàng trong phạm vi quản lý\n<br>\n<br>- Xây dựng mối quan hệ tốt với khách hàng trong khu vực\n<br>\n<br>- Làm báo cáo ngày / tuần / tháng theo yêu cầu của quản lý.\n<br>\n<br>- Hỗ trợ giao hàng cho khách trong bán kính &lt; 5km<br></p>', '<p>* MÔ TẢ CÔNG VIỆC\n<br>\n<br>- Chào đón, tư vấn và giới thiệu sản phẩm tới khách hàng\n<br>\n<br>- Tuân thủ nghiêm ngặt các tiêu chuẩn liên quan trưng bày và quản lý tồn kho.\n<br>\n<br>- Duy trì hình ảnh sạch sẽ, chuyên nghiệp, thân thiện bên trong và ngoài cửa hàng.\n<br>\n<br>- Thu ngân, kiểm kê hàng, giao hàng trong phạm vi quản lý\n<br>\n<br>- Xây dựng mối quan hệ tốt với khách hàng trong khu vực\n<br>\n<br>- Làm báo cáo ngày / tuần / tháng theo yêu cầu của quản lý.\n<br>\n<br>- Hỗ trợ giao hàng cho khách trong bán kính &lt; 5km<br></p>', '2023-05-06', 'sybuivan1429@gmail.com', 'TTG', '<p>* MÔ TẢ CÔNG VIỆC\n<br>\n<br>- Chào đón, tư vấn và giới thiệu sản phẩm tới khách hàng\n<br>\n<br>- Tuân thủ nghiêm ngặt các tiêu chuẩn liên quan trưng bày và quản lý tồn kho.\n<br>\n<br>- Duy trì hình ảnh sạch sẽ, chuyên nghiệp, thân thiện bên trong và ngoài cửa hàng.\n<br>\n<br>- Thu ngân, kiểm kê hàng, giao hàng trong phạm vi quản lý\n<br>\n<br>- Xây dựng mối quan hệ tốt với khách hàng trong khu vực\n<br>\n<br>- Làm báo cáo ngày / tuần / tháng theo yêu cầu của quản lý.\n<br>\n<br>- Hỗ trợ giao hàng cho khách trong bán kính &lt; 5km<br></p>', '91S516717T292893B', 1),
('1gc5holhap28q6', '8z0lhalx9m5', 'Hồ Chí Minh', 'KD', 'CTV', '3T-6T', 'D1N', 'Trưởng Phòng Marketing (Tp.HCM)', '2023-05-31', 1, '<p><br></p><p>Tham gia cùng nhóm Online Marketing vào các công việc:</p><p><br></p><p>- Quản lý website của công ty</p><p>- Hoạch định các chiến dịch Online Marketing phục vụ tuyển sinh</p><p><br></p><p>- Lập kế hoạch và tổ chức thực hiện các chương trình, sự kiện, hoạt động truyền thông, quảng cáo trên Internet.</p><p><br></p><p>- Lên Plan và quản lý ngân sách, đánh giá hiệu quả chiến lược ads.</p><p><br></p><p>- Biết về quản trị Website phần hạ tầng bên dưới nền tảng code, landingpage, fttp</p><p><br></p><p>- Quản lý các kênh/công cụ Marketing Online: Email marketing, Banner Ads, Search engine marketing (SEM), SEO, Web analytics tools…</p><p>- Xây dựng hệ thống backlink SEO, các app liên quan khách hàng như CRM, chat, mail, MKT,…</p><p><br></p><p>- Giám sát, phân tích, đo lường hiệu quả các hoạt động Marketing Online</p><p><br></p><p>- Ưu tiên kinh nghiệm về chạy Facebook Ads</p>', '<p><br></p><p>- Có kiến thức và kinh nghiệm trong lĩnh vực marketing, truyền thông trên môi trường Internet và mạng xã hội Facebook. Hiểu biết về SEO, Adwords, Web Content Management.</p><p><br></p><p>- Am hiểu công việc Marketing.</p><p>- Có kinh nghiệm quản trị và vận hành web</p><p><br></p><p>- Ưu tiên ứng viên có kinh nghiệm làm việc trong lĩnh vực giáo dục đào tạo.</p><p><br></p><p>- Có tinh thần trách nhiệm, hiệu quả trong công việc</p><p><br></p><p>- Cởi mở, trung thực, nhiệt tình</p><p><br></p><p>- Khả năng diễn đạt ngắn gọn, rõ ràng, có tính thuyết phục cao</p><p><br></p><p>- Vi tính: thành thạo các ứng dụng văn phòng (MS Word, Excel, PowerPoint, Email, Internet)</p>', '2023-05-05', 'TP.HCM, Lê Tuấn Mậu, Quận 6', 'TTG', '<p><br></p><p>- Lương: 15 - 20 triệu/ tháng</p><p>- Làm việc trong môi trường chuyên nghiệp, hiện đại, trẻ, năng động và nhiều cơ hội thăng tiến</p><p>- Thu nhập cao, thưởng theo hiệu quả làm việc</p><p>- Các chế độ BHXH, BHYT theo quy định của Nhà nước</p>', '02T00165Y0689245U', 0),
('1gc5holhap4jjj', '8z0lhalx9m5', 'Bình Dương', 'KD', 'QLCC', '3T-6T', '1N', 'Nhân Viên Kế Toán (Accountant) 會計文員', '2023-05-31', 2, '<p><br></p><p><strong>工作地點 工作地點 / 工作地點：</strong></p><p>Khu công nghiệp Đất Cuốc, Xã Đất Cuốc, Huyện Bắc Tân Uyên, Tình Bình Dương</p><p><em>(Company offers shuttle transport at the Binh Duong area to the company )</em></p><p><em>公司提供到Binh Duong地區上下班班車服務</em></p><p>Công ty có xe đưa đón trong địa bàn Bình Dương.</p>', '<p><br></p><p><strong>Requirements 履歷要求 / Yêu cầu về hồ sơ</strong></p><ul><li>Education majoring in Accounting &amp; Finance</li><li>More than 2 years of accounting experience and knowledge of Vietnam’s overall financial accounting policies and systems</li><li>Supervise financial management reports, internal control and other accounting-related matters</li><li>Coordinate and carry out company budget management and financial analysis</li><li>Work conscientiously, independent, problem solving skills and good analytical skills</li><li>Excellent communication skills</li><li>Fluent in Vietnamese is a must (Written and Oral)</li><li>Fluent in either Chinese or English is a must (Written and Oral)</li><li>Proficient in both Chinese and English is an advantage</li><li>學歷主修會計、財務</li><li>&nbsp;2年以上會計經驗, 懂全盤會計, 了解熟識越南財務政策及體系</li><li>&nbsp;監督財務管理報告, 內部控制及其他會計相關事項</li><li>&nbsp;統籌開展公司預算管理、財務分析</li><li>&nbsp;工作認真,具獨立工作, 問題解決能力及良好分析能力</li><li>具良好溝通能力</li><li>必須精通越南語（書面和口語）</li><li>必須精通中文或英語（書面和口語）</li><li>精通中英文者優先</li><li>Trình độ học vấn chuyên ngành kế toán và tài chính</li></ul>', '2023-05-05', 'Khu công nghiệp Đất Cuốc, Xã Đất Cuốc, Tân Uyên', 'TTG', '<p><br></p><p><strong>Welfare 福利 / Quyền lợi</strong></p><p>- Attractive income, according to working capacity;</p><p><em>Thu nhập hấp dẫn, dựa theo năng lực làm việc.</em></p><p>&nbsp;</p><p>- On Site Dormitory Offer</p><p><em>Có ký túc xá trong khuôn viên công ty.</em></p><p>&nbsp;</p><p>- Flat Rental and Transport Subsidy</p><p><em>Có trợ cấp cho thuê chỗ ở và di chuyển.</em></p><p>&nbsp;</p><p>- Full regimes of social insurance, health insurance and unemployment insurance as prescribed by law;</p><p><em>Các chế độ bảo hiểm BHXH, BHYT, BHTN đầy đủ theo quy định pháp luật;</em></p>', '02T00165Y0689245U', 0),
('1gc5holhaps5o0', '1gc5holhapoh73', 'Hồ Chí Minh', 'KD', 'CTV', '3T-6T', '1N', 'Chuyên Viên Điều Phối - Phòng Điều Tra An Ninh', '2023-05-31', 1, '<p><br></p><p>﻿&nbsp;<strong>1.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</strong>Hỗ trợ kịp thời Chuyên viên điều tra An ninh/ Chuyên viên Phòng chống gian lận các thông tin phục vụ yêu cầu điều tra, xử lý gian lận.</p><p><strong>2.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</strong>Phân tích, tổng hợp, thống kê dữ liệu gian lận, làm đầu mối kết nối thông tin với các phòng ban trong công tác phòng chống gian lận.</p><p><strong>3.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</strong>Soạn thảo công văn, giấy tờ &amp; theo dõi tiến độ thực hiện các đề nghị sau khi có báo cáo kết quả điều tra.</p><p><strong>4.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</strong>Quản lý xây dựng data, lưu trữ hồ sơ, tài liệu điều tra &amp; các báo cáo của phòng điều tra An Ninh đảm bảo hệ thống cơ sở dữ liệu luôn chính xác, bảo mật và đồng nhất.</p><p><strong>5.&nbsp;&nbsp;&nbsp;&nbsp;</strong>Chịu trách nhiệm thực hiện công việc hành chính văn phòng, thực hiện các báo cáo nội bộ và các công việc khác theo yêu cầu của Trưởng phòng điều tra An ninh.</p>', '<p><br></p><p>•&nbsp;Đại học Tài chính ngân hàng/ Luật.</p><p>•&nbsp;Ưu tiên nếu có kinh nghiệm về các công việc liên quan ở cấp bậc tương đương.</p><p>⁕&nbsp;&nbsp;Có kỹ năng giao tiếp hiệu quả</p><p>⁕&nbsp;&nbsp;Kỹ năng giải quyết vấn đề và xử lý tình huống tốt.</p><p>⁕&nbsp;&nbsp;Kỹ năng làm việc nhóm.</p><p>⁕&nbsp;&nbsp;Có thể làm việc dưới áp lực cao.</p><p>⁕&nbsp;Sử dụng thành thạo vi tính văn phòng (Word, Excel, PowerPoint, Outlook, internet…).</p><p>⁕&nbsp;&nbsp;Kỹ năng trình bày và báo cáo rõ ràng, mạch lạch, cô đọng, đầy đủ thông tin.</p><p>⁕&nbsp;&nbsp;Có khả năng xử lý cùng lúc nhiều công việc với mức độ ưu tiên khác nhau.</p><p>⁕&nbsp;&nbsp;Ý thức được tầm quan trọng của các sự việc và hoàn thành các việc khẩn cấp trong thời gian cho phép.</p><p>⁕&nbsp;&nbsp;Có kỹ năng chủ động giải quyết vấn đề, tình huống đột xuất đảm bảo hiệu quả.</p>', '2023-05-05', '24C Phan Đăng Lưu, phường 6, quận Bình Thạnh, HCM', 'TTG', '<p><br></p><ul><li>Thử việc 100% mức&nbsp;lương;</li><li>Ký Hợp đồng Lao động chính thức;</li><li>Chế độ Bảo hiểm xã hội, Bảo hiểm thất nghiệp, Bảo hiểm y tế theo quy định Nhà nước sau 2 tháng thử việc;</li><li>Bảo hiểm tai nạn 24 / 24;</li><li>Khám sức khỏe định kỳ;</li><li>Được tham gia khóa đào tạo chuyên môn;</li><li>15 ngày phép / năm;</li><li>Lương tháng 13, thưởng và phụ cấp tùy theo từng vị tri</li></ul>', '2V047795D7665303F', 0),
('1gc5holhapvcch', '1gc5holhapoh73', 'Bạc Liêu', 'KD', 'CTV', '3T-6T', 'D1N', 'Nhân Viên Hỗ Trợ Thanh Toán Tại Địạ Bàn_Cà Mau, Bạc Liêu', '2023-05-31', 5, '<p><br></p><ul><li>Liên hệ trực tiếp với khách hàng trong khu vực được phân công để hướng dẫn thanh toán các khoản phí</li><li>Hỗ trợ giải đáp thắc mắc có liên quan đến quá trình thanh toán của khách hàng.</li><li>Kiểm tra và gửi yêu cầu hỗ trợ những trường hợp đặt biệt khi nhận được thông tin của khách hàng</li><li>Các công việc khác được giao</li></ul>', '<p><br></p><p>Trình độ học vấn: Tốt nghiệp Trung học phổ thông trở lên</p><p>Kỹ năng</p><p>- Kỹ năng giao tiếp</p><p>- Kỹ năng đàm phán</p><p>- Kỹ năng thuyết phục</p><p>- Kỹ năng vi tính văn phòng</p>', '2023-05-05', 'toàn tỉnh, Phước Long', 'TTG', '<p><br></p><p>- Lương tháng 13, thưởng theo thâm niên.</p><p>- Ký Hợp đồng Lao động chính thức sau 2 tháng thử việc.</p><p>- Chế độ Bảo hiểm xã hội, Bảo hiểm thất nghiệp, Bảo hiểm y tế theo quy định Nhà nước.</p><p>- Bảo hiểm tai nạn 24/24.</p><p>- Khám sức khỏe định kỳ.</p><p>- Nghỉ 15 ngày phép/năm.</p><p>- Các hoạt động teambuilding hàng năm, các khóa đào tạo phát triển</p>', '2V047795D7665303F', 0),
('1gc5holhapx1yb', '1gc5holhapoh73', 'Đồng Tháp', 'KD', 'QLCC', '3T-6T', '1N', 'Nhân Viên Hỗ Trợ Thanh Toán Tại Địạ Bàn_Sóc Trăng, Đồng Tháp', '2023-05-31', 2, '<p><br></p><ul><li>Liên hệ trực tiếp với khách hàng trong khu vực được phân công để hướng dẫn thanh toán các khoản phí</li><li>Hỗ trợ giải đáp thắc mắc có liên quan đến quá trình thanh toán của khách hàng.</li><li>Kiểm tra và gửi yêu cầu hỗ trợ những trường hợp đặt biệt khi nhận được thông tin của khách hàng</li><li>Các công việc khác được giao</li></ul>', '<p><br></p><p>Trình độ học vấn: Tốt nghiệp Trung học phổ thông trở lên</p><p>Kỹ năng</p><p>- Kỹ năng giao tiếp</p><p>- Kỹ năng đàm phán</p><p>- Kỹ năng thuyết phục</p><p>- Kỹ năng vi tính văn phòng</p>', '2023-05-05', 'toàn tỉnh, Cao Lãnh', 'TTG', '<p><br></p><p>- Lương tháng 13, thưởng theo thâm niên.</p><p>- Ký Hợp đồng Lao động chính thức sau 2 tháng thử việc.</p><p>- Chế độ Bảo hiểm xã hội, Bảo hiểm thất nghiệp, Bảo hiểm y tế theo quy định Nhà nước.</p><p>- Bảo hiểm tai nạn 24/24.</p><p>- Khám sức khỏe định kỳ.</p><p>- Nghỉ 15 ngày phép/năm.</p><p>- Các hoạt động teambuilding hàng năm, các khóa đào tạo phát triển</p>', '2V047795D7665303F', 0),
('1gc5holhaq2tle', '1gc5holhapzuw9', 'Sóc Trăng', 'KD', 'QLCC', '3T-6T', 'D1N', 'Giám Sát Bán Hàng Thị Trường (Npp Tx Ngã Năm, Sóc Trăng)', '2023-05-31', 2, '<p><br></p><p>Báo cáo cho: Quản lý bán hàng Vùng (RSM)</p><p>Kênh phân phối: Kênh Truyền Thống</p><p>Địa bàn phụ trách: Sóc Trăng (Thanh Trị + Ngã Năm), Hậu Giang (1/2 tỉnh), Kiên Giang (Giồng Riềng), Bạc Liêu (1 phần giáp ranh)</p><p><br></p><p>NHIỆM VỤ CHÍNH</p><p>- Lập kế hoạch &amp; phát triển hệ thống hoạt động kinh doanh tại khu vực bán hàng được giao theo định hướng của phòng kinh doanh.</p><p>- Lập danh sách khách hàng đúng, sắp xếp tuyến bán hàng chính xác cho salesmen trong khu vực phụ trách</p><p>- Nâng cấp và duy trì mối quan hệ chiến lược với điểm bán/khách hàng</p><p>- Kiểm tra công nợ của nhân viên bán hàng</p><p>- Thu thập thông tin đối thủ cạnh tranh</p><p>- Phân tích hiệu quả kinh doanh trên vốn đầu tư và theo dõi công nợ của NPP</p><p>- Giám sát hoạt động của từng nhân viên bán hàng đảm bảo hoàn thành kế hoạch, chỉ tiêu được giao</p><p>- Huấn luyện, hỗ trợ đội ngũ Salesmen đạt chỉ tiêu.</p><p>- Xử lý các vấn đề liên quan tới hoạt động kinh doanh tại khu vực được giao theo thẩm quyền quy định.</p><p>- Thực hiện các nhiệm vụ được giao khác có liên quan đến mục tiêu chung của Công ty</p>', '<p><br></p><p>- Tốt nghiệp Cao đẳng/ Đại học: Ưu tiên ngành kinh tế hoặc kinh doanh</p><p>- Có ít nhất 4 năm kinh nghiệm trong lĩnh vực kinh doanh trong lĩnh vực sữa / hàng tiêu dùng nhanh, có ít nhất 2 năm làm vị trí giám sát và đạt kết quả cao với đội ngũ khoảng 6 - 8 nhân viên</p><p>- Có khả năng xử lý, thực hiện hoạt động nhằm đạt chỉ tiêu thông qua các kỹ năng giám sát địa bàn, quản lý tuyến bán hàng, họp, giao tiếp, thương thuyết, làm việc nhóm, phục vụ khách hàng.</p><p>- Có khả năng nhận áp lực một cách tích cực, giao chỉ tiêu rõ ràng cho mỗi nhân viên và giúp nhân viên đạt chỉ tiêu</p>', '2023-05-05', 'Giáp Nhà Phân Phối ở Ngã Năm, Long Mỹ', 'TTG', '<p><br></p><p>- Lương: 20-30 Triệu ( Tùy theo năng lực của ứng viên)</p><p>- Kí hợp đồng chính thức với công ty</p><p>- Chính sách bảo hiểm, bảo hiểm chăm sóc cá nhân cao cấp</p><p>- Thưởng hoa hồng cạnh tranh trong ngành hàng</p><p>- Chương trình đào tạo tiêu chuẩn</p><p>- Cơ hội phát triển lên các vị trí cao hơn</p><p>- Laptop, công tác phí, đồng phục</p>', '6T9364086F863033V', 0),
('1gc5holhaq4bhk', '1gc5holhapzuw9', 'Hồ Chí Minh', 'KD', 'QLCC', '3T-6T', '1N', 'Nhân Viên Bán Hàng Thị Trường (Kênh GT) - Tp.HCM', '2023-05-31', 1, '<p><br></p><p><strong>• Số lượng tuyển: 3 vị trí (1 Tân Bình, 1 Q7-Nhà Bè, 1 Nhà Bè - Cần Giờ)</strong></p><p>• Lập kế hoạch kinh doanh để đạt mục tiêu về nhằm đáp ứng các mục tiêu của vùng quản lý thông qua việc thúc đẩy lưu lượng thị trường và tối ưu hóa sự sẵn có sản phẩm</p><p>• Thiết lập mối quan hệ với người bán lẻ và người bán buôn để khám phá các nhu cầu, tiếp nhận đơn hàng và tăng lượng sản phẩm tồn kho</p><p>• Thực hiện các cuộc chào hàng mỗi ngày để tăng số lượng đơn hàng, kiểm tra hàng tồn kho, và bảo đảm việc bán hàng thích hợp của mỗi khách hàng</p><p>• Quản lý công nợ của khách hàng</p><p>• Đàm phán hợp đồng với khách hàng để có được giải pháp đôi bên cùng có lợi nhằm đạt được mục tiêu đồng thời thỏa mãn các nhu cầu của khách hàng</p><p>• Bảo đảm các cửa hàng thực hiện bán hàng phù hợp với các kỳ vọng của Abbott nhằm tối đa hóa sự sẵn có sản phẩm và doanh số tiềm năng</p>', '<p><br></p><p>• Tốt nghiệp từ Trung Cấp trở lên</p><p>• Ưu tiên ứng viên có kinh nghiệm sale thị trường từ 6 tháng trở lên trong lĩnh vực FMCG/ ngành hàng tiêu dùng</p><p>• Yêu thích công việc bán hàng và dịch vụ khách hàng, kiên trì đạt được mục tiêu</p><p>• Chăm chỉ, chịu khó, không ngại di chuyển</p><p>• Tinh thần kỷ luật cao, cầu tiến trong công việc• Tốt nghiệp từ trung cấp trở lên</p><p>• Ưu tiên ứng viên có kinh nghiệm sale thị trường từ 6 tháng trở lên trong lĩnh vực FMCG/ ngành hàng tiêu dùng</p><p>• Yêu thích công việc bán hàng và dịch vụ khách hàng, kiên trì đạt được mục tiêu</p><p>• Chăm chỉ, chịu khó, không ngại di chuyển</p><p>• Tinh thần kỷ luật cao, cầu tiến trong công việc</p>', '2023-05-05', ' TP.HCM', 'TTG', '<p><br></p><p>- Đóng Bảo hiểm và hưởng mọi quyền lợi đầy đủ như luật định</p><p>- Môi trường làm việc chuyên nghiệp</p><p>- Được đào tạo bài bản và có cơ hội thăng tiến cao</p>', '6T9364086F863033V', 0),
('1gc5holhaqa9u8', '1gc5holhaq7j4l', 'Bạc Liêu', 'KD', 'QLCC', '3T-6T', '1N', 'Bác Sỹ Làm Việc Tại Tp.HCM - Bình Phước - Tiền Giang', '2023-05-31', 2, '<p><br></p><p>Tư vấn và khám sàng lọc cho khách hàng trước khi tiêm</p><p>- Chỉ định tiêm</p><p>- Cập nhật số liệu vào cơ sở dữ liệu quản lý tiêm chủng</p><p>- Xử lý tình huống phát sinh sau tiêm nếu có</p><p>- Thực hiện tư vấn theo đúng các tiêu chuẩn chuyên môn và quy định, quy trình chuyên môn</p>', '<p><br></p><p><strong>- Có Chứng Chỉ Hành Nghề (Nhi khoa, Y Học Dự Phòng, Nội/ Nội Tiết, Đa khoa, Sản khoa...)</strong></p><p>- Kinh nghiệm công tác chuyên môn trên 2 năm tại các bệnh viện, trung tâm y tế, phòng khám</p><p>- Biết sử dụng tin học văn phòng</p><p>- Có kỹ năng giao tiếp, tư vấn, làm việc độc lập, làm việc nhóm</p><p>- Ưu tiên có An Toàn Tiêm Chủng.</p>', '2023-05-05', 'Bình Phước,Tiền Giang,Ninh Thuận,Bạc Liêu', 'TTG', '<p><br></p><p>- Môi trường làm việc chuyên nghiệp, năng động, công bằng</p><p>- Thu nhập tương xứng với năng lực đóng góp</p><p>- Các chế độ BHXH, BHYT, BHTN đầy đủ</p><p>- Thưởng Lễ Tết, sinh nhật, hiếu hỉ...</p><p>- Một năm có 12 ngày phép</p><p>- Được đào tạo và trang bị đầy đủ các điều kiện làm việc</p><p>- Phụ cấp tiền cơm trưa</p>', '80R33567U5582534H', 0),
('1gc5holhaqcdoh', '1gc5holhaq7j4l', 'Bà Rịa - Vũng Tàu', 'ITPC', 'QLCC', '3T-6T', '1N', 'Bà Rịa Chuyên Viên IT', '2023-06-01', 1, '<p><br></p><p>- Cài đặt thiết bị, phần mềm của công ty.</p><p>- Hỗ trợ người dùng cuối sử dụng hệ thống CNTT hiệu quả, đảm bảo công việc</p><p>- Quản trị và vận hành hệ thống mạng LAN, WAN, máy chủ</p><p>- Sao lưu và phục hồi ứng dụng</p><p>- Theo dõi, kiểm kê các thiết bị CNTT; tổng hợp, đề xuất nhu cầu trang bị, mua sắm, đi thuê, bảo dưỡng, nâng cấp, sửa chữa, thanh lý các thiết bị CNTT</p><p>- Vận hành và theo dõi tình trạng của các phần mềm ứng dụng</p><p>- Quản lý, cập nhật phiên bản, vá lỗi các chương trình ứng dụng</p><p>- Báo cáo tổng hợp tình trạng các ứng dụng.</p><p>- Đóng góp ý kiến và phản ánh những khó khăn trong quá trình giao dịch để cải tiến quy trình tốt hơn.</p>', '<p><br></p><p>- Có ít nhất 1 năm kinh nghiệm IT Support.</p><p>- Tốt nghiệp chuyên ngành công nghệ thông tin.</p><p>- Có kiến thức và kinh nghiệm cơ bản về hệ thống mạng.</p><p>- Có kiến thức về hệ điều hành máy tính cá nhân, các dịch vụ hạ tầng Cisco, Firewall, Microsoft (DHCP, DNS,…) và các phần mềm văn phòng.</p><p>- Có khả năng giao tiếp, làm việc độc lập và làm việc theo nhóm.</p><p>- Có kiến thức về CSDL (SQL Server).</p>', '2023-05-05', 'KP1, P. Phước Hiệp, TP. Bà Rịa, T. BRVT, Bà Rịa', 'TTG', '<p><br></p><p>- Lương theo năng lực</p><p>- Được tham gia đầy đủ chế độ phúc lợi từ Công ty.</p><p>- Được quyền hưởng BHXH &amp; BHYT đầy đủ.</p><p>- Hưởng đầy đủ chính sách phúc lợi theo luật lao động</p><p>- Thưởng các dịp sinh nhật, lễ, tết.</p>', '80R33567U5582534H', 0),
('1gc5holhaqlub3', '1gc5holhaqext1', 'Hà Nội', 'ITPM', 'QLCC', '3T-6T', '1N', 'Nhân Viên SEO Web', '2023-05-31', 1, '<p><u>​</u></p><ul><li>Viết bài, quản lý website.</li><li>Quản lý kênh facebook, biên tập nội dung</li><li>Quảng bá thương hiệu công ty</li><li>Chi tiết công việc trao đổi khi phỏng vấn.</li><li>Làm việc tại: P501 Tòa nhà Vườn Đào - Số 689 LẠc Long Quân - Tây Hồ - Hà Nội</li></ul><p><br></p>', '<p><br></p><ul><li>Nghiêm túc, cầu tiến</li><li>Ưu tiên có kinh nghiệm trong ngành&nbsp;vận tải</li></ul>', '2023-05-05', 'Hà Nội', 'TTG', '<p><br></p><ul><li>Mức lương: thoả thuận theo năng lực khi phỏng vấn + hoa hồng theo doanh thu</li><li>Được tham gia BHXH, BHYT, BHTN đầy đủ theo quy định của nhà nước</li><li>Được hưởng các chế độ phúc lợi như: sinh nhật, ốm đau, kết hôn, tham quan nghỉ mát và các chế độ khác theo quy định của công ty và Nhà nước.</li><li>Thưởng tháng 13, phép năm đầy đủ.</li></ul>', '5AM13095RM173730G', 0),
('1gc5holhaqn5bv', '1gc5holhaqext1', 'Hà Nội', 'ITPM', 'CTV', '3T-6T', '1N', 'Nhân Viên Tuyển Sinh', '2023-05-31', 1, '<p><br></p><p>- Gọi điện, Liên hệ tới các đối tác của trường, các trường THPT, Trung cấp, Cao đẳng tại Hà Nội và vùng lân cận</p><p>- Tìm hiểu và phát triển thị trường tuyển sinh tại các Trường học cùng 2 chuyên viên khác</p><p>- Được trưởng nhóm Tuyển Sinh Đào tạo về ngoại giao, tư vấn</p><p>- Được đào tạo quy trình làm việc chi tiết</p><p>- Làm việc theo team 3-4 người: 2 Chuyên viên và Quản lý đi Tuyển sinh trực tiếp tại trường</p><p>- Gọi điện Tư vấn khóa học cho học viên quan tâm đến chương trình Đào tạo các ngành, nghề của trường</p><p>- Tư vấn khóa học, ngành học cho học viên, phụ huynh trực tiếp tại công ty và điểm tuyển sinh</p><p>- Làm thủ tục Nhập học cho học viên</p><p><strong>Thời gian làm việc:</strong>&nbsp;8:00-12:00 và 13:30-17:30 các ngày Thứ 2-7, trong tuần được nghỉ 1 chiều ngày thứ Bảy&nbsp;</p>', '<p><br></p><p>-&nbsp;<strong>T</strong>uổi từ 20 – 29 tuổi. Tốt nghiệp Trung cấp, Cao đẳng trở lên</p><p>- Tối thiểu 6 tháng kinh nghiệm về Telesales/ Bán hàng/ Tư vấn/Tiếp thị/Sales/Nhân Viên Kinh Doanh</p><p>- Ngoại hình nữ 1m57 trở lên, Nam 1m70 trở lên</p><p>- Giao tiếp tốt, thân thiện, không nói ngọng, nói lắp</p><p>- Làm việc độc lập và theo nhóm. Có khả năng chịu áp lực trong công việc</p><p>- Sẵn sàng làm việc linh động/thêm giờ</p>', '2023-05-05', 'Phường Nhân Chính, Quận Thanh Xuân, Thanh Xuân', 'TTG', '<p><br></p><p>- Lương thử việc: 8-10 triệu tùy khả năng.</p><p>- Lương chính thức: 10-25 tr/tháng. Thưởng nóng hàng tháng khi đạt từ 30 học viên/tháng trở lên.</p><p>- Tham gia BHXH, BHYT, BHTN khi ký HĐLĐ ngay sau thời gian thử việc</p><p>- Thưởng các dịp lễ, tết, lương tháng 13, thưởng theo kết quả hoạt động kinh doanh của Công ty.</p><p>- Môi trường làm việc chuyên nghiệp, văn hóa, năng động, thân thiện và cởi mở</p><p>- Phỏng vấn và đi làm ngay nếu đạt yêu cầu</p><p>- Cơ hội công việc ổn định và lâu dài.</p>', '5AM13095RM173730G', 0),
('1gc6x4lhanj9xv', '8z0lhalx9m5', 'Hồ Chí Minh', 'KD', 'CTV', '3T-6T', '1N', 'Nhân Viên Tư Vấn Kinh Doanh Oto Trả Góp_Kiên Giang', '2023-05-26', 5, '<p><br></p><p>- Thực hiện chỉ tiêu doanh số ô tô trong khu vực đảm nhiệm</p><p>- Tìm kiếm đối tác, cộng tác viên để phát triển doanh số vay mua</p><p>- Xây dựng mối quan hệ với showroom ô tô trong khu vực phụ trách</p><p>- Tìm kiếm khách hàng tiềm năng</p><p>- Tư vấn, làm hồ sơ khách hàng vay mua xe ô tô trả góp</p><p>- Thực hiện theo các quy định</p><p>- Thời gian thử việc: hưởng nguyên lương</p><p>- Thời gian làm việc: 8 giờ/ ngày, 5 ngày/ tuần&nbsp;</p><p><strong><em>* Làm việc tại các Cửa hàng xe Ô tô khu vực Phú Quốc_Kiên Giang</em></strong></p>', '<p>- Tốt nghiệp THPT trở lên<br></p><p>- Có kinh&nbsp;nghiệm trên 01 năm trong lãnh vực Tài Chính/ Ngân Hàng, kinh doanh ô tô</p><p>- Có xe máy và không ngại đi lại</p><p>- Có kỹ năng kinh doanh và marketing tốt</p><p>- Có khả năng giao tiếp tốt</p><p>- Tự tin&nbsp;</p>', '2023-05-05', ' Lầu 15, Tòa nhà Centec, 72-74 Nguyễn Thị Minh Khai, P Võ Thị Sáu, Q3,TP.HCM', 'TTG', '<p>-&nbsp;Được hưởng nguyên lương trong thời gian đào tạo và thử việc<br></p><p>- Thời gian làm việc: 8 giờ/ngày, 5 ngày/ tuần</p><p>- Được tham gia BHXH, BHYT &amp; BHTN đầy đủ</p><p>- Được Công ty mua Bảo hiểm tai nạn ngay ngày đầu tiên đi làm</p><p>- Thưởng thêm vào cuối năm</p><p>- Phép năm: 12 ngày và cộng thêm theo thâm niên</p>', '1YD56786HR888024X', 0),
('1gc8uglhahxd7p', '1gc3uklgomt0oc', 'Bình Thuận', 'KD', 'QLCC', '3T-6T', 'D1N', 'HCM - Giám Sát Cửa Hàng Thời Trang Cao Cấp', '2023-05-26', 3, '<p>* Doanh số:</p><p>- Chịu trách nhiệm quản lý doanh số cửa hàng, thực hiện các biện pháp đạt chỉ yêu được đề ra.</p><p>- Chia doanh số cá nhân cho nhân viên, theo dõi giám sát để đạt chỉ tiêu công ty đề ra.</p><p>- Có các kế hoạch bán hàng phù hợp cửa hàng.</p><p><br></p><p>* Quản lý sản phẩm:</p><p>- Chịu trách nhiệm quản lý hàng tồn kho, sự quay vòng hàng hóa cũng như việc mất mát, trộm cắp tại các cửa hàng phụ trách.</p><p>- Chịu trách nhiệm luân chuyển hàng hóa từ các kho phụ cũng như từ các cửa hàng khác về để đảm bảo có đủ hàng hóa, kích cỡ, màu sắc để bán và trưng bày.</p><p>- Thực hiện các phương cách nhằm ngăn chặn và giảm thiểu nạn trộm cắp hàng hóa từ bên ngoài và cả nội bộ.</p><p><br></p><p>* Quản lý hình ảnh nhãn hàng:</p><p>- Đảm bảo các cửa hàng luôn sạch sẽ, sắp xếp đúng tiêu chuẩn và trưng bày theo quy định trong suốt thời gian mở cửa. Không để máy laptop trên quầy cashier.</p><p>- Kiểm tra, theo dõi việc nhân viên trưng bày và thay windows hàng tuần theo hướng dẫn của hãng.</p><p><br></p><p>* Quản lý nhân viên:</p><p>* Nội bộ:</p><p>- Tuân thủ cũng như giám sát việc chấp hành Nội qui lao động, các qui định, qui chế bán hàng của Công ty đề ra đối với đội ngũ nhân viên bán hàng</p><p>- Huấn luyện, phổ biến cho tất cả nhân viên về các sản phẩm mới, kỹ năng bán hàng hiệu quả, chỉ dẫn trưng bày sản phẩm, kỹ năng chăm sóc khách hàng… theo yêu cầu của hãng đặt ra.</p><p>- Phân công công việc cho các bộ phận và nhân viên cấp dưới theo ngày, tuần</p><p>- Kiểm tra, phê duyệt lịch làm việc của nhân viên hàng tuần, trước khi gởi cho cấp trên</p><p>- Kiểm tra bảng chấm công hàng tuần, hàng tháng, trước khi gởi cho cấp trên - Theo dõi doanh thu cá nhân, có xác nhận của từng nhân viên trong cửa hàng để làm cơ sở tính thưởng và phụ cấp</p><p>* Bên ngoài:</p><p>- Luôn đảm bảo dịch vụ khách hàng tại hệ thống cửa hàng có chất lượng tốt nhất.</p><p>- Đảm bảo giải quyết ngay những phản hồi, than phiền của khách hàng</p><p><br></p><p>* Các công việc khác theo yêu cầu từ cấp trên trực tiếp.</p>', '<p>- Tốt nghiệp từ trung cấp trở lên.</p><p>- Sử dụng thành thạo Execel, Word,..</p><p>- Kinh nghiệm từ 01 năm trở lên tại vị trí tương đương các ngành bán lẻ.</p><p>- Có kinh nghiệm quản lý đội nhóm từ 5 - 10 người trở lên,</p><p>- Khả năng xử lý tình huống tốt</p><p>- Tiếng Anh giao tiếp tốt sẽ được ưu tiên.</p><p>- Chịu được áp lực công việc.</p><p>- Chấp nhận tăng ca làm việc.</p><p>- Thực hiện điều chuyển công tác từ 02 - 3 tháng/lần trong các quận có cửa hàng thuộc nhãn hàng.</p>', '2023-05-05', 'Vincom Đồng Khởi, SaiGon Center, Quận 1', 'TTG', '<p>- Lương cứng + thưởng (theo doanh số)</p><p>- Được hỗ trợ tiền cơm</p><p>- Được hỗ trợ tiền gửi xe</p><p>- Được công ty mua bảo hiểm tai nạn 24/24 sau 6 tháng làm việc</p><p>- Đầy đủ chế độ theo Luật lao động (BHXH, BHYT, BTTN, .....)</p><p>- Được đào tạo về nghiệp vụ, kỹ năng cần thiết để trở thành nhân viên chuyên nghiệp</p><p>- Có nhiều cơ hội thăng tiến.</p>', '7PK10048FX876522W', 0);

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
('1gc3wglhbb36k4', NULL, '1gc5holhaq7j4l', NULL, 'Bui Van Sy đang theo dõi bạn', '2023-05-06 08:28:17', 0),
('1gc3wglhbbe6lg', NULL, '1gc5holhaquou5', NULL, 'Công Ty Tài Chính TNHH MTV Quốc Tế Việt Nam Jaccs đang theo dõi bạn', '2023-05-06 08:36:51', 0),
('1gc3z0lhj511dv', '1gc3wglhatjklf', '1gc5holhaquou5', NULL, 'Trạng thái hồ sơ ứng tuyển vị trí 222 đã từ chối', '2023-05-11 20:00:49', 0),
('1gc3z0lhj511ef', '1gc5holharb1d5', '1gc5holhaquou5', NULL, 'Trạng thái hồ sơ ứng tuyển vị trí Hà Nội - Nhân Viên IT (IT Support Service) đã liên hệ', '2023-05-11 20:00:49', 0),
('1gc3z0lhj51r03', '1gc3wglhatjklf', '1gc5holhaquou5', NULL, 'Trạng thái hồ sơ ứng tuyển vị trí 222 đã từ chối', '2023-05-11 20:01:22', 0),
('1gc3z0lhj51r0r', '1gc5holharb1d5', '1gc5holhaquou5', NULL, 'Trạng thái hồ sơ ứng tuyển vị trí Hà Nội - Nhân Viên IT (IT Support Service) đã liên hệ', '2023-05-11 20:01:22', 0),
('1gc7x4lhj3rdoz', '1gc3wglhatjklf', '1gc5holhaquou5', NULL, 'Trạng thái hồ sơ ứng tuyển vị trí 222 đã xem hồ sơ', '2023-05-11 19:25:19', 0),
('1gc7x4lhj3rdpi', '1gc5holharb1d5', '1gc5holhaquou5', NULL, 'Trạng thái hồ sơ ứng tuyển vị trí Hà Nội - Nhân Viên IT (IT Support Service) đã từ chối', '2023-05-11 19:25:19', 0),
('1gc7x4lhj3s467', '1gc3wglhatjklf', '1gc5holhaquou5', NULL, 'Trạng thái hồ sơ ứng tuyển vị trí 222 đã từ chối', '2023-05-11 19:25:53', 0),
('1gc7x4lhj3uda8', '1gc3wglhatjklf', '1gc5holhaquou5', NULL, 'Trạng thái hồ sơ ứng tuyển vị trí 222 đã liên hệ', '2023-05-11 19:27:38', 0),
('1gc7x4lhj3udaf', '1gc5holharb1d5', '1gc5holhaquou5', NULL, 'Trạng thái hồ sơ ứng tuyển vị trí Hà Nội - Nhân Viên IT (IT Support Service) đã liên hệ', '2023-05-11 19:27:38', 0),
('1gc8holhj9cjbp', '1gc3wglhatjklf', '1gc5holhaquou5', NULL, 'Trạng thái hồ sơ ứng tuyển vị trí 222 đã liên hệ', '2023-05-11 22:01:44', 0),
('1gc8holhj9ec8y', '1gc3wglhatjklf', '1gc5holhaquou5', NULL, 'Trạng thái hồ sơ ứng tuyển vị trí 222 đã liên hệ', '2023-05-11 22:03:08', 0),
('1gc8holhj9ec9h', '1gc5holharb1d5', '1gc5holhaquou5', NULL, 'Trạng thái hồ sơ ứng tuyển vị trí Hà Nội - Nhân Viên IT (IT Support Service) đã liên hệ', '2023-05-11 22:03:08', 0),
('1gc8holhj9ec9r', '1gc7dslhj6cmvm', '1gc710lfdu4aez', NULL, 'Trạng thái hồ sơ ứng tuyển vị trí Hà Nội - Nhân Viên IT (IT Support Service) đã xem hồ sơ', '2023-05-11 22:03:08', 0),
('1gc8holhj9odwl', '1gc7dslhj6cmvm', '1gc710lfdu4aez', NULL, 'Trạng thái hồ sơ ứng tuyển vị trí Hà Nội - Nhân Viên IT (IT Support Service) đã xem hồ sơ', '2023-05-11 22:10:57', 0),
('1gc8holhj9pj3r', '1gc7dslhj6cmvm', '1gc710lfdu4aez', NULL, 'Trạng thái hồ sơ ứng tuyển vị trí Hà Nội - Nhân Viên IT (IT Support Service) đã xem hồ sơ', '2023-05-11 22:11:50', 0),
('1gc8holhj9rpsx', '1gc7dslhj6cmvm', '1gc710lfdu4aez', NULL, 'Trạng thái hồ sơ ứng tuyển vị trí Hà Nội - Nhân Viên IT (IT Support Service) đã xem hồ sơ', '2023-05-11 22:13:32', 0),
('1gc8uglhem5o78', NULL, '8z0lhalx9m5', NULL, 'Bui Van Sy đang theo dõi bạn', '2023-05-08 16:01:28', 0),
('1gc9fwlhbm9ltc', NULL, '1gc5holhaquou5', NULL, 'Công ty DANATEQ đang theo dõi bạn', '2023-05-06 13:41:13', 0),
('1gc9gwlhbm3esu', NULL, '1gc5holhaquou5', NULL, 'Công ty DANATEQ đang theo dõi bạn', '2023-05-06 13:36:24', 0),
('1gc9gwlhbm3mtw', NULL, '1gc5holhaquou5', NULL, 'Công ty DANATEQ đang theo dõi bạn', '2023-05-06 13:36:34', 0),
('1gc9gwlhbm4hpz', NULL, '1gc5holhaquou5', NULL, 'Công ty DANATEQ đang theo dõi bạn', '2023-05-06 13:37:14', 0),
('1gc9gwlhbm4p6c', NULL, '1gc5holhaquou5', NULL, 'Công ty DANATEQ đang theo dõi bạn', '2023-05-06 13:37:24', 0),
('1gc9gwlhbm68wh', NULL, '1gc5holhaquou5', NULL, 'Công ty DANATEQ đang theo dõi bạn', '2023-05-06 13:38:36', 0),
('1gcbg4lhj99cun', '1gc3wglhatjklf', '1gc5holhaquou5', NULL, 'Trạng thái hồ sơ ứng tuyển vị trí 222 đã liên hệ', '2023-05-11 21:59:16', 0),
('1gcggklhbkml9h', '1gc5holharb1d5', '1gc5holhaquou5', NULL, 'Trạng thái hồ sơ ứng tuyển vị trí Hà Nội - Nhân Viên IT (IT Support Service) đã từ chối', '2023-05-06 12:55:19', 0),
('1gcggklhbknkun', NULL, '1gc5holhaquou5', NULL, 'Công ty DANATEQ đang theo dõi bạn', '2023-05-06 12:56:06', 0),
('1gcggklhbknsv6', NULL, '1gc5holhaquou5', NULL, 'Công ty DANATEQ đang theo dõi bạn', '2023-05-06 12:56:16', 0),
('1gcggklhblhp5o', '1gc3wglhatjklf', '1gc5holhaquou5', NULL, 'Trạng thái hồ sơ ứng tuyển vị trí 222 đã xem hồ sơ', '2023-05-06 13:19:31', 0),
('1gcggklhbljzs4', NULL, '1gc5holhaquou5', NULL, 'Công ty DANATEQ đang theo dõi bạn', '2023-05-06 13:21:18', 0),
('1gcggklhblmq34', NULL, '1gc5holhaquou5', NULL, 'Công ty DANATEQ đang theo dõi bạn', '2023-05-06 13:23:25', 0),
('1gcggklhbln45f', NULL, '1gc5holhaquou5', NULL, 'Công ty DANATEQ đang theo dõi bạn', '2023-05-06 13:23:44', 0),
('1gcggklhblonw9', NULL, '1gc5holhaquou5', NULL, 'Công ty DANATEQ đang theo dõi bạn', '2023-05-06 13:24:56', 0),
('1gcj8lhj97t75', '1gc3wglhatjklf', '1gc5holhaquou5', NULL, 'Trạng thái hồ sơ ứng tuyển vị trí 222 đã liên hệ', '2023-05-11 21:58:04', 0);

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id_post` varchar(100) NOT NULL,
  `id_user` varchar(100) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `image` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `publishedAt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id_post`, `id_user`, `title`, `description`, `image`, `content`, `publishedAt`) VALUES
('1gc2holhiu9pzc', '1gcekslgeljvww', 'Đánh giá thử việc như thế nào để nhân viên mới tâm phục khẩu phục', 'Đánh giá thử việc là một giai đoạn quan trọng trong quá trình tuyển dụng nhân sự của mọi doanh nghiệp. Qua quá trình đánh giá, doanh nghiệp có cái nhìn tổng quan về năng lực, kinh nghiệm và thái độ làm việc của ứng viên, từ đó đưa ra quyết định tuyển dụng. Tuy nhiên, việc đánh giá nhân viên thử việc không hề đơn giản, đòi hỏi thực hiện chính xác và minh bạch. Trong bài viết dưới đây của Nghề Nghiệp Việc Làm 24h, chúng ta sẽ cùng tìm hiểu nhận xét đánh giá sau thử việc, các mẫu đánh giá thử việc cũng như bảng đánh giá nhân viên thử việc.', 'http://localhost:5000/1683791978923diem-chet-trong-ho-so-xin-viec5-min-696x392.jpg', '<p>​<span style=\"color: rgb(34, 34, 34);font-size: 15px\">Đánh giá thử việc là một giai đoạn quan trọng trong quá trình tuyển dụng&nbsp;</span><a href=\"https://vieclam24h.vn/viec-lam-nhan-su-o22.html?utm_source=blog&amp;utm_medium=organic&amp;utm_campaign=AWO_Blog_Organic_RE_danhgiathuviecnhuthenaodenhanvienmoitamphuckhauphuc_nghenghiep24h\" target=\"_blank\" rel=\"noreferrer noopener\">nhân sự</a><span style=\"color: rgb(34, 34, 34);font-size: 15px\">&nbsp;của mọi doanh nghiệp. Qua quá trình đánh giá, doanh nghiệp có cái nhìn tổng quan về năng lực, kinh nghiệm và thái độ làm việc của ứng viên, từ đó đưa ra quyết định tuyển dụng. Tuy nhiên, việc đánh giá nhân viên thử việc không hề đơn giản, đòi hỏi thực hiện chính xác và minh bạch. Trong bài viết dưới đây của&nbsp;</span><a href=\"https://nghenghiep.vieclam24h.vn/ki-ot-vui-ve/moon-phase-la-gi/?utm_source=blog&amp;utm_medium=organic&amp;utm_campaign=AWO_Blog_Organic_RE_danhgiathuviecnhuthenaodenhanvienmoitamphuckhauphuc_nghenghiep24h\" target=\"_blank\" rel=\"noreferrer noopener\">Nghề Nghiệp Việc Làm 24h</a><span style=\"color: rgb(34, 34, 34);font-size: 15px\">, chúng ta sẽ cùng tìm hiểu nhận xét đánh giá sau thử việc, các mẫu đánh giá thử việc cũng như bảng đánh giá nhân viên thử việc.</span>​<br></p>', '2023-05-01 15:57:06'),
('1gc6d0lhij0q6s', '1gcekslgeljvww', 'Ứng viên cần tránh ngay những điểm chết trong hồ sơ xin việc phổ biến sau!', 'Hồ sơ tìm việc là công cụ tốt nhất giúp bạn làm nổi bật kinh nghiệm làm việc, trình độ học vấn và những kỹ năng chuyên môn liên quan. Những thông tin gói gọn về con người bạn trong từ 1-2 trang A4 sẽ quyết định bạn có được gọi phỏng vấn hay không. Do đó, để gia tăng cơ hội được mời phỏng vấn, các ứng viên cần tránh ngay Ứng viên cần tránh ngay những điểm chết trong hồ sơ xin việc phổ biến mà Nghề Nghiệp Việc Làm 24h bật mí sau đây.', 'http://localhost:5000/1683777333215diem-chet-trong-ho-so-xin-viec5-min-696x392.jpg', '<p>​<span style=\"color: rgb(34, 34, 34);font-size: 15px\">Hồ sơ tìm việc là công cụ tốt nhất giúp bạn làm nổi bật kinh nghiệm làm việc, trình độ học vấn và những kỹ năng chuyên môn liên quan. Những thông tin gói gọn về con người bạn trong từ 1-2 trang A4 sẽ quyết định bạn có được gọi phỏng vấn hay không. Do đó, để gia tăng cơ hội được mời phỏng vấn, các ứng viên cần tránh ngay Ứng viên cần tránh ngay những điểm chết trong hồ sơ xin việc phổ biến mà&nbsp;</span><a href=\"https://nghenghiep.vieclam24h.vn/ki-ot-vui-ve/moon-phase-la-gi/?utm_source=blog&amp;utm_medium=organic&amp;utm_campaign=AWO_Blog_Organic_JS_ungviencantranhngaynhungdiemchettronghosoxinviecphoviensau_nghenghiep24h\" target=\"_blank\" rel=\"noreferrer noopener\">Nghề Nghiệp Việc Làm 24h</a><span style=\"color: rgb(34, 34, 34);font-size: 15px\">&nbsp;bật mí sau đây.</span>​</p>', '2023-05-02 00:00:00'),
('1gcbdwlhikmtqw', '1gcekslgeljvww', 'Có nên đi xuất khẩu lao động? 7 thị trường XKLĐ tốt nhất hiện nay', 'Xuất khẩu lao động (XKLĐ) Nhật Bản, Đài Loan, Hàn Quốc… đang là lựa chọn của nhiều người để tích luỹ vốn và kinh nghiệm để xây dựng sự nghiệp và cuộc sống riêng. Có nên đi xuất khẩu lao động? Đâu là thị trường XKLĐ tốt nhất hiện nay? Cùng Nghề Nghiệp Việc Làm 24h tìm hiểu kỹ hơn về XKLĐ qua bài viết nhé!', 'http://localhost:5000/1683793684534diem-chet-trong-ho-so-xin-viec5-min-696x392.jpg', '<h3><strong><em>Xuất khẩu lao động Đức</em></strong></h3><p>XKLĐ Đức là thị trường mới thu hút người lao động Việt Nam bởi mức thu nhập cao và nhiều chính sách tốt cho phép người lao động có cơ hội nhập quốc tịch.&nbsp;</p><p>Trước đây, tại Đức chỉ có chương trình tuyển dụng điều dưỡng do Bộ Lao động – Thương binh &amp; Xã hội quản lý. Hiện nay, chính phủ Đức đã mở cửa thêm cho lao động nhiều ngành nghề như: khách sạn nhà hàng, đầu bếp, xây dựng…</p><p>Chi phí đi XKLĐ tại Đức là khoảng 9.000 EURO (tương đương khoảng 230 triệu đồng) gồm phí nộp hồ sơ, học tiếng, phí phỏng vấn… Mức lương người lao động nhận được khi làm việc tại Đức là khoảng 2.300 EURO đến 3.200 EURO mỗi tháng chưa tính tiền làm thêm, tăng ca. Sau khi trừ đi sinh hoạt phí, mức lương trung bình có thể tiết kiệm là từ 55 triệu đồng đến 65 triệu đồng mỗi tháng.&nbsp;</p><p><br></p><h3><strong><em>Xuất khẩu lao động Singapore</em></strong></h3><p>Singapore là thị trường XKLĐ được đánh giá khó tính và đòi hỏi nhân sự có trình độ cao, điều kiện tuyển dụng bằng từ trung cấp trở lên, trong khi các thị trường khác chỉ cần tốt nghiệp THPT.&nbsp;</p><p>Những ngành nghề XKLĐ tại quốc đảo này phổ biến gồm: nông nghiệp, xây dựng, lâm nghiệp, chế biến thuỷ sản, hải sản…</p><p>Mức lương tùy theo ngành nghề giao động từ 1.200 SGD đến 1.700SGD mỗi tháng (tương đương 19 triệu đến 30 triệu đồng) chưa tính làm thêm giờ hoặc tăng ca. Mức sinh hoạt phí tại đây cũng tương đối đắt đỏ, dao động từ 400 $ đến 600 $ mỗi tháng (tương đương 9,3 triệu đến 14 triệu đồng).</p><p>Hiện nay, ngoài Bộ Lao động- Thương binh &amp; Xã hội có rất ít công ty được phép tuyển dụng XKLĐ đi Singapore. Do đó, người lao động cần tìm hiểu kỹ trước khi lựa chọn.&nbsp;</p><p><br></p><h3><strong><em>Xuất khẩu lao động Canada</em></strong></h3><p>Những năm gần đây, thị trường Canada ngày càng mở rộng, thu hút nhiều người lao động từ nước ngoài tới làm việc theo các chương trình XKLĐ. Nhiều ngành nghề cần nhân lực tại Canada như: nông nghiệp, cơ khí, xây dựng, điện tử, chế biến thực phẩm…</p><p>Mức lương theo giờ tại Canada tương đối cao, từ 16 CAD đến 43 CAD (tương đương 360.000 đồng đến 790.000 đồng). Do đó, mức lương làm việc trung bình tháng tại Canada cũng rất cao, trung bình từ 2.600 CAD đến 70.000 CAD (tương đương 50 triệu đến 130 triệu đồng) tuỳ theo ngành nghề và trình độ chuyên môn.&nbsp;</p><p>Tuy nhiên, thị trường xuất khẩu lao động Canada đòi hỏi những tiêu chuẩn tương đối cao và khắt khe cũng như cần nhiều loại giấy phép.&nbsp;</p>', '2023-01-01 15:57:22');

-- --------------------------------------------------------

--
-- Table structure for table `profile_cv`
--

CREATE TABLE `profile_cv` (
  `id_profile` varchar(100) NOT NULL,
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

INSERT INTO `profile_cv` (`id_profile`, `id_user`, `id_type_current`, `id_type_desired`, `id_city`, `desired_salary`, `file_name`, `career_goals`, `is_public`, `created_at`, `file_cv`, `id_company_field`, `id_experience`, `id_working_form`) VALUES
('1gc5holhar2fnt', '1gc5holhaquou5', 'CTV', 'QLCC', 'Đà Nẵng', 10000000, 'CV - Intership PHP,Laravel 04-02-2022.pdf', 'Fresher IT', 1, '2023-05-05', 'http://localhost:5000/1683302870647CV - Intership PHP,Laravel 04-02-2022.pdf', 'ITPM', '1N', 'TTG'),
('1gc8y8lgxt6pzk', '1gcyslgxgw73d', 'CTV', 'CTV', 'Cần Thơ', 10000009, 'DO-QUANG-HUY-CV_FRESHER_FE.pdf', 'sybuivan1429@gmail.com', 1, '2023-04-26', 'http://localhost:5000/1682520369621DO-QUANG-HUY-CV_FRESHER_FE.pdf', 'ITPC', '1N', 'TTS'),
('1gcggklhbkiy4k', '1gc710lfdu4aez', 'CTV', 'QLCC', 'Bắc Kạn', 1000000, 'Fresher-Frontend-BuiVanSy.pdf', 'Sy', 1, '2023-05-06', 'http://localhost:5000/1683352350009Fresher-Frontend-BuiVanSy.pdf', 'ITPM', '1N', 'TTG');

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
('1gc3uklgomt0oc', '1gc5holhaq7j4l', '12112'),
('1gc3uklgomt0oc', '1gc5holhapoh73', '123'),
('1gc3uklgomt0oc', '1gc5holhapzuw9', '1234'),
('1gc5holhaquou5', '1gc3uklgomt0oc', '1gc3wglhatcsvw'),
('1gc710lfdu4aez', '8z0lhalx9m5', '1gc3wglhbbdpt9'),
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

--
-- Dumping data for table `savejob`
--

INSERT INTO `savejob` (`id_user`, `id_job`, `created_at`) VALUES
('1gc710lfdu4aez', '1gc2e0lhaehizk', '2023-05-09'),
('1gc710lfdu4aez', '1gc5holhap28q6', '2023-05-08');

-- --------------------------------------------------------

--
-- Table structure for table `service`
--

CREATE TABLE `service` (
  `id_service` varchar(100) NOT NULL,
  `name_service` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  `number_of_months` int(11) NOT NULL,
  `description` varchar(255) NOT NULL,
  `total_news` int(11) NOT NULL,
  `urgent_recruitment` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `service`
--

INSERT INTO `service` (`id_service`, `name_service`, `price`, `number_of_months`, `description`, `total_news`, `urgent_recruitment`) VALUES
('DV01', 'Đăng tin cơ bản', 100000, 1, 'Được đăng trên trang chủ của hệ thông', 10, 0),
('DV02', 'Đăng tin cơ bản', 250000, 3, 'Được đăng trên trang chủ của hệ thông', 35, 0),
('DV03', 'Đăng tin cơ bản', 1000000, 12, 'Được đăng trên trang chủ của hệ thông', 120, 0),
('DV04', 'Trang chủ tuyển gấp', 150000, 1, 'Được đăng trên trang chủ của hệ thông', 10, 1),
('DV05', 'Trang chủ tuyển gấp', 350000, 3, 'Được đăng trên trang chủ của hệ thông', 10, 1);

-- --------------------------------------------------------

--
-- Table structure for table `service_history`
--

CREATE TABLE `service_history` (
  `id_history` varchar(100) NOT NULL,
  `id_service` varchar(100) NOT NULL,
  `id_company` varchar(100) NOT NULL,
  `created_at` date NOT NULL,
  `expiry` date NOT NULL,
  `activated` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `service_history`
--

INSERT INTO `service_history` (`id_history`, `id_service`, `id_company`, `created_at`, `expiry`, `activated`) VALUES
('02T00165Y0689245U', 'DV04', '8z0lhalx9m5', '2023-05-05', '2023-06-05', 1),
('1N013167TY165484P', 'DV02', '1gc3uklgomt0oc', '2023-05-05', '2023-08-05', 1),
('1YD56786HR888024X', 'DV01', '8z0lhalx9m5', '2023-05-05', '2023-06-05', 1),
('2AE945897W308884N', 'DV01', '8z0lhalx9m5', '2023-05-06', '2023-06-06', 1),
('2V047795D7665303F', 'DV04', '1gc5holhapoh73', '2023-05-05', '2023-06-05', 1),
('47X02375C4123950S', 'DV02', '1gc3uklgomt0oc', '2023-04-23', '2023-07-23', 1),
('5AM13095RM173730G', 'DV01', '1gc5holhaqext1', '2023-05-05', '2023-06-05', 1),
('6T9364086F863033V', 'DV04', '1gc5holhapzuw9', '2023-05-05', '2023-06-05', 1),
('7PK10048FX876522W', 'DV04', '1gc3uklgomt0oc', '2023-05-05', '2023-06-05', 1),
('80R33567U5582534H', 'DV04', '1gc5holhaq7j4l', '2023-05-05', '2023-06-05', 1),
('91S516717T292893B', 'DV04', '8z0lhalx9m5', '2023-05-06', '2023-06-06', 1);

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
  `is_update_profle` int(11) DEFAULT NULL,
  `is_lock` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id_user`, `id_role`, `fullName`, `email`, `phone`, `id_experience`, `gender`, `password`, `birthDay`, `address`, `city`, `avatar`, `is_update_profle`, `is_lock`) VALUES
('1gc2holhitg82w', 'company', ' Nguyễn Hoài Đức', 'nguyenthanhnhan@gmail.com', '111222329', NULL, NULL, '$2b$10$khsSTsmcwQRIzcJC.c/LauX6rJa11mSclcsbt0scYGHh/sHcp/02C', NULL, NULL, '', NULL, NULL, 0),
('1gc3uklgomt0oc', 'company', 'Lê Thị Thảo', 'sybuivan1429@gmail.com', NULL, NULL, NULL, '$2b$10$G76AUGP4Wl3ndNpWPD7mmO2ykMjjaLLcXyFnQ5NNx28mM2CWjPULm', NULL, NULL, '', NULL, NULL, 1),
('1gc5holhapoh73', 'company', 'Nguyen Hoang An', 'hdsaigon@gmail.com', NULL, NULL, NULL, '$2b$10$jzyrLR/61Kbfwq3F5lBBw.rbi2Xv3/ytEn/gVEYM7vZNtl0lGgrCa', NULL, NULL, '', NULL, NULL, 0),
('1gc5holhapzuw9', 'company', 'Le Vu', 'abbott@gmail.com', NULL, NULL, NULL, '$2b$10$u8JUZNPGx5.r0fBp6aeiwuKwRUgnwuvTPqcrkGX7p0K2xfDnS3NEu', NULL, NULL, '', NULL, NULL, 0),
('1gc5holhaq7j4l', 'company', 'Nguyen Tra My', 'vacxin@gmail.com', NULL, NULL, NULL, '$2b$10$cqjlMjrYC/hRc/0vv.cbb.LN/wBWEA3X7SMsjazFqJb9/kkogYmsC', NULL, NULL, '', NULL, NULL, 0),
('1gc5holhaqext1', 'company', 'Bui Van Hoang', 'vanhoang@gmail.com', NULL, NULL, NULL, '$2b$10$Vb.ylzz.nycMF1EB5pFUTugWFEE/2MYl7IXq1G1/e6K8c8UNC0yRm', NULL, NULL, '', NULL, NULL, 0),
('1gc5holhaquou5', 'user', 'Van Huu Hung', 'vanthien.dev@gmail.com', '032200121', NULL, 'Nam', '$2b$10$fx6uxdCHbE7CVxWNi4V3WeHWSYSAFcHFbiTy54wuXUxo4TiYH/F3y', '2002-01-01', 'Tran Van', 'Đà Nẵng', 'http://localhost:5000/1683302790633BÃ¹i VÄn Sá»· - Intern  FE Nodejs - ÄÃ  Náºµng.jpg', 1, 0),
('1gc710lfdu4aez', 'user', 'Bui Van Sy', 'sybuivan1429@gmail.com', '038911223', NULL, 'Nam', '$2b$10$jN/xfi0pduESBxnc9hILs.OOWUxt.jVnyz9/Xx2bIJMIoW7tCQ7vu', '1999-04-08', 'https://api', 'Đà Nẵng', 'http://localhost:5000/1679316128486IMG_4414.JPG', 1, 0),
('1gc7kwlhilr5ep', 'company', 'Trần Hậu', 'tranhau@gmail.com', '212121212', NULL, NULL, '$2b$10$8U4xjSkfgAuLXCerT8KswuVRx.8b8gR4jR2NE7MyLGrOKo1ccGg5G', NULL, NULL, '', NULL, NULL, 0),
('1gcatolhfrlnwt', 'company', 'sybuivan1429@gmail.com', 'admin123@gmail.com', '0255888899', NULL, NULL, '$2b$10$mtbVmHcySpe.e33tYKXrG.vbLfTJMZ3BtjA46WJnqA2lyuXgpqHLC', NULL, NULL, '', NULL, NULL, 0),
('1gcck0lg61fe1u', 'user', 'Tran Y Tien', 'tientran14@gmail.com', NULL, NULL, NULL, '$2b$10$H9AdfbN3nHIfLPEfM..6/eOtZ62Yi/SfmXS83vcC13uImJ8IRhGjG', NULL, NULL, '', NULL, NULL, 0),
('1gcd88lgniqadt', 'user', 'Trần y Tiến', 'tranytien@gmail.com', NULL, NULL, NULL, '$2b$10$iB57I3mhq0fwBCMxYlenluTej5J1V2I49yEXjPVySjT26LbR/tZWW', NULL, NULL, '', NULL, NULL, 1),
('1gcdt4lhiwvya4', 'user', 'trantien', 'trantien@gmail.com', NULL, NULL, NULL, '$2b$10$rBpWSa7rQrJBVONtglS1R.0YzhviYAwLmVAMOPEiVC7aP8Q7G3TX2', NULL, NULL, '', NULL, NULL, 0),
('1gcdt4lhixwokq', 'user', 'Phạm Văn Thiên', 'vanthien.dev@gmail.com', '0394921219', NULL, 'Nam', '$2b$10$3dzxm8Fu4UWtA/efMd3j/OWV9bCM4Jeulxt0a2QjPoHETvaKhfQ/C', '2023-05-05', 'thanhnhddandđ', 'Bình Định', 'http://localhost:5000/1683798172761thao.jpg', 1, 0),
('1gcekslgeljvww', 'admin', 'Quản trị viên', 'admin123@gmail.com', NULL, NULL, NULL, '$2b$10$byb3b/SFnt/Exa/H0sPAmOxhVnWpDJYODhdVm4cv2bzfgqysR9Pka', NULL, NULL, '', NULL, NULL, 1),
('1gcyslgxgw73d', 'user', 'Nguyễn Thành Nhân', 'nguyenthanhnhan@gmail.com', '0947895682', NULL, 'Nam', '$2b$10$vJ6a9kT36jr0M/j/RE4DA.uvBPCjzOObyhfHPvavKdhPAZpab6bUS', '2002-01-01', '19 Đinh Tiên Hoang', 'Quảng Trị', 'http://localhost:5000/1682500152074BÃ¹i VÄn Sá»· - Intern  FE Nodejs - ÄÃ  Náºµng.jpg', 1, 0),
('8z0lhalx9m5', 'company', 'Hoàng Văn A', 'jacss123@gmail.com', NULL, NULL, NULL, '$2b$10$QBFq/QS.Maf.hfxexf07hubKWXuVGGyF6oXgB0k2Eo0DaPr2gH8Nq', NULL, NULL, '', NULL, NULL, 0);

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
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_profile` (`id_profile`);

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
  ADD KEY `id_working_form` (`id_working_form`),
  ADD KEY `id_history` (`id_history`);

--
-- Indexes for table `notification`
--
ALTER TABLE `notification`
  ADD PRIMARY KEY (`id_notification`),
  ADD KEY `notification_ibfk_1` (`id_apply`),
  ADD KEY `notification_ibfk_2` (`id_user`),
  ADD KEY `notification_ibfk_3` (`id_job`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id_post`),
  ADD KEY `id_user` (`id_user`);

--
-- Indexes for table `profile_cv`
--
ALTER TABLE `profile_cv`
  ADD PRIMARY KEY (`id_profile`),
  ADD KEY `id_city` (`id_city`),
  ADD KEY `id_type_current` (`id_type_current`),
  ADD KEY `id_type_desired` (`id_type_desired`),
  ADD KEY `id_company_field` (`id_company_field`),
  ADD KEY `id_experience` (`id_experience`),
  ADD KEY `id_working_form` (`id_working_form`),
  ADD KEY `id_user` (`id_user`);

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
-- Indexes for table `service`
--
ALTER TABLE `service`
  ADD PRIMARY KEY (`id_service`);

--
-- Indexes for table `service_history`
--
ALTER TABLE `service_history`
  ADD PRIMARY KEY (`id_history`),
  ADD KEY `id_service` (`id_service`),
  ADD KEY `id_company` (`id_company`);

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
  ADD CONSTRAINT `apply_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `apply_ibfk_3` FOREIGN KEY (`id_profile`) REFERENCES `profile_cv` (`id_profile`);

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
  ADD CONSTRAINT `job_ibfk_7` FOREIGN KEY (`id_working_form`) REFERENCES `working_form` (`id_working_form`),
  ADD CONSTRAINT `job_ibfk_8` FOREIGN KEY (`id_history`) REFERENCES `service_history` (`id_history`);

--
-- Constraints for table `notification`
--
ALTER TABLE `notification`
  ADD CONSTRAINT `notification_ibfk_1` FOREIGN KEY (`id_apply`) REFERENCES `apply` (`id_apply`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `notification_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `notification_ibfk_3` FOREIGN KEY (`id_job`) REFERENCES `job` (`id_job`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`);

--
-- Constraints for table `profile_cv`
--
ALTER TABLE `profile_cv`
  ADD CONSTRAINT `profile_cv_ibfk_3` FOREIGN KEY (`id_type_current`) REFERENCES `typerank` (`id_rank`),
  ADD CONSTRAINT `profile_cv_ibfk_4` FOREIGN KEY (`id_type_desired`) REFERENCES `typerank` (`id_rank`),
  ADD CONSTRAINT `profile_cv_ibfk_5` FOREIGN KEY (`id_company_field`) REFERENCES `companyfield` (`id_companyField`),
  ADD CONSTRAINT `profile_cv_ibfk_6` FOREIGN KEY (`id_experience`) REFERENCES `experience` (`id_experience`),
  ADD CONSTRAINT `profile_cv_ibfk_7` FOREIGN KEY (`id_working_form`) REFERENCES `working_form` (`id_working_form`),
  ADD CONSTRAINT `profile_cv_ibfk_8` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`);

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
-- Constraints for table `service_history`
--
ALTER TABLE `service_history`
  ADD CONSTRAINT `service_history_ibfk_1` FOREIGN KEY (`id_service`) REFERENCES `service` (`id_service`),
  ADD CONSTRAINT `service_history_ibfk_2` FOREIGN KEY (`id_company`) REFERENCES `company` (`id_company`) ON DELETE CASCADE ON UPDATE CASCADE;

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
