# Springboot-Blog
## 1. 개발 환경
* Springboot
* MyBatis
* MySQL
* JSP
* Spring Security
* Lombok

## 2. 요구사항(기능)
* 회원가입
* 로그인
* 게시글 등록
* 게시글 수정
* 게시글 삭제
* 게시글 목록
* 게시글 상세보기
* 게시글 페이징
* 게시글 검색
* 게시글 권한관리
* 댓글 등록
* 댓글 삭제
* 프로필 사진 업로드
* 본문 사진 업로드
* 좋아요 기능
* 팔로우 기능
* 책갈피 기능

## 3. 테이블

```sql
create database ynd;
create user ynd@'%' identified by '1234';
grant all privileges on ynd.* to 'ynd'@'%';
```

```sql
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8 NOT NULL,
  `password` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `phoneNum` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `profile` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL,
  `createDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `role` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'user',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `phoneNum` (`phoneNum`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
```

```sql
CREATE TABLE IF NOT EXISTS `board` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  `starCount` int(11) NOT NULL DEFAULT '0',
  `fileName` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL,
  `createDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `userId` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `userId` (`userId`),
  CONSTRAINT `userId` FOREIGN KEY (`userId`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
```

```sql
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
```

```sql
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
```

```sql
CREATE TABLE IF NOT EXISTS `follow` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `followId` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fo.userId` (`userId`),
  KEY `fo.followId` (`followId`),
  CONSTRAINT `fo.followId` FOREIGN KEY (`followId`) REFERENCES `user` (`id`),
  CONSTRAINT `fo.userId` FOREIGN KEY (`userId`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
```

```sql
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
```
