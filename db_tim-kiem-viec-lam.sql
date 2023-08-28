-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 28, 2023 at 01:23 PM
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
('1gc2i8lluqf1f1', '1gc274lhx9ge4i', '1gcggklhbkiy4k', '1gc710lfdu4aez', '', 'Xin chao nha tuyen dung', '2023-08-28', 2),
('1gc2n0lhwuirrc', '1gc708lhvwpurw', '1gcggklhbkiy4k', '1gc710lfdu4aez', '', 'Xin chao nha tuyen dung', '2023-05-21', 3),
('1gc5q8liq60kmm', '1gc274lhx9cekb', NULL, '1gc710lfdu4aez', '1686411753061Intern React Native_Nguyen Minh Hieu.pdf', 'Chào nhà tuyển dụng. Em xin giới thiệu bản thân\n', '2023-06-10', 1),
('1gc7molik42rnn', '1gc2iklhx83cuk', '1gc5iglhu70jbo', '1gc5holhaquou5', '', 'Xin chao nha tuyen dung', '2023-06-06', 4),
('1gc88slijtued8', '1gc9xglicsjldd', '1gcggklhbkiy4k', '1gc710lfdu4aez', '', 'Xin chao nha tuyen dung', '2023-06-06', 1),
('1gc8kclik7abro', '1gc9xglicsjldd', NULL, '1gc8kclik755lf', '1686051087552CNTT_7480201_KS19.pdf', 'chào nhà tuyển dụng', '2023-06-06', 0),
('1gc8kclik8f2po', '1gc8kclik8bhur', '1gc8kclik7mnjb', '1gc8kclik755lf', '', 'chào nhà tuyển dụng', '2023-06-06', 2),
('1gc8u4llur7y36', '1gc274lhx9aiea', '1gcggklhbkiy4k', '1gc710lfdu4aez', '', 'Xin chao nha tuyen dung', '2023-08-28', 2),
('1gc90klhxmdesl', '1gca04lhxfhpz0', NULL, '1gc710lfdu4aez', '1684685706248CV-Fresher-Developer.pdf', '1223', '2023-05-21', 0),
('1gc948lhxhu69j', '1gc9x0lhxgztrj', '1gcggklhbkiy4k', '1gc710lfdu4aez', '', 'Chao nha tuyen dung', '2023-05-21', 3),
('1gc948lhxhy6pq', '1gc9x0lhxgztrj', '1gc5iglhu70jbo', '1gc5holhaquou5', '', 'Toi Muon ung tuyen', '2023-05-21', 4),
('1gc9xglicrkz6m', '1gc274lhx9byb5', '1gc9xglicriijm', '1gc9xglicr0oue', '', 'hello sy', '2023-06-01', 2),
('1gc9xglicsl4jp', '1gc9xglicsjldd', '1gc9xglicriijm', '1gc9xglicr0oue', '', 'hi thiên', '2023-06-01', 4),
('1gcavwlipnbzgb', '1gc8e4liicowhr', '1gcggklhbkiy4k', '1gc710lfdu4aez', '', 'Xin chao nha tuyen dung', '2023-06-10', 1),
('1gcbsclluqklsv', '1gc274lhx9eumx', '1gcggklhbkiy4k', '1gc710lfdu4aez', '', 'Xin chao nha tuyen dung', '2023-08-28', 0),
('1gcc2wlhww3x3s', '1gc60slhvv3q3u', NULL, '1gc710lfdu4aez', '1684641593637CV_7.pdf', '123', '2023-05-21', 4),
('1gcdf4likjxxop', '1gcdf4likh2yhn', '1gcggklhbkiy4k', '1gc710lfdu4aez', '', 'Xin chào nhà tuyển dụng. Em tên là bùi văn sỷ', '2023-06-07', 2),
('1gcei8lir95pqk', '1gc274lhx9bdx3', '1gcggklhbkiy4k', '1gc710lfdu4aez', '', 'Xin chao nha tuyen dung', '2023-06-11', 2),
('1gcn4lhx6otuk', '1gc9hglhwuai19', '1gcggklhbkiy4k', '1gc710lfdu4aez', '', 'Xin chao', '2023-05-21', 4),
('cwklhy8psbj', '1gc2iklhx83cuk', '1gc5rolhxjv0yp', '1gc710lfdu4aez', '', 'CHao nha tuyen dung\n', '2023-05-22', 4),
('cwklhyrljjv', '1gc60slhvv3q3u', '1gc5iglhu70jbo', '1gc5holhaquou5', '', 'Chao ntd', '2023-05-22', 4);

-- --------------------------------------------------------

--
-- Table structure for table `chat`
--

CREATE TABLE `chat` (
  `id_chat` varchar(100) NOT NULL,
  `id_room` varchar(100) NOT NULL,
  `message` text NOT NULL,
  `created_at` datetime NOT NULL,
  `sender` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `chat`
--

INSERT INTO `chat` (`id_chat`, `id_room`, `message`, `created_at`, `sender`) VALUES
('1gc88slijtsyl2', '1gc9xglicst4m6', 'hello', '2023-06-06 12:14:05', 'company'),
('1gc88sliju267u', '1gc88sliju267p', 'Cảm ơn bạn đã gửi CV cho chúng tôi. Chúng tôi sẽ xem xét CV của bạn.', '2023-06-06 12:21:15', 'company'),
('1gc88slijusgpi', '1gc88sliju267p', 'hello', '2023-06-06 12:41:41', 'user'),
('1gc88slijuw9fv', '1gc88sliju267p', 'Xin chao ban', '2023-06-06 12:44:39', 'company'),
('1gc948lhxihw2t', '1gc948lhxihvzk', 'Xin Chao', '2023-05-21 21:26:37', 'company'),
('1gc948lhxiikra', '1gc948lhxihvzk', 'Chao', '2023-05-21 21:27:09', 'user'),
('1gc9xglicst4mb', '1gc9xglicst4m6', 'hi \n', '2023-06-01 14:11:50', 'company'),
('1gc9xglicstv7d', '1gc9xglicst4m6', 'hello', '2023-06-01 14:12:24', 'user'),
('1gc9xglicstzwq', '1gc9xglicst4m6', 'hello', '2023-06-01 14:12:30', 'user'),
('1gc9xglicsult7', '1gc9xglicst4m6', 'hsd', '2023-06-01 14:12:59', 'company'),
('1gc9xglicsvkk9', '1gc9xglicst4m6', 'Xin chào bạn', '2023-06-01 14:13:44', 'user'),
('1gca6olijt3pug', '1gca6olijt3pua', 'Chao ban', '2023-06-06 11:54:27', 'company'),
('1gca6olijt4404', '1gca6olijt3pua', 'Xin chao', '2023-06-06 11:54:46', 'company'),
('1gcavwlippl26v', '7kklikef4u4', 'hi', '2023-06-10 15:02:35', 'user'),
('1gcdf4likjukwo', '1gcdf4likjukwg', 'Xin chào công ty\n', '2023-06-07 00:23:11', 'user'),
('1gcem0liqbgi7g', '7kklikef4u4', 'Xin chào bạn', '2023-06-11 01:14:54', 'company'),
('7kklike5jkn', '7kklike5jhl', 'Dạ cho em hỏi với ạ\n', '2023-06-06 21:43:44', 'user'),
('7kklike6b2m', '7kklike5jhl', 'Bên mình còn tuyển không ạ.', '2023-06-06 21:44:20', 'user'),
('7kklike8rbc', '7kklike5jhl', 'Hello', '2023-06-06 21:46:14', 'user'),
('7kklikeau5v', '7kklike5jhl', 'Xin chào', '2023-06-06 21:47:51', 'user'),
('7kklikef4uf', '7kklikef4u4', 'Không biết công ty có rảnh không ạ?', '2023-06-06 21:51:12', 'user');

-- --------------------------------------------------------

--
-- Table structure for table `citiesjob`
--

CREATE TABLE `citiesjob` (
  `id_job` varchar(100) NOT NULL,
  `id_city` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `citiesjob`
--

INSERT INTO `citiesjob` (`id_job`, `id_city`) VALUES
('1gc274lhx9aiea', '29'),
('1gc274lhx9b1ah', '29'),
('1gc274lhx9bdx3', '29'),
('1gc274lhx9byb5', '8'),
('1gc274lhx9cekb', '8'),
('1gc274lhx9dd1z', '8'),
('1gc274lhx9dr1a', '36'),
('1gc274lhx9ebuf', '36'),
('1gc274lhx9eumx', '5'),
('1gc274lhx9ge4i', '29'),
('1gc274lhxb28g1', '13'),
('1gc274lhxb28g1', '24'),
('1gc274lhxb28g1', '29'),
('1gc274lhxb3h9v', '13'),
('1gc274lhxb3h9v', '24'),
('1gc274lhxb3h9v', '29'),
('1gc274lhxb401r', '13'),
('1gc274lhxb401r', '24'),
('1gc274lhxb401r', '29'),
('1gc2iklhx83cuk', '30'),
('1gc37slhxeotww', '10'),
('1gc37slhxetogw', '10'),
('1gc37slhxetogw', '11'),
('1gc60slhvv3q3u', '10'),
('1gc60slhvv3q3u', '15'),
('1gc6f0lhx8oxms', '29'),
('1gc6f0lhx8rrjo', '8'),
('1gc6f0lhx8rw42', '8'),
('1gc6f0lhx8wdk3', '49'),
('1gc6f0lhx8wuz0', '26'),
('1gc6f0lhx8x9k8', '31'),
('1gc6f0lhx8xq0u', '31'),
('1gc6f0lhx8y3io', '31'),
('1gc708lhvwpurw', '11'),
('1gc708lhvwpurw', '16'),
('1gc708lhvwpurw', '2'),
('1gc8e4liicnzzg', '10'),
('1gc8e4liicowhr', '10'),
('1gc8e4liicowhr', '12'),
('1gc8kclik8bhur', '15'),
('1gc8u4llurdgas', '26'),
('1gc9hglhwuai19', '10'),
('1gc9hglhwuai19', '61'),
('1gc9hglhwucfm0', '10'),
('1gc9hglhwucfm0', '11'),
('1gc9hglhwucfm0', '12'),
('1gc9n0lhvseksy', '12'),
('1gc9n0lhvseksy', '30'),
('1gc9x0lhxgztrj', '15'),
('1gc9xglicsjldd', '15'),
('1gc9xglicsjldd', '25'),
('1gc9xklhxg6qpf', '15'),
('1gc9xklhxg6qpf', '29'),
('1gca04lhxfhpz0', '15'),
('1gcbsclluqm7tb', '12'),
('1gcbsclluqm7tb', '15'),
('1gcc4klhx7oilu', '2'),
('1gcdf4likh2yhn', '11'),
('1gcdf4likh2yhn', '15'),
('1gcdf4likk18jx', '15'),
('1gcn4lhx71n0v', '10'),
('1gcn4lhx71yju', '10'),
('1gcn4lhx71yju', '15'),
('y8lipwyeuw', '24');

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
('1', 'An Giang'),
('10', 'Bình Phước'),
('11', 'Bình Thuận'),
('12', 'Cà Mau'),
('13', 'Thành phố Cần Thơ'),
('14', 'Cao Bằng'),
('15', 'Thành phố Đà Nẵng'),
('16', 'Đắk Lắk'),
('17', 'Đắk Nông'),
('18', 'Điện Biên'),
('19', 'Đồng Nai'),
('2', 'Bà Rịa - Vũng Tàu'),
('20', 'Đồng Tháp'),
('21', 'Gia Lai'),
('22', 'Hà Giang'),
('23', 'Hà Nam'),
('24', 'Thành phố Hà Nội'),
('25', 'Hà Tĩnh'),
('26', 'Hải Dương'),
('27', 'Thành phố Hải Phòng'),
('28', 'Hậu Giang'),
('29', 'TP HCM'),
('3', 'Bắc Giang'),
('30', 'Hoà Bình'),
('31', 'Hưng Yên'),
('32', 'Khánh Hòa'),
('33', 'Kiên Giang'),
('34', 'Kon Tum'),
('35', 'Lai Châu'),
('36', 'Lâm Đồng'),
('37', 'Lạng Sơn'),
('38', 'Lào Cai'),
('39', 'Long An'),
('4', 'Bắc Kạn'),
('40', 'Nam Định'),
('41', 'Nghệ An'),
('42', 'Ninh Bình'),
('43', 'Ninh Thuận'),
('44', 'Phú Thọ'),
('45', 'Phú Yên'),
('46', 'Quảng Bình'),
('47', 'Quảng Nam'),
('48', 'Quảng Ngãi'),
('49', 'Quảng Ninh'),
('5', 'Bạc Liêu'),
('50', 'Quảng Trị'),
('51', 'Sóc Trăng'),
('52', 'Sơn La'),
('53', 'Tây Ninh'),
('54', 'Thái Bình'),
('55', 'Thái Nguyên'),
('56', 'Thanh Hóa'),
('57', 'Thừa Thiên Huế'),
('58', 'Tiền Giang'),
('59', 'Trà Vinh'),
('6', 'Bắc Ninh'),
('60', 'Tuyên Quang'),
('61', 'Vĩnh Long'),
('62', 'Vĩnh Phúc'),
('63', 'Yên Bái'),
('7', 'Bến Tre'),
('8', 'Bình Dương'),
('9', 'Bình Định');

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
  `cover_image` varchar(255) NOT NULL,
  `active_status` int(11) NOT NULL,
  `faxCode` varchar(255) NOT NULL,
  `idCompanyField` varchar(100) NOT NULL,
  `city` varchar(155) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `company`
--

INSERT INTO `company` (`id_company`, `name_company`, `address`, `total_people`, `introduce`, `logo`, `link_website`, `cover_image`, `active_status`, `faxCode`, `idCompanyField`, `city`) VALUES
('1gc2holhitg82w', 'CÔNG TY CỔ PHẦN GIẢI PHÁP CÔNG NGHỆ DANATEQ', 'Số 26 Dương Trí Trạch, Phường An Hải Bắc, Quận Sơn Trà, Thành phố Đà Nẵng, Việt Nam', '10-150 người ', '<p><br></p><p>RITAVÕ - Công ty phát triển theo hướng đa ngành nghề với các lĩnh vực chính bao gồm kinh doanh VLXD-Nội Thất cao cấp; Thời Trang Cao Cấp; Ô tô nhập khẩu; Máy phát điện Công nghiệp; Khách sạn-, Resort, KD café và chuỗi nhà hàng café. Với hơn 1.000 nhân viên, 20 cửa hàng, trung tâm trên cả nước, RITAVÕ ngày càng khẳng định được vị thế của mình trong lòng khách hàng và là thương hiệu uy tín, đồng hành cùng khách hàng hướng đến một cuộc sống tốt đẹp hơn.</p><p>RITAVÕ luôn trao quyền sáng tạo và phấn đấu công bằng cho tất cả nhân viên của mình nhằm tạo ra một môi trường làm việc năng động và chuyên nghiệp. Chúng tôi luôn thấu hiểu và chia sẻ với từng cá nhân trong việc cân bằng giữa công việc và cuộc sống để giúp mỗi cá nhân không chỉ thực hiện trách nhiệm trong công ty mà còn dành thời gian với gia đình của họ. RITAVÕ luôn hướng tất cả mọi thành viên của mình đến một nếp sống và làm việc có tính kỷ luật mà vẫn đảm bảo tốt nhất đời sống tinh thần cho từng cá nhân, phát huy sức sáng tạo và cống hiến hết mình vì tập thể chung là Ngôi nhà RITAVÕ.</p><p>Nếu bạn yêu thích môi trường làm việc thách thức, năng động, định hướng chuyên nghiệp, lương thưởng phù hợp với năng lực cùng với nhiều cơ hội phát triển con đường sự nghiệp trong tương lai, hãy để RITA VÕ là nơi bắt đầu sự thành công của bạn!</p>', '1686027407774git-github.png', 'danateq.com', '1686027407774git-github.png', 1, '0402142269', 'ITPM', '15'),
('1gc3uklgomt0oc', 'Công ty DANATEQ', 'http://localhost', '10-150 người ', '<p><br></p><p>Được thành lập vào năm 2002 Công ty Cổ phần Maison (Maison) đã nhanh chóng trở thành một trong những công ty phân phối thời trang lớn nhất trong việc giới thiệu các thương hiệu thời trang cao cấp và sang trọng tại Việt Nam. Sau thành công ngoài mong đợi của cửa hàng đầu tiên, hiện Maison đang là ngôi nhà chung của hơn 18 thương hiệu đình đám. Dự báo sẽ có nhiều thương hiệu mới được ra mắt vào năm 2022, thổi vào thị trường Việt Nam những giấc mơ thời trang bất tận.</p><p><br></p><p>Maison không chỉ lan tỏa văn hóa thời trang đa dạng mà còn mang đến một nền tảng thời trang giá trị, dịch vụ khách hàng, có trách nhiệm, để Việt Nam là điểm đến sành điệu cho tất cả các tín đồ thời trang.</p><p><br></p><p><strong>Lợi Ích:</strong></p><p>Maison giúp phát huy tiềm năng của nhân viên trong cả sự nghiệp lẫn cuộc sống cá nhân, đồng thời tạo nền tảng vững chắc cho các kế hoạch dài hạn.</p><p><br></p><p><strong>Đổi Mới:</strong></p><p>Maison giao phó trách nhiệm cho bạn và khuyến khích những sáng tạo trong công việc, bởi đây chính là chìa khóa dẫn đến thành công.</p><p><br></p><p><strong>Phát Triển:</strong></p><p>Ngoài các khóa đào tạo chuyên môn và kỹ năng mềm, môi trường làm việc đa dạng của Maison giúp bạn va chạm và tích lũy nhiều kinh nghiệm quý báu.</p><p><br></p><p><strong>Liên Kết:</strong></p><p>Thông qua thời trang, chúng ta là một thể thống nhất. Maison khuyến khích các hoạt động vui chơi, giải trí, xây dựng đội nhóm và các cuộc thi để kết nối và giao lưu giữa các phòng ban.</p>', '1683293894827dana.png', 'http://localhost', 'http://localhost:5000/1683293894827dana.png', 1, '192.168.2.3', 'ITPC', '15'),
('1gc5holhapoh73', 'Công Ty Tài Chính TNHH Hd Saison', 'Tầng 3, Tòa nhà VIT, 519 Kim Mã, Quận Ba Đình, Hà Nội', 'Dưới 10 người ', '<p><br></p><p>Thành lập ngày 7 tháng 9 năm 2007, Công ty TNHH MTV Tài Chính Việt Société Générale (SGVF), tên ban đầu của HD SAISON, là công ty tài chính phi ngân hàng 100% vốn nước ngoài đầu tiên được Ngân hàng Nhà nước Việt Nam cấp giấy phép hoạt động với số vốn đầu tư lên đến 520 tỷ đồng. Mục tiêu hoạt động của SGVF là cung cấp những giải pháp tài chính trong lĩnh vực tiêu dùng cá nhân.</p><p><br></p><p>Tháng 10 / 2013, SGVF trực thuộc Ngân hàng TMCP Phát triển TP.HCM (\'HDBank\") và đổi tên thành Công ty Tài chính TNHH MTV Ngân hàng TMCP Phát triển TP.HCM, gọi tắt là HDFinance.</p><p><br></p><p>Năm 2014, HDFinance có mặt tại khắp 63 tỉnh thành Việt Nam và phục vụ hơn 750.000 lượt khách hàng. Tháng 4 / 2015, công ty ra mắt dịch vụ Du lịch đi trước, trả sau.</p>', '1683300598410log1.png', '', 'http://localhost:5000/1683300598410log1.png', 1, '121212', 'KD', '29'),
('1gc5holhapzuw9', 'Abbott Việt Nam', 'số 18 Lũy Bán Bích, Phường Tân Thới Hòa, Quận Tân Phú, TP.HCM', '10-150 người ', '<p><br></p><p>Abbott Vietnam was established in the year 1995. Since then, IT has undergone extraordinary development and was soon perceived as one of the premier healthcare providers in the market.</p><p><br></p><p>Abbott International Nutrition- Trade Nutrition Division belongs to Abbott Laboratory. Our business is to distribute a wide range of nutritional products, such as: Formance, Isomil, Gain, Gain IQ, Grow, Grow School, Pediasure, Ensure, Glucerna and a new nutrilite named Advance IQ, including: Similac Mom, Similac Advance IQ, Gain Advance IQ, Gain Plus Advance IQ, Grow Advance IQ.</p><p><br></p><p>Abbott Vietnam provides a superior range of customer-focused healthcare solutions, built on credible science and values. Our diverse family of pharmaceutical, medical and nutritional products includes a broad range of</p>', '1683301114898Abbott.jpeg', '', '', 1, '120DS', 'KD', '29'),
('1gc5holhaq7j4l', 'Công ty Cổ Phần Vacxin Việt Nam', '98 Hoàng Văn Thụ Phường 9 Phú Nhuận', '10-150 người ', '<p>​<span style=\"color: rgb(65, 64, 69);font-size: 16px;background-color: rgb(250, 250, 255)\">Hệ thống tiêm chủng VNVC (thuộc Công ty Cổ phần Vacxin Việt Nam - Tập đoàn của Eco (TP.Hà Nội)) chính thức đi vào hoạt động từ tháng 6 năm 2017. Trong bối cảnh thế giới đang phải đương đầu với tình trạng biến đổi phức tạp của các chủng vi khuẩn gây bệnh cũng như sự thiếu hụt vắc xin tại Việt Nam như hiện nay, Hệ thống tiêm chủng VNVC ra đời nhằm cung cấp cho trẻ em Việt Nam những loại vắc xin có chất lượng tốt nhất cùng với hệ thống phòng tiêm chủng an toàn, hiện đại và cao cấp.</span>​<br></p>', '1683301452478vaxin.png', ' https://vnvc.vn', '', 1, '11AS', 'KD', '8'),
('1gc5holhaqext1', 'Công Ty Cổ Phần Dịch Vụ Thương Mại Tổng Hợp Wincommerce', 'Tầng 5, Mplaza SaiGon, số 39 Lê Duẩn - Phường Bến Nghé - Quận 1 - TP. Hồ Chí Minh', '10-150 người ', '<p>​<span style=\"color: rgb(65, 64, 69);font-size: 16px;background-color: rgb(250, 250, 255)\">WinMart và WinMart+ là 2 thương hiệu chuỗi bán lẻ thuộc tập đoàn Vingroup, tập đoàn kinh tế đa ngành hàng đầu ở Việt Nam và trong khu vực. Trên tinh thần phát triển bền vững, chuyên nghiệp, với phương châm “Vì chất lượng cuộc sống của mọi nhà”, hệ thống WinMart &amp; WinMart+ mang đến cho người tiêu dùng sự lựa chọn đa dạng về hàng hoá và dịch vụ, tính tiện ích, đáp ứng nhu cầu mua sắm từ bình dân đến cao cấp của khách hàng. Đặc biệt, khi mua sắm tại hệ thống WinMart và WinMart+, khách hàng còn nhận được nhiều giá trị vượt trội thông qua các hình thức khuyến mại, ưu đãi hấp dẫn.</span>​<br></p>', '1683302347821anh.png', '', 'http://localhost:5000/1683301801178la.png', 1, '13121', 'ITPM', '29'),
('1gc5rolhxk3z80', 'CHI NHÁNH CÔNG TY CỔ PHẦN ENCO', 'Lô 26-E11 Khu đô thị Phức hợp thương mại cao Tầng Phương Trang, đường Hoàng Thị Loan, Phường Hoà Minh, Quận Liên Chiểu, Thành phố Đà Nẵng, Việt Nam', '10-150 người ', '<p>Công ty</p>', '1686397495448f1728860cf1d1e43470c.jpg', '', '', 1, '0303658817-008', 'ITPM', '15'),
('1gc7kwlhilr5ep', 'Công ty một thành viên', '168.190.1.1', '10-150 người ', '<p>Thành lập ngày 7 tháng 9 năm 2007, Công ty TNHH MTV Tài Chính Việt Société Générale (SGVF), tên ban đầu của HD SAISON, là công ty tài chính phi ngân hàng 100% vốn nước ngoài đầu tiên được Ngân hàng Nhà nước Việt Nam cấp giấy phép hoạt động với số vốn đầu tư lên đến 520 tỷ đồng. Mục tiêu hoạt động của SGVF là cung cấp những giải pháp tài chính trong lĩnh vực tiêu dùng cá nhân.<br></p><p><br></p><p>Tháng 10 / 2013, SGVF trực thuộc Ngân hàng TMCP Phát triển TP.HCM (\'HDBank\") và đổi tên thành Công ty Tài chính TNHH MTV Ngân hàng TMCP Phát triển TP.HCM, gọi tắt là HDFinance.</p><p><br></p><p>Năm 2014, HDFinance có mặt tại khắp 63 tỉnh thành Việt Nam và phục vụ hơn 750.000 lượt khách hàng. Tháng 4 / 2015, công ty ra mắt dịch vụ Du lịch đi trước, trả sau.</p><p><br></p><p>Với sự góp vốn đầu tư chiến lược từ tập đoàn tài chính Credit Saison (Nhật Bản), ngày 22 / 4 / 2015, HDFinance chính thức đổi tên thành Công ty Tài chính trách nhiệm hữu hạn HD SAISON hay gọi tắt là HD SAISON.</p><p><br></p><p>Tháng 7 / 2015, HD SAISON đã có hơn 3.500 điểm giới thiệu dịch vụ và con số này ngày càng tiếp tục tăng lên với sự phát triển mạnh mẽ mạng lưới kinh doanh hiện nay của công ty. Ngoài những dịch vụ đang được khách hàng tin tưởng và sử dụng như hỗ trợ trả góp để mua xe máy, hàng điện máy, điện thoại, nội thất, công ty đã phát triển thêm dịch vụ cho vay trả góp để mua ô tô, tải nhẹ, đi du lịch và tổ chức tiệc cưới và đặc biệt là cho vay tiền mặt cho tất cả mọi đối tượng khách hàng. Nhìn về một tương lai rất gần, HD SAISON đặt mục tiêu trở thành một công ty tài chính tiêu dùng hàng đầu được tin cậy nhất tại Việt Nam. HD SAISON cam kết sẽ tham gia cải thiện đời sống của người dân, đặc biệt là tầng lớp nhân dân có thu nhập thấp bằng những giải pháp tài chính thiết thực và tiện lợi.</p>', '16846618661630c11a213f45f67450110524c8f0fef87_3104199_vieclam24h_1577951033.png', ' https://tuyendung.hdsaison.com.vn', 'http://localhost:5000/16846618661630c11a213f45f67450110524c8f0fef87_3104199_vieclam24h_1577951033.png', 1, '123', 'ITPM', '15'),
('1gc8kclik7sft0', 'CÔNG TY TNHH TMDV 79 MOBILE CHI NHÁNH 2', 'Ô 28-P4, Lô F121, Đường N16 - 5F, khu công nghiệp Bàu Bàng, khu phố Cây Sắn, Thị Trấn Lai Uyên, Huyện Bàu Bàng, Tỉnh Bình Dương, Việt Nam', '10-150 người ', '<p>công ty mới thành lập</p>', '1686052318938avatar3.jpg', '', 'http://localhost:5000/1686052318938avatar3.jpg', 1, '3703070905-002', 'ITPC', '15'),
('1gc9xglicrs6et', 'CHI NHÁNH CÔNG TY CỔ PHẦN THẨM ĐỊNH GIÁ TRUNG TÍN TẠI BÌNH PHƯỚC', 'Số 10, Đặng Thai Mai, KP Phú Xuân, Phường Tân Phú, Thành phố Đồng Xoài, Tỉnh Bình Phước, Việt Nam', 'Dưới 10 người ', '<p>Gioi thieu cong ty</p>', '1686027776293mbi1563004580.jpg', '', '', 1, '3603287284-009', 'ITPC', '24'),
('1gcbgwlifpvrds', 'CÔNG TY CỔ PHẦN THƯƠNG MẠI VÀ DỊCH VỤ SOL HOME', 'Số 39 Lô A10, Khu đô thị Geleximco , Xã An Khánh, Huyện Hoài Đức, Thành phố Hà Nội, Việt Nam', '10-150 người ', '', '', '', '', 1, '0110358334', 'ITPM', '15'),
('1gcdf4likkdqzn', 'CÔNG TY CỔ PHẦN GIẢI PHÁP KỸ THUẬT VÀ CÔNG NGHỆ SEVENVET24', 'Số 14, Cụm công  nghiệp Trường An, Xã An Khánh, Huyện Hoài Đức, Thành phố Hà Nội, Việt Nam', '10-150 người ', '', '', '', '', 1, '0110364352', 'ITPM', '13'),
('1gcev4lhlhyoa0', 'CÔNG TY TNHH XÂY DỰNG XUẤT NHẬP KHẨU MINH ĐỨC', 'Bãi Trung Chuyển, Cảng Khuyến Lương, đường Khuyến Lương, Tổ 21, Phường Trần Phú, Quận Hoàng Mai, Thành phố Hà Nội, Việt Nam', '10-150 người ', '', '', '', '', 1, '0110350487', 'ITPM', '1'),
('8z0lhalx9m5', 'Công Ty Tài Chính TNHH MTV Quốc Tế Việt Nam Jaccs', 'ầng 15, Tòa nhà Centec, 72 -74 Nguyễn Thị Minh Khai, Phường Võ Thị Sáu, Quận 3, Thành Phố Hồ Chí Minh, Việt Nam', '10-150 người ', '<p>​<span style=\"color: rgb(65, 64, 69);font-size: 16px;background-color: rgb(250, 250, 255)\">JIVF mong muốn mang đến cho khách hàng các dịch vụ tài chính trả góp đáng tin cậy thông qua mạng lưới các cửa hàng thành viên. Mục tiêu của chúng tôi là phục vụ khách hàng nhanh chóng, hiệu quả và tiết kiệm chi phí với phong cách chuyên nghiệp.</span>​<br></p>', '1683295262897logoass.png', '', '1683295262897logoass.png', 1, 'KD01111', 'KD', '29');

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
('K-Toan', 'Kế toán'),
('KD', 'Kinh doanh'),
('KT', 'Kinh tế'),
('marketing', 'Marketing');

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
('2Y', '2 năm'),
('3Y', '3 năm'),
('CCKN', 'Chưa có kinh nghiệm'),
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
('1gc2holhitg82w', '1gc710lfdu4aez', 'company', '2023-06-11'),
('1gc2holhitg82w', '1gc710lfdu4aez', 'user', '2023-08-28'),
('1gc2holhitg82w', '1gcyslgxgw73d', 'company', '2023-08-28'),
('1gc3uklgomt0oc', '1gc710lfdu4aez', 'user', '2023-05-21'),
('1gc3uklgomt0oc', '1gcck0lg61fe1u', 'user', '2023-05-15'),
('1gc3uklgomt0oc', '1gcdt4lhiwvya4', 'user', '2023-05-11'),
('8z0lhalx9m5', '1gc5holhaquou5', 'company', '2023-06-06'),
('8z0lhalx9m5', '1gc710lfdu4aez', 'company', '2023-06-06'),
('8z0lhalx9m5', '1gcck0lg61fe1u', 'user', '2023-05-13');

-- --------------------------------------------------------

--
-- Table structure for table `job`
--

CREATE TABLE `job` (
  `id_job` varchar(100) NOT NULL,
  `id_company` varchar(100) NOT NULL,
  `id_field` varchar(100) NOT NULL,
  `id_type` varchar(100) NOT NULL,
  `id_range` varchar(100) NOT NULL,
  `id_experience` varchar(100) NOT NULL,
  `name_job` varchar(255) NOT NULL,
  `deadline` date NOT NULL,
  `size_number` int(11) NOT NULL,
  `description_job` text NOT NULL,
  `required_job` text NOT NULL,
  `created_at` datetime NOT NULL,
  `work_location` varchar(255) NOT NULL,
  `id_working_form` varchar(100) NOT NULL,
  `benefits_job` text NOT NULL,
  `id_history` varchar(100) NOT NULL,
  `is_lock` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `job`
--

INSERT INTO `job` (`id_job`, `id_company`, `id_field`, `id_type`, `id_range`, `id_experience`, `name_job`, `deadline`, `size_number`, `description_job`, `required_job`, `created_at`, `work_location`, `id_working_form`, `benefits_job`, `id_history`, `is_lock`) VALUES
('1gc274lhx9aiea', '1gc2holhitg82w', 'KD', 'TTS', '10T-15T', '2Y', '(Siêu Thị Winmart Quận 7) Nhân Viên Bán Hàng', '2023-09-11', 2, '<p><br></p><p>- Vệ sinh khu vực làm việc, sắp xếp, chuẩn bị hàng hóa và các điều kiện đảm bảo để thực hiện công việc</p><p>- Bán hàng và chăm sóc khách hàng các Quầy</p><p>- Tham gia các chương trình truyền thông, thu hút khách hàng đến siêu thị: phát tờ rơi, dán poster,.....</p><p>- Tham gia kiểm kê định kỳ/đột xuất tại quầy.</p><p>- Thời gian làm việc xoay ca 8 tiếng/ngày (Ca 1: 06h00 - 14h00 và Ca 2: 14h00 - 22h00)</p>', '<p><br></p><p>- Nam/Nữ trên 18 tuổi. Tốt nghiệp từ 09/12 trở lên</p><p>- Thời gian làm việc: Full time - xoay ca 8 tiếng/ ngày không cố định (Ca 1: 06h00-14h00 &amp; Ca 2 14h00 -22h00)</p><p>- Chăm chỉ, chịu khó, có thể làm việc trong môi trường máy lạnh</p><p>- Không yêu cầu kinh nghiệm</p>', '2023-08-22 02:11:17', 'Hệ thống Siêu thị WinMart khu vực Quận 7, Quận 7', 'TTG', '<p><br></p><p>- Lương cơ bản + Phụ cấp hấp dẫn + KPIs tháng theo từng vị trí từ 6 - 9 triệu</p><p>- CBNV trong thời gian thử việc hưởng mức thưởng KPIs = 50% mức thưởng CBNV chính thức&nbsp;</p><p>- Cơ hội được đào tạo và thăng tiến lên các vị trí Quản lý</p><p>- Được hưởng đầy đủ BHXH, BHYT, BH Sức khỏe Bảo Việt và khám sức khỏe định kỳ dành riêng cho CBNV Masan</p><p>- Thưởng lễ, tết, lương tháng 13, thưởng thành tích năm, thưởng các chương trình thi đua tháng, Team building năm</p>', '5PK47658PP9392309', 0),
('1gc274lhx9b1ah', '1gc2holhitg82w', 'KD', 'TTS', '10T-15T', '2Y', 'Nhân Viên Lái Xe Ca Đêm [Kcn Sóng Thần Thủ Đức]', '2023-09-17', 2, '<p><br></p><p>- Vệ sinh khu vực làm việc, sắp xếp, chuẩn bị hàng hóa và các điều kiện đảm bảo để thực hiện công việc</p><p>- Bán hàng và chăm sóc khách hàng các Quầy</p><p>- Tham gia các chương trình truyền thông, thu hút khách hàng đến siêu thị: phát tờ rơi, dán poster,.....</p><p>- Tham gia kiểm kê định kỳ/đột xuất tại quầy.</p><p>- Thời gian làm việc xoay ca 8 tiếng/ngày (Ca 1: 06h00 - 14h00 và Ca 2: 14h00 - 22h00)</p>', '<p><br></p><p>- Nam/Nữ trên 18 tuổi. Tốt nghiệp từ 09/12 trở lên</p><p>- Thời gian làm việc: Full time - xoay ca 8 tiếng/ ngày không cố định (Ca 1: 06h00-14h00 &amp; Ca 2 14h00 -22h00)</p><p>- Chăm chỉ, chịu khó, có thể làm việc trong môi trường máy lạnh</p><p>- Không yêu cầu kinh nghiệm</p>', '2023-08-21 02:26:17', 'KCN Sóng Thần, Thủ Đức', 'TTG', '<p><br></p><p>- Lương cơ bản + Phụ cấp hấp dẫn + KPIs tháng theo từng vị trí từ 6 - 9 triệu</p><p>- CBNV trong thời gian thử việc hưởng mức thưởng KPIs = 50% mức thưởng CBNV chính thức&nbsp;</p><p>- Cơ hội được đào tạo và thăng tiến lên các vị trí Quản lý</p><p>- Được hưởng đầy đủ BHXH, BHYT, BH Sức khỏe Bảo Việt và khám sức khỏe định kỳ dành riêng cho CBNV Masan</p><p>- Thưởng lễ, tết, lương tháng 13, thưởng thành tích năm, thưởng các chương trình thi đua tháng, Team building năm</p>', '5PK47658PP9392309', 0),
('1gc274lhx9bdx3', '1gc2holhitg82w', 'KD', 'TTS', '10T-15T', '2Y', '[Kcn Vsip II Tân Uyên Bình Dương] [Nhân Viên Kho Hàng]', '2023-09-17', 2, '<p><br></p><p>- Vệ sinh khu vực làm việc, sắp xếp, chuẩn bị hàng hóa và các điều kiện đảm bảo để thực hiện công việc</p><p>- Bán hàng và chăm sóc khách hàng các Quầy</p><p>- Tham gia các chương trình truyền thông, thu hút khách hàng đến siêu thị: phát tờ rơi, dán poster,.....</p><p>- Tham gia kiểm kê định kỳ/đột xuất tại quầy.</p><p>- Thời gian làm việc xoay ca 8 tiếng/ngày (Ca 1: 06h00 - 14h00 và Ca 2: 14h00 - 22h00)</p>', '<p><br></p><p>- Nam/Nữ trên 18 tuổi. Tốt nghiệp từ 09/12 trở lên</p><p>- Thời gian làm việc: Full time - xoay ca 8 tiếng/ ngày không cố định (Ca 1: 06h00-14h00 &amp; Ca 2 14h00 -22h00)</p><p>- Chăm chỉ, chịu khó, có thể làm việc trong môi trường máy lạnh</p><p>- Không yêu cầu kinh nghiệm</p>', '2023-08-21 06:10:00', 'KCN Sóng Thần, Thủ Đức', 'TTG', '<p><br></p><p>- Lương cơ bản + Phụ cấp hấp dẫn + KPIs tháng theo từng vị trí từ 6 - 9 triệu</p><p>- CBNV trong thời gian thử việc hưởng mức thưởng KPIs = 50% mức thưởng CBNV chính thức&nbsp;</p><p>- Cơ hội được đào tạo và thăng tiến lên các vị trí Quản lý</p><p>- Được hưởng đầy đủ BHXH, BHYT, BH Sức khỏe Bảo Việt và khám sức khỏe định kỳ dành riêng cho CBNV Masan</p><p>- Thưởng lễ, tết, lương tháng 13, thưởng thành tích năm, thưởng các chương trình thi đua tháng, Team building năm</p>', '5PK47658PP9392309', 0),
('1gc274lhx9byb5', '1gc2holhitg82w', 'KD', 'TTS', '10T-15T', '2Y', '[Kcn Vsip II Tân Uyên] [Nhân Viên Kho Hàng]', '2023-09-17', 2, '<p><br></p><p>- Vệ sinh khu vực làm việc, sắp xếp, chuẩn bị hàng hóa và các điều kiện đảm bảo để thực hiện công việc</p><p>- Bán hàng và chăm sóc khách hàng các Quầy</p><p>- Tham gia các chương trình truyền thông, thu hút khách hàng đến siêu thị: phát tờ rơi, dán poster,.....</p><p>- Tham gia kiểm kê định kỳ/đột xuất tại quầy.</p><p>- Thời gian làm việc xoay ca 8 tiếng/ngày (Ca 1: 06h00 - 14h00 và Ca 2: 14h00 - 22h00)</p>', '<p><br></p><p>- Nam/Nữ trên 18 tuổi. Tốt nghiệp từ 09/12 trở lên</p><p>- Thời gian làm việc: Full time - xoay ca 8 tiếng/ ngày không cố định (Ca 1: 06h00-14h00 &amp; Ca 2 14h00 -22h00)</p><p>- Chăm chỉ, chịu khó, có thể làm việc trong môi trường máy lạnh</p><p>- Không yêu cầu kinh nghiệm</p>', '2023-08-21 06:20:00', 'KCN Sóng Thần, Thủ Đức', 'TTG', '<p><br></p><p>- Lương cơ bản + Phụ cấp hấp dẫn + KPIs tháng theo từng vị trí từ 6 - 9 triệu</p><p>- CBNV trong thời gian thử việc hưởng mức thưởng KPIs = 50% mức thưởng CBNV chính thức&nbsp;</p><p>- Cơ hội được đào tạo và thăng tiến lên các vị trí Quản lý</p><p>- Được hưởng đầy đủ BHXH, BHYT, BH Sức khỏe Bảo Việt và khám sức khỏe định kỳ dành riêng cho CBNV Masan</p><p>- Thưởng lễ, tết, lương tháng 13, thưởng thành tích năm, thưởng các chương trình thi đua tháng, Team building năm</p>', '5PK47658PP9392309', 0),
('1gc274lhx9cekb', '1gc2holhitg82w', 'K-Toan', 'TTS', '10T-15T', '2Y', '(Tân Bình) - Nhân Viên Nhận Hàng', '2023-09-17', 2, '<p><br></p><p>- Vệ sinh khu vực làm việc, sắp xếp, chuẩn bị hàng hóa và các điều kiện đảm bảo để thực hiện công việc</p><p>- Bán hàng và chăm sóc khách hàng các Quầy</p><p>- Tham gia các chương trình truyền thông, thu hút khách hàng đến siêu thị: phát tờ rơi, dán poster,.....</p><p>- Tham gia kiểm kê định kỳ/đột xuất tại quầy.</p><p>- Thời gian làm việc xoay ca 8 tiếng/ngày (Ca 1: 06h00 - 14h00 và Ca 2: 14h00 - 22h00)</p>', '<p><br></p><p>- Nam/Nữ trên 18 tuổi. Tốt nghiệp từ 09/12 trở lên</p><p>- Thời gian làm việc: Full time - xoay ca 8 tiếng/ ngày không cố định (Ca 1: 06h00-14h00 &amp; Ca 2 14h00 -22h00)</p><p>- Chăm chỉ, chịu khó, có thể làm việc trong môi trường máy lạnh</p><p>- Không yêu cầu kinh nghiệm</p>', '2023-08-21 15:20:00', 'KCN Sóng Thần, Thủ Đức', 'TTG', '<p><br></p><p>- Lương cơ bản + Phụ cấp hấp dẫn + KPIs tháng theo từng vị trí từ 6 - 9 triệu</p><p>- CBNV trong thời gian thử việc hưởng mức thưởng KPIs = 50% mức thưởng CBNV chính thức&nbsp;</p><p>- Cơ hội được đào tạo và thăng tiến lên các vị trí Quản lý</p><p>- Được hưởng đầy đủ BHXH, BHYT, BH Sức khỏe Bảo Việt và khám sức khỏe định kỳ dành riêng cho CBNV Masan</p><p>- Thưởng lễ, tết, lương tháng 13, thưởng thành tích năm, thưởng các chương trình thi đua tháng, Team building năm</p>', '5PK47658PP9392309', 0),
('1gc274lhx9dd1z', '1gc2holhitg82w', 'K-Toan', 'TTS', '10T-15T', '2Y', '[Giám Sát Kiểm Kê Chuỗi Winmart / Winmart+] [Winmart HCM / Hn]', '2023-09-17', 2, '<p><br></p><p>- Vệ sinh khu vực làm việc, sắp xếp, chuẩn bị hàng hóa và các điều kiện đảm bảo để thực hiện công việc</p><p>- Bán hàng và chăm sóc khách hàng các Quầy</p><p>- Tham gia các chương trình truyền thông, thu hút khách hàng đến siêu thị: phát tờ rơi, dán poster,.....</p><p>- Tham gia kiểm kê định kỳ/đột xuất tại quầy.</p><p>- Thời gian làm việc xoay ca 8 tiếng/ngày (Ca 1: 06h00 - 14h00 và Ca 2: 14h00 - 22h00)</p>', '<p><br></p><p>- Nam/Nữ trên 18 tuổi. Tốt nghiệp từ 09/12 trở lên</p><p>- Thời gian làm việc: Full time - xoay ca 8 tiếng/ ngày không cố định (Ca 1: 06h00-14h00 &amp; Ca 2 14h00 -22h00)</p><p>- Chăm chỉ, chịu khó, có thể làm việc trong môi trường máy lạnh</p><p>- Không yêu cầu kinh nghiệm</p>', '2023-08-21 10:20:00', 'KCN Sóng Thần, Thủ Đức', 'TTG', '<p><br></p><p>- Lương cơ bản + Phụ cấp hấp dẫn + KPIs tháng theo từng vị trí từ 6 - 9 triệu</p><p>- CBNV trong thời gian thử việc hưởng mức thưởng KPIs = 50% mức thưởng CBNV chính thức&nbsp;</p><p>- Cơ hội được đào tạo và thăng tiến lên các vị trí Quản lý</p><p>- Được hưởng đầy đủ BHXH, BHYT, BH Sức khỏe Bảo Việt và khám sức khỏe định kỳ dành riêng cho CBNV Masan</p><p>- Thưởng lễ, tết, lương tháng 13, thưởng thành tích năm, thưởng các chương trình thi đua tháng, Team building năm</p>', '5PK47658PP9392309', 0),
('1gc274lhx9dr1a', '1gc2holhitg82w', 'K-Toan', 'TTS', '10T-15T', '2Y', 'Nhân Viên Kỹ Thuật Sản Xuất Farm Lâm Đồng 1', '2023-09-17', 2, '<p><br></p><p>- Vệ sinh khu vực làm việc, sắp xếp, chuẩn bị hàng hóa và các điều kiện đảm bảo để thực hiện công việc</p><p>- Bán hàng và chăm sóc khách hàng các Quầy</p><p>- Tham gia các chương trình truyền thông, thu hút khách hàng đến siêu thị: phát tờ rơi, dán poster,.....</p><p>- Tham gia kiểm kê định kỳ/đột xuất tại quầy.</p><p>- Thời gian làm việc xoay ca 8 tiếng/ngày (Ca 1: 06h00 - 14h00 và Ca 2: 14h00 - 22h00)</p>', '<p><br></p><p>- Nam/Nữ trên 18 tuổi. Tốt nghiệp từ 09/12 trở lên</p><p>- Thời gian làm việc: Full time - xoay ca 8 tiếng/ ngày không cố định (Ca 1: 06h00-14h00 &amp; Ca 2 14h00 -22h00)</p><p>- Chăm chỉ, chịu khó, có thể làm việc trong môi trường máy lạnh</p><p>- Không yêu cầu kinh nghiệm</p>', '2023-08-21 10:20:00', 'KCN Sóng Thần, Thủ Đức', 'TTG', '<p><br></p><p>- Lương cơ bản + Phụ cấp hấp dẫn + KPIs tháng theo từng vị trí từ 6 - 9 triệu</p><p>- CBNV trong thời gian thử việc hưởng mức thưởng KPIs = 50% mức thưởng CBNV chính thức&nbsp;</p><p>- Cơ hội được đào tạo và thăng tiến lên các vị trí Quản lý</p><p>- Được hưởng đầy đủ BHXH, BHYT, BH Sức khỏe Bảo Việt và khám sức khỏe định kỳ dành riêng cho CBNV Masan</p><p>- Thưởng lễ, tết, lương tháng 13, thưởng thành tích năm, thưởng các chương trình thi đua tháng, Team building năm</p>', '5PK47658PP9392309', 0),
('1gc274lhx9ebuf', '1gc2holhitg82w', 'K-Toan', 'TTS', '10T-15T', '2Y', 'Nhân Viên Kỹ Thuật Sản Xuất Farm Lâm Đồng', '2023-09-17', 2, '<p><br></p><p>- Vệ sinh khu vực làm việc, sắp xếp, chuẩn bị hàng hóa và các điều kiện đảm bảo để thực hiện công việc</p><p>- Bán hàng và chăm sóc khách hàng các Quầy</p><p>- Tham gia các chương trình truyền thông, thu hút khách hàng đến siêu thị: phát tờ rơi, dán poster,.....</p><p>- Tham gia kiểm kê định kỳ/đột xuất tại quầy.</p><p>- Thời gian làm việc xoay ca 8 tiếng/ngày (Ca 1: 06h00 - 14h00 và Ca 2: 14h00 - 22h00)</p>', '<p><br></p><p>- Nam/Nữ trên 18 tuổi. Tốt nghiệp từ 09/12 trở lên</p><p>- Thời gian làm việc: Full time - xoay ca 8 tiếng/ ngày không cố định (Ca 1: 06h00-14h00 &amp; Ca 2 14h00 -22h00)</p><p>- Chăm chỉ, chịu khó, có thể làm việc trong môi trường máy lạnh</p><p>- Không yêu cầu kinh nghiệm</p>', '2023-08-21 16:20:00', 'KCN Sóng Thần, Thủ Đức', 'TTG', '<p><br></p><p>- Lương cơ bản + Phụ cấp hấp dẫn + KPIs tháng theo từng vị trí từ 6 - 9 triệu</p><p>- CBNV trong thời gian thử việc hưởng mức thưởng KPIs = 50% mức thưởng CBNV chính thức&nbsp;</p><p>- Cơ hội được đào tạo và thăng tiến lên các vị trí Quản lý</p><p>- Được hưởng đầy đủ BHXH, BHYT, BH Sức khỏe Bảo Việt và khám sức khỏe định kỳ dành riêng cho CBNV Masan</p><p>- Thưởng lễ, tết, lương tháng 13, thưởng thành tích năm, thưởng các chương trình thi đua tháng, Team building năm</p>', '5PK47658PP9392309', 0),
('1gc274lhx9eumx', '1gc2holhitg82w', 'K-Toan', 'TTS', '10T-15T', '2Y', '(Bạc Liêu) Tuyển Dụng Bán Hàng Siêu Thị Winmart', '2023-09-17', 2, '<p><br></p><p>- Vệ sinh khu vực làm việc, sắp xếp, chuẩn bị hàng hóa và các điều kiện đảm bảo để thực hiện công việc</p><p>- Bán hàng và chăm sóc khách hàng các Quầy</p><p>- Tham gia các chương trình truyền thông, thu hút khách hàng đến siêu thị: phát tờ rơi, dán poster,.....</p><p>- Tham gia kiểm kê định kỳ/đột xuất tại quầy.</p><p>- Thời gian làm việc xoay ca 8 tiếng/ngày (Ca 1: 06h00 - 14h00 và Ca 2: 14h00 - 22h00)</p>', '<p><br></p><p>- Nam/Nữ trên 18 tuổi. Tốt nghiệp từ 09/12 trở lên</p><p>- Thời gian làm việc: Full time - xoay ca 8 tiếng/ ngày không cố định (Ca 1: 06h00-14h00 &amp; Ca 2 14h00 -22h00)</p><p>- Chăm chỉ, chịu khó, có thể làm việc trong môi trường máy lạnh</p><p>- Không yêu cầu kinh nghiệm</p>', '2023-08-21 16:09:00', 'Siêu thị WinMart khu vực bạc Liêu, Bạc Liêu', 'TTG', '<p><br></p><p>- Lương cơ bản + Phụ cấp hấp dẫn + KPIs tháng theo từng vị trí từ 6 - 9 triệu</p><p>- CBNV trong thời gian thử việc hưởng mức thưởng KPIs = 50% mức thưởng CBNV chính thức&nbsp;</p><p>- Cơ hội được đào tạo và thăng tiến lên các vị trí Quản lý</p><p>- Được hưởng đầy đủ BHXH, BHYT, BH Sức khỏe Bảo Việt và khám sức khỏe định kỳ dành riêng cho CBNV Masan</p><p>- Thưởng lễ, tết, lương tháng 13, thưởng thành tích năm, thưởng các chương trình thi đua tháng, Team building năm</p>', '5PK47658PP9392309', 0),
('1gc274lhx9ge4i', '1gc2holhitg82w', 'K-Toan', 'CTV', '6T-8T', '3Y', '[Quận 2 Cũ] - Nhân Viên Đặt Hàng Siêu Thị Winmart', '2023-09-17', 1, '<p><br></p><p>- Tiếp nhận đơn hàng từ các bộ phận để đặt hàng.</p><p>- Làm việc với NCC để đảm bảo hàng hóa về đúng hạn theo đơn hàng đã đặt.</p><p>- Đặt hàng, chuyển hàng giữa các siêu thị, trả hàng nhà cung cấp, điều chỉnh tồn kho thưc hiện trên hệ thống, kiểm kê hàng hóa siêu thị định kỳ</p><p>- Cập nhật giá hằng ngày theo đúng quy định công ty.</p><p>- Kiểm soát hệ thống thiết bị in ấn tem nhãn, bảng giá; hệ thống máy tính tiền, in hóa đơn tại quầy Thu ngân; hệ thống điện thoại, máy in của Siêu thị.</p><p>- Thực hiện các công việc khác theo sự phân công của quản lý.</p><p>- Làm việc ca 8 tiếng/ngày, chịu được áp lực công việc cao</p><p>- Địa điểm làm việc: Siêu thị Winmart Bình Trừng (Quận 2, HCM)</p>', '<p><br></p><p>- Có kỹ năng tin học văn phòng, đặc biệt thành thạo Excel</p><p>- Có tư duy nhạy bén và khả năng phân tích số liệu.</p><p>- Sơ yếu lý lịch rõ ràng.</p><p>- Trình độ: Ưu tiên Tốt nghiệp từ cao đẳng trở lên chuyên ngành CNTT, Kế toán</p><p>- Kinh nghiệm: 1 năm kinh nghiệm làm công tác quản lý hệ thống, đặt hàng (ưu tiên kinh nghiệm đặt hàng ở các chuổi hệ thống bán lẽ khác), excel</p>', '2023-08-21 16:09:08', 'WinMart Bình Trưng - 231 Nguyễn Thị Định, Thủ Đức', 'BTG', '<p><br></p><p>- Thu nhập hấp dẫn bao gồm lương cơ bản + thưởng KPI tháng (lên đến 9 triệu )</p><p>- Cơ hội được đào tạo và thăng tiến lên các vị trí Quản lý</p><p>- Được hưởng đầy đủ BHXH, BHYT, BH Sức khỏe Bảo Việt và khám sức khỏe định kỳ dành riêng cho CBNV Masan</p><p>- Thưởng lễ, tết, lương tháng 13, thưởng thành tích năm, thưởng các chương trình thi đua tháng, Team building năm</p>', '5PK47658PP9392309', 0),
('1gc274lhxb28g1', '1gc5holhaq7j4l', 'KD', 'TTS', '3T-6T', 'CCKN', 'Thực Tập Sinh Lập Trình Viên - Developer (HCM / Hà Nội / Cần Thơ)', '2023-09-17', 2, '<p><br></p><ul><li>Tham gia phát triển các hệ thống: phần mềm quản trị theo từng ngành nghề kinh tế Việt Nam , lập trình web app và các project thực tế.</li><li>Tìm hiểu công nghệ theo yêu cầu</li><li>Tham gia lập kế hoạch, báo cáo, phối hợp công việc với các thành viên khác trong nhóm.</li><li>Làm việc theo sự phân công của quản lý.</li></ul>', '<p><br></p><div><ul><li>Có kiến thức cấu trúc dữ liệu và giải thuật,</li><li>Có kinh nghiệm lập trình App, Web,</li><li>Sử dụng thành thạo HTML, CSS, Javascript, các framework frontend (angular,Reactjs,...)</li><li>Hiểu về nền tảng Appsheet là một ưu thế.</li><li>Thích thú với việc nghiên cứu, tìm tòi và áp dụng kỹ thuật mới</li><li>Có hiểu biết về nền tảng .NET, các kỹ thuật cơ bản trong .NET technology: C#, MSSQL Server, Devexpress Ưu tiên các bạn đã làm Project (kèm theo link Github).</li><li>Chăm chỉ, chịu khó, có tinh thần chủ động học hỏi, không ngại khó ngại khổ.</li><li>Tư duy logic, sẵn sàng học thêm một ngôn ngữ (lập trình) mới. Thời gian làm việc full-time hoặc partime &gt; 4-5 buổi/tuần (được sắp xếp linh động theo lịch học)</li></ul></div><h4>Quyền lợi</h4>', '2023-08-21 16:23:08', '29 Calmette, P.Nguyễn Thái Bình, Quận 1', 'BTG', '<p><br></p><ul><li>Được đào tạo các quy trình và cách thức vận hành thực hiện công việc trong thời gian thực tập</li><li>Môi trường làm việc mở, năng động, thân thiện và luôn được giúp đỡ hoặc đưa ra ý kiến.</li><li>Cơ hội học hỏi, va chạm và tham gia các dự án quan trọng của tập đoàn.</li><li>Có cơ hội trở thành nhân viên chính thức của công ty sau 2-3 tháng đào tạo với nhiều chế độ quyền lợi và chính sách phúc lợi hấp dẫn.</li><li>Được công ty hỗ trợ và tài trợ 100% chi phí học các chứng nhận chuyên ngành do tổ chức quốc tế cấp.</li><li>Có thể hỗ trợ dấu thực tập.</li><li>Mức hỗ trợ: 1,000,0000/ứng viên.</li><li>Có khu vực relax, cafe.</li><li>Team building, sinh nhật nhân viên, Year End Party, trà sữa,...</li><li>Phụ cấp khác: dựa theo năng lực và thời gian đóng góp từng ứng viên.</li></ul>', '80R33567U5582534H', 0),
('1gc274lhxb3h9v', '1gc5holhaq7j4l', 'KD', 'TTS', '3T-6T', 'CCKN', 'Nhân Viên Chăm Sóc Khách Hàng (Customer Service Officer)', '2023-09-17', 2, '<p><br></p><ul><li>Tham gia phát triển các hệ thống: phần mềm quản trị theo từng ngành nghề kinh tế Việt Nam , lập trình web app và các project thực tế.</li><li>Tìm hiểu công nghệ theo yêu cầu</li><li>Tham gia lập kế hoạch, báo cáo, phối hợp công việc với các thành viên khác trong nhóm.</li><li>Làm việc theo sự phân công của quản lý.</li></ul>', '<p><br></p><div><ul><li>Có kiến thức cấu trúc dữ liệu và giải thuật,</li><li>Có kinh nghiệm lập trình App, Web,</li><li>Sử dụng thành thạo HTML, CSS, Javascript, các framework frontend (angular,Reactjs,...)</li><li>Hiểu về nền tảng Appsheet là một ưu thế.</li><li>Thích thú với việc nghiên cứu, tìm tòi và áp dụng kỹ thuật mới</li><li>Có hiểu biết về nền tảng .NET, các kỹ thuật cơ bản trong .NET technology: C#, MSSQL Server, Devexpress Ưu tiên các bạn đã làm Project (kèm theo link Github).</li><li>Chăm chỉ, chịu khó, có tinh thần chủ động học hỏi, không ngại khó ngại khổ.</li><li>Tư duy logic, sẵn sàng học thêm một ngôn ngữ (lập trình) mới. Thời gian làm việc full-time hoặc partime &gt; 4-5 buổi/tuần (được sắp xếp linh động theo lịch học)</li></ul></div><h4>Quyền lợi</h4>', '2023-08-21 08:23:08', '29 Calmette, P.Nguyễn Thái Bình, Quận 1', 'BTG', '<p><br></p><ul><li>Được đào tạo các quy trình và cách thức vận hành thực hiện công việc trong thời gian thực tập</li><li>Môi trường làm việc mở, năng động, thân thiện và luôn được giúp đỡ hoặc đưa ra ý kiến.</li><li>Cơ hội học hỏi, va chạm và tham gia các dự án quan trọng của tập đoàn.</li><li>Có cơ hội trở thành nhân viên chính thức của công ty sau 2-3 tháng đào tạo với nhiều chế độ quyền lợi và chính sách phúc lợi hấp dẫn.</li><li>Được công ty hỗ trợ và tài trợ 100% chi phí học các chứng nhận chuyên ngành do tổ chức quốc tế cấp.</li><li>Có thể hỗ trợ dấu thực tập.</li><li>Mức hỗ trợ: 1,000,0000/ứng viên.</li><li>Có khu vực relax, cafe.</li><li>Team building, sinh nhật nhân viên, Year End Party, trà sữa,...</li><li>Phụ cấp khác: dựa theo năng lực và thời gian đóng góp từng ứng viên.</li></ul>', '80R33567U5582534H', 0),
('1gc274lhxb401r', '1gc5holhaq7j4l', 'KD', 'TTS', '3T-6T', 'CCKN', 'Nhân Viên Pháp Lý Thu Hồi Công Nợ', '2023-09-17', 2, '<p><br></p><ul><li>Tham gia phát triển các hệ thống: phần mềm quản trị theo từng ngành nghề kinh tế Việt Nam , lập trình web app và các project thực tế.</li><li>Tìm hiểu công nghệ theo yêu cầu</li><li>Tham gia lập kế hoạch, báo cáo, phối hợp công việc với các thành viên khác trong nhóm.</li><li>Làm việc theo sự phân công của quản lý.</li></ul>', '<p><br></p><div><ul><li>Có kiến thức cấu trúc dữ liệu và giải thuật,</li><li>Có kinh nghiệm lập trình App, Web,</li><li>Sử dụng thành thạo HTML, CSS, Javascript, các framework frontend (angular,Reactjs,...)</li><li>Hiểu về nền tảng Appsheet là một ưu thế.</li><li>Thích thú với việc nghiên cứu, tìm tòi và áp dụng kỹ thuật mới</li><li>Có hiểu biết về nền tảng .NET, các kỹ thuật cơ bản trong .NET technology: C#, MSSQL Server, Devexpress Ưu tiên các bạn đã làm Project (kèm theo link Github).</li><li>Chăm chỉ, chịu khó, có tinh thần chủ động học hỏi, không ngại khó ngại khổ.</li><li>Tư duy logic, sẵn sàng học thêm một ngôn ngữ (lập trình) mới. Thời gian làm việc full-time hoặc partime &gt; 4-5 buổi/tuần (được sắp xếp linh động theo lịch học)</li></ul></div><h4>Quyền lợi</h4>', '2023-08-21 08:23:28', '29 Calmette, P.Nguyễn Thái Bình, Quận 1', 'BTG', '<p><br></p><ul><li>Được đào tạo các quy trình và cách thức vận hành thực hiện công việc trong thời gian thực tập</li><li>Môi trường làm việc mở, năng động, thân thiện và luôn được giúp đỡ hoặc đưa ra ý kiến.</li><li>Cơ hội học hỏi, va chạm và tham gia các dự án quan trọng của tập đoàn.</li><li>Có cơ hội trở thành nhân viên chính thức của công ty sau 2-3 tháng đào tạo với nhiều chế độ quyền lợi và chính sách phúc lợi hấp dẫn.</li><li>Được công ty hỗ trợ và tài trợ 100% chi phí học các chứng nhận chuyên ngành do tổ chức quốc tế cấp.</li><li>Có thể hỗ trợ dấu thực tập.</li><li>Mức hỗ trợ: 1,000,0000/ứng viên.</li><li>Có khu vực relax, cafe.</li><li>Team building, sinh nhật nhân viên, Year End Party, trà sữa,...</li><li>Phụ cấp khác: dựa theo năng lực và thời gian đóng góp từng ứng viên.</li></ul>', '80R33567U5582534H', 0),
('1gc2iklhx83cuk', '8z0lhalx9m5', 'KD', 'QLCC', '8T-10T', '1N', 'Hòa Bình_Nhân Viên Tư Vấn Kinh Doanh', '2023-09-10', 2, '<p>Tư vấn cho khách hàng hiểu và sử dụng dịch vụ hỗ trợ cho vay và mua xe gắn máy/ các sản phẩm điện máy trả góp của Công ty.<br></p><p>- Thực hiện làm hồ sơ cho khách hàng vay và gởi hồ sơ cho bộ phận tín dụng.</p><p>- Hướng dẫn khách hàng ký hợp đồng và nhận xe/ các sản phẩm điện máy tại cửa hàng khi hồ sơ vay được duyệt.</p><p>- Thu thập các thông tin thị trường, đối thủ cạnh tranh, ý kiến của khách hàng và đại lý đối tác.</p><p>- Thu thập và phản hồi các yêu cầu của Đại lý đối tác về phòng Kinh doanh.</p><p>- Thực hiện báo cáo theo quy định</p><p>* Làm việc ngoài thị trường tại các cửa hàng xe gắn máy/ các sản phẩm điện máy khu vực TP. Hòa Bình</p>', '<p><br></p><p>- Độ tuổi: 18 - 30</p><p>- Trình độ THPT trở lên, Biết sử dụng Word, Excel.</p><p>- Độc lập, tự tin, tươi vui, hoạt bát, nhanh nhẹn; có trách nhiệm, tinh thần hoạt động đội nhóm tốt.</p><p>- Có kinh nghiệm tư vấn bán hàng là một lợi thế.</p><p>- Ứng viên không có kinh nghiệm sẽ được đào tạo.</p>', '2023-08-21 00:00:00', 'Hòa Bình, Hòa Bình', 'TTG', '<p>- Được hưởng nguyên lương trong thời gian đào tạo và thử việc<br></p><p>- Thời gian làm việc: 8 giờ/ ngày (theo ca), 5 hoặc 6 ngày/ tuần</p><p>- Được tham gia BHXH, BHYT &amp; BHTN đầy đủ</p><p>- Được Công ty mua Bảo hiểm tai nạn ngay ngày đầu tiên đi làm</p><p>- Thưởng thêm vào cuối năm</p><p>- Phép năm: 12 ngày và cộng thêm theo thâm niên</p><p>- Khám sức khỏe, du lịch định kỳ hằng năm</p>', '02T00165Y0689245U', 0),
('1gc37slhxeotww', '1gc5holhaq7j4l', 'K-Toan', 'senior', '1T-3T', '2Y', '12', '2023-01-31', 12, '<p>12</p>', '<p>12</p>', '2023-08-21 04:23:28', '12', 'BTG', '<p>12</p>', '80R33567U5582534H', 0),
('1gc37slhxetogw', '1gc5holhaq7j4l', 'K-Toan', 'senior', '1T-3T', '2Y', '12123', '2023-01-31', 12, '<p>12</p>', '<p>12</p>', '2023-08-21 19:43:48', '12', 'BTG', '<p>12</p>', '80R33567U5582534H', 0),
('1gc60slhvv3q3u', '1gc3uklgomt0oc', 'ITPC', 'CTV', '3T-6T', '1N', 'Fresher ReactJS [Đà Nẵng]', '2023-09-26', 2, '<p>w</p>', '<p>we</p>', '2023-08-21 04:34:28', '02 Thanh Sơn', 'TTG', '<p>we</p>', '7PK10048FX876522W', 0),
('1gc6f0lhx8oxms', '1gc7kwlhilr5ep', 'ITPM', 'QLCC', '15T-20T', '2Y', 'Nhân Viên Hỗ Trợ Thanh Toán Tại Địa Bàn - Hồ Chí Minh', '2023-09-30', 2, '<p><br></p><ul><li>Liên hệ trực tiếp với khách hàng trong khu vực được phân công để hướng dẫn thanh toán các khoản phí</li><li>Hỗ trợ giải đáp thắc mắc có liên quan đến quá trình thanh toán của khách hàng.</li><li>Kiểm tra và gửi yêu cầu hỗ trợ những trường hợp đặt biệt khi nhận được thông tin của khách hàng</li><li>Các công việc khác được giao</li></ul>', '<p><br></p><p>Trình độ học vấn: Tốt nghiệp Trung học phổ thông trở lên</p><p>Kỹ năng</p><p>- Kỹ năng giao tiếp</p><p>- Kỹ năng đàm phán</p><p>- Kỹ năng thuyết phục</p><p>- Kỹ năng vi tính văn phòng</p>', '2023-05-21 09:34:28', 'Tòa nhà Daili, 24C Phan Đăng Lưu, Phường 6, Bình Thạnh', 'TTG', '<p><br></p><p>- Lương tháng 13, thưởng theo thâm niên.</p><p>- Ký Hợp đồng Lao động chính thức sau 2 tháng thử việc.</p><p>- Chế độ Bảo hiểm xã hội, Bảo hiểm thất nghiệp, Bảo hiểm y tế theo quy định Nhà nước.</p><p>- Bảo hiểm tai nạn 24/24.</p><p>- Khám sức khỏe định kỳ.</p><p>- Nghỉ 15 ngày phép/năm.</p><p>- Các hoạt động teambuilding hàng năm, các khóa đào tạo phát triển</p>', '5C908696JC076614M', 0),
('1gc6f0lhx8rrjo', '1gc7kwlhilr5ep', 'K-Toan', 'QLCC', '10T-15T', '2Y', 'Nhân Viên Tư Vấn Tín Dụng - Kênh Trả Góp - Tỉnh Bình Dương', '2023-09-17', 1, '<p><br></p><ul><li>Khi trở thành Nhân viên tư vấn tín dụng (kênh trả góp), bạn được sử dụng những kỹ năng giao tiếp khéo léo của mình để tìm hiểu nguyện vọng của Khách hàng. Cùng với những hiểu biết về sản phẩm cho vay trong quá trình được đào tạo tại công ty, bạn sẽ có kiến thức sau đào tạo để tư vấn chính xác những sản phẩm kèm lãi suất phù hợp theo nhu cầu của Khách và đồng thời làm hồ sơ trả góp khi Khách hàng chấp thuận.</li><li>Khi khách hàng đã được duyệt hồ sơ vay, bạn chủ động quản lý danh sách khách hàng, chăm sóc và hỗ trợ họ đầy đủ thông tin đóng phí định kỳ hằng tháng</li><li>Thực hiện các nghiệp vụ bán hàng nhằm nâng cao sự hài lòng của khách hàng, qua đó bạn sẽ được nguồn khách hàng mới qua việc giới thiệu từ khách hàng cũ</li><li>Bạn phải đảm bảo các chỉ tiêu kinh doanh và quản lý các chỉ số rủi ro hợp đồng</li><li>Thực hiện các báo các hằng ngày/ tuần/ tháng hoặc định kỳ theo quy định</li><li>Với phương châm Khách hàng là ưu tiên số một, sự thân thiện, thấu hiểu kèm theo đó là một nụ cười tươi, thân thiện sẽ luôn đồng hành với bạn trong suốt khoảng thời gian làm việc tại HD SAISON.</li></ul>', '<p><br></p><ul><li>Bạn chỉ cần tốt nghiệp trình độ từ THPT trở lên.</li><li>Bạn có ưu thế về ngoại hình.</li><li>Bạn có đam mê với công việc bán hàng, và tiếp xúc, chăm sóc khách hàng.</li><li>Bạn tự tin với kỹ năng giao tiếp, là người vui vẻ, hòa đồng với mọi người.</li><li>Bạn có khả năng làm việc dưới áp lực cao.</li><li>Có kinh nghiệm làm việc trong ngành tài chính hoặc ngành bán lẻ là một lợi thế</li></ul>', '2023-05-21 00:00:00', 'Tân Uyên, Bến Cát, Thuận An, Bàu Bàng, Dầu Tiếng, Dĩ An, Thủ Dầu Một', 'TTG', '<p><br></p><ul><li>Làm việc trong một môi trường chuyên nghiệp, luôn không ngừng phát triển với nhiều cơ hội thăng tiến;</li><li>Thu nhập lương ổn định: bao gồm Lương Căn Bản+ Phụ Cấp + khoản Thưởng doanh thu tháng;</li><li>Thưởng theo doanh thu định kỳ hằng tháng với khoản thưởng hấp dẫn dựa vào năng lực cá nhân và cam kết khoản lương tháng 13;</li><li>Ngoài 12 ngày phép năm theo quy định luật lao động , bạn còn được hưởng&nbsp;thêm 3 ngày phép theo quy định&nbsp;Công ty và 1 ngày nghỉ Giáng sinh.;</li><li>Định hướng đào tạo và phát triển: được hỗ trợ đào tạo huấn luyện nghiệp vụ đầu vào để bạn nắm bắt công việc, trong quá trình làm việc - được tham gia các khóa học do trung tâm đào tạo nội bộ hoạch định mang đến cho bạn các kiến thức bổ trợ cho công việc cũng như định hướng thăng tiến theo năng lực cá nhân;</li><li>Được hưởng 100% lương trong thời gian thử việc, được đóng đầy đủ toàn bộ các chế độ bảo hiểm sau khi ký hợp đồng lao động chính thức;</li><li>Định kỳ hằng năm có tham gia chế độ chăm sóc sức khỏe cho chính bạn và được tham gia gói ưu đãi khi mua bảo hiểm tự nguyện dành cho người thân;</li><li>Tổ chức định kỳ hằng năm các hoạt động phát triển đội nhóm gắn kết nhân viên;</li><li>Tham gia các hoạt động dành cho đoàn viên, được quan tâm đến các hoạt động hỗ trợ tinh thần như hiếu hỉ, sinh nhật, thăm hỏi ốm đau, tương thân tương ái hỗ trợ vượt qua giai đoạn khó khăn v.v..</li></ul>', '5C908696JC076614M', 0),
('1gc6f0lhx8rw42', '1gc7kwlhilr5ep', 'K-Toan', 'QLCC', '10T-15T', '2Y', 'Nhân Viên Tư Vấn Tín Dụng - Kênh Trả Góp - Tỉnh Bình Dương', '2023-09-17', 1, '<p><br></p><ul><li>Khi trở thành Nhân viên tư vấn tín dụng (kênh trả góp), bạn được sử dụng những kỹ năng giao tiếp khéo léo của mình để tìm hiểu nguyện vọng của Khách hàng. Cùng với những hiểu biết về sản phẩm cho vay trong quá trình được đào tạo tại công ty, bạn sẽ có kiến thức sau đào tạo để tư vấn chính xác những sản phẩm kèm lãi suất phù hợp theo nhu cầu của Khách và đồng thời làm hồ sơ trả góp khi Khách hàng chấp thuận.</li><li>Khi khách hàng đã được duyệt hồ sơ vay, bạn chủ động quản lý danh sách khách hàng, chăm sóc và hỗ trợ họ đầy đủ thông tin đóng phí định kỳ hằng tháng</li><li>Thực hiện các nghiệp vụ bán hàng nhằm nâng cao sự hài lòng của khách hàng, qua đó bạn sẽ được nguồn khách hàng mới qua việc giới thiệu từ khách hàng cũ</li><li>Bạn phải đảm bảo các chỉ tiêu kinh doanh và quản lý các chỉ số rủi ro hợp đồng</li><li>Thực hiện các báo các hằng ngày/ tuần/ tháng hoặc định kỳ theo quy định</li><li>Với phương châm Khách hàng là ưu tiên số một, sự thân thiện, thấu hiểu kèm theo đó là một nụ cười tươi, thân thiện sẽ luôn đồng hành với bạn trong suốt khoảng thời gian làm việc tại HD SAISON.</li></ul>', '<p><br></p><ul><li>Bạn chỉ cần tốt nghiệp trình độ từ THPT trở lên.</li><li>Bạn có ưu thế về ngoại hình.</li><li>Bạn có đam mê với công việc bán hàng, và tiếp xúc, chăm sóc khách hàng.</li><li>Bạn tự tin với kỹ năng giao tiếp, là người vui vẻ, hòa đồng với mọi người.</li><li>Bạn có khả năng làm việc dưới áp lực cao.</li><li>Có kinh nghiệm làm việc trong ngành tài chính hoặc ngành bán lẻ là một lợi thế</li></ul>', '2023-05-21 00:00:00', 'Tân Uyên, Bến Cát, Thuận An, Bàu Bàng, Dầu Tiếng, Dĩ An, Thủ Dầu Một', 'TTG', '<p><br></p><ul><li>Làm việc trong một môi trường chuyên nghiệp, luôn không ngừng phát triển với nhiều cơ hội thăng tiến;</li><li>Thu nhập lương ổn định: bao gồm Lương Căn Bản+ Phụ Cấp + khoản Thưởng doanh thu tháng;</li><li>Thưởng theo doanh thu định kỳ hằng tháng với khoản thưởng hấp dẫn dựa vào năng lực cá nhân và cam kết khoản lương tháng 13;</li><li>Ngoài 12 ngày phép năm theo quy định luật lao động , bạn còn được hưởng&nbsp;thêm 3 ngày phép theo quy định&nbsp;Công ty và 1 ngày nghỉ Giáng sinh.;</li><li>Định hướng đào tạo và phát triển: được hỗ trợ đào tạo huấn luyện nghiệp vụ đầu vào để bạn nắm bắt công việc, trong quá trình làm việc - được tham gia các khóa học do trung tâm đào tạo nội bộ hoạch định mang đến cho bạn các kiến thức bổ trợ cho công việc cũng như định hướng thăng tiến theo năng lực cá nhân;</li><li>Được hưởng 100% lương trong thời gian thử việc, được đóng đầy đủ toàn bộ các chế độ bảo hiểm sau khi ký hợp đồng lao động chính thức;</li><li>Định kỳ hằng năm có tham gia chế độ chăm sóc sức khỏe cho chính bạn và được tham gia gói ưu đãi khi mua bảo hiểm tự nguyện dành cho người thân;</li><li>Tổ chức định kỳ hằng năm các hoạt động phát triển đội nhóm gắn kết nhân viên;</li><li>Tham gia các hoạt động dành cho đoàn viên, được quan tâm đến các hoạt động hỗ trợ tinh thần như hiếu hỉ, sinh nhật, thăm hỏi ốm đau, tương thân tương ái hỗ trợ vượt qua giai đoạn khó khăn v.v..</li></ul>', '5C908696JC076614M', 0),
('1gc6f0lhx8wdk3', '1gc7kwlhilr5ep', 'K-Toan', 'QLCC', '15T-20T', '2Y', 'Nhân Viên Hỗ Trợ Thanh Toán Tại Địa Bàn Tại Quảng Ninh', '2023-09-24', 1, '<p><br></p><p><strong>1.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</strong>Liên hệ trực tiếp với khách hàng trong khu vực được phân công để hướng dẫn thanh toán các khoản phí.</p><p><strong>2.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</strong>Hỗ trợ, giải đáp các thắc mắc có liên quan đến quá trình thanh toán của khách hàng.</p><p><strong>3.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</strong>Kiểm tra và gửi yêu cầu hỗ trợ những trường hợp đặc biệt khi nhận được thông tin của khách hàng.</p><div><br></div>', '<p><br></p><p>-&nbsp;&nbsp;&nbsp;Tốt nghiệp THPT</p><p>-&nbsp;&nbsp;&nbsp;Sẵn sàng di chuyển, am hiểu địa bàn được phân công.</p><p>-&nbsp;&nbsp;&nbsp;Kỹ năng đàm phán, thuyết phục, xử lý tình huống.</p>', '2023-05-21 00:00:00', 'Đông Triều, Đông Triều', 'TTG', '<p><br></p><ul><li>Lương tháng 13, thưởng theo thâm niên.</li><li>Ký Hợp đồng Lao động chính thức sau 2 tháng thử việc.</li><li>Chế độ Bảo hiểm xã hội, Bảo hiểm thất nghiệp, Bảo hiểm y tế theo quy định Nhà nước.</li><li>Bảo hiểm tai nạn 24/24.</li><li>Khám sức khỏe định kỳ.</li><li>Nghỉ 15 ngày phép/năm.</li><li>Các hoạt động teambuilding hàng năm, các khóa đào tạo phát triển</li></ul>', '5C908696JC076614M', 0),
('1gc6f0lhx8wuz0', '1gc7kwlhilr5ep', 'K-Toan', 'QLCC', '15T-20T', '2Y', 'Nhân Viên Tín Dụng Tại Hải Dương', '2023-09-24', 1, '<p><br></p><p><strong>1.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</strong>Liên hệ trực tiếp với khách hàng trong khu vực được phân công để hướng dẫn thanh toán các khoản phí.</p><p><strong>2.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</strong>Hỗ trợ, giải đáp các thắc mắc có liên quan đến quá trình thanh toán của khách hàng.</p><p><strong>3.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</strong>Kiểm tra và gửi yêu cầu hỗ trợ những trường hợp đặc biệt khi nhận được thông tin của khách hàng.</p><div><br></div>', '<p><br></p><p>-&nbsp;&nbsp;&nbsp;Tốt nghiệp THPT</p><p>-&nbsp;&nbsp;&nbsp;Sẵn sàng di chuyển, am hiểu địa bàn được phân công.</p><p>-&nbsp;&nbsp;&nbsp;Kỹ năng đàm phán, thuyết phục, xử lý tình huống.</p>', '2023-05-21 00:00:00', 'Đông Triều, Đông Triều', 'TTG', '<p><br></p><ul><li>Lương tháng 13, thưởng theo thâm niên.</li><li>Ký Hợp đồng Lao động chính thức sau 2 tháng thử việc.</li><li>Chế độ Bảo hiểm xã hội, Bảo hiểm thất nghiệp, Bảo hiểm y tế theo quy định Nhà nước.</li><li>Bảo hiểm tai nạn 24/24.</li><li>Khám sức khỏe định kỳ.</li><li>Nghỉ 15 ngày phép/năm.</li><li>Các hoạt động teambuilding hàng năm, các khóa đào tạo phát triển</li></ul>', '5C908696JC076614M', 0),
('1gc6f0lhx8x9k8', '1gc7kwlhilr5ep', 'K-Toan', 'QLCC', '15T-20T', '2Y', 'Nhân Viên Tư Vấn Tín Dụng Tại Hưng Yên', '2023-09-24', 1, '<p><br></p><p><strong>1.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</strong>Liên hệ trực tiếp với khách hàng trong khu vực được phân công để hướng dẫn thanh toán các khoản phí.</p><p><strong>2.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</strong>Hỗ trợ, giải đáp các thắc mắc có liên quan đến quá trình thanh toán của khách hàng.</p><p><strong>3.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</strong>Kiểm tra và gửi yêu cầu hỗ trợ những trường hợp đặc biệt khi nhận được thông tin của khách hàng.</p><div><br></div>', '<p><br></p><p>-&nbsp;&nbsp;&nbsp;Tốt nghiệp THPT</p><p>-&nbsp;&nbsp;&nbsp;Sẵn sàng di chuyển, am hiểu địa bàn được phân công.</p><p>-&nbsp;&nbsp;&nbsp;Kỹ năng đàm phán, thuyết phục, xử lý tình huống.</p>', '2023-05-21 00:00:00', 'Đông Triều, Đông Triều', 'TTG', '<p><br></p><ul><li>Lương tháng 13, thưởng theo thâm niên.</li><li>Ký Hợp đồng Lao động chính thức sau 2 tháng thử việc.</li><li>Chế độ Bảo hiểm xã hội, Bảo hiểm thất nghiệp, Bảo hiểm y tế theo quy định Nhà nước.</li><li>Bảo hiểm tai nạn 24/24.</li><li>Khám sức khỏe định kỳ.</li><li>Nghỉ 15 ngày phép/năm.</li><li>Các hoạt động teambuilding hàng năm, các khóa đào tạo phát triển</li></ul>', '5C908696JC076614M', 0),
('1gc6f0lhx8xq0u', '1gc7kwlhilr5ep', 'K-Toan', 'QLCC', '20T-30T', '2Y', 'Trưởng Nhóm Nhắc Phí Qua Tổng Đài', '2023-09-24', 1, '<p><br></p><p><strong>1.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</strong>Liên hệ trực tiếp với khách hàng trong khu vực được phân công để hướng dẫn thanh toán các khoản phí.</p><p><strong>2.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</strong>Hỗ trợ, giải đáp các thắc mắc có liên quan đến quá trình thanh toán của khách hàng.</p><p><strong>3.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</strong>Kiểm tra và gửi yêu cầu hỗ trợ những trường hợp đặc biệt khi nhận được thông tin của khách hàng.</p><div><br></div>', '<p><br></p><p>-&nbsp;&nbsp;&nbsp;Tốt nghiệp THPT</p><p>-&nbsp;&nbsp;&nbsp;Sẵn sàng di chuyển, am hiểu địa bàn được phân công.</p><p>-&nbsp;&nbsp;&nbsp;Kỹ năng đàm phán, thuyết phục, xử lý tình huống.</p>', '2023-05-21 00:00:00', 'Đông Triều, Đông Triều', 'TTG', '<p><br></p><ul><li>Lương tháng 13, thưởng theo thâm niên.</li><li>Ký Hợp đồng Lao động chính thức sau 2 tháng thử việc.</li><li>Chế độ Bảo hiểm xã hội, Bảo hiểm thất nghiệp, Bảo hiểm y tế theo quy định Nhà nước.</li><li>Bảo hiểm tai nạn 24/24.</li><li>Khám sức khỏe định kỳ.</li><li>Nghỉ 15 ngày phép/năm.</li><li>Các hoạt động teambuilding hàng năm, các khóa đào tạo phát triển</li></ul>', '5C908696JC076614M', 0),
('1gc6f0lhx8y3io', '1gc7kwlhilr5ep', 'K-Toan', 'QLCC', '10T-15T', '2Y', 'Nhân Viên Tư Vấn Tín Dụng - Kênh Trả Góp Xe Máy - Tỉnh Đồng Nai', '2023-09-24', 1, '<p><br></p><p><strong>1.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</strong>Liên hệ trực tiếp với khách hàng trong khu vực được phân công để hướng dẫn thanh toán các khoản phí.</p><p><strong>2.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</strong>Hỗ trợ, giải đáp các thắc mắc có liên quan đến quá trình thanh toán của khách hàng.</p><p><strong>3.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</strong>Kiểm tra và gửi yêu cầu hỗ trợ những trường hợp đặc biệt khi nhận được thông tin của khách hàng.</p><div><br></div>', '<p><br></p><p>-&nbsp;&nbsp;&nbsp;Tốt nghiệp THPT</p><p>-&nbsp;&nbsp;&nbsp;Sẵn sàng di chuyển, am hiểu địa bàn được phân công.</p><p>-&nbsp;&nbsp;&nbsp;Kỹ năng đàm phán, thuyết phục, xử lý tình huống.</p>', '2023-05-21 13:34:28', 'Đông Triều, Đông Triều', 'TTG', '<p><br></p><ul><li>Lương tháng 13, thưởng theo thâm niên.</li><li>Ký Hợp đồng Lao động chính thức sau 2 tháng thử việc.</li><li>Chế độ Bảo hiểm xã hội, Bảo hiểm thất nghiệp, Bảo hiểm y tế theo quy định Nhà nước.</li><li>Bảo hiểm tai nạn 24/24.</li><li>Khám sức khỏe định kỳ.</li><li>Nghỉ 15 ngày phép/năm.</li><li>Các hoạt động teambuilding hàng năm, các khóa đào tạo phát triển</li></ul>', '5C908696JC076614M', 0),
('1gc708lhvwpurw', '1gc3uklgomt0oc', 'ITPM', 'QLCC', '1T-3T', '3Y', 'Lập trình PHP', '2023-05-31', 1, '<p>asd</p>', '<p>asd</p>', '2023-05-20 00:00:00', 'asdas', 'TTG', '<p>sad</p>', '7PK10048FX876522W', 0),
('1gc8e4liicnzzg', '8z0lhalx9m5', 'ITPM', 'CTV', '20T-30T', '2Y', 'Nhân Viên Bán Hàng - Kênh Mt', '2023-06-30', 2, '<p>- Tuân thủ tần suất ghé thăm, lịch làm việc theo quy định.</p><p>- Tư vấn bán hàng.</p><p>- Kiểm tra tồn kho, date hàng hóa tại CH.</p><p>- Sắp xếp trưng bày sản phẩm, đảo date, đảm bảo hàng hóa đầy đủ trên quầy kệ.&nbsp;</p><p>- Triển khai các CTKM, vật dụng POSM, bảng giá,…</p><p>- Luân chuyển hàng hóa qua lại giữa các CH (điểm cần hàng, dư hàng, thiếu</p><p>hàng), lấy các thông tin cần tăng/giảm hàng hóa tại CH.</p><p>- Hỗ trợ cửa hàng giải quyết khiếu nại thiếu thừa hàng hóa khi giao nhận.</p><p>- Phối hợp cùng MKT, Trade MKT khi chạy các chương trình KM, tung sản phẩm</p><p>mới, các chiến dịch khai trương CH.</p><p>- Báo cáo tình hình bán hàng, các sự cố và đề xuất khắc phục.</p>', '<p>\'- Tốt nghiệp THPT trở lên.</p><p>- Siêng năng, chịu khó, thật thà, chủ động.</p><p>- Có kinh nghiệm siêu thị là 1 lợi thế.</p><p>- Có điện thoại smart phone.</p>', '2023-06-05 11:26:34', 'Central Plaza, 17 Lê Duẩn, Quận 1, TP. HCM, Quận 1', 'TTG', '<p>• Được tham gia BHXH, BHYT, BHTN theo quy định - Bảo hiểm Aon cho cấp Sup</p><p>• Tham gia các khóa tập huấn, khóa huấn luyện kỹ năng làm việc chuyên nghiệp.</p><p>• Thưởng theo kết quả kinh doanh, lương tháng 13, dịp Lễ, Tết.</p><p>• Chế độ nghỉ phép theo quy định của nhà nước.</p>', '1YD56786HR888024X', 0),
('1gc8e4liicowhr', '8z0lhalx9m5', 'ITPM', 'QLCC', '20T-30T', '2Y', 'Nhân Viên Kinh Doanh', '2023-06-30', 1, '<p>&nbsp;• Tìm hiểu, nghiên cứu về các sản phẩm của công ty để giới thiệu, tư vấn và giải đáp thắc mắc cho khách hàng.</p><p>&nbsp;• Đàm phán, thương lượng với khách hàng về giá cả, hợp đồng, tiến hành chốt đơn và hỗ trợ khách hàng ký hợp đồng.</p><p>&nbsp;• Chăm sóc khách hàng sau khi bán hàng, duy trì mối quan hệ với khách hàng hiện tại.</p><p>&nbsp;• Tìm kiến nguồn khách hàng mới, có nhu cầu xây dựng data, mở rộng phát triển quan hệ</p><p>&nbsp;• Thực hiện các công việc khác theo sự phân công của cấp trên.</p>', '<p>• Tốt nghiệp chuyên ngành Kinh tế, Quản trị kinh doanh…</p><p>&nbsp;• Năng động, nhiệt tình trong công việc</p><p>&nbsp;• Khả năng giao tiếp, xây dựng quan hệ</p><p>&nbsp;• Thành thạo tin học văn phòng</p>', '2023-06-05 11:27:16', '353/70 đường HT13, KP3, Phường Hiệp Thành, Quận 12', 'HD', '<p>&nbsp;• Thu nhập hấp dẫn (mức lương cơ bản + hoa hồng + thưởng)</p><p>&nbsp;• Được hưởng đầy đủ BHXH, BHYT và BHTN theo Luật lao động hiện hành</p><p>&nbsp;• Môi trường làm việc chuyên nghiệp, năng động, được đào tạo với các chuyên gia huấn luyện, cơ hội thăng tiến</p><p>&nbsp;• Được tham gia các hoạt động chung của Công ty: du lịch, teambuilding, sự kiện…</p>', '1YD56786HR888024X', 0),
('1gc8kclik8bhur', '1gc8kclik7sft0', 'ITPM', 'TTS', '1T-3T', 'CCKN', 'intern backend', '2023-06-24', 10, '<p>công nhẹ nhàng, leader vui tính</p>', '<p>java, oop</p>', '2023-06-06 19:00:24', '38 Tú Mỡ, Hòa An, Cẩm Lệ, Đà Nẵng', 'TTS', '<p>tham gia các hoạt động vui nhộn của công ty</p>', '4HX535825J8738722', 0),
('1gc8u4llurdgas', '1gc2holhitg82w', 'ITPM', 'TTS', '3T-6T', 'CCKN', 'Tin tuyen dung', '2023-09-23', 1, '<p>Mo ta cong viec</p>', '<p>Yeu cau</p>', '2023-08-28 17:50:37', 'Da Nang', 'BTG', '<p>quyen loi</p>', '3Y0651406K0334900', 0),
('1gc9hglhwuai19', '8z0lhalx9m5', 'KD', 'CTV', '3T-6T', '1N', 'Vĩnh Long_Nhân Viên Tư Vấn Kinh Doanh', '2023-05-31', 1, '<p>Tư vấn cho khách hàng hiểu và sử dụng dịch vụ hỗ trợ cho vay và mua xe gắn máy/ các sản phẩm điện máy trả góp của Công ty.</p><p>- Thực hiện làm hồ sơ cho khách hàng vay và gởi hồ sơ cho bộ phận tín dụng.</p><p>- Hướng dẫn khách hàng ký hợp đồng và nhận xe/ các sản phẩm điện máy tại cửa hàng khi hồ sơ vay được duyệt.</p><p>- Thu thập các thông tin thị trường, đối thủ cạnh tranh, ý kiến của khách hàng và đại lý đối tác.</p><p>- Thu thập và phản hồi các yêu cầu của Đại lý đối tác về phòng Kinh doanh.</p><p>- Thực hiện báo cáo theo quy định</p><p>* Làm việc ngoài thị trường tại các cửa hàng xe gắn máy/ các sản phẩm điện máy khu vực Vũng Liêm_Vĩnh Long</p>', '<p>​<span style=\"color: rgb(0, 0, 0);font-size: 14px\">Kinh nghiệm/Kỹ năng chi tiết</span><br>​<span style=\"color: rgb(0, 0, 0);font-size: 14px\">- Độ tuổi: 18 - 30</span><br>​<span style=\"color: rgb(0, 0, 0);font-size: 14px\">- Trình độ THPT trở lên, Biết sử dụng Word, Excel.</span><br>​<span style=\"color: rgb(0, 0, 0);font-size: 14px\">- Độc lập, tự tin, tươi vui, hoạt bát, nhanh nhẹn; có trách nhiệm, tinh thần hoạt động đội nhóm tốt.</span><br>​<span style=\"color: rgb(0, 0, 0);font-size: 14px\">- Có kinh nghiệm tư vấn bán hàng là một lợi thế.</span><br>​<span style=\"color: rgb(0, 0, 0);font-size: 14px\">- Ứng viên không có kinh nghiệm sẽ được đào tạo.</span>​</p>', '2023-05-21 00:00:00', ' 72-74 Nguyễn Thị Minh Khai, Phường Võ Thị Sáu, Quận 3, HCM', 'TTG', '<p>​<span style=\"color: rgb(0, 0, 0);font-size: 14px\">QUYỀN LỢI:</span><br>​<span style=\"color: rgb(0, 0, 0);font-size: 14px\">- Được hưởng nguyên lương trong thời gian đào tạo và thử việc</span><br>​<span style=\"color: rgb(0, 0, 0);font-size: 14px\">- Thời gian làm việc: 8 giờ/ ngày (theo ca), 5 hoặc 6 ngày/ tuần</span><br>​<span style=\"color: rgb(0, 0, 0);font-size: 14px\">- Được tham gia BHXH, BHYT &amp; BHTN đầy đủ</span><br>​<span style=\"color: rgb(0, 0, 0);font-size: 14px\">- Được Công ty mua Bảo hiểm tai nạn ngay ngày đầu tiên đi làm</span><br>​<span style=\"color: rgb(0, 0, 0);font-size: 14px\">- Thưởng thêm vào cuối năm</span><br>​<span style=\"color: rgb(0, 0, 0);font-size: 14px\">- Phép năm: 12 ngày và cộng thêm theo thâm niên</span><br>​<span style=\"color: rgb(0, 0, 0);font-size: 14px\">- Khám sức khỏe, du lịch định kỳ hằng năm</span>​</p>', '91S516717T292893B', 0),
('1gc9hglhwucfm0', '8z0lhalx9m5', 'ITPM', 'senior', '8T-10T', '3Y', 'Digital Transformation Senior Manager', '2023-05-31', 1, '<p>1/ Responsible for operating the Digital Transformation Division activities, including:</p><p>- Recruiting personnel</p><p>- Training employees</p><p>- Building internal operating procedures</p><p>- Monitoring and guiding staff</p><p>- Developing documentation to serve professional operations.</p><p>2/ Directly involved in building, organizing, managing, and implementing Digital Transformation activities for the company, including:</p><p>- Developing plans and proposals for applying new technologies/solutions to meet the objectives of the company Digital Transformation Strategy in business operations.</p><p>- Establishing a set of evaluation criteria to ensure that digital transformation activities are measured and efficient.</p><p>- Coordinating with other divisions to support projects that realize the company overall Digital Transformation strategy and ensure that Digital Transformation projects are implemented according to the plan.</p><p>- Responsible for preparing reports as required by relevant SBV regarding Digital Transformation.</p><p>3/ Propose initiatives, improvements, and innovative digital solutions/innovations applicable to the company business operations:</p><p>- Keep up to date with new technologies, new solutions, and trends in innovation and technology application in business operations.</p><p>- Proactively advise and provide suitable solutions, initiatives, and improvements for Digital Transformation to subordinate divisions.</p><p>- Anticipate changes in external and internal environments and consider points that need to be included in the DX plan.</p><p>- Design new business operations by adapting to market demands and applying solutions to solve problems.</p>', '<p>- Age: 35 - 45&nbsp;</p><p>- Male/Female: Graduated from College/ University or higher specialized work in Marketing/ Journalism/ Culture/ Linguistics/ Bachelor’s degree (or above) in Information Technology</p><p>- Good English (all 4 skills: listening, speaking, reading, writing) or Japanese.</p><p>- Have at least 5 years of experience in the Banking, Finance, Consumer Lending, and Insurance.</p><p>- Having experience in a previous position related to Digital Transformation, specifically in the Digital Transformation of businesses, IT and customer experience division is an advantage.</p><p>- Working independence or capable of teamwork</p>', '2023-05-21 00:00:00', '72-74 Nguyễn Thị Minh Khai, Phường Võ Thị Sáu, Quận 3', 'TTG', '<p>- Full salary during the training and probation.&nbsp;</p><p>- Working time: 8 hours/ day (8h30 - 17h30), from Monday - Friday</p><p>- Participating Social Insurance with full wages</p><p>- Accident Insurance 24/ 24 is bought at the first working day</p><p>- Added bonus at the end of year&nbsp;</p><p>- 12 annual leave days/ year and added up to seniority</p>', '2AE945897W308884N', 0),
('1gc9x0lhxgztrj', '1gc5holhapoh73', 'ITPM', 'CTV', '15T-20T', '1N', 'Lập Trình Viên Mobile App Flutter', '2023-05-31', 2, '<p>​<span style=\"font-size: 14px\">Lập trình ứng dụng di động bằng Flutter cho công ty theo thiết kế.</span><br>​<span style=\"font-size: 14px\">Phát triển chuyên sâu dần về công nghệ mobile và Front nói chung.</span><br>​<span style=\"font-size: 14px\">Tối ưu trải nghiệm người dùng, tập trung vào tốc độ xử lý trên mobile.</span><br>​<span style=\"font-size: 14px\">Tìm hiểu các framework mới, ứng dụng vào App đang phát triển.</span><br>​<span style=\"font-size: 14px\">Tuân thủ quy trình và task được giao bởi leader.</span>​<br></p>', '<p>​<span style=\"font-size: 14px\">Tốt nghiệp Đại Học hoặc Cao Đẳng trở lên các chuyên ngành Công nghệ thông tin.</span><br>​<span style=\"font-size: 14px\">Có 1 năm kinh nghiệm trở lên làm với Flutter và ưu tiên đã từng code sản phẩm ra thị trường.</span><br>​<span style=\"font-size: 14px\">Có kinh nghiệm về handle với Restful API (Back-end), dùng third-party libraries.</span><br>​<span style=\"font-size: 14px\">Có kiến thức tốt về OOP, Data Structures, Algorithm, tối ưu hóa hiệu suất ứng dụng Flutter.</span><br>​<span style=\"font-size: 14px\">Kĩ năng giải quyết vấn đề trong công việc.</span><br>​<span style=\"font-size: 14px\">Chủ động giao tiếp, giao lưu với các members trong công việc.</span><br>​<span style=\"font-size: 14px\">Thành thạo về hệ thống quản lý source code Git.</span>​<br></p>', '2023-05-21 20:44:34', 'Đà Nẵng: 103 Hoài Thanh, Ngũ Hành Sơn', 'TTG', '<p>​<span style=\"font-size: 14px\">Đầy đủ các chế độ theo luật lao động hiện hành.</span><br>​<span style=\"font-size: 14px\">Chính sách phúc lợi theo quy định của Công ty đa dạng</span><br>​<span style=\"font-size: 14px\">Môi trường làm việc thân thiện, cởi mở, trẻ trung.</span><br>​<span style=\"font-size: 14px\">Nhiều cơ hội phát triển và thăng tiến không giới hạn.</span><br>​<span style=\"font-size: 14px\">Văn hóa Doanh nghiệp Startup năng động</span>​<br></p>', '2V047795D7665303F', 0),
('1gc9xglicsjldd', '1gc9xglicrs6et', 'ITPC', 'TTS', '1T-3T', 'CCKN', 'việc làm intern', '2023-06-30', 10, '<p>abc</p>', '<p>123</p>', '2023-06-01 14:04:25', '48 Cao Thắng', 'TTG', '<p>123</p>', '7YL713983T204993B', 0);
INSERT INTO `job` (`id_job`, `id_company`, `id_field`, `id_type`, `id_range`, `id_experience`, `name_job`, `deadline`, `size_number`, `description_job`, `required_job`, `created_at`, `work_location`, `id_working_form`, `benefits_job`, `id_history`, `is_lock`) VALUES
('1gc9xklhxg6qpf', '1gc5holhapoh73', 'ITPM', 'senior', '15T-20T', '2Y', 'Python Developer', '2023-06-23', 2, '<p><br></p><p style=\"margin-left: 0px !important\">- Thiết kế App để xây dựng mô hình BIM trong kiến trúc (Tương tự như Revit)</p><p style=\"margin-left: 0px !important\">- Viết các Add-in Revit theo các trình tự khởi tạo lập trình</p><p style=\"margin-left: 0px !important\">- Thời gian làm việc từ thứ 2 đến thứ 6 (8h00 - 17h00)</p><p style=\"margin-left: 0px !important\">- Địa điểm làm việc: TP.HCM và Đà Nẵng</p><p style=\"margin-left: 0px !important\"><br></p>', '<p><br></p><p style=\"margin-left: 0px !important\">- Tối thiểu 1 năm kinh nghiệm lập trình ngôn ngữ Python/C++<br></p><p style=\"margin-left: 0px !important\">- Tư duy logic, hình học không gian tốt</p><p style=\"margin-left: 0px !important\">- Có kinh nghiệm lập trình 3D/CAD hoặc biết sử dụng Revit cũng là một lợi thế</p><p style=\"margin-left: 0px !important\"><strong>Yêu cầu khác:</strong></p><p style=\"margin-left: 0px !important\">- Khả năng làm việc độc lập, làm việc nhóm</p><p style=\"margin-left: 0px !important\">- Có tinh thần trách nhiệm cao</p>', '2023-05-21 20:21:57', 'Hai Chau - Da Nang', 'TTG', '<p><br></p><p style=\"margin-left: 0px !important\">- Lương khởi điểm cao</p><p style=\"margin-left: 0px !important\">- Được xét tăng lương 2 lần/năm</p><p style=\"margin-left: 0px !important\">- Các chế độ BHXH đầy đủ theo luật</p><p style=\"margin-left: 0px !important\">- Du lịch, khám sức khỏe hàng năm, Teambuilding (Picnic, đá bóng, cầu lông…)</p><p style=\"margin-left: 0px !important\">- Thưởng cuối năm</p>', '5EA69806WH027710K', 0),
('1gca04lhxfhpz0', '1gc5holhapoh73', 'ITPM', 'NV', '15T-20T', '2Y', 'Lập Trình Viên ', '2023-06-24', 2, '<p><br></p><p style=\"margin-left: 0px !important\">- Thiết kế các phần mềm, website quản trị doanh nghiệp (ERP) cho các khách hàng của Nhật.</p><p style=\"margin-left: 0px !important\">- Thiết kế App để xây dựng mô hình BIM trong kiến trúc (Tương tự như Revit) và viết các AddOn Revit.</p><p style=\"margin-left: 0px !important\">- Thời gian làm việc từ thứ 2 đến thứ 6 (8h00 - 17h00)</p><p style=\"margin-left: 0px !important\">- Địa điểm làm việc: TP.HCM và Đà Nẵng</p><p style=\"margin-left: 0px !important\"><br></p>', '<p><br></p><p style=\"margin-left: 0px !important\">- Có 2 năm kinh nghiệm trở lên</p><p style=\"margin-left: 0px !important\">- Có kinh nghiệm lập trình 1 trong các ngôn ngữ:</p><p style=\"margin-left: 0px !important\">1. C# MVC/ ASP.NET</p><p style=\"margin-left: 0px !important\">2. NodeJs/ ReactJs</p><p style=\"margin-left: 0px !important\">3. Python (biết sử dụng Revit là một lợi thế)</p><p style=\"margin-left: 0px !important\">- Biết lập trình Database: SQL Server</p>', '2023-05-21 20:02:30', 'Tầng 7, Tòa Nhà PVcomBank, Số 02, Đường 30 Tháng 4, Hải Châu', 'TTG', '<p><br></p><p style=\"margin-left: 0px !important\">- Lương khởi điểm cao: Dựa vào năng lực, kinh nghiệm</p><p style=\"margin-left: 0px !important\">- Được xét tăng lương 2 lần /năm</p><p style=\"margin-left: 0px !important\">- Các chế độ BHXH đầy đủ theo luật</p><p style=\"margin-left: 0px !important\">- Du lịch, khám sức khỏe hàng năm, Teambuilding (Picnic, đá bóng, cầu lông…)</p><p style=\"margin-left: 0px !important\">- Thưởng cuối năm</p><p style=\"margin-left: 0px !important\"><br></p>', '2V047795D7665303F', 0),
('1gcbsclluqm7tb', '1gc2holhitg82w', 'ITPM', 'leader', '15T-20T', '2Y', 'Nha tuyen dung', '2023-08-31', 2, '<p>Mo ta cong viec</p>', '<p>123</p>', '2023-08-28 17:29:26', 'Da Nang', 'TTG', '<p>123</p>', '4B964545RJ6263443', 1),
('1gcc4klhx7oilu', '8z0lhalx9m5', 'K-Toan', 'senior', '6T-8T', '1N', 'Vũng Tàu_Nhân Viên Tư Vấn Kinh Doanh', '2023-05-31', 2, '<p><br></p><p>Tư vấn cho khách hàng hiểu và sử dụng dịch vụ hỗ trợ cho vay và mua xe gắn máy/ các sản phẩm điện máy trả góp của Công ty.</p><p>- Thực hiện làm hồ sơ cho khách hàng vay và gởi hồ sơ cho bộ phận tín dụng.</p><p>- Hướng dẫn khách hàng ký hợp đồng và nhận xe/ các sản phẩm điện máy tại cửa hàng khi hồ sơ vay được duyệt.</p><p>- Thu thập các thông tin thị trường, đối thủ cạnh tranh, ý kiến của khách hàng và đại lý đối tác.</p><p>- Thu thập và phản hồi các yêu cầu của Đại lý đối tác về phòng Kinh doanh.</p><p>- Thực hiện báo cáo theo quy định</p><p>* Làm việc ngoài thị trường tại các cửa hàng xe gắn máy/ các sản phẩm điện máy khu vực Phú Mỹ_Vũng Tàu</p>', '<p><br></p><p>- Độ tuổi: 18 - 30</p><p>- Trình độ THPT trở lên, Biết sử dụng Word, Excel.</p><p>- Độc lập, tự tin, tươi vui, hoạt bát, nhanh nhẹn; có trách nhiệm, tinh thần hoạt động đội nhóm tốt.</p><p>- Có kinh nghiệm tư vấn bán hàng là một lợi thế.</p><p>- Ứng viên không có kinh nghiệm sẽ được đào tạo.</p>', '2023-05-21 00:00:00', 'Phú Mỹ, Vũng Tàu', 'TTG', '<p><br></p><p>- Được hưởng nguyên lương trong thời gian đào tạo và thử việc</p><p>- Thời gian làm việc: 8 giờ/ ngày (theo ca), 5 hoặc 6 ngày/ tuần</p><p>- Được tham gia BHXH, BHYT &amp; BHTN đầy đủ</p><p>- Được Công ty mua Bảo hiểm tai nạn ngay ngày đầu tiên đi làm</p><p>- Thưởng thêm vào cuối năm</p><p>- Phép năm: 12 ngày và cộng thêm theo thâm niên</p><p>- Khám sức khỏe, du lịch định kỳ hằng năm</p>', '1YD56786HR888024X', 0),
('1gcdf4likh2yhn', '1gc2holhitg82w', 'ITPM', 'NV', '15T-20T', '2Y', 'Fresher Sap Consultant Tiếng Nhật', '2023-06-23', 2, '<ul><li>Tham gia đào tạo trực tiếp cùng các chuyên gia IT Consultant người Nhật để trở thành BA/ IT Consultant trong tương lai, thực hiện các công việc liên quan</li><li>Đồng hành và tư vấn cho các đối tác trong việc xây dựng full life cycle hệ thống SAP.</li><li>Tìm hiểu và nắm bắt được các thông tin liên quan đến kỹ năng nghiệp vụ và lĩnh vực kinh doanh</li><li>Khảo sát, thu thập, phân tích thông tin yêu cầu nghiệp vụ để cùng với khách hàng xây dựng chức năng hệ thống</li><li>Tài liệu hóa thành tài liệu nghiệp vụ dự án</li><li>Kết nối và truyền tải thông tin giữa các bên liên quan để phát triển hệ thống</li><li>Hỗ trợ các công việc liên quan đến tư vấn hệ thống với khách hàng</li></ul>', '<ul><li>Có định hướng phát triển trở thành BA/Consultant</li><li>Có kinh nghiệm trong các lĩnh vực phát triển phần mềm hoặc tài chính tổng vụ, kế toán, phân phối bán hàng…</li><li>Tiếng Nhật tương đương N2 và có khả năng sử dụng Tiếng Anh trong công việc (đọc, viết)</li><li>Thành thạo kỹ năng tin học văn phòng (MS Word, Excel, Powerpoint, Access). Ưu tiên các ứng viên từng biết hoặc sử dụng phần mềm ERP (SAP, Oracle), phần mềm kế toán, ngôn ngữ lập trình SQL</li><li>Tư duy logic, tư duy phân tích, tư duy phản biện và giải quyết vấn đề tốt</li><li>Có khả năng nắm bắt, học hỏi kỹ thuật mới nhanh</li><li>Khả năng giao tiếp tốt, nhanh nhẹn hoạt bát</li><li>Có chứng chỉ kế toán cấp độ 2 (Boki) là một lợi thế</li></ul>', '2023-06-06 23:05:43', 'Hà Nội: T13, Keangnam Hanoi Landmark Tower, khu E6, khu ĐTM Cầu Giấy, phường Mễ Trì, Nam Từ Liêm', 'HD', '<ul><li>Lương: Upto 1200$</li><li>Performance review</li><li>Cơ hội phát triển sự nghiệp: Trở thành BA/ Consultant trong tương lai</li><li>Bảo hiểm sức khoẻ toàn diện Sun Care</li><li>Được đào tạo bởi các chuyên gia người Nhật</li><li>Làm việc với các đối tác, tập đoàn lớn của Nhật Bản.</li><li>Chính sách hỗ trợ các hoạt động học tập, trao đổi, chia sẻ kiến thức, giao lưu văn hoá (Seminar công nghệ – Tech Expert, CLB: đọc sách, tiếng Nhật, CLB âm nhạc,…)</li><li>Du lịch thường niên, hoạt động team building hàng quý.</li></ul>', '9UF445465D579233F', 0),
('1gcdf4likk18jx', '1gc2holhitg82w', 'ITPM', 'NV', '6T-8T', '1N', 'C# Developer (.Net/Japanese) - Working In Japan', '2023-06-30', 2, '<ul><li>Phát triển và nâng cấp hệ thống Website, WebApp theo yêu cầu khách hàng.</li><li>Phát triển các giải pháp về ERP(Enterprise Resource Planning), PLM (Product Lifecycle Management) cho các khách hàng là các công ty lớn ở Nhật.</li><li>Các giải pháp về tự động hóa công nghiệp, thông minh, quản lý và điều khiển hệ thống,dây chuyền sản xuất thông qua giao diện người dùng.</li><li>Địa điểm làm việc: Nagoya (Nhật Bản)</li><li>Nhận ứng viên ở cả Hà Nội , Đà Nẵng, Hồ Chí Minh</li></ul>', '<ul><li>Tiếng Nhật tương đương với N4 trở lên (bắt buộc, không yêu cầu bằng cấp)</li><li>Tối thiểu 2 năm kinh nghiệm làm việc trong lĩnh vực phần mềm (phát triển Web).</li><li>Có kiến thức về .NET, CSS, HTML.</li><li>Có kinh nghiệm về một trong các ngôn ngữ lập trình C#, JavaScript,PHP.</li></ul>', '2023-06-07 00:28:21', 'Hải Châu - Đà Nẵng', 'BTG', '<ul><li>Mức lương từ 320-500 man/1 năm&nbsp;</li><li>Nghỉ thứ 7 và CN;</li><li>Có 3 đợt nghỉ dài trong năm (mỗi đợt khoảng 9-11 ngày nghỉ);</li><li>Xét tăng lương 1 lần/ năm, Thưởng 2 lần/năm;</li><li>BHXH, y tế đầy đủ;</li><li>Khám sức khỏe hàng năm;</li><li>Có trợ cấp nhà ở, đi lại, vợ, con;</li><li>Có kí túc xá cho các bạn độc thân;</li><li>Team building theo quý, du lịch hàng năm, và rất nhiều các hoạt động vui chơi khác.</li></ul>', '9UF445465D579233F', 0),
('1gcn4lhx71n0v', '8z0lhalx9m5', 'KD', 'senior', '3T-6T', '2Y', 'Nhân Viên Tư Vấn Ô Tô Trả Góp_Bắc Giang', '2023-05-31', 2, '<p><strong>(1)&nbsp;Với đại lý đối tác</strong><br></p><p>-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Ghé thăm đại lý hằng tuần nhằm xây dựng mối quan hệ với showroom đối tác ô tô.</p><p>-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Tương tác liên tục với Nhân viên bán hàng của showroom các hãng để có hồ sơ vay mua xe ô ô.</p><p>-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Đề xuất chính sách đối ứng với đối thủ cạnh tranh tại showroom</p><p><strong>(2)&nbsp;Thực hiện hồ sơ vay</strong></p><p>-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Tư vấn rõ minh bạch về lãi suất/ kỳ hạn vay và phí bảo hiểm cho khách.</p><p>-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Thưc hiện hồ sơ vay cho khách hàng</p><p>-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Đảm bảo việc tuân thủ quy trình cho vay của Công ty ban hành.</p><p><strong>(3)&nbsp;Công việc nội bộ</strong></p><p>-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Tương tác với các phòng ban/đồng nghiệp tốt để hỗ trợ công việc nhanh chóng.</p><p>-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Báo cáo trực tiếp cho Giám đốc kinh doanh khu vực Mekong, và gián tiếp cho Giám đốc kinh doanh Miền</p><p><strong>(4)&nbsp;Yêu cầu khác:</strong></p><p>-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Hợp tác với nhóm tín chấp khu vực Mekong để nhận được sự hỗ trợ hợp tác hai bên.</p><p>-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Chịu được áp lực công việc, kiên định với mục tiêu và luôn có suy nghĩ tích cực trong công việc.</p>', '<p>- Tốt nghiệp THPT trở lên<br></p><p>- Có kinh&nbsp;nghiệm trên 01 năm trong lãnh vực Tài Chính/ Ngân Hàng, kinh doanh ô tô</p><p>- Có xe máy và không ngại đi lại</p><p>- Có kỹ năng kinh doanh và marketing tốt</p><p>- Có khả năng giao tiếp tốt</p><p>- Tự tin&nbsp;</p>', '2023-05-21 00:00:00', ' Lầu 15, Tòa nhà Centec, 72-74 Nguyễn Thị Minh Khai, P Võ Thị Sáu, Q3,TP.HCM', 'TTG', '<p>-&nbsp;Được hưởng nguyên lương trong thời gian đào tạo và thử việc<br></p><p>- Thời gian làm việc: 8 giờ/ngày, 5 ngày/ tuần</p><p>- Được tham gia BHXH, BHYT &amp; BHTN đầy đủ</p><p>- Được Công ty mua Bảo hiểm tai nạn ngay ngày đầu tiên đi làm</p><p>- Thưởng thêm vào cuối năm</p><p>- Phép năm: 12 ngày và cộng thêm theo thâm niên</p>', '02T00165Y0689245U', 1),
('1gcn4lhx71yju', '8z0lhalx9m5', 'KD', 'senior', '6T-8T', '2Y', 'Cà Mau_Nhân Viên Tư Vấn Kinh Doanh', '2023-05-31', 2, '<p>- Chào đón và tư vấn khách hàng về dịch vụ hỗ trợ cho vay tiêu dùng tại các cửa hàng xe máy/ điện máy liên kết với công ty.</p><p>- Tiếp nhận, kiểm tra thông tin khách hàng</p><p>- Nhập những thông tin liên quan của khách hàng để làm hồ sơ vay</p><p>- Gửi hồ sơ vay của khách hàng về cho bộ phận thẩm định</p><p>- Thông báo kết quả thẩm định cho khách hàng và hướng dẫn các thủ tục liên quan</p><p>- Hỗ trợ thu thập các thông tin thị trường, đối thủ cạnh tranh</p><p>- Nỗ lực đạt chỉ tiêu theo từng Đại lý</p><p>- Duy trì mối quan hệ tốt với đại lý và đồng nghiệp</p><p>- Thực hiện báo cáo hằng ngày về công ty</p><p>- Những công việc khác theo chỉ định của cấp trên</p><p>* Làm việc tại các cửa hàng xe gắn máy/ các sản phẩm điện máy khu vực Thành Phố Cà Mau_Cà Mau</p>', '<p>- Tuổi 18-27, Nam/Nữ</p><p>- Trình độ: từ THPT trở lên; Biết sử dụng Word, Excel.</p><p>- Độc lập, tự tin, tươi vui, hoạt bát, nhanh nhẹn; Có trách nhiệm, tinh thần hoạt động đội nhóm tốt.</p><p>- Có kinh nghiệm tư vấn bán hàng;</p>', '2023-05-21 00:00:00', ' Lầu 15, Tòa nhà Centec, 72-74 Nguyễn Thị Minh Khai, P Võ Thị Sáu, Q3,TP.HCM', 'TTG', '<p>- Được hưởng nguyên lương trong thời gian đào tạo và thử việc</p><p>- Thời gian làm việc: 8 giờ/ ngày (theo ca), 5 hoặc 6 ngày/ tuần</p><p>- Được tham gia BHXH, BHYT &amp; BHTN đầy đủ</p><p>- Được Công ty mua Bảo hiểm tai nạn ngay ngày đầu tiên đi làm</p><p>- Thưởng thêm vào cuối năm</p><p>- Phép năm: 12 ngày và cộng thêm theo thâm niên</p>', '02T00165Y0689245U', 0),
('y8lipwyeuw', '1gc8kclik7sft0', 'KD', 'NV', '6T-8T', '1N', 'Nhân Viên Hành Chính Văn Phòng', '2023-06-30', 1, '<p>- Lưu trữ giấy tờ hành chính.<br></p><p>- Quản lý phòng họp, sắp xếp phòng họp, làm công tác chuẩn bị cho các cuộc họp tại phòng họp Công ty.</p><p>- Quản lý hành chính khu vực văn phòng, mua sắm, sắp xếp bố trí công cụ dụng cụ, trang thiết bị, văn phòng phẩm, nước uống, trái cây, hoa tươi, sắp đặt cảnh quan, đảm bảo không gian chung có tính thẩm mỹ, chuyên nghiệp.</p><p>- Quản lý và thanh toán các chi phí hành chính tại khu vực văn phòng</p><p>- Phụ trách BHXH, BHYT của nhân viên trong công ty</p>', '<p>- Ưu tiên có kinh nghiệm ở vị trí ứng tuyển hoặc tương đương. Chưa có kinh nghiệm có thể được đào tạo, hướng dẫn<br></p><p>- Kỹ năng tin học văn phòng tốt.</p><p>- Tốt nghiệp Cao Đẳng chính quy chuyên ngành hành chính-văn phòng</p>', '2023-06-10 18:28:55', 'Số 157 Hồ Đắc Di, Phường Quang Trung, Đống Đa', 'TTG', '<p>- Thời gian làm việc: 08h00 - 17h30, từ Thứ Hai - thứ Sáu<br></p><p>- Lương cơ bản: từ 8 -12TR triệu.</p><p>- BHXH, BHTN; BHYT theo quy định.</p><p>- Thưởng lễ, tết và thưởng khác theo chế độ công ty</p>', '4HX535825J8738722', 0);

--
-- Triggers `job`
--
DELIMITER $$
CREATE TRIGGER `check_deadline_trigger` BEFORE INSERT ON `job` FOR EACH ROW BEGIN
  IF NEW.deadline <= NOW() THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Ngày hạn chót phải lớn hơn thời gian hiện tại';
  END IF;
END
$$
DELIMITER ;

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
  `status` tinyint(1) NOT NULL,
  `type_notification` varchar(255) NOT NULL,
  `id_user_follow` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `notification`
--

INSERT INTO `notification` (`id_notification`, `id_apply`, `id_user`, `id_job`, `content`, `created_at`, `status`, `type_notification`, `id_user_follow`) VALUES
('1gc5q8liq6711i', '1gc5q8liq60kmm', '1gc710lfdu4aez', NULL, 'Trạng thái hồ sơ ứng tuyển vị trí (Tân Bình) - Nhân Viên Nhận Hàng đã xem hồ sơ', '2023-06-10 22:47:34', 1, 'apply', NULL),
('1gc7molik4ysmg', NULL, '1gc5holhaquou5', NULL, 'Công Ty Tài Chính TNHH MTV Quốc Tế Việt Nam Jaccs đang theo dõi bạn', '2023-06-06 17:26:33', 1, 'follow', '8z0lhalx9m5'),
('1gc8e4liico01j', NULL, '1gcck0lg61fe1u', '1gc8e4liicnzzg', 'Công Ty Tài Chính TNHH MTV Quốc Tế Việt Nam Jaccs đăng tuyển vị trí 12', '2023-06-05 11:26:34', 0, 'job', ''),
('1gc8e4liicowjq', NULL, '1gcck0lg61fe1u', '1gc8e4liicowhr', 'Công Ty Tài Chính TNHH MTV Quốc Tế Việt Nam Jaccs đăng tuyển vị trí 23', '2023-06-05 11:27:16', 0, 'job', ''),
('1gc8kclik7axrg', NULL, '1gc9xglicrs6et', NULL, 'trân tiến đang theo dõi bạn', '2023-06-06 18:31:59', 0, 'follow', '1gc8kclik755lf'),
('1gc8u4lluqxg6q', '1gc2i8lluqf1f1', '1gc710lfdu4aez', NULL, 'Trạng thái hồ sơ ứng tuyển vị trí [Quận 2 Cũ] - Nhân Viên Đặt Hàng Siêu Thị Winmart đã liên hệ', '2023-08-28 17:38:10', 0, 'apply', NULL),
('1gc8u4llurawyu', '1gc8u4llur7y36', '1gc710lfdu4aez', NULL, 'Trạng thái hồ sơ ứng tuyển vị trí (Siêu Thị Winmart Quận 7) Nhân Viên Bán Hàng đã liên hệ', '2023-08-28 17:48:39', 0, 'apply', NULL),
('1gc8u4llurbf3r', NULL, '1gcyslgxgw73d', NULL, 'CÔNG TY CỔ PHẦN GIẢI PHÁP CÔNG NGHỆ DANATEQ đang theo dõi bạn', '2023-08-28 17:49:02', 0, 'follow', '1gc2holhitg82w'),
('1gc8u4llurdgdh', NULL, '1gc710lfdu4aez', '1gc8u4llurdgas', 'CÔNG TY CỔ PHẦN GIẢI PHÁP CÔNG NGHỆ DANATEQ đăng tuyển vị trí Tin tuyen dung', '2023-08-28 17:50:37', 0, 'job', NULL),
('1gca6olijt2d2l', NULL, '1gcyslgxgw73d', NULL, 'CÔNG TY CỔ PHẦN GIẢI PHÁP CÔNG NGHỆ DANATEQ đang theo dõi bạn', '2023-06-06 11:53:24', 0, 'follow', '1gc2holhitg82w'),
('1gcatklik96n7c', '1gc8kclik8f2po', '1gc8kclik755lf', NULL, 'Trạng thái hồ sơ ứng tuyển vị trí intern backend đã liên hệ', '2023-06-06 19:24:38', 0, 'apply', NULL),
('1gcavwlipnhjuc', '1gcavwlipnbzgb', '1gc710lfdu4aez', NULL, 'Trạng thái hồ sơ ứng tuyển vị trí Nhân Viên Kinh Doanh đã xem hồ sơ', '2023-06-10 14:03:52', 1, 'apply', NULL),
('1gcbsclluqk3mb', NULL, '1gc2holhitg82w', NULL, 'Bui Van Sy đang theo dõi bạn', '2023-08-28 17:27:48', 0, 'follow', '1gc710lfdu4aez'),
('1gcdf4likh7s4s', '1gc9xglicrkz6m', '1gc9xglicr0oue', NULL, 'Trạng thái hồ sơ ứng tuyển vị trí [Kcn Vsip II Tân Uyên] [Nhân Viên Kho Hàng] đã xem hồ sơ', '2023-06-06 23:09:28', 0, 'apply', NULL),
('1gcei8lir63eeq', '1gc9xglicrkz6m', '1gc9xglicr0oue', NULL, 'Trạng thái hồ sơ ứng tuyển vị trí [Kcn Vsip II Tân Uyên] [Nhân Viên Kho Hàng] đã liên hệ', '2023-06-11 15:32:31', 0, 'apply', NULL),
('20clir0ng4v', '1gc9xglicrkz6m', '1gc9xglicr0oue', NULL, 'Trạng thái hồ sơ ứng tuyển vị trí [Kcn Vsip II Tân Uyên] [Nhân Viên Kho Hàng] đã liên hệ', '2023-06-11 13:00:08', 0, 'apply', NULL);

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
('1gc2holhiu9pzc', '1gcekslgeljvww', 'Đánh giá thử việc như thế nào để nhân viên mới tâm phục khẩu phục', 'Đánh giá thử việc là một giai đoạn quan trọng trong quá trình tuyển dụng nhân sự của mọi doanh nghiệp. Qua quá trình đánh giá, doanh nghiệp có cái nhìn tổng quan về năng lực, kinh nghiệm và thái độ làm việc của ứng viên, từ đó đưa ra quyết định tuyển dụng. Tuy nhiên, việc đánh giá nhân viên thử việc không hề đơn giản, đòi hỏi thực hiện chính xác và minh bạch. Trong bài viết dưới đây của Nghề Nghiệp Việc Làm 24h, chúng ta sẽ cùng tìm hiểu nhận xét đánh giá sau thử việc, các mẫu đánh giá thử việc cũng như bảng đánh giá nhân viên thử việc.', '1683791978923diem-chet-trong-ho-so-xin-viec5-min-696x392.jpg', '<p>​<span style=\"color: rgb(34, 34, 34);font-size: 15px\">Đánh giá thử việc là một giai đoạn quan trọng trong quá trình tuyển dụng&nbsp;</span><a href=\"https://vieclam24h.vn/viec-lam-nhan-su-o22.html?utm_source=blog&amp;utm_medium=organic&amp;utm_campaign=AWO_Blog_Organic_RE_danhgiathuviecnhuthenaodenhanvienmoitamphuckhauphuc_nghenghiep24h\" target=\"_blank\" rel=\"noreferrer noopener\">nhân sự</a><span style=\"color: rgb(34, 34, 34);font-size: 15px\">&nbsp;của mọi doanh nghiệp. Qua quá trình đánh giá, doanh nghiệp có cái nhìn tổng quan về năng lực, kinh nghiệm và thái độ làm việc của ứng viên, từ đó đưa ra quyết định tuyển dụng. Tuy nhiên, việc đánh giá nhân viên thử việc không hề đơn giản, đòi hỏi thực hiện chính xác và minh bạch. Trong bài viết dưới đây của&nbsp;</span><a href=\"https://nghenghiep.vieclam24h.vn/ki-ot-vui-ve/moon-phase-la-gi/?utm_source=blog&amp;utm_medium=organic&amp;utm_campaign=AWO_Blog_Organic_RE_danhgiathuviecnhuthenaodenhanvienmoitamphuckhauphuc_nghenghiep24h\" target=\"_blank\" rel=\"noreferrer noopener\">Nghề Nghiệp Việc Làm 24h</a><span style=\"color: rgb(34, 34, 34);font-size: 15px\">, chúng ta sẽ cùng tìm hiểu nhận xét đánh giá sau thử việc, các mẫu đánh giá thử việc cũng như bảng đánh giá nhân viên thử việc.</span>​<br></p>', '2023-05-01 15:57:06'),
('1gc58oliq7nnvi', '1gcekslgeljvww', '“Tại sao chúng tôi nên nhận bạn?” – Câu hỏi thường gặp khi phỏng vấn và cách trả lời chuyên nghiệp', 'Trong các cuộc phỏng vấn chuyên nghiệp, để đánh giá mức độ phù hợp của bạn đối với công việc đồng thời giúp cho ứng viên có cơ hội thể hiện bản thân, các nhà tuyển dụng thường đặt ra câu hỏi “Tại sao công ty chúng tôi nên nhận bạn?”. Đây là một câu hỏi khá phức tạp mà ứng viên phải đối mặt khi phải thể hiện sao cho vừa “khéo”, vừa đủ, tránh sự chủ quan mà vẫn chuyên nghiệp. Trong bài viết này, Việc Làm 24h sẽ chia sẻ tại sao các nhà tuyển dụng sử dụng câu hỏi trên và cách để bạn có thể tự tin thể hiện bản thân khi gặp phải câu hỏi dạng này.', '1686414509976dong-bao-hiem-15-nam-da-co-huong-luong-huu-hinh-anh-1.jpg', '<p><strong>1. Nhận dạng câu hỏi</strong><br></p><p style=\"text-align: justify\">Trong hầu hết trường hợp, các nhà tuyển dụng sẽ không đặt câu hỏi trên một cách trực tiếp, mà thay vào đó, các câu hỏi thường gặp mang ý nghĩa tương tự sẽ là:</p><p style=\"text-align: justify\"><em>&gt; Tại sao bạn tin rằng bạn là một người phù hợp cho vị trí này?</em><br><em>&gt; Điều gì làm bạn tin rằng bạn sẽ làm tốt vai trò này?</em><br><em>&gt; Bạn sẽ mang lại gì cho công ty chúng tôi nếu tôi nhận bạn?</em></p><p style=\"text-align: justify\">Đây là câu hỏi gián tiếp nhằm giúp ứng viên có thể thoải mái đưa ra câu trả lời hơn, nhằm giúp ứng viên có thể giảm bớt căng thẳng, từ đó, nhà tuyển dụng có thể nhận được câu trả lời thành thật và tự nhiên nhất.</p><p style=\"text-align: justify\"><br></p><p style=\"text-align: justify\"><strong>2. Mục tiêu của câu hỏi</strong></p><p style=\"text-align: justify\">Các câu hỏi dạng trên bạn sẽ thường gặp khi người phỏng vấn đang cân nhắc các ứng cử viên cuối cùng cho vị trí này. Do đó, nhà tuyển dụng đang cố gắng xem ai là người phù hợp nhất. Một yếu tố quan trọng cần lưu ý là nhà tuyển dụng muốn tìm hiểu những gì họ không nhìn thấy trên CV của ứng viên.</p><p style=\"text-align: justify\">Mặt khác, người phỏng vấn muốn tìm hiểu về tính cách và xem bạn phản ứng với điều này như thế nào. Đó là cách nhà tuyển dụng xác định các ứng viên phù hợp về tính cách và văn hóa hoặc sự khác biệt thực sự có lợi cho tổ chức.</p><div class=\"se-component se-image-container __se__float-justify\"><figure style=\"width: 600px;\"><img src=\"https://www.danang43.vn/wp-content/uploads/2021/08/Web-2-600x350.png\" alt=\"Web-2-600x350\" data-proportion=\"true\" data-size=\"600px,auto\" data-align=\"justify\" data-file-name=\"Web-2-600x350.png\" data-file-size=\"0\" origin-size=\"600,350\" data-origin=\"600px,auto\" style=\"margin: 5px auto; padding: 0px; border: none; outline: 0px; vertical-align: top; background: transparent; display: block; clear: both; max-width: 100%; height: auto; width: 600px;\"></figure></div><p style=\"text-align: justify\"><strong>3. Phương pháp trả lời câu hỏi chuyên nghiệp</strong></p><p style=\"text-align: justify\">Bạn nên sử dụng những kinh nghiệm làm việc cá nhân, câu chuyện nghề nghiệp của bản thân để thể hiện sự phù hợp nhất có thể. Bạn chia sẻ về các công việc trong quá khứ, mục tiêu nghề nghiệp của bạn rất rõ ràng trong tương lai để thấy đây là một công việc bạn rất có đam mê và đã có kế hoạch cụ thể để đạt được nó. Đồng thời, kết hợp với nền tảng, trình độ học vấn và kỹ năng của bạn để thể hiện bạn có sự phù hợp với các yêu cầu của vị trí như thế nào. Dĩ nhiên, sau quá trình sàng lọc hồ sơ và bắt đầu phỏng vấn, bạn đã có một số kỹ năng và chuyên môn nhất định, tuy nhiên, người phỏng vấn sẽ muốn chắc chắn rằng bạn có những kỹ năng đó. Hơn thế nữa, nhà tuyển dụng muốn xem ai phù hợp nhất với tất cả các ứng viên có các kỹ năng và trình độ tương tự. Dưới đây là một số bước bạn nên tuân thủ để có một câu trả lời: đúng – đủ – chuyên nghiệp:</p><p style=\"text-align: justify\">– Sơ lược về vai trò, công ty và các kinh nghiệm trong quá khứ.</p><p style=\"text-align: justify\">– Thể hiện sự hiểu biết của bạn về vị trí bạn đang ứng tuyển và sự phù hợp của bạn với vị trí dựa trên sự kế thừa và phát huy những kinh nghiệm, kỹ năng trong quá khứ.</p><p style=\"text-align: justify\">– Thể hiện sự khác biệt so với các ứng cử viên khác có cùng kỹ năng.</p><p style=\"text-align: justify\">Ví dụ: Bạn đã có kinh nghiệm làm ở một môi trường có nhiều sự thay đổi, do đó, bạn đã trở nên năng động và có khả năng thích nghi cao; Bạn đã có cơ hội được làm việc trong doanh nghiệp nước ngoài, do đó, các kiến thức về kinh doanh quốc tế của bạn vững vàng hơn,….</p><p style=\"text-align: justify\">– Sự phù hợp về mặt tính cách của bạn với vị trí và văn hóa doanh nghiệp.</p><p style=\"text-align: justify\">Chẳng hạn, bạn đang ứng tuyển cho vị trí Kế toán hãy thể hiện sự cẩn thận và chính xác; Đối với vị trí Thiết kế hãy chứng tỏ rằng bản thân là người sáng tạo và luôn có những ý tưởng khác biệt,…</p><p style=\"text-align: justify\">– Kết luận, nhấn mạnh rằng bạn có thể thực hiện tốt hơn trong vai trò này so với những người khác.</p><p style=\"text-align: justify\">Một yếu tố quan trọng của việc trả lời câu hỏi này là phải chi tiết cụ thể và cung cấp một câu trả lời có chứa nhiều chi tiết.</p><div class=\"se-component se-image-container __se__float-justify\"><figure style=\"width: 600px;\"><img src=\"https://www.danang43.vn/wp-content/uploads/2021/08/Web-3-600x350.png\" alt=\"Web-3-600x350\" data-proportion=\"true\" data-size=\"600px,auto\" data-align=\"justify\" data-file-name=\"Web-3-600x350.png\" data-file-size=\"0\" origin-size=\"600,350\" data-origin=\"600px,auto\" style=\"margin: 5px auto; padding: 0px; border: none; outline: 0px; vertical-align: top; background: transparent; display: block; clear: both; max-width: 100%; height: auto; width: 600px;\"></figure></div><p style=\"text-align: justify\">Bạn nên chuẩn bị sẵn câu hỏi này trước khi tiến hành phỏng vấn, điều này giúp bạn xác định rằng công việc này có phù hợp với mục tiêu nghề nghiệp của bản thân, đồng thời, bạn có thực sự phù hợp với yêu cầu của vị trí đang ứng tuyển hay không. Hãy luyện tập và điều chỉnh câu trả lời cho tự nhiên và chuyên nghiệp, tránh tình trạng ngập ngừng, lúng túng trong quá trình phỏng vấn. Một điều quan trọng không kém đó chính là hãy luôn thành thật và không phóng đại các giá trị của bản thân. Điều này sẽ giúp bạn hạn chế những khó khăn gặp phải sau khi được nhận việc và không thể hiện được đúng như mong đợi của nhà tuyển dụng.</p><p style=\"text-align: justify\">Hy vọng thông qua bài viết,&nbsp;#danang43&nbsp;đã cung cấp được cho bạn một số kiến thức hữu ích để có thể tự tin trong quá trình thể hiện bản thân trước nhà tuyển dụng.</p>', '2023-06-10 23:28:29'),
('1gc6d0lhij0q6s', '1gcekslgeljvww', 'Ứng viên cần tránh ngay những điểm chết trong hồ sơ xin việc phổ biến sau!', 'Hồ sơ tìm việc là công cụ tốt nhất giúp bạn làm nổi bật kinh nghiệm làm việc, trình độ học vấn và những kỹ năng chuyên môn liên quan. Những thông tin gói gọn về con người bạn trong từ 1-2 trang A4 sẽ quyết định bạn có được gọi phỏng vấn hay không. Do đó, để gia tăng cơ hội được mời phỏng vấn, các ứng viên cần tránh ngay Ứng viên cần tránh ngay những điểm chết trong hồ sơ xin việc phổ biến mà Nghề Nghiệp Việc Làm 24h bật mí sau đây.', '1683777333215diem-chet-trong-ho-so-xin-viec5-min-696x392.jpg', '<p>​<span style=\"color: rgb(34, 34, 34);font-size: 15px\">Hồ sơ tìm việc là công cụ tốt nhất giúp bạn làm nổi bật kinh nghiệm làm việc, trình độ học vấn và những kỹ năng chuyên môn liên quan. Những thông tin gói gọn về con người bạn trong từ 1-2 trang A4 sẽ quyết định bạn có được gọi phỏng vấn hay không. Do đó, để gia tăng cơ hội được mời phỏng vấn, các ứng viên cần tránh ngay Ứng viên cần tránh ngay những điểm chết trong hồ sơ xin việc phổ biến mà&nbsp;</span><a href=\"https://nghenghiep.vieclam24h.vn/ki-ot-vui-ve/moon-phase-la-gi/?utm_source=blog&amp;utm_medium=organic&amp;utm_campaign=AWO_Blog_Organic_JS_ungviencantranhngaynhungdiemchettronghosoxinviecphoviensau_nghenghiep24h\" target=\"_blank\" rel=\"noreferrer noopener\">Nghề Nghiệp Việc Làm 24h</a><span style=\"color: rgb(34, 34, 34);font-size: 15px\">&nbsp;bật mí sau đây.</span>​</p>', '2023-05-02 00:00:00'),
('1gc8u4llurgdkt', '1gcekslgeljvww', '123', 'Mo ta bai viet', '1693219974049290514385_609475073869797_5147230346030642878_n.png', '<p>Bai viet</p>', '2023-08-28 17:52:54'),
('1gcbdwlhikmtqw', '1gcekslgeljvww', 'Có nên đi xuất khẩu lao động? 7 thị trường XKLĐ tốt nhất hiện nay', 'Xuất khẩu lao động (XKLĐ) Nhật Bản, Đài Loan, Hàn Quốc… đang là lựa chọn của nhiều người để tích luỹ vốn và kinh nghiệm để xây dựng sự nghiệp và cuộc sống riêng. Có nên đi xuất khẩu lao động? Đâu là thị trường XKLĐ tốt nhất hiện nay? Cùng Nghề Nghiệp Việc Làm 24h tìm hiểu kỹ hơn về XKLĐ qua bài viết nhé!', '1683793684534diem-chet-trong-ho-so-xin-viec5-min-696x392.jpg', '<h3><strong><em>Xuất khẩu lao động Đức</em></strong></h3><p>XKLĐ Đức là thị trường mới thu hút người lao động Việt Nam bởi mức thu nhập cao và nhiều chính sách tốt cho phép người lao động có cơ hội nhập quốc tịch.&nbsp;</p><p>Trước đây, tại Đức chỉ có chương trình tuyển dụng điều dưỡng do Bộ Lao động – Thương binh &amp; Xã hội quản lý. Hiện nay, chính phủ Đức đã mở cửa thêm cho lao động nhiều ngành nghề như: khách sạn nhà hàng, đầu bếp, xây dựng…</p><p>Chi phí đi XKLĐ tại Đức là khoảng 9.000 EURO (tương đương khoảng 230 triệu đồng) gồm phí nộp hồ sơ, học tiếng, phí phỏng vấn… Mức lương người lao động nhận được khi làm việc tại Đức là khoảng 2.300 EURO đến 3.200 EURO mỗi tháng chưa tính tiền làm thêm, tăng ca. Sau khi trừ đi sinh hoạt phí, mức lương trung bình có thể tiết kiệm là từ 55 triệu đồng đến 65 triệu đồng mỗi tháng.&nbsp;</p><p><br></p><h3><strong><em>Xuất khẩu lao động Singapore</em></strong></h3><p>Singapore là thị trường XKLĐ được đánh giá khó tính và đòi hỏi nhân sự có trình độ cao, điều kiện tuyển dụng bằng từ trung cấp trở lên, trong khi các thị trường khác chỉ cần tốt nghiệp THPT.&nbsp;</p><p>Những ngành nghề XKLĐ tại quốc đảo này phổ biến gồm: nông nghiệp, xây dựng, lâm nghiệp, chế biến thuỷ sản, hải sản…</p><p>Mức lương tùy theo ngành nghề giao động từ 1.200 SGD đến 1.700SGD mỗi tháng (tương đương 19 triệu đến 30 triệu đồng) chưa tính làm thêm giờ hoặc tăng ca. Mức sinh hoạt phí tại đây cũng tương đối đắt đỏ, dao động từ 400 $ đến 600 $ mỗi tháng (tương đương 9,3 triệu đến 14 triệu đồng).</p><p>Hiện nay, ngoài Bộ Lao động- Thương binh &amp; Xã hội có rất ít công ty được phép tuyển dụng XKLĐ đi Singapore. Do đó, người lao động cần tìm hiểu kỹ trước khi lựa chọn.&nbsp;</p><p><br></p><h3><strong><em>Xuất khẩu lao động Canada</em></strong></h3><p>Những năm gần đây, thị trường Canada ngày càng mở rộng, thu hút nhiều người lao động từ nước ngoài tới làm việc theo các chương trình XKLĐ. Nhiều ngành nghề cần nhân lực tại Canada như: nông nghiệp, cơ khí, xây dựng, điện tử, chế biến thực phẩm…</p><p>Mức lương theo giờ tại Canada tương đối cao, từ 16 CAD đến 43 CAD (tương đương 360.000 đồng đến 790.000 đồng). Do đó, mức lương làm việc trung bình tháng tại Canada cũng rất cao, trung bình từ 2.600 CAD đến 70.000 CAD (tương đương 50 triệu đến 130 triệu đồng) tuỳ theo ngành nghề và trình độ chuyên môn.&nbsp;</p><p>Tuy nhiên, thị trường xuất khẩu lao động Canada đòi hỏi những tiêu chuẩn tương đối cao và khắt khe cũng như cần nhiều loại giấy phép.&nbsp;</p>', '2023-01-01 15:57:22'),
('1gccbkliq7ckbz', '1gcekslgeljvww', 'Tại sao nhà tuyển dụng không phản hồi hồ sơ xin việc của bạn?', 'Bạn thắc mắc vì sao nhà tuyển dụng không phản hồi hồ sơ xin việc của mình? Trong khi bạn đã gửi CV cho rất nhiều công ty doanh nghiệp.\n\n', '1686413992147chem-gio-cv.png', '<p>Bạn thắc mắc vì sao nhà tuyển dụng không phản hồi hồ sơ xin việc của mình? Trong khi bạn đã gửi CV cho rất nhiều công ty doanh nghiệp. Vậy việc này là thế nào? Nó có liên quan gì đến quy trình xét duyệt hồ sơ hay không?<br></p><p style=\"text-align: justify\">Thông thường khi ứng tuyển một vị trí trên các trang website việc làm, CV của bạn sẽ được chuyển ngay đến hộp thư email của nhà tuyển dụng. Không cần thông qua bất cứ “rào cản” hay bên trung gian kiểm duyệt nào. Bạn không phải là người duy nhất đâu. Đã rất nhiều người từng trải qua cảm giác chờ đợi mòn mỏi. Sau khi gửi hồ sơ xin việc mà không hề nhận được phản hồi nào từ nhà tuyển dụng.</p><p style=\"text-align: justify\"><br></p><p style=\"text-align: justify\">Khi nhà tuyển dụng thấy bạn là ứng cử viên tiềm năng cho vị trí đó, họ sẽ phản hồi cho bạn ngay. Bằng cách gọi điện thoại trực tiếp hoặc trả lời qua tin nhắn hoặc gửi email cho bạn. Nếu bạn gửi hồ sơ mà vẫn không nhận được phản hồi nào, khả năng lớn nhất là bạn đã không được lựa chọn.</p><p style=\"text-align: justify\">Tất nhiên, trong một thế giới lý tưởng, mỗi ứng viên đều sẽ nhận được phản hồi từ nhà tuyển dụng. Dù là từ chối hay chấp nhận hồ sơ của ứng viên tìm việc. Tuy nhiên thực tế, bộ phận nhân sự và tuyển dụng ở nhiều công ty vừa và nhỏ ở Việt Nam vẫn còn thiếu các công cụ tự động để trả lời cho hàng trăm hồ sơ xin việc họ nhận được.</p><p style=\"text-align: justify\"><span style=\"font-size: 19px\"><strong>Phụ thuộc nhiều yếu tố</strong></span></p><p style=\"text-align: justify\">Có nhiều yếu tố ảnh hưởng đến việc nhà tuyển dụng phản hồi hồ sơ của bạn. Ngoài nguyên nhân chính là do kỹ năng hay kinh nghiệm của bạn không phù hợp hoặc chưa đáp ứng đủ.Nguyên nhân phổ biến thứ hai đó chính là hồ sơ xin việc của bạn. Nhiều bạn quá chăm chút cho phần thiết kế hồ sơ mà bỏ qua phần quan trọng nhất là nội dung. Cũng có bạn trình bày nội dung quá chi tiết đến nỗi dư thừa.</p><p style=\"text-align: justify\">​<span style=\"color: rgb(39, 38, 38)\">Như đã trình bày ở trên, hầu hết các nhân viên tuyển dụng tại Việt Nam thiếu các công cụ tự động hóa để kiểm duyệt và rà soát hồ sơ xin việc của ứng viên. Do đó, những hồ sơ giúp họ nắm được ý chính khi chỉ nhìn lướt qua là những hồ sơ có cơ hội được cân nhắc nhất. Vậy nên trình bày hồ sơ thế nào để dễ dàng lọt vào mắt xanh của nhà tuyển dụng? Hãy chú ý đến các phần sau đây:</span></p><p style=\"text-align: justify\">​<br></p><p style=\"text-align: justify\"><strong><span style=\"font-size: 19px\">Chuẩn bị văn bản cho hồ sơ xin việc</span></strong></p><p style=\"text-align: justify\"><strong>Sử dụng định dạng .doc thay vì .docx</strong></p><p style=\"text-align: justify\">Nhiều công ty tại Việt Nam vẫn chưa cập nhật các bản phần mềm nâng cấp. Nếu bạn dùng định dạng mới .docx , nhà tuyển dụng có thể sẽ không đọc được. Và họ sẽ để CV của bạn qua một bên. Điều này vô tình làm mất đi cơ hội của bạn. Để chắc chắn, hãy sử dụng file .doc cho CV của mình.</p><p style=\"text-align: justify\">Không nên dùng file excel để làm CV vì trông hồ sơ của bạn sẽ không chuyên nghiệp. Tốt nhất bạn nên dùng định dạng .doc hoặc .pdf.</p><p style=\"text-align: justify\"><strong>Đừng dùng những form mẫu CV chung hoặc form mẫu CV của một nhà tuyển dụng nào khác</strong></p><p style=\"text-align: justify\">Những form mẫu CV chung thường là một dạng của sơ yếu lý lịch. Có quá nhiều thông tin mà hầu hết những thông tin này nhà tuyển dụng không cần thiết phải đọc. Khi dùng những form mẫu chung này, nhà tuyển dụng sẽ không đánh giá cao sự chuyên nghiệp của bạn. Trong thời đại ngày nay, CV theo form mẫu đã lỗi thời và thể hiện sựcthiếu tư duy độc lập của bạn. Hãy tự mình làm một CV riêng. Không nhất thiết phải thiết kế hoành tráng nhưng phải mang dấu ấn cá nhân của bạn.</p><p style=\"text-align: justify\"><br></p><p style=\"text-align: justify\"><span style=\"font-size: 19px\"><strong>Nội dung hồ sơ</strong></span></p><p style=\"text-align: justify\"><strong>Nhấn mạnh đến thành tích của bạn</strong></p><p style=\"text-align: justify\">Nếu chỉ đơn giản liệt kê các công việc bạn đã làm thì hồ sơ của bạn cũng giống như hàng trăm hồ sơ khác. Với từng công việc, bạn hãy nêu bật thành tích của bạn. Làm cho nó nổi bật trong hồ sơ để nhà tuyển dụng có thể thấy ngay.</p><p style=\"text-align: justify\"><br></p><p style=\"text-align: justify\"><strong>Dùng từ khóa kỹ năng và công việc mà tuyển dụng đang tìm kiếm</strong></p><p style=\"text-align: justify\">Không nên lan man trong hồ sơ. Hãy tập trung vào các công việc và kỹ năng mà nhà tuyển dụng đang tìm kiếm. Dùng những từ khóa (keyword) đó trong hồ sơ để nhà tuyển dụng có thể tìm thấy nhanh chóng.</p><p style=\"text-align: justify\"><strong>Liệt kê các đầu mục công việc bạn đã làm</strong></p><p style=\"text-align: justify\">Nhiều bạn chỉ đơn giản ghi vị trí và công ty mình đã làm. Nhưng không liệt kê các công việc mình làm trong vị trí đó. Nhà tuyển dụng sẽ không có cái nhìn khái quát về những gì bạn phụ trách. Từ đó không đánh giá được bạn có thích hợp với vị trí mà họ đang tuyển hay không.</p><p style=\"text-align: justify\"><strong>Đừng bao giờ dùng hình ảnh “nhí nhảnh”</strong></p><p style=\"text-align: justify\">Nếu không có hình chụp chân dung chuyên nghiệp, hãy dùng những bức hình thể hiện sự nghiêm túc. Đừng bao giờ lấy hình chụp selfie của bạn để đưa vào CV.</p>', '2023-06-08 23:25:49'),
('1gcdf4likk9nuy', '1gcekslgeljvww', 'Nghỉ việc không lấy sổ bảo hiểm có ảnh hưởng gì không?', 'Nhiều người nghỉ việc ở công ty cũ nhưng quên không lấy sổ bảo hiểm xã hội (BHXH) hoặc vì lý do cá nhân nên chưa lấy sổ ngay. Vậy nghỉ việc không lấy sổ bảo hiểm có ảnh hưởng gì tới quyền lợi được hưởng không? ', '1686072894458treo-banner-tuyen-dung-1.jpg', '<h2><strong>Pháp luật quy định như thế nào về việc lấy số bảo hiểm</strong></h2><p>Trước khi giải đáp băn khoăn về việc nghỉ việc không lấy sổ bảo hiểm có được không, bạn cần hiểu rõ các quy định về lấy và trả sổ bảo hiểm xã hội (BHXH) sau khi nghỉ việc theo pháp luật.&nbsp;</p><p>Khoản 5, điều 21 Luật Bảo hiểm xã hội 2014 quy định: người sử dụng lao động có trách nhiệm phối hợp cùng cơ quan BHXH để trả sổ cho người lao động (NLĐ), đồng thời xác nhận thời gian đóng bảo hiểm khi NLĐ chấm dứt hợp đồng lao động hoặc thôi việc theo đúng quy định của pháp luật.&nbsp;</p><p><br></p><p>Theo luật định này thì người lao động có trách nhiệm chốt sổ BHXH cho NLĐ. Người lao động không được tự ý chốt sổ BHXH trừ trường hợp đơn vị cũ phá sản. Đồng thời, NLĐ không được phép tự ý huỷ sổ BHXH.</p><p>Trong trường hợp bạn nghỉ ở đơn vị cũ nhưng chưa chốt sổ BHXH và chưa lấy sổ BHXH vì một lý do nào đó, bạn cần yêu cầu đơn vị cũ hoàn tất thủ tục và tiến hành trả sổ BHXH. Trong trường hợp tự nghỉ việc mà không được người sử dụng lao động đồng ý, được coi là đơn phương chấm dứt hợp đồng (HĐ), NLĐ phải thực hiện các nghĩa vụ:</p><ol><li>Không được nhận trợ cấp thôi việc.</li><li><span style=\"color: rgb(34, 34, 34);font-size: 15px\">Bên cạnh đó theo Điều 1, khoản 48 trong bộ luật này, nếu NLĐ đã thực hiện đúng nghĩa vụ, người sử dụng lao động cũng phải hoàn tất thủ tục chốt sổ BHXH và trả lại sổ cho NLĐ.&nbsp;</span></li><li>Phải thực hiện bồi thường cho người sử dụng lao động nửa tiền lương theo HĐ và nhận một khoản tiền tương ứng với mức tiền lương theo HĐ lao động trong những ngày không báo trước.&nbsp;&nbsp;</li><li>Hoàn trả cho người sử dụng lao động phí đào tạo theo quy định trong điều 62, Luật BHXH.</li></ol>', '2023-06-11 00:00:00');

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
('1gc5holhar2fnt', '1gc5holhaquou5', 'CTV', 'QLCC', '15', 10000000, 'Bui-Van-Sy-TopCV.vn-080323.90445.pdf', 'Fresher IT', 1, '2023-05-21', '1684481004581Bui-Van-Sy-TopCV.vn-080323.90445.pdf', 'ITPM', '1N', 'TTG'),
('1gc5iglhu70jbo', '1gc5holhaquou5', 'CTV', 'QLCC', '15', 100000000, 'CV - Intership PHP,Laravel 04-02-2022.pdf', 'Intern PHP', 1, '2023-05-21', '1684479251735CV - Intership PHP,Laravel 04-02-2022.pdf', 'ITPM', '1N', 'TTG'),
('1gc5rolhxjv0yp', '1gc710lfdu4aez', 'NV', 'QLCC', '15', 1000000, 'CV_ĐẶNGVĂNĐỨC.pdf', 'Nhân viên kế toán', 1, '2023-06-10', '1684681489338CV_Äáº¶NGVÄNÄá»¨C.pdf', 'K-Toan', '1N', 'HD'),
('1gc8kclik7mnjb', '1gc8kclik755lf', 'TTS', 'senior', '15', 3000000, 'CNTT_7480201_CN19.pdf', '❤❤???', 0, '2023-06-06', '1686051656760CNTT_7480201_CN19.pdf', 'ITPC', 'D1N', 'HD'),
('1gc8y8lgxt6pzk', '1gcyslgxgw73d', 'CTV', 'CTV', 'Cần Thơ', 10000009, 'DO-QUANG-HUY-CV_FRESHER_FE.pdf', 'sybuivan1429@gmail.com', 1, '2023-04-26', '1682520369621DO-QUANG-HUY-CV_FRESHER_FE.pdf', 'ITPC', '1N', 'TTS'),
('1gc9xglicriijm', '1gc9xglicr0oue', 'senior', 'senior', '25', 1000000, 'CNTT_7480201_CN19.pdf', 'senior', 0, '2023-06-01', '1685601332620CNTT_7480201_CN19.pdf', 'ITPM', '3Y', 'TTG'),
('1gcev4lhlijwob', '1gcck0lg61fe1u', 'CTV', 'QLCC', 'Đà Nẵng', 1000000, 'CNTT_7480201_KS19.pdf', 'intern', 0, '2023-05-13', '1683953694128CNTT_7480201_KS19.pdf', 'ITPM', 'D1N', 'TTG'),
('1gcggklhbkiy4k', '1gc710lfdu4aez', 'CTV', 'QLCC', '15', 1000000, 'Fresher-Frontend-BuiVanSy.pdf', 'Fresher FullStack web', 1, '2023-08-28', '1683352350009Fresher-Frontend-BuiVanSy.pdf', 'ITPM', '1N', 'TTG');

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
('10T-15T', '10-15 triệu'),
('15T-20T', '15-20 triệu'),
('1T-3T', '1-3 triệu'),
('20T-30T', '20-30 triệu'),
('3T-6T', '3 - 6 triệu'),
('6T-8T', '6 - 8 triệu'),
('8T-10T', '8 - 10 triệu'),
('thuong-luong', 'Thương lượng'),
('tren30', '>30 triệu');

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
  `id_room` varchar(100) NOT NULL,
  `id_job` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `room`
--

INSERT INTO `room` (`id_user`, `id_company`, `id_room`, `id_job`) VALUES
('1gc710lfdu4aez', '1gc9xglicrs6et', '1gc88sliju267p', '1gc9xglicsjldd'),
('1gc5holhaquou5', '1gc5holhapoh73', '1gc948lhxihvzk', '1gc9x0lhxgztrj'),
('1gc9xglicr0oue', '1gc9xglicrs6et', '1gc9xglicst4m6', '1gc9xglicsjldd'),
('1gc710lfdu4aez', '1gc2holhitg82w', '1gca6olijt3pua', '1gc274lhx9eumx'),
('1gc710lfdu4aez', '1gc2holhitg82w', '1gcdf4likjukwg', '1gcdf4likh2yhn'),
('1gc710lfdu4aez', '1gc2holhitg82w', '7kklike5jhl', '1gc274lhx9b1ah'),
('1gc710lfdu4aez', '1gc2holhitg82w', '7kklikef4u4', '1gc274lhx9bdx3');

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
('1gc710lfdu4aez', '1gcdf4likk18jx', '2023-06-11'),
('1gc8kclik755lf', '1gc8kclik8bhur', '2023-06-06'),
('1gc9xglicr0oue', '1gc274lhx9byb5', '2023-06-01'),
('1gc9xglicr0oue', '1gc274lhx9ge4i', '2023-06-01'),
('1gc9xglicr0oue', '1gc9xglicsjldd', '2023-06-01');

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
  `created_at` date DEFAULT NULL,
  `expiry` date DEFAULT NULL,
  `activated` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `service_history`
--

INSERT INTO `service_history` (`id_history`, `id_service`, `id_company`, `created_at`, `expiry`, `activated`) VALUES
('02T00165Y0689245U', 'DV04', '8z0lhalx9m5', '2023-05-05', '2023-06-05', 1),
('14T46372N2454360G', 'DV01', '1gc3uklgomt0oc', '2023-05-16', '2023-06-16', 1),
('1N013167TY165484P', 'DV02', '1gc3uklgomt0oc', '2023-05-05', '2023-08-05', 1),
('1YD56786HR888024X', 'DV01', '8z0lhalx9m5', '2023-05-05', '2023-06-05', 1),
('2AE945897W308884N', 'DV01', '8z0lhalx9m5', '2023-05-06', '2023-06-06', 1),
('2V047795D7665303F', 'DV04', '1gc5holhapoh73', '2023-05-05', '2023-06-05', 1),
('3Y0651406K0334900', 'DV02', '1gc2holhitg82w', '2023-08-28', '2023-11-28', 1),
('47X02375C4123950S', 'DV02', '1gc3uklgomt0oc', '2023-04-23', '2023-07-23', 1),
('4B964545RJ6263443', 'DV01', '1gc2holhitg82w', '2023-08-28', '2023-09-28', 1),
('4HX535825J8738722', 'DV02', '1gc8kclik7sft0', '2023-06-06', '2023-09-06', 1),
('4PD11132MP508694L', 'DV01', '1gc3uklgomt0oc', NULL, NULL, 0),
('5AM13095RM173730G', 'DV01', '1gc5holhaqext1', '2023-05-05', '2023-06-05', 1),
('5C908696JC076614M', 'DV02', '1gc7kwlhilr5ep', '2023-05-21', '2023-08-21', 1),
('5EA69806WH027710K', 'DV01', '1gc5holhapoh73', '2023-05-21', '2023-06-21', 1),
('5PK47658PP9392309', 'DV04', '1gc2holhitg82w', '2023-05-21', '2023-06-21', 1),
('6T9364086F863033V', 'DV04', '1gc5holhapzuw9', '2023-05-05', '2023-06-05', 1),
('7PK10048FX876522W', 'DV04', '1gc3uklgomt0oc', '2023-05-05', '2023-06-05', 1),
('7YL713983T204993B', 'DV01', '1gc9xglicrs6et', '2023-06-01', '2023-07-01', 1),
('80R33567U5582534H', 'DV04', '1gc5holhaq7j4l', '2023-05-05', '2023-06-05', 1),
('91S516717T292893B', 'DV04', '8z0lhalx9m5', '2023-05-06', '2023-06-06', 1),
('93S869472B980611P', 'DV04', '1gc2holhitg82w', '2023-06-07', '2023-07-07', 1),
('9UF445465D579233F', 'DV01', '1gc2holhitg82w', '2023-06-06', '2023-07-06', 1);

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
('leader', 'Leader'),
('NV', 'Nhân viên'),
('QLCC', 'Quản lý cấp cao'),
('senior', 'Senior'),
('TTS', 'Thực tập sinh');

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
  `gender` varchar(5) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `birthDay` date DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `is_update_profle` int(11) DEFAULT NULL,
  `is_lock` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id_user`, `id_role`, `fullName`, `email`, `phone`, `gender`, `password`, `birthDay`, `address`, `city`, `avatar`, `is_update_profle`, `is_lock`) VALUES
('1gc2holhitg82w', 'company', ' Nguyễn Hoài Đức', 'nguyenhoaiduc@gmail.com', '0945885444', NULL, '$2b$10$khsSTsmcwQRIzcJC.c/LauX6rJa11mSclcsbt0scYGHh/sHcp/02C', NULL, NULL, '', NULL, NULL, 0),
('1gc3uklgomt0oc', 'company', 'Lê Thị Thảo', 'lethithao36@gmail.com', '091544454', NULL, '$2b$10$G76AUGP4Wl3ndNpWPD7mmO2ykMjjaLLcXyFnQ5NNx28mM2CWjPULm', NULL, NULL, '', NULL, NULL, 0),
('1gc5holhapoh73', 'company', 'Nguyen Hoang An', 'hdsaigon@gmail.com', '0233334457', NULL, '$2b$10$jzyrLR/61Kbfwq3F5lBBw.rbi2Xv3/ytEn/gVEYM7vZNtl0lGgrCa', NULL, NULL, '', NULL, NULL, 0),
('1gc5holhapzuw9', 'company', 'Le Vu', 'abbott@gmail.com', NULL, NULL, '$2b$10$u8JUZNPGx5.r0fBp6aeiwuKwRUgnwuvTPqcrkGX7p0K2xfDnS3NEu', NULL, NULL, '', NULL, NULL, 0),
('1gc5holhaq7j4l', 'company', 'Nguyen Tra My', 'vacxin@gmail.com', NULL, NULL, '$2b$10$cqjlMjrYC/hRc/0vv.cbb.LN/wBWEA3X7SMsjazFqJb9/kkogYmsC', NULL, NULL, '', NULL, NULL, 0),
('1gc5holhaqext1', 'company', 'Bui Van Hoang', 'vanhoang@gmail.com', NULL, NULL, '$2b$10$Vb.ylzz.nycMF1EB5pFUTugWFEE/2MYl7IXq1G1/e6K8c8UNC0yRm', NULL, NULL, '', NULL, NULL, 0),
('1gc5holhaquou5', 'user', 'Phạm Văn Thiên', 'vanthien.dev@gmail.com', '032200121', 'Nam', '$2b$10$fx6uxdCHbE7CVxWNi4V3WeHWSYSAFcHFbiTy54wuXUxo4TiYH/F3y', '2002-01-01', '02 Thanh Son - Hai Chau - Da Nang', '15', '1684474805127z4358268139209_15100bb9f32714f69f1b65b9c7f3abfc.jpg', 1, 0),
('1gc5rolhxk3z80', 'company', 'NGUYỄN MINH THÁI', 'nguyenminhthai@gmail.com', '012122232', NULL, '$2b$10$032oYUOpKPFs.hIF9GphQu1EFbvJWx1jKPFZS8b67dFzxmLWJ6Yqu', NULL, NULL, '', NULL, NULL, 0),
('1gc710lfdu4aez', 'user', 'Bui Van Sy', 'sybuivan1429@gmail.com', '038911223', 'Nam', '$2b$10$jN/xfi0pduESBxnc9hILs.OOWUxt.jVnyz9/Xx2bIJMIoW7tCQ7vu', '1999-04-08', '72 Đinh Tiên Hoàng - Hải Châu - Đà Nẵng', '24', '1679316128486IMG_4414.JPG', 1, 0),
('1gc7kwlhilr5ep', 'company', 'Trần Hậu', 'tranhau@gmail.com', '212121212', NULL, '$2b$10$8U4xjSkfgAuLXCerT8KswuVRx.8b8gR4jR2NE7MyLGrOKo1ccGg5G', NULL, NULL, '', NULL, NULL, 0),
('1gc8kclik755lf', 'user', 'trân tiến', 'trantien@gmail.com', '0987654321', 'Nam', '$2b$10$Vv.ppHjG9rFSGLlcrpl17./eZPw4KChBXSPEkDmXtz682LBfYY24K', '2023-06-06', '48 cao thắng, đà nẵng', '15', '1686051388248avatar3.jpg', 1, 0),
('1gc8kclik7sft0', 'company', 'Trần tiến', 'thanhnhan@gmail.com', '0987654321', NULL, '$2b$10$sZbiGgBGv24miIX./HicGOIaVwpXw9JJPyhMNY3wFDpa5uyVtkddy', NULL, NULL, '', NULL, NULL, 0),
('1gc9xglicr0oue', 'user', 'admin1234', 'tranytien2022@gmail.com', '0987654321', 'Nam', '$2b$10$qob41YuAJt.TXj0bTkc26.igMIpoheEsIIq7FTefx.I2Ie0V2HEmC', '2001-01-01', '48 Cao Thắng', '15', '1685601270624avatar3.jpg', 1, 0),
('1gc9xglicrs6et', 'company', 'Thẩm định giá', 'thamdinhgia@gmail.com', '0925111222', NULL, '$2b$10$pTVPW3.doSRLMMPWnO3LH.MPSZd3pW5uz37oPdavgV.q/EZDzqYwe', NULL, NULL, '', NULL, NULL, 0),
('1gcbgwlifpvrds', 'company', 'Sol home', 'solhome@gmail.com', '852665444', NULL, '$2b$10$EfZGnbMriM7cwMvF3LpJcuPHsxk8GkebQg2hcYom.UoKDe6/umHwa', NULL, NULL, '', NULL, NULL, 0),
('1gcck0lg61fe1u', 'user', 'Tran Y Tien', 'tranytien@gmail.com', '0987654321', 'Nam', '$2b$10$H9AdfbN3nHIfLPEfM..6/eOtZ62Yi/SfmXS83vcC13uImJ8IRhGjG', '2023-05-03', '2345', '15', '16839536000552.jpg', 1, 0),
('1gcdf4likkdqzn', 'company', 'Nguyễn Văn Lộc', 'nguyenvanloc@gmail.com', '232212110', NULL, '$2b$10$HHnZDhp2kCjwsJ2sHHULQO6JRZZywGKRHUYR4jDarqPHcfwsUhcc.', NULL, NULL, '', NULL, NULL, 0),
('1gcdt4lhiwvya4', 'user', 'trantien', 'trantien@gmail.com', NULL, NULL, '$2b$10$rBpWSa7rQrJBVONtglS1R.0YzhviYAwLmVAMOPEiVC7aP8Q7G3TX2', NULL, NULL, '', NULL, NULL, 0),
('1gcdt4lhixwokq', 'user', 'Phạm Văn Thiên', 'vanthien.dev11@gmail.com', '0394921219', 'Nam', '$2b$10$3dzxm8Fu4UWtA/efMd3j/OWV9bCM4Jeulxt0a2QjPoHETvaKhfQ/C', '2023-05-05', 'thanhnhddandđ', '15', '1683798172761thao.jpg', 1, 0),
('1gcekslgeljvww', 'admin', 'Quản trị viên', 'admin123@gmail.com', NULL, NULL, '$2b$10$byb3b/SFnt/Exa/H0sPAmOxhVnWpDJYODhdVm4cv2bzfgqysR9Pka', NULL, NULL, '', NULL, NULL, 0),
('1gcev4lhlhyoa0', 'company', 'thiên bùi', 'thienbui@gmail.com', '987654321', NULL, '$2b$10$jI6wV5URc96KsYKqkJSEnOMfIdLJRMrMdIkrJUyFrsjGY8ZT/LRpK', NULL, NULL, '', NULL, NULL, 1),
('1gcyslgxgw73d', 'user', 'Nguyễn Thành Nhân', 'nguyenthanhnhan12701@gmail.com', '0947895682', 'Nam', '$2b$10$vJ6a9kT36jr0M/j/RE4DA.uvBPCjzOObyhfHPvavKdhPAZpab6bUS', '2002-01-01', '19 Đinh Tiên Hoang', '15', '1686047517908nhan.jpg', 1, 0),
('8z0lhalx9m5', 'company', 'Hoàng Văn A', 'jacss123@gmail.com', '0945632112', NULL, '$2b$10$QBFq/QS.Maf.hfxexf07hubKWXuVGGyF6oXgB0k2Eo0DaPr2gH8Nq', NULL, NULL, '', NULL, NULL, 0);

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
('BTG', 'Bán thời gian'),
('HD', 'Hợp đồng'),
('khac', 'Khác'),
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
  ADD KEY `chat_ibfk_1` (`id_room`);

--
-- Indexes for table `citiesjob`
--
ALTER TABLE `citiesjob`
  ADD PRIMARY KEY (`id_job`,`id_city`);

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
  ADD KEY `idCompanyField` (`idCompanyField`),
  ADD KEY `company_ibfk_2` (`city`);

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
  ADD KEY `profile_cv_ibfk_8` (`id_user`);

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
  ADD KEY `id_user` (`id_user`),
  ADD KEY `room_ibfk_3` (`id_job`);

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
  ADD KEY `id_role` (`id_role`);

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
  ADD CONSTRAINT `chat_ibfk_1` FOREIGN KEY (`id_room`) REFERENCES `room` (`id_room`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `company`
--
ALTER TABLE `company`
  ADD CONSTRAINT `company_ibfk_2` FOREIGN KEY (`city`) REFERENCES `city` (`id_city`) ON DELETE CASCADE ON UPDATE CASCADE,
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
  ADD CONSTRAINT `profile_cv_ibfk_8` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `room`
--
ALTER TABLE `room`
  ADD CONSTRAINT `room_ibfk_1` FOREIGN KEY (`id_company`) REFERENCES `company` (`id_company`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `room_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`),
  ADD CONSTRAINT `room_ibfk_3` FOREIGN KEY (`id_job`) REFERENCES `job` (`id_job`) ON DELETE CASCADE ON UPDATE CASCADE;

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
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`id_role`) REFERENCES `roleuser` (`id_role`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
