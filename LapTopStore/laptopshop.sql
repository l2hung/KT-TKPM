CREATE DATABASE  IF NOT EXISTS `laptop_store` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `laptop_store`;


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `chi_muc_gio_hang`
--

DROP TABLE IF EXISTS `chi_muc_gio_hang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chi_muc_gio_hang` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `so_luong` int(11) NOT NULL,
  `ma_gio_hang` bigint(20) DEFAULT NULL,
  `ma_san_pham` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK49lmmclnjgb7eck20lwhv0cks` (`ma_gio_hang`),
  KEY `FKkd69a7wiulr4xgohxl0rlhth4` (`ma_san_pham`),
  CONSTRAINT `FK49lmmclnjgb7eck20lwhv0cks` FOREIGN KEY (`ma_gio_hang`) REFERENCES `gio_hang` (`id`),
  CONSTRAINT `FKkd69a7wiulr4xgohxl0rlhth4` FOREIGN KEY (`ma_san_pham`) REFERENCES `san_pham` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

-- chi_muc_gio_hang
-- Dumping data for table `chi_muc_gio_hang`
--

LOCK TABLES `chi_muc_gio_hang` WRITE;
/*!40000 ALTER TABLE `chi_muc_gio_hang` DISABLE KEYS */;
INSERT INTO `chi_muc_gio_hang` VALUES (10,7,1,64),(11,1,1,54),(12,1,1,60),(13,2,1,56),(14,1,1,62),(15,1,2,88),(16,1,2,85);
/*!40000 ALTER TABLE `chi_muc_gio_hang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chi_tiet_don_hang`
--

DROP TABLE IF EXISTS `chi_tiet_don_hang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chi_tiet_don_hang` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `don_gia` bigint(20) NOT NULL,
  `so_luong` int(11) ,
  `ma_don_hang` bigint(20) DEFAULT NULL,
  `ma_san_pham` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK9wl3houbukbxpixsut6uvojhy` (`ma_don_hang`),
  KEY `FK3ry84nmdxgoarx53qjxd671tk` (`ma_san_pham`),
  CONSTRAINT `FK3ry84nmdxgoarx53qjxd671tk` FOREIGN KEY (`ma_san_pham`) REFERENCES `san_pham` (`id`),
  CONSTRAINT `FK9wl3houbukbxpixsut6uvojhy` FOREIGN KEY (`ma_don_hang`) REFERENCES `don_hang` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chi_tiet_don_hang`
--

LOCK TABLES `chi_tiet_don_hang` WRITE;
/*!40000 ALTER TABLE `chi_tiet_don_hang` DISABLE KEYS */;
INSERT INTO `chi_tiet_don_hang` VALUES (1,13980000,2,32,62),(2,25990000,1,32,57),(3,22490000,1,32,54);
/*!40000 ALTER TABLE `chi_tiet_don_hang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `danh_muc`
--

DROP TABLE IF EXISTS `danh_muc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `danh_muc` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ten_danh_muc` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `danh_muc`
--

LOCK TABLES `danh_muc` WRITE;
/*!40000 ALTER TABLE `danh_muc` DISABLE KEYS */;
INSERT INTO `danh_muc` VALUES (1,'Laptop');
/*!40000 ALTER TABLE `danh_muc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `don_hang`
--

DROP TABLE IF EXISTS `don_hang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `don_hang` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `dia_chi_nhan` varchar(255) DEFAULT NULL,
  `ghi_chu` varchar(255) DEFAULT NULL,
  `ho_ten_nguoi_nhan` varchar(255) DEFAULT NULL,
  `ngay_dat_hang` datetime DEFAULT NULL,
  `ngay_giao_hang` datetime DEFAULT NULL,
  `ngay_nhan_hang` datetime DEFAULT NULL,
  `sdt_nhan_hang` varchar(255) DEFAULT NULL,
  `trang_thai_don_hang` varchar(255) DEFAULT NULL,
  `ma_nguoi_dat` bigint(20) DEFAULT NULL,
  `ma_shipper` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKnwjiboxao1uvw1siemkvs1jb9` (`ma_nguoi_dat`),
  KEY `FKgndcrlvetoudr3jaif9b7ay37` (`ma_shipper`),
  CONSTRAINT `FKgndcrlvetoudr3jaif9b7ay37` FOREIGN KEY (`ma_shipper`) REFERENCES `nguoi_dung` (`id`),
  CONSTRAINT `FKnwjiboxao1uvw1siemkvs1jb9` FOREIGN KEY (`ma_nguoi_dat`) REFERENCES `nguoi_dung` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `don_hang`
--

LOCK TABLES `don_hang` WRITE;
/*!40000 ALTER TABLE `don_hang` DISABLE KEYS */;
INSERT INTO `don_hang` VALUES (31,'bd','asdf','aaa','2018-12-01 14:38:26',NULL,NULL,'dsf','Đang chờ duyệt',NULL,NULL),(32,'fadf','asdf','aaa','2018-12-05 21:58:24',NULL,NULL,'13','created',2,NULL);
/*!40000 ALTER TABLE `don_hang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gio_hang`
--

DROP TABLE IF EXISTS `gio_hang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gio_hang` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tong_tien` varchar(255) DEFAULT NULL,
  `ma_nguoi_dung` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKitverect56puwr47y7tyvy6er` (`ma_nguoi_dung`),
  CONSTRAINT `FKitverect56puwr47y7tyvy6er` FOREIGN KEY (`ma_nguoi_dung`) REFERENCES `nguoi_dung` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gio_hang`
--

LOCK TABLES `gio_hang` WRITE;
/*!40000 ALTER TABLE `gio_hang` DISABLE KEYS */;
INSERT INTO `gio_hang` VALUES (1,NULL,2),(2,NULL,1);
/*!40000 ALTER TABLE `gio_hang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hang_san_xuat`
--

DROP TABLE IF EXISTS `hang_san_xuat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hang_san_xuat` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ten_hang_san_xuat` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hang_san_xuat`
--

LOCK TABLES `hang_san_xuat` WRITE;
/*!40000 ALTER TABLE `hang_san_xuat` DISABLE KEYS */;
INSERT INTO `hang_san_xuat` VALUES (2,'Apple'),(3,'Asus'),(4,'Acer'),(5,'Dell'),(6,'HP'),(7,'Lenovo'),(8,'MSI'),(9,'Masstel'),(10,'Haier');
/*!40000 ALTER TABLE `hang_san_xuat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lien_he`
--

DROP TABLE IF EXISTS `lien_he`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lien_he` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `email_lien_he` varchar(255) DEFAULT NULL,
  `ngay_lien_he` datetime DEFAULT NULL,
  `ngay_tra_loi` datetime DEFAULT NULL,
  `noi_dung_lien_he` varchar(255) DEFAULT NULL,
  `noi_dung_tra_loi` varchar(255) DEFAULT NULL,
  `trang_thai` varchar(255) DEFAULT NULL,
  `ma_nguoi_tra_loi` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK6jm47uh7f94pc3wix0duvedde` (`ma_nguoi_tra_loi`),
  CONSTRAINT `FK6jm47uh7f94pc3wix0duvedde` FOREIGN KEY (`ma_nguoi_tra_loi`) REFERENCES `nguoi_dung` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lien_he`
-- don_hang

LOCK TABLES `lien_he` WRITE;
/*!40000 ALTER TABLE `lien_he` DISABLE KEYS */;
/*!40000 ALTER TABLE `lien_he` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nguoi_dung`
--

DROP TABLE IF EXISTS `nguoi_dung`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nguoi_dung` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `dia_chi` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `ho_ten` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `so_dien_thoai` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nguoi_dung`
--

LOCK TABLES `nguoi_dung` WRITE;
/*!40000 ALTER TABLE `nguoi_dung` DISABLE KEYS */;
INSERT INTO `nguoi_dung` VALUES (1,NULL,'admin@gmail.com','Lê Huy Hùng','$2a$10$/VFMNUPBKNVRMjxPFCYKZ.lKahoLQda0EaAxdqoun1w3DqwNLa2me','123456789'),(2,NULL,'member@gmail.com',NULL,'$2a$10$j7Upgupou72GBmukz0G6pOATk3wlCAgaoFCEqAhSvLToD/V/1wlpu',NULL),(3,NULL,'shipper@gmail.com',NULL,'$2a$10$u2B29HDxuWVYY3fUJ8R2qunNzXngfxij5GpvlFAEtIz3JpK/WFXF2',NULL);
/*!40000 ALTER TABLE `nguoi_dung` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nguoidung_vaitro`
--

DROP TABLE IF EXISTS `nguoidung_vaitro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nguoidung_vaitro` (
  `ma_nguoi_dung` bigint(20) NOT NULL,
  `ma_vai_tro` bigint(20) NOT NULL,
  PRIMARY KEY (`ma_nguoi_dung`,`ma_vai_tro`),
  KEY `FKig6jxd861mqv02a8pn68r43fr` (`ma_vai_tro`),
  CONSTRAINT `FKig6jxd861mqv02a8pn68r43fr` FOREIGN KEY (`ma_vai_tro`) REFERENCES `vai_tro` (`id`),
  CONSTRAINT `FKocavcnspu1wcvp2w0s4usfgbf` FOREIGN KEY (`ma_nguoi_dung`) REFERENCES `nguoi_dung` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nguoidung_vaitro`
--

LOCK TABLES `nguoidung_vaitro` WRITE;
/*!40000 ALTER TABLE `nguoidung_vaitro` DISABLE KEYS */;
INSERT INTO `nguoidung_vaitro` VALUES (1,1),(1,2),(2,2),(4,2),(3,3);
/*!40000 ALTER TABLE `nguoidung_vaitro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `san_pham`
--

DROP TABLE IF EXISTS `san_pham`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `san_pham` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cpu` varchar(255) DEFAULT NULL,
  `don_gia` bigint(20) NOT NULL,
  `don_vi_ban` int(11) NOT NULL,
  `don_vi_kho` int(11) NOT NULL,
  `dung_luong_pin` varchar(255) DEFAULT NULL,
  `he_dieu_hanh` varchar(255) DEFAULT NULL,
  `man_hinh` varchar(255) DEFAULT NULL,
  `ram` varchar(255) DEFAULT NULL,
  `ten_san_pham` varchar(255) DEFAULT NULL,
  `thiet_ke` varchar(255) DEFAULT NULL,
  `thong_tin_bao_hanh` varchar(255) DEFAULT NULL,
  `thong_tin_chung` varchar(255) DEFAULT NULL,
  `ma_danh_muc` bigint(20) DEFAULT NULL,
  `ma_hang_sx` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKqss6n6gtx6lhb7flcka9un18t` (`ma_danh_muc`),
  KEY `FKchvjvgjnq8lbt9mjtyfn5pksq` (`ma_hang_sx`),
  CONSTRAINT `FKchvjvgjnq8lbt9mjtyfn5pksq` FOREIGN KEY (`ma_hang_sx`) REFERENCES `hang_san_xuat` (`id`),
  CONSTRAINT `FKqss6n6gtx6lhb7flcka9un18t` FOREIGN KEY (`ma_danh_muc`) REFERENCES `danh_muc` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=144 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `san_pham`
--

LOCK TABLES `san_pham` WRITE;
/*!40000 ALTER TABLE `san_pham` DISABLE KEYS */;
INSERT INTO `san_pham` VALUES (3,'Intel, Core i5, 1.8 Ghz',23990000,0,100,'5800mAh',' Mac Os',' 13.3 inch LED-backlit','8 GB, LPDDR3, 1600 Mhz','Macbook Air 13 128GB MQD32SA/A (2017)','thiết kế không thay đổi, vỏ nhôm sang trọng, siêu mỏng và siêu nhẹ','12 tháng','hiệu năng được nâng cấp, thời lượng pin cực lâu, phù hợp cho nhu cầu làm việc văn phòng nhẹ nhàng, không cần quá chú trọng vào hiển thị của màn hình',1,2),(4,' Intel, Core i5, 1.8 Ghz',28990000,0,100,'6000mAh','Mac Os','13.3 inch LED-backlit',' 8 GB, LPDDR3, 1600 Mhz','Macbook Air 13 256GB MQD42SA/A (2017)','thiết kế không thay đổi, vỏ nhôm sang trọng, siêu mỏng và siêu nhẹ','12 tháng','hiệu năng được nâng cấp, thời lượng pin cực lâu, phù hợp cho nhu cầu làm việc văn phòng nhẹ nhàng, không cần quá chú trọng vào hiển thị của màn hình',1,2),(5,'Intel, Core M3, 1.2 GHz',33990000,0,150,'6000mAh','Mac Os',' 12 inch LED-backlit','8 GB, LPDDR3, 1866 MHz','Macbook 12 256GB (2017)','thiết kế không có thay đổi so với phiên bản 2016 nhưng Apple đã nâng cấp thêm bộ nhớ và giới thiệu bộ vi xử lý Intel thế hệ thứ 7','12 tháng','Thiết kế hoàn mỹ tinh tế và sang trọng',1,2),(6,' Intel, Core i5, 2.3 GHz',33990000,0,200,'6000mAh','Mac Os',' 13.3 inch LED-backlit',' 8 GB, LPDDR3, 2133MHz','Macbook Pro 13 inch 128GB (2017)','thiết kế không thay đổi, vỏ nhôm sang trọng, siêu mỏng và siêu nhẹ','12 tháng','hiệu năng được nâng cấp, thời lượng pin cực lâu, phù hợp cho nhu cầu làm việc văn phòng nhẹ nhàng, không cần quá chú trọng vào hiển thị của màn hình',1,2),(7,'Intel, Core i5, 2.3GHz',44990000,0,100,'7000mAh','Mac Os','13.3 inch, Retina (2560 x 1600 pixels)','8 GB, LPDDR3, 2133 MHz','Macbook Pro 13 Touch Bar 256 GB (2018)','thiết kế không thay đổi, vỏ nhôm sang trọng, siêu mỏng và siêu nhẹ','12 tháng','hiệu năng được nâng cấp, thời lượng pin cực lâu, phù hợp cho nhu cầu làm việc văn phòng nhẹ nhàng, không cần quá chú trọng vào hiển thị của màn hình',1,2),(8,'Intel, Core i5, 2.3GHz',49990000,0,150,'7000mAh','Mac Os','13.3 inch, Retina (2560 x 1600 pixels)','8 GB, LPDDR3, 2133 MHz','Macbook Pro 13 Touch Bar 512 GB (2018)','thiết kế không thay đổi, vỏ nhôm sang trọng, siêu mỏng và siêu nhẹ','12 tháng','hiệu năng được nâng cấp, thời lượng pin cực lâu, phù hợp cho nhu cầu làm việc văn phòng nhẹ nhàng, không cần quá chú trọng vào hiển thị của màn hình',1,2),(9,'Intel, Core i7, 2.2GHz',59990000,0,200,'7000mAh','Mac Os','15.4 inch, Retina (2880 x 1800 pix','16GB, LPDDR4, 2400MHz','Macbook Pro 15 Touch Bar 256 GB (2018)','thiết kế không thay đổi, vỏ nhôm sang trọng, siêu mỏng và siêu nhẹ','12 tháng','hiệu năng được nâng cấp, thời lượng pin cực lâu, phù hợp cho nhu cầu làm việc văn phòng nhẹ nhàng, không cần quá chú trọng vào hiển thị của màn hình',1,2),(10,'Intel, Core i7, 2.2GHz',69990000,0,120,'7000mAh','Mac Os','15.4 inch, Retina (2880 x 1800 pi','16GB, LPDDR4, 2400MHz','Macbook Pro 15 Touch Bar 512 GB (2018)','thiết kế không thay đổi, vỏ nhôm sang trọng, siêu mỏng và siêu nhẹ','12 tháng','hiệu năng được nâng cấp, thời lượng pin cực lâu, phù hợp cho nhu cầu làm việc văn phòng nhẹ nhàng, không cần quá chú trọng vào hiển thị của màn hình',1,2),(11,' Intel Celeron N3350',5490000,0,100,'7000','Windows 10','14 inch HD LED Glare',' 4 GB DDR3','Asus E402NA-GA034T','thiết kế với lớp vỏ bằng nhựa giúp cho máy trở nên nhẹ nhàng hơn','12 tháng','Bàn phím chiclet cùng Touchpad thông minh',1,3),(12,'Intel Celeron N3060',5490000,0,200,'7000','Windows 10','14.0 inch HD Ultra Slim 200nits','2 GB DDR3L 1600 MHz','Asus Vivobook E406SA-BV001T','thiết kế với lớp vỏ bằng nhựa giúp cho máy trở nên nhẹ nhàng hơn','12 tháng','Bàn phím chiclet cùng Touchpad thông minh',1,3),(13,'Intel Celeron N3060',5490000,0,200,'7000','Windows 10','14.0 inch HD Ultra Slim 200nits','2 GB DDR3 1600 MHz','Asus Vivobook E406SA-BV043T','thiết kế với lớp vỏ bằng nhựa giúp cho máy trở nên nhẹ nhàng hơn','12 tháng','gọn,nhẹ, độ bền cao',1,3),(14,'Intel Celeron N4000',6690000,0,120,'7000',' Windows 10','15.6 inch Anti-Glare LED Backlit',' 4 GB DDR4 2400 MHz','Asus Vivobook X507MA-BR208T/Celeron N4000','thiết kế với lớp vỏ bằng nhựa giúp cho máy trở nên nhẹ nhàng hơn','12 tháng','Thiết kế hoàn mỹ tinh tế và sang trọng',1,3),(15,'Intel Pentium N4200',7290000,0,110,'6000','Windows 10','15.6 inch HD LED',' 4 GB, DDR3L, 1600 MHz','Asus X541NA-GO012T/Pentium N4200','thiết kế với lớp vỏ bằng nhựa giúp cho máy trở nên nhẹ nhàng hơn','12 tháng','Thiết kế hoàn mỹ tinh tế và sang trọng',1,3),(16,'Intel, Core i3-6100U',8990000,0,130,'7000','Windows 10 Home','15.6 inch LED Backlight','4 GB DDR4 2133 MHz','Asus X541UA-XX272T/Core i3 6100U','thiết kế với lớp vỏ bằng nhựa giúp cho máy trở nên nhẹ nhàng hơn','12 tháng','Thiết kế hoàn mỹ tinh tế và sang trọng',1,3),(17,' Intel, Core i3, 2.0 GHz',8990000,0,200,'7000',' Free DOS','15.6 inchHD LED backlight','4 GB, DDR4, 2400MHz','Asus X541UA-GO1345','thiết kế với lớp vỏ bằng nhựa giúp cho máy trở nên nhẹ nhàng hơn','12 tháng','tinh tế đến từng chi tiết',1,3),(18,' Intel, Core i3, 2.0 GHz',10490000,0,300,'7000','Window 10',' 15.6 inchLED Backlight',' 4 GB, DDR4, 2400MHz','Asus X541UJ-DM544T/Core i3-6006U','thiết kế không thay đổi, vỏ nhôm sang trọng, siêu mỏng và siêu nhẹ','12 tháng','Thiết kế hoàn mỹ tinh tế và sang trọng',1,3),(19,' Intel, Celeron, 1.10 GHz',5990000,0,300,'7000',' Linux','5.6 inchAcer CineCrystal LED',' 4 GB DDR3L 1333 MHz','Acer AS A315-31-C8GB','thiết kế không thay đổi, vỏ nhôm sang trọng, siêu mỏng và siêu nhẹ','12 tháng','Thiết kế hoàn mỹ tinh tế và sang trọng',1,4),(20,' Intel Celeron N4000',6090000,0,100,'8000','Linux',' 15.6 inchs HD LED Backlight','4 GB DDR4 2133 MHz','Acer A315-32-C9A4 ','thiết kế không thay đổi, vỏ nhôm sang trọng, siêu mỏng và siêu nhẹ','12 tháng','Thiết kế hoàn mỹ tinh tế và sang trọng',1,4),(21,' Intel Core i3-7020U',8990000,0,100,'8000',' Linux','14.0 inchs HD LED','4 GB DDR4 2400 MHz','Acer E5-476-33BQ','thiết kế không thay đổi, vỏ nhôm sang trọng, siêu mỏng và siêu nhẹ','12 tháng','Thiết kế hoàn mỹ tinh tế và sang trọng',1,4),(22,' Intel Core i3-6006U',8990000,0,50,'5000','Linux','15.6 inch HD',' 4 GB DDR4 2133MHz','Acer A315-51-3932/Core i3-6006U','thiết kế không thay đổi, vỏ nhôm sang trọng, siêu mỏng và siêu nhẹ','12 tháng','Thiết kế hoàn mỹ tinh tế và sang trọng',1,4),(23,'Intel Core i3-7020U',9390000,0,300,'6000','Linux','15.6 inchs HD LED Backlight','4 GB DDR4 2133 MHz','Acer AS A315-51-325E','thiết kế không thay đổi, vỏ nhôm sang trọng, siêu mỏng và siêu nhẹ','12 tháng','Thiết kế hoàn mỹ tinh tế và sang trọng',1,4),(24,' Intel Core i3',9990000,0,130,'5000','Linux','15.6 inch  HD',' 4 GB DDR4 2133 MHz','Acer A315-51-364W','thiết kế không thay đổi, vỏ nhôm sang trọng, siêu mỏng và siêu nhẹ','12 tháng','Thiết kế hoàn mỹ tinh tế và sang trọng',1,4),(25,' Intel, Core i3, 2.4 Ghz',10690000,0,120,'5000','Free DOS',' 15.6 inchFull HD',' 4 GB, DDR4, 2133 MHz','Acer Aspire E5-575G-39QW','thiết kế không thay đổi, vỏ nhôm sang trọng, siêu mỏng và siêu nhẹ','12 tháng','Thiết kế hoàn mỹ tinh tế và sang trọng',1,4),(26,' Intel Core i5-8250U',16990000,0,130,'6000',' Windows 10 Home','14.0 inchs FHD IPS LCD',' 4 GB DDR4 2133 MHz','Acer Swift SF314-52-55UF','thiết kế không thay đổi, vỏ nhôm sang trọng, siêu mỏng và siêu nhẹ','12 tháng','Thiết kế hoàn mỹ tinh tế và sang trọng',1,4),(27,' Intel Pentium N3710',6990000,0,110,'5000',' Ubuntu','15.6 inchs HD Truelife',' 4 GB DDR3 1600 MHz','Dell Inspiron N3552','Thiết kế gọn gàng để di chuyển','12 tháng','Thiết kế hoàn mỹ tinh tế và sang trọng',1,5),(28,' Intel Pentium N3710',9990000,0,100,'5000','Ubuntu','15.6 inchs HD Truelife',' 4 GB DDR3 1600 MHz','Dell Inspiron N3567C','Thiết kế gọn gàng để di chuyển','12 tháng','Thiết kế hoàn mỹ tinh tế và sang trọng',1,5),(29,'Intel, Core i3, 2.0 GHz',9990000,0,100,'6000','Ubuntu 16.04','14 inchHD Anti-Glare LED','4 GB, DDR4, 2400MHz','Dell Inspiron N3467','Thiết kế gọn gàng để di chuyển','12 tháng','Thiết kế hoàn mỹ tinh tế và sang trọng',1,5),(30,' Intel Core i3-6006U',10890000,0,120,'7000','Linux','15.6 inchs',' 4 GB DDR4 2400 MHz','Dell Vostro 3568','Thiết kế gọn gàng để di chuyển','12 tháng','Thiết kế hoàn mỹ tinh tế và sang trọng',1,5),(31,' Intel, Core i3, 2.0 GHz',11190000,0,90,'6000',' Free DOS',' 15.6 inchHD LED',' 4 GB, DDR3L, 1600 Mhz','Dell Ins N3567','Thiết kế gọn gàng để di chuyển','12 tháng','Thiết kế hoàn mỹ tinh tế và sang trọng',1,5),(32,' Intel Core i3-7020U',11590000,0,80,'7000',' Ubuntu','15.6 inch HD Anti Glare LED','4 GB DDR4 2400 MHz','Dell Inspiron N3576','Thiết kế gọn gàng để di chuyển','12 tháng','Thiết kế hoàn mỹ tinh tế và sang trọng',1,5),(33,'Intel Core i3-7020U',11890000,0,110,'8000',' Windows 10 Home','15.6 inches Anti-Glare LED',' 4 GB DDR4 2400 MHz','Dell Vostro 3568','Thiết kế gọn gàng để di chuyển','12 tháng','Thiết kế hoàn mỹ tinh tế và sang trọng',1,5),(34,' Intel, Core i3, 2.40 GHz',12490000,0,100,'8000','Free DOS','14 inchHD Anti-Glare LED','4 GB, DDR4, 2133 MHz','Dell Vostro V5468/i3','Thiết kế gọn gàng để di chuyển','12 tháng','Thiết kế hoàn mỹ tinh tế và sang trọng',1,5),(35,' Intel Celeron',5990000,0,100,'5000','Linux',' 15.6 inchs',' 4 GB DDR3L 1600 MHz','HP 15-bs644TU/Celeron-N3060','Thiết kế gọn gàng để di chuyển','12 tháng','Thiết kế hoàn mỹ tinh tế và sang trọng',1,6),(36,' Intel Celeron N4000',6190000,0,70,'7000',' Windows 10 Home',' 15.6 inchs HD HD SVA ',' 4 GB DDR4 2400 MHz','HP 15-da0107TU/Celeron','Thiết kế gọn gàng để di chuyển','12 tháng','Thiết kế hoàn mỹ tinh tế và sang trọng',1,6),(37,' Intel Penitum N3710',6990000,0,120,'8000','Windows 10','15.6 inch',' 4GB DDR4','HP 15-bs648TU','Thiết kế gọn gàng để di chuyển','12 tháng','Thiết kế hoàn mỹ tinh tế và sang trọng',1,6),(38,' Intel, Core i3, 2.0 GHz',8990000,0,80,'8000',' Free Dos','15.6 inch LED-backlit',' 4GB, DDR4, 2133 MHz','HP 15-bs555TU','Thiết kế gọn gàng để di chuyển','12 tháng','Thiết kế hoàn mỹ tinh tế và sang trọng',1,6),(39,' Intel, Core i3, 2.0 GHz',10490000,0,90,'7000',' Free DOS',' 15.6 inchHD SVA BrightView',' 4 GB, DDR4, 2133 MHz','HP 15-bs637TX','Thiết kế gọn gàng để di chuyển','12 tháng','Thiết kế hoàn mỹ tinh tế và sang trọng',1,6),(40,' Intel Core i3-7100U',11490000,0,90,'6000',' Free DOS',' 15.6 inch',' 4GB DDR4','HP Pavilion 15-cc043TU','Thiết kế gọn gàng để di chuyển','12 tháng','Thiết kế hoàn mỹ tinh tế và sang trọng',1,6),(41,' Intel, Core i5, 2.50 GHz',12190000,0,100,'8000','Free DOS','15.6 inchHD SVA BrightView',' 4 GB, DDR4, 2133 MHz','HP 15-bs559TU','Thiết kế gọn gàng để di chuyển','12 tháng','Thiết kế hoàn mỹ tinh tế và sang trọng',1,6),(42,' Intel Core i3-7100U',12990000,0,150,'7000','Windows 10 Home Single',' 11.6 inch HD',' 4 GB DDR4 2133 MHz','HP Pavilion X360 11','Thiết kế gọn gàng để di chuyển','12 tháng','Thiết kế hoàn mỹ tinh tế và sang trọng',1,6),(43,'Intel, Celeron, 1.10 GHz',4990000,0,100,'6000',' Windows 10 EM',' 11.6 inchHD LED',' 2 GB, LPDDR4, 2400MHz','Lenovo Ideapad 120S-11IAP','Thiết kế gọn gàng để di chuyển','6 tháng','Thiết kế hoàn mỹ tinh tế và sang trọng',1,7),(44,' Intel, Pentium, 1.60 GHz',5490000,0,120,'5000',' Free DOS','14 inchHD LED backlight',' 4 GB, DDR3L, 1600 MHz','Lenovo IdeaPad 110','Thiết kế gọn gàng để di chuyển','6 tháng','Thiết kế hoàn mỹ tinh tế và sang trọng',1,7),(45,' Intel, Pentium, 1.10 GHz',7490000,0,80,'7000',' Windows 10',' 11.6 inchHD TN AG TOUCH',' 4 GB, DDR3L, 1600 MHz','Lenovo Yoga 310-11IAP','Thiết kế gọn gàng để di chuyển','6 tháng','Thiết kế hoàn mỹ tinh tế và sang trọng',1,7),(46,'Intel Core i3-6006U',8990000,0,120,'7000','FreeDOS',' 14.0 inchs HD LED',' 4 GB DDR4 2133 MHz','Lenovo Ideapad 320-14ISK ','Thiết kế gọn gàng để di chuyển','12 tháng','Thiết kế hoàn mỹ tinh tế và sang trọng',1,7),(47,'Intel Core i5-8250U',10990000,0,130,'5000',' Windows 10 Home',' 14.0 inchs HD LED','4 GB DDR4 2133 MHz','Lenovo Ideapad 330-14IKBR','Thiết kế gọn gàng để di chuyển','12 tháng','Thiết kế hoàn mỹ tinh tế và sang trọng',1,7),(48,' Intel, Core i5, 2.50 GHz',11290000,0,120,'5000','Linux',' 15.6 inchFull HD',' 4 GB, DDR4, 2133 MHz','Lenovo IdeaPad 310-15IKB','Thiết kế gọn gàng để di chuyển','12 tháng','Thiết kế hoàn mỹ tinh tế và sang trọng',1,7),(49,' Intel Core i5-8250U',13490000,0,130,'6000','Linux',' 14.0 inchs FHD IPS','4 GB DDR4 2400 MHz','Lenovo Ideapad 330S-14IKBR','Thiết kế gọn gàng để di chuyển','12 tháng','Thiết kế hoàn mỹ tinh tế và sang trọng',1,7),(50,' Intel, Core i5, 2.50 GHz',15990000,0,200,'7000','Windows 10 Single',' 15.6 inchAnti-Glare LED',' 4 GB, DDR4, 2133 MHz','Lenovo ThinkPad E570','Thiết kế gọn gàng để di chuyển','12 tháng','Thiết kế hoàn mỹ tinh tế và sang trọng',1,7),(51,' Intel, Core i5, 2.50 GHz',18990000,0,300,'7000',' Free DOS',' 15.6 inchWide-View','4 GB, DDR4, 2133 MHz','MSI GL62M 7RDX – 1036XVN','Sỡ hữu phong cách thiết kế truyền thống của MSI','12 tháng','Lớp vỏ đen nhám được phủ cao su mềm đặc trưng đem đến trải nghiệm cầm nắm tốt hơn. Các thành phần của nắp máy bao gồm vỏ, màn hình và viền màn hình đều được ép chặt để tối ưu trọng lượng chỉ còn 2.2 kg',1,8),(52,' Intel Core i5-8250U',20990000,0,120,'8000','Windows 10 Home','14.0 inchs FHD IPS 72%',' 8 GB DDR4 2666 MHz','MSI PS42 8M-296VN/i5-8250U','Sỡ hữu phong cách thiết kế truyền thống của MSI','12 tháng','Lớp vỏ đen nhám được phủ cao su mềm đặc trưng đem đến trải nghiệm cầm nắm tốt hơn. Các thành phần của nắp máy bao gồm vỏ, màn hình và viền màn hình đều được ép chặt để tối ưu trọng lượng chỉ còn 2.2 kg',1,8),(53,' Intel Core i5-8300H',21490000,0,130,'7000',' Windows 10 Home','15.6 inchs Wideview 94%NTS','8 GB DDR4 2400MHz','MSI GV62 8RC-063VN/i5-8300H','Sỡ hữu phong cách thiết kế truyền thống của MSI','12 tháng','Lớp vỏ đen nhám được phủ cao su mềm đặc trưng đem đến trải nghiệm cầm nắm tốt hơn. Các thành phần của nắp máy bao gồm vỏ, màn hình và viền màn hình đều được ép chặt để tối ưu trọng lượng chỉ còn 2.2 kg',1,8),(54,' Intel Core i5-8300H',22490000,0,140,'7000','Windows 10','15.6 inchs FullHD IPS 45% ',' 8 GB DDR4 2666 MHz','MSI GF63 8RC-203VN/I5-8300H','Sỡ hữu phong cách thiết kế truyền thống của MSI','12 tháng','Lớp vỏ đen nhám được phủ cao su mềm đặc trưng đem đến trải nghiệm cầm nắm tốt hơn. Các thành phần của nắp máy bao gồm vỏ, màn hình và viền màn hình đều được ép chặt để tối ưu trọng lượng chỉ còn 2.2 kg',1,8),(55,' Intel, Core i7, 2.8 GHz',23990000,0,150,'8000','  DOS','  17.3 inch',' 8 GB, DDR4, 2400 MHz','MSI GL72M 7REX - 1427XVN','Sỡ hữu phong cách thiết kế truyền thống của MSI','12 tháng','Lớp vỏ đen nhám được phủ cao su mềm đặc trưng đem đến trải nghiệm cầm nắm tốt hơn. Các thành phần của nắp máy bao gồm vỏ, màn hình và viền màn hình đều được ép chặt để tối ưu trọng lượng chỉ còn 2.2 kg',1,8),(56,' Intel, Core i7, 2.80 GHz',24990000,0,110,'7000',' Free DOS',' 15.6 inchWide-View',' 8 GB, DDR4, 2400MHz','MSI GF62 7RE-1818XVN','Sỡ hữu phong cách thiết kế truyền thống của MSI','12 tháng','Lớp vỏ đen nhám được phủ cao su mềm đặc trưng đem đến trải nghiệm cầm nắm tốt hơn. Các thành phần của nắp máy bao gồm vỏ, màn hình và viền màn hình đều được ép chặt để tối ưu trọng lượng chỉ còn 2.2 kg',1,8),(57,' Intel Core i7-8750H',25990000,0,110,'7000','Windows 10 Home','15.6 inchs FullHD IPS 45%',' 8 GB DDR4 2666 MHz','MSI GF63 8RD-218VN/i7-8750H','Sỡ hữu phong cách thiết kế truyền thống của MSI','12 tháng','Lớp vỏ đen nhám được phủ cao su mềm đặc trưng đem đến trải nghiệm cầm nắm tốt hơn. Các thành phần của nắp máy bao gồm vỏ, màn hình và viền màn hình đều được ép chặt để tối ưu trọng lượng chỉ còn 2.2 kg',1,8),(58,' Intel, Core i5, 2.50 GH',19990000,0,100,'8000','Free DOS','15.6 inchWide-View',' 8 GB, DDR4, 2133 MHz','MSI GL62M 7RDX-1817XVN','Thiết kế gọn gàng để di chuyển','12 tháng','Lớp vỏ đen nhám được phủ cao su mềm đặc trưng đem đến trải nghiệm cầm nắm tốt hơn. Các thành phần của nắp máy bao gồm vỏ, màn hình và viền màn hình đều được ép chặt để tối ưu trọng lượng chỉ còn 2.2 kg',1,8),(59,'Intel Celeron N3350 1.10 GHz',4990000,0,100,'5000','Windows 10','13.3 inch FullHD IPS','3 GB LPDDR3 1600 MHz','Masstel L133','Thiết kế gọn gàng để di chuyển','6 tháng','thiết kế để giúp bạn làm việc hiệu quả suốt cả ngày dài, kể cả khi bạn đang di chuyển. Máy tính xách tay 13.3 inchs nhỏ gọn và có mức giá hợp lý, trọng lượng chỉ 1.2 Kg và thời lượng pin bền bỉ, phù hợp với những bạn trẻ năng động',1,9),(60,'Intel Celeron N3350 1.10 GHz',5490000,0,100,'5000','Windows 10','13.3 inch FullHD IPS','3 GB LPDDR3 1600 MHz',' Masstel L133/Celeron N3350','Thiết kế gọn gàng để di chuyển','6 tháng','thiết kế để giúp bạn làm việc hiệu quả suốt cả ngày dài, kể cả khi bạn đang di chuyển. Máy tính xách tay 13.3 inchs nhỏ gọn và có mức giá hợp lý, trọng lượng chỉ 1.2 Kg và thời lượng pin bền bỉ, phù hợp với những bạn trẻ năng động',1,9),(61,' Intel Celeron N3350 1.10 GHz',5990000,0,100,'4000','Windows 10',' 13.3 inch FullHD IPS',' 3 GB LPDDR3 1600 MHz','Masstel L133 Celeron N3350','Thiết kế gọn gàng để di chuyển','6 tháng','thiết kế để giúp bạn làm việc hiệu quả suốt cả ngày dài, kể cả khi bạn đang di chuyển. Máy tính xách tay 13.3 inchs nhỏ gọn và có mức giá hợp lý, trọng lượng chỉ 1.2 Kg và thời lượng pin bền bỉ, phù hợp với những bạn trẻ năng động',1,9),(62,'Intel Celeron N4100',6990000,0,50,'4000','Windows 10','13.3 inchs FullHD IPS','4 GB LPDDR4','Masstel L133 Pro/Celeron N4100','Thiết kế siêu mỏng nhẹ','6 tháng','thiết kế để giúp bạn làm việc hiệu quả suốt cả ngày dài, kể cả khi bạn đang di chuyển. Máy tính xách tay 13.3 inchs nhỏ gọn và có mức giá hợp lý, trọng lượng chỉ 1.2 Kg và thời lượng pin bền bỉ, phù hợp với những bạn trẻ năng động',1,9),(63,' Intel Celeron N3350',4499000,0,50,'5000','FreeDOS','13.3 inchs IPS LCD',' 3 GB DDR3L 1600 MHz','Haier S1 HR-13M/Celeron N3350','Thiết kế siêu mỏng nhẹ','6 tháng','Một chiếc laptop đời mới thời trang, siêu mỏng nhẹ phục vụ tối ưu cho công việc nhưng lại trong tầm giá rất rẻ',1,10),(64,' Intel Pentium N4200',7490000,0,60,'4000','FreeDOS','13.3 inchs IPS LCD',' 6 GB DDR3L 1600 MHz','Haier S1 HR-13MZ/Pentium N4200','Thiết kế siêu mỏng nhẹ','6 tháng','Một chiếc laptop đời mới thời trang, siêu mỏng nhẹ phục vụ tối ưu cho công việc nhưng lại trong tầm giá rất rẻ',1,10),(65,NULL,10300999,0,100,NULL,NULL,NULL,NULL,'PC Acer Aspire TC-780 DT.B89SV.012 i5 7400/4G/1TB/DVDRW/WL/K+M/Dos',NULL,'12 tháng','-	Bộ vi xử lý Core i5-7400 (3.00GHz,6MB) \r\n-	RAM 4 GB DDR4 2133MHz UDIMM \r\n-	Ổ cứng 1TB 3.5 inch 7200rpm \r\n-	VGA Intel HD Graphics 530',2,4),(66,NULL,9800000,0,80,NULL,NULL,NULL,NULL,'PC Acer Aspire XC-885 DT.BAQSV.001 i3 8100/4G/1TB/DVDRW/WL/K+M/Dos',NULL,'6 tháng','-	Bộ vi xử lý : Intel Core i5-7400 (3.00 GHz/6MB) \r\n-	RAM : 4 GB DDR4 2400 MHz \r\n-	Ổ cứng : 1TB SATA 3.5\" 7200RPM \r\n-	VGA : Nvidia GT720 2GB Graphics',2,4);

/*!40000 ALTER TABLE `san_pham` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vai_tro`
--

DROP TABLE IF EXISTS `vai_tro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vai_tro` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ten_vai_tro` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vai_tro`
--

LOCK TABLES `vai_tro` WRITE;
/*!40000 ALTER TABLE `vai_tro` DISABLE KEYS */;
INSERT INTO `vai_tro` VALUES (1,'ROLE_ADMIN'),(2,'ROLE_MEMBER'),(3,'ROLE_SHIPPER');
/*!40000 ALTER TABLE `vai_tro` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;


