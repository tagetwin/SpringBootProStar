-- --------------------------------------------------------
-- 호스트:                          127.0.0.1
-- 서버 버전:                        5.7.28-log - MySQL Community Server (GPL)
-- 서버 OS:                        Win64
-- HeidiSQL 버전:                  10.2.0.5599
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- 테이블 ynd.board 구조 내보내기
DROP TABLE IF EXISTS `board`;
CREATE TABLE IF NOT EXISTS `board` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  `starCount` int(11) NOT NULL DEFAULT '0',
  `fileName` varchar(300) CHARACTER SET utf8 DEFAULT NULL,
  `createDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `userId` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `userId` (`userId`),
  CONSTRAINT `userId` FOREIGN KEY (`userId`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- 테이블 데이터 ynd.board:~6 rows (대략적) 내보내기
DELETE FROM `board`;
/*!40000 ALTER TABLE `board` DISABLE KEYS */;
INSERT INTO `board` (`id`, `content`, `starCount`, `fileName`, `createDate`, `userId`) VALUES
	(3, 'content', 0, 'star3.png', '2020-02-20 11:32:36', 11),
	(4, '테스트 페이지입니다', 0, 'bee74612-e37f-45a0-8426-fda40fb1ed17Screenshot_2.png', '2020-02-20 12:33:13', 11),
	(5, '테스트 페이지입니다', 0, 'b8c9ff15-ba05-460d-906d-71b1ff65be66Screenshot_2.png', '2020-02-20 12:36:00', 11),
	(6, '라이언 테스트', 0, '9f8d9b58-9172-4cf4-b0d3-331b7a8b52dd87ebda101425d5992c306bbc6d2b6b05.jpg', '2020-02-20 14:34:41', 11),
	(7, '바탕화면 큰사진 테스트', 0, '669a6181-2dc8-438c-a1bd-b6783d19a17dmaxresdefault.jpg', '2020-02-20 14:37:14', 11),
	(8, '테스트 페이지입니다', 0, 'f4313f86-b5c1-4245-81eb-43207a88ca1aScreenshot_2.png', '2020-02-20 17:08:15', 14),
	(9, '바탕화면 큰사진 테스트', 0, '12ffe547-0b64-4fcb-9a05-e123120f2d03Screenshot_1.png', '2020-02-20 17:11:49', 14),
	(10, '바탕화면 큰사진 테스트', 0, '03aac406-5014-4cd1-b9f6-60eca985aa98Screenshot_1.png', '2020-02-20 17:12:20', 14),
	(11, '테스트 페이지입니다', 0, 'fc458f1a-8a3f-4050-a4b1-8d1620f18298Screenshot_1.png', '2020-02-20 17:14:49', 14),
	(12, '라이언이다', 0, '7f2346e4-c1dc-440b-8873-078e3b2f454087ebda101425d5992c306bbc6d2b6b05.jpg', '2020-02-20 17:17:05', 14);
/*!40000 ALTER TABLE `board` ENABLE KEYS */;

-- 테이블 ynd.comment 구조 내보내기
DROP TABLE IF EXISTS `comment`;
CREATE TABLE IF NOT EXISTS `comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  `userId` int(11) NOT NULL,
  `boardId` int(11) NOT NULL,
  `createDate` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `c.userId` (`userId`),
  KEY `c.boardId` (`boardId`),
  CONSTRAINT `c.boardId` FOREIGN KEY (`boardId`) REFERENCES `board` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `c.userId` FOREIGN KEY (`userId`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- 테이블 데이터 ynd.comment:~0 rows (대략적) 내보내기
DELETE FROM `comment`;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;

-- 테이블 ynd.favorite 구조 내보내기
DROP TABLE IF EXISTS `favorite`;
CREATE TABLE IF NOT EXISTS `favorite` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL DEFAULT '0',
  `boardId` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `f.userId` (`userId`),
  KEY `f.boardId` (`boardId`),
  CONSTRAINT `f.boardId` FOREIGN KEY (`boardId`) REFERENCES `board` (`id`),
  CONSTRAINT `f.userId` FOREIGN KEY (`userId`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- 테이블 데이터 ynd.favorite:~0 rows (대략적) 내보내기
DELETE FROM `favorite`;
/*!40000 ALTER TABLE `favorite` DISABLE KEYS */;
/*!40000 ALTER TABLE `favorite` ENABLE KEYS */;

-- 테이블 ynd.follow 구조 내보내기
DROP TABLE IF EXISTS `follow`;
CREATE TABLE IF NOT EXISTS `follow` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `followId` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fo.userId` (`userId`),
  KEY `fo.followId` (`followId`),
  CONSTRAINT `fo.followId` FOREIGN KEY (`followId`) REFERENCES `user` (`id`),
  CONSTRAINT `fo.userId` FOREIGN KEY (`userId`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- 테이블 데이터 ynd.follow:~1 rows (대략적) 내보내기
DELETE FROM `follow`;
/*!40000 ALTER TABLE `follow` DISABLE KEYS */;
INSERT INTO `follow` (`id`, `userId`, `followId`) VALUES
	(2, 11, 14);
/*!40000 ALTER TABLE `follow` ENABLE KEYS */;

-- 테이블 ynd.star 구조 내보내기
DROP TABLE IF EXISTS `star`;
CREATE TABLE IF NOT EXISTS `star` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) DEFAULT NULL,
  `boardId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `s.userId` (`userId`),
  KEY `s.boardId` (`boardId`),
  CONSTRAINT `s.boardId` FOREIGN KEY (`boardId`) REFERENCES `board` (`id`),
  CONSTRAINT `s.userId` FOREIGN KEY (`userId`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- 테이블 데이터 ynd.star:~0 rows (대략적) 내보내기
DELETE FROM `star`;
/*!40000 ALTER TABLE `star` DISABLE KEYS */;
/*!40000 ALTER TABLE `star` ENABLE KEYS */;

-- 테이블 ynd.user 구조 내보내기
DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8 NOT NULL,
  `password` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `phoneNum` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `profile` varchar(300) COLLATE utf8_unicode_ci DEFAULT 'star.png',
  `createDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `info` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `role` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'user',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- 테이블 데이터 ynd.user:~1 rows (대략적) 내보내기
DELETE FROM `user`;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`id`, `username`, `password`, `email`, `phoneNum`, `profile`, `createDate`, `info`, `role`) VALUES
	(11, 'ssar', '$2a$10$ilNIwg6lsiwIPo.8ACd1u.JfFdtGBgUSrdRBCjNpNpvStXzNf/9Qy', 'ssar@nate.com', NULL, 'star3.png', '2020-02-20 09:01:23', '안녕하세요 ssar입니다. 잘부탁드립니다.', 'user'),
	(13, 'yndg', '$2a$10$.3qozH2h33FpMEx.hJplC.GczkuBU.aA0ijVJOmowWYajSmjN5uvK', 'yndg@nate.com', NULL, 'star.png', '2020-02-20 15:18:25', NULL, 'user'),
	(14, 'ynd', '$2a$10$jIGbO5PJwcDRqQrnA./6ROSGiEKKlGhyqAU8PvB0nDrFH3zFKueDG', 'ynd@nate.com', NULL, 'star.png', '2020-02-20 17:00:04', NULL, 'user');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
