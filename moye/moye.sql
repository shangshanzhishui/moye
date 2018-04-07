-- MySQL dump 10.13  Distrib 5.7.21, for Linux (x86_64)
--
-- Host: localhost    Database: moye
-- ------------------------------------------------------
-- Server version	5.7.21-0ubuntu0.17.10.1

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permissi_content_type_id_2f476e4b_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add 用户信息',7,'add_userprofile'),(20,'Can change 用户信息',7,'change_userprofile'),(21,'Can delete 用户信息',7,'delete_userprofile'),(22,'Can add 邮箱验证',8,'add_emailverifyrecord'),(23,'Can change 邮箱验证',8,'change_emailverifyrecord'),(24,'Can delete 邮箱验证',8,'delete_emailverifyrecord'),(25,'Can add 轮播图',9,'add_banner'),(26,'Can change 轮播图',9,'change_banner'),(27,'Can delete 轮播图',9,'delete_banner'),(28,'Can add 课程',10,'add_couse'),(29,'Can change 课程',10,'change_couse'),(30,'Can delete 课程',10,'delete_couse'),(31,'Can add 课程',11,'add_lesson'),(32,'Can change 课程',11,'change_lesson'),(33,'Can delete 课程',11,'delete_lesson'),(34,'Can add 视频',12,'add_video'),(35,'Can change 视频',12,'change_video'),(36,'Can delete 视频',12,'delete_video'),(37,'Can add 课程资源',13,'add_courseresource'),(38,'Can change 课程资源',13,'change_courseresource'),(39,'Can delete 课程资源',13,'delete_courseresource'),(40,'Can add 课程咨询',14,'add_userask'),(41,'Can change 课程咨询',14,'change_userask'),(42,'Can delete 课程咨询',14,'delete_userask'),(43,'Can add 课程评论',15,'add_coursecommets'),(44,'Can change 课程评论',15,'change_coursecommets'),(45,'Can delete 课程评论',15,'delete_coursecommets'),(46,'Can add 用户收藏',16,'add_userfavorite'),(47,'Can change 用户收藏',16,'change_userfavorite'),(48,'Can delete 用户收藏',16,'delete_userfavorite'),(49,'Can add 用户消息',17,'add_usermessage'),(50,'Can change 用户消息',17,'change_usermessage'),(51,'Can delete 用户消息',17,'delete_usermessage'),(52,'Can add 用户课程',18,'add_usercourse'),(53,'Can change 用户课程',18,'change_usercourse'),(54,'Can delete 用户课程',18,'delete_usercourse'),(55,'Can add 城市',19,'add_citydict'),(56,'Can change 城市',19,'change_citydict'),(57,'Can delete 城市',19,'delete_citydict'),(58,'Can add 课程机构',20,'add_courseorg'),(59,'Can change 课程机构',20,'change_courseorg'),(60,'Can delete 课程机构',20,'delete_courseorg'),(61,'Can add 教师',21,'add_techer'),(62,'Can change 教师',21,'change_techer'),(63,'Can delete 教师',21,'delete_techer'),(64,'Can view log entry',1,'view_logentry'),(65,'Can view group',3,'view_group'),(66,'Can view permission',2,'view_permission'),(67,'Can view content type',5,'view_contenttype'),(68,'Can view 课程资源',13,'view_courseresource'),(69,'Can view 课程',10,'view_couse'),(70,'Can view 课程',11,'view_lesson'),(71,'Can view 视频',12,'view_video'),(72,'Can view 课程评论',15,'view_coursecommets'),(73,'Can view 课程咨询',14,'view_userask'),(74,'Can view 用户课程',18,'view_usercourse'),(75,'Can view 用户收藏',16,'view_userfavorite'),(76,'Can view 用户消息',17,'view_usermessage'),(77,'Can view 城市',19,'view_citydict'),(78,'Can view 课程机构',20,'view_courseorg'),(79,'Can view 教师',21,'view_techer'),(80,'Can view session',6,'view_session'),(81,'Can view 轮播图',9,'view_banner'),(82,'Can view 邮箱验证',8,'view_emailverifyrecord'),(83,'Can view 用户信息',7,'view_userprofile'),(84,'Can add Bookmark',22,'add_bookmark'),(85,'Can change Bookmark',22,'change_bookmark'),(86,'Can delete Bookmark',22,'delete_bookmark'),(87,'Can add User Setting',23,'add_usersettings'),(88,'Can change User Setting',23,'change_usersettings'),(89,'Can delete User Setting',23,'delete_usersettings'),(90,'Can add User Widget',24,'add_userwidget'),(91,'Can change User Widget',24,'change_userwidget'),(92,'Can delete User Widget',24,'delete_userwidget'),(93,'Can view Bookmark',22,'view_bookmark'),(94,'Can view User Setting',23,'view_usersettings'),(95,'Can view User Widget',24,'view_userwidget'),(96,'Can add log entry',25,'add_log'),(97,'Can change log entry',25,'change_log'),(98,'Can delete log entry',25,'delete_log'),(99,'Can view log entry',25,'view_log'),(100,'Can add captcha store',26,'add_captchastore'),(101,'Can change captcha store',26,'change_captchastore'),(102,'Can delete captcha store',26,'delete_captchastore'),(103,'Can view captcha store',26,'view_captchastore');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `captcha_captchastore`
--

DROP TABLE IF EXISTS `captcha_captchastore`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `captcha_captchastore` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `challenge` varchar(32) NOT NULL,
  `response` varchar(32) NOT NULL,
  `hashkey` varchar(40) NOT NULL,
  `expiration` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `hashkey` (`hashkey`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `captcha_captchastore`
--

LOCK TABLES `captcha_captchastore` WRITE;
/*!40000 ALTER TABLE `captcha_captchastore` DISABLE KEYS */;
INSERT INTO `captcha_captchastore` VALUES (46,'IFNJ','ifnj','7afa21eedeeeffbdb6a4aee5b397d4e359e113dd','2018-03-12 23:16:34.218898'),(47,'DZUU','dzuu','06454314ff14265938fbc63e4bfb652445a350e0','2018-03-12 23:16:37.174565'),(48,'DLWQ','dlwq','0755cee0b635ebd98b90ca7887cb129b828e42a0','2018-03-12 23:16:40.997321'),(49,'AVPR','avpr','1744fa8f1446a2e875c7cb3dab9144d1fbce5ac0','2018-03-12 23:16:44.469139'),(50,'ANUD','anud','345d8d3177b769f2e9d2e3d964b46b10a238e01b','2018-03-12 23:16:47.078020'),(51,'JVSS','jvss','34c79574c2550e633025d048722e61b516ba12db','2018-03-12 23:16:47.804770'),(54,'XNFA','xnfa','b20248ae41bd744b0fcfd8aa15403e6d7d1f4c61','2018-03-12 23:18:20.190840'),(55,'KRYN','kryn','5922dd7afb5893fd854c126c34b43b64adf569a3','2018-03-12 23:19:16.835113'),(56,'EXIH','exih','3e663cccd2fed754abdbffe8952182c2f3b8f89f','2018-03-12 23:19:19.823848'),(57,'ANII','anii','dd78112f97a94ea3a22e8b343cf8940abf075425','2018-03-12 23:19:22.998583');
/*!40000 ALTER TABLE `captcha_captchastore` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courses_courseresource`
--

DROP TABLE IF EXISTS `courses_courseresource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `courses_courseresource` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `download` varchar(100) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `course_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `courses_courseresource_ea134da7` (`course_id`),
  CONSTRAINT `courses_courseresource_course_id_5eba1332_fk_courses_couse_id` FOREIGN KEY (`course_id`) REFERENCES `courses_couse` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses_courseresource`
--

LOCK TABLES `courses_courseresource` WRITE;
/*!40000 ALTER TABLE `courses_courseresource` DISABLE KEYS */;
INSERT INTO `courses_courseresource` VALUES (1,'好资源','course/resource/2018/03/sy.jpg','2018-03-09 21:55:00.000000',1),(2,'大佬的照片','course/resource/2018/03/gs.jpeg','2018-03-09 22:17:00.000000',1);
/*!40000 ALTER TABLE `courses_courseresource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courses_couse`
--

DROP TABLE IF EXISTS `courses_couse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `courses_couse` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `desc` varchar(300) NOT NULL,
  `detail` longtext NOT NULL,
  `degree` varchar(30) NOT NULL,
  `learn_time` int(10) unsigned NOT NULL,
  `students` int(10) unsigned NOT NULL,
  `fans_num` int(10) unsigned NOT NULL,
  `image` varchar(100) NOT NULL,
  `click_nums` int(10) unsigned NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `courseorg_id` int(11) NOT NULL,
  `category` varchar(50) NOT NULL,
  `tag` varchar(50) NOT NULL,
  `teacher_id` int(11),
  `course_known` varchar(300) NOT NULL,
  `teacher_tell` varchar(300) NOT NULL,
  `is_banner` tinyint(1) NOT NULL,
  `is_classic` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `courses_couse_cc807227` (`courseorg_id`),
  KEY `courses_couse_d9614d40` (`teacher_id`),
  CONSTRAINT `courses_couse_teacher_id_0b80d7f5_fk_organization_techer_id` FOREIGN KEY (`teacher_id`) REFERENCES `organization_techer` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses_couse`
--

LOCK TABLES `courses_couse` WRITE;
/*!40000 ALTER TABLE `courses_couse` DISABLE KEYS */;
INSERT INTO `courses_couse` VALUES (1,'仙法木遁·真数千手·顶上化仏','使用树木攻击','初代目火影千手柱间的木遁仙术之一，也是柱间最强的招式。仅在“仙人模式”下才能使用，变化出极其巨大的千手佛像进行攻击或防御，体型比九尾还要大出十数倍，一只手就可以捏住九尾，体积与十尾相近。','gj',100,10001,100000,'course/2018/03/md_zsqs.jpg',1000068,'2018-03-07 11:31:00.000000',3,'忍术','木遁',21,'银河以内志颖最美银河以内志颖最美银河以内志颖最美银河以内志颖最美银河以内志颖最美','银河以内志颖最美银河以内志颖最美银河以内志颖最美银河以内志颖最美银河以内志颖最美银河以内志颖最美银河以内志颖最美银河以内志颖最美银河以内志颖最美银河以内志颖最美',0,0),(2,'螺旋手里剑','风属性查克拉','风遁的特征是结印最后通常以辰印结尾，风遁属性的查克拉宛如锋利的刀刃一样，风遁的组成元素多半是由大量微型的查克拉刃组成，用于查克拉刀刃上则会使切割力发挥到极致，属于切割类型的查克拉。\r\n风遁是拥有风属性查克拉的人才能使用的招数，风遁忍术很适合进行近身战，将各式各样的东西撕裂切碎，有如刀刃一般的查克拉，能作用在特殊的忍具或是忍术上，在近中距离的攻击具作最强的攻击力。\r\n风能克雷但被火克。它能够以切割力打败雷，但能让火烧得更厉害','gj',10000,1000000,100000,'course/2018/03/fd_slj.jpg',10004,'2018-03-07 13:20:00.000000',3,'忍术','风遁',6,'银河以内志颖最美银河以内志颖最美银河以内志颖最美银河以内志颖最美银河以内志颖最美','银河以内志颖最美银河以内志颖最美银河以内志颖最美银河以内志颖最美银河以内志颖最美银河以内志颖最美银河以内志颖最美银河以内志颖最美银河以内志颖最美银河以内志颖最美',0,0),(3,'麒麟','使用雷属性查克拉','。这种忍术需使用雷属性查克拉，在近身战斗中，可以有效和体术配合。\r\n雷遁忍术的原理是将查克拉集中在身体的某个部位，再通过性质变化产生雷电，借以施展雷遁忍术。雷遁克土遁，但被风遁克制。','gj',100000,100000,100000,'course/2018/03/ld_.jpeg',3,'2018-03-07 13:23:00.000000',4,'忍术','雷遁',7,'银河以内志颖最美银河以内志颖最美银河以内志颖最美银河以内志颖最美银河以内志颖最美','银河以内志颖最美银河以内志颖最美银河以内志颖最美银河以内志颖最美银河以内志颖最美银河以内志颖最美银河以内志颖最美银河以内志颖最美银河以内志颖最美银河以内志颖最美',0,0),(4,'水阵壁','使用水属性查克拉','通过凝聚水属性查克拉来进行攻击或者防御，一般需要在水源附近才能使用。较为出色的水遁忍者有鬼人桃地再不斩，干柿鬼鲛。二代火影，水影照美冥使水遁到了一个巅峰。','gj',100000,10000,10000,'course/2018/03/sd_slb.jpg',10002,'2018-03-07 13:24:00.000000',7,'忍术','水遁',15,'银河以内志颖最美银河以内志颖最美银河以内志颖最美银河以内志颖最美银河以内志颖最美','银河以内志颖最美银河以内志颖最美银河以内志颖最美银河以内志颖最美银河以内志颖最美银河以内志颖最美银河以内志颖最美银河以内志颖最美银河以内志颖最美银河以内志颖最美',0,1),(5,'土龙弹','土属性查克拉','特征是结印最后通常为巳印，和雷遁相比处于劣势，和水遁相比处于优势。土遁忍术是岩隐村最擅长的忍术之一，除了土影以外，村子中的人也大多擅长土遁，赤土、黄土等更是其中的佼佼者。','gj',1000,100000,100000,'course/2018/03/td_tld.jpeg',100001,'2018-03-07 13:26:00.000000',3,'忍术','土遁',14,'银河以内志颖最美银河以内志颖最美银河以内志颖最美银河以内志颖最美银河以内志颖最美','银河以内志颖最美银河以内志颖最美银河以内志颖最美银河以内志颖最美银河以内志颖最美银河以内志颖最美银河以内志颖最美银河以内志颖最美银河以内志颖最美银河以内志颖最美',1,0),(6,'幻术','精神攻击','幻术作为一种精神攻击是忍者必备的三种技能（忍术、体术、幻术）。幻术是以扰乱对手精神思想，导致掌握五种感官（五感）感觉异常使其陷入幻觉的世界。','gj',10000,10002,10000,'course/2018/03/hs.jpeg',1014,'2018-03-07 13:29:00.000000',1,'幻术','幻术',7,'志颖美如画志颖美如画志颖美如画志颖美如画志颖美如画志颖美如画志颖美如画志颖美如画志颖美如画','志颖美如画志颖美如画志颖美如画志颖美如画志颖美如画志颖美如画',0,1),(7,'手里剑','忍具使用','日本古武术中的手里剑，即类似于中国传统武术中飞镖、飞刀一类的暗器，靠手劲及腕力投掷伤敌。一般被认为多为忍术及忍者使用，但其实除了一部份跟忍术有关的流派外，很多综合古武术流派和一些剑术的流派中也包含有手里剑术，例如柳生新阴流、香取神道流和竹内流等古流中就都有手里剑的技术。','cj',1000,1000,1000,'course/2018/03/rj_slj.jpg',100000,'2018-03-07 13:31:00.000000',3,'忍具','忍具',7,'志颖美如画志颖美如画志颖美如画志颖美如画志颖美如画志颖美如画','志颖美如画志颖美如画志颖美如画志颖美如画志颖美如画志颖美如画',0,0),(8,'苦无','忍具的使用','苦无,或称苦内，是日本忍者经常使用的小型武具。形状如一把短剑或峨嵋刺，多以铁制，体积短小，容易携带及藏匿。\r\n另外有一种更小型的苦无，用法是类近于手里剑的飞行型道具，名叫“飞苦无”（とびくない）。由于其形状尖长，不像手里剑般可以旋转力量掷出，所以命中亦比较困难，使用飞苦无的忍者大多拥有高超的掷准技能。','cj',1000,100000,10000,'course/2018/03/ku.jpg',10000,'2018-03-07 13:33:00.000000',3,'忍具','忍具',11,'志颖美如画志颖美如画志颖美如画志颖美如画志颖美如画志颖美如画','志颖美如画志颖美如画志颖美如画志颖美如画志颖美如画志颖美如画',0,0),(9,'初级体术','依靠身体动作','依靠身体进行直接攻击，不需要结印也能发动，而且一般的体术也不需要消耗查克拉。对于能够吸收查克拉或者可以使得忍术无效化的敌人来说，体术是击败他们最有效的方法。','cj',10000,10000,10000,'course/2018/03/cjts.jpeg',100,'2018-03-07 13:35:00.000000',3,'体术','体术',3,'次课程,太牛逼,你会走入人生巅峰','让我带你装逼带你飞',0,0),(10,'中级体术','依靠身体和忍具战斗','依靠身体进行直接攻击，不需要结印也能发动，而且一般的体术也不需要消耗查克拉。对于能够吸收查克拉或者可以使得忍术无效化的敌人来说，体术是击败他们最有效的方法。','zj',1000,10000,10000,'course/2018/03/zjtishu.jpg',1004,'2018-03-07 13:39:00.000000',4,'体术','体术',16,'志颖美如画志颖美如画志颖美如画志颖美如画志颖美如画志颖美如画','志颖美如画志颖美如画志颖美如画志颖美如画志颖美如画志颖美如画志颖美如画志颖美如画志颖美如画志颖美如画',0,1),(11,'高级体术(八门遁甲）','终极体术','八门遁甲，此术是《火影忍者》中的最顶级体术。八门全开可以解开人体中的一切限制，又叫“八门遁甲之阵”，此时会获得超越五影的力量。\r\n但这股力量只是暂时的，八门全开会严重损害身体，其效果类似于燃烧自身化成火红色，事后没鸣人以六道之力的阴阳遁解 ，为其重新注入生命力的话，则使用者会化为灰烬必死。 凯在最后一刻用尽全身力量，向斑踢去，由于鸣人来的太晚，导致一只脚化为飞灰残废。','gj',100000,1000,1000000,'course/2018/03/gjts.jpg',100003,'2018-03-07 13:40:00.000000',3,'体术','体术',16,'志颖美如画志颖美如画志颖美如画志颖美如画志颖美如画志颖美如画志颖美如画志颖美如画志颖美如画','志颖美如画志颖美如画志颖美如画志颖美如画志颖美如画志颖美如画',0,1),(12,'树界降临','牛逼到爆','仙法','gj',16160,9874,87946,'course/2018/03/md_sjjl_9TXBqIk.jpg',10040,'2018-03-09 14:38:00.000000',3,'忍术','木遁',21,'次课程,太牛逼,你会走入人生巅峰','让我带你装逼带你飞',1,1),(13,'神罗天征','牛逼到爆','轮回眼的能力之一。以自己为中心将周围的一切物体弹开，如果聚集巨大查克拉的话甚至可以一击毁灭一个忍者村。以天道为中心制造斥力场，产生类似斥的能力。\r\n神罗天征的斥力越大，范围越广，消耗的查克拉越多。神罗天征使用一次后至少有五秒的冷却时间，术的范围力量越大，冷却时间越久。','gj',999,99999,9999,'course/2018/03/sltz.jpg',94867,'2018-03-12 17:58:00.000000',1,'忍术','神罗天征 忍术',1,'雏田美如画','你准备好，我牛逼起来，在座的各位都是垃圾',0,1),(14,'地爆天星','6666到没朋友','血继限界轮回眼的能力之一，是对引力控制达到极致且会对周围环境造成巨大破坏的忍术，不是轮回眼的开眼者，或者没有千手和宇智波双方的力量的人使用会对使用者照成极大的伤害。首先在双手之间制造出黑色球体，接着将其一放从而使黑球自动漂浮于空中，然后双手合十，当黑球上升到一定的高度的时候就会产生极强的引力，这时一定范围内的地面将会逐渐崩裂，然后数量众多且大小不一的岩石都会渐渐地吸引到球体上，最终形成一个类似巨大陨石的漂浮球体。而且，还可以将指定目标吸引至球体内部，使其在引力的作用下丧失行动力。','gj',9999,89895,78940,'course/2018/03/dbtx.jpg',88898,'2018-03-12 18:47:00.000000',1,'忍术','地爆天星',1,'此术有危险，放心学','你是鳖鳖',0,1);
/*!40000 ALTER TABLE `courses_couse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courses_lesson`
--

DROP TABLE IF EXISTS `courses_lesson`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `courses_lesson` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `course_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `courses_lesson_course_id_16bc4882_fk_courses_couse_id` (`course_id`),
  CONSTRAINT `courses_lesson_course_id_16bc4882_fk_courses_couse_id` FOREIGN KEY (`course_id`) REFERENCES `courses_couse` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses_lesson`
--

LOCK TABLES `courses_lesson` WRITE;
/*!40000 ALTER TABLE `courses_lesson` DISABLE KEYS */;
INSERT INTO `courses_lesson` VALUES (1,'树界降临','2018-03-07 13:44:00.000000',1),(2,'第一章 检验是否拥有木属性查克拉','2018-03-09 19:34:00.000000',12),(3,'第二章 讲解木遁','2018-03-09 19:36:00.000000',12),(4,'第三章 练习使用木遁','2018-03-09 19:37:00.000000',12),(5,'第四章 树界降临','2018-03-09 19:37:00.000000',12),(6,'第一章 练习体力','2018-03-09 21:22:00.000000',11),(7,'第二章 八门遁甲','2018-03-09 21:22:00.000000',11);
/*!40000 ALTER TABLE `courses_lesson` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courses_video`
--

DROP TABLE IF EXISTS `courses_video`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `courses_video` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `lesson_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `courses_video_lesson_id_59f2396e_fk_courses_lesson_id` (`lesson_id`),
  CONSTRAINT `courses_video_lesson_id_59f2396e_fk_courses_lesson_id` FOREIGN KEY (`lesson_id`) REFERENCES `courses_lesson` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses_video`
--

LOCK TABLES `courses_video` WRITE;
/*!40000 ALTER TABLE `courses_video` DISABLE KEYS */;
INSERT INTO `courses_video` VALUES (1,'树界降临','2018-03-09 19:38:00.000000',5),(2,'检验是否拥有木属性查克拉','2018-03-09 19:46:00.000000',2),(3,'木遁与阿','2018-03-09 19:47:00.000000',3),(4,'木遁展示','2018-03-09 19:47:00.000000',4),(5,'爬山','2018-03-09 21:23:00.000000',6),(6,'惊门开','2018-03-09 21:24:00.000000',7),(7,'第一章 木属性查克拉','2018-03-09 21:27:00.000000',1);
/*!40000 ALTER TABLE `courses_video` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(26,'captcha','captchastore'),(5,'contenttypes','contenttype'),(13,'courses','courseresource'),(10,'courses','couse'),(11,'courses','lesson'),(12,'courses','video'),(15,'operation','coursecommets'),(14,'operation','userask'),(18,'operation','usercourse'),(16,'operation','userfavorite'),(17,'operation','usermessage'),(19,'organization','citydict'),(20,'organization','courseorg'),(21,'organization','techer'),(6,'sessions','session'),(9,'users','banner'),(8,'users','emailverifyrecord'),(7,'users','userprofile'),(22,'xadmin','bookmark'),(25,'xadmin','log'),(23,'xadmin','usersettings'),(24,'xadmin','userwidget');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2018-03-05 01:43:35.906611'),(2,'auth','0001_initial','2018-03-05 01:43:43.508433'),(3,'admin','0001_initial','2018-03-05 01:43:45.230595'),(4,'admin','0002_logentry_remove_auto_add','2018-03-05 01:43:45.340337'),(5,'contenttypes','0002_remove_content_type_name','2018-03-05 01:43:46.298445'),(6,'auth','0002_alter_permission_name_max_length','2018-03-05 01:43:46.980146'),(7,'auth','0003_alter_user_email_max_length','2018-03-05 01:43:47.643294'),(8,'auth','0004_alter_user_username_opts','2018-03-05 01:43:47.691908'),(9,'auth','0005_alter_user_last_login_null','2018-03-05 01:43:48.198512'),(10,'auth','0006_require_contenttypes_0002','2018-03-05 01:43:48.232394'),(11,'auth','0007_alter_validators_add_error_messages','2018-03-05 01:43:48.280788'),(12,'sessions','0001_initial','2018-03-05 01:43:48.785647'),(13,'users','0001_initial','2018-03-05 02:14:25.292043'),(14,'users','0002_banner_emailverifyrecord','2018-03-05 04:31:40.368857'),(15,'courses','0001_initial','2018-03-05 04:38:05.825691'),(16,'operation','0001_initial','2018-03-05 04:38:10.618527'),(17,'organization','0001_initial','2018-03-05 04:38:12.634752'),(18,'users','0003_auto_20180305_0524','2018-03-05 05:24:23.366135'),(19,'xadmin','0001_initial','2018-03-05 13:51:04.295022'),(20,'xadmin','0002_log','2018-03-05 15:05:25.029935'),(21,'xadmin','0003_auto_20160715_0100','2018-03-05 15:05:25.842696'),(22,'captcha','0001_initial','2018-03-06 09:35:33.952981'),(23,'organization','0002_courseorg_catgory','2018-03-07 11:01:01.112657'),(24,'courses','0002_auto_20180307_1131','2018-03-07 11:31:26.343329'),(25,'organization','0003_courseorg_students','2018-03-07 19:46:51.351718'),(26,'courses','0003_couse_courseorg','2018-03-08 08:11:48.316620'),(27,'organization','0004_courseorg_course_num','2018-03-08 09:49:22.730431'),(28,'organization','0005_techer_image','2018-03-08 15:21:19.539980'),(29,'courses','0004_couse_category','2018-03-09 10:25:01.260289'),(30,'courses','0005_couse_tag','2018-03-09 11:22:04.662486'),(31,'courses','0006_auto_20180309_2211','2018-03-09 22:12:47.701401'),(32,'courses','0007_auto_20180309_2226','2018-03-09 22:26:46.116063'),(33,'operation','0002_auto_20180311_2150','2018-03-11 21:51:31.425180'),(34,'courses','0008_couse_is_banner','2018-03-12 11:39:25.716513'),(35,'users','0004_auto_20180312_1155','2018-03-12 11:56:09.576294'),(36,'organization','0006_courseorg_tag','2018-03-12 13:54:24.918091'),(37,'courses','0009_couse_is_classic','2018-03-12 17:49:14.296722');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('dvnbhlv7le2k34cugbdxv98yn4q6ujj7','NjUxNzQxNjk3NDFkMzM0NzA1ZTMxZGQ2YzNjNTk5ODI1MjY3NTkxNzp7Im5hdl9tZW51IjoiW3tcIm1lbnVzXCI6IFt7XCJ1cmxcIjogXCIveGFkbWluL29yZ2FuaXphdGlvbi9jaXR5ZGljdC9cIiwgXCJpY29uXCI6IG51bGwsIFwib3JkZXJcIjogMTYsIFwidGl0bGVcIjogXCJcdTU3Y2VcdTVlMDJcIn0sIHtcInVybFwiOiBcIi94YWRtaW4vb3JnYW5pemF0aW9uL2NvdXJzZW9yZy9cIiwgXCJpY29uXCI6IG51bGwsIFwib3JkZXJcIjogMTcsIFwidGl0bGVcIjogXCJcdThiZmVcdTdhMGJcdTY3M2FcdTY3ODRcIn0sIHtcInVybFwiOiBcIi94YWRtaW4vb3JnYW5pemF0aW9uL3RlY2hlci9cIiwgXCJpY29uXCI6IG51bGwsIFwib3JkZXJcIjogMTgsIFwidGl0bGVcIjogXCJcdTY1NTlcdTVlMDhcIn1dLCBcImZpcnN0X3VybFwiOiBcIi94YWRtaW4vb3JnYW5pemF0aW9uL2NvdXJzZW9yZy9cIiwgXCJ0aXRsZVwiOiBcIlx1NjczYVx1Njc4NFx1N2VjNFx1N2VjN1wifSwge1wibWVudXNcIjogW3tcInVybFwiOiBcIi94YWRtaW4vdXNlcnMvdXNlcnByb2ZpbGUvXCIsIFwiaWNvblwiOiBcImZhIGZhLXVzZXJcIiwgXCJvcmRlclwiOiAzLCBcInRpdGxlXCI6IFwiXHU3NTI4XHU2MjM3XHU0ZmUxXHU2MDZmXCJ9LCB7XCJ1cmxcIjogXCIveGFkbWluL3VzZXJzL2Jhbm5lci9cIiwgXCJpY29uXCI6IG51bGwsIFwib3JkZXJcIjogNSwgXCJ0aXRsZVwiOiBcIlx1OGY2ZVx1NjRhZFx1NTZmZVwifSwge1widXJsXCI6IFwiL3hhZG1pbi91c2Vycy9lbWFpbHZlcmlmeXJlY29yZC9cIiwgXCJpY29uXCI6IG51bGwsIFwib3JkZXJcIjogNiwgXCJ0aXRsZVwiOiBcIlx1OTBhZVx1N2JiMVx1OWE4Y1x1OGJjMVwifV0sIFwiZmlyc3RfaWNvblwiOiBcImZhIGZhLXVzZXJcIiwgXCJmaXJzdF91cmxcIjogXCIveGFkbWluL3VzZXJzL2Jhbm5lci9cIiwgXCJ0aXRsZVwiOiBcIlx1NzUyOFx1NjIzN1x1NGZlMVx1NjA2ZlwifSwge1wibWVudXNcIjogW3tcInVybFwiOiBcIi94YWRtaW4vb3BlcmF0aW9uL3VzZXJhc2svXCIsIFwiaWNvblwiOiBudWxsLCBcIm9yZGVyXCI6IDExLCBcInRpdGxlXCI6IFwiXHU4YmZlXHU3YTBiXHU1NGE4XHU4YmUyXCJ9LCB7XCJ1cmxcIjogXCIveGFkbWluL29wZXJhdGlvbi9jb3Vyc2Vjb21tZXRzL1wiLCBcImljb25cIjogbnVsbCwgXCJvcmRlclwiOiAxMiwgXCJ0aXRsZVwiOiBcIlx1OGJmZVx1N2EwYlx1OGJjNFx1OGJiYVwifSwge1widXJsXCI6IFwiL3hhZG1pbi9vcGVyYXRpb24vdXNlcmZhdm9yaXRlL1wiLCBcImljb25cIjogbnVsbCwgXCJvcmRlclwiOiAxMywgXCJ0aXRsZVwiOiBcIlx1NzUyOFx1NjIzN1x1NjUzNlx1ODVjZlwifSwge1widXJsXCI6IFwiL3hhZG1pbi9vcGVyYXRpb24vdXNlcm1lc3NhZ2UvXCIsIFwiaWNvblwiOiBudWxsLCBcIm9yZGVyXCI6IDE0LCBcInRpdGxlXCI6IFwiXHU3NTI4XHU2MjM3XHU2ZDg4XHU2MDZmXCJ9LCB7XCJ1cmxcIjogXCIveGFkbWluL29wZXJhdGlvbi91c2VyY291cnNlL1wiLCBcImljb25cIjogbnVsbCwgXCJvcmRlclwiOiAxNSwgXCJ0aXRsZVwiOiBcIlx1NzUyOFx1NjIzN1x1OGJmZVx1N2EwYlwifV0sIFwiZmlyc3RfdXJsXCI6IFwiL3hhZG1pbi9vcGVyYXRpb24vdXNlcm1lc3NhZ2UvXCIsIFwidGl0bGVcIjogXCJcdTc1MjhcdTYyMzdcdTY0Y2RcdTRmNWNcIn0sIHtcIm1lbnVzXCI6IFt7XCJ1cmxcIjogXCIveGFkbWluL3hhZG1pbi9sb2cvXCIsIFwiaWNvblwiOiBcImZhIGZhLWNvZ1wiLCBcIm9yZGVyXCI6IDIwLCBcInRpdGxlXCI6IFwiXHU2NWU1XHU1ZmQ3XHU4YmIwXHU1ZjU1XCJ9XSwgXCJmaXJzdF9pY29uXCI6IFwiZmEgZmEtY29nXCIsIFwiZmlyc3RfdXJsXCI6IFwiL3hhZG1pbi94YWRtaW4vbG9nL1wiLCBcInRpdGxlXCI6IFwiXHU3YmExXHU3NDA2XCJ9LCB7XCJtZW51c1wiOiBbe1widXJsXCI6IFwiL3hhZG1pbi9hdXRoL2dyb3VwL1wiLCBcImljb25cIjogXCJmYSBmYS1ncm91cFwiLCBcIm9yZGVyXCI6IDIsIFwidGl0bGVcIjogXCJcdTdlYzRcIn0sIHtcInVybFwiOiBcIi94YWRtaW4vYXV0aC9wZXJtaXNzaW9uL1wiLCBcImljb25cIjogXCJmYSBmYS1sb2NrXCIsIFwib3JkZXJcIjogNCwgXCJ0aXRsZVwiOiBcIlx1Njc0M1x1OTY1MFwifV0sIFwiZmlyc3RfaWNvblwiOiBcImZhIGZhLWxvY2tcIiwgXCJmaXJzdF91cmxcIjogXCIveGFkbWluL2F1dGgvcGVybWlzc2lvbi9cIiwgXCJ0aXRsZVwiOiBcIlx1OGJhNFx1OGJjMVx1NTQ4Y1x1NjM4OFx1Njc0M1wifSwge1wibWVudXNcIjogW3tcInVybFwiOiBcIi94YWRtaW4vY291cnNlcy9jb3VzZS9cIiwgXCJpY29uXCI6IG51bGwsIFwib3JkZXJcIjogNywgXCJ0aXRsZVwiOiBcIlx1OGJmZVx1N2EwYlwifSwge1widXJsXCI6IFwiL3hhZG1pbi9jb3Vyc2VzL2xlc3Nvbi9cIiwgXCJpY29uXCI6IG51bGwsIFwib3JkZXJcIjogOCwgXCJ0aXRsZVwiOiBcIlx1N2FlMFx1ODI4MlwifSwge1widXJsXCI6IFwiL3hhZG1pbi9jb3Vyc2VzL3ZpZGVvL1wiLCBcImljb25cIjogbnVsbCwgXCJvcmRlclwiOiA5LCBcInRpdGxlXCI6IFwiXHU4OWM2XHU5ODkxXCJ9LCB7XCJ1cmxcIjogXCIveGFkbWluL2NvdXJzZXMvY291cnNlcmVzb3VyY2UvXCIsIFwiaWNvblwiOiBudWxsLCBcIm9yZGVyXCI6IDEwLCBcInRpdGxlXCI6IFwiXHU4YmZlXHU3YTBiXHU4ZDQ0XHU2ZTkwXCJ9XSwgXCJmaXJzdF91cmxcIjogXCIveGFkbWluL2NvdXJzZXMvdmlkZW8vXCIsIFwidGl0bGVcIjogXCJcdThiZmVcdTdhMGJcdTRmZTFcdTYwNmZcIn1dIiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJ1c2Vycy52aWV3cy5DdXN0b21CYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYzliMjA5M2VmODBkMDQzMTMwMjYzZGIxOWI4N2I2NDZiOWRhZGE4OCIsIkxJU1RfUVVFUlkiOltbInhhZG1pbiIsInVzZXJ3aWRnZXQiXSwiIl0sIndpemFyZF94YWRtaW51c2Vyd2lkZ2V0X2FkbWluX3dpemFyZF9mb3JtX3BsdWdpbiI6eyJzdGVwX2ZpbGVzIjp7fSwic3RlcCI6IldpZGdldFx1N2M3Ylx1NTc4YiIsImV4dHJhX2RhdGEiOnt9LCJzdGVwX2RhdGEiOnt9fX0=','2018-03-27 08:14:48.204267'),('n5tf09eocyuuy6vyhzaon86yx1fbe9yd','Zjg5YzI3ODNkYmEzY2U3YThjZTAyZDNmZTU4ZjMyZWEzYzk0YjFmNDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6InVzZXJzLnZpZXdzLkN1c3RvbUJhY2tlbmQiLCJMSVNUX1FVRVJZIjpbWyJ1c2VycyIsInVzZXJwcm9maWxlIl0sIiJdLCJfYXV0aF91c2VyX2hhc2giOiJjOWIyMDkzZWY4MGQwNDMxMzAyNjNkYjE5Yjg3YjY0NmI5ZGFkYTg4IiwiX2F1dGhfdXNlcl9pZCI6IjEifQ==','2018-03-26 23:15:59.707552');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operation_coursecommets`
--

DROP TABLE IF EXISTS `operation_coursecommets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `operation_coursecommets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comments` varchar(300) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `course_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `operation_coursecommets_course_id_763bfbfc_fk_courses_couse_id` (`course_id`),
  KEY `operation_coursecommets_user_id_d26bb05c_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `operation_coursecommets_course_id_763bfbfc_fk_courses_couse_id` FOREIGN KEY (`course_id`) REFERENCES `courses_couse` (`id`),
  CONSTRAINT `operation_coursecommets_user_id_d26bb05c_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operation_coursecommets`
--

LOCK TABLES `operation_coursecommets` WRITE;
/*!40000 ALTER TABLE `operation_coursecommets` DISABLE KEYS */;
INSERT INTO `operation_coursecommets` VALUES (1,'牛逼,膜拜','2018-03-10 08:41:00.000000',12,1),(2,'雏田美如画','2018-03-10 08:42:00.000000',12,1),(3,'雏田美如画','2018-03-10 08:43:00.000000',12,1),(4,'雏田美如画','2018-03-10 08:43:00.000000',12,1),(5,'雏田美如画','2018-03-10 08:43:00.000000',12,1),(6,'雏田美如画','2018-03-10 08:44:00.000000',12,1),(7,'雏田美如画','2018-03-10 08:44:00.000000',12,1),(8,'雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画','2018-03-10 13:31:38.833922',12,1),(9,'雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画','2018-03-10 13:32:29.031803',12,1),(10,'雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画','2018-03-10 13:32:37.228014',12,1),(11,'雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画','2018-03-10 13:32:53.748164',12,1),(12,'雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画','2018-03-10 13:32:54.955270',12,1),(13,'雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画','2018-03-10 13:32:55.467778',12,1),(14,'雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画','2018-03-10 13:32:55.686037',12,1),(15,'雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画','2018-03-10 13:32:55.950741',12,1),(16,'雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画','2018-03-10 13:32:56.161112',12,1),(17,'雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画','2018-03-10 13:32:56.221702',12,1),(18,'雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画','2018-03-10 13:34:47.487353',12,1),(19,'雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画','2018-03-10 13:34:48.923860',12,1),(20,'雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画','2018-03-10 13:34:53.246289',12,1),(21,'雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画','2018-03-11 16:35:15.753609',1,1),(22,'雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画','2018-03-11 16:35:21.011252',1,1),(23,'雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画','2018-03-11 16:35:26.237774',1,1),(24,'雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画','2018-03-11 16:35:30.707264',1,1),(25,'雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画雏田美如画','2018-03-11 16:35:34.489284',1,1);
/*!40000 ALTER TABLE `operation_coursecommets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operation_userask`
--

DROP TABLE IF EXISTS `operation_userask`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `operation_userask` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `mobile` varchar(11) NOT NULL,
  `course_name` varchar(50) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operation_userask`
--

LOCK TABLES `operation_userask` WRITE;
/*!40000 ALTER TABLE `operation_userask` DISABLE KEYS */;
INSERT INTO `operation_userask` VALUES (1,'12121212','17516219953','23232323','2018-03-08 12:02:00.561327'),(2,'12121212','17516219953','23232323','2018-03-08 12:02:01.647041'),(3,'12121212','17516219953','23232323','2018-03-08 12:02:01.948348'),(4,'12121212','17516219953','23232323','2018-03-08 12:02:02.164093'),(5,'12121212','17516219953','23232323','2018-03-08 12:02:02.373941'),(6,'12121212','17516219953','23232323','2018-03-08 12:02:02.593670'),(7,'12121212','17516219953','23232323','2018-03-08 12:02:56.622019'),(8,'12121212','17516219953','23232323','2018-03-08 12:04:20.066499'),(9,'12121212','17516219953','23232323','2018-03-08 12:05:33.394697'),(10,'1','1','1','2018-03-08 13:13:05.298677'),(11,'1','1','1','2018-03-08 13:13:08.730648'),(12,'123','17516219953','45545','2018-03-08 14:04:14.402911');
/*!40000 ALTER TABLE `operation_userask` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operation_usercourse`
--

DROP TABLE IF EXISTS `operation_usercourse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `operation_usercourse` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `add_time` datetime(6) NOT NULL,
  `course_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `operation_usercourse_course_id_9f1eab2e_fk_courses_couse_id` (`course_id`),
  KEY `operation_usercourse_user_id_835fe81a_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `operation_usercourse_course_id_9f1eab2e_fk_courses_couse_id` FOREIGN KEY (`course_id`) REFERENCES `courses_couse` (`id`),
  CONSTRAINT `operation_usercourse_user_id_835fe81a_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operation_usercourse`
--

LOCK TABLES `operation_usercourse` WRITE;
/*!40000 ALTER TABLE `operation_usercourse` DISABLE KEYS */;
INSERT INTO `operation_usercourse` VALUES (1,'2018-03-09 10:45:00.000000',2,1),(2,'2018-03-09 10:46:00.000000',1,24),(3,'2018-03-10 14:47:00.000000',12,1),(4,'2018-03-10 14:48:00.000000',3,1),(5,'2018-03-10 14:53:00.000000',12,24),(6,'2018-03-10 14:54:00.000000',5,24),(7,'2018-03-10 14:54:00.000000',6,24),(8,'2018-03-10 14:54:00.000000',11,24),(9,'2018-03-10 17:30:09.135074',6,1),(10,'2018-03-10 17:30:50.330724',11,1),(11,'2018-03-10 17:32:20.119977',4,1),(12,'2018-03-11 16:34:52.320993',1,1);
/*!40000 ALTER TABLE `operation_usercourse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operation_userfavorite`
--

DROP TABLE IF EXISTS `operation_userfavorite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `operation_userfavorite` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fav_id` int(11) NOT NULL,
  `fav_type` int(11) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `operation_userfavorite_user_id_ad46a6af_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `operation_userfavorite_user_id_ad46a6af_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operation_userfavorite`
--

LOCK TABLES `operation_userfavorite` WRITE;
/*!40000 ALTER TABLE `operation_userfavorite` DISABLE KEYS */;
INSERT INTO `operation_userfavorite` VALUES (16,6,1,'2018-03-09 18:29:52.947278',1),(17,11,1,'2018-03-09 18:39:53.490459',1),(18,10,1,'2018-03-09 18:40:04.836366',1),(20,12,1,'2018-03-10 15:52:49.152150',1),(39,1,2,'2018-03-10 22:05:00.831428',1),(40,1,3,'2018-03-11 09:49:45.153615',1),(41,2,3,'2018-03-11 09:55:05.259087',1),(42,3,3,'2018-03-11 09:55:12.712268',1),(43,3,2,'2018-03-11 18:52:57.311609',1),(44,9,3,'2018-03-11 20:24:45.889369',1);
/*!40000 ALTER TABLE `operation_userfavorite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operation_usermessage`
--

DROP TABLE IF EXISTS `operation_usermessage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `operation_usermessage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `message` varchar(300) NOT NULL,
  `has_read` tinyint(1) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `operation_usermessage_user_id_716f8b9d_uniq` (`user_id`),
  CONSTRAINT `operation_usermessage_user_id_716f8b9d_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operation_usermessage`
--

LOCK TABLES `operation_usermessage` WRITE;
/*!40000 ALTER TABLE `operation_usermessage` DISABLE KEYS */;
INSERT INTO `operation_usermessage` VALUES (3,1,'欢迎注册木叶忍术教育,先告诉你一个真理,那就是:雏田美如画,雏田美如画,雏田美如画,雏田美如画,雏田美如画',1,'2018-03-11 21:55:00.000000');
/*!40000 ALTER TABLE `operation_usermessage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `organization_citydict`
--

DROP TABLE IF EXISTS `organization_citydict`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `organization_citydict` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `desc` longtext NOT NULL,
  `add_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organization_citydict`
--

LOCK TABLES `organization_citydict` WRITE;
/*!40000 ALTER TABLE `organization_citydict` DISABLE KEYS */;
INSERT INTO `organization_citydict` VALUES (1,'木叶','五大国之一火之国的隐村。其中以中心区域的火之国最为繁荣，火之国地处交通之要冲，是连接南北的要道， 独特的地理位置使得火之国聚集了大批的人才和资源，成为了五大国中军力最为强盛的国家。 木叶村是火之国的忍者村，代表着火之国的军事实力，故成为最强的忍村之一','2018-03-07 09:28:00.000000'),(2,'砂隐','隶属于五大国当中的风之国。砂隐以风影为顶点，到处都是沙漠，化为培育忍者的绝佳粮食，砂隐之村在过去的忍界大战中，曾经与木叶展开过激烈战斗。千代婆婆的儿子（蝎的父亲）就死于卡卡西的父亲旗木佐云之手，后来因为大名提出裁军的关系，只好极力培育少量的精英忍者，比如说像我爱罗那样的精英忍者。砂隐之村的实力、财力仅次于木叶隐村。忍者都是精英中的精英。在之后的木叶崩溃战后，与木叶成为同盟国。','2018-03-07 09:32:00.000000'),(3,'雾隐','五大隐村之一，隶属于水之国。位于深山之中，领土常为浓雾所覆，与其他诸国完全隔绝的忍村。','2018-03-07 09:33:00.000000'),(4,'岩隐','土之国所属的忍者村。头目被称为土影，创建者为初代目土影石河，其处事风格不详，村子被天险包围，以坚固的防守著称。忍者村是由许多岩石高山所形成的绝密天然要塞，拥有容易防守的地利，敌人难以攻入其内部，不过同样的，他们要于外界交流也相对的困难起来。只要[土影]下达命令，村子里的忍者就会毫不畏惧的出击执行各种危险的任务，个个都有如敢死队员般，不完成任务誓不罢休。晓组织中的迪达拉原为岩忍村忍者，9岁时成为叛忍。','2018-03-07 09:37:00.000000'),(5,'云隐','隶属于五大国当中的雷之国。村子温润、云雾弥漫，并且有很多黑皮肤的忍者，很多忍者的名字后面都带有“イ”。村中的人擅长剑术以及雷遁，并且流行忍体术。云隐是一个武斗派的隐村。','2018-03-07 09:41:00.000000');
/*!40000 ALTER TABLE `organization_citydict` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `organization_courseorg`
--

DROP TABLE IF EXISTS `organization_courseorg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `organization_courseorg` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `desc` longtext NOT NULL,
  `fans_num` int(10) unsigned NOT NULL,
  `image` varchar(100) NOT NULL,
  `click_nums` int(10) unsigned NOT NULL,
  `addr` varchar(150) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `city_id` int(11) NOT NULL,
  `catgory` varchar(20) NOT NULL,
  `students` int(10) unsigned NOT NULL,
  `course_num` int(10) unsigned NOT NULL,
  `tag` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `organization_course_city_id_4a842f85_fk_organization_citydict_id` (`city_id`),
  CONSTRAINT `organization_course_city_id_4a842f85_fk_organization_citydict_id` FOREIGN KEY (`city_id`) REFERENCES `organization_citydict` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organization_courseorg`
--

LOCK TABLES `organization_courseorg` WRITE;
/*!40000 ALTER TABLE `organization_courseorg` DISABLE KEYS */;
INSERT INTO `organization_courseorg` VALUES (1,'晓','一个秘密组织。成员身穿绣着红云的黑色风衣，头戴系着风铃的斗笠，相应手指佩戴标有自己代号的戒指（右手大拇指到左手大拇指依次为：零、青、白、朱、玄、空、南、北、三、玉，） 指甲涂有指甲油，护额上有一道划痕。平时执行任务时两人一组一起行动。\r\n两任首领分别为弥彦和长门，成立之初是为了给自己的国家带来和平，后弥彦的死亡导致长门堕落，长门对晓进行了改革，改变了晓的计划，旨在收集尾兽。长门死后带土则成了“晓”的首领，并挑起了第四次忍界大战。大战后期，随着黑绝阴谋的浮现和大筒木辉夜的复活，晓组织沦为辉夜的棋子，大战主谋带土和宇智波斑相继殒命，晓组织在悲剧色彩中灭亡。',10000,'org/2018/03/xiao.jpg',10004,'五大国','2018-03-07 09:52:00.000000',1,'zuzhi',20000,3,'志颖最美'),(2,'黯部','二代火影掌控木叶之初，便建立了“暗部”、建立暗部、木叶学堂。（之后其他一些忍者村也有效仿），其暗杀战术特殊部队，简称暗部，\"暗杀战术特殊部队”，简称暗部类似于特种军队部门，暗部的成员都是从村子里筛选出的优秀忍者，主要进行保护影和预防外敌侵入忍者村的工作，有时还负责侦察敌情和暗杀等任务，任务的性质一般极其恶劣或枯燥，比如看守重要疑犯等。由于任务的特殊性。其成员行动时都戴着模仿动物的白色面具，任务性质及其他一切资料均被机密保存。暗部由影直属，一切命令由影发布，部队底下设多个四人或五人分队，由分队长统一转达命令和领导执行任务。',10000,'org/2018/03/anbu.jpg',100000,'木叶暗部','2018-03-07 09:53:00.000000',1,'zf',10500,0,'志颖最美'),(3,'木叶忍者学校','木叶教授忍术的学校',1000000,'org/2018/03/muye.jpeg',10009,'木叶忍者学校','2018-03-07 09:58:00.000000',1,'zf',910000,8,'志颖最美'),(4,'云隐教育','云隐的教育学校，教授忍术',20000,'org/2018/03/yunyin.jpg',100002,'云隐忍校','2018-03-07 10:01:00.000000',5,'zf',2000,2,'志颖最美'),(5,'砂隐教育','砂隐风影建立的公立学校',10000,'org/2018/03/shayin.jpg',4680,'砂隐村','2018-03-07 10:11:00.000000',2,'zf',46860,0,'志颖最美'),(6,'岩隐教育','岩隐村的忍者学校，由土影建立',10000,'org/2018/03/yanyin.jpg',10002,'岩隐村','2018-03-07 10:16:00.000000',4,'zf',10200,0,'志颖最美'),(7,'雾隐教育','水影建立的学校',10000,'org/2018/03/wuyin.jpg',100000,'雾隐村','2018-03-07 10:40:00.000000',3,'zf',464866,1,'志颖最美'),(8,'忍刀七人众','“忍刀七人众”，全称“雾之忍刀七人众”，是一个可继承性的称谓，而不是一个实在的组织。七个人都配有一把非常适合自己忍法的名刀，各自的能力不相上下。原本专门为水之国雾隐村完成一些高难度的任务，后大多成为叛忍。第4次忍界大战时成员被药师兜以秽土转生召唤。',1000,'org/2018/03/7.jpg',100003,'雾隐村','2018-03-07 19:47:00.000000',3,'geren',10000,0,'志颖最美'),(9,'木叶三忍','木叶忍者村众所皆知的三位忍者，都是第三代火影猿飞日斩的弟子。三人分别是自来也、大蛇丸和纲手。每个人都有独自攻陷一个国家的可怕力量。\r\n三忍的称号是在第二次忍界大战时，在木叶部队和雨忍村的首领山椒鱼半藏的战斗中， 自来也三人坚持到了最后 ，半藏便赐予三人木叶三忍的称号，因能在半藏手中存活而威震忍界。',1000,'org/2018/03/3.jpg',10000,'木叶','2018-03-07 19:52:00.000000',1,'geren',10000,0,'志颖最美');
/*!40000 ALTER TABLE `organization_courseorg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `organization_techer`
--

DROP TABLE IF EXISTS `organization_techer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `organization_techer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `work_time` int(10) unsigned NOT NULL,
  `work_company` varchar(50) NOT NULL,
  `work_position` varchar(50) NOT NULL,
  `point` varchar(50) NOT NULL,
  `fans_num` int(10) unsigned NOT NULL,
  `click_nums` int(10) unsigned NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `org_id` int(11) NOT NULL,
  `image` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `organization_techer_org_id_4270be9a_fk_organization_courseorg_id` (`org_id`),
  CONSTRAINT `organization_techer_org_id_4270be9a_fk_organization_courseorg_id` FOREIGN KEY (`org_id`) REFERENCES `organization_courseorg` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organization_techer`
--

LOCK TABLES `organization_techer` WRITE;
/*!40000 ALTER TABLE `organization_techer` DISABLE KEYS */;
INSERT INTO `organization_techer` VALUES (1,'长门',10000,'晓','老大','人恨话不多',100000,10024,'2018-03-07 10:17:00.000000',1,'teacher/2018/03/cm.jpeg'),(2,'弥彦',10000,'晓','ceo','人恨话多',100000,10011,'2018-03-07 10:20:00.000000',1,'teacher/2018/03/my.jpg'),(3,'小南',1000,'晓','总监','人美技术好',10000,10001,'2018-03-07 10:21:00.000000',1,'teacher/2018/03/xn.jpg'),(4,'宇智波鼬',1000,'晓','sssssss级','冷静，睿智',10000,10002,'2018-03-07 10:22:00.000000',1,'teacher/2018/03/y.jpg'),(5,'团藏',10000,'暗部','老大','人狠，话也狠',100000,10000,'2018-03-07 10:25:00.000000',2,'teacher/2018/03/tz.jpeg'),(6,'鸣人',1000,'木叶忍者学校','火影','都比，挂逼',10000,100004,'2018-03-07 10:27:00.000000',3,'teacher/2018/03/jpeg'),(7,'佐助',100000,'木叶忍者学校','sssssss级','人狠，话也狠',10000,100000,'2018-03-07 10:28:00.000000',3,'teacher/2018/03/zz.jpg'),(8,'卡卡西',100000,'木叶忍者学校','总监','技术好，上课爱看黄色小说',100000,100000,'2018-03-07 10:29:00.000000',3,'teacher/2018/03/kkx.jpg'),(9,'雏田',10000,'木叶忍者学校','太子妃','美如画，人温柔，美到爆炸，温柔到爆炸',10000,10001,'2018-03-07 10:30:00.000000',3,'teacher/2018/03/ct.jpg'),(10,'小樱',10000,'木叶忍者学校','ss级','没有雏田美',1000,10000,'2018-03-07 10:33:00.000000',3,'teacher/2018/03/xy.jpg'),(11,'鹿丸',100000,'木叶忍者学校','总监','智商高',10000,10000,'2018-03-07 10:35:00.000000',3,'teacher/2018/03/lw.jpg'),(12,'雷影',100000,'云隐教育','老大','人很',10000,10000,'2018-03-07 10:36:00.000000',4,'teacher/2018/03/ly.jpeg'),(13,'我爱罗',1000,'砂隐教育','风影','帅气',1000,10000,'2018-03-07 10:37:00.000000',5,'teacher/2018/03/wal.jpg'),(14,'土影',50000,'岩隐教育','土影','技术好，容易闪到腰',1000000,1000000,'2018-03-07 10:38:00.000000',6,'teacher/2018/03/tu.jpg'),(15,'水影',10000,'雾隐教育','水影','人美身材好',100000,10000,'2018-03-07 10:41:00.000000',7,'teacher/2018/03/sy.jpg'),(16,'麦特凯',10000,'木叶忍者学校','sssssss级','积极乐观，苍蓝猛兽',100000,100001,'2018-03-07 13:42:00.000000',3,'teacher/2018/03/mtk.jpeg'),(17,'自来叶',2000,'个人','sssssss级','技术好,好色',20350,465151,'2018-03-08 16:29:00.000000',9,'teacher/2018/03/zly.jpg'),(18,'大蛇丸',165153,'个人','科学家','科技改变你我他',6513,46565,'2018-03-08 16:31:00.000000',9,'teacher/2018/03/dsw.jpg'),(19,'纲手',8798465,'个人','sss','身材贼好',999999,9999999,'2018-03-08 16:33:00.000000',9,'teacher/2018/03/gs.jpeg'),(20,'桃地再不斩',789135,'个人','sss','给钱啥活都干',46512,61516,'2018-03-08 16:35:00.000000',8,'teacher/2018/03/tz.jpg'),(21,'千手柱间',1110,'木叶忍者学校','老大','大佬',99990,99990,'2018-03-09 22:15:00.000000',3,'teacher/2018/03/qszj.jpg');
/*!40000 ALTER TABLE `organization_techer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_banner`
--

DROP TABLE IF EXISTS `users_banner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_banner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `image` varchar(100) NOT NULL,
  `url` varchar(200) NOT NULL,
  `index` int(11) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_banner`
--

LOCK TABLES `users_banner` WRITE;
/*!40000 ALTER TABLE `users_banner` DISABLE KEYS */;
INSERT INTO `users_banner` VALUES (1,'雏田美如画','banner/18/03/1.jpg','http://v.youku.com/v_show/id_XMTI5MTI1NjE3Mg==.html?spm=a2h0k.8191407.0.0&from=s1.8-1-1.2',1,'2018-03-12 11:57:00.000000'),(2,'雏田美如画2','banner/18/03/2.jpg','http://v.youku.com/v_show/id_XMTI5MTI1NjE3Mg==.html?spm=a2h0k.8191407.0.0&from=s1.8-1-1.2',2,'2018-03-12 12:01:00.000000'),(3,'雏田美如画3','banner/18/03/3.jpg','http://v.youku.com/v_show/id_XMTI5MTI1NjE3Mg==.html?spm=a2h0k.8191407.0.0&from=s1.8-1-1.2',3,'2018-03-12 12:01:00.000000'),(4,'雏田美如画4','banner/18/03/4.jpg','http://v.youku.com/v_show/id_XMTI5MTI1NjE3Mg==.html?spm=a2h0k.8191407.0.0&from=s1.8-1-1.2',4,'2018-03-12 12:02:00.000000'),(5,'雏田美如画5','banner/18/03/5.jpg','http://v.youku.com/v_show/id_XMTI5MTI1NjE3Mg==.html?spm=a2h0k.8191407.0.0&from=s1.8-1-1.2',5,'2018-03-12 12:02:00.000000'),(6,'雏田美如画6','banner/18/03/6.jpg','http://v.youku.com/v_show/id_XMTI5MTI1NjE3Mg==.html?spm=a2h0k.8191407.0.0&from=s1.8-1-1.2',6,'2018-03-12 12:19:00.000000'),(7,'雏田美如画7','banner/18/03/7.jpg','http://v.youku.com/v_show/id_XMTI5MTI1NjE3Mg==.html?spm=a2h0k.8191407.0.0&from=s1.8-1-1.2',7,'2018-03-12 12:20:00.000000');
/*!40000 ALTER TABLE `users_banner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_emailverifyrecord`
--

DROP TABLE IF EXISTS `users_emailverifyrecord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_emailverifyrecord` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `send_type` varchar(30) NOT NULL,
  `send_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_emailverifyrecord`
--

LOCK TABLES `users_emailverifyrecord` WRITE;
/*!40000 ALTER TABLE `users_emailverifyrecord` DISABLE KEYS */;
INSERT INTO `users_emailverifyrecord` VALUES (1,'456465','22@qq.com','register','2018-03-05 15:05:00.000000'),(2,'454545','sasas@qq.com','forget','2018-03-05 15:23:00.000000'),(3,'t3XBgRBUnA','fuck@163.com','register','2018-03-06 13:39:49.958604'),(4,'twkb2NxtuO','fuck@163.com','register','2018-03-06 13:54:59.056049'),(5,'z1t7SaRcW8','fuck@163.com','register','2018-03-06 14:04:33.676729'),(6,'LZ2yy9BhBO','3077194890@qq.com','register','2018-03-06 14:07:11.463655'),(7,'YiEi6oHmEI','3077194890@qq.com','register','2018-03-06 14:10:13.083953'),(8,'kBuycU7yOe','fuck@163.com','register','2018-03-06 14:13:32.397701'),(9,'oU8iFhbfk5','3077194890@qq.com','register','2018-03-06 14:16:57.830622'),(10,'WjMXQFpVaX','3077194890@qq.com','register','2018-03-06 14:19:21.248954'),(11,'MOdzFC6lyo','fuck@163.com','register','2018-03-06 14:24:58.361606'),(12,'sqfcZTaFZx','3077194890@qq.com','register','2018-03-06 14:31:29.755002'),(13,'sEkdfsLqpt','photoncomputer@163.com','register','2018-03-06 14:38:21.232463'),(14,'xaTjCvbU8O','photoncomputer@163.com','register','2018-03-06 16:14:04.691090'),(15,'89QNbhMKcf','photoncomputer@163.com','forget','2018-03-06 20:24:42.824740'),(16,'kBTOuTmVXk','photoncomputer@163.com','forget','2018-03-06 21:38:03.819011'),(17,'aAZFFhQgkWJF4o3Rw7','2497741927@qq.com','update_email','2018-03-11 16:46:23.535248'),(18,'rNYtj2eY1Rh7Uq41PM','2497741927@qq.com','update_email','2018-03-11 16:48:44.190223'),(19,'8BiB','2497741927@qq.com','update_email','2018-03-11 16:58:23.333540'),(20,'isyr','2497741927@qq.com','update_email','2018-03-11 17:12:47.068272'),(21,'VUOIYwnrhOHEpcH7Ei','3077194890@qq.com','register','2018-03-12 23:06:34.318124');
/*!40000 ALTER TABLE `users_emailverifyrecord` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_userprofile`
--

DROP TABLE IF EXISTS `users_userprofile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_userprofile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `nick_name` varchar(50) NOT NULL,
  `birday` datetime(6) DEFAULT NULL,
  `gender` varchar(50) NOT NULL,
  `address` varchar(100) NOT NULL,
  `mobile` varchar(11) DEFAULT NULL,
  `image` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_userprofile`
--

LOCK TABLES `users_userprofile` WRITE;
/*!40000 ALTER TABLE `users_userprofile` DISABLE KEYS */;
INSERT INTO `users_userprofile` VALUES (1,'pbkdf2_sha256$24000$sKDIZxtHRkL9$0Nujknq/iZtK/yCPzcR/vxmf8a6uRUS5w1bbpu6/2bk=','2018-03-12 23:15:59.669641',1,'naruto','','','2497741927@qq.com',1,1,'2018-03-05 05:24:00.000000','雏田美如画!','2017-03-01 00:00:00.000000','female','木叶','1751621995','image/2018/03/ct_356mcX5.jpg'),(24,'pbkdf2_sha256$24000$O9B7evZhWTyD$y9zD+3Cq1S3UcgSulTR9XpBfwXYZ1afKKoJCDwjv9pU=','2018-03-06 16:27:00.000000',0,'teast2211s122','','','photoncomputer@163.com',1,1,'2018-03-06 16:13:00.000000','雏田美如画',NULL,'female','木叶','','image/2018/03/gs.jpeg'),(25,'pbkdf2_sha256$24000$89oIvlB8NytV$k9GnLqr2xcPG7u7rSo2psrVEeMS9E+q87vTtdQXOT3Q=',NULL,0,'nishibiebie','','','2696953127@qq.com',0,0,'2018-03-12 21:27:00.000000','biebie',NULL,'female','muye','','image/default.png'),(26,'pbkdf2_sha256$24000$ax2HqWq4vaLJ$zhLSOkz23TEbbmrXIo8XtqunYPGRW3YLBUS/m2tzeOE=',NULL,0,'2696953127@qq.com','','','',0,0,'2018-03-12 22:02:34.276897','',NULL,'female','',NULL,'image/default.png'),(32,'pbkdf2_sha256$24000$6G6329jDedMw$Spt8ysjCD/4FoXOD+ztT1462d44iv3eSr+3xfwS5zv8=',NULL,0,'3077194890@qq.com','','','3077194890@qq.com',0,0,'2018-03-12 23:06:34.253536','',NULL,'female','',NULL,'image/default.png');
/*!40000 ALTER TABLE `users_userprofile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_userprofile_groups`
--

DROP TABLE IF EXISTS `users_userprofile_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_userprofile_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userprofile_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_userprofile_groups_userprofile_id_823cf2fc_uniq` (`userprofile_id`,`group_id`),
  KEY `users_userprofile_groups_group_id_3de53dbf_fk_auth_group_id` (`group_id`),
  CONSTRAINT `users_userprofil_userprofile_id_a4496a80_fk_users_userprofile_id` FOREIGN KEY (`userprofile_id`) REFERENCES `users_userprofile` (`id`),
  CONSTRAINT `users_userprofile_groups_group_id_3de53dbf_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_userprofile_groups`
--

LOCK TABLES `users_userprofile_groups` WRITE;
/*!40000 ALTER TABLE `users_userprofile_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_userprofile_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_userprofile_user_permissions`
--

DROP TABLE IF EXISTS `users_userprofile_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_userprofile_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userprofile_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_userprofile_user_permissions_userprofile_id_d0215190_uniq` (`userprofile_id`,`permission_id`),
  KEY `users_userprofile_u_permission_id_393136b6_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `users_userprofil_userprofile_id_34544737_fk_users_userprofile_id` FOREIGN KEY (`userprofile_id`) REFERENCES `users_userprofile` (`id`),
  CONSTRAINT `users_userprofile_u_permission_id_393136b6_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_userprofile_user_permissions`
--

LOCK TABLES `users_userprofile_user_permissions` WRITE;
/*!40000 ALTER TABLE `users_userprofile_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_userprofile_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xadmin_bookmark`
--

DROP TABLE IF EXISTS `xadmin_bookmark`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xadmin_bookmark` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) NOT NULL,
  `url_name` varchar(64) NOT NULL,
  `query` varchar(1000) NOT NULL,
  `is_share` tinyint(1) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_bookma_content_type_id_60941679_fk_django_content_type_id` (`content_type_id`),
  KEY `xadmin_bookmark_user_id_42d307fc_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `xadmin_bookma_content_type_id_60941679_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `xadmin_bookmark_user_id_42d307fc_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xadmin_bookmark`
--

LOCK TABLES `xadmin_bookmark` WRITE;
/*!40000 ALTER TABLE `xadmin_bookmark` DISABLE KEYS */;
/*!40000 ALTER TABLE `xadmin_bookmark` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xadmin_log`
--

DROP TABLE IF EXISTS `xadmin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xadmin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `ip_addr` char(39) DEFAULT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` varchar(32) NOT NULL,
  `message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_log_content_type_id_2a6cb852_fk_django_content_type_id` (`content_type_id`),
  KEY `xadmin_log_user_id_bb16a176_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `xadmin_log_content_type_id_2a6cb852_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `xadmin_log_user_id_bb16a176_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=207 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xadmin_log`
--

LOCK TABLES `xadmin_log` WRITE;
/*!40000 ALTER TABLE `xadmin_log` DISABLE KEYS */;
INSERT INTO `xadmin_log` VALUES (1,'2018-03-05 15:13:48.731776','127.0.0.1','1','EmailVerifyRecord object','create','已添加',8,1),(2,'2018-03-05 15:24:12.368318','127.0.0.1','2','454545(sasas@qq.com)','create','已添加',8,1),(3,'2018-03-06 15:33:55.276155','127.0.0.1','6','fuck@163.com','change','已修改 is_staff，nick_name 和 address 。',7,1),(4,'2018-03-06 15:34:28.865988','127.0.0.1','6','fuck@163.com','change','已修改 is_staff 。',7,1),(5,'2018-03-06 16:25:38.651436','127.0.0.1','22','teast2211s2','delete','',7,1),(6,'2018-03-06 18:19:47.164813','127.0.0.1',NULL,'','delete','批量删除 11 个 用户信息',NULL,1),(7,'2018-03-07 09:32:38.593330','127.0.0.1','1','木叶村','create','已添加',19,1),(8,'2018-03-07 09:33:32.155188','127.0.0.1','2','砂隐','create','已添加',19,1),(9,'2018-03-07 09:37:31.518365','127.0.0.1','3','雾隐','create','已添加',19,1),(10,'2018-03-07 09:39:12.838245','127.0.0.1','4','岩隐','create','已添加',19,1),(11,'2018-03-07 09:41:38.648220','127.0.0.1','5','云隐','create','已添加',19,1),(12,'2018-03-07 09:53:43.233324','127.0.0.1','1','晓','create','已添加',20,1),(13,'2018-03-07 09:58:13.648877','127.0.0.1','2','黯部','create','已添加',20,1),(14,'2018-03-07 10:01:15.758189','127.0.0.1','3','木叶忍者学校','create','已添加',20,1),(15,'2018-03-07 10:11:20.798589','127.0.0.1','4','云隐教育','create','已添加',20,1),(16,'2018-03-07 10:16:11.523195','127.0.0.1','5','砂隐教育','create','已添加',20,1),(17,'2018-03-07 10:17:41.015433','127.0.0.1','6','岩隐教育','create','已添加',20,1),(18,'2018-03-07 10:20:23.902374','127.0.0.1','1','长门-晓','create','已添加',21,1),(19,'2018-03-07 10:21:33.367946','127.0.0.1','2','弥彦-晓','create','已添加',21,1),(20,'2018-03-07 10:22:47.114191','127.0.0.1','3','小南-晓','create','已添加',21,1),(21,'2018-03-07 10:25:43.861104','127.0.0.1','4','宇智波鼬-晓','create','已添加',21,1),(22,'2018-03-07 10:27:44.096364','127.0.0.1','5','团藏-黯部','create','已添加',21,1),(23,'2018-03-07 10:28:53.948407','127.0.0.1','6','鸣人-木叶忍者学校','create','已添加',21,1),(24,'2018-03-07 10:29:47.852912','127.0.0.1','7','佐助-木叶忍者学校','create','已添加',21,1),(25,'2018-03-07 10:30:53.864097','127.0.0.1','8','卡卡西-木叶忍者学校','create','已添加',21,1),(26,'2018-03-07 10:33:14.779105','127.0.0.1','9','雏田-晓','create','已添加',21,1),(27,'2018-03-07 10:35:01.954952','127.0.0.1','10','小樱-木叶忍者学校','create','已添加',21,1),(28,'2018-03-07 10:36:15.895382','127.0.0.1','11','鹿丸-木叶忍者学校','create','已添加',21,1),(29,'2018-03-07 10:37:08.425708','127.0.0.1','12','雷影-云隐教育','create','已添加',21,1),(30,'2018-03-07 10:38:01.644154','127.0.0.1','13','我爱罗-砂隐教育','create','已添加',21,1),(31,'2018-03-07 10:39:37.870053','127.0.0.1','14','土影-岩隐教育','create','已添加',21,1),(32,'2018-03-07 10:41:21.480986','127.0.0.1','7','雾隐教育','create','已添加',20,1),(33,'2018-03-07 10:42:21.408293','127.0.0.1','15','水影-雾隐教育','create','已添加',21,1),(34,'2018-03-07 10:46:20.964960','127.0.0.1','9','雏田-木叶忍者学校','change','已修改 org 。',21,1),(35,'2018-03-07 11:02:24.641943','127.0.0.1','1','晓','change','已修改 catgory 。',20,1),(36,'2018-03-07 13:20:54.759384','127.0.0.1','1','木遁','create','已添加',10,1),(37,'2018-03-07 13:23:04.969557','127.0.0.1','2','风遁','create','已添加',10,1),(38,'2018-03-07 13:24:36.525667','127.0.0.1','3','雷遁','create','已添加',10,1),(39,'2018-03-07 13:26:30.668740','127.0.0.1','4','水遁','create','已添加',10,1),(40,'2018-03-07 13:28:15.153644','127.0.0.1','5','土遁','create','已添加',10,1),(41,'2018-03-07 13:29:21.938982','127.0.0.1','5','土遁','change','没有字段被修改。',10,1),(42,'2018-03-07 13:31:45.886062','127.0.0.1','6','幻术','create','已添加',10,1),(43,'2018-03-07 13:33:08.298684','127.0.0.1','7','手里剑','create','已添加',10,1),(44,'2018-03-07 13:35:01.782029','127.0.0.1','8','苦无','create','已添加',10,1),(45,'2018-03-07 13:39:15.404491','127.0.0.1','9','初级体术','create','已添加',10,1),(46,'2018-03-07 13:40:20.001099','127.0.0.1','10','中级体术','create','已添加',10,1),(47,'2018-03-07 13:42:32.834965','127.0.0.1','11','高级体术(八门遁甲）','create','已添加',10,1),(48,'2018-03-07 13:44:33.819199','127.0.0.1','16','麦特凯-木叶忍者学校','create','已添加',21,1),(49,'2018-03-07 13:45:24.165713','127.0.0.1','1','木遁-树界降临','create','已添加',11,1),(50,'2018-03-07 18:26:43.367422','127.0.0.1','6','岩隐教育','change','已修改 city 。',20,1),(51,'2018-03-07 19:52:14.184851','127.0.0.1','8','忍刀七人众','create','已添加',20,1),(52,'2018-03-07 19:59:35.120903','127.0.0.1','9','木叶三忍','create','已添加',20,1),(53,'2018-03-07 19:59:49.390503','127.0.0.1','1','木叶','change','已修改 name 。',19,1),(54,'2018-03-08 08:21:00.448232','127.0.0.1','11','高级体术(八门遁甲）','change','已修改 courseorg 。',10,1),(55,'2018-03-08 08:21:09.767272','127.0.0.1','10','中级体术','change','已修改 courseorg 。',10,1),(56,'2018-03-08 08:21:20.181714','127.0.0.1','9','初级体术','change','已修改 courseorg 。',10,1),(57,'2018-03-08 08:21:33.000578','127.0.0.1','8','苦无','change','已修改 courseorg 。',10,1),(58,'2018-03-08 08:21:45.145777','127.0.0.1','7','手里剑','change','已修改 courseorg 。',10,1),(59,'2018-03-08 08:22:06.558615','127.0.0.1','7','手里剑','change','没有字段被修改。',10,1),(60,'2018-03-08 08:22:19.249869','127.0.0.1','6','幻术','change','已修改 courseorg 。',10,1),(61,'2018-03-08 08:22:27.962302','127.0.0.1','5','土遁','change','已修改 courseorg 。',10,1),(62,'2018-03-08 08:22:40.837804','127.0.0.1','4','水遁','change','已修改 courseorg 。',10,1),(63,'2018-03-08 08:22:55.302986','127.0.0.1','3','雷遁','change','已修改 courseorg 。',10,1),(64,'2018-03-08 08:23:11.268123','127.0.0.1','2','风遁','change','已修改 courseorg 。',10,1),(65,'2018-03-08 08:23:24.187425','127.0.0.1','1','木遁','change','已修改 courseorg 。',10,1),(66,'2018-03-08 08:23:51.054461','127.0.0.1','10','中级体术','change','已修改 courseorg 。',10,1),(67,'2018-03-08 09:59:01.703165','127.0.0.1','3','木叶忍者学校','change','已修改 click_nums 和 students 。',20,1),(68,'2018-03-08 09:59:42.227084','127.0.0.1','1','晓','change','已修改 students 。',20,1),(69,'2018-03-08 10:00:10.433391','127.0.0.1','2','黯部','change','已修改 students 。',20,1),(70,'2018-03-08 10:00:24.438001','127.0.0.1','4','云隐教育','change','已修改 students 。',20,1),(71,'2018-03-08 10:00:49.081857','127.0.0.1','6','岩隐教育','change','已修改 students 。',20,1),(72,'2018-03-08 10:01:01.267811','127.0.0.1','7','雾隐教育','change','已修改 students 。',20,1),(73,'2018-03-08 10:01:31.766846','127.0.0.1','5','砂隐教育','change','已修改 click_nums 和 students 。',20,1),(74,'2018-03-08 15:26:01.241537','127.0.0.1','16','麦特凯-木叶忍者学校','change','已修改 image 。',21,1),(75,'2018-03-08 16:22:02.171273','127.0.0.1','15','水影-雾隐教育','change','已修改 image 。',21,1),(76,'2018-03-08 16:22:37.683783','127.0.0.1','14','土影-岩隐教育','change','已修改 image 。',21,1),(77,'2018-03-08 16:23:04.608589','127.0.0.1','13','我爱罗-砂隐教育','change','已修改 image 。',21,1),(78,'2018-03-08 16:23:46.167371','127.0.0.1','12','雷影-云隐教育','change','已修改 image 。',21,1),(79,'2018-03-08 16:24:02.091326','127.0.0.1','11','鹿丸-木叶忍者学校','change','已修改 image 。',21,1),(80,'2018-03-08 16:24:18.838623','127.0.0.1','10','小樱-木叶忍者学校','change','已修改 image 。',21,1),(81,'2018-03-08 16:24:34.815746','127.0.0.1','9','雏田-木叶忍者学校','change','已修改 image 。',21,1),(82,'2018-03-08 16:24:58.099505','127.0.0.1','8','卡卡西-木叶忍者学校','change','已修改 image 。',21,1),(83,'2018-03-08 16:25:11.186038','127.0.0.1','7','佐助-木叶忍者学校','change','已修改 image 。',21,1),(84,'2018-03-08 16:25:44.843280','127.0.0.1','6','鸣人-木叶忍者学校','change','已修改 image 。',21,1),(85,'2018-03-08 16:26:03.610870','127.0.0.1','5','团藏-黯部','change','已修改 image 。',21,1),(86,'2018-03-08 16:27:05.471960','127.0.0.1','4','宇智波鼬-晓','change','已修改 image 。',21,1),(87,'2018-03-08 16:27:36.872115','127.0.0.1','3','小南-晓','change','已修改 image 。',21,1),(88,'2018-03-08 16:27:54.080071','127.0.0.1','2','弥彦-晓','change','已修改 image 。',21,1),(89,'2018-03-08 16:28:49.545903','127.0.0.1','1','长门-晓','change','已修改 image 。',21,1),(90,'2018-03-08 16:31:27.893955','127.0.0.1','17','自来叶-木叶三忍','create','已添加',21,1),(91,'2018-03-08 16:33:10.108618','127.0.0.1','18','大蛇丸-木叶三忍','create','已添加',21,1),(92,'2018-03-08 16:35:21.714047','127.0.0.1','19','纲手-木叶三忍','create','已添加',21,1),(93,'2018-03-08 16:38:22.774905','127.0.0.1','20','桃地再不斩-忍刀七人众','create','已添加',21,1),(94,'2018-03-09 10:26:06.463034','127.0.0.1','11','高级体术(八门遁甲）','change','已修改 category 。',10,1),(95,'2018-03-09 10:26:18.443259','127.0.0.1','10','中级体术','change','已修改 category 。',10,1),(96,'2018-03-09 10:26:28.216312','127.0.0.1','9','初级体术','change','已修改 category 。',10,1),(97,'2018-03-09 10:26:49.110512','127.0.0.1','8','苦无','change','已修改 category 。',10,1),(98,'2018-03-09 10:26:59.206549','127.0.0.1','7','手里剑','change','已修改 category 。',10,1),(99,'2018-03-09 10:27:15.689938','127.0.0.1','6','幻术','change','已修改 category 。',10,1),(100,'2018-03-09 10:27:27.498662','127.0.0.1','5','土遁','change','已修改 category 。',10,1),(101,'2018-03-09 10:27:39.156424','127.0.0.1','4','水遁','change','已修改 category 。',10,1),(102,'2018-03-09 10:27:52.935747','127.0.0.1','3','雷遁','change','已修改 category 。',10,1),(103,'2018-03-09 10:28:02.825479','127.0.0.1','2','风遁','change','已修改 category 。',10,1),(104,'2018-03-09 10:28:13.203588','127.0.0.1','1','木遁','change','已修改 category 。',10,1),(105,'2018-03-09 10:38:29.128712','127.0.0.1','1','naruto','change','已修改 last_login，nick_name，address 和 image 。',7,1),(106,'2018-03-09 10:39:41.131501','127.0.0.1','24','teast2211s122','change','已修改 last_login，nick_name，address 和 image 。',7,1),(107,'2018-03-09 10:46:22.515484','127.0.0.1','1','naruto-风遁','create','已添加',18,1),(108,'2018-03-09 10:46:34.624196','127.0.0.1','2','teast2211s122-木遁','create','已添加',18,1),(109,'2018-03-09 11:42:59.167722','127.0.0.1','11','高级体术(八门遁甲）','change','已修改 tag 。',10,1),(110,'2018-03-09 11:43:11.074868','127.0.0.1','10','中级体术','change','已修改 tag 。',10,1),(111,'2018-03-09 11:43:21.461269','127.0.0.1','9','初级体术','change','已修改 tag 。',10,1),(112,'2018-03-09 11:43:40.068250','127.0.0.1','8','苦无','change','已修改 tag 。',10,1),(113,'2018-03-09 11:43:49.169377','127.0.0.1','7','手里剑','change','已修改 tag 。',10,1),(114,'2018-03-09 11:44:06.089338','127.0.0.1','6','幻术','change','已修改 tag 。',10,1),(115,'2018-03-09 11:44:17.006984','127.0.0.1','5','土遁','change','已修改 tag 。',10,1),(116,'2018-03-09 11:44:30.368117','127.0.0.1','4','水遁','change','已修改 tag 。',10,1),(117,'2018-03-09 11:44:42.060265','127.0.0.1','3','雷遁','change','已修改 tag 。',10,1),(118,'2018-03-09 11:44:55.481842','127.0.0.1','2','风遁','change','已修改 tag 。',10,1),(119,'2018-03-09 11:45:08.493232','127.0.0.1','1','木遁','change','已修改 tag 。',10,1),(120,'2018-03-09 11:47:15.463752','127.0.0.1','5','土龙弹','change','已修改 name 。',10,1),(121,'2018-03-09 11:47:37.205449','127.0.0.1','4','水阵壁','change','已修改 name 。',10,1),(122,'2018-03-09 11:51:13.138729','127.0.0.1','3','麒麟','change','已修改 name 。',10,1),(123,'2018-03-09 12:56:47.625133','127.0.0.1','2','螺旋手里剑','change','已修改 name 。',10,1),(124,'2018-03-09 12:57:39.913913','127.0.0.1','1','真树千手','change','已修改 name 。',10,1),(125,'2018-03-09 13:22:18.408135','127.0.0.1','1','仙法木遁·真数千手·顶上化仏','change','已修改 name 和 detail 。',10,1),(126,'2018-03-09 14:38:39.504906','127.0.0.1','12','树界降临','create','已添加',10,1),(127,'2018-03-09 19:36:55.942494','127.0.0.1','2','树界降临-第一章 检验是否拥有木属性查克拉','create','已添加',11,1),(128,'2018-03-09 19:37:23.099352','127.0.0.1','3','树界降临-第二章 讲解木遁','create','已添加',11,1),(129,'2018-03-09 19:37:54.402325','127.0.0.1','4','树界降临-第三章 练习使用木遁','create','已添加',11,1),(130,'2018-03-09 19:38:27.786559','127.0.0.1','5','树界降临-第四章 树界降临','create','已添加',11,1),(131,'2018-03-09 19:46:50.571704','127.0.0.1','1','树界降临-第四章 树界降临,树界降临','create','已添加',12,1),(132,'2018-03-09 19:47:15.997706','127.0.0.1','2','树界降临-第一章 检验是否拥有木属性查克拉,检验是否拥有木属性查克拉','create','已添加',12,1),(133,'2018-03-09 19:47:39.718803','127.0.0.1','3','树界降临-第二章 讲解木遁,木遁与阿','create','已添加',12,1),(134,'2018-03-09 19:48:02.176226','127.0.0.1','4','树界降临-第三章 练习使用木遁,木遁展示','create','已添加',12,1),(135,'2018-03-09 19:49:13.478625','127.0.0.1','12','树界降临','change','已修改 detail，learn_time，students 和 fans_num 。',10,1),(136,'2018-03-09 21:22:49.890937','127.0.0.1','6','高级体术(八门遁甲）-第一章 练习体力','create','已添加',11,1),(137,'2018-03-09 21:23:16.829252','127.0.0.1','7','高级体术(八门遁甲）-第二章 八门遁甲','create','已添加',11,1),(138,'2018-03-09 21:24:07.974421','127.0.0.1','5','高级体术(八门遁甲）-第一章 练习体力,爬山','create','已添加',12,1),(139,'2018-03-09 21:25:04.612925','127.0.0.1','6','高级体术(八门遁甲）-第二章 八门遁甲,惊门开','create','已添加',12,1),(140,'2018-03-09 21:28:08.823319','127.0.0.1','7','仙法木遁·真数千手·顶上化仏-树界降临,第一章 木属性查克拉','create','已添加',12,1),(141,'2018-03-09 21:57:31.393164','127.0.0.1','1','仙法木遁·真数千手·顶上化仏','create','已添加',13,1),(142,'2018-03-09 22:14:15.325244','127.0.0.1','11','高级体术(八门遁甲）','change','已修改 teacher 。',10,1),(143,'2018-03-09 22:14:54.746774','127.0.0.1','12','树界降临','change','已修改 courseorg 。',10,1),(144,'2018-03-09 22:17:22.905321','127.0.0.1','21','千手柱间-木叶忍者学校','create','已添加',21,1),(145,'2018-03-09 22:18:17.096723','127.0.0.1','2','仙法木遁·真数千手·顶上化仏','create','已添加',13,1),(146,'2018-03-09 22:29:46.210965','127.0.0.1','12','树界降临','change','已修改 teacher，course_known 和 teacher_tell 。',10,1),(147,'2018-03-10 08:42:16.033864','127.0.0.1','1','naruto-树界降临','create','已添加',15,1),(148,'2018-03-10 08:43:05.349806','127.0.0.1','2','naruto-树界降临','create','已添加',15,1),(149,'2018-03-10 08:43:29.666714','127.0.0.1','3','naruto-树界降临','create','已添加',15,1),(150,'2018-03-10 08:43:52.552038','127.0.0.1','4','naruto-树界降临','create','已添加',15,1),(151,'2018-03-10 08:44:11.910505','127.0.0.1','5','naruto-树界降临','create','已添加',15,1),(152,'2018-03-10 08:44:47.683150','127.0.0.1','6','naruto-树界降临','create','已添加',15,1),(153,'2018-03-10 08:45:07.444423','127.0.0.1','7','naruto-树界降临','create','已添加',15,1),(154,'2018-03-10 14:47:50.046754','127.0.0.1','1','naruto-螺旋手里剑','change','没有字段被修改。',18,1),(155,'2018-03-10 14:48:08.882087','127.0.0.1','3','naruto-树界降临','create','已添加',18,1),(156,'2018-03-10 14:48:21.763558','127.0.0.1','4','naruto-麒麟','create','已添加',18,1),(157,'2018-03-10 14:53:57.148484','127.0.0.1','2','teast2211s122-仙法木遁·真数千手·顶上化仏','change','没有字段被修改。',18,1),(158,'2018-03-10 14:54:15.751577','127.0.0.1','5','teast2211s122-树界降临','create','已添加',18,1),(159,'2018-03-10 14:54:28.821911','127.0.0.1','6','teast2211s122-土龙弹','create','已添加',18,1),(160,'2018-03-10 14:54:37.764556','127.0.0.1','7','teast2211s122-幻术','create','已添加',18,1),(161,'2018-03-10 14:54:52.907660','127.0.0.1','8','teast2211s122-高级体术(八门遁甲）','create','已添加',18,1),(162,'2018-03-10 22:06:54.675300','127.0.0.1','1','晓','change','已修改 addr 。',20,1),(163,'2018-03-11 12:23:07.585180','127.0.0.1','1','naruto','change','已修改 last_login 。',7,1),(164,'2018-03-11 21:56:21.692850','127.0.0.1','3','naruto','create','已添加',17,1),(165,'2018-03-11 21:56:45.107916','127.0.0.1','3','naruto','change','已修改 message 。',17,1),(166,'2018-03-12 12:01:22.100450','127.0.0.1','1','Banner object','create','已添加',9,1),(167,'2018-03-12 12:01:52.346715','127.0.0.1','2','Banner object','create','已添加',9,1),(168,'2018-03-12 12:02:10.425589','127.0.0.1','3','Banner object','create','已添加',9,1),(169,'2018-03-12 12:02:53.259884','127.0.0.1','4','Banner object','create','已添加',9,1),(170,'2018-03-12 12:03:09.728226','127.0.0.1','5','Banner object','create','已添加',9,1),(171,'2018-03-12 12:20:23.002285','127.0.0.1','6','Banner object','create','已添加',9,1),(172,'2018-03-12 12:20:51.215557','127.0.0.1','7','Banner object','create','已添加',9,1),(173,'2018-03-12 12:36:40.826497','127.0.0.1','12','树界降临','change','已修改 is_banner 。',10,1),(174,'2018-03-12 12:37:19.172034','127.0.0.1','11','高级体术(八门遁甲）','change','已修改 is_banner，course_known 和 teacher_tell 。',10,1),(175,'2018-03-12 12:38:33.498754','127.0.0.1','5','土龙弹','change','已修改 teacher，course_known 和 teacher_tell 。',10,1),(176,'2018-03-12 12:39:16.924200','127.0.0.1','10','中级体术','change','已修改 teacher，course_known 和 teacher_tell 。',10,1),(177,'2018-03-12 12:39:48.083691','127.0.0.1','8','苦无','change','已修改 teacher，course_known 和 teacher_tell 。',10,1),(178,'2018-03-12 12:40:24.568417','127.0.0.1','9','初级体术','change','已修改 teacher，course_known 和 teacher_tell 。',10,1),(179,'2018-03-12 12:40:49.100541','127.0.0.1','7','手里剑','change','已修改 teacher，course_known 和 teacher_tell 。',10,1),(180,'2018-03-12 12:41:15.528730','127.0.0.1','6','幻术','change','已修改 teacher，course_known 和 teacher_tell 。',10,1),(181,'2018-03-12 12:41:29.510648','127.0.0.1','5','土龙弹','change','没有字段被修改。',10,1),(182,'2018-03-12 12:45:13.424920','127.0.0.1','4','水阵壁','change','已修改 teacher，course_known 和 teacher_tell 。',10,1),(183,'2018-03-12 12:46:36.740185','127.0.0.1','3','麒麟','change','已修改 teacher，course_known 和 teacher_tell 。',10,1),(184,'2018-03-12 12:47:05.242463','127.0.0.1','2','螺旋手里剑','change','已修改 teacher，course_known 和 teacher_tell 。',10,1),(185,'2018-03-12 12:47:30.527938','127.0.0.1','1','仙法木遁·真数千手·顶上化仏','change','已修改 teacher，course_known 和 teacher_tell 。',10,1),(186,'2018-03-12 12:47:42.135067','127.0.0.1','12','树界降临','change','没有字段被修改。',10,1),(187,'2018-03-12 12:48:11.872980','127.0.0.1','11','高级体术(八门遁甲）','change','已修改 course_known 和 teacher_tell 。',10,1),(188,'2018-03-12 12:48:29.151451','127.0.0.1','10','中级体术','change','已修改 course_known 和 teacher_tell 。',10,1),(189,'2018-03-12 12:48:40.204366','127.0.0.1','9','初级体术','change','没有字段被修改。',10,1),(190,'2018-03-12 12:48:57.081563','127.0.0.1','8','苦无','change','已修改 course_known 和 teacher_tell 。',10,1),(191,'2018-03-12 12:49:20.239528','127.0.0.1','7','手里剑','change','已修改 course_known 和 teacher_tell 。',10,1),(192,'2018-03-12 12:49:47.789387','127.0.0.1','6','幻术','change','已修改 course_known 和 teacher_tell 。',10,1),(193,'2018-03-12 12:50:17.434771','127.0.0.1','5','土龙弹','change','已修改 course_known 和 teacher_tell 。',10,1),(194,'2018-03-12 12:50:30.714046','127.0.0.1','7','手里剑','change','没有字段被修改。',10,1),(195,'2018-03-12 13:16:50.118050','127.0.0.1','11','高级体术(八门遁甲）','change','已修改 is_banner 。',10,1),(196,'2018-03-12 13:17:11.103834','127.0.0.1','5','土龙弹','change','已修改 is_banner 。',10,1),(197,'2018-03-12 13:18:07.583897','127.0.0.1','5','土龙弹','change','已修改 is_banner 。',10,1),(198,'2018-03-12 13:26:09.832192','127.0.0.1','5','土龙弹','change','已修改 is_banner 。',10,1),(199,'2018-03-12 17:56:36.047931','127.0.0.1','12','树界降临','change','已修改 is_classic 。',10,1),(200,'2018-03-12 17:56:53.153557','127.0.0.1','11','高级体术(八门遁甲）','change','已修改 is_classic 。',10,1),(201,'2018-03-12 17:57:01.615167','127.0.0.1','10','中级体术','change','已修改 is_classic 。',10,1),(202,'2018-03-12 17:57:14.108130','127.0.0.1','6','幻术','change','已修改 is_classic 。',10,1),(203,'2018-03-12 17:57:53.515254','127.0.0.1','4','水阵壁','change','已修改 is_classic 。',10,1),(204,'2018-03-12 18:47:06.799789','127.0.0.1','13','神罗天征','create','已添加',10,1),(205,'2018-03-12 18:52:08.591659','127.0.0.1','14','地爆天星','create','已添加',10,1),(206,'2018-03-12 22:01:01.731447','127.0.0.1','25','nishibiebie','change','已修改 is_active，nick_name 和 address 。',7,1);
/*!40000 ALTER TABLE `xadmin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xadmin_usersettings`
--

DROP TABLE IF EXISTS `xadmin_usersettings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xadmin_usersettings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(256) NOT NULL,
  `value` longtext NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_usersettings_user_id_edeabe4a_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `xadmin_usersettings_user_id_edeabe4a_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xadmin_usersettings`
--

LOCK TABLES `xadmin_usersettings` WRITE;
/*!40000 ALTER TABLE `xadmin_usersettings` DISABLE KEYS */;
INSERT INTO `xadmin_usersettings` VALUES (1,'dashboard:home:pos','',1),(2,'site-theme','/static/xadmin/css/themes/bootstrap-xadmin.css',1),(3,'dashboard:home:pos','',24);
/*!40000 ALTER TABLE `xadmin_usersettings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xadmin_userwidget`
--

DROP TABLE IF EXISTS `xadmin_userwidget`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xadmin_userwidget` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_id` varchar(256) NOT NULL,
  `widget_type` varchar(50) NOT NULL,
  `value` longtext NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_userwidget_user_id_c159233a_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `xadmin_userwidget_user_id_c159233a_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xadmin_userwidget`
--

LOCK TABLES `xadmin_userwidget` WRITE;
/*!40000 ALTER TABLE `xadmin_userwidget` DISABLE KEYS */;
/*!40000 ALTER TABLE `xadmin_userwidget` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-03-13 12:51:15
