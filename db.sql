-- MySQL dump 10.13  Distrib 5.7.17, for macos10.12 (x86_64)
--
-- Host: 127.0.0.1    Database: buyer
-- ------------------------------------------------------
-- Server version	5.7.22

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
-- Table structure for table `buyer_address`
--

DROP TABLE IF EXISTS `buyer_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `buyer_address` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `buyer_id` varchar(32) NOT NULL,
  `rec_name` varchar(32) NOT NULL,
  `street_name` varchar(32) NOT NULL,
  `post_code` varchar(20) NOT NULL,
  `tel` varchar(20) NOT NULL,
  `is_default` tinyint(1) NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='卖家信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `buyer_address`
--

LOCK TABLES `buyer_address` WRITE;
/*!40000 ALTER TABLE `buyer_address` DISABLE KEYS */;
INSERT INTO `buyer_address` VALUES (4,'id_even','耿耿','北方工业大学','100041','13070169390',1,'2018-05-23 17:42:48','2018-05-24 02:52:40'),(5,'id_even','even','NCUT','100041','13070169390',0,'2018-05-26 08:03:43','2018-05-26 08:03:46'),(6,'id_even','even','地址1','100044','18818283241',0,'2018-05-26 13:44:46','2018-05-26 13:44:46'),(7,'id_even','even','地址2','100046','18373783833',0,'2018-05-26 13:45:11','2018-05-26 13:45:11'),(8,'id_even','even','daa','123133','12313123123',0,'2018-05-26 13:46:01','2018-05-26 13:46:01'),(9,'qwe','qwe','qwe','qwe','12313123131',1,'2018-05-26 13:46:12','2018-05-26 13:46:12'),(10,'id_z','朱志达','北京市国际学校','10010','15010156267',1,'2018-05-31 02:36:42','2018-07-25 08:56:24'),(11,'id_z2','小王','北京市海淀区清华大学','10000','15010157263',1,'2018-05-31 02:41:20','2018-05-31 02:41:20'),(12,'id_z3','隔壁老王','北京富力双子座','100010','150392558888',0,'2018-05-31 02:47:39','2018-05-31 02:47:39'),(13,'id_z3','隔壁老刘','北京双井','10000','15010156268',1,'2018-06-01 11:18:06','2018-06-01 11:18:06'),(14,'id_z3','隔壁','朝阳区','10010','150105123123',0,'2018-06-01 11:18:42','2018-06-01 11:18:42'),(15,'id_d','asd','a','aa','a',0,'2018-06-01 11:42:08','2018-06-01 11:42:08');
/*!40000 ALTER TABLE `buyer_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `buyer_info`
--

DROP TABLE IF EXISTS `buyer_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `buyer_info` (
  `id` varchar(32) NOT NULL,
  `username` varchar(32) NOT NULL,
  `password` varchar(32) NOT NULL,
  `tel` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `sex` varchar(10) DEFAULT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='卖家信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `buyer_info`
--

LOCK TABLES `buyer_info` WRITE;
/*!40000 ALTER TABLE `buyer_info` DISABLE KEYS */;
INSERT INTO `buyer_info` VALUES ('id_d','d','d',NULL,NULL,NULL,'2018-06-01 11:41:50','2018-06-01 11:41:50'),('id_even','even','123123','13261057038','995868061@qq.com','nan','2018-05-01 12:21:02','2018-05-28 15:37:37'),('id_heiheihei','heiheihei1','hehehe111',NULL,NULL,NULL,'2018-05-27 11:54:32','2018-05-27 12:08:16'),('id_z','z','z',NULL,NULL,NULL,'2018-05-28 13:03:23','2018-05-30 14:10:13'),('id_z1','z1','z1','15010156268','123@163.com','男','2018-05-31 01:58:27','2018-05-31 01:58:55'),('id_z2','z2','z2',NULL,NULL,NULL,'2018-05-31 02:40:15','2018-05-31 02:40:15'),('id_z3','z3','z3','15516782931','z3@163.com','男','2018-05-31 02:44:43','2018-05-31 02:50:14'),('id_zz','zz','123456',NULL,NULL,NULL,'2018-05-28 13:04:03','2018-05-28 13:04:03');
/*!40000 ALTER TABLE `buyer_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cart` (
  `cart_id` int(11) NOT NULL AUTO_INCREMENT,
  `buyer_id` varchar(64) NOT NULL,
  `product_id` varchar(32) NOT NULL,
  `product_quantity` int(11) NOT NULL DEFAULT '1',
  `checked` int(2) NOT NULL DEFAULT '1',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`cart_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (24,'id_even','1526478488945590204',2,1,'2018-05-26 07:51:44','2018-05-26 13:20:54'),(26,'id_even','1526322393841302738',1,1,'2018-05-26 13:20:48','2018-05-26 13:46:33'),(27,'id_even','1526478445172573275',1,1,'2018-05-26 13:20:50','2018-05-26 13:20:50'),(28,'id_z','1526322393841302738',3,1,'2018-05-30 14:12:05','2018-07-25 08:41:37'),(29,'id_z','1526478445172573275',2,1,'2018-05-30 14:12:10','2018-05-31 02:36:19'),(30,'id_z2','1525090435472356647',1,1,'2018-05-31 02:40:26','2018-05-31 02:40:26'),(31,'id_z2','1525090223593931947',1,1,'2018-05-31 02:40:30','2018-05-31 02:40:30'),(32,'id_z2','1525089344212659275',1,1,'2018-05-31 02:40:33','2018-05-31 02:40:33'),(37,'id_z3','1526478488945590204',2,1,'2018-05-31 02:50:34','2018-05-31 02:50:58'),(38,'id_d','1526478445172573275',1,1,'2018-06-01 11:41:58','2018-06-01 11:41:58');
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clerk`
--

DROP TABLE IF EXISTS `clerk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clerk` (
  `clerk_id` varchar(11) NOT NULL COMMENT '编号',
  `clerk_password` varchar(255) DEFAULT NULL COMMENT '密码',
  `clerk_action` varchar(255) DEFAULT NULL COMMENT '权限，以字符串形式存储',
  `clerk_time` datetime DEFAULT NULL COMMENT '添加时间',
  PRIMARY KEY (`clerk_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clerk`
--

LOCK TABLES `clerk` WRITE;
/*!40000 ALTER TABLE `clerk` DISABLE KEYS */;
/*!40000 ALTER TABLE `clerk` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_detail`
--

DROP TABLE IF EXISTS `order_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_detail` (
  `detail_id` varchar(32) NOT NULL,
  `order_id` varchar(32) NOT NULL,
  `product_id` varchar(32) NOT NULL,
  `product_name` varchar(64) NOT NULL COMMENT '商品名称',
  `product_price` decimal(8,2) NOT NULL COMMENT '当前价格,单位分',
  `product_quantity` int(11) NOT NULL COMMENT '数量',
  `product_icon` varchar(512) DEFAULT NULL COMMENT '小图',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`detail_id`) USING BTREE,
  KEY `idx_order_id` (`order_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_detail`
--

LOCK TABLES `order_detail` WRITE;
/*!40000 ALTER TABLE `order_detail` DISABLE KEYS */;
INSERT INTO `order_detail` VALUES ('1527340882457876062','1527340882457974485','1526478445172573275','MG小象不规则半身裙女夏2018新款牛仔裙高腰显瘦chic中长款a字裙',79.00,1,'https://img.alicdn.com/bao/uploaded/i1/479184430/TB2zu.zrNWYBuNjy1zkXXXGGpXa_!!479184430.jpg','2018-05-26 13:21:22','2018-05-26 13:21:22'),('1527340882464811074','1527340882457974485','1526478488945590204','减龄百褶裙2018春夏新款防走光裤裙高腰a字TB短裙显瘦半身裙夏女',159.00,2,'https://gd1.alicdn.com/imgextra/i1/66543702/TB2umAidNRDOuFjSZFzXXcIipXa_!!66543702.jpg','2018-05-26 13:21:22','2018-05-26 13:21:22'),('1527342445149877130','1527342445149456237','1526322393841302738','D春季2018新款纯色针织衫女套头韩版修身长袖打底衫镂空毛衣4952',67.00,1,'https://gd3.alicdn.com/imgextra/i3/20868741/TB2nW71gC8YBeNkSnb4XXaevFXa_!!20868741.jpg','2018-05-26 13:47:25','2018-05-26 13:47:25'),('1527342445167430506','1527342445149456237','1526478445172573275','MG小象不规则半身裙女夏2018新款牛仔裙高腰显瘦chic中长款a字裙',79.00,1,'https://img.alicdn.com/bao/uploaded/i1/479184430/TB2zu.zrNWYBuNjy1zkXXXGGpXa_!!479184430.jpg','2018-05-26 13:47:25','2018-05-26 13:47:25'),('1527342445173679425','1527342445149456237','1526478488945590204','减龄百褶裙2018春夏新款防走光裤裙高腰a字TB短裙显瘦半身裙夏女',159.00,2,'https://gd1.alicdn.com/imgextra/i1/66543702/TB2umAidNRDOuFjSZFzXXcIipXa_!!66543702.jpg','2018-05-26 13:47:25','2018-05-26 13:47:25'),('1527734216119490757','1527734216119449157','1526322393841302738','D春季2018新款纯色针织衫女套头韩版修身长袖打底衫镂空毛衣4952',67.00,2,'https://gd3.alicdn.com/imgextra/i3/20868741/TB2nW71gC8YBeNkSnb4XXaevFXa_!!20868741.jpg','2018-05-31 02:36:56','2018-05-31 02:36:56'),('1527734216131142005','1527734216119449157','1526478445172573275','MG小象不规则半身裙女夏2018新款牛仔裙高腰显瘦chic中长款a字裙',79.00,2,'https://img.alicdn.com/bao/uploaded/i1/479184430/TB2zu.zrNWYBuNjy1zkXXXGGpXa_!!479184430.jpg','2018-05-31 02:36:56','2018-05-31 02:36:56'),('1527734510755126097','1527734510755723615','1525089344212659275','ZZ名品春装2018新款女蕾丝连衣裙性感漏背中长款气质仙女吊带子Q',2350.00,1,'https://gd1.alicdn.com/imgextra/i1/21659330/TB29FJQXCcqBKNjSZFgXXX_kXXa_!!21659330.jpg','2018-05-31 02:41:50','2018-05-31 02:41:50'),('1527734510758210241','1527734510755723615','1525090223593931947','春夏雪纺连衣裙女2018新款韩版时尚沙滩裙吊带露肩碎花长裙显瘦潮',268.00,1,'https://gd4.alicdn.com/imgextra/i1/260067063/TB23NtBgSCWBuNjy0FhXXb6EVXa_!!260067063.jpg','2018-05-31 02:41:50','2018-05-31 02:41:50'),('1527734510761743251','1527734510755723615','1525090435472356647','听心/彼得潘领长袖白衬衫女/清新文艺复古棉纱圆领上衣打底18春装',98.00,1,'https://gd1.alicdn.com/imgextra/i6/TB1hZbIMVXXXXX8XpXXYXGcGpXX_M2.SS2','2018-05-31 02:41:50','2018-05-31 02:41:50'),('1527734963722330000','1527734963722883549','1525090170792941657','连衣裙2018春夏新款女装韩版气质名媛不规则前短后长中长款蕾丝裙',1680.00,1,'https://gd3.alicdn.com/imgextra/i3/2003662425/TB2wF2kc1GSBuNjSspbXXciipXa_!!2003662425.jpg','2018-05-31 02:49:23','2018-05-31 02:49:23'),('1527734963728802742','1527734963722883549','1525090435472356647','听心/彼得潘领长袖白衬衫女/清新文艺复古棉纱圆领上衣打底18春装',98.00,1,'https://gd1.alicdn.com/imgextra/i6/TB1hZbIMVXXXXX8XpXXYXGcGpXX_M2.SS2','2018-05-31 02:49:23','2018-05-31 02:49:23'),('1527734963730496134','1527734963722883549','1526322393841302738','D春季2018新款纯色针织衫女套头韩版修身长袖打底衫镂空毛衣4952',67.00,1,'https://gd3.alicdn.com/imgextra/i3/20868741/TB2nW71gC8YBeNkSnb4XXaevFXa_!!20868741.jpg','2018-05-31 02:49:23','2018-05-31 02:49:23'),('1527734963732299269','1527734963722883549','1526478445172573275','MG小象不规则半身裙女夏2018新款牛仔裙高腰显瘦chic中长款a字裙',79.00,1,'https://img.alicdn.com/bao/uploaded/i1/479184430/TB2zu.zrNWYBuNjy1zkXXXGGpXa_!!479184430.jpg','2018-05-31 02:49:23','2018-05-31 02:49:23'),('1527735054919517690','1527735054919489003','1526478488945590204','减龄百褶裙2018春夏新款防走光裤裙高腰a字TB短裙显瘦半身裙夏女',159.00,1,'https://gd1.alicdn.com/imgextra/i1/66543702/TB2umAidNRDOuFjSZFzXXcIipXa_!!66543702.jpg','2018-05-31 02:50:54','2018-05-31 02:50:54'),('1527735062010152742','1527735062010434809','1526478488945590204','减龄百褶裙2018春夏新款防走光裤裙高腰a字TB短裙显瘦半身裙夏女',159.00,2,'https://gd1.alicdn.com/imgextra/i1/66543702/TB2umAidNRDOuFjSZFzXXcIipXa_!!66543702.jpg','2018-05-31 02:51:02','2018-05-31 02:51:02'),('1532508162716720986','1532508162716956093','1526322393841302738','D春季2018新款纯色针织衫女套头韩版修身长袖打底衫镂空毛衣4952',67.00,3,'https://gd3.alicdn.com/imgextra/i3/20868741/TB2nW71gC8YBeNkSnb4XXaevFXa_!!20868741.jpg','2018-07-25 08:42:42','2018-07-25 08:42:42'),('1532508162728250555','1532508162716956093','1526478445172573275','MG小象不规则半身裙女夏2018新款牛仔裙高腰显瘦chic中长款a字裙',79.00,2,'https://img.alicdn.com/bao/uploaded/i1/479184430/TB2zu.zrNWYBuNjy1zkXXXGGpXa_!!479184430.jpg','2018-07-25 08:42:42','2018-07-25 08:42:42');
/*!40000 ALTER TABLE `order_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_master`
--

DROP TABLE IF EXISTS `order_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_master` (
  `order_id` varchar(32) NOT NULL,
  `buyer_name` varchar(32) NOT NULL COMMENT '买家名字',
  `buyer_phone` varchar(32) NOT NULL COMMENT '买家电话',
  `buyer_address` varchar(128) NOT NULL COMMENT '买家地址',
  `buyer_openid` varchar(64) NOT NULL COMMENT '买家微信openid',
  `order_amount` decimal(8,2) NOT NULL COMMENT '订单总金额',
  `order_status` tinyint(3) NOT NULL DEFAULT '0' COMMENT '订单状态, 默认为新下单',
  `pay_status` tinyint(3) NOT NULL DEFAULT '0' COMMENT '支付状态, 默认未支付',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`order_id`) USING BTREE,
  KEY `idx_buyer_openid` (`buyer_openid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_master`
--

LOCK TABLES `order_master` WRITE;
/*!40000 ALTER TABLE `order_master` DISABLE KEYS */;
INSERT INTO `order_master` VALUES ('1527340882457974485','耿耿','13070169390','北方工业大学','id_even',397.00,1,1,'2018-05-26 13:21:22','2018-05-31 02:53:13'),('1527342445149456237','even','18373783833','地址2','id_even',464.00,0,1,'2018-05-26 13:47:25','2018-05-28 14:45:43'),('1527734216119449157','朱志达','15010156268','北京市澳际国际学校','id_z',292.00,0,1,'2018-05-31 02:36:56','2018-05-31 02:36:56'),('1527734510755723615','小王','15010157263','北京市海淀区清华大学','id_z2',2716.00,0,1,'2018-05-31 02:41:50','2018-05-31 02:41:50'),('1527734963722883549','隔壁老王','150392558888','北京富力双子座','id_z3',1924.00,0,1,'2018-05-31 02:49:23','2018-05-31 02:49:23'),('1527735054919489003','隔壁老王','150392558888','北京富力双子座','id_z3',159.00,1,1,'2018-05-31 02:50:54','2018-06-01 11:15:16'),('1527735062010434809','隔壁老王','150392558888','北京富力双子座','id_z3',318.00,0,1,'2018-05-31 02:51:02','2018-05-31 02:51:02'),('1532508162716956093','朱志达','15010156268','北京市澳际国际学校','id_z',359.00,0,1,'2018-07-25 08:42:42','2018-07-25 08:42:42');
/*!40000 ALTER TABLE `order_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_category`
--

DROP TABLE IF EXISTS `product_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_category` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(64) NOT NULL COMMENT '类目名字',
  `category_type` int(11) NOT NULL COMMENT '类目编号',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`category_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_category`
--

LOCK TABLES `product_category` WRITE;
/*!40000 ALTER TABLE `product_category` DISABLE KEYS */;
INSERT INTO `product_category` VALUES (1,'春节热卖',1,'2018-04-30 11:47:21','2018-04-30 11:47:21'),(2,'夏季热买',2,'2018-04-30 11:47:28','2018-04-30 11:47:28'),(3,'秋季热卖',3,'2018-04-30 11:47:37','2018-04-30 11:47:37'),(4,'冬季热卖',4,'2018-04-30 11:47:43','2018-04-30 11:47:43'),(5,'热销榜',5,'2018-04-30 11:48:00','2018-04-30 11:52:24'),(6,'折扣榜',6,'2018-04-30 11:51:36','2018-04-30 11:56:26'),(7,'测试类目',100,'2018-04-30 11:56:43','2018-04-30 11:56:43');
/*!40000 ALTER TABLE `product_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_info`
--

DROP TABLE IF EXISTS `product_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_info` (
  `product_id` varchar(32) NOT NULL,
  `product_name` varchar(64) NOT NULL COMMENT '商品名称',
  `product_price` decimal(8,2) NOT NULL COMMENT '单价',
  `product_stock` int(11) NOT NULL COMMENT '库存',
  `product_description` varchar(64) DEFAULT NULL COMMENT '描述',
  `product_icon` varchar(512) DEFAULT NULL COMMENT '小图',
  `product_status` tinyint(3) DEFAULT '0' COMMENT '商品状态,0正常1下架',
  `category_type` int(11) NOT NULL COMMENT '类目编号',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`product_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_info`
--

LOCK TABLES `product_info` WRITE;
/*!40000 ALTER TABLE `product_info` DISABLE KEYS */;
INSERT INTO `product_info` VALUES ('1525089344212659275','ZZ名品春装2018新款女蕾丝连衣裙性感漏背中长款气质仙女吊带子Q',2350.00,1001,'ZZ名品春装2018新款女蕾丝连衣裙性感漏背中长款气质仙女吊带子Q','https://gd1.alicdn.com/imgextra/i1/21659330/TB29FJQXCcqBKNjSZFgXXX_kXXa_!!21659330.jpg',1,1,'2018-04-30 11:55:44','2018-06-01 10:44:15'),('1525090084453394386','8折！余潇潇春装2018新款白色超仙初恋裙复古中长款蕾丝连衣裙女',400.00,1000,'8折！余潇潇春装2018新款白色超仙初恋裙复古中长款蕾丝连衣裙女','https://img.alicdn.com/imgextra/i4/355499374/TB2ZFw9cbZnBKNjSZFrXXaRLFXa_!!355499374.jpg',1,2,'2018-04-30 12:08:04','2018-06-01 11:38:31'),('1525090170792941657','连衣裙2018春夏新款女装韩版气质名媛不规则前短后长中长款蕾丝裙',1680.00,100,'连衣裙2018春夏新款女装韩版气质名媛不规则前短后长中长款蕾丝裙','https://gd3.alicdn.com/imgextra/i3/2003662425/TB2wF2kc1GSBuNjSspbXXciipXa_!!2003662425.jpg',1,3,'2018-04-30 12:09:30','2018-06-01 10:44:18'),('1525090223593931947','春夏雪纺连衣裙女2018新款韩版时尚沙滩裙吊带露肩碎花长裙显瘦潮',268.00,1000,'春夏雪纺连衣裙女2018新款韩版时尚沙滩裙吊带露肩碎花长裙显瘦潮','https://gd4.alicdn.com/imgextra/i1/260067063/TB23NtBgSCWBuNjy0FhXXb6EVXa_!!260067063.jpg',0,4,'2018-04-30 12:10:23','2018-05-16 14:24:31'),('1525090304814879011','裙子女夏季收腰短袖显瘦冷淡风法式少女复古极简中长款黄色连衣裙',168.00,1000,'裙子女夏季收腰短袖显瘦冷淡风法式少女复古极简中长款黄色连衣裙','https://gd3.alicdn.com/imgextra/i3/272748156/TB29myOhhWYBuNjy1zkXXXGGpXa_!!272748156.jpg',0,5,'2018-04-30 12:11:44','2018-06-01 11:10:33'),('1525090435472356647','听心/彼得潘领长袖白衬衫女/清新文艺复古棉纱圆领上衣打底18春装',98.00,1000,'听心/彼得潘领长袖白衬衫女/清新文艺复古棉纱圆领上衣打底18春装','https://gd1.alicdn.com/imgextra/i6/TB1hZbIMVXXXXX8XpXXYXGcGpXX_M2.SS2',0,6,'2018-04-30 12:13:55','2018-05-16 14:24:35'),('1526322393841302738','D春季2018新款纯色针织衫女套头韩版修身长袖打底衫镂空毛衣4952',67.00,1000,'D春季2018新款纯色针织衫女套头韩版修身长袖打底衫镂空毛衣4952','https://gd3.alicdn.com/imgextra/i3/20868741/TB2nW71gC8YBeNkSnb4XXaevFXa_!!20868741.jpg',1,1,'2018-05-14 18:26:33','2018-06-01 11:10:39'),('1526322446992149863','花间裳/以梦为马/a 清新刺绣假两件连衣裙女 蓬蓬公主裙 2018春夏',299.00,10000,'花间裳/以梦为马/a 清新刺绣假两件连衣裙女 蓬蓬公主裙 2018春夏','https://gd1.alicdn.com/imgextra/i1/642826369/TB2LRsVhamWBuNjy1XaXXXCbXXa_!!642826369.jpg',0,2,'2018-05-14 18:27:26','2018-05-16 14:24:48'),('1526322520940194889','Lin2018春夏新款温柔仙女裙碎花超仙收腰气质裙子冷淡风连衣裙女',497.00,1000,'Lin2018春夏新款温柔仙女裙碎花超仙收腰气质裙子冷淡风连衣裙女','https://gd2.alicdn.com/imgextra/i3/57220545/TB2M_Yko_tYBeNjy1XdXXXXyVXa_!!57220545.jpg',0,3,'2018-05-14 18:28:40','2018-05-16 14:24:50'),('1526478181997953974','LIN CHAO ZHANG 春夏新款俏皮减龄浅葡萄紫抽褶不规则半身裙',425.00,10000,'LIN CHAO ZHANG 春夏新款俏皮减龄浅葡萄紫抽褶不规则半身裙','https://gd4.alicdn.com/imgextra/i4/57220545/TB28lAmnL5TBuNjSspcXXbnGFXa_!!57220545.jpg',1,4,'2018-05-16 13:43:02','2018-06-01 10:44:20'),('1526478234517729746','左岸潇同款2018春夏新款灰色荷叶边高腰不规则鱼尾半身裙长裙裤裙',198.00,1000,'左岸潇同款2018春夏新款灰色荷叶边高腰不规则鱼尾半身裙长裙裤裙','https://gd3.alicdn.com/imgextra/i2/62762127/TB29EwwdAZmBKNjSZPiXXXFNVXa_!!62762127.jpg',0,5,'2018-05-16 13:43:54','2018-06-01 11:01:33'),('1526478266721951198','半身裙女夏2018新款ins超火裙子网纱a字裙学生仙女蛋糕裙高腰长裙',188.00,1000,'半身裙女夏2018新款ins超火裙子网纱a字裙学生仙女蛋糕裙高腰长裙','https://gd2.alicdn.com/imgextra/i3/1790271615/TB2MdCwesUrBKNjSZPxXXX00pXa_!!1790271615.jpg',0,6,'2018-05-16 13:44:26','2018-05-16 14:24:55'),('1526478445172573275','MG小象不规则半身裙女夏2018新款牛仔裙高腰显瘦chic中长款a字裙',79.00,1000,'MG小象不规则半身裙女夏2018新款牛仔裙高腰显瘦chic中长款a字裙','https://img.alicdn.com/bao/uploaded/i1/479184430/TB2zu.zrNWYBuNjy1zkXXXGGpXa_!!479184430.jpg',0,1,'2018-05-16 13:47:25','2018-06-01 11:01:29'),('1526478488945590204','减龄百褶裙2018春夏新款防走光裤裙高腰a字TB短裙显瘦半身裙夏女',159.00,1000,'减龄百褶裙2018春夏新款防走光裤裙高腰a字TB短裙显瘦半身裙夏女','https://gd1.alicdn.com/imgextra/i1/66543702/TB2umAidNRDOuFjSZFzXXcIipXa_!!66543702.jpg',0,1,'2018-05-16 13:48:08','2018-06-01 11:01:27');
/*!40000 ALTER TABLE `product_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question`
--

DROP TABLE IF EXISTS `question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `question` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `buyer_id` varchar(255) DEFAULT NULL,
  `seller_id` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `content` varchar(5000) DEFAULT NULL,
  `reply` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `update_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question`
--

LOCK TABLES `question` WRITE;
/*!40000 ALTER TABLE `question` DISABLE KEYS */;
INSERT INTO `question` VALUES (1,'id_even',NULL,'nihaoa a ',NULL,'1234456','2018-05-30 22:09:06','2018-05-30 22:09:07',1),(2,'id_even',NULL,'nihaoa a ',NULL,'1234456','2018-05-30 22:09:09','2018-05-30 22:09:09',1),(3,'id_even','qwe123','nihaoa a ',NULL,'1234456','2018-05-30 22:58:08','2018-05-30 22:58:09',1),(4,'id_z',NULL,'test','test11111test11111test11111test11111test11111test11111test11111test11111test11111test11111','tetetete','2018-05-30 22:55:43','2018-05-30 22:55:44',1),(5,'id_z',NULL,'aaa','aaaaaaaaaasdzadaddasdasdasda','asd','2018-05-30 22:11:17','2018-05-30 22:11:18',1),(6,'id_z',NULL,'nihao a ','132123123','aaaaaaa','2018-05-30 22:11:49','2018-05-30 22:11:49',1),(7,'id_z2',NULL,'好评','不错的，是正品，外观和图案没有区别，比店里便宜的多，看着高端大气上档次，朋友都认为买的值，大家值得信赖',NULL,'2018-05-31 10:44:02',NULL,0),(8,'id_z2',NULL,'还差不多下次继续','必须要好评好评好评！质量真心好。价钱划算，服务好，喜欢的朋友可以放心拍！',NULL,'2018-05-31 10:44:30',NULL,0),(9,'id_z3',NULL,'z3用户测试反馈问题','一般来说，当应用中有可能会复用到的代码时，直接放到 lib/plugin 目录去，如例子中的 egg-ua。 当该插件功能稳定后，即可独立出来作为一个 node module 。 如此以往，应用中相对复用性较强的代码都会逐渐独立为单独的插件。 当你的应用逐渐进化到针对某类业务场景的解决方案时，将其抽象为独立的 framework 进行发布。 当在新项目中抽象出的插件，下沉集成到框架后，其他项目只需要简单的重新 npm install 下就可以使用上，对整个团队的效率有极大的提升。 注意：不管是应用/插件/框架，都必须编写单元测试，并尽量实现 100% 覆盖率。',NULL,'2018-05-31 10:52:18',NULL,0),(10,'id_z3','id_admin','代码有问题','   });     },     init() {       this.$axios         .get(\"/buyer/address/list\")         .then(result => {           let res = result.data;           if (res.code == \"0\") {             this.addressList = res.data;             this.addressList.forEach(item => {                 this.selectedAddressId = item.','我也不会写代码','2018-05-31 11:04:40','2018-05-31 11:04:40',1);
/*!40000 ALTER TABLE `question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seller_info`
--

DROP TABLE IF EXISTS `seller_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seller_info` (
  `id` varchar(32) NOT NULL,
  `username` varchar(32) NOT NULL,
  `password` varchar(32) NOT NULL,
  `openid` varchar(64) NOT NULL COMMENT '微信openid',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `state` int(11) DEFAULT NULL COMMENT '0:表示普通卖家，1表示超级管理员',
  `email` varchar(255) DEFAULT NULL,
  `tel` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='卖家信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seller_info`
--

LOCK TABLES `seller_info` WRITE;
/*!40000 ALTER TABLE `seller_info` DISABLE KEYS */;
INSERT INTO `seller_info` VALUES ('id_abcd','abcddd','abcdddd','1528021614948','2018-06-03 10:26:54','2018-06-03 10:43:50',0,'2@qq.com','15010156266'),('id_admin','admin','admin','1527735254992','2018-05-31 02:54:15','2018-05-31 03:04:19',1,'51844712@qq.com','15010156268'),('id_ccc','ccc','c','1528021862800','2018-06-03 10:31:02','2018-06-03 10:31:02',0,'51844712@qq.com','15010156268'),('id_d','d','d','1528022087507','2018-06-03 10:34:47','2018-06-03 10:34:47',0,'51844712@qq.com','15010156268'),('id_test2','test2','test2','1527745869176','2018-05-31 05:51:09','2018-05-31 05:51:09',0,'51844712@qq.com','15010156268'),('id_test3','test3','test3','1527745942195','2018-05-31 05:52:24','2018-05-31 05:52:24',0,'51844712@qq.com','15010156268'),('id_z','z1','123456','1527745504941','2018-05-31 05:45:05','2018-06-03 10:33:28',0,'qwe3333@qq.com','15010523626'),('qwe123','z','123456','123123','2018-05-01 12:21:02','2018-05-31 05:57:33',0,'51844712@qq.com','15010156268');
/*!40000 ALTER TABLE `seller_info` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-07-25 16:57:50
