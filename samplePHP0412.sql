-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- ホスト: localhost:3306
-- 生成日時: 2022-04-12 11:10:30
-- サーバのバージョン： 5.7.24
-- PHP のバージョン: 7.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- データベース: `sample`
--
CREATE DATABASE IF NOT EXISTS `sample` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `sample`;

-- --------------------------------------------------------

--
-- テーブルの構造 `course`
--

CREATE TABLE `course` (
  `cid` int(11) NOT NULL,
  `cname` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- テーブルのデータのダンプ `course`
--

INSERT INTO `course` (`cid`, `cname`) VALUES
(1, 'HTML/CSSコース'),
(2, 'JavaScriptコース'),
(3, 'PHPコース'),
(4, 'Javaコース'),
(5, 'サーブレットJSPコース'),
(6, 'HTML/CSSコース'),
(7, 'JavaScriptコース'),
(8, 'PHPコース'),
(9, 'Javaコース'),
(10, 'サーブレットJSPコース');

-- --------------------------------------------------------

--
-- テーブルの構造 `dept`
--

CREATE TABLE `dept` (
  `id` char(3) NOT NULL,
  `name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- テーブルのデータのダンプ `dept`
--

INSERT INTO `dept` (`id`, `name`) VALUES
('001', '総務部'),
('002', '営業部'),
('003', '経理部'),
('004', '開発部');

-- --------------------------------------------------------

--
-- テーブルの構造 `emp`
--

CREATE TABLE `emp` (
  `id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `age` int(11) NOT NULL,
  `birthday` year(4) NOT NULL,
  `dept_id` char(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- テーブルのデータのダンプ `emp`
--

INSERT INTO `emp` (`id`, `name`, `age`, `birthday`, `dept_id`) VALUES
(1, '菅原文太', 40, 1933, '001'),
(2, '千葉真一', 34, 1939, '002'),
(3, '北大路欣也', 30, 1943, '003'),
(4, '梶芽衣子', 26, 1947, '002');

-- --------------------------------------------------------

--
-- ビュー用の代替構造 `emp_v`
-- (実際のビューを参照するには下にあります)
--
CREATE TABLE `emp_v` (
`ID` int(11)
,`名前` varchar(20)
,`年齢` int(11)
,`部署名` varchar(20)
);

-- --------------------------------------------------------

--
-- テーブルの構造 `gender`
--

CREATE TABLE `gender` (
  `gid` char(1) NOT NULL,
  `gname` varchar(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- テーブルのデータのダンプ `gender`
--

INSERT INTO `gender` (`gid`, `gname`) VALUES
('0', '不明'),
('1', '男性'),
('2', '女性'),
('3', 'その他');

-- --------------------------------------------------------

--
-- テーブルの構造 `person`
--

CREATE TABLE `person` (
  `id` int(11) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `g_id` char(1) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `s_id` char(2) DEFAULT NULL,
  `c_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- テーブルのデータのダンプ `person`
--

INSERT INTO `person` (`id`, `name`, `g_id`, `birthday`, `s_id`, `c_id`) VALUES
(1, '染谷翔太', '1', '1992-09-03', '13', 2),
(2, '二階堂ふみ', '2', '1994-09-21', '47', 3),
(3, '渡辺哲', '1', '1950-03-11', '23', 4),
(4, '窪塚洋介', '1', '1979-05-07', '14', 1),
(5, '吉高由里子', '2', '1988-07-22', '13', 4);

-- --------------------------------------------------------

--
-- ビュー用の代替構造 `person_v`
-- (実際のビューを参照するには下にあります)
--
CREATE TABLE `person_v` (
`ID` int(11)
,`名前` varchar(20)
,`性別` varchar(3)
,`年齢` bigint(21)
,`出身` varchar(5)
,`コース` varchar(50)
);

-- --------------------------------------------------------

--
-- テーブルの構造 `state`
--

CREATE TABLE `state` (
  `sid` char(2) NOT NULL,
  `sname` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- テーブルのデータのダンプ `state`
--

INSERT INTO `state` (`sid`, `sname`) VALUES
('01', '北海道'),
('02', '青森県'),
('03', '岩手県'),
('04', '宮城県'),
('05', '秋田県'),
('06', '山形県'),
('07', '福島県'),
('08', '茨城県'),
('09', '栃木県'),
('10', '群馬県'),
('11', '埼玉県'),
('12', '千葉県'),
('13', '東京都'),
('14', '神奈川県'),
('15', '新潟県'),
('16', '富山県'),
('17', '石川県'),
('18', '福井県'),
('19', '山梨県'),
('20', '長野県'),
('21', '岐阜県'),
('22', '静岡県'),
('23', '愛知県'),
('24', '三重県'),
('25', '滋賀県'),
('26', '京都府'),
('27', '大阪府'),
('28', '兵庫県'),
('29', '奈良県'),
('30', '和歌山県'),
('31', '鳥取県'),
('32', '島根県'),
('33', '岡山県'),
('34', '広島県'),
('35', '山口県'),
('36', '徳島県'),
('37', '香川県'),
('38', '愛媛県'),
('39', '高知県'),
('40', '福岡県'),
('41', '佐賀県'),
('42', '長崎県'),
('43', '熊本県'),
('44', '大分県'),
('45', '宮崎県'),
('46', '鹿児島県'),
('47', '沖縄県');

-- --------------------------------------------------------

--
-- テーブルの構造 `student`
--

CREATE TABLE `student` (
  `id` char(3) NOT NULL,
  `name` varchar(20) NOT NULL,
  `age` int(11) DEFAULT NULL,
  `course` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- ビュー用の構造 `emp_v`
--
DROP TABLE IF EXISTS `emp_v`;

CREATE ALGORITHM=UNDEFINED DEFINER=`sampleuser`@`localhost` SQL SECURITY DEFINER VIEW `emp_v`  AS SELECT `emp`.`id` AS `ID`, `emp`.`name` AS `名前`, `emp`.`age` AS `年齢`, `dept`.`name` AS `部署名` FROM (`emp` join `dept` on((`emp`.`dept_id` = `dept`.`id`))) ORDER BY `emp`.`id` ASC ;

-- --------------------------------------------------------

--
-- ビュー用の構造 `person_v`
--
DROP TABLE IF EXISTS `person_v`;

CREATE ALGORITHM=UNDEFINED DEFINER=`sampleuser`@`localhost` SQL SECURITY DEFINER VIEW `person_v`  AS SELECT `p`.`id` AS `ID`, `p`.`name` AS `名前`, `g`.`gname` AS `性別`, timestampdiff(YEAR,`p`.`birthday`,curdate()) AS `年齢`, `s`.`sname` AS `出身`, `c`.`cname` AS `コース` FROM (((`person` `p` join `gender` `g` on((`p`.`g_id` = `g`.`gid`))) join `state` `s` on((`p`.`s_id` = `s`.`sid`))) join `course` `c` on((`p`.`c_id` = `c`.`cid`))) ;

--
-- ダンプしたテーブルのインデックス
--

--
-- テーブルのインデックス `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`cid`);

--
-- テーブルのインデックス `dept`
--
ALTER TABLE `dept`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `emp`
--
ALTER TABLE `emp`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_dept_id` (`dept_id`);

--
-- テーブルのインデックス `gender`
--
ALTER TABLE `gender`
  ADD PRIMARY KEY (`gid`);

--
-- テーブルのインデックス `person`
--
ALTER TABLE `person`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `state`
--
ALTER TABLE `state`
  ADD PRIMARY KEY (`sid`);

--
-- テーブルのインデックス `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_cid` (`course`);

--
-- ダンプしたテーブルの AUTO_INCREMENT
--

--
-- テーブルの AUTO_INCREMENT `course`
--
ALTER TABLE `course`
  MODIFY `cid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- テーブルの AUTO_INCREMENT `emp`
--
ALTER TABLE `emp`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- テーブルの AUTO_INCREMENT `person`
--
ALTER TABLE `person`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- ダンプしたテーブルの制約
--

--
-- テーブルの制約 `emp`
--
ALTER TABLE `emp`
  ADD CONSTRAINT `fk_dept_id` FOREIGN KEY (`dept_id`) REFERENCES `dept` (`id`);

--
-- テーブルの制約 `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `fk_cid` FOREIGN KEY (`course`) REFERENCES `course` (`cid`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
