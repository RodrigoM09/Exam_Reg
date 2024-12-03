-- MySQL dump 10.13  Distrib 8.0.39, for macos14.4 (arm64)
--
-- Host: localhost    Database: exam_registration
-- ------------------------------------------------------
-- Server version	8.0.39

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
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
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add student',7,'add_student'),(26,'Can change student',7,'change_student'),(27,'Can delete student',7,'delete_student'),(28,'Can view student',7,'view_student'),(29,'Can add exam registration',8,'add_examregistration'),(30,'Can change exam registration',8,'change_examregistration'),(31,'Can delete exam registration',8,'delete_examregistration'),(32,'Can view exam registration',8,'view_examregistration'),(33,'Can add exam',9,'add_exam'),(34,'Can change exam',9,'change_exam'),(35,'Can delete exam',9,'delete_exam'),(36,'Can view exam',9,'view_exam'),(37,'Can add user',10,'add_user'),(38,'Can change user',10,'change_user'),(39,'Can delete user',10,'delete_user'),(40,'Can view user',10,'view_user'),(41,'Can add registered',11,'add_registered'),(42,'Can change registered',11,'change_registered'),(43,'Can delete registered',11,'delete_registered'),(44,'Can view registered',11,'view_registered');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(9,'registration','exam'),(8,'registration','examregistration'),(11,'registration','registered'),(7,'registration','student'),(10,'registration','user'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2024-09-22 23:27:00.938000'),(2,'auth','0001_initial','2024-09-22 23:27:01.109157'),(3,'admin','0001_initial','2024-09-22 23:27:01.148696'),(4,'admin','0002_logentry_remove_auto_add','2024-09-22 23:27:01.152748'),(5,'admin','0003_logentry_add_action_flag_choices','2024-09-22 23:27:01.156229'),(6,'contenttypes','0002_remove_content_type_name','2024-09-22 23:27:01.189286'),(7,'auth','0002_alter_permission_name_max_length','2024-09-22 23:27:01.217384'),(8,'auth','0003_alter_user_email_max_length','2024-09-22 23:27:01.228176'),(9,'auth','0004_alter_user_username_opts','2024-09-22 23:27:01.232188'),(10,'auth','0005_alter_user_last_login_null','2024-09-22 23:27:01.250365'),(11,'auth','0006_require_contenttypes_0002','2024-09-22 23:27:01.251029'),(12,'auth','0007_alter_validators_add_error_messages','2024-09-22 23:27:01.254806'),(13,'auth','0008_alter_user_username_max_length','2024-09-22 23:27:01.275244'),(14,'auth','0009_alter_user_last_name_max_length','2024-09-22 23:27:01.294236'),(15,'auth','0010_alter_group_name_max_length','2024-09-22 23:27:01.304003'),(16,'auth','0011_update_proxy_permissions','2024-09-22 23:27:01.309253'),(17,'auth','0012_alter_user_first_name_max_length','2024-09-22 23:27:01.330033'),(18,'registration','0001_initial','2024-09-22 23:27:01.354475'),(19,'sessions','0001_initial','2024-09-22 23:27:01.364038'),(20,'registration','0002_rename_email_student_student_id','2024-09-23 00:54:30.802454'),(21,'registration','0002_user_student','2024-11-20 21:08:00.482612'),(22,'registration','0003_rename_user_id_user_student_id_remove_user_student','2024-11-20 21:08:00.495503'),(23,'registration','0004_remove_student_password_remove_student_username_and_more','2024-11-20 21:08:00.496965'),(25,'registration','0005_user_first_name_user_last_name','2024-11-20 21:10:44.691814'),(26,'registration','0006_alter_user_last_login_alter_user_password_and_more','2024-11-20 21:13:40.950272'),(27,'registration','0007_rename_exam_id_exam_id_remove_exam_capacity_and_more','2024-11-21 18:18:19.072011'),(28,'registration','0008_remove_exam_location_exam_exam_location_and_more','2024-11-21 18:40:00.809831'),(29,'registration','0009_registered','2024-11-23 04:55:10.906825');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('4kpmhyo0znuz833bttjwl5pvt3p9q1nl','.eJxVjsEOwiAQRP-FsyElUBY8evcbyAK7tmpoUuip8d9tTRN1Mrd5M5lVBFzaEJZKcxizOAvVHVLi9BtGTA8qO5HvWG6TTFNp8xjljsgjrfI6ZXpeDvZvYMA6bG0Cq_ueKUHneo9ojdObwbCOiiIwMdjceeudAVCeTXKk2GWKqBXTNlrbkqm0z9_v3dcb32dAdA:1tFkLS:B4OcD8n5nsXtwkbskda-BGPQ-spiN-Flf3LximAz-Pc','2024-12-10 01:26:26.519203'),('a5utxt0h4ktzlait07540sc3v178t65a','e30:1tDrpQ:XvuTu569TdI_U5iAD6OhX5Cn8yml6X8aaA6W1CaAQUA','2024-12-04 21:01:36.902388'),('afc31uym2tp9gxfltp9uc1zupnd7feyw','.eJxVjsEOwiAQRP-FsyElUBY8evcbyAK7tmpoUuip8d9tTRN1Mrd5M5lVBFzaEJZKcxizOAvVHVLi9BtGTA8qO5HvWG6TTFNp8xjljsgjrfI6ZXpeDvZvYMA6bG0Cq_ueKUHneo9ojdObwbCOiiIwMdjceeudAVCeTXKk2GWKqBXTNlrbkqm0z9_v3dcb32dAdA:1tIIr6:vwHT9QVR0185rw1zF_gXzrlOCe2bXG4gcVQEnAE67gc','2024-12-17 02:41:40.934690'),('c809oav3ce1h40mgo2dnjusqhin4p6jx','e30:1tDrnO:KwnM3eeV58VZQMjbrjWydWiy-lrP4S2zNuc3xpJfJhg','2024-12-04 20:59:30.183981'),('ghruyr8x4a4usky57bk2aeku6h4zmxa3','.eJxVjsEOwiAQRP-FsyElUBY8evcbyAK7tmpoUuip8d9tTRN1Mrd5M5lVBFzaEJZKcxizOAvVHVLi9BtGTA8qO5HvWG6TTFNp8xjljsgjrfI6ZXpeDvZvYMA6bG0Cq_ueKUHneo9ojdObwbCOiiIwMdjceeudAVCeTXKk2GWKqBXTNlrbkqm0z9_v3dcb32dAdA:1tDscT:MI1svPiiynYS9P_py9VCtCiV5TK6pwNHPmvwjp7-Fro','2024-12-04 21:52:17.991798'),('i0w63sc907oql21njn5nbgljxyjruqv8','.eJxVjsEOwiAQRP-FsyElUBY8evcbyAK7tmpoUuip8d9tTRN1Mrd5M5lVBFzaEJZKcxizOAvVHVLi9BtGTA8qO5HvWG6TTFNp8xjljsgjrfI6ZXpeDvZvYMA6bG0Cq_ueKUHneo9ojdObwbCOiiIwMdjceeudAVCeTXKk2GWKqBXTNlrbkqm0z9_v3dcb32dAdA:1tEhhy:9kdwdKHVEbjQpplm7iI13Kogq8BZKk3f8qqL6_WqTvQ','2024-12-07 04:25:22.803658'),('i7fgwqbg1oturvnvcqjx1zbeh26xp2ik','.eJxVjsEOwiAQRP-FsyElUBY8evcbyAK7tmpoUuip8d9tTRN1Mrd5M5lVBFzaEJZKcxizOAvVHVLi9BtGTA8qO5HvWG6TTFNp8xjljsgjrfI6ZXpeDvZvYMA6bG0Cq_ueKUHneo9ojdObwbCOiiIwMdjceeudAVCeTXKk2GWKqBXTNlrbkqm0z9_v3dcb32dAdA:1tEiVe:ieO_x9ob0UydzQv5AxwF7T8AFEu3ut_Pzl0kgn8CPq8','2024-12-07 05:16:42.174479'),('k8t0cjsljeu52xiofsvjk56a8e9qg0fh','e30:1tDrp0:RWAIlLo9AoIAMPlk6p2pnZ0K7b1qeIWKjQ8AMcadmOA','2024-12-04 21:01:10.311938'),('ls1vj59b2843cmqwmlmxcst4tck4qz0u','.eJxlzkEOwiAQheG7sDZkgALFpXvP0AzM1FYNTQqsjHe3TbrQuH5f_ryXGLDVaWiF12EmcRZKm86G3jsrTt9jxPTgvAu6Y74tMi25rnOUO5HHWuR1IX5eDvsTmLBMez9pBTwG1iEFA4gaAKNLyEYZIvLGBVbKuxQcdKw3GhP1YCyM1ke1RUttxLn-_X1_AJKCQQA:1tIGo8:H01hCwskzGzsQGrVjeEyy-e92DRjq3d7TrijtZYIeAc','2024-12-17 00:30:28.688344'),('mri3m9dmv86pbt3s5np6r8qfgidxifl8','.eJxVjsEOwiAQRP-FsyElUBY8evcbyAK7tmpoUuip8d9tTRN1Mrd5M5lVBFzaEJZKcxizOAvVHVLi9BtGTA8qO5HvWG6TTFNp8xjljsgjrfI6ZXpeDvZvYMA6bG0Cq_ueKUHneo9ojdObwbCOiiIwMdjceeudAVCeTXKk2GWKqBXTNlrbkqm0z9_v3dcb32dAdA:1tFkI7:e_127YRqKdDBHgm9JlXNZElCO13DzAlopoJzfo7mKP8','2024-12-10 01:22:59.624216');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Exams`
--

DROP TABLE IF EXISTS `Exams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Exams` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `exam_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `exam_date` date NOT NULL,
  `exam_location` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Exams`
--

LOCK TABLES `Exams` WRITE;
/*!40000 ALTER TABLE `Exams` DISABLE KEYS */;
INSERT INTO `Exams` VALUES (1,'Math 101 Final','2024-12-15','Room 202'),(2,'Physics 102 Midterm','2024-11-25','Room 304'),(3,'History 201 Final','2024-12-18','Auditorium'),(4,'Biology 110 Lab Exam','2024-12-10','Lab 3'),(5,'English 103 Essay Submission','2024-12-20','Room 101'),(6,'Chemistry 202 Final','2024-12-15','Room 402'),(7,'Computer Science 301','2024-12-12','Lab 5'),(8,'Statistics 205 Final','2024-12-17','Room 303'),(9,'Psychology 150 Presentation','2024-12-11','Room 207'),(10,'Philosophy 220 Ethics Exam','2024-12-14','Room 206');
/*!40000 ALTER TABLE `Exams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Registered`
--

DROP TABLE IF EXISTS `Registered`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Registered` (
  `registration_id` int NOT NULL AUTO_INCREMENT,
  `student_id` bigint DEFAULT NULL,
  `exam_id` bigint NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `exam_name` varchar(255) DEFAULT NULL,
  `exam_date` date DEFAULT NULL,
  `exam_location` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`registration_id`),
  KEY `examregistrations_ibfk_1` (`student_id`),
  KEY `fk_exam_id` (`exam_id`),
  CONSTRAINT `fk_exam_id` FOREIGN KEY (`exam_id`) REFERENCES `Exams` (`id`) ON DELETE CASCADE,
  CONSTRAINT `registered_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `registration_user` (`student_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Registered`
--

LOCK TABLES `Registered` WRITE;
/*!40000 ALTER TABLE `Registered` DISABLE KEYS */;
INSERT INTO `Registered` VALUES (5,1000000001,1,'student1','John','Doe','Math 101 Final','2024-12-15','Room 202');
/*!40000 ALTER TABLE `Registered` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registration_exam`
--

DROP TABLE IF EXISTS `registration_exam`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `registration_exam` (
  `id` int NOT NULL AUTO_INCREMENT,
  `exam_name` varchar(255) NOT NULL,
  `exam_date` date NOT NULL,
  `exam_time` time DEFAULT NULL,
  `exam_location` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registration_exam`
--

LOCK TABLES `registration_exam` WRITE;
/*!40000 ALTER TABLE `registration_exam` DISABLE KEYS */;
/*!40000 ALTER TABLE `registration_exam` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registration_registered`
--

DROP TABLE IF EXISTS `registration_registered`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `registration_registered` (
  `registration_id` int NOT NULL AUTO_INCREMENT,
  `student_id` bigint NOT NULL,
  `exam_id` bigint NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `exam_name` varchar(255) DEFAULT NULL,
  `exam_date` date DEFAULT NULL,
  `exam_location` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`registration_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registration_registered`
--

LOCK TABLES `registration_registered` WRITE;
/*!40000 ALTER TABLE `registration_registered` DISABLE KEYS */;
INSERT INTO `registration_registered` VALUES (3,1000000001,2,'student1','John','Doe','Physics 102 Midterm','2024-11-25','Room 304'),(6,1000000001,1,'student1','John','Doe','Math 101 Final','2024-12-15','Room 202'),(8,123456785,2,'student3','Elon','Musk','Physics 102 Midterm','2024-11-25','Room 304'),(9,123456785,1,'student3','Elon','Musk','Math 101 Final','2024-12-15','Room 202'),(10,123456785,8,'student3','Elon','Musk','Statistics 205 Final','2024-12-17','Room 303'),(11,1234598765,2,'student7','Santa','Claus','Physics 102 Midterm','2024-11-25','Room 304'),(12,1234598765,8,'student7','Santa','Claus','Statistics 205 Final','2024-12-17','Room 303'),(13,1234598765,10,'student7','Santa','Claus','Philosophy 220 Ethics Exam','2024-12-14','Room 206'),(14,1234598765,1,'student7','Santa','Claus','Math 101 Final','2024-12-15','Room 202'),(15,1000000001,3,'student1','John','Doe','History 201 Final','2024-12-18','Auditorium'),(16,1000000001,4,'student1','John','Doe','Biology 110 Lab Exam','2024-12-10','Lab 3');
/*!40000 ALTER TABLE `registration_registered` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registration_user`
--

DROP TABLE IF EXISTS `registration_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `registration_user` (
  `student_id` bigint NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(128) NOT NULL,
  `is_student` tinyint(1) DEFAULT '0',
  `is_teacher` tinyint(1) DEFAULT '0',
  `last_login` datetime(6) DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`student_id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=1234598766 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registration_user`
--

LOCK TABLES `registration_user` WRITE;
/*!40000 ALTER TABLE `registration_user` DISABLE KEYS */;
INSERT INTO `registration_user` VALUES (3,'teacher1','pbkdf2_sha256$870000$A1Cw0zPEemeFwFIxZ4GUmg$Hmp7yTOmlj4vWqOfZp4OMn9Oxv/sMdKf/kZ65xftCDQ=',0,1,'2024-12-03 02:08:30.542509',NULL,NULL),(4,'teacher2','pbkdf2_sha256$870000$nhw8X28EGFVbzQ2e8XSJDc$yr3+VLFWSO6mjLniFBBZDvo7jet+bmqa+YHuwm6sKT4=',0,1,NULL,NULL,NULL),(123454321,'student6','pbkdf2_sha256$870000$lTk9HC31QvaqSwpSyovwFl$cjZnOnkxmgH5fRlUe9bHqzO1sa3gPTyTccsgSU6FT1U=',1,0,NULL,'Jane','Doe'),(123456654,'student4','pbkdf2_sha256$870000$M1vSUdTH6KRcucdVUBPiLs$xT8a4NS47yg+F8GkUmbIsYaaTy/cN4Zx+gx1X2DAr7U=',1,0,NULL,'Joe','Rogan'),(123456785,'student3','pbkdf2_sha256$870000$noDw7iEmBIUYBenaDsEzz2$QY9dBNwr21RpahuFHCeQUZOS1fUCCMpudt7Y+EjZlp4=',1,0,'2024-12-02 23:52:43.739047','Elon','Musk'),(123457896,'student5','pbkdf2_sha256$870000$YB0V2CG2zaX7a0JS3xKPpK$CTmRB4lwW4oryBa/yK7wczlLVcC7i0TJi+NMADRCiAk=',1,0,NULL,'Thor','Odin Son'),(1000000001,'student1','pbkdf2_sha256$870000$H6cUGXCXjnURhdHKXTI7qk$rDVp7MaicrxMQcprievVwTP/i6QrAtNYGwSyKxrLuts=',1,0,'2024-12-03 02:41:40.932197','John','Doe'),(1000000002,'student2','pbkdf2_sha256$870000$L78uerlKtDiabvmVkCTQMt$XaQKFkFaeuDvGo3pCeRvJlR8TT4iJVZGmUtfnVKeNeo=',1,0,NULL,NULL,NULL),(1234598765,'student7','pbkdf2_sha256$870000$oRhxU47wMTWn4Y2HsiN6j2$h4PXxDw9PsL6ZzuT+dJ7dt6/eaLiXm2lAt+bx6//Fck=',1,0,'2024-12-03 00:33:45.842759','Santa','Claus');
/*!40000 ALTER TABLE `registration_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-02 19:25:48
