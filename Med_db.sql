-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: med_db
-- ------------------------------------------------------
-- Server version	5.7.40-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add drug',7,'add_drug'),(26,'Can change drug',7,'change_drug'),(27,'Can delete drug',7,'delete_drug'),(28,'Can view drug',7,'view_drug'),(29,'Can add interacting drugs',8,'add_interactingdrugs'),(30,'Can change interacting drugs',8,'change_interactingdrugs'),(31,'Can delete interacting drugs',8,'delete_interactingdrugs'),(32,'Can view interacting drugs',8,'view_interactingdrugs'),(33,'Can add record',9,'add_record'),(34,'Can change record',9,'change_record'),(35,'Can delete record',9,'delete_record'),(36,'Can view record',9,'view_record'),(37,'Can add user',10,'add_user'),(38,'Can change user',10,'change_user'),(39,'Can delete user',10,'delete_user'),(40,'Can view user',10,'view_user'),(41,'Can add social account',11,'add_socialaccount'),(42,'Can change social account',11,'change_socialaccount'),(43,'Can delete social account',11,'delete_socialaccount'),(44,'Can view social account',11,'view_socialaccount'),(45,'Can add timeslots',12,'add_timeslots'),(46,'Can change timeslots',12,'change_timeslots'),(47,'Can delete timeslots',12,'delete_timeslots'),(48,'Can view timeslots',12,'view_timeslots'),(49,'Can add timings',13,'add_timings'),(50,'Can change timings',13,'change_timings'),(51,'Can delete timings',13,'delete_timings'),(52,'Can view timings',13,'view_timings'),(53,'Can add history record',14,'add_historyrecord'),(54,'Can change history record',14,'change_historyrecord'),(55,'Can delete history record',14,'delete_historyrecord'),(56,'Can view history record',14,'view_historyrecord'),(57,'Can add reminder',15,'add_reminder'),(58,'Can change reminder',15,'change_reminder'),(59,'Can delete reminder',15,'delete_reminder'),(60,'Can view reminder',15,'view_reminder');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) DEFAULT NULL,
  `last_name` varchar(150) DEFAULT NULL,
  `email` varchar(254) DEFAULT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (2,'pbkdf2_sha256$390000$FG532ilespV7pnU0eG4fW1$vI7QQZvU77NCq/fwghM5hiXpFgHCXsAZIFBGBs5eNRg=','2023-06-22 09:07:39.219706',1,'root','','','brank.hsu1@gmail.com',1,1,'2023-03-11 04:34:56.591717');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `base_drug`
--

DROP TABLE IF EXISTS `base_drug`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `base_drug` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 NOT NULL,
  `appearance` varchar(100) CHARACTER SET utf8mb4 NOT NULL,
  `indications` varchar(50) CHARACTER SET utf8mb4 NOT NULL,
  `sideEffect` varchar(100) CHARACTER SET utf8mb4 NOT NULL,
  `rid_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `base_drug_rid_id_49f2cefd_fk_base_record_id` (`rid_id`),
  CONSTRAINT `base_drug_rid_id_49f2cefd_fk_base_record_id` FOREIGN KEY (`rid_id`) REFERENCES `base_record` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=247 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `base_drug`
--

LOCK TABLES `base_drug` WRITE;
/*!40000 ALTER TABLE `base_drug` DISABLE KEYS */;
INSERT INTO `base_drug` VALUES (238,'apple','淺黃色圓扁錠，一面刻痕雙側77C字樣，一面有商標圖案','消炎止痛','可能發生罕見但嚴重之皮膚過敏反應',3),(245,'apple','淺黃色圓扁錠，一面刻痕雙側77C字樣，一面有商標圖案','消炎止痛','可能發生罕見但嚴重之皮膚過敏反應',30),(246,'apple','淺黃色圓扁錠，一面刻痕雙側77C字樣，一面有商標圖案','消炎止痛','可能發生罕見但嚴重之皮膚過敏反應',31);
/*!40000 ALTER TABLE `base_drug` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `base_historyrecord`
--

DROP TABLE IF EXISTS `base_historyrecord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `base_historyrecord` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `timeSlot` time(6) NOT NULL,
  `drug_id` int(11) NOT NULL,
  `drug_name` varchar(20) NOT NULL,
  `dosage` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `base_historyrecord`
--

LOCK TABLES `base_historyrecord` WRITE;
/*!40000 ALTER TABLE `base_historyrecord` DISABLE KEYS */;
/*!40000 ALTER TABLE `base_historyrecord` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `base_interactingdrugs`
--

DROP TABLE IF EXISTS `base_interactingdrugs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `base_interactingdrugs` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `level` varchar(20) NOT NULL,
  `cause` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `rid_id` bigint(20) NOT NULL,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `base_interactingdrugs_rid_id_d23e20b2_fk_base_record_id` (`rid_id`),
  CONSTRAINT `base_interactingdrugs_rid_id_d23e20b2_fk_base_record_id` FOREIGN KEY (`rid_id`) REFERENCES `base_record` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `base_interactingdrugs`
--

LOCK TABLES `base_interactingdrugs` WRITE;
/*!40000 ALTER TABLE `base_interactingdrugs` DISABLE KEYS */;
INSERT INTO `base_interactingdrugs` VALUES (3,'Moderate','NO',3,' '),(5,'Major','混合使用會顯著降低的血氧濃度。這可能會導致癲癇發作失控或行為改變。',3,' '),(16,'Moderate','NO',30,' '),(17,'Major','混合使用會顯著降低的血氧濃度。這可能會導致癲癇發作失控或行為改變。',30,' '),(18,'Moderate','NO',31,' '),(19,'Major','混合使用會顯著降低的血氧濃度。這可能會導致癲癇發作失控或行為改變。',31,' ');
/*!40000 ALTER TABLE `base_interactingdrugs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `base_record`
--

DROP TABLE IF EXISTS `base_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `base_record` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `dosage` int(11) NOT NULL,
  `notification_remind` int(11) NOT NULL,
  `notification_repeat` int(11) NOT NULL,
  `notification_status` int(11) NOT NULL,
  `stock` int(11) NOT NULL,
  `return_status` int(11) NOT NULL,
  `return_date` date NOT NULL,
  `return_left` int(11) NOT NULL,
  `return_repeat` int(11) NOT NULL,
  `ondemand` tinyint(1) NOT NULL,
  `timings_1` int(11) NOT NULL,
  `timings_2` int(11) NOT NULL,
  `notification_startDate` date NOT NULL,
  `frequency` int(11) NOT NULL,
  `position` int(11) NOT NULL,
  `hospitalDepartment` varchar(50) CHARACTER SET utf8mb4 NOT NULL,
  `hospitalName` varchar(50) CHARACTER SET utf8mb4 NOT NULL,
  `hospitalextension` varchar(50) NOT NULL,
  `hospitalphone` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `base_record`
--

LOCK TABLES `base_record` WRITE;
/*!40000 ALTER TABLE `base_record` DISABLE KEYS */;
INSERT INTO `base_record` VALUES (3,1,0,0,0,0,0,'2023-03-18',0,0,0,0,0,'2023-04-16',1,1,'心臟內科','榮民總醫院','',''),(30,1,0,0,0,0,0,'2023-03-18',0,0,0,0,0,'2023-04-16',1,1,'心臟內科','榮民總醫院','',''),(31,1,0,0,0,8,0,'2023-03-18',0,0,0,0,0,'2023-04-16',1,1,'家庭內科','榮民總醫院','1','0225523234');
/*!40000 ALTER TABLE `base_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `base_reminder`
--

DROP TABLE IF EXISTS `base_reminder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `base_reminder` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `drug_id` int(11) NOT NULL,
  `drug_name` varchar(20) NOT NULL,
  `timeSlot` time(6) NOT NULL,
  `dosage` int(11) NOT NULL,
  `position` int(11) NOT NULL,
  `stock` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `base_reminder`
--

LOCK TABLES `base_reminder` WRITE;
/*!40000 ALTER TABLE `base_reminder` DISABLE KEYS */;
/*!40000 ALTER TABLE `base_reminder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `base_socialaccount`
--

DROP TABLE IF EXISTS `base_socialaccount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `base_socialaccount` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `provider` varchar(200) NOT NULL,
  `unique_id` varchar(200) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `base_socialaccount_user_id_6b87c0d4_fk_base_user_id` (`user_id`),
  CONSTRAINT `base_socialaccount_user_id_6b87c0d4_fk_base_user_id` FOREIGN KEY (`user_id`) REFERENCES `base_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `base_socialaccount`
--

LOCK TABLES `base_socialaccount` WRITE;
/*!40000 ALTER TABLE `base_socialaccount` DISABLE KEYS */;
/*!40000 ALTER TABLE `base_socialaccount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `base_timeslots`
--

DROP TABLE IF EXISTS `base_timeslots`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `base_timeslots` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `timeslot` time(6) NOT NULL,
  `record_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `base_timeslots_record_id_f7fbca58_fk_base_record_id` (`record_id`),
  CONSTRAINT `base_timeslots_record_id_f7fbca58_fk_base_record_id` FOREIGN KEY (`record_id`) REFERENCES `base_record` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `base_timeslots`
--

LOCK TABLES `base_timeslots` WRITE;
/*!40000 ALTER TABLE `base_timeslots` DISABLE KEYS */;
INSERT INTO `base_timeslots` VALUES (1,'12:00:00.000000',3),(2,'07:00:00.000000',3),(3,'09:00:00.000000',30),(4,'11:00:00.000000',31);
/*!40000 ALTER TABLE `base_timeslots` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `base_timings`
--

DROP TABLE IF EXISTS `base_timings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `base_timings` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `timing` int(11) NOT NULL,
  `record_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `base_timings_record_id_47d0ac4d_fk_base_record_id` (`record_id`),
  CONSTRAINT `base_timings_record_id_47d0ac4d_fk_base_record_id` FOREIGN KEY (`record_id`) REFERENCES `base_record` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `base_timings`
--

LOCK TABLES `base_timings` WRITE;
/*!40000 ALTER TABLE `base_timings` DISABLE KEYS */;
/*!40000 ALTER TABLE `base_timings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `base_user`
--

DROP TABLE IF EXISTS `base_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `base_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `email` varchar(100) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `base_user`
--

LOCK TABLES `base_user` WRITE;
/*!40000 ALTER TABLE `base_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `base_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
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
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2023-03-11 04:37:30.462048','1','record object (1)',1,'[{\"added\": {}}]',9,2),(2,'2023-03-11 04:48:56.757142','1','record object (1)',2,'[]',9,2),(3,'2023-03-11 04:48:59.571395','1','record object (1)',2,'[]',9,2),(4,'2023-03-11 04:49:05.509754','1','record object (1)',3,'',9,2),(5,'2023-03-11 04:55:46.607386','1','interactingDrugs object (1)',1,'[{\"added\": {}}]',8,2),(6,'2023-03-11 04:57:22.295660','2','interactingDrugs object (2)',1,'[{\"added\": {}}]',8,2),(7,'2023-03-11 05:00:08.646892','2','record object (2)',1,'[{\"added\": {}}]',9,2),(9,'2023-03-11 05:13:01.837852','2','record object (2)',3,'',9,2),(10,'2023-03-11 05:13:07.581951','2','interactingDrugs object (2)',3,'',8,2),(11,'2023-03-11 05:13:09.591019','1','interactingDrugs object (1)',3,'',8,2),(12,'2023-03-11 05:13:12.486978','1','user object (1)',3,'',10,2),(13,'2023-03-11 05:13:15.349928','235','drug object (235)',3,'',7,2),(14,'2023-03-11 05:23:46.425921','3','record object (3)',1,'[{\"added\": {}}]',9,2),(15,'2023-03-11 05:24:23.937777','236','drug object (236)',1,'[{\"added\": {}}]',7,2),(16,'2023-03-11 05:24:40.832955','3','interactingDrugs object (3)',1,'[{\"added\": {}}]',8,2),(17,'2023-03-11 05:27:50.226137','4','record object (4)',1,'[{\"added\": {}}]',9,2),(18,'2023-03-11 05:29:06.015791','237','drug object (237)',1,'[{\"added\": {}}]',7,2),(19,'2023-03-11 05:29:46.721388','4','interactingDrugs object (4)',1,'[{\"added\": {}}]',8,2),(20,'2023-03-11 05:30:21.145238','4','interactingDrugs object (4)',2,'[]',8,2),(21,'2023-03-11 05:35:14.015929','5','interactingDrugs object (5)',1,'[{\"added\": {}}]',8,2),(22,'2023-03-11 05:36:11.406897','3','interactingDrugs object (3)',2,'[{\"changed\": {\"fields\": [\"Level\", \"Cause\"]}}]',8,2),(23,'2023-03-11 05:36:22.498373','5','interactingDrugs object (5)',2,'[{\"changed\": {\"fields\": [\"Level\", \"Cause\"]}}]',8,2),(24,'2023-03-11 05:36:54.607775','3','interactingDrugs object (3)',2,'[{\"changed\": {\"fields\": [\"Level\", \"Cause\"]}}]',8,2),(25,'2023-03-18 06:59:27.617856','237','drug object (237)',2,'[{\"changed\": {\"fields\": [\"HospitalName\"]}}]',7,2),(26,'2023-03-18 06:59:30.616687','236','drug object (236)',2,'[{\"changed\": {\"fields\": [\"HospitalName\"]}}]',7,2),(27,'2023-04-16 08:47:21.183916','3','record object (3)',2,'[]',9,2),(28,'2023-04-16 08:47:27.941562','4','record object (4)',2,'[]',9,2),(29,'2023-04-30 08:22:26.648546','19','record object (19)',3,'',9,2),(30,'2023-04-30 08:22:26.650548','18','record object (18)',3,'',9,2),(31,'2023-04-30 08:22:26.651549','17','record object (17)',3,'',9,2),(32,'2023-04-30 08:22:26.652550','16','record object (16)',3,'',9,2),(33,'2023-04-30 08:22:26.653551','15','record object (15)',3,'',9,2),(34,'2023-04-30 08:22:26.656553','14','record object (14)',3,'',9,2),(35,'2023-04-30 08:22:26.657554','13','record object (13)',3,'',9,2),(36,'2023-04-30 08:22:26.658555','12','record object (12)',3,'',9,2),(37,'2023-04-30 08:22:26.659556','11','record object (11)',3,'',9,2),(38,'2023-04-30 08:22:26.660557','10','record object (10)',3,'',9,2),(39,'2023-04-30 08:22:26.661558','9','record object (9)',3,'',9,2),(40,'2023-04-30 08:22:26.662559','8','record object (8)',3,'',9,2),(41,'2023-04-30 08:22:26.663560','7','record object (7)',3,'',9,2),(42,'2023-04-30 08:22:26.664561','6','record object (6)',3,'',9,2),(43,'2023-04-30 08:23:00.546662','6','record object (6)',3,'',9,2),(44,'2023-04-30 08:23:05.674326','7','record object (7)',3,'',9,2),(45,'2023-04-30 08:23:10.737372','8','record object (8)',3,'',9,2),(46,'2023-04-30 08:23:43.673337','5','record object (5)',3,'',9,2),(48,'2023-04-30 08:24:02.418053','9','record object (9)',3,'',9,2),(49,'2023-04-30 08:24:05.313186','10','record object (10)',3,'',9,2),(50,'2023-04-30 08:24:09.219269','11','record object (11)',3,'',9,2),(51,'2023-04-30 08:24:49.603541','15','record object (15)',3,'',9,2),(52,'2023-04-30 08:24:49.605543','14','record object (14)',3,'',9,2),(53,'2023-04-30 08:24:49.606544','13','record object (13)',3,'',9,2),(54,'2023-04-30 08:24:49.607545','12','record object (12)',3,'',9,2),(55,'2023-04-30 08:25:03.856374','17','record object (17)',3,'',9,2),(56,'2023-04-30 08:25:31.291375','13','interactingDrugs object (13)',3,'',8,2),(57,'2023-04-30 08:25:31.293378','12','interactingDrugs object (12)',3,'',8,2),(58,'2023-04-30 08:25:31.294378','11','interactingDrugs object (11)',3,'',8,2),(59,'2023-04-30 08:25:31.295379','10','interactingDrugs object (10)',3,'',8,2),(60,'2023-04-30 08:25:55.370387','9','interactingDrugs object (9)',3,'',8,2),(61,'2023-04-30 08:25:55.372389','8','interactingDrugs object (8)',3,'',8,2),(62,'2023-04-30 08:25:55.373391','7','interactingDrugs object (7)',3,'',8,2),(63,'2023-04-30 08:25:55.374392','6','interactingDrugs object (6)',3,'',8,2),(64,'2023-04-30 08:26:14.353652','4','interactingDrugs object (4)',3,'',8,2),(65,'2023-04-30 08:26:26.929688','239','drug object (239)',3,'',7,2),(66,'2023-04-30 08:26:29.089572','241','drug object (241)',3,'',7,2),(67,'2023-04-30 08:26:31.057485','240','drug object (240)',3,'',7,2),(68,'2023-04-30 08:26:37.361939','237','drug object (237)',3,'',7,2),(69,'2023-04-30 08:26:39.960306','236','drug object (236)',3,'',7,2),(70,'2023-04-30 08:26:48.691448','19','record object (19)',3,'',9,2),(71,'2023-04-30 08:26:48.693450','18','record object (18)',3,'',9,2),(72,'2023-04-30 08:26:48.694451','16','record object (16)',3,'',9,2),(73,'2023-04-30 08:26:48.697454','4','record object (4)',3,'',9,2),(74,'2023-04-30 08:30:39.492157','21','record object (21)',3,'',9,2),(75,'2023-04-30 08:30:39.493158','20','record object (20)',3,'',9,2),(76,'2023-04-30 09:10:30.825290','15','interactingDrugs object (15)',3,'',8,2),(77,'2023-04-30 09:10:30.826291','14','interactingDrugs object (14)',3,'',8,2),(78,'2023-04-30 09:10:38.889373','244','drug object (244)',3,'',7,2),(79,'2023-04-30 09:10:38.890374','243','drug object (243)',3,'',7,2),(80,'2023-04-30 09:10:38.892376','242','drug object (242)',3,'',7,2),(81,'2023-04-30 09:11:21.298723','29','record object (29)',3,'',9,2),(82,'2023-04-30 09:11:21.299724','28','record object (28)',3,'',9,2),(83,'2023-04-30 09:11:21.300725','27','record object (27)',3,'',9,2),(84,'2023-04-30 09:11:21.301726','26','record object (26)',3,'',9,2),(85,'2023-04-30 09:11:21.302727','25','record object (25)',3,'',9,2),(86,'2023-04-30 09:11:21.303728','24','record object (24)',3,'',9,2),(87,'2023-04-30 09:11:21.304728','23','record object (23)',3,'',9,2),(88,'2023-04-30 09:11:21.305729','22','record object (22)',3,'',9,2),(89,'2023-05-06 06:17:33.544689','1','timeslots object (1)',1,'[{\"added\": {}}]',12,2),(90,'2023-05-06 06:17:40.803767','1','timeslots object (1)',2,'[]',12,2),(91,'2023-05-06 06:17:47.766481','2','timeslots object (2)',1,'[{\"added\": {}}]',12,2),(92,'2023-05-06 06:19:55.160639','3','timeslots object (3)',1,'[{\"added\": {}}]',12,2),(93,'2023-05-06 06:19:57.286184','4','timeslots object (4)',1,'[{\"added\": {}}]',12,2),(94,'2023-05-13 05:42:24.744357','4','timeslots object (4)',2,'[{\"changed\": {\"fields\": [\"Timeslot\"]}}]',12,2),(95,'2023-05-13 05:42:27.382098','3','timeslots object (3)',2,'[]',12,2),(96,'2023-05-13 05:42:32.328365','2','timeslots object (2)',2,'[{\"changed\": {\"fields\": [\"Timeslot\"]}}]',12,2),(97,'2023-05-13 05:42:39.288737','1','timeslots object (1)',2,'[{\"changed\": {\"fields\": [\"Timeslot\"]}}]',12,2),(98,'2023-05-22 18:26:37.748927','3','record object (3)',2,'[{\"changed\": {\"fields\": [\"HospitalDeapartment\", \"HospitalName\"]}}]',9,2),(99,'2023-05-22 18:26:45.735689','30','record object (30)',2,'[{\"changed\": {\"fields\": [\"HospitalDeapartment\", \"HospitalName\"]}}]',9,2),(100,'2023-05-22 18:37:30.798205','3','record object (3)',2,'[{\"changed\": {\"fields\": [\"HospitalDepartment\", \"HospitalName\"]}}]',9,2),(101,'2023-05-22 18:37:39.824914','30','record object (30)',2,'[{\"changed\": {\"fields\": [\"HospitalDepartment\", \"HospitalName\"]}}]',9,2),(102,'2023-05-22 18:37:54.203485','31','record object (31)',2,'[{\"changed\": {\"fields\": [\"HospitalDepartment\", \"HospitalName\"]}}]',9,2),(103,'2023-06-22 10:09:53.276510','31','record object (31)',2,'[{\"changed\": {\"fields\": [\"Hospitalphone\", \"Hospitalextension\", \"Stock\"]}}]',9,2);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(7,'base','drug'),(14,'base','historyrecord'),(8,'base','interactingdrugs'),(9,'base','record'),(15,'base','reminder'),(11,'base','socialaccount'),(12,'base','timeslots'),(13,'base','timings'),(10,'base','user'),(5,'contenttypes','contenttype'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2023-03-11 03:12:10.028034'),(2,'auth','0001_initial','2023-03-11 03:12:10.537497'),(3,'admin','0001_initial','2023-03-11 03:12:10.662611'),(4,'admin','0002_logentry_remove_auto_add','2023-03-11 03:12:10.667615'),(5,'admin','0003_logentry_add_action_flag_choices','2023-03-11 03:12:10.673621'),(6,'contenttypes','0002_remove_content_type_name','2023-03-11 03:12:10.739681'),(7,'auth','0002_alter_permission_name_max_length','2023-03-11 03:12:10.754694'),(8,'auth','0003_alter_user_email_max_length','2023-03-11 03:12:10.769708'),(9,'auth','0004_alter_user_username_opts','2023-03-11 03:12:10.775713'),(10,'auth','0005_alter_user_last_login_null','2023-03-11 03:12:10.814749'),(11,'auth','0006_require_contenttypes_0002','2023-03-11 03:12:10.817752'),(12,'auth','0007_alter_validators_add_error_messages','2023-03-11 03:12:10.822756'),(13,'auth','0008_alter_user_username_max_length','2023-03-11 03:12:10.836769'),(14,'auth','0009_alter_user_last_name_max_length','2023-03-11 03:12:10.850782'),(15,'auth','0010_alter_group_name_max_length','2023-03-11 03:12:10.864902'),(16,'auth','0011_update_proxy_permissions','2023-03-11 03:12:10.870908'),(17,'auth','0012_alter_user_first_name_max_length','2023-03-11 03:12:10.884920'),(18,'base','0001_initial','2023-03-11 03:12:10.907941'),(19,'base','0002_alter_person_ipaddress','2023-03-11 03:12:10.910944'),(20,'base','0003_remove_person_ipaddress','2023-03-11 03:12:10.949979'),(21,'base','0004_drug_interactingdrugs_record_user_delete_person_and_more','2023-03-11 03:12:11.189197'),(22,'sessions','0001_initial','2023-03-11 03:12:11.225230'),(23,'base','0005_remove_drug_d_id_remove_interactingdrugs_i_id_and_more','2023-03-11 03:58:09.325299'),(24,'base','0006_rename_r_id_interactingdrugs_record_and_more','2023-03-11 03:58:10.147246'),(25,'base','0007_remove_interactingdrugs_drug_and_more','2023-03-11 04:55:29.261437'),(26,'base','0008_record_interactingdrugs','2023-03-11 04:55:29.307478'),(27,'base','0009_alter_interactingdrugs_level','2023-03-11 04:58:37.356258'),(28,'base','0010_remove_record_drug_remove_record_interactingdrugs_and_more','2023-03-11 05:21:56.189810'),(29,'base','0011_alter_interactingdrugs_cause','2023-03-11 05:32:00.492145'),(30,'base','0012_rename_u_name_user_name_eng_drug_hospitalname_and_more','2023-03-18 06:26:30.787713'),(31,'base','0013_alter_record_stock','2023-03-18 06:26:30.792717'),(32,'base','0014_remove_user_name_man','2023-03-18 06:26:30.794719'),(33,'base','0015_user_u_name','2023-03-18 06:27:22.670139'),(34,'base','0016_rename_u_name_user_name_man','2023-03-18 06:28:00.014830'),(35,'base','0017_remove_record_stock_record_stck','2023-03-18 06:38:29.226593'),(36,'base','0018_remove_record_stck','2023-03-18 06:39:26.751719'),(37,'base','0019_rename_stock_record_stck','2023-03-18 06:40:36.971843'),(38,'base','0020_remove_record_stck','2023-03-18 06:40:36.974845'),(39,'base','0021_record_stock','2023-03-18 06:41:31.594151'),(40,'base','0022_alter_record_return_date','2023-03-18 06:52:17.567735'),(41,'base','0023_remove_record_return_status_alter_record_return_date','2023-03-18 06:54:22.870766'),(42,'base','0024_socialaccount','2023-03-26 07:40:38.368697'),(43,'base','0025_remove_user_name_eng_remove_user_name_man_user_email_and_more','2023-03-26 07:40:38.581472'),(44,'base','0026_remove_record_notification_volume_record_ondemand_and_more','2023-04-16 07:48:13.984887'),(45,'base','0027_record_notification_startdate','2023-04-16 07:48:14.063967'),(46,'base','0028_record_frequency_record_position','2023-04-16 09:30:59.050694'),(47,'base','0029_remove_record_timeslot_1_remove_record_timeslot_2_and_more','2023-04-30 06:43:35.153054'),(48,'base','0030_rename_record_drug_rid_and_more','2023-04-30 08:09:33.753960'),(49,'base','0031_alter_drug_rid_alter_interactingdrugs_rid','2023-04-30 08:20:43.713354'),(50,'base','0032_remove_drug_hospitaldeapartment_and_more','2023-04-30 11:09:13.602764'),(51,'base','0033_interactingdrugs_name_alter_interactingdrugs_cause_and_more','2023-05-06 06:14:22.935801'),(52,'base','0034_timings','2023-05-07 06:06:30.170199'),(53,'base','0035_remove_record_comment','2023-05-22 18:24:56.308695'),(54,'base','0036_rename_hospitaldeapartment_record_hospitaldepartment','2023-05-22 18:30:29.828941'),(55,'base','0037_historyrecord_reminder_record_hospitalextension_and_more','2023-06-22 09:42:22.490847'),(56,'base','0038_rename_timeslots_historyrecord_timeslot_and_more','2023-06-22 09:50:12.343687');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('2b0o7uv17qpj2di7s0pauuc9519peo86','.eJxVjM0OwiAQhN-FsyELLmTx6N1nIMufVA1NSnsyvrs06UHnON838xaet7X6refFT0lchBan3y5wfOa2g_Tgdp9lnNu6TEHuijxol7c55df1cP8OKvc61hFtdFCAbABwmKkYBFSg9Rmso5ECnKNmQwCMZVisVC6hEKEhJT5ftsg21Q:1qCGHz:2b9ppJ7bdLApDeSoQ_sFMRAZWaMRKuR_baDmKLUsWus','2023-07-06 09:07:39.221708'),('bykpfsrp8792og2abfqicuxf36kpkg6i','.eJxVjM0OwiAQhN-FsyELLmTx6N1nIMufVA1NSnsyvrs06UHnON838xaet7X6refFT0lchBan3y5wfOa2g_Tgdp9lnNu6TEHuijxol7c55df1cP8OKvc61hFtdFCAbABwmKkYBFSg9Rmso5ECnKNmQwCMZVisVC6hEKEhJT5ftsg21Q:1paqwq:PZVKHCWAqEsuMoIKQqi8JK5-bcZRC-uQ7JIDIJURI38','2023-03-25 04:35:12.356159'),('c4lfg7b6tqsjo0n4xgjjwvuo5zywktob','.eJxVjM0OwiAQhN-FsyELLmTx6N1nIMufVA1NSnsyvrs06UHnON838xaet7X6refFT0lchBan3y5wfOa2g_Tgdp9lnNu6TEHuijxol7c55df1cP8OKvc61hFtdFCAbABwmKkYBFSg9Rmso5ECnKNmQwCMZVisVC6hEKEhJT5ftsg21Q:1pnxgA:jfKxpT1hMNNB_EQqw8CT1lmShis2LvH71QTiwwiIacs','2023-04-30 08:24:10.858665'),('twx2pdvac3800zg4lx9wx8w16jamy5qk','.eJxVjM0OwiAQhN-FsyELLmTx6N1nIMufVA1NSnsyvrs06UHnON838xaet7X6refFT0lchBan3y5wfOa2g_Tgdp9lnNu6TEHuijxol7c55df1cP8OKvc61hFtdFCAbABwmKkYBFSg9Rmso5ECnKNmQwCMZVisVC6hEKEhJT5ftsg21Q:1pt2ML:6JiLy5axTys6BbG9GqORNcKKkCp25Q0ympF7jZRi5t4','2023-05-14 08:24:41.744432'),('w6mjteu44qtehqkxfh6v47jstlhhjh3t','.eJxVjM0OwiAQhN-FsyELLmTx6N1nIMufVA1NSnsyvrs06UHnON838xaet7X6refFT0lchBan3y5wfOa2g_Tgdp9lnNu6TEHuijxol7c55df1cP8OKvc61hFtdFCAbABwmKkYBFSg9Rmso5ECnKNmQwCMZVisVC6hEKEhJT5ftsg21Q:1q1ACG:gZ7D4fxxMMALmdW4XpbK9j5ySZraAMPMsMnxPKMcd1I','2023-06-05 18:23:52.298493');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-06-23 19:13:15
