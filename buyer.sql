/*
Navicat MySQL Data Transfer

Source Server         : localhost_mysql
Source Server Version : 50720
Source Host           : localhost:3306
Source Database       : buyer

Target Server Type    : MYSQL
Target Server Version : 50720
File Encoding         : 65001

Date: 2018-05-30 16:24:05
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for buyer_address
-- ----------------------------
DROP TABLE IF EXISTS `buyer_address`;
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='卖家信息表';

-- ----------------------------
-- Records of buyer_address
-- ----------------------------
INSERT INTO `buyer_address` VALUES ('4', 'id_even', '耿耿', '北方工业大学', '100041', '13070169390', '1', '2018-05-24 01:42:48', '2018-05-24 10:52:40');
INSERT INTO `buyer_address` VALUES ('5', 'id_even', 'even', 'NCUT', '100041', '13070169390', '0', '2018-05-26 16:03:43', '2018-05-26 16:03:46');
INSERT INTO `buyer_address` VALUES ('6', 'id_even', 'even', '地址1', '100044', '18818283241', '0', '2018-05-26 21:44:46', '2018-05-26 21:44:46');
INSERT INTO `buyer_address` VALUES ('7', 'id_even', 'even', '地址2', '100046', '18373783833', '0', '2018-05-26 21:45:11', '2018-05-26 21:45:11');
INSERT INTO `buyer_address` VALUES ('8', 'id_even', 'even', 'daa', '123133', '12313123123', '0', '2018-05-26 21:46:01', '2018-05-26 21:46:01');
INSERT INTO `buyer_address` VALUES ('9', 'qwe', 'qwe', 'qwe', 'qwe', '12313123131', '1', '2018-05-26 21:46:12', '2018-05-26 21:46:12');

-- ----------------------------
-- Table structure for buyer_info
-- ----------------------------
DROP TABLE IF EXISTS `buyer_info`;
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

-- ----------------------------
-- Records of buyer_info
-- ----------------------------
INSERT INTO `buyer_info` VALUES ('id_even', 'even', '123123', '13261057038', '995868061@qq.com', 'nan', '2018-05-01 20:21:02', '2018-05-28 23:37:37');
INSERT INTO `buyer_info` VALUES ('id_heiheihei', 'heiheihei1', 'hehehe111', null, null, null, '2018-05-27 19:54:32', '2018-05-27 20:08:16');
INSERT INTO `buyer_info` VALUES ('id_z', 'z', '1234567', null, null, null, '2018-05-28 21:03:23', '2018-05-28 21:08:38');
INSERT INTO `buyer_info` VALUES ('id_zz', 'zz', '123456', null, null, null, '2018-05-28 21:04:03', '2018-05-28 21:04:03');

-- ----------------------------
-- Table structure for cart
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart` (
  `cart_id` int(11) NOT NULL AUTO_INCREMENT,
  `buyer_id` varchar(64) NOT NULL,
  `product_id` varchar(32) NOT NULL,
  `product_quantity` int(11) NOT NULL DEFAULT '1',
  `checked` int(2) NOT NULL DEFAULT '1',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`cart_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of cart
-- ----------------------------
INSERT INTO `cart` VALUES ('24', 'id_even', '1526478488945590204', '2', '1', '2018-05-26 15:51:44', '2018-05-26 21:20:54');
INSERT INTO `cart` VALUES ('26', 'id_even', '1526322393841302738', '1', '1', '2018-05-26 21:20:48', '2018-05-26 21:46:33');
INSERT INTO `cart` VALUES ('27', 'id_even', '1526478445172573275', '1', '1', '2018-05-26 21:20:50', '2018-05-26 21:20:50');

-- ----------------------------
-- Table structure for clerk
-- ----------------------------
DROP TABLE IF EXISTS `clerk`;
CREATE TABLE `clerk` (
  `clerk_id` varchar(11) NOT NULL COMMENT '编号',
  `clerk_password` varchar(255) DEFAULT NULL COMMENT '密码',
  `clerk_action` varchar(255) DEFAULT NULL COMMENT '权限，以字符串形式存储',
  `clerk_time` datetime DEFAULT NULL COMMENT '添加时间',
  PRIMARY KEY (`clerk_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of clerk
-- ----------------------------

-- ----------------------------
-- Table structure for order_detail
-- ----------------------------
DROP TABLE IF EXISTS `order_detail`;
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

-- ----------------------------
-- Records of order_detail
-- ----------------------------
INSERT INTO `order_detail` VALUES ('1527340882457876062', '1527340882457974485', '1526478445172573275', 'MG小象不规则半身裙女夏2018新款牛仔裙高腰显瘦chic中长款a字裙', '79.00', '1', 'https://img.alicdn.com/bao/uploaded/i1/479184430/TB2zu.zrNWYBuNjy1zkXXXGGpXa_!!479184430.jpg', '2018-05-26 21:21:22', '2018-05-26 21:21:22');
INSERT INTO `order_detail` VALUES ('1527340882464811074', '1527340882457974485', '1526478488945590204', '减龄百褶裙2018春夏新款防走光裤裙高腰a字TB短裙显瘦半身裙夏女', '159.00', '2', 'https://gd1.alicdn.com/imgextra/i1/66543702/TB2umAidNRDOuFjSZFzXXcIipXa_!!66543702.jpg', '2018-05-26 21:21:22', '2018-05-26 21:21:22');
INSERT INTO `order_detail` VALUES ('1527342445149877130', '1527342445149456237', '1526322393841302738', 'D春季2018新款纯色针织衫女套头韩版修身长袖打底衫镂空毛衣4952', '67.00', '1', 'https://gd3.alicdn.com/imgextra/i3/20868741/TB2nW71gC8YBeNkSnb4XXaevFXa_!!20868741.jpg', '2018-05-26 21:47:25', '2018-05-26 21:47:25');
INSERT INTO `order_detail` VALUES ('1527342445167430506', '1527342445149456237', '1526478445172573275', 'MG小象不规则半身裙女夏2018新款牛仔裙高腰显瘦chic中长款a字裙', '79.00', '1', 'https://img.alicdn.com/bao/uploaded/i1/479184430/TB2zu.zrNWYBuNjy1zkXXXGGpXa_!!479184430.jpg', '2018-05-26 21:47:25', '2018-05-26 21:47:25');
INSERT INTO `order_detail` VALUES ('1527342445173679425', '1527342445149456237', '1526478488945590204', '减龄百褶裙2018春夏新款防走光裤裙高腰a字TB短裙显瘦半身裙夏女', '159.00', '2', 'https://gd1.alicdn.com/imgextra/i1/66543702/TB2umAidNRDOuFjSZFzXXcIipXa_!!66543702.jpg', '2018-05-26 21:47:25', '2018-05-26 21:47:25');

-- ----------------------------
-- Table structure for order_master
-- ----------------------------
DROP TABLE IF EXISTS `order_master`;
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

-- ----------------------------
-- Records of order_master
-- ----------------------------
INSERT INTO `order_master` VALUES ('1527340882457974485', '耿耿', '13070169390', '北方工业大学', 'id_even', '397.00', '0', '1', '2018-05-26 21:21:22', '2018-05-28 22:46:59');
INSERT INTO `order_master` VALUES ('1527342445149456237', 'even', '18373783833', '地址2', 'id_even', '464.00', '0', '1', '2018-05-26 21:47:25', '2018-05-28 22:45:43');

-- ----------------------------
-- Table structure for product_category
-- ----------------------------
DROP TABLE IF EXISTS `product_category`;
CREATE TABLE `product_category` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(64) NOT NULL COMMENT '类目名字',
  `category_type` int(11) NOT NULL COMMENT '类目编号',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`category_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of product_category
-- ----------------------------
INSERT INTO `product_category` VALUES ('1', '春节热卖', '1', '2018-04-30 19:47:21', '2018-04-30 19:47:21');
INSERT INTO `product_category` VALUES ('2', '夏季热买', '2', '2018-04-30 19:47:28', '2018-04-30 19:47:28');
INSERT INTO `product_category` VALUES ('3', '秋季热卖', '3', '2018-04-30 19:47:37', '2018-04-30 19:47:37');
INSERT INTO `product_category` VALUES ('4', '冬季热卖', '4', '2018-04-30 19:47:43', '2018-04-30 19:47:43');
INSERT INTO `product_category` VALUES ('5', '热销榜', '5', '2018-04-30 19:48:00', '2018-04-30 19:52:24');
INSERT INTO `product_category` VALUES ('6', '折扣榜', '6', '2018-04-30 19:51:36', '2018-04-30 19:56:26');
INSERT INTO `product_category` VALUES ('7', '测试类目', '100', '2018-04-30 19:56:43', '2018-04-30 19:56:43');

-- ----------------------------
-- Table structure for product_info
-- ----------------------------
DROP TABLE IF EXISTS `product_info`;
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

-- ----------------------------
-- Records of product_info
-- ----------------------------
INSERT INTO `product_info` VALUES ('1525089344212659275', 'ZZ名品春装2018新款女蕾丝连衣裙性感漏背中长款气质仙女吊带子Q', '2350.00', '1001', 'ZZ名品春装2018新款女蕾丝连衣裙性感漏背中长款气质仙女吊带子Q', 'https://gd1.alicdn.com/imgextra/i1/21659330/TB29FJQXCcqBKNjSZFgXXX_kXXa_!!21659330.jpg', '0', '1', '2018-04-30 19:55:44', '2018-05-26 16:38:58');
INSERT INTO `product_info` VALUES ('1525090084453394386', '8折！余潇潇春装2018新款白色超仙初恋裙复古中长款蕾丝连衣裙女', '400.00', '1000', '8折！余潇潇春装2018新款白色超仙初恋裙复古中长款蕾丝连衣裙女', 'https://img.alicdn.com/imgextra/i4/355499374/TB2ZFw9cbZnBKNjSZFrXXaRLFXa_!!355499374.jpg', '0', '2', '2018-04-30 20:08:04', '2018-05-16 22:24:24');
INSERT INTO `product_info` VALUES ('1525090170792941657', '连衣裙2018春夏新款女装韩版气质名媛不规则前短后长中长款蕾丝裙', '1680.00', '100', '连衣裙2018春夏新款女装韩版气质名媛不规则前短后长中长款蕾丝裙', 'https://gd3.alicdn.com/imgextra/i3/2003662425/TB2wF2kc1GSBuNjSspbXXciipXa_!!2003662425.jpg', '0', '3', '2018-04-30 20:09:30', '2018-05-16 22:24:28');
INSERT INTO `product_info` VALUES ('1525090223593931947', '春夏雪纺连衣裙女2018新款韩版时尚沙滩裙吊带露肩碎花长裙显瘦潮', '268.00', '1000', '春夏雪纺连衣裙女2018新款韩版时尚沙滩裙吊带露肩碎花长裙显瘦潮', 'https://gd4.alicdn.com/imgextra/i1/260067063/TB23NtBgSCWBuNjy0FhXXb6EVXa_!!260067063.jpg', '0', '4', '2018-04-30 20:10:23', '2018-05-16 22:24:31');
INSERT INTO `product_info` VALUES ('1525090304814879011', '裙子女夏季收腰短袖显瘦冷淡风法式少女复古极简中长款黄色连衣裙', '168.00', '1000', '裙子女夏季收腰短袖显瘦冷淡风法式少女复古极简中长款黄色连衣裙', 'https://gd3.alicdn.com/imgextra/i3/272748156/TB29myOhhWYBuNjy1zkXXXGGpXa_!!272748156.jpg', '0', '5', '2018-04-30 20:11:44', '2018-05-16 22:24:33');
INSERT INTO `product_info` VALUES ('1525090435472356647', '听心/彼得潘领长袖白衬衫女/清新文艺复古棉纱圆领上衣打底18春装', '98.00', '1000', '听心/彼得潘领长袖白衬衫女/清新文艺复古棉纱圆领上衣打底18春装', 'https://gd1.alicdn.com/imgextra/i6/TB1hZbIMVXXXXX8XpXXYXGcGpXX_M2.SS2', '0', '6', '2018-04-30 20:13:55', '2018-05-16 22:24:35');
INSERT INTO `product_info` VALUES ('1526322393841302738', 'D春季2018新款纯色针织衫女套头韩版修身长袖打底衫镂空毛衣4952', '67.00', '1000', 'D春季2018新款纯色针织衫女套头韩版修身长袖打底衫镂空毛衣4952', 'https://gd3.alicdn.com/imgextra/i3/20868741/TB2nW71gC8YBeNkSnb4XXaevFXa_!!20868741.jpg', '0', '1', '2018-05-15 02:26:33', '2018-05-15 02:26:33');
INSERT INTO `product_info` VALUES ('1526322446992149863', '花间裳/以梦为马/a 清新刺绣假两件连衣裙女 蓬蓬公主裙 2018春夏', '299.00', '10000', '花间裳/以梦为马/a 清新刺绣假两件连衣裙女 蓬蓬公主裙 2018春夏', 'https://gd1.alicdn.com/imgextra/i1/642826369/TB2LRsVhamWBuNjy1XaXXXCbXXa_!!642826369.jpg', '0', '2', '2018-05-15 02:27:26', '2018-05-16 22:24:48');
INSERT INTO `product_info` VALUES ('1526322520940194889', 'Lin2018春夏新款温柔仙女裙碎花超仙收腰气质裙子冷淡风连衣裙女', '497.00', '1000', 'Lin2018春夏新款温柔仙女裙碎花超仙收腰气质裙子冷淡风连衣裙女', 'https://gd2.alicdn.com/imgextra/i3/57220545/TB2M_Yko_tYBeNjy1XdXXXXyVXa_!!57220545.jpg', '0', '3', '2018-05-15 02:28:40', '2018-05-16 22:24:50');
INSERT INTO `product_info` VALUES ('1526478181997953974', 'LIN CHAO ZHANG 春夏新款俏皮减龄浅葡萄紫抽褶不规则半身裙', '425.00', '10000', 'LIN CHAO ZHANG 春夏新款俏皮减龄浅葡萄紫抽褶不规则半身裙', 'https://gd4.alicdn.com/imgextra/i4/57220545/TB28lAmnL5TBuNjSspcXXbnGFXa_!!57220545.jpg', '0', '4', '2018-05-16 21:43:02', '2018-05-16 22:24:51');
INSERT INTO `product_info` VALUES ('1526478234517729746', '左岸潇同款2018春夏新款灰色荷叶边高腰不规则鱼尾半身裙长裙裤裙', '198.00', '1000', '左岸潇同款2018春夏新款灰色荷叶边高腰不规则鱼尾半身裙长裙裤裙', 'https://gd3.alicdn.com/imgextra/i2/62762127/TB29EwwdAZmBKNjSZPiXXXFNVXa_!!62762127.jpg', '0', '5', '2018-05-16 21:43:54', '2018-05-16 22:24:53');
INSERT INTO `product_info` VALUES ('1526478266721951198', '半身裙女夏2018新款ins超火裙子网纱a字裙学生仙女蛋糕裙高腰长裙', '188.00', '1000', '半身裙女夏2018新款ins超火裙子网纱a字裙学生仙女蛋糕裙高腰长裙', 'https://gd2.alicdn.com/imgextra/i3/1790271615/TB2MdCwesUrBKNjSZPxXXX00pXa_!!1790271615.jpg', '0', '6', '2018-05-16 21:44:26', '2018-05-16 22:24:55');
INSERT INTO `product_info` VALUES ('1526478445172573275', 'MG小象不规则半身裙女夏2018新款牛仔裙高腰显瘦chic中长款a字裙', '79.00', '1000', 'MG小象不规则半身裙女夏2018新款牛仔裙高腰显瘦chic中长款a字裙', 'https://img.alicdn.com/bao/uploaded/i1/479184430/TB2zu.zrNWYBuNjy1zkXXXGGpXa_!!479184430.jpg', '0', '1', '2018-05-16 21:47:25', '2018-05-16 21:47:25');
INSERT INTO `product_info` VALUES ('1526478488945590204', '减龄百褶裙2018春夏新款防走光裤裙高腰a字TB短裙显瘦半身裙夏女', '159.00', '1000', '减龄百褶裙2018春夏新款防走光裤裙高腰a字TB短裙显瘦半身裙夏女', 'https://gd1.alicdn.com/imgextra/i1/66543702/TB2umAidNRDOuFjSZFzXXcIipXa_!!66543702.jpg', '0', '1', '2018-05-16 21:48:08', '2018-05-16 21:48:08');

-- ----------------------------
-- Table structure for question
-- ----------------------------
DROP TABLE IF EXISTS `question`;
CREATE TABLE `question` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `buyer_id` varchar(255) DEFAULT NULL,
  `seller_id` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `reply` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `update_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of question
-- ----------------------------
INSERT INTO `question` VALUES ('1', 'id_even', null, 'nihaoa a ', null, '1234456', '2018-05-29 21:34:50', '2018-05-29 21:34:50', '0');
INSERT INTO `question` VALUES ('2', 'id_even', null, 'nihaoa a ', null, '1234456', '2018-05-29 21:34:51', '2018-05-29 21:34:51', '0');
INSERT INTO `question` VALUES ('3', 'id_even', null, 'nihaoa a ', null, '1234456', '2018-05-29 21:34:53', '2018-05-29 21:34:53', '0');

-- ----------------------------
-- Table structure for seller_info
-- ----------------------------
DROP TABLE IF EXISTS `seller_info`;
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

-- ----------------------------
-- Records of seller_info
-- ----------------------------
INSERT INTO `seller_info` VALUES ('qwe123', '慕善文', '123456', '123123', '2018-05-01 20:21:02', '2018-05-29 23:48:00', '0', null, null);
