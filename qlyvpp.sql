-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th4 22, 2026 lúc 03:47 AM
-- Phiên bản máy phục vụ: 10.4.32-MariaDB
-- Phiên bản PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `qlyvpp`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `account`
--

CREATE TABLE `account` (
  `id` int(11) NOT NULL,
  `userAccount` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `email` varchar(200) NOT NULL,
  `numberphone` int(11) NOT NULL,
  `address` varchar(200) NOT NULL,
  `password` varchar(100) NOT NULL,
  `idsell` tinyint(1) NOT NULL,
  `idadmin` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `account`
--

INSERT INTO `account` (`id`, `userAccount`, `username`, `email`, `numberphone`, `address`, `password`, `idsell`, `idadmin`) VALUES
(1, 'Thanh Bình', 'binh2910', 'binh279205@gmail.com', 973047453, 'Bắc Ninh', 'binh2910', 1, 1),
(4, 'Thanh Bình', 'binh27920', 'binh279205@gmail.com', 973047343, 'Bắc Ninh', 'Binh2910', 0, 0),
(5, 'Nguyễn Thanh Bình', 'thanbinh', 'binh279205@gmail.com', 973047453, 'Bắc Ninh', 'thanhbinh', 1, 0),
(6, 'Nguyễn Thanh Bình', 'thanhbinh2005', 'binh279205@gmail.com', 973047453, 'Bắc Ninh', 'thanhbinh2005', 0, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `category`
--

CREATE TABLE `category` (
  `cid` int(11) NOT NULL,
  `cname` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `category`
--

INSERT INTO `category` (`cid`, `cname`) VALUES
(1, 'BÚT'),
(2, 'VỞ'),
(3, 'DỤNG CỤ HỌC TẬP'),
(4, 'ĐỒ DÙNG VĂN PHÒNG'),
(5, 'MÁY TÍNH');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `image` varchar(500) NOT NULL,
  `price` varchar(100) NOT NULL,
  `description` varchar(2000) NOT NULL,
  `cid` int(11) DEFAULT NULL,
  `sID` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `product`
--

INSERT INTO `product` (`id`, `name`, `image`, `price`, `description`, `cid`, `sID`, `quantity`) VALUES
(3, 'Máy tính Casio FX-580VN X-BL màu đen (lưng trắng)', 'https://cdn.hstatic.net/products/1000362139/casio_fx-580vnx_0_7779a92dcd36483a9f3b9bc9171addb9_af326c6328524a218ae840836578ebe5.png', '678.000', 'Máy tính Casio FX-580VN X thuộc dòng máy tính khoa học ClassWiz của hãng máy tính CASIO. Máy được trang bị màn hình LCD có độ phân giải cao. Casio fx-580VN X là bước tiến đột phá, mang công nghệ đến gần hơn với lớp học. Độ phân giải của màn hình của Casio fx-580VN X được tăng gấp 4 lần, hỗ trợ tăng lượng thông tin hiển thị cũng như cải thiện tính tiện dụng của sản phẩm. Đây là chiếc máy tính khoa học có hiệu suất cao, tốc độ tính toán nhanh; phù hợp với nhiều cấp học từ học sinh, sinh viên. \r\n\r\nSố tính năng: 521\r\n\r\nĐộ phân giải của màn hình của máy tính Casio FX-580VNX được tăng gấp 4 lần, hỗ trợ tăng lượng thông tin hiển thị cũng như cải thiện tính tiện dụng của sản phẩm\r\n\r\nTính năng đặc biệt: Kiểm tra số nguyên tố có 4 chữ số, Lưu phần thương và phần dư trong phép chia, Tính năng kiểm tra đúng/sai, Thông báo vô nghiệm khi giải phương trình bậc hai, Cực trị của hàm số bậc ba, Giải hệ phương trình 4 ẩn, Giải phương trình bậc 4, Giải bất phương trình bậc 4, Tốc độ xử lí vượt trội.... \r\n\r\nSử dụng pin: AAA\r\n\r\nĐược phép mang vào phòng thi\r\n\r\nChính sách bảo hành 7 năm 1 đổi 1 trong năm đầu lỗi do nhà sản xuất.\r\n\r\nXuất xứ: Thái Lan', 5, 5, 15),
(4, 'Khay cắm bút Deli Z601 Sơn Tùng M-TP - Kích thước 80x100mm', 'https://cdn.hstatic.net/products/1000362139/9_6105845f5fb1421f84ac181cff118f66_small.png', '39.000', 'Thiết kế hình trụ, chia tầng độc đáo. Với thiết kế 2 ngăn cắm bút và 3 ngăn kéo nhỏ có thể giúp bạn sắp xếp được nhiều bút và vật dụng hơn và phù hợp bài trí lên mọi không gian của bạn.\r\n\r\nGiúp sắp xếp bút, kéo, thước gọn gàng trên bàn học hoặc bàn làm việc.\r\n\r\nNhựa dày dặn, bền, dễ vệ sinh.\r\n\r\nMàu pastel trẻ trung, phù hợp học sinh – sinh viên – văn phòng.\r\n\r\nĐóng hộp đẹp, có thể dùng làm quà tặng nhỏ.', 3, 5, 50),
(5, 'Cặp trình ký GuangBo A6381 - Khoá dọc, chống xước, nhiều màu lựa chọn', 'https://product.hstatic.net/1000362139/product/cap_trinh_ky_doc_a6381_40031fa1b3a74c4cb42c8e4ab36dee51_small.jpg', '56.000', 'Cặp trình ký GuangBo A6381 - Khoá dọc là sản phẩm cần thiết dành cho giới học sinh, sinh viên và nhân viên văn phòng. Cặp file được làm từ nhựa PP có độ bền cao, an toàn cho sức khỏe người sử dụng. Khóa chắc chắn, chống xước và chống nước, dễ dàng đóng mở, giúp bạn bảo quản hồ sơ, giấy tờ và tài liệu tiện lợi.\r\n\r\nSản phẩm có kích cỡ 238 x 315 mm, thích hợp để đựng tài liệu khổ giấy A4 - khổ giấy phổ biến của đa số các loại giấy tờ hiện nay. Bìa trình ký A4 GuangBo có màu sắc trẻ trung, nổi bật. Sản phẩm giúp bạn đựng hồ sơ, giấy tờ không bị nhăn, nhàu hay thất lạc, tạo không gian và tác phong làm việc chuyên nghiệp, ngăn nắp, gọn gàng.', 4, 5, 100),
(6, 'Sổ bìa còng Hồng Hà A5 Office 200 trang - 9230', 'https://bizweb.dktcdn.net/thumb/large/100/334/874/products/9230-1.png', '250.500', 'Màu sắc: Đỏ - Xanh\r\nKích thước: A5 148*210 (±2mm) \r\nSố trang:200 trang\r\nĐịnh lượng: 70 g/m²\r\nĐộ trắng: 76 - 78%ISO', 2, 1, 150),
(7, 'Vở kẻ ngang 120 trang Pupil New Wave Hồng Hà - 1097', 'https://bizweb.dktcdn.net/thumb/1024x1024/100/334/874/products/vo-ke-ngang-hong-ha-1097-3.jpg?v=1752053445173', '14.800', 'Mã sản phẩm: 1097 | Barcode: 8935044510975\r\nKích thước:  180 * 252 (±2mm)\r\nSố trang:       120 trang không kể bìa\r\nĐịnh lượng:  58 g/m²\r\nĐộ trắng:      90 - 95 %ISO\r\nĐóng gói: 5 quyển/lốc, 80 quyển/thùng\r\nSản xuất tại: Công ty Cổ phần Văn phòng phẩm Hồng Hà\r\nXuất xứ: Việt Nam', 2, 1, 520),
(8, 'Vở Ô ly 48 trang Hồng Hà School Joyful - 0586', 'https://bizweb.dktcdn.net/thumb/1024x1024/100/334/874/products/vo-4-o-ly-vuong-school-hong-ha-0586-5.jpg?v=1744163797897', '7.800', 'Dòng Kẻ: 4 Ô Ly vuông (2.5 x 2.5) mm\r\nKích Thước: 170 x 240 (±2mm)\r\nSố Trang: 48 Trang Không Kể Bìa\r\nĐịnh Lượng: 70g/m2\r\nĐộ Trắng: 90 - 92%ISO\r\nĐóng gói: 10 quyển/lốc, 200 quyển/thùng\r\nSản xuất tại: Công ty Cổ phần Văn phòng phẩm Hồng Hà\r\nXuất xứ: Việt Nam', 2, 1, 245),
(9, 'Vở 4 Ô ly 80 trang Hồng Hà School Gabu - 0549', 'https://bizweb.dktcdn.net/thumb/1024x1024/100/334/874/products/vo-4-o-ly-vuong-school-hong-ha-0549-6.jpg?v=1748336958470', '17.200', 'Dòng kẻ: 4 ô ly vuông (2.5 x 2.5) mm\r\nKích thước: 170 x 240 (±2mm)\r\nSố trang: 80 trang không kể bìa\r\nĐịnh lượng: 100g/m²\r\nĐộ trắng: 82 %ISO (Chống lóa)\r\nĐóng gói: 100 quyển/thùng\r\nSản xuất tại: Công ty Cổ phần Văn phòng phẩm Hồng Hà\r\nXuất xứ: Việt Nam', 2, 1, 200),
(10, 'Sổ tổng hợp 600 trang B5 Hồng Hà - 4671', 'https://bizweb.dktcdn.net/thumb/large/100/334/874/products/so-tong-hop-b5-hong-ha-4671-3.jpg?v=1749033589183', '90.000', 'Kẻ ngang\r\nKích thước: B5\r\nSố trang: 600 trang\r\nĐịnh lượng: 70gsm\r\nĐộ trắng: 95%ISO\r\nĐóng gói: 1 quyển/ túi OPP, 16 quyển/thùng', 2, 1, 15),
(11, 'Sổ da Hồng Hà CK8 200 trang - 4667', 'https://bizweb.dktcdn.net/thumb/large/100/334/874/products/so-da-hong-ha-4667-4-55afc686-c0b5-4f7d-b693-139b73141a02.jpg?v=1744790774993', '33.333', 'Màu sắc:      Đen - Đỏ\r\nKích thước:  170 x 245mm\r\nSố trang:       200 trang\r\nĐịnh lượng:  70 g/m²\r\nĐộ trắng:      95%ISO\r\nĐóng gói:     01 quyển/túi OPP, 38 quyển/thùng', 2, 1, 90),
(12, 'Sổ da Hồng Hà CK9 200 trang - 4668', 'https://bizweb.dktcdn.net/100/334/874/products/so-da-hong-ha-4668-2.jpg?v=1742192934953', '45.445', 'Màu sắc:      Đen - Đỏ\r\nKích thước:  180 x 265mm\r\nSố trang:       200 trang\r\nĐịnh lượng:  70 g/m²\r\nĐộ trắng:      95%ISO\r\nĐóng gói:     01 quyển/túi OPP, 36 quyển/thùng', 2, 1, 120),
(13, 'Bút máy văn phòng cao cấp Trường Sơn TS03 - 9041', 'https://bizweb.dktcdn.net/thumb/large/100/334/874/products/but-may-van-phong-cao-cap-truong-son-ts03-9041-2.jpg?v=1735180143883', '500.000', 'Ngòi bút 0.5 mm cao cấp \r\nChất liệu: Hợp kim sang trọng\r\nMàu sắc: Đen\r\nQuy cách đóng gói: 1 cây/hộp \r\nXuất xứ: Việt Nam.', 1, 1, 234),
(14, 'Bút bi cao cấp Hồng Hà | Bút ký quà tặng 297B09 - 9001', 'https://bizweb.dktcdn.net/100/334/874/products/but-may-cao-cap-9001-2.jpg?v=1637027858340', '133.000', 'Đầu ngòi bút: 1 mm\r\nMàu mực: Mực Xanh\r\nThương hiệu: Văn phòng phẩm Hồng Hà\r\nXuất xứ: Việt Nam', 1, 1, 845),
(15, 'Bút dạ bi cao cấp Hồng Hà | Bút ký quà tặng K710R02 - 9002', 'https://bizweb.dktcdn.net/thumb/large/100/334/874/products/9002.png?v=1636534543863', '245.678', 'Đầu ngòi: 0.8mm.\r\nMàu mực: Xanh\r\nThương hiệu: Văn phòng phẩm Hồng Hà\r\nXuất xứ: Việt Nam', 1, 1, 145),
(16, 'Bút quà tặng - 2443', 'https://bizweb.dktcdn.net/thumb/large/100/334/874/products/2443-1-da751276-7b50-4017-9b20-bf46ea1e7dbb.jpg?v=1637036924807', '98.888', 'Kích thước nét viết: 1mm\r\nPhù hợp việc ghi chép và ký những văn bản quan trọng.\r\nThương hiệu: Văn phòng phẩm Hồng Hà\r\nXuất xứ: Việt Nam', 1, 1, 15),
(17, 'Bút dạ bi cao cấp Hồng Hà | Bút ký quà tặng CD9R01 - 9009', 'https://bizweb.dktcdn.net/thumb/large/100/334/874/products/9009.png?v=1636537885300', '304.656', 'Bút dạ bi cao cấp Hồng Hà CD9R01 - 9009 với thiết kế sang trọng và hiện đại sẽ là sự lựa chọn thích hợp cho giới văn phòng và là món quà tặng ý nghĩa trong các dịp hội nghị.', 1, 1, 234),
(18, 'Giấy kiểm tra 4 ô ly dạng hộp - 4969', 'https://bizweb.dktcdn.net/thumb/large/100/334/874/products/giay-kiem-tra-hong-ha-4969-2.jpg?v=1747628551207', '12.300', 'Dòng Kẻ:     4 ô ly vuông (2 x 2)mm\r\nKích Thước: 156 x 205 (±2mm)\r\nĐịnh Lượng: 80g/m2\r\nĐộ Trắng:    90 - 92%ISO\r\nSố lượng:     20 tờ kép/hộp – 120 hộp/thùng\r\nDành cho học sinh miền Trung - Nam', 3, 5, 1231),
(19, 'Giấy kiểm tra 5 ô ly Dream - miền Trung/Nam - 4938', 'https://bizweb.dktcdn.net/thumb/large/100/334/874/products/giay-kiem-tra-5-o-ly-dream-mien-trung-nam-4938-2.jpg?v=1735180895717', '18.363', 'Dòng Kẻ:     5 ô ly vuông (2x2)mm\r\nKích Thước: 156 x 205 (±2mm)\r\nĐịnh Lượng: 80g/m2\r\nĐộ Trắng:    90 - 92%ISO', 3, 5, 1200),
(20, 'Giấy kiểm tra ly ngang Chibi - 4937', 'https://bizweb.dktcdn.net/thumb/large/100/334/874/products/giay-kiem-tra-ly-ngang-chibi-4937-2.jpg?v=1735181131873', '18.363', 'Kích Thước: 156 x 205 (±2mm)\r\nĐịnh Lượng: 80g/m2\r\nĐộ Trắng:     90 - 92%ISO\r\nSố lượng:     20 tờ kép/hộp', 3, 5, 1300),
(21, 'File còng Simili FC 7cm Hồng Hà - 6628', 'https://bizweb.dktcdn.net/thumb/large/100/334/874/products/giay-pho-to-a3-2cdb229c-2865-4759-8d70-5db94ca01d0f.png?v=1631159495047', '18.363', 'Kích thước: 345 x 285 x 70 (mm)\r\nChất liệu: 1 mặt Simili, bồi carton 2.0 mm\r\nMàu sắc: Xanh\r\nKhả năng lưu trữ:  450tờ A4\r\nNhãn hiệu: PROLINE - Hồng Hà', 4, 5, 234),
(22, 'Túi nilon đục lỗ A4 Hồng Hà (túi 100 cái) - 6626', 'https://bizweb.dktcdn.net/thumb/large/100/334/874/products/tui-nilon-duc-lo-a4-hong-ha-6626-2.jpg?v=1746676720313', '12.230', 'Cấu tạo từ vật liệu PP, độ dày 0.05mm \r\nLưu trữ khoảng 15 tờ A4/cái\r\nĐóng gói: 100 cái/túi\r\nLưu trữ khoảng 15 tờ A4/cái ', 4, 5, 68),
(23, 'Kẹp bướm, kẹp giấy màu Hồng Hà 41mm (hộp 24 chiếc) - 6642', 'https://bizweb.dktcdn.net/thumb/large/100/334/874/products/kep-buom-kep-giay-mau-hong-ha-41mm-hop-24-chiec-6642-2.jpg?v=1740103910583', '18.363', 'Kích thước: 41 mm\r\nMàu sắc: xanh dương, xanh lá, hồng, vàng neon\r\nĐóng gói: 24 cái/hộp;\r\nThương hiệu: Hồng Hà\r\nChất liệu: Kim loại chất lượng cao phủ Niken', 4, 0, 67),
(24, 'Kéo Văn Phòng Hồng Hà LR-03 174mm - 6658', 'https://bizweb.dktcdn.net/thumb/large/100/334/874/products/6658.jpg?v=1614669625293', '18.363', '', 4, 5, 89),
(25, 'Dao rọc giấy Hồng Hà 18mm ZM-01 - 6652', 'http://bizweb.dktcdn.net/thumb/large/100/334/874/products/z6439640905646-9a028129c25589fa20e03a031f784780.jpg?v=1742870613913', '18.363', 'Kích thước: 18mm\r\nMàu sắc: xanh lá, xanh dương, đỏ, vàng\r\nĐóng gói: 36 chiếc/hộp', 4, 5, 68),
(26, 'Máy tính Casio FX-570VN Plus', 'https://magiamgiaxanh.com/wp-content/uploads/2024/06/may-tinh-casio-fx-570vn-plus.png', '188.366', 'Với nhiều tính năng thông minh, máy tính fx 570VN Plus đang được đông đảo người tiêu dùng lựa chọn. ', 5, 5, 35),
(27, 'Máy tính bỏ túi cho học sinh cấp 2 Casio FX-570ES Plus', 'https://magiamgiaxanh.com/wp-content/uploads/2024/06/may-tinh-bo-tui-casio-fx-570es-plus.png', '188.366', 'Máy tính Casio FX 570ES Plus là dòng máy tính mới nhất thay thế cho phiên bản 570ES Plus cũ. Đây là dòng máy tính Casio được thay thế phiên bản cũ với bộ vỏ mới hoàn toàn, sử dụng loại nhựa mới tiên tiến hơn nên vỏ máy bền hơn rất nhiều lần phiên bản trước đó. Chức năng máy hoàn toàn ko thay đổi và thích hợp dùng cho học sinh cấp 2.\r\n\r\n', 5, 5, 12),
(28, 'Máy tính Vinacal 570ES Plus II', 'http://magiamgiaxanh.com/wp-content/uploads/2024/06/may-tinh-vinacal-570es-plus-ii.png', '366.666', 'Máy tính Vinacal 570ES Plus II được sản xuất tại Thái Lan và Trung Quốc theo tiêu chuẩn ISO, đáp ứng được các tiêu chuẩn giám định. Không chỉ có công dụng chính dùng để tính toán các môn học tự nhiên như: Toán, lý, hóa, sinh các cấp học 2, 3, cao đẳng, đại học mà trên máy tính Vinacal 570ES PLUS II còn sở hữu nhiều tính năng vượt trội.\r\n\r\nMáy sở hữu kiểu dáng trang nhã với 4 màu sắc trẻ trung gồm: Xám trắng, hồng nhạt, xanh lá, xanh dương.\r\n\r\n', 5, 5, 23),
(29, 'Máy tính Casio FX-570MS', 'https://magiamgiaxanh.com/wp-content/uploads/2024/06/may-tinh-casio-fx-570ms.png', '366.666', 'Máy tính học sinh Casio FX 570MS là sản phẩm thích hợp cho nhu cầu học tập và làm việc trong thời hiện đại. Là một sự lựa chọn thông minh dành cho những ai có nhu cầu tính toán mở rộng bên cạnh những công thức tính cơ bản, giúp mọi công việc tính toán trở nên nhanh chóng và chính xác hơn.\r\nĐây là dòng máy tính rẻ nhất và phổ biến nhất với đầy đủ các chức năng tính toán thông dụng. Tổng thể máy có kiểu dáng chắc chắn, các phím bấm làm bằng nhựa, bo tròn góc, độ nẩy đàn hồi cao, dễ thao tác.', 5, 5, 24),
(30, 'Máy tính Thiên Long FX590VN Flexio', 'https://magiamgiaxanh.com/wp-content/uploads/2024/06/may-tinh-thien-long-fx590vn-flexio.png', '400.000', 'Flexio FX590VN với khả năng hỗ trợ thực hiện các phép tính phức tạp, có màn hình rộng dễ quan sát và được phép mang vào phòng thi, đây sẽ là thiết bị gắn bó cùng bạn trong suốt chặng đường học tập và thi cử quan trọng trong tương lai.', 5, 5, 35),
(33, 'Vở 4 Ô ly 80 trang Hồng Hà School Trạng Nguyên', 'https://bizweb.dktcdn.net/thumb/large/100/334/874/products/vo-4-o-ly-vuong-school-hong-ha-0608-5.jpg?v=1744162995873', '17.000', 'Dòng kẻ: 4 ô ly vuông (2.5 * 2.5) mm\r\nKích thước: 170 * 240 (±2mm)\r\nSố trang: 80 trang không kể bìa\r\nĐịnh lượng: 100g/m²\r\nĐộ trắng: 82%ISO\r\nĐóng gói: 05 quyển/màng co, 100 quyển/thùng', 2, 1, 144),
(34, 'Bút máy nét trơn Lucky Hồng Hà', 'https://bizweb.dktcdn.net/thumb/large/100/334/874/products/z6350754306881-53cfa7fa751e6c62f00896b0326a7a96.jpg?v=1740542529600', '55.000', 'Chất liệu: Nhựa PS\r\nKích thước: 147mm\r\nKiểu ngòi: Ngòi nét trơn 0.5mm, đính hạt iridium\r\nMàu sắc:   03 màu (Xanh đậm, Xanh nhạt, Tím)\r\nBút sử dụng piston, có thể thay ống mực ø 3.4mm\r\nĐóng gói: 01 bộ/hộp giấy, 240 bộ/thùng', 1, 1, 80);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_username` (`username`);

--
-- Chỉ mục cho bảng `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`cid`);

--
-- Chỉ mục cho bảng `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_product_category` (`cid`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `account`
--
ALTER TABLE `account`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `category`
--
ALTER TABLE `category`
  MODIFY `cid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `fk_product_category` FOREIGN KEY (`cid`) REFERENCES `category` (`cid`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
