
--
-- Current Database: `inventory`
--

CREATE DATABASE IF NOT EXISTS `inventory`;

USE `inventory`;

--
-- Table structure for table `brand`
--

DROP TABLE IF EXISTS `brand`;

CREATE TABLE `brand` (
  `id` varchar(10) NOT NULL,
  `name` varchar(40) NOT NULL,
  `country` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
);

--
-- Dumping data for table `brand`
--

INSERT INTO `brand` VALUES
('ADD','アドデス','ドイツ'),
('CLEOR','クレオール','日本'),
('FIS','ファインスカイ','日本'),
('UDN','ウディナ','イタリア'),
('UTG','ウルトラゲート','アメリカ');

--
-- Table structure for table `goods`
--

DROP TABLE IF EXISTS `goods`;

CREATE TABLE `goods` (
  `id` varchar(10) NOT NULL,
  `name` varchar(40) NOT NULL,
  `size` varchar(20) DEFAULT NULL,
  `brand` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `brand_idx` (`brand`),
  CONSTRAINT `fk_brand_id`
  FOREIGN KEY (`brand`) REFERENCES `brand` (`id`)
);

--
-- Dumping data for table `goods`
--

INSERT INTO `goods` VALUES
('A12','ドライソックス','S','FIS'),
('A13','ドライソックス','XL','FIS'),
('A301','速乾タオルF','40x80','FIS'),
('AAA','わはは','L','CLEOR'),
('B21','ボディボトル','500ml','UDN'),
('B33','FastZack20','S/M','ADD'),
('D05','トレイスパッツUT','M','UTG'),
('DG7','サファリハット','M/L','UTG'),
('din','靴下','S','FIS'),
('ebie','わはははは','M','UDN'),
('TAKO','たこ焼き','L','CLEOR'),
('TTT','イカ焼き','M','FIS');

--
-- Table structure for table `stock`
--

DROP TABLE IF EXISTS `stock`;

CREATE TABLE `stock` (
  `goods_id` varchar(10) DEFAULT NULL,
  `quantity` int(11) DEFAULT 0,
  UNIQUE KEY `goods_id` (`goods_id`),
  CONSTRAINT `fk_goods_id`
  FOREIGN KEY (`goods_id`) REFERENCES `goods` (`id`)
);

--
-- Dumping data for table `stock`
--

INSERT INTO `stock` VALUES
('A12',12),
('A13',10),
('A301',16),
('B21',19),
('B33',0),
('D05',4),
('din',3),
('TAKO',12),
('AAA',3),
('ebie',3),
('TTT',23),
('DG7',5);


-- 修正時刻: Wed 2025/10/01 06:55:55
