-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th4 08, 2026 lúc 06:25 AM
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
-- Cấu trúc bảng cho bảng `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `image` varchar(500) NOT NULL,
  `price` varchar(100) NOT NULL,
  `description` varchar(2000) NOT NULL,
  `cid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `product`
--

INSERT INTO `product` (`id`, `name`, `image`, `price`, `description`, `cid`) VALUES
(1, 'Bút Gel Bitex G07 Ngòi 0.5mm - Mực Xanh, Đen', 'https://cdn.hstatic.net/products/1000362139/but-gel-g07-1_7d9bea4a52214756b42d247e67705946_f55ecd14cd4b41d4a3e824b3440e9233_small.jpg', '7.000', 'Bút Gel Bitex G07 Ngòi 0.5mm - Mực Xanh, Đen với thiết kế nổi bật, đẹp mắt, mang lại trải nghiệm viết mượt mà và giảm mỏi tay khi viết nhiều. Dành cho học sinh, sinh viên và người làm văn phòng.\r\n- Hộp: 24 bút, mực xanh, đen\r\n\r\nThiết kế:\r\n\r\n- Kiểu dáng hiện đại: Với kiểu dáng hiện đại, bút gel G07 Ngòi thu hút mọi ánh nhìn và làm tăng sự chuyên nghiệp của bạn.\r\n\r\n- Chất liệu thép không rỉ: Bút được làm từ chất liệu nhẹ, mang lại cảm giác thoải mái khi cầm.\r\n\r\n \r\n\r\nTính năng nổi bật:\r\n\r\n- Ngòi 0.5mm: Ngòi nhỏ 0.5mm tạo nên đường viết chính xác và mảnh mai\r\n\r\n- Mực gel siêu tốt: Mực gel chất lượng cao giúp đảm bảo viết đều và mượt mà mà không gây lem hoặc nhòe.\r\n\r\n- Viết trơn tru: Bút gel G07 được thiết kế để viết trơn tru trên mọi loại giấy, tạo nên trải nghiệm viết đẳng cấp.\r\n\r\n- Grip giảm mỏi tay: Grip tay nắm làm thoải mái khi sử dụng trong thời gian dài.\r\n\r\n- Chống rò rỉ mực: Thiết kế chống rò rỉ mực giữ cho bút và tay bạn luôn sạch sẽ và gọn gàng\r\n\r\n- An toàn, không độc hại, đạt tiêu chuẩn châu Âu EN71-3', 1),
(2, 'Vở kẻ ngang Campus Japan Pattern 72 trang', 'https://product.hstatic.net/1000362139/product/vo_japan1_496b621b82e14feaac6a425f4858af19_small.png', '8.900', 'Vở kẻ ngang Campus Japan Pattern 72 trang với Bìa vở trẻ trung, bắt mắt và là thiết kế độc quyền của Campus\r\nTHÔNG TIN CHI TIẾT SẢN PHẨM:\r\n- Dòng kẻ: kẻ ngang có lề\r\n- Kích thước: 179x252mm\r\n- Định lượng: 58-65 g/m2\r\n- Số trang: 72 trang', 2),
(3, 'Máy tính Casio FX-580VN X-BL màu đen (lưng trắng)', 'https://cdn.hstatic.net/products/1000362139/casio_fx-580vnx_0_7779a92dcd36483a9f3b9bc9171addb9_af326c6328524a218ae840836578ebe5.png', '678.000', 'Máy tính Casio FX-580VN X thuộc dòng máy tính khoa học ClassWiz của hãng máy tính CASIO. Máy được trang bị màn hình LCD có độ phân giải cao. Casio fx-580VN X là bước tiến đột phá, mang công nghệ đến gần hơn với lớp học. Độ phân giải của màn hình của Casio fx-580VN X được tăng gấp 4 lần, hỗ trợ tăng lượng thông tin hiển thị cũng như cải thiện tính tiện dụng của sản phẩm. Đây là chiếc máy tính khoa học có hiệu suất cao, tốc độ tính toán nhanh; phù hợp với nhiều cấp học từ học sinh, sinh viên. \r\n\r\nSố tính năng: 521\r\n\r\nĐộ phân giải của màn hình của máy tính Casio FX-580VNX được tăng gấp 4 lần, hỗ trợ tăng lượng thông tin hiển thị cũng như cải thiện tính tiện dụng của sản phẩm\r\n\r\nTính năng đặc biệt: Kiểm tra số nguyên tố có 4 chữ số, Lưu phần thương và phần dư trong phép chia, Tính năng kiểm tra đúng/sai, Thông báo vô nghiệm khi giải phương trình bậc hai, Cực trị của hàm số bậc ba, Giải hệ phương trình 4 ẩn, Giải phương trình bậc 4, Giải bất phương trình bậc 4, Tốc độ xử lí vượt trội.... \r\n\r\nSử dụng pin: AAA\r\n\r\nĐược phép mang vào phòng thi\r\n\r\nChính sách bảo hành 7 năm 1 đổi 1 trong năm đầu lỗi do nhà sản xuất.\r\n\r\nXuất xứ: Thái Lan', 5),
(4, 'Khay cắm bút Deli Z601 Sơn Tùng M-TP - Kích thước 80x100mm', 'https://cdn.hstatic.net/products/1000362139/9_6105845f5fb1421f84ac181cff118f66_small.png', '39.000', 'Thiết kế hình trụ, chia tầng độc đáo. Với thiết kế 2 ngăn cắm bút và 3 ngăn kéo nhỏ có thể giúp bạn sắp xếp được nhiều bút và vật dụng hơn và phù hợp bài trí lên mọi không gian của bạn.\r\n\r\nGiúp sắp xếp bút, kéo, thước gọn gàng trên bàn học hoặc bàn làm việc.\r\n\r\nNhựa dày dặn, bền, dễ vệ sinh.\r\n\r\nMàu pastel trẻ trung, phù hợp học sinh – sinh viên – văn phòng.\r\n\r\nĐóng hộp đẹp, có thể dùng làm quà tặng nhỏ.', 3),
(5, 'Cặp trình ký GuangBo A6381 - Khoá dọc, chống xước, nhiều màu lựa chọn', 'https://product.hstatic.net/1000362139/product/cap_trinh_ky_doc_a6381_40031fa1b3a74c4cb42c8e4ab36dee51_small.jpg', '56.000', 'Cặp trình ký GuangBo A6381 - Khoá dọc là sản phẩm cần thiết dành cho giới học sinh, sinh viên và nhân viên văn phòng. Cặp file được làm từ nhựa PP có độ bền cao, an toàn cho sức khỏe người sử dụng. Khóa chắc chắn, chống xước và chống nước, dễ dàng đóng mở, giúp bạn bảo quản hồ sơ, giấy tờ và tài liệu tiện lợi.\r\n\r\nSản phẩm có kích cỡ 238 x 315 mm, thích hợp để đựng tài liệu khổ giấy A4 - khổ giấy phổ biến của đa số các loại giấy tờ hiện nay. Bìa trình ký A4 GuangBo có màu sắc trẻ trung, nổi bật. Sản phẩm giúp bạn đựng hồ sơ, giấy tờ không bị nhăn, nhàu hay thất lạc, tạo không gian và tác phong làm việc chuyên nghiệp, ngăn nắp, gọn gàng.', 4);

--
-- Chỉ mục cho các bảng đã đổ
--

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
-- AUTO_INCREMENT cho bảng `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

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
