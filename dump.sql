-- MySQL dump 10.13  Distrib 5.7.39, for osx11.0 (x86_64)
--
-- Host: 127.0.0.1    Database: guialagamar
-- ------------------------------------------------------
-- Server version	5.7.39

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
-- Table structure for table `area_sliders`
--

DROP TABLE IF EXISTS `area_sliders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `area_sliders` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name_area` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `area_sliders`
--

LOCK TABLES `area_sliders` WRITE;
/*!40000 ALTER TABLE `area_sliders` DISABLE KEYS */;
INSERT INTO `area_sliders` VALUES (1,'principal',NULL,NULL),(2,'categoria',NULL,NULL),(3,'subcategoroia',NULL,NULL);
/*!40000 ALTER TABLE `area_sliders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `atrativo_subs`
--

DROP TABLE IF EXISTS `atrativo_subs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `atrativo_subs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `atrativo_id` int(10) unsigned NOT NULL,
  `subcat_id` int(10) unsigned NOT NULL,
  `cities_id` int(10) unsigned NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `atrativo_subs_atrativo_id_foreign` (`atrativo_id`),
  KEY `atrativo_subs_subcat_id_foreign` (`subcat_id`),
  KEY `atrativo_subs_cities_id_foreign` (`cities_id`),
  CONSTRAINT `atrativo_subs_atrativo_id_foreign` FOREIGN KEY (`atrativo_id`) REFERENCES `information` (`id`) ON DELETE CASCADE,
  CONSTRAINT `atrativo_subs_cities_id_foreign` FOREIGN KEY (`cities_id`) REFERENCES `cities` (`id`) ON DELETE CASCADE,
  CONSTRAINT `atrativo_subs_subcat_id_foreign` FOREIGN KEY (`subcat_id`) REFERENCES `sub_categories` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=271 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `atrativo_subs`
--

LOCK TABLES `atrativo_subs` WRITE;
/*!40000 ALTER TABLE `atrativo_subs` DISABLE KEYS */;
INSERT INTO `atrativo_subs` VALUES (100,9,1,1,'2018-11-21 20:07:45','2018-11-21 20:07:45'),(101,9,4,1,'2018-11-21 20:07:45','2018-11-21 20:07:45'),(102,9,6,1,'2018-11-21 20:07:45','2018-11-21 20:07:45'),(103,9,7,1,'2018-11-21 20:07:45','2018-11-21 20:07:45'),(104,9,11,1,'2018-11-21 20:07:45','2018-11-21 20:07:45'),(105,10,1,1,'2018-11-21 20:23:10','2018-11-21 20:23:10'),(106,10,4,1,'2018-11-21 20:23:10','2018-11-21 20:23:10'),(107,10,6,1,'2018-11-21 20:23:10','2018-11-21 20:23:10'),(108,10,7,1,'2018-11-21 20:23:10','2018-11-21 20:23:10'),(109,10,11,1,'2018-11-21 20:23:10','2018-11-21 20:23:10'),(133,7,1,1,'2018-11-29 22:42:23','2018-11-29 22:42:23'),(134,7,4,1,'2018-11-29 22:42:23','2018-11-29 22:42:23'),(135,7,6,1,'2018-11-29 22:42:23','2018-11-29 22:42:23'),(136,7,7,1,'2018-11-29 22:42:23','2018-11-29 22:42:23'),(137,7,11,1,'2018-11-29 22:42:23','2018-11-29 22:42:23'),(143,8,1,1,'2018-11-29 22:57:15','2018-11-29 22:57:15'),(144,8,4,1,'2018-11-29 22:57:15','2018-11-29 22:57:15'),(145,8,6,1,'2018-11-29 22:57:15','2018-11-29 22:57:15'),(146,8,7,1,'2018-11-29 22:57:15','2018-11-29 22:57:15'),(147,8,11,1,'2018-11-29 22:57:15','2018-11-29 22:57:15'),(154,12,1,1,'2018-12-13 15:23:51','2018-12-13 15:23:51'),(155,12,2,1,'2018-12-13 15:23:51','2018-12-13 15:23:51'),(156,12,4,1,'2018-12-13 15:23:51','2018-12-13 15:23:51'),(157,12,6,1,'2018-12-13 15:23:51','2018-12-13 15:23:51'),(158,12,7,1,'2018-12-13 15:23:51','2018-12-13 15:23:51'),(159,13,1,1,'2018-12-13 16:53:26','2018-12-13 16:53:26'),(160,13,2,1,'2018-12-13 16:53:26','2018-12-13 16:53:26'),(161,13,3,1,'2018-12-13 16:53:26','2018-12-13 16:53:26'),(162,13,4,1,'2018-12-13 16:53:26','2018-12-13 16:53:26'),(163,13,6,1,'2018-12-13 16:53:26','2018-12-13 16:53:26'),(164,14,1,1,'2018-12-13 17:07:57','2018-12-13 17:07:57'),(165,14,2,1,'2018-12-13 17:07:57','2018-12-13 17:07:57'),(166,14,3,1,'2018-12-13 17:07:57','2018-12-13 17:07:57'),(167,14,4,1,'2018-12-13 17:07:57','2018-12-13 17:07:57'),(168,14,6,1,'2018-12-13 17:07:57','2018-12-13 17:07:57'),(174,15,1,1,'2018-12-13 17:32:10','2018-12-13 17:32:10'),(175,15,2,1,'2018-12-13 17:32:10','2018-12-13 17:32:10'),(176,15,3,1,'2018-12-13 17:32:10','2018-12-13 17:32:10'),(177,15,4,1,'2018-12-13 17:32:10','2018-12-13 17:32:10'),(178,15,6,1,'2018-12-13 17:32:10','2018-12-13 17:32:10'),(179,16,3,1,'2018-12-13 18:11:47','2018-12-13 18:11:47'),(180,16,4,1,'2018-12-13 18:11:47','2018-12-13 18:11:47'),(181,16,6,1,'2018-12-13 18:11:47','2018-12-13 18:11:47'),(182,16,7,1,'2018-12-13 18:11:47','2018-12-13 18:11:47'),(183,16,8,1,'2018-12-13 18:11:47','2018-12-13 18:11:47'),(189,22,15,1,'2018-12-16 13:21:46','2018-12-16 13:21:46'),(191,5,1,1,'2019-01-02 17:46:52','2019-01-02 17:46:52'),(192,5,2,1,'2019-01-02 17:46:52','2019-01-02 17:46:52'),(193,5,3,1,'2019-01-02 17:46:52','2019-01-02 17:46:52'),(194,5,4,1,'2019-01-02 17:46:52','2019-01-02 17:46:52'),(195,5,6,1,'2019-01-02 17:46:52','2019-01-02 17:46:52'),(196,5,7,1,'2019-01-02 17:46:52','2019-01-02 17:46:52'),(197,5,68,1,'2019-01-02 17:46:52','2019-01-02 17:46:52'),(198,11,1,1,'2019-01-02 17:48:18','2019-01-02 17:48:18'),(199,11,2,1,'2019-01-02 17:48:18','2019-01-02 17:48:18'),(200,11,3,1,'2019-01-02 17:48:18','2019-01-02 17:48:18'),(201,11,4,1,'2019-01-02 17:48:18','2019-01-02 17:48:18'),(202,11,6,1,'2019-01-02 17:48:18','2019-01-02 17:48:18'),(203,11,7,1,'2019-01-02 17:48:18','2019-01-02 17:48:18'),(204,11,9,1,'2019-01-02 17:48:18','2019-01-02 17:48:18'),(205,11,68,1,'2019-01-02 17:48:18','2019-01-02 17:48:18'),(206,6,1,1,'2019-01-02 18:26:40','2019-01-02 18:26:40'),(207,6,3,1,'2019-01-02 18:26:40','2019-01-02 18:26:40'),(208,6,4,1,'2019-01-02 18:26:40','2019-01-02 18:26:40'),(209,6,6,1,'2019-01-02 18:26:40','2019-01-02 18:26:40'),(210,6,7,1,'2019-01-02 18:26:40','2019-01-02 18:26:40'),(211,6,8,1,'2019-01-02 18:26:40','2019-01-02 18:26:40'),(212,6,11,1,'2019-01-02 18:26:40','2019-01-02 18:26:40'),(213,6,68,1,'2019-01-02 18:26:40','2019-01-02 18:26:40'),(214,6,69,1,'2019-01-02 18:26:40','2019-01-02 18:26:40'),(216,25,1,1,'2019-01-19 14:10:00','2019-01-19 14:10:00'),(217,25,3,1,'2019-01-19 14:10:00','2019-01-19 14:10:00'),(218,25,4,1,'2019-01-19 14:10:00','2019-01-19 14:10:00'),(219,25,6,1,'2019-01-19 14:10:00','2019-01-19 14:10:00'),(220,25,7,1,'2019-01-19 14:10:00','2019-01-19 14:10:00'),(221,25,11,1,'2019-01-19 14:10:00','2019-01-19 14:10:00'),(222,18,20,1,'2019-01-19 14:22:19','2019-01-19 14:22:19'),(223,17,19,1,'2019-01-19 14:22:39','2019-01-19 14:22:39'),(224,19,21,1,'2019-01-19 14:22:53','2019-01-19 14:22:53'),(225,20,16,1,'2019-01-19 14:23:06','2019-01-19 14:23:06'),(226,21,14,1,'2019-01-19 14:23:40','2019-01-19 14:23:40');
/*!40000 ALTER TABLE `atrativo_subs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache`
--

DROP TABLE IF EXISTS `cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int(11) NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache`
--

LOCK TABLES `cache` WRITE;
/*!40000 ALTER TABLE `cache` DISABLE KEYS */;
INSERT INTO `cache` VALUES ('laravel_cache_356a192b7913b04c54574d18c28d46e6395428ab','i:1;',1719690350),('laravel_cache_356a192b7913b04c54574d18c28d46e6395428ab:timer','i:1719690350;',1719690350),('laravel_cache_7b52009b64fd0a2a49e6d8a939753077792b0554','i:1;',1719688325),('laravel_cache_7b52009b64fd0a2a49e6d8a939753077792b0554:timer','i:1719688325;',1719688325),('laravel_cache_a17961fa74e9275d529f489537f179c05d50c2f3','i:1;',1719689631),('laravel_cache_a17961fa74e9275d529f489537f179c05d50c2f3:timer','i:1719689631;',1719689631);
/*!40000 ALTER TABLE `cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_locks`
--

DROP TABLE IF EXISTS `cache_locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int(11) NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_locks`
--

LOCK TABLES `cache_locks` WRITE;
/*!40000 ALTER TABLE `cache_locks` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_locks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `categoryName` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'ATRATIVOS','2018-02-23 22:12:33','2024-05-30 22:19:55'),(3,'ROTEIROS E PASSEIOS','2018-02-26 13:29:14','2018-02-26 13:29:14'),(4,'ONDE SE HOSPEDAR','2018-02-26 13:29:35','2018-02-26 13:29:35'),(5,'ONDE COMER','2018-02-26 13:29:42','2018-02-26 13:29:42'),(6,'AGENDA DE EVENTOS','2018-02-26 13:29:57','2018-02-26 13:29:57'),(8,'SERVIÇOS','2018-02-26 22:09:10','2018-07-25 17:57:14'),(11,'NATUREZA E CULTURA ','2019-07-13 21:48:17','2019-07-13 21:48:17');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cities`
--

DROP TABLE IF EXISTS `cities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cities` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cityName` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cities`
--

LOCK TABLES `cities` WRITE;
/*!40000 ALTER TABLE `cities` DISABLE KEYS */;
INSERT INTO `cities` VALUES (1,'CANANEIA','2018-02-23 22:12:24','2024-05-30 18:29:18'),(2,'IGUAPE','2018-02-26 13:28:27','2018-02-26 13:28:27'),(3,'PARIQUERA-AÇU','2018-02-26 13:28:45','2018-02-26 13:28:45'),(4,'ILHA COMPRIDA','2018-02-26 13:28:53','2018-02-26 13:28:53');
/*!40000 ALTER TABLE `cities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comercio_subs`
--

DROP TABLE IF EXISTS `comercio_subs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comercio_subs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `comercio_id` int(10) unsigned NOT NULL,
  `subcat_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `cities_id` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `comercio_subs_comercio_id_foreign` (`comercio_id`),
  KEY `comercio_subs_subcat_id_foreign` (`subcat_id`),
  CONSTRAINT `comercio_subs_comercio_id_foreign` FOREIGN KEY (`comercio_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `comercio_subs_subcat_id_foreign` FOREIGN KEY (`subcat_id`) REFERENCES `sub_categories` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=227 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comercio_subs`
--

LOCK TABLES `comercio_subs` WRITE;
/*!40000 ALTER TABLE `comercio_subs` DISABLE KEYS */;
INSERT INTO `comercio_subs` VALUES (2,3,11,'2018-03-06 00:21:11','2018-03-06 00:21:11',NULL),(59,6,24,'2018-03-23 19:42:34','2018-03-23 19:42:34',NULL),(60,7,24,'2018-03-23 20:06:04','2018-03-23 20:06:04',NULL),(62,8,24,'2018-03-24 19:28:42','2018-03-24 19:28:42',NULL),(63,9,25,'2018-03-24 19:40:25','2018-03-24 19:40:25',NULL),(64,10,25,'2018-03-24 19:58:52','2018-03-24 19:58:52',NULL),(65,11,24,'2018-03-24 20:29:49','2018-03-24 20:29:49',NULL),(66,12,23,'2018-03-24 20:43:59','2018-03-24 20:43:59',NULL),(67,13,25,'2018-03-24 20:56:22','2018-03-24 20:56:22',NULL),(68,14,25,'2018-03-24 21:09:05','2018-03-24 21:09:05',NULL),(69,15,24,'2018-03-24 21:26:55','2018-03-24 21:26:55',NULL),(70,16,27,'2018-03-24 21:36:33','2018-03-24 21:36:33',NULL),(71,17,33,'2018-03-26 19:01:19','2018-03-26 19:01:19',NULL),(72,18,33,'2018-03-26 19:16:45','2018-03-26 19:16:45',NULL),(73,19,33,'2018-03-26 19:21:53','2018-03-26 19:21:53',NULL),(75,21,31,'2018-03-26 19:47:25','2018-03-26 19:47:25',NULL),(76,22,31,'2018-03-26 19:56:12','2018-03-26 19:56:12',NULL),(77,23,31,'2018-03-26 20:05:14','2018-03-26 20:05:14',NULL),(78,24,31,'2018-03-26 20:12:56','2018-03-26 20:12:56',NULL),(79,25,31,'2018-03-26 20:39:03','2018-03-26 20:39:03',NULL),(80,26,43,'2018-03-26 21:04:17','2018-03-26 21:04:17',NULL),(81,27,43,'2018-03-27 18:42:57','2018-03-27 18:42:57',NULL),(82,28,43,'2018-03-27 18:47:13','2018-03-27 18:47:13',NULL),(83,29,30,'2018-03-27 18:56:40','2018-03-27 18:56:40',NULL),(84,30,31,'2018-03-27 19:05:37','2018-03-27 19:05:37',NULL),(85,31,29,'2018-03-27 19:09:42','2018-03-27 19:09:42',NULL),(86,32,29,'2018-03-27 19:19:30','2018-03-27 19:19:30',NULL),(87,33,29,'2018-03-27 19:23:46','2018-03-27 19:23:46',NULL),(88,34,29,'2018-03-27 19:28:11','2018-03-27 19:28:11',NULL),(89,35,29,'2018-03-27 19:32:57','2018-03-27 19:32:57',NULL),(90,36,29,'2018-03-27 19:36:54','2018-03-27 19:36:54',NULL),(91,37,29,'2018-03-27 19:40:22','2018-03-27 19:40:22',NULL),(92,38,29,'2018-03-27 19:44:22','2018-03-27 19:44:22',NULL),(93,39,29,'2018-03-27 19:47:54','2018-03-27 19:47:54',NULL),(94,40,29,'2018-03-27 19:51:52','2018-03-27 19:51:52',NULL),(95,41,29,'2018-03-27 19:55:23','2018-03-27 19:55:23',NULL),(96,42,4,'2018-03-27 20:06:02','2018-03-27 20:06:02',NULL),(97,43,29,'2018-03-27 20:12:22','2018-03-27 20:12:22',NULL),(98,44,29,'2018-03-27 20:20:42','2018-03-27 20:20:42',NULL),(99,45,13,'2018-03-27 20:24:56','2018-03-27 20:24:56',NULL),(100,46,4,'2018-03-27 20:30:25','2018-03-27 20:30:25',NULL),(101,47,5,'2018-03-27 20:35:47','2018-03-27 20:35:47',NULL),(102,48,29,'2018-03-27 20:45:52','2018-03-27 20:45:52',NULL),(103,49,29,'2018-03-27 20:52:03','2018-03-27 20:52:03',NULL),(104,50,29,'2018-03-27 21:00:05','2018-03-27 21:00:05',NULL),(105,51,34,'2018-03-28 18:51:32','2018-03-28 18:51:32',NULL),(107,53,40,'2018-03-28 19:06:16','2018-03-28 19:06:16',NULL),(108,54,4,'2018-03-28 19:11:47','2018-03-28 19:11:47',NULL),(109,55,6,'2018-03-28 19:16:44','2018-03-28 19:16:44',NULL),(110,56,32,'2018-03-28 19:31:11','2018-03-28 19:31:11',NULL),(111,57,32,'2018-03-28 19:37:12','2018-03-28 19:37:12',NULL),(112,58,45,'2018-03-28 19:41:35','2018-03-28 19:41:35',NULL),(113,59,45,'2018-03-28 19:52:43','2018-03-28 19:52:43',NULL),(114,60,1,'2018-03-28 20:05:18','2018-03-28 20:05:18',NULL),(115,61,32,'2018-03-28 20:09:29','2018-03-28 20:09:29',NULL),(116,62,32,'2018-03-28 20:15:36','2018-03-28 20:15:36',NULL),(117,63,32,'2018-03-28 20:23:19','2018-03-28 20:23:19',NULL),(118,64,32,'2018-03-28 20:27:19','2018-03-28 20:27:19',NULL),(119,65,25,'2018-03-29 14:22:53','2018-03-29 14:22:53',NULL),(120,66,49,'2018-03-30 18:31:09','2018-03-30 18:31:09',NULL),(121,67,42,'2018-03-30 18:37:14','2018-03-30 18:37:14',NULL),(122,68,50,'2018-03-30 18:53:16','2018-03-30 18:53:16',NULL),(123,69,50,'2018-03-30 19:01:58','2018-03-30 19:01:58',NULL),(124,70,41,'2018-03-30 19:08:17','2018-03-30 19:08:17',NULL),(126,71,42,'2018-03-30 19:12:29','2018-03-30 19:12:29',NULL),(127,72,22,'2018-03-30 19:15:43','2018-03-30 19:15:43',NULL),(128,73,51,'2018-03-30 19:23:40','2018-03-30 19:23:40',NULL),(129,74,51,'2018-03-30 19:27:36','2018-03-30 19:27:36',NULL),(130,75,22,'2018-03-30 19:33:32','2018-03-30 19:33:32',NULL),(133,76,52,'2018-03-30 19:50:31','2018-03-30 19:50:31',NULL),(134,77,52,'2018-03-30 19:55:33','2018-03-30 19:55:33',NULL),(135,78,52,'2018-03-30 20:10:41','2018-03-30 20:10:41',NULL),(136,79,53,'2018-03-30 20:25:42','2018-03-30 20:25:42',NULL),(137,80,53,'2018-03-30 20:30:19','2018-03-30 20:30:19',NULL),(138,81,47,'2018-03-30 20:33:11','2018-03-30 20:33:11',NULL),(139,82,47,'2018-03-30 20:35:40','2018-03-30 20:35:40',NULL),(140,83,47,'2018-03-30 20:37:28','2018-03-30 20:37:28',NULL),(141,52,34,'2018-03-30 20:38:40','2018-03-30 20:38:40',NULL),(142,84,31,'2018-03-30 20:45:22','2018-03-30 20:45:22',NULL),(143,85,49,'2018-03-30 20:53:02','2018-03-30 20:53:02',NULL),(144,86,29,'2018-03-30 20:58:57','2018-03-30 20:58:57',NULL),(145,87,54,'2018-03-30 21:06:07','2018-03-30 21:06:07',NULL),(146,88,54,'2018-04-03 17:52:37','2018-04-03 17:52:37',NULL),(149,91,26,'2018-04-03 19:22:35','2018-04-03 19:22:35',NULL),(150,92,25,'2018-04-03 19:44:22','2018-04-03 19:44:22',NULL),(151,90,24,'2018-04-03 19:45:36','2018-04-03 19:45:36',NULL),(152,89,24,'2018-04-03 19:48:48','2018-04-03 19:48:48',NULL),(153,93,25,'2018-04-03 20:28:03','2018-04-03 20:28:03',NULL),(154,94,55,'2018-04-06 17:47:42','2018-04-06 17:47:42',NULL),(155,95,56,'2018-04-06 17:57:44','2018-04-06 17:57:44',NULL),(156,96,54,'2018-04-06 18:02:30','2018-04-06 18:02:30',NULL),(157,97,54,'2018-04-06 18:08:46','2018-04-06 18:08:46',NULL),(158,98,54,'2018-04-06 18:23:42','2018-04-06 18:23:42',NULL),(159,99,49,'2018-04-06 18:28:29','2018-04-06 18:28:29',NULL),(160,100,49,'2018-04-06 18:36:35','2018-04-06 18:36:35',NULL),(161,101,49,'2018-04-06 18:43:08','2018-04-06 18:43:08',NULL),(162,102,57,'2018-04-06 18:52:13','2018-04-06 18:52:13',NULL),(163,103,54,'2018-04-09 13:27:26','2018-04-09 13:27:26',NULL),(164,104,58,'2018-04-09 13:40:28','2018-04-09 13:40:28',NULL),(165,105,59,'2018-04-09 15:59:16','2018-04-09 15:59:16',NULL),(166,106,59,'2018-04-09 16:01:42','2018-04-09 16:01:42',NULL),(167,107,44,'2018-04-09 16:07:49','2018-04-09 16:07:49',NULL),(168,108,31,'2018-04-09 16:12:23','2018-04-09 16:12:23',NULL),(169,109,60,'2018-04-09 16:18:21','2018-04-09 16:18:21',NULL),(170,110,54,'2018-04-09 16:22:59','2018-04-09 16:22:59',NULL),(171,111,54,'2018-04-09 16:28:01','2018-04-09 16:28:01',NULL),(172,112,54,'2018-04-09 17:35:24','2018-04-09 17:35:24',NULL),(173,113,54,'2018-04-09 17:43:13','2018-04-09 17:43:13',NULL),(174,114,45,'2018-04-09 17:45:32','2018-04-09 17:45:32',NULL),(175,115,61,'2018-04-09 17:52:16','2018-04-09 17:52:16',NULL),(176,116,54,'2018-04-09 18:00:36','2018-04-09 18:00:36',NULL),(177,117,54,'2018-04-09 18:10:18','2018-04-09 18:10:18',NULL),(178,118,61,'2018-04-09 18:16:02','2018-04-09 18:16:02',NULL),(179,119,62,'2018-04-09 18:28:35','2018-04-09 18:28:35',NULL),(180,120,54,'2018-04-09 18:35:36','2018-04-09 18:35:36',NULL),(181,121,54,'2018-04-09 18:43:32','2018-04-09 18:43:32',NULL),(182,122,45,'2018-04-09 18:48:49','2018-04-09 18:48:49',NULL),(183,123,63,'2018-04-09 19:22:53','2018-04-09 19:22:53',NULL),(184,124,54,'2018-04-09 19:26:05','2018-04-09 19:26:05',NULL),(185,125,64,'2018-04-09 19:34:06','2018-04-09 19:34:06',NULL),(186,126,54,'2018-04-09 19:38:58','2018-04-09 19:38:58',NULL),(187,127,28,'2018-04-09 19:44:15','2018-04-09 19:44:15',NULL),(188,128,25,'2018-04-09 19:49:13','2018-04-09 19:49:13',NULL),(189,129,28,'2018-04-10 22:20:34','2018-04-10 22:20:34',NULL),(190,130,28,'2018-04-10 22:33:08','2018-04-10 22:33:08',NULL),(191,131,65,'2018-04-10 22:45:42','2018-04-10 22:45:42',NULL),(192,132,50,'2018-04-10 22:49:21','2018-04-10 22:49:21',NULL),(193,133,54,'2018-04-10 22:53:28','2018-04-10 22:53:28',NULL),(194,134,54,'2018-04-10 23:00:15','2018-04-10 23:00:15',NULL),(195,135,54,'2018-04-10 23:05:06','2018-04-10 23:05:06',NULL),(196,136,51,'2018-04-10 23:08:19','2018-04-10 23:08:19',NULL),(197,137,56,'2018-04-11 23:33:13','2018-04-11 23:33:13',NULL),(198,138,44,'2018-04-11 23:41:20','2018-04-11 23:41:20',NULL),(199,139,29,'2018-04-11 23:45:55','2018-04-11 23:45:55',NULL),(200,140,29,'2018-04-11 23:50:05','2018-04-11 23:50:05',NULL),(201,141,31,'2018-04-11 23:53:18','2018-04-11 23:53:18',NULL);
/*!40000 ALTER TABLE `comercio_subs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `companies`
--

DROP TABLE IF EXISTS `companies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `companies` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nome_empresa` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tel` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cel` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `endereco` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `latitude` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `longitude` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `desc` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `logoPath` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `linkSite` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `linkFace` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `linkinstagram` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cep` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `category_id` int(10) unsigned DEFAULT NULL,
  `cities_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `subcat_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `plano_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `companies_category_id_foreign` (`category_id`),
  KEY `companies_cities_id_foreign` (`cities_id`),
  KEY `companies_user_id_foreign` (`user_id`),
  KEY `companies_plano_id_foreign` (`plano_id`),
  CONSTRAINT `companies_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  CONSTRAINT `companies_cities_id_foreign` FOREIGN KEY (`cities_id`) REFERENCES `cities` (`id`),
  CONSTRAINT `companies_plano_id_foreign` FOREIGN KEY (`plano_id`) REFERENCES `plano_assinaturas` (`id`),
  CONSTRAINT `companies_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=153 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `companies`
--

LOCK TABLES `companies` WRITE;
/*!40000 ALTER TABLE `companies` DISABLE KEYS */;
INSERT INTO `companies` VALUES (3,'Pousada Recanto do Sol','(13) 3851-1162','(13) 99786-0377','hotelrecsol@gmail.com','R Pero Lobo','','','O HOTEL RECANTO DO SOL te convida para conhecer Cananéia. Situada no extremo sul do Litoral Paulista, no centro de um corredor biológico de 110 km.','1520295671.jpeg','http://hotelrecantodosol.com.br/','https://www.facebook.com/recantodosol.cananeia/','','1',5,1,2,0,0,'2018-03-06 00:21:11','2018-03-06 00:21:11',2),(6,'Recanto do Sol','1338511162','13997860377','hotelrecsol@gmail.com','R Pero Lobo, 271 Centro, Cananéia/SP','-25.0152342','-47.9274025','O HOTEL RECANTO DO SOL te convida para conhecer Cananéia. Situada no extremo sul do Litoral Paulista, no centro de um corredor biológico de 110 km.','1521833320.png','http://hotelrecantodosol.com.br/','https://www.facebook.com/recantodosol.cananeia/','não tem','1',4,1,3,0,0,'2018-03-23 19:28:40','2018-03-23 19:28:40',2),(7,'Chalé Refúgio Cananéia','1338513887','11995400215','@refugiocananeia','Rua 06, 145 Cananéia','00','00','Venha desfrutar das belezas de Cananeia num chalezinho tranquilo e aconchegante.','1521835564.jpg','@refugiocananeia','https://www.facebook.com/pg/refugiocananeia/about/?ref=page_internal','naõ consta','1',4,1,3,0,0,'2018-03-23 20:06:04','2018-03-23 20:06:04',2),(8,'Pousada Recanto Dos Papagaios','15996444142','15996444142','não tem','Rua Lidia Rodrigues Sebastião (Av.5) (0,39 km)','00','00','Pousada em Cananéia, litoral sul de São Paulo. Localizada em meio a Mata Atlântica, a Pousada Recanto dos Papagaios é garantia de tranquilidade.','1521918445.jpg','https://www.facebook.com/pg/pousadarecantodospapagaios/about/?ref=page_internal','https://www.facebook.com/pg/pousadarecantodospapagaios/about/?ref=page_internal','não tem','1',4,1,5,0,0,'2018-03-24 19:07:25','2018-03-24 19:07:25',1),(9,'Pousada Recanto do Morro','1338513370','11983692001','hermesrs@uol.com.br','Rua Prof. Bernard, 420 Morro de São João','00','00','Situada a 500mts do centro (Igreja Matriz), à Rua Prof. Bernard, 420, ao lado da\r\nSabesp, em uma área com 10.000mts2 de muito verde e muita tranquilidade.\r\n• Todas as suítes são equipadas de ar-condicionado, tv LCD com recepção parabólica, DVD e frigobar.','1521920425.jpg','http://recantodomorro.com.br/wp/pousada/','https://www.facebook.com/pages/Pousada-Recanto-Do-Morro/196299023814320','não tem','1',4,1,5,0,0,'2018-03-24 19:40:25','2018-03-24 19:40:25',1),(10,'A Pousadinha','133381663','11986775294','http://www.apousadinha.com.br/','Rua Frederico Trudes Da Veiga','00','00','A gente sabe que todo mundo que está viajando procura um lugar confortável, com boa localização e preço justo.\r\na pousadinha fica bem no centro de Cananeia, a apenas alguns passos de onde tudo acontece na cidade!','1521921532.jpg','http://www.apousadinha.com.br/','https://www.facebook.com/apousadinha/','não tem','1',4,1,5,0,0,'2018-03-24 19:58:52','2018-03-24 19:58:52',1),(11,'Hotel e Restaurante Mariana Utamaru','1338516126','não tem','marinautamaru@yahoo.com.br','Porto Cubatão - Cananeia - SP','24 58\' 46','47 56\' 38','As instalações aconchegantes do hotel oferecem internet wireless em todos os apartamentos.','1521923389.png','http://marinautamaru.com.br/wp/','https://www.facebook.com/marinautamaru/','não tem','1',4,1,5,0,0,'2018-03-24 20:29:49','2018-03-24 20:29:49',1),(12,'Pousada e Pesqueiro robalo','1338516151','13981448884','não tem','Rua Francisco Parcelino Franco, 240 Porto Cubatão | Cananéia, SP','00','00','O Pesqueiro do Robalo (Pousada e Marina) está localizado Bairro Porto Cubatão, na parte continental  de Cananéia, litoral sul de São Paulo','1521924239.png','http://pesqueirodorobalo.com.br/galeria/','https://www.facebook.com/marinapesqueiro/','@Pesqueirorobalo','1',4,1,5,0,0,'2018-03-24 20:43:59','2018-03-24 20:43:59',1),(13,'Pousada e Restaurante Maresia','1338516212','13997740435','https://plus.google.com/+PousadaerestaurantemaresiaBr','Av.Marciel de Araujo 213 -Porto Cubatão','00','00','Cananéia está situada no extremo sul do Litoral Paulista. É considerada um dos últimos remanescentes de Mata Atlântica intocada na costa brasileira e um dos maiores berçários de vida marinha do planeta.','1521924982.png','http://pousadaerestaurantemaresia.com.br/','https://www.facebook.com/pousadaerestaurantemaresia/','não tem','1',5,1,5,0,0,'2018-03-24 20:56:22','2018-03-24 20:56:22',1),(14,'Pousada Cambriú','1338511613','13997016985','https://plus.google.com/u/0/103840657724007111582','Praia do Cambriú Ilha do Cardoso','oo','oo','A Pousada Ilha do Cardoso está preparada com a infraestrutura necessária, e todo conforto para atender sua família em todos os momentos. Localizada dentro do Parque Estadual da Ilha do Cardoso, na Vila de Marujá,','1521925745.png','https://pousadailhadocardoso.com.br/','https://www.facebook.com/pousadailhadocardoso/','@pousada_ilha_do_cardoso','1',4,1,5,0,0,'2018-03-24 21:09:05','2018-03-24 21:09:05',1),(15,'Iate Clube Rio Verde','13981069954','não tem','não tem','Av. Intermares Jd. América.','00','00','PESCA.PASSEIO.BAR.RESTAURANTE.EVENTOS','1521926815.jpg','não tem','https://www.facebook.com/pg/IATE-CLUBE-RIO-VERDE-1115231451918484/about/?ref=page_internal','não tem','1',4,1,5,0,0,'2018-03-24 21:26:55','2018-03-24 21:26:55',1),(16,'Jura`s Quiosque Canping','13991937221','13997073833','não tem','Av Beira Mar, 50000 (47,10 km)','oo','00','Praia, Sol, Música boa, Ambiente Familiar e Boas Vibrações','1521927393.jpg','não tem','https://www.facebook.com/pg/Eduardojuras/about/?ref=page_internal','não tem','1',5,1,5,0,0,'2018-03-24 21:36:33','2018-03-24 21:36:33',1),(17,'O Casarão Bar e Petiscaria','1338513040','não tem','não tem','Praça Martim Afonso de Souza','00','00','Bar e Petiscaria','1522090879.jpg','não tem','https://www.facebook.com/ocasaraobarepetiscaria/','não tem','1',5,1,5,0,0,'2018-03-26 19:01:19','2018-03-26 19:01:19',1),(18,'Cataia de Cananeia','1381364349','13981364349','luiz_mayerhofer@matimperere.com.br','Rua do Artesão Quiosque 09','00','00','O Quiosque Caiçara encontra-se em funcionamento na rua do artesão de Cananéia, próximo a praça Theodolina Gomes. É administrada pelo Amir Oliveira, artesão e grande incentivador do Fandango Caiçara, ritmo musical típico aqui da região de Cananéia','1522091805.jpg','http://rabeca.org/?fd=276','não tem','não tem','1',5,1,5,0,0,'2018-03-26 19:16:45','2018-03-26 19:16:45',1),(19,'Cachaçaria J.Rios','1382050055','não tem','não tem','Rua tristão lobo nº 339','00','00','Cachaçaria','1522092113.jpg','não tem','https://www.facebook.com/pg/CachacariaJRios/about/?ref=page_internal','não tem','1',5,1,5,0,0,'2018-03-26 19:21:53','2018-03-26 19:21:53',1),(20,'Casa do Pão de Cananeia','1338513382','não tem','não tem','Av. Independência, 801,','00','00','Padaria','1522093107.jpg','não tem','não tem','não tem','1',5,1,5,0,0,'2018-03-26 19:38:27','2018-03-26 19:38:27',1),(21,'Nova Cafetaria','11982434822','não tem','não tem','Rua Frederico Trudes da Veiga 275','00','00','Cafeteria','1522093645.jpg','não tem','https://www.facebook.com/pages/Nova-Cafeteria/203608563339036','não tem','1',5,1,5,0,0,'2018-03-26 19:47:25','2018-03-26 19:47:25',1),(22,'Sorveteria e Cafeteria Beira Mar','997782923','não tem','não tem','AV.BEIRA MAR,83','00','00','saborosas sobremesas, massa kilo e cascão, paletas recheadas, café expressos, salgados assados, capuccino com sorvete e a nossa maravilhosa Barca de Açaí..','1522094172.jpg','não tem','https://www.facebook.com/pg/sorveteriabeiramar281115/about/?ref=page_internal','não tem','1',5,1,5,0,0,'2018-03-26 19:56:12','2018-03-26 19:56:12',1),(23,'Posto Rotta','1338511313','1338513437','não tem','Av Independência, 1426 Rotatória','00','00','Posto de Combustíveis. Troca de Óleo. Centro Automotivo. Auto Peças. Lavador. Loja de Conveniência.','1522094714.jpg','http://postorotta.com.br/wp/servicos/','https://www.facebook.com/postorotta/','não tem','1',8,1,5,0,0,'2018-03-26 20:05:14','2018-03-26 20:05:14',1),(24,'Craft Burg Ef Company','13981791856','não tem','não tem','Rua Lídia Rodrigues Sebastião, Carijo','00','00','Craft Burguer! \r\nSe você tem espírito empreendedor, seja já um franqueado!','1522095176.jpg','não tem','https://www.facebook.com/CraftBurguer/','não tem','1',5,1,5,0,0,'2018-03-26 20:12:56','2018-03-26 20:12:56',1),(25,'dedo de Prosa','11960638618','não tem','não tem','Avenida Beira Mar nº 5','00','00','Bar e Lachonete','1522096743.jpg','não tem','https://www.facebook.com/Dedo-de-Prosa-686136051452006/','não tem','1',5,1,5,0,0,'2018-03-26 20:39:03','2018-03-26 20:39:03',1),(26,'Mercado Takaji','1338513890','não tem','não tem','Avenida Independência','00','00','mercado','1522098257.jpeg','não tem','https://www.facebook.com/pages/Mercado-Takagi/458817957584214','não tem','1',5,1,5,0,0,'2018-03-26 21:04:17','2018-03-26 21:04:17',1),(27,'Supermercado da Ilha','1338511677','não tem','não tem','R D JOAO III, 6 CENTRO','00','00','Mercado','1522176177.jpg','http://supermercadosdailha.com.br/site/','https://www.facebook.com/smilhacananeia/','não tem','1',5,1,5,0,0,'2018-03-27 18:42:57','2018-03-27 18:42:57',1),(28,'Supermercado Yassuy','1338511609','não tem','não tem','Av. Independência, 194 - Centro','00','00','No Supermercado Yassuy você encontra as melhores ofertas, produtos de qualidade e atendimento personalizado.','1522176433.jpg','não tem','https://www.facebook.com/pg/supermercadoyassuy/about/?ref=page_internal','não tem','1',5,1,5,0,0,'2018-03-27 18:47:13','2018-03-27 18:47:13',1),(29,'Pizzaria Toscana','3851-3904','981464905','não tem','Av. Independência, 220','00','00','Escolha um tamanho e faça seu pedido ou saboreie em nosso salão!','1522177000.jpg','não tem','https://www.facebook.com/pg/toscanacananeia/about/?ref=page_internal','não tem','1',5,1,5,0,0,'2018-03-27 18:56:40','2018-03-27 18:56:40',1),(30,'Casa de Negros','13997302506','não tem','não tem','Rua do Artesão Quiosque 06','00','00','Casa de Negros','1522177537.jpeg','não tem','não tem','não tem','1',5,1,5,0,0,'2018-03-27 19:05:37','2018-03-27 19:05:37',1),(31,'Restaurante Bacharel','1338513443','não tem','não tem','835 Avenida Independência','00','00','Restaurante Bacharel, desde 1979 evoluindo a gastronomia local. \r\nEspecializada em Moqueca e peixe e caldeirada e frutos do mar, e toda diversidade de prato','1522177782.jpg','não tem','https://www.facebook.com/pg/restaurantebacharel/about/?ref=page_internal','não tem','1',5,1,5,0,0,'2018-03-27 19:09:42','2018-03-27 19:09:42',1),(32,'Restaurante e Bar Bambuzau','1338513341','16981710972','não tem','Av. Independência, 17','00','00','Restaurante e Bar Bambuzau','1522178370.jpg','não tem','https://b-m.facebook.com/BambuzauBar/?ref=page_internal&mt_nav=1','não tem','1',5,1,5,0,0,'2018-03-27 19:19:30','2018-03-27 19:19:30',1),(33,'Restaurante Beira Mar','1399642689','não tem','não tem','Av. Beira Mar, 219','00','00','Restaurante Beira Mar','1522178626.jpeg','não tem','não tem','não tem','1',5,1,5,0,0,'2018-03-27 19:23:46','2018-03-27 19:23:46',1),(34,'Restaurante Caiçara','1338511174','não tem','não tem','Praça Martim Afonso de Souza, nº41','00','00','Restaurante Caiçara','1522178891.jpg','não tem','https://www.facebook.com/caicaracananeia/?rf=220157198192191','não tem','1',5,1,5,0,0,'2018-03-27 19:28:11','2018-03-27 19:28:11',1),(35,'Restaurante Espertinho Beira mar','13997801001','não tem','não tem','Avenida Beira Mar 93','00','00','Restaurante Espertinho Beira mar','1522179177.png','não tem','https://www.facebook.com/pg/Espetinhos-Beira-Mar-298060127317728/about/?ref=page_internal','não tem','1',5,1,5,0,0,'2018-03-27 19:32:57','2018-03-27 19:32:57',1),(36,'Restaurante Gaivota','1338511550','não tem','não tem','Praça Martin Afonso de Souza','00','00','culinária e eventos Raul seixas','1522179414.jpg','não tem','https://www.facebook.com/pg/restaurantelanchonetegaivota/about/?ref=page_internal','não tem','1',5,1,5,0,0,'2018-03-27 19:36:54','2018-03-27 19:36:54',1),(37,'Restaurante Miramar','1338511287','não tem','não tem','Praça Martin Afonso de Souza','00','00','Bom para grupos\r\nBom para crianças\r\nMesas ao ar livre\r\nAceita reservas\r\nServiço de garçom\r\nClientes sem reserva são bem-vindos','1522179622.jpg','não tem','https://www.facebook.com/pg/miramarcananeia/about/','não tem','1',5,1,5,0,0,'2018-03-27 19:40:22','2018-03-27 19:40:22',1),(38,'Restaurante Pirão no Prato','1338511465','não tem','não tem','Rua Pero Lopes, 167','00','00','restaurante pirao no prato na rua do artesanato a arte de comer bem e barato','1522179862.jpg','não tem','https://www.facebook.com/pg/piraonoprato2005/about/?ref=page_internal','não tem','1',5,1,5,0,0,'2018-03-27 19:44:22','2018-03-27 19:44:22',1),(39,'Restaurante Point da Ilha','38513310','não tem','não tem','Rua Pedro Corrêa 66','00','00','Restaurante Point da Ilha','1522180074.jpg','não tem','https://www.facebook.com/pg/PointDaIlhaCananeiaSp/about/?ref=page_internal','não tem','1',5,1,5,0,0,'2018-03-27 19:47:54','2018-03-27 19:47:54',1),(40,'Restaurante Porto camarão','1338513994','não tem','não tem','Avenida Independência, 661 (','00','00','Restaurante Porto Camarão, especialidade em frutos do mar. Também temos carnes, massas. Pizzaria forno à lenha; Dois salões, capacidade para 300 pessoas; bem arejado e aconchegante.','1522180312.jpg','não tem','https://www.facebook.com/pg/Restaurante-Porto-Camar%C3%A3o-404204399665274/about/?ref=page_internal','não tem','1',5,1,5,0,0,'2018-03-27 19:51:52','2018-03-27 19:51:52',1),(41,'Restaurante sambaqui','1338510313','não tem','não tem','Rua Pedro Lima, 245-345','00','00','Restaurante sambaqui','1522180523.jpg','não tem','https://www.facebook.com/pages/Restaurante-Sambaqui/124839297672446','não tem','1',5,1,5,0,0,'2018-03-27 19:55:23','2018-03-27 19:55:23',1),(42,'Restaurante Rios das Minas','19992947069','13981951965','não tem','Sitio Duas Quedas Estrada do Ariri,','00','00','Restaurante Rios das Minas','1522181162.JPG','http://www.sitioduasquedas.com.br/site/restaurante-2/','não tem','não tem','1',3,1,5,0,0,'2018-03-27 20:06:02','2018-03-27 20:06:02',1),(43,'Restaubar Ostra e Cataia','13981998768','não tem','não tem','Estrada do Ariri km 11','00','00','Aceita reservas\r\nClientes sem reserva são bem-vindos\r\nBom para grupos\r\nBom para crianças\r\nMesas ao ar livre','1522181542.jpg','não tem','https://www.facebook.com/pg/restaubarostraecataia.com.br/about/?ref=page_internal','não tem','1',5,1,5,0,0,'2018-03-27 20:12:22','2018-03-27 20:12:22',1),(44,'Restaurante da D. Maria','1338521148','13981588226','não tem','Rua do Mar,211','00','00','Restaurante da D. Maria','1522182042.jpeg','não tem','não tem','não tem','1',5,1,5,0,0,'2018-03-27 20:20:42','2018-03-27 20:20:42',1),(45,'Restaurante Itacuruça','1338513822','não tem','não tem','Ilha do Cardoso Cananéia','00','00','Restaurante Itacuruça','1522182296.jpg','não tem','não tem','não tem','1',5,1,5,0,0,'2018-03-27 20:24:56','2018-03-27 20:24:56',1),(46,'Restaurante Recanto do Golfinhos','13981392273','não tem','não tem','Ilha do Cardoso Cananéia','00','00','Restaurante Recanto Dos Golfinhos, Parque Estadual da Ilha do Cardoso na comunidade do Itacuruçá.\r\nFaça-nos uma visita.','1522182625.jpg','não tem','https://www.facebook.com/pg/NoeliMonitora/about/?ref=page_internal','não tem','1',5,1,5,0,0,'2018-03-27 20:30:25','2018-03-27 20:30:25',1),(47,'Restaurante Ilha do cardoso','138521215','1398112569','não tem','Ilha do Cardoso Cananéia','00','00','Restaurante Ilha do cardoso','1522182947.jpeg','não tem','não tem','não tem','1',5,1,5,0,0,'2018-03-27 20:35:47','2018-03-27 20:35:47',1),(48,'Quiosque da Neia','139816695330','13997722402','não tem','AV.BEIRA MAR,85','00','00','Quiosque da Neia','1522183552.jpeg','não tem','https://www.facebook.com/pages/Quiosque-Da-Neia/231813583837109','não tem','1',5,1,5,0,0,'2018-03-27 20:45:52','2018-03-27 20:45:52',1),(49,'Tribos Food Park','13990733833','não tem','não tem','Av.Beira Mar,90','00','00','Tribos Food Park','1522183923.jpeg','não tem','não tem','não tem','1',5,1,5,0,0,'2018-03-27 20:52:03','2018-03-27 20:52:03',1),(50,'Quintal do Otani','13996151512','não tem','não tem','Avenida Beira mar,85','00','00','Quintal do Otani','1522184405.jpg','não tem','https://www.facebook.com/pg/quintalotani/about/?ref=page_internal','não tem','1',5,1,5,0,0,'2018-03-27 21:00:05','2018-03-27 21:00:05',1),(51,'Frutos de Goiás','13996008692','não tem','não tem','Rua Bandeirantes, 40','00','00','Sorvetes artesanais. 90% Fruta. Sobremesas. Sorvetes zero lactose e zero açúcar.','1522263092.png','http://frutosdegoias.com.br/','https://www.facebook.com/frutosdegoiascananeia/','@oficialfrutosdegoias','1',5,1,5,0,0,'2018-03-28 18:51:32','2018-03-28 18:51:32',1),(52,'Go! Shake','13981355900','não tem','não tem','Rua Pero Lopes ,02-Centro Historico','00','00','Go! Shake','1522263423.jpeg','não tem','não tem','não tem','1',5,1,5,0,0,'2018-03-28 18:57:03','2018-03-28 18:57:03',1),(53,'Arteca - Assoc dos Artesãos de Cananeia','13996683854','11987411173','não tem','Rua Tristão Lobo ,409-centro historico','00','00','Arteca - Assoc dos Artesãos de Cananeia','1522263976.jpg','não tem','https://www.facebook.com/arteca.artesaosdecananeia/about?lst=100004252359249%3A100002821454121%3A1522263651','não tem','1',8,1,5,0,0,'2018-03-28 19:06:16','2018-03-28 19:06:16',1),(54,'Artes de Ilha antonio quiosque 11','1338513817','13997895321','não tem','Rua do Artesão Quiosque 11','00','00','Artes de Ilha antonio','1522264307.jpeg','não tem','não tem','não tem','1',1,1,5,0,0,'2018-03-28 19:11:47','2018-03-28 19:11:47',1),(55,'Cantinho  da solução Do Carmo','13981079288','não tem','não tem','Rua do Artesão Quiosque 02','00','00','Cantinho  da solução Do Carmo','1522264604.jpeg','não tem','não tem','não tem','1',1,1,5,0,0,'2018-03-28 19:16:44','2018-03-28 19:16:44',1),(56,'Maeli Cabelereira','139817005233','não tem','não tem','Rua João De Oliveira Rosa Júnior,319','00','00','Maeli Cabelereira','1522265471.jpeg','não tem','não tem','não tem','1',8,1,5,0,0,'2018-03-28 19:31:11','2018-03-28 19:31:11',1),(57,'Chaveiro Shibuya','1338512029','13982008825','não tem','Rua Frederico Trudes da Veiga 333','00','00','Chaves, Carimbos, Plastificação, encadernação, artesanatos, arte digital, cartões de visita, cardápios, convites, panfletos...','1522265832.jpg','não tem','https://www.facebook.com/pg/Chaveiro-Shibuya-206988552669750/about/?ref=page_internal','não tem','1',8,1,5,0,0,'2018-03-28 19:37:12','2018-03-28 19:37:12',1),(58,'Drogarias Regifarma - Unidade l','1338511141','não tem','não tem','Av. Independência, 373','00','00','TRADIÇÃO E QUALIDADE NO ATENDIMENTO VOCÊ ENCONTRA NAS DROGARIAS REGIFARMA. A FARMÁCIA DA FAMILIA CANANEENSE.','1522266095.jpg','não tem','https://www.facebook.com/pg/Drogaria-Regifarma-173457019665166/about/?ref=page_internal','não tem','1',8,1,5,0,0,'2018-03-28 19:41:35','2018-03-28 19:41:35',1),(59,'Drogarias Regifarma - Unidade ll','1338511141','não tem','não tem','Av.Independencia,373-rocio','00','00','Drogarias Regifarma - Unidade ll','1522266763.jpg','não tem','https://www.facebook.com/Drogaria-Regifarma-173457019665166/','não tem','1',8,1,5,0,0,'2018-03-28 19:52:43','2018-03-28 19:52:43',1),(60,'Fernando Oliveira Silva','13981029918','não tem','feroliveirasil@gmail.com','Rua João Gonçalves de Araujo, 316','00','00','guia de turismo(Regional,Nacional,America do Sul)especializado em turismo Educacional, cultural,Comunitário e ecoturismo','1522267518.jpeg','não tem','wwwmatim.com.br','não tem','1',8,1,5,0,0,'2018-03-28 20:05:18','2018-03-28 20:05:18',1),(61,'ceia','13981775390','13997317120','não tem','Rua João De Oliveira Rosa Júnior,319','00','00','ceia','1522267769.jpeg','não tem','não tem','não tem','1',8,1,5,0,0,'2018-03-28 20:09:29','2018-03-28 20:09:29',1),(62,'Apollo Mecanico','1338511915','13997143985','não tem','Rua Pero Lobo,220-Centro Historico','00','00','Apollo Mecanico','1522268136.jpeg','não tem','não tem','não tem','1',8,1,5,0,0,'2018-03-28 20:15:36','2018-03-28 20:15:36',1),(63,'Gr Motos','38511480','não tem','não tem','Rua Antonio Paulino de Almeida,271','00','00','Gr Motos','1522268599.jpg','não tem','https://www.facebook.com/pg/Jrmotosemotores/about/?ref=page_internal','não tem','1',8,1,5,0,0,'2018-03-28 20:23:19','2018-03-28 20:23:19',1),(64,'ONC Oficina Naltica Cananeia','1338511818','não tem','não tem','Rua Bandeirantes, 32','00','00','ONC Oficina Naltica Cananeia','1522268839.jpeg','não tem','não tem','não tem','1',8,1,5,0,0,'2018-03-28 20:27:19','2018-03-28 20:27:19',1),(65,'Namastê Hospedagem, Galeria de Artes & Eventos','(13) 98168-8868','(13) 98168-8868','pousada.namaste@hotmail.com','Avenida Intermares, 435','-25.028069','-47.890686','A pousada Namastê fica localizada na Ilha Comprida, extremo litoral sul de São Paulo entre a Ilha do Cardoso e a Estação Ecológica Juréia, belezas naturais visitadas por turistas do mundo inteiro. Estamos a 300m da praia de Ilha Comprida - Boqueirão Sul e a 4km da balsa para a cidade de Cananéia.','1522333373.png','http://www.pousadacampingnamaste.com.br','https://www.facebook.com/pg/pousadanamaste','não consta','1',4,1,3,0,0,'2018-03-29 14:22:53','2018-03-29 14:22:53',3),(66,'Micropintura Tira Risco Automotivo','11969665636','não tem','não tem','Av.Seis,222-Acaraú','00','00','Micropintura Tira Risco Automotivo','1522434669.jpeg','não tem','n','não tem','1',8,1,5,0,0,'2018-03-30 18:31:09','2018-03-30 18:31:09',1),(67,'Marina Cananeia','1338511105','13981291976','não tem','Rua Ernesto M Simões','00','00','Empresa ligada ao turismo náutico em Cananeia, litoral sul de São Paulo. Garagem náutica, locação de lanchas para pesca e passeio.','1522435034.jpg','não tem','https://www.facebook.com/pg/MarinaCananeia/about/?ref=page_internal','não tem','1',8,1,5,0,0,'2018-03-30 18:37:14','2018-03-30 18:37:14',1),(68,'Marina Goudenberg','1338511105','13981291976','https://plus.google.com/+Wix','Av.Intermares,1697','00','00','Marina Goudenberg','1522435996.png','http://marinagoldenberg.wixsite.com/marina','https://www.facebook.com/pg/wix/about/?ref=page_internal','não tem','1',8,1,5,0,0,'2018-03-30 18:53:16','2018-03-30 18:53:16',1),(69,'Porto Marina Homem do Mar','1338511973','não tem','não tem','Av. Luis Wilson Barbosa, 770','25º 00\' 23\"','47º 55\' 18\"','Porto Marina Homem do Mar','1522436518.jpg','http://marinahomemdomar.com.br/site/','https://www.facebook.com/portomarinahomemdomar/','não tem','1',8,1,5,0,0,'2018-03-30 19:01:58','2018-03-30 19:01:58',1),(70,'Assoc.dos MonitoresAmbientaentais de Turismo Munic.de Cananeia(AMOAMCA)','não tem','não tem','não tem','não tem','00','00','Assoc.dos MonitoresAmbientaentais de Turismo Munic.de Cananeia(AMOAMCA)','1522436897.jpeg','não tem','não tem','não tem','1',8,1,5,0,0,'2018-03-30 19:08:17','2018-03-30 19:08:17',1),(71,'Carlinhos','13997224557','não tem','não tem','não tem','00','00','Carlinhos','1522437081.jpeg','não tem','não tem','não tem','1',8,1,5,0,0,'2018-03-30 19:11:21','2018-03-30 19:11:21',1),(72,'Jura`s Pescaria','133814009','139960045538','não tem','Rua Prof.Besnard,11/ 30-Centro','00','00','Jura`s Pescaria','1522437343.jpeg','não tem','não tem','não tem','1',8,1,5,0,0,'2018-03-30 19:15:43','2018-03-30 19:15:43',1),(73,'Peixaria Integrados ao Mar','41999283695','não tem','não tem','Rua Francisco Assis Paiva ,195','00','00','Peixaria Integrados ao Mar','1522437820.jpeg','não tem','não tem','não tem','1',8,1,5,0,0,'2018-03-30 19:23:40','2018-03-30 19:23:40',1),(74,'Peixaria Praia Et Mar/Mari Peixes Nobres','13982107153','não tem','não tem','Rua professor besnard n.140','00','00','Peixes frescos do dia,após manipulados e congelados com temperaturas de 26 graus negativos e embalados com data de validades.','1522438056.jpg','não tem','https://www.facebook.com/pg/Peixaria-praia-mar-mari-1621194544794055/about/?ref=page_internal','não tem','1',8,1,5,0,0,'2018-03-30 19:27:36','2018-03-30 19:27:36',1),(75,'Black Mamba Pescaria em Alto Mar','11960574319','não tem','não tem','não tem','00','00','Black Mamba Fishing','1522438412.jpg','não tem','https://www.facebook.com/pg/BlackMambaFishingAdventure/about/?ref=page_internal','não tem','1',8,1,5,0,0,'2018-03-30 19:33:32','2018-03-30 19:33:32',1),(76,'Michel Chiló Guia de Pesca','11974647610','não tem','não tem','não tem','00','00','Michel Chiló Guia de Pesca','1522438796.jpg','não tem','https://www.facebook.com/michel.chilo/about?lst=100000339431619%3A100002385227704%3A1522438614','não tem','1',8,1,5,0,0,'2018-03-30 19:39:56','2018-03-30 19:39:56',1),(77,'Nonô Faria guia de Pesca','13997578077','não tem','não tem','não tem','00','00','Nonô Faria guia de Pesca','1522439733.jpg','não tem','https://www.facebook.com/nono.faria','não tem','1',8,1,5,0,0,'2018-03-30 19:55:33','2018-03-30 19:55:33',1),(78,'Pescaria Alto Mar','15974012828','não tem','não tem','não tem','00','00','Temos os melhores pontos de pesca da região, Ilha da Figueira e outras, pesca cortesia de Pescadas e Robalos, Parcel e Naufrágios','1522440641.jpg','http://pescariacananeiaaltomar.com.br/','https://www.facebook.com/pg/pescariacananeiaaltomar/about/?ref=page_internal','não tem','1',8,1,5,0,0,'2018-03-30 20:10:41','2018-03-30 20:10:41',1),(79,'Casa de Variedades xavier','13385111256','não tem','não tem','Av.Independência,104','00','00','Casa de Variedades xavier','1522441542.jpeg','não tem','não tem','não tem','1',8,1,5,0,0,'2018-03-30 20:25:42','2018-03-30 20:25:42',1),(80,'Spuma da Ilha','1338511646','não tem','não tem','Frederico Trudes da Veiga, 223 Rocio','00','00','Spuma da Ilha - A Casa tem Tudo: Tudo que você procura em um só lugar. Rações, acessórios e medicamentos veterinários; hidráulica, elétrica; ferragens...','1522441819.jpg','não tem','https://business.facebook.com/pg/spumadailha.acasatemtudo/about/?ref=page_internal','não tem','1',8,1,5,0,0,'2018-03-30 20:30:19','2018-03-30 20:30:19',1),(81,'Pronto Atendimento Saúde','13385112032','192','não tem','Centro de Saúde','00','00','Pronto Atendimento Saúde','1522441991.jpeg','não tem','não tem','não tem','1',8,1,5,0,0,'2018-03-30 20:33:11','2018-03-30 20:33:11',1),(82,'Policía civil','1338511166','não tem','não tem','Delegacia','00','00','Policía civil','1522442140.jpeg','não tem','não tem','não tem','1',8,1,5,0,0,'2018-03-30 20:35:40','2018-03-30 20:35:40',1),(83,'Policía militar','13385111688','190','não tem','Posto de Emergencia','00','00','Policía militar','1522442248.jpeg','não tem','não tem','não tem','1',8,1,5,0,0,'2018-03-30 20:37:28','2018-03-30 20:37:28',1),(84,'Arena Rotta','1338511313','não tem','não tem','Avenida Independência, 1426','00','00','ARENA ROTTA. Quadra de FUT5 de Grama Sintética, Bilhar, Churrasqueira, Bar e Lanchonete. Venha se descontrair no novo Point de Cananéia. Anexo ao Posto.','1522442722.jpg','não tem','https://www.facebook.com/pg/arenarotta/about/?ref=page_internal','não tem','1',8,1,5,0,0,'2018-03-30 20:45:22','2018-03-30 20:45:22',1),(85,'Apollo Mecanica','1338511915','13997143985','não tem','Na esquina das ruas Pero Lobo com Pero Lopes Centro','00','00','Auto Mecânica\r\nAPOLLO','1522443182.jpg','http://www.cananet.com.br/apollo/','não tem','não tem','1',8,1,5,0,0,'2018-03-30 20:53:02','2018-03-30 20:53:02',1),(86,'Sambaqui','1338512058','não tem','não tem','Rua Pedro Lima, 245-345','00','00','Sambaqui','1522443537.jpg','não tem','https://www.facebook.com/profile.php?id=100012473440979&lst=100000339431619%3A100012473440979%3A1522443433&sk=about','não tem','1',5,1,5,0,0,'2018-03-30 20:58:57','2018-03-30 20:58:57',1),(87,'Toyo Joya','1338283030','não tem','não tem','Av. Independência, 17 - Centro','00','00','toyo Joya Materiais para construção - Ajudando a construir um futuro melhor!','1522443967.jpg','http://www.toyojoya.com.br/lojas.php','https://www.facebook.com/pg/toyojoya/about/?ref=page_internal','não tem','1',8,1,5,0,0,'2018-03-30 21:06:07','2018-03-30 21:06:07',1),(88,'madeireira cuiaba','1338423135','não tem','não tem','av. beira mar,12.650','00','00','madeireira cuiaba ilha comprida','1522777957.jpg','não tem','https://www.facebook.com/madeireira.cuiaba','não tem','1',8,4,4,0,0,'2018-04-03 17:52:37','2018-04-03 17:52:37',1),(89,'Pousada Adriana Beach','1338421151','não tem','contato@adrianabeach.com.br','Av. São Paulo, 35 - Balneário Adriana','00','00','A Pousada Adriana Beach, existente a mais de 24 anos no mercado, vem crescendo para melhor atendê-los. Por isso possui uma ampla estrutura, para seus momento de lazer e conforto.','1522780178.png','http://adrianabeach.com.br','https://www.facebook.com/adrianabeachpousada','não tem','1',4,4,4,0,0,'2018-04-03 18:29:38','2018-04-03 18:29:38',1),(90,'Toya Hotel','1338423350','11985216740','carlos_toya@yahoo.com.br','Av. Beira mar 16.260 Balneário 7 de Setembro','00','00','Localizado na Praia de Ilha Comprida, na qual esta abrindo suas portas ao turismo, o Toya Hotel é um verdadeiro refúgio sendo à beira mar e afastado 2,5 km do centro. A praia possui uma paisagem impressionante ao longo de seus 70 km, onde é possível encontrar ampla vegetação natural e pessoas praticantes de esportes radicais.','1522781016.png','http://www.toyahotel.com.br','https://www.facebook.com/ToyaHotel','https://www.instagram.com/toyahotel','1',4,4,4,0,0,'2018-04-03 18:43:36','2018-04-03 18:43:36',1),(91,'hotel pousada recanto','1338423838','11968536869','contato@pousadarecantoilhacomprida.com.br','R. Girassol, 65. Balneário Meu Recanto','00','00','Localizado na cidade de Ilha Comprida, uma das últimas áreas remanescentes da Mata Atlântica e um dos últimos ecossistemas não poluídos do litoral brasileiro, com 74 quilômetros de praias, áreas de mangues, sítios arqueológicos, matas, dunas e espécies raras de aves.O HOTEL POUSADA RECANTO vem servindo seus hospedes desde 2001, figurando entre as melhores opções de hospedagem da cidade. É o lugar perfeito para quem deseja tranquilidade e conforto, cercado por uma ampla área verde.','1522783355.png','http://pousadarecantoilhacomprida.com.br','este conteudo não esta disponivel no momento','https://www.instagram.com/pousadarecantoilhacomprida/','1',4,4,4,0,0,'2018-04-03 19:22:35','2018-04-03 19:22:35',1),(92,'Pousada Ilha Resort','1338424142','11995438883','não tem','Av. Beira Mar, 11.460,  Balneário Icaraí','00','00','A Pousada Ilha Resort está presente em Ilha Comprida desde 1994, preocupada sempre em atender seus clientes \r\ncom qualidade, conforto   e dedicação.','1522784662.jpg','http://www.pousadailharesort.com.br/','https://www.facebook.com/ilharesort/?ref=br_rs','não tem','1',4,4,4,0,0,'2018-04-03 19:44:22','2018-04-03 19:44:22',1),(93,'Pousada da Morena','1238652225','11942100718','pousadamorena@gmail.com','Rua das Rosas, 219','00','00','pousada da morena','1522787283.jpeg','http://www.pousadadamorena.com.br','não tem','não tem','1',4,4,6,0,0,'2018-04-03 20:28:03','2018-04-03 20:28:03',1),(94,'Casa de Carnes Boi Branco','1338423227','não tem','não tem','Copacabana Ilha Comprida','00','00','Casa de Carnes Boi Branco','1523036862.jpg','não tem','https://www.facebook.com/pg/Casa-de-Carnes-Boi-Branco-1939585249588397/about/?ref=page_internal','não tem','1',8,4,4,0,0,'2018-04-06 17:47:42','2018-04-06 17:47:42',1),(95,'Ilha Mar Produtos Agropecuarios','1338422140','996534930','não tem','Al.Bermudas,180','00','00','Ilha Mar Produtos Agropecuarios','1523037464.jpeg','não tem','não tem','não tem','1',8,4,4,0,0,'2018-04-06 17:57:44','2018-04-06 17:57:44',1),(96,'A e A Locaçao','1338432202','981497938','não tem','Av.Candapui,2110','00','00','A e A Locaçao','1523037750.jpeg','não tem','não tem','não tem','1',8,4,3,0,0,'2018-04-06 18:02:30','2018-04-06 18:02:30',1),(97,'Estilo Esquadrias de Aluminio eVidraçaria','1338424425','13981167900','não tem','Av. São Paulo, 1150','00','00','Horário de Funcionamento:\r\nde Segunda a Sábado','1523038126.jpg','não tem','https://www.facebook.com/pg/estiloaluminios/about/?ref=page_internal','não tem','1',8,4,4,0,0,'2018-04-06 18:08:46','2018-04-06 18:08:46',1),(98,'Depósito Viareggio','1338424175','996165020','não tem','Av. Beira mar,29240','00','00','Depósito Viareggio','1523039022.jpeg','não tem','não tem','não tem','1',8,4,4,0,0,'2018-04-06 18:23:42','2018-04-06 18:23:42',1),(99,'Fenomeno Auto Center','1397968915','não tem','não tem','Rua bermudas 810','00','00','Fenomeno Auto Center','1523039308.jpg','não tem','https://www.facebook.com/pg/Auto-Center-Fen%C3%B4meno-113968088750826/about/?ref=page_internal','não tem','1',8,4,4,0,0,'2018-04-06 18:28:28','2018-04-06 18:28:28',1),(100,'Auto Peças Redentor','1338424311','997317546','não tem','Av.Veredor carlos de Paula,105','00','00','Auto Peças Redentor','1523039795.jpeg','não tem','não tem','não tem','1',8,4,4,0,0,'2018-04-06 18:36:35','2018-04-06 18:36:35',1),(101,'Auto Peças Leçao','13996345305','38424537','não tem','Av.Copacacabana,890','00','00','Auto Peças Leçao','1523040188.jpeg','não tem','não tem','não tem','1',8,4,4,0,0,'2018-04-06 18:43:08','2018-04-06 18:43:08',1),(102,'bicicletaria ciclo freitas','1338422151','não tem','ciclofreitas@hotmail.com','Av.copacabana 460','00','00','venda de peças, acessórios, reformas e concertos em geral.','1523040733.jpg','não tem','https://www.facebook.com/ciclofreitas1/','não tem','1',8,4,4,0,0,'2018-04-06 18:52:13','2018-04-06 18:52:13',1),(103,'vidraçaria e serralheria central','1338561700','13997055951','contato@vidracariacentralpariquera.com.br','Rua 11 - Vila Verônica','00','00','A VIDRAÇARIA CENTRAL PARIQUERA é uma empresa especializada em fornecimento e instalação de vidros que preza pela qualidade nos serviços e cumprimento dos prazos estabelecidos','1523280446.jpg','http://vidracariacentralpariquera.com.br/','https://www.facebook.com/vidracariacentral.pariquera/','não tem','1',8,3,4,0,0,'2018-04-09 13:27:26','2018-04-09 13:27:26',1),(104,'Xodo moda country','1338565329','não tem','não tem','Avenida Dr. Carlos Botelho, 160 Centro','00','00','Xodo moda country','1523281228.png','não tem','https://www.facebook.com/Xodo-moda-country-1927817344138679/','não tem','1',8,3,4,0,0,'2018-04-09 13:40:28','2018-04-09 13:40:28',1),(105,'wizard','1338561641','não tem','não tem','r. romeo monti, 236','00','00','Tornar uma nação bilíngue!','1523289556.png','http://www.wizard.com.br/','Wizard Unidade Pariquera-Açu','não tem','1',8,3,4,0,0,'2018-04-09 15:59:16','2018-04-09 15:59:16',1),(106,'wizard','1338412361','não tem','não tem','Rua Major Moutinho, 155 - Centro','00','00','Escola de Idiomas Wizard localizada na cidade de Iguape-SP, reconhecida pela sua metodologia uma das melhores do mundo.','1523289702.png','http://www.wizard.com.br/','https://www.facebook.com/wizardiguape/','não tem','1',8,2,4,0,0,'2018-04-09 16:01:42','2018-04-09 16:01:42',1),(107,'posto bufalo','1338561159','não tem','não tem','Rodovia Regis Bittencourt KM-462','00','00','Auto Posto Bufalo do Vale Ltda','1523290069.jpg','não tem','Auto Posto Bufalo do Vale Ltda','não tem','1',8,3,4,0,0,'2018-04-09 16:07:49','2018-04-09 16:07:49',1),(108,'lanchonete e churrascaria 204','1338564049','não tem','não tem','km 462, Rod. Régis Bittencourt, 1087','00','00','Comida tarde da noite · Buffet à vontade','1523290343.jpeg','não tem','não tem','não tem','1',5,3,4,0,0,'2018-04-09 16:12:23','2018-04-09 16:12:23',1),(109,'Churrascaria Berrante de Prata','não tem','13982199847','não tem','Rua XV de Novembro, 320- CENTRO','00','00','Rodízio de carnes selecionadas com os melhores cortes para você e sua família saborear. Oferecemos variedades de comidas incluindo culinária japonesa.','1523290701.jpg','não tem','https://www.facebook.com/ChurrascariaBerrantedePrata/','não tem','1',5,3,4,0,0,'2018-04-09 16:18:21','2018-04-09 16:18:21',1),(110,'casa do fazendeiro','1338414173','não tem','não tem','rod. pref. casemiro teixeira, 486 - porto ribeira','00','00','casa do fazendeiro','1523290979.jpeg','não tem','não tem','não tem','1',8,2,4,0,0,'2018-04-09 16:22:59','2018-04-09 16:22:59',1),(111,'Serralheria Good Steel','não tem','13996214546','não tem','av. nossa senhora do rocio n1021 rocio','00','00','Serralheria Good Steel','1523291281.jpg','não tem','https://www.facebook.com/serralheria.goodsteel.39?lst=100005003110149%3A100006452997246%3A1523291012','não tem','1',8,2,4,0,0,'2018-04-09 16:28:01','2018-04-09 16:28:01',1),(112,'ceramica gloria','1338411013','não tem','não tem','Rodovia Prefeito Casimiro Teixeira, Km 30 - Itimirim','00','00','A CERÂMICA GLÓRIA é uma empresa tradicional e de estrutura familiar, que há mais de 24 anos atende a região do Vale do Ribeira e Baixada Santista procurando superar a expectativa dos clientes com bons produtos','1523295324.jpeg','http://www.ceramicagloria.com.br/index.html','não tem','não tem','1',8,2,4,0,0,'2018-04-09 17:35:24','2018-04-09 17:35:24',1),(113,'Art Serralheria 3 R','1338415486','13997176200','não tem','75 Rua Mauritis Isidoro de Oliveira','00','00','Art Serralheria 3 R','1523295793.jpeg','não tem','https://www.facebook.com/pages/Art-Serralheria-3-R/868523359946521','não tem','1',8,2,4,0,0,'2018-04-09 17:43:13','2018-04-09 17:43:13',1),(114,'Rocio Farma','1338412437','não tem','não tem','513 Avenida Júlio Franco','00','00','Rocio Farma','1523295932.jpeg','não tem','https://www.facebook.com/pages/Rocio-Farma/1582390578717586','não tem','1',8,2,4,0,0,'2018-04-09 17:45:32','2018-04-09 17:45:32',1),(115,'Cristec - Assistencia Técnica Refrigeração','1338414560','997969112vivo 981209697tim','cristeciguape@gmail.com','Av Ademar de Barros 1065','00','00','Cristec - Assistencia Técnica Refrigeração','1523296336.jpg','não tem','https://www.facebook.com/IguapeServiceRefrigeracao/','não tem','1',8,2,4,0,0,'2018-04-09 17:52:16','2018-04-09 17:52:16',1),(116,'Iguavidros','1338415375','não tem','iguavidros@hotmail.com','RUA MAJOR REBELLO, 599','00','00','Iguavidros','1523296836.jpg','não tem','https://www.facebook.com/Iguavidros/','não tem','1',8,2,4,0,0,'2018-04-09 18:00:36','2018-04-09 18:00:36',1),(117,'blocos viareggio','1338424709','13996165020','não tem','rua dos geranios, 180 - baln. viareggio','00','00','blocos viareggio','1523297418.jpeg','não tem','não tem','não tem','1',8,4,4,0,0,'2018-04-09 18:10:18','2018-04-09 18:10:18',1),(118,'cell novidades em celular','não tem','13997179772','não tem','av.copacabana, 254','00','00','cell novidades em celular','1523297762.jpeg','não tem','não tem','não tem','1',8,4,4,0,0,'2018-04-09 18:16:02','2018-04-09 18:16:02',1),(119,'chaveiro paiva','1338421120','11985364239','não tem','av.copacabana, 955','00','00','chaveiro paiva','1523298515.jpeg','não tem','não tem','não tem','1',8,4,4,0,0,'2018-04-09 18:28:35','2018-04-09 18:28:35',1),(120,'Toldos Global','não tem','13996548437','ronivassao@gmail.com','Avenida Carlos Roberto de Paula 250','00','00','toldos de vários modelos\r\nCortinas rolo automáticas\r\nGaragem para auto e coberturas em geral\r\nPortões em aço galvanizado\r\nGrades de proteção','1523298936.jpg','http://toldosglobal.business.site/','https://www.facebook.com/toldosglobal/','não tem','1',8,4,4,0,0,'2018-04-09 18:35:36','2018-04-09 18:35:36',1),(121,'jw contruçoes','1338421646','13997369624','jwdeda@bol.com.br','rua oracio cabeça 40','00','00','Trabalhamos com construções desde alicerces a acabamento ,fazemos também pequenas reformas ,sempre oferecendo um trabalho de qualidade com um preço justo .','1523299412.jpg','não tem','Jw Construções Deda.','não tem','1',8,4,4,0,0,'2018-04-09 18:43:32','2018-04-09 18:43:32',1),(122,'forte farma','1338421889','não tem','fortefarma@fortefarma.com.br','Av. Beira Mar, 10490 - Balneário Adriana','00','00','A ForteFarma é uma Rede de Farmácias Licenciadas que segue um modelo de franquia com as vantagens de uma associação. Fundada em setembro de 2005 a ForteFarma atua no mercado de Curitiba e Região Metropolitana','1523299729.jpg','http://www.fortefarma.com.br/inicio','https://www.facebook.com/Forte-Farma-Ilha-Comprida-1456579941079541/','não tem','1',8,4,4,0,0,'2018-04-09 18:48:49','2018-04-09 18:48:49',1),(123,'super gasbras','1338421615','não tem','não tem','rua manchester, 55','00','00','Somos conhecidos por vender o gás que alimenta a mais de 10 milhões de famílias brasileiras em lugares que nenhuma outra energia chega. Entregamos aquele “gás de cozinha” (botijão de 13 kg)','1523301773.jpg','https://www.supergasbras.com.br/home.htm','https://www.facebook.com/Supergasbras/','não tem','1',8,4,4,0,0,'2018-04-09 19:22:53','2018-04-09 19:22:53',1),(124,'gesso ilha','não tem','13997778859','não tem','al. humberto paladini, 1196','00','00','gesso ilha','1523301965.jpeg','não tem','não tem','não tem','1',8,4,4,0,0,'2018-04-09 19:26:05','2018-04-09 19:26:05',1),(125,'grafica gean','1338424386','13997311930','graficasaojoseic@gmail.com','rua natal, 165','00','00','grafica gean','1523302446.jpg','não tem','https://www.facebook.com/graficagean/','não tem','1',8,4,4,0,0,'2018-04-09 19:34:06','2018-04-09 19:34:06',1),(126,'medeireira matogrosso','1338421140','não tem','não tem','av.curitiba, 20','00','00','madeireira matogrosso','1523302738.jpeg','não tem','não tem','não tem','1',8,4,4,0,0,'2018-04-09 19:38:58','2018-04-09 19:38:58',1),(127,'Apartamentos Caçulinha','1338423257','15997813852','apartamentocaculinha@hotmail.com','Rua São Judas Tadeu, 68','00','00','Apartamentos Caçulinha','1523303055.jpg','não tem','https://www.facebook.com/apartamentocaculinha/','não tem','1',4,4,4,0,0,'2018-04-09 19:44:15','2018-04-09 19:44:15',1),(128,'pousada real','1338422251','13981235012','não tem','Alameda das Violetas, 65','00','00','BEM-VINDO à Pousada Real em Ilha Comprida SP desde 2003, tem por principal objetivo atender bem, com conforto, tranquilidade e lazer.','1523303353.jpg','http://www.pousadareal.com/index.php','não tem','não tem','1',4,4,4,0,0,'2018-04-09 19:49:13','2018-04-09 19:49:13',1),(129,'sim imoveis','1338421010','13981256000','sim.imoveis@uol.com.br','Av. Beira-mar, 11.320, Balneário Icaraí','00','00','Atuamos na Cidade de Ilha Comprida/SP, desde Dezembro de 2007, com excelentes resultados, dentre eles a completa satisfação de nossos clientes.','1523398834.jpeg','http://www.ilhacompridabrasil.com/index.php','não tem','não tem','1',4,4,4,0,0,'2018-04-10 22:20:34','2018-04-10 22:20:34',1),(130,'alceu fogaça','1338421096','13981222147','jlimoveis.ilha@terra.com.br','Avenida Beira Mar, 10970','00','00','Alceu Fogaça - Corretor de Imóveis','1523399588.jpg','http://www.alceufogacaimoveis.com.br/index.php?route=common/home','https://www.facebook.com/pg/Alceu-Foga%C3%A7a-Corretor-de-Im%C3%B3veis-1985546975058501/about/?ref=page_internal','não tem','1',4,4,4,0,0,'2018-04-10 22:33:08','2018-04-10 22:33:08',1),(131,'Móveis Maciços Beira Mar','1338421486','13997847611','moveismacicosbeiramar@hotmail.com','Avenida Beira Mar,12.500','00','00','A madeira maciça resiste à umidade, podendo ficar exposta à chuva e sol. Se bem cuidada pode durar mais de 100 anos e passar de geração em geração.','1523400342.jpg','não tem','https://www.facebook.com/MoveisMacicosBeiraMar/','não tem','1',8,4,4,0,0,'2018-04-10 22:45:42','2018-04-10 22:45:42',1),(132,'marina valverde','1338424573','não tem','garagemnauticamv@gmail.com','rua tijuana,2455','00','00','marina valverde','1523400561.jpg','não tem','https://www.facebook.com/thiago.valverde.10?lst=100005003110149%3A100003626239867%3A1523400416','não tem','1',8,4,4,0,0,'2018-04-10 22:49:21','2018-04-10 22:49:21',1),(133,'a pioneira','não tem','13996776579','não tem','av. copacabana, 1230','00','00','a pioneira marmoraria','1523400808.jpeg','não tem','não tem','não tem','1',8,4,4,0,0,'2018-04-10 22:53:28','2018-04-10 22:53:28',1),(134,'soaço','1338423140','997364932','vendas@soacoarmacoes.com.br','Av. Candapui Norte , 1260','00','00','A SOAÇO vem a mais de 10 anos oferecendo soluções em aço para a construção civil e serralheria, com uma estrutura moderna e desenvolvida para atender da melhor maneira','1523401215.png','http://www.soacoarmacoes.com.br/','não tem','não tem','1',8,4,4,0,0,'2018-04-10 23:00:15','2018-04-10 23:00:15',1),(135,'Construpiso','1338421185','13997250288','não tem','av. beira mar, 11.110','00','00','construpisos','1523401506.jpeg','não tem','não tem','não tem','1',8,4,4,0,0,'2018-04-10 23:05:06','2018-04-10 23:05:06',1),(136,'peixaria 3mar','1338423663','997173560','não tem','r. caiçara 205','00','00','peixaria 3mar ilha comprida','1523401699.jpeg','não tem','não tem','não tem','1',8,4,4,0,0,'2018-04-10 23:08:19','2018-04-10 23:08:19',1),(137,'armazem animal','1338421979','13996534930','não tem','av beira mar 11390','00','00','pet shop armazem animal','1523489593.jpg','não tem','https://www.facebook.com/petarmazenanimal/','não tem','1',8,4,4,0,0,'2018-04-11 23:33:13','2018-04-11 23:33:13',1),(138,'posto ipiranga','1338421323','não tem','não tem','av. beira mar, 11900','00','00','posto ipiranga com pousada','1523490080.jpg','https://ipiranga.com.br/','https://www.facebook.com/posto.ipiranga.3781?lst=100005003110149%3A100022116161393%3A1523490006','não tem','1',8,4,4,0,0,'2018-04-11 23:41:20','2018-04-11 23:41:20',1),(139,'fago','138423161','13996188081','não tem','12744 Avenida Beira Mar','00','00','Restaurante por quilo e a la carte, com o melhor da culinária tradicional e oriental. ENGLOBE ESSE SABOR!','1523490355.jpg','não tem','https://www.facebook.com/restaurantefago/','não tem','1',5,4,4,0,0,'2018-04-11 23:45:55','2018-04-11 23:45:55',1),(140,'lanchonete e restaurante carlinhos','não tem','13997010508','não tem','av. beira mar, 9820','00','00','restaurante e lanchonete carlinhos','1523490605.jpeg','não tem','não tem','não tem','1',5,4,4,0,0,'2018-04-11 23:50:05','2018-04-11 23:50:05',1),(141,'Construlanches','1338423056','13996361177','construlanches@gmail.com','Avenida Beira Mar, 11110','00','00','Venha Saborear o Melhor Lanche de Ilha Comprida!!!','1523490798.jpg','não tem','https://www.facebook.com/construlanches/','não tem','1',5,4,4,0,0,'2018-04-11 23:53:18','2018-04-11 23:53:18',1),(142,'Mercado Araça','(13) 3842-3583','(13) 99792-6623','não tem','Av. Henrique Romano, 585','00','00','mercado araça','[]','não tem','não tem','não tem','1',NULL,4,3,0,0,'2018-04-12 00:00:16','2024-06-22 22:05:12',1);
/*!40000 ALTER TABLE `companies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conteudo_sliders`
--

DROP TABLE IF EXISTS `conteudo_sliders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `conteudo_sliders` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nome_empresa` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `area_id` int(10) unsigned NOT NULL,
  `type_id` int(10) unsigned NOT NULL,
  `cities_id` int(10) unsigned NOT NULL,
  `logoPath` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conteudo_sliders`
--

LOCK TABLES `conteudo_sliders` WRITE;
/*!40000 ALTER TABLE `conteudo_sliders` DISABLE KEYS */;
INSERT INTO `conteudo_sliders` VALUES (8,'Agnaldo 1',1,2,2,'1564150803.jpg','2019-07-26 16:17:49','2019-07-26 16:17:49');
/*!40000 ALTER TABLE `conteudo_sliders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imagescompanies`
--

DROP TABLE IF EXISTS `imagescompanies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imagescompanies` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `file` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `caption` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `companies_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `imagescompanies_companies_id_foreign` (`companies_id`),
  CONSTRAINT `imagescompanies_companies_id_foreign` FOREIGN KEY (`companies_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imagescompanies`
--

LOCK TABLES `imagescompanies` WRITE;
/*!40000 ALTER TABLE `imagescompanies` DISABLE KEYS */;
/*!40000 ALTER TABLE `imagescompanies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imagescontents`
--

DROP TABLE IF EXISTS `imagescontents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imagescontents` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `file` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `caption` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `informacaos_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT '2024-04-06 03:00:00',
  `updated_at` timestamp NULL DEFAULT '2024-04-06 03:00:00',
  PRIMARY KEY (`id`),
  KEY `imagescontents_informacaos_id_foreign` (`informacaos_id`),
  CONSTRAINT `imagescontents_informacaos_id_foreign` FOREIGN KEY (`informacaos_id`) REFERENCES `information` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=221 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imagescontents`
--

LOCK TABLES `imagescontents` WRITE;
/*!40000 ALTER TABLE `imagescontents` DISABLE KEYS */;
INSERT INTO `imagescontents` VALUES (24,'1543531506.jpg','imagem da empresa','imagem da empresa',7,'2018-11-29 22:45:06','2018-11-29 22:45:06'),(25,'1543531681.jpg','imagem da empresa','imagem da empresa',7,'2018-11-29 22:48:01','2018-11-29 22:48:01'),(26,'1543531909.jpg','imagem da empresa','imagem da empresa',7,'2018-11-29 22:51:49','2018-11-29 22:51:49'),(27,'1543532332.JPG','imagem da empresa','imagem da empresa',8,'2018-11-29 22:58:52','2018-11-29 22:58:52'),(28,'1543532410.JPG','imagem da empresa','imagem da empresa',8,'2018-11-29 23:00:10','2018-11-29 23:00:10'),(29,'1544714658.jpg','imagem da empresa','imagem da empresa',12,'2018-12-13 15:24:18','2018-12-13 15:24:18'),(30,'1544714671.jpg','imagem da empresa','imagem da empresa',12,'2018-12-13 15:24:31','2018-12-13 15:24:31'),(31,'1544714700.png','imagem da empresa','imagem da empresa',12,'2018-12-13 15:25:00','2018-12-13 15:25:00'),(32,'1544720022.JPG','imagem da empresa','imagem da empresa',13,'2018-12-13 16:53:42','2018-12-13 16:53:42'),(33,'1544720038.jpg','imagem da empresa','imagem da empresa',13,'2018-12-13 16:53:58','2018-12-13 16:53:58'),(34,'1544720051.jpg','imagem da empresa','imagem da empresa',13,'2018-12-13 16:54:11','2018-12-13 16:54:11'),(35,'1544720910.jpg','imagem da empresa','imagem da empresa',14,'2018-12-13 17:08:30','2018-12-13 17:08:30'),(36,'1544720921.jpg','imagem da empresa','imagem da empresa',14,'2018-12-13 17:08:41','2018-12-13 17:08:41'),(37,'1544720942.jpg','imagem da empresa','imagem da empresa',14,'2018-12-13 17:09:02','2018-12-13 17:09:02'),(38,'1544721832.jpg','imagem da empresa','imagem da empresa',15,'2018-12-13 17:23:52','2018-12-13 17:23:52'),(39,'1544722345.jpg','imagem da empresa','imagem da empresa',15,'2018-12-13 17:32:25','2018-12-13 17:32:25'),(40,'1544722353.jpg','imagem da empresa','imagem da empresa',15,'2018-12-13 17:32:33','2018-12-13 17:32:33'),(41,'1544734613.JPG','imagem da empresa','imagem da empresa',17,'2018-12-13 20:56:53','2018-12-13 20:56:53'),(42,'1544734631.jpg','imagem da empresa','imagem da empresa',17,'2018-12-13 20:57:11','2018-12-13 20:57:11'),(43,'1544734651.jpg','imagem da empresa','imagem da empresa',17,'2018-12-13 20:57:31','2018-12-13 20:57:31'),(44,'1544734671.jpg','imagem da empresa','imagem da empresa',17,'2018-12-13 20:57:51','2018-12-13 20:57:51'),(45,'1544734697.JPG','imagem da empresa','imagem da empresa',17,'2018-12-13 20:58:17','2018-12-13 20:58:17'),(46,'1544734757.JPG','imagem da empresa','imagem da empresa',17,'2018-12-13 20:59:17','2018-12-13 20:59:17'),(47,'1544734775.jpg','imagem da empresa','imagem da empresa',17,'2018-12-13 20:59:35','2018-12-13 20:59:35'),(48,'1544734794.jpg','imagem da empresa','imagem da empresa',17,'2018-12-13 20:59:54','2018-12-13 20:59:54'),(49,'1544734809.jpg','imagem da empresa','imagem da empresa',17,'2018-12-13 21:00:09','2018-12-13 21:00:09'),(50,'1544963762.jpg','imagem da empresa','imagem da empresa',18,'2018-12-16 12:36:02','2018-12-16 12:36:02'),(51,'1544963770.jpg','imagem da empresa','imagem da empresa',18,'2018-12-16 12:36:10','2018-12-16 12:36:10'),(52,'1544963776.jpg','imagem da empresa','imagem da empresa',18,'2018-12-16 12:36:16','2018-12-16 12:36:16'),(53,'1544963782.jpg','imagem da empresa','imagem da empresa',18,'2018-12-16 12:36:22','2018-12-16 12:36:22'),(54,'1544963794.JPG','imagem da empresa','imagem da empresa',18,'2018-12-16 12:36:34','2018-12-16 12:36:34'),(55,'1544963807.JPG','imagem da empresa','imagem da empresa',18,'2018-12-16 12:36:47','2018-12-16 12:36:47'),(56,'1544963815.JPG','imagem da empresa','imagem da empresa',18,'2018-12-16 12:36:55','2018-12-16 12:36:55'),(57,'1544964995.png','imagem da empresa','imagem da empresa',19,'2018-12-16 12:56:35','2018-12-16 12:56:35'),(58,'1544965041.png','imagem da empresa','imagem da empresa',19,'2018-12-16 12:57:21','2018-12-16 12:57:21'),(59,'1544965083.png','imagem da empresa','imagem da empresa',19,'2018-12-16 12:58:03','2018-12-16 12:58:03'),(60,'1544965098.png','imagem da empresa','imagem da empresa',19,'2018-12-16 12:58:18','2018-12-16 12:58:18'),(61,'1544965110.png','imagem da empresa','imagem da empresa',19,'2018-12-16 12:58:30','2018-12-16 12:58:30'),(62,'1544965240.png','imagem da empresa','imagem da empresa',19,'2018-12-16 13:00:40','2018-12-16 13:00:40'),(63,'1544965504.JPG','imagem da empresa','imagem da empresa',20,'2018-12-16 13:05:04','2018-12-16 13:05:04'),(64,'1544965512.jpg','imagem da empresa','imagem da empresa',20,'2018-12-16 13:05:12','2018-12-16 13:05:12'),(65,'1544965519.JPG','imagem da empresa','imagem da empresa',20,'2018-12-16 13:05:19','2018-12-16 13:05:19'),(66,'1544965527.jpg','imagem da empresa','imagem da empresa',20,'2018-12-16 13:05:27','2018-12-16 13:05:27'),(67,'1544965535.JPG','imagem da empresa','imagem da empresa',20,'2018-12-16 13:05:35','2018-12-16 13:05:35'),(68,'1544965546.JPG','imagem da empresa','imagem da empresa',20,'2018-12-16 13:05:46','2018-12-16 13:05:46'),(69,'1544965556.JPG','imagem da empresa','imagem da empresa',20,'2018-12-16 13:05:56','2018-12-16 13:05:56'),(70,'1544965570.JPG','imagem da empresa','imagem da empresa',20,'2018-12-16 13:06:10','2018-12-16 13:06:10'),(71,'1544965899.jpg','imagem da empresa','imagem da empresa',21,'2018-12-16 13:11:39','2018-12-16 13:11:39'),(72,'1544965914.jpg','imagem da empresa','imagem da empresa',21,'2018-12-16 13:11:54','2018-12-16 13:11:54'),(73,'1544965923.jpg','imagem da empresa','imagem da empresa',21,'2018-12-16 13:12:03','2018-12-16 13:12:03'),(74,'1544965931.jpg','imagem da empresa','imagem da empresa',21,'2018-12-16 13:12:11','2018-12-16 13:12:11'),(75,'1544965945.jpg','imagem da empresa','imagem da empresa',21,'2018-12-16 13:12:25','2018-12-16 13:12:25'),(76,'1544965952.jpg','imagem da empresa','imagem da empresa',21,'2018-12-16 13:12:32','2018-12-16 13:12:32'),(77,'1544965959.jpg','imagem da empresa','imagem da empresa',21,'2018-12-16 13:12:39','2018-12-16 13:12:39'),(78,'1544965967.jpg','imagem da empresa','imagem da empresa',21,'2018-12-16 13:12:47','2018-12-16 13:12:47'),(79,'1544965977.jpg','imagem da empresa','imagem da empresa',21,'2018-12-16 13:12:57','2018-12-16 13:12:57'),(80,'1544966519.jpg','imagem da empresa','imagem da empresa',22,'2018-12-16 13:21:59','2018-12-16 13:21:59'),(81,'1544966536.jpg','imagem da empresa','imagem da empresa',22,'2018-12-16 13:22:16','2018-12-16 13:22:16'),(82,'1544966551.jpg','imagem da empresa','imagem da empresa',22,'2018-12-16 13:22:31','2018-12-16 13:22:31'),(83,'1544966561.jpg','imagem da empresa','imagem da empresa',22,'2018-12-16 13:22:41','2018-12-16 13:22:41'),(84,'1544966583.jpg','imagem da empresa','imagem da empresa',22,'2018-12-16 13:23:03','2018-12-16 13:23:03');
/*!40000 ALTER TABLE `imagescontents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `information`
--

DROP TABLE IF EXISTS `information`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `information` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `desc` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `logoPath` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `references` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `location` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `lat` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `long` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `forma_acesso` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cities_id` int(10) unsigned NOT NULL,
  `category_id` int(10) unsigned DEFAULT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `file` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `information_cities_id_foreign` (`cities_id`),
  KEY `information_user_id_foreign` (`user_id`),
  KEY `information_subcategory_id_foreign` (`category_id`),
  CONSTRAINT `information_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  CONSTRAINT `information_cities_id_foreign` FOREIGN KEY (`cities_id`) REFERENCES `cities` (`id`),
  CONSTRAINT `information_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `information`
--

LOCK TABLES `information` WRITE;
/*!40000 ALTER TABLE `information` DISABLE KEYS */;
INSERT INTO `information` VALUES (5,'Enseada da Baleia','Uma comunidade caiçara que guarda na força da mulheres a força para manter sua cultura   ','A comunidade tradicional caiçara da Enseada da Baleia passou por um processo recente de realocação de toda a sua vila para outro local mais seguro na Ilha do Cardoso devido a intensos processos erosivos em seu antigo território. A luta intensa garantiu o novo espaço que mantém preservada as suas características físicas e valoriza ainda mais suas tradições seculares como a pesca artesanal e a produção de peixe seco. Recentemente, a comunidade tem se destacado pelos trabalhos artesanais feito pelas mulheres com redes de pesca descartadas como lixo nas praias da região. Destaca-se também as atividades de turismo de base comunitária. Vale a pena conhecer!!! Para mais informações visite o site da comunidade: http://enseadadabaleia.blogspot.com/. Quer conhecer? Contrate um guia de turismo clicando aqui.','lagamar/atrativos/logo/01HVPK1A9Z5RSG4SS4D5MWVEJ4.jpg','Acervo Ponto de Cultura Caiçaras','Ilha do Cardoso','-25.2291941','-48.0206975,418','Acesso pela BR 116 e SP 226. Traslado de barco a partir de do centro de Cananeia (aprox. 1h30 de duração em lancha rápida). O acesso também pode ser feito de barco a partir da comunidade do Ariri aonde se chega pela Estrada Itapitangui-Ariri.',2,1,6,'2018-11-21 18:57:48','2024-04-17 20:52:53',NULL),(6,'Itacuruça e Pereirinha','Uma tranquila comunidade caiçara que convive com os botos todos os dias na Ilha do Cardoso   ','Comunidade tradicional caiçara que dá acesso ao Núcleo Perequê do Parque Estadual da Ilha do Cardoso. No local, monitores ambientais levam turistas para conhecer trilhas nos diferentes ecossistemas da Mata Atlântica, incluindo uma trilha suspensa sobre o manguezal, e também o centro de visitantes do parque. Restaurantes de moradores locais oferecem o melhor da culinária caiçara. A praia, que todos os dias recebe a visita dos botos-cinzas, aos finais de tarde promete sempre um deslumbrante pôr-do-sol. No primeiro final de semana de dezembro acontece a famosa Festa de Santo André (padroeiro da comunidade). Para mais informações visite o site da comunidade: http://amoip.blogspot.com/2010/10/comunidades-do-itacuruca-e-pereirinha.html. Quer conhecer? Contrate um guia de turismo clicando aqui.','','Acervo Ponto de Cultura Caiçaras','Ilha do Cardoso','-25.0637184','-47.9214201,1303','Acesso pela BR 116 e SP 226. Traslado de barco a partir do centro de Cananeia (aprox. 20 minutos de duração em lancha rápida).',2,1,6,'2018-11-21 19:20:38','2018-11-21 19:20:38',NULL),(7,'Marujá','A maior comunidade caiçara da Ilha do Cardoso promete tranquilidade e agitação no mesmo ambiente.   ','Com uma oferta maior de hospedagens dentro da Ilha do Cardoso, mas sem perder as tradições caiçaras, a comunidade possui praia tranquila e ótimos restaurantes com comidas típicas, além de festas agitadas nos períodos de carnaval a ano novo. Mais tranquilas e não menos interessantes são as festas tradicionais: São Vito (junho) e Tainha (julho). Tranquilidade e muita festa em um só lugar. À comunidade está localizada no Parque Estadual da Ilha do Cardoso e à visitação deve seguir regras específicas. Para mais informações visite o site da Fundação Florestal: http://fflorestal.sp.gov.br/ilha-do-cardoso/home/. Quer conhecer? Contrate um guia de turismo clicando aqui.','','Acervo Ponto de Cultura Caiçaras','Ilha do Cardoso','-25.2116522','-48.0132834,5449','Acesso pela BR 116 e SP 226. Traslado de barco a partir de do centro de Cananeia (aprox. 1h00 de duração em lancha rápida).',2,1,6,'2018-11-21 19:30:52','2018-11-21 19:30:52',NULL),(8,'Pontal de Leste','A comunidade caiçara mais ao Sul da Ilha do Cardoso é um dos maiores berçários dos guarás vermelhos da região.   ','A pequena comunidade caiçara é berçário dos guarás vermelhos que são avistados facilmente em alguns períodos do dia. A praia do Pontal é uma ligação entre o mar de dentro (Canal do Ararapira) e o alto-mar oferecendo um visual incrível aos visitantes que buscam tranquilidade e belezas naturais em um só lugar. Para mais informações visite o site da Fundação Florestal: http://fflorestal.sp.gov.br/ilha-do-cardoso/home/. Quer conhecer? Contrate um guia de turismo clicando aqui.','','Acervo Ponto de Cultura Caiçaras','Ilha do Cardoso','-25.302905','-48.0936913,1239','Acesso pela BR 116 e SP 226. Traslado de barco a partir de do centro de Cananeia (aprox. 1h50 de duração em lancha rápida). O acesso também pode ser feito de barco a partir da comunidade do Ariri aonde se chega pela Estrada Itapitangui-Ariri.',2,1,6,'2018-11-21 19:45:23','2018-11-21 19:45:23',NULL),(9,'Cambriú','A comunidade caiçara acessível somente pelo mar aberto surpreende com beleza de sua natureza e cultura  ','A pequena comunidade do Cambriú é acessível somente pelo mar aberto, o que torna o passeio desafiador e dependente das condições do mar. Mas o esforço vale a pena ao avistar o que muitos consideram como uma das praias mais bonitas da região. Com poucos moradores, a praia é um achado para surfistas e para quem busca tranquilidade em meio à natureza. À comunidade está localizada no Parque Estadual da Ilha do Cardoso e à visitação deve seguir regras específicas. Para mais informações visite o site da Fundação Florestal: http://fflorestal.sp.gov.br/ilha-do-cardoso/home/. Quer conhecer? Contrate um guia de turismo clicando aqui.','','Acervo Ponto de Cultura Caiçaras','Ilha do Cardoso','-25.154455','-47.9198559,391','Acesso pela BR 116 e SP 122. Traslado de barco a partir de do centro de Cananeia (aprox. 1h00 de duração em lancha rápida).',1,1,6,'2018-11-21 20:07:45','2018-11-21 20:07:45',NULL),(10,'Foles','Com poucos moradores, as praias de Foles e Foles Pequeno são ideais para quem busca a paz e a beleza da vida simples em meio a natureza viva.  ','Escondida na Ilha do Cardoso, as praias de Foles e Foles Pequeno são pequenas e só são acessadas por mar aberto. Além de desertas e lindas, dá acesso fácil por trilha às piscinas naturais da Lage e a praia do Cambriú. Lugar para quem busca simplicidade e muita natureza exuberante. À comunidade está localizada no Parque Estadual da Ilha do Cardoso e à visitação deve seguir regras específicas. Para mais informações visite o site da Fundação Florestal: http://fflorestal.sp.gov.br/ilha-do-cardoso/home/. Quer conhecer? Contrate um guia de turismo clicando aqui.','','Acervo Ponto de Cultura Caiçaras','Ilha do Cardoso','-25.1615472','-47.9287649,195','Acesso pela BR 116 e SP 122. Traslado de barco a partir de do centro de Cananeia (aprox. 1h00 de duração em lancha rápida).',1,1,6,'2018-11-21 20:23:10','2018-11-21 20:23:10',NULL),(11,'Ariri','Comunidade caiçara encravada na Mata Atlântica que divide os Estados de São Paulo e Paraná','Entre os limites do Estado do Paraná e São Paulo encontra-se o bairro do Ariri. Trata-se de uma pequena comunidade caiçara que fica próxima ao Parque Estadual da Ilha do Cardoso e ao Parque Nacional do Superagui (PR). Um lugar que sofreu muitas mudanças ao longo dos anos e hoje é um ótimo local para viver, descansar e desfrutar do que há de melhor em nossa região. Para muitos o Ariri é um paraíso em meio à rica natureza da Mata Atlântica. Cercado de cachoeiras, praias de águas limpas e trilhas no meio da floresta é muito procurado por pescadores esportivos. Quer conhecer? Contrate um guia de turismo clicando aqui.','1542991182.png','Acervo Ponto de Cultura Caiçaras','Ariri','-25.2175389','-48.0440241','Acesso pela BR 116, SP 226 e estrada Itapitangui-Ariri (60 km com trechos mal conservados). É possível chegar de barco à partir de Cananeia. Saiba mais.',1,1,6,'2018-11-23 16:39:42','2018-11-23 16:39:42',NULL),(12,'Varadouro','Um lugar que ainda guarda as antigas histórias e tradições relacionadas às roças caiçaras','Próximo à divisa com os Estados do Paraná e São Paulo encontramos um bairro rural com pouco moradores e de difícil acesso. O Varadouro surgiu com a vinda dos moradores do Itapanhoapina, localizado ao longo do caminho que por terra dá acesso ao bairro do Ariri. Conta-se que o bairro surgiu porque estes moradores tinham que se deslocar de suas casas para trabalharem em seus sítios que ficavam onde é hoje o Varadouro. Como chegar: o acesso pela BR 116, SP 226 e estrada Itapitangui-Ariri (estrada de terra com trechos mal conservados) onde o acesso se dá por barco. Também é possível chegar de barco à partir de Cananeia. Quer conhecer? Contrate um guia de turismo clicando aqui.','1544714591.jpg','Saberes Caiçaras','Varadouro','-25.2174213','-48.0684037','Acesso pela BR 116, SP 226 e estrada Itapitangui-Ariri (estrada de terra com trechos mal conservados) onde o acesso se dá por barco. Também é possível chegar de barco à partir de Cananeia.',1,1,2,'2018-12-13 15:23:11','2018-12-13 15:23:11',NULL),(13,'Santa Maria','Comunidade caiçara e de descentes de imigrantes europeus em passa o antigo “Caminho do Telégrafo” ou “Caminho do Imperador”','O bairro rural do Santa Maria localiza-se a 68 km do centro de Cananeia. Tendo a belíssima Serra do Gigante como “pano de fundo” faz divisa com o Estado do Paraná, pois fica à cerca de 6 km do bairro rural Batuva, pertencente ao município de Guaraqueçaba (PR). Em tempos remotos era caminho para tropeiros e desbravadores destas terras do interior, sendo que ainda guarda os saberes tradicionais dos sítios memoráveis dos antigos europeus que lá chegaram, no século XIX, por volta de 1820. O local também é famoso pela passagem da Trilha do Telégrafo ou Caminho do Imperador, como também era chamada, à qual servia para passagem de informações entre o Império e outras regiões do Brasil e foi percorrida por portugueses no período da colonização, devido à procura de ouro. Quer conhecer? Contrate um guia de turismo clicando aqui.','1544720006.png','Saberes Caiçaras','Santa Maria','-25.0694422','48.1341554','Acesso pela BR 116, SP 226 e pela estrada Itapitangui-Ariri (estrada de terra com trechos mal conservados)',1,1,2,'2018-12-13 16:53:26','2018-12-13 16:53:26',NULL),(14,'Mandira','A visita ao Mandira proporciona o contato com a sabedoria quilombola que ensina ao Mundo como manejar a ostra em equilíbrio e harmonia com a natureza.','A comunidade quilombola do Mandira ocupa as terras que reivindica pelo menos desde 1868, produzindo e reproduzindo ali sua cultura – material e simbólica. O contato entre pesquisadores e comunidade gerou um dos projetos mais famosos e reconhecidos em todo o Mundo e que ainda hoje serve de exemplo para diversos governos e comunidades. A área de manguezal do entorno da comunidade foi considerada domínio dos mandiranos, e decretada como Reserva Extrativista do Mandira, em dezembro de 2002. Isso porque, o Quilombo do Mandira tem como importante atividade produtiva o extrativismo no manguezal, sendo a ostra o principal recurso gerador de renda. Em 2017, o Instituto Nacional de Colonização e Reforma Agrária (INCRA) reconheceu cerca de 1.200 hectares de terras da Comunidade Quilombola do Mandira, sendo apenas o sexto quilombo a passar por essa etapa no Estado de São Paulo. Quer conhecer? Contrate um guia de turismo clicando aqui.','1544720877.jpg','Matimpererê Turismo de Experiência (www.matimperere.com.br)','Mandira','-24.9956291','-48.0361158','Acesso pela BR 116, SP 226 e pela estrada Itapitangui-Ariri (estrada de terra com trechos mal conservados em parte do ano)',1,1,2,'2018-12-13 17:07:57','2018-12-13 17:07:57',NULL),(15,'Rio das Minas','A comunidade do Rio das Minas que abriga a mais bela cachoeira da região ainda guarda histórias de um período em que ainda se extraia ouro de aluvião na região','O historiador cananeense Antonio Paulino de Almeida descreve assim o Rio das Minas: “um dos mais notáveis, não só pelo volume de suas águas como por seu fator histórico, pela descoberta de algumas minas de ouro, as quais, depois de perdidas, foram novamente encontradas no ano de 1725”. Além da fama por conta de suas histórias, à comunidade abriga a cachoeira do Rio das Minas que é um espetáculo à parte. A cachoeira fica em propriedade particular e o seu passeio é sempre acompanhado por monitores ambientais locais. Quer conhecer? Contrate um guia de turismo clicando aqui.','1544722330.jpg','Livro \"Memória Histórica sobre Cananéia (Parte Geográfica)\" de Antonio Paulino de Almeida e portal web do Sítio Duas Quedas (http://www.sitioduasquedas.com.br)','Rio das Minas','-24.9951571','-48.1211316','Acesso pela BR 116, SP 226 e pela estrada Itapitangui-Ariri (estrada de terra com trechos mal conservados em parte do ano)',1,1,2,'2018-12-13 17:23:38','2018-12-13 17:23:38',NULL),(16,'Agrossolar','O bairro uma vista privilegiada do canal do Mar Pequeno e ainda mantém à tradição da Folia de Reis e da Romaria do Divino Espírito Santo','Conta-se que o bairro era uma antiga vila de pescadores. Com o passar do tempo turistas e moradores de Cananeia começaram a construir casas por considerar o local de vista privilegiada para o canal do Mar Pequeno e também pela beleza e calmaria do lugar. O lugar atrai pescadores artesanais que podem contratar piloteiros e embarcações locais. Também é famoso pela Folia de Reis e pela Romaria do Divino Espírito Santo realizada por mestres e mestras do fandango caiçara considerado patrimônio cultural brasileiro.','1544724707.JPG','Acervo do Ponto de Cultura Caiçaras','Agrossolar','-24.9679895','-47.9058639','acesso pela BR 116, SP 226 e Estrada José Herculano de Oliveira Rosa (altura do Km 5)',1,1,2,'2018-12-13 18:11:47','2018-12-13 18:11:47',NULL),(17,'Circuito das cachoeiras','Um roteiro especial para quem quer conhecer e aproveitar as sagradas águas das cachoeiras da Mata Atlântica...','As sagradas águas da mata atlântica mantém viva a exuberante floresta e toda a fauna ao seu redor. Ao correrem para a planície litorânea formam lindas corredeiras e belas cachoeiras por todos os lugares aonde passam. Conheça três belas cachoeiras na área continental da cidade de Cananeia e também as comunidades tradicionais que as abrigam em suas terras. Nesse roteiro você terá a oportunidade única de conhecer três lindas cachoeiras ao longo de um dia em territórios caiçaras e quilombolas. Clique aqui e entre em contato conosco para ver preços e agendamento.','1544734593.png','Matimpererê Turismo de Experiência (www.matimperere.com.br)','Cananeia','-25.012452','-47.9489018','Entre em contato conosco.',1,1,2,'2018-12-13 20:56:33','2018-12-13 20:56:33',NULL),(18,'Território do Fandango Caiçara','Um mergulho na sabedoria ancestral relacionada a tradição musical do povo caiçara que vive em harmonia com a natureza no maior trecho de Mata Atlântica do Brasil.','Ali entre o litoral sul de São Paulo e norte do Paraná, num local que abriga o maior trecho de mata atlântica preservado do país, vivem comunidades tradicionais caiçaras que ainda resguardam antigos saberes e fazeres relacionados a sua secular cultura. O Fandango Caiçara, nome dado a principal manifestação cultural popular fortemente associada ao seu modo de vida, une dança e música num contexto social mais amplo. Sua prática sempre esteve vinculada à organização de trabalhos coletivos (mutirões) onde o organizador oferecia como pagamento aos voluntários um baile farto em comida e alegria. Um jeito de viver em profunda integração com a natureza que também era a principal diversão e momento de socialização durante as festas religiosas, batizados, casamentos e, especialmente, no carnaval, onde comemorava-se os quatro dias ao som de seus instrumentos.','1544963752.JPG','Matimpererê Turismo de Experiência (www.matimperere.com.br)','Iguape (SP) a Paranaguá (PR)','-25.012452','-47.9489018','O roteiro inclui traslados terrestres e aquáticos',1,1,2,'2018-12-16 12:35:52','2018-12-16 12:35:52',NULL),(19,'A conversa dos botos','Observar e ouvir a conversa dos botos embaixo d\'água. Uma experiência única e inesquecível...','Aqui no complexo estuarino de Cananeia vive uma população de botos-cinza (Sotalia guianensis) que frequenta baias e praias de fácil acesso. Um dos poucos lugares no país onde se pode observar os animais durante todas as estações do ano. Por isso mesmo, os primeiros estudos científicos com cetáceos no Brasil foram realizados aqui ainda em meados do início da década de 80. \r\nSem dúvida, essa é uma das mais importantes áreas de observação e estudo dessa espécie em todo o país e também do Mundo.','1544964976.png','Matimpererê Turismo de Experiência (www.matimperere.com.br)','Baia do Trapandé, Ponta da Trincheira e Praia do Itacuruça e Pereirinha','-25.012452','-47.9489018','O roteiro inclui traslados terrestres e aquáticos',1,1,2,'2018-12-16 12:56:16','2018-12-16 12:56:16',NULL),(20,'Viva Takuari-ty','Os Guaranis M’Bya valorizam a sua cultura e todos os rituais são preservados e passados de geração a geração. A sua religião é voltada à fé, à espiritualidade, à crença e ao respeito a Nhanderu.','Os Guaranis M’Bya valorizam muito a sua cultura e todos os rituais são preservados e passados de geração a geração, como o “Batismo das Crianças”, o “Batismo ou Consagração das Sementes” e o “Batismo das Ervas”. A sua religião é voltada à fé, à espiritualidade, à crença e o respeito a Nhanderu (Deus). Desde pequenos, aprendem com o Pajé que existe a “Lei da Natureza”, onde é necessário preservá-la e respeitá-la, pois, caso contrário, ela se voltará contra o nosso povo e responderá com devastações e catástrofes, por isso acreditam que em terras onde existe o povo Guarani, não há desastres naturais. Viaje conosco e conheça muito mais sobre os modos de vida, os saberes ancestrais e a luta desse povo que vive nessa terra antes mesmo da chegada dos europeus.','1544965479.JPG','Matimpererê Turismo de Experiência (www.matimperere.com.br)','A Aldeia Takuari-ty fica no bairro do Acaraú em Cananeia (SP).','-25.012452','-47.9489018','O acesso a aldeia se dá por via terrestre.',1,1,2,'2018-12-16 13:04:39','2018-12-16 13:04:39',NULL),(21,'Ostras do Quilombo do Mandira','Conheça uma comunidade quilombola que vive em harmonia com a natureza e que tem no manejo sustentável da ostra e no turismo comunitário a base de sua economia solidária.','A comunidade do Mandira ocupa as terras que reivindica pelo menos desde 1868, produzindo e reproduzindo ali sua cultura – material e simbólica. Hoje alijados da maior parte do território que confere significados à sua existência, os mandiranos – tal como eles se autodenominam – recriaram formas de viver que incluem novas atividades produtivas, incrementadas por experiências tecnológicas e organizacionais, que já não cabem no reduzido espaço físico em que se encontram, alimentando assim a perspectiva de resgate da dimensão original de suas terras. O contato entre pesquisadores e comunidade gerou um dos projetos mais famosos e reconhecidos em todo o Mundo e que ainda hoje serve de exemplo para diversos governos e comunidades. Tal atividade fez com que em 2002, uma das lideranças locais, Seu Chico Mandira, foi receber em Joanesburgo, na África do Sul, o prêmio Iniciativa Equatorial durante o encontro da Cúpula Mundial para o Desenvolvimento Sustentável, na Rio +10. Era o reconhecimento internacional para o lindo trabalho comunitário dos mandiranos e mandiranas. Viaje conosco para conhecer e vivenciar o dia a dia desse povo que tem nas práticas do manejo sustentável e no turismo comunitário a eixo para o envolvimento solidário de toda a comunidade.','1544965875.jpg','Matimpererê Turismo de Experiência (www.matimperere.com.br)','Comunidade Quilombola do Mandira','-24.995659','-48.0361073','Acesso pela BR 116, SP 226 e pela estrada Itapitangui-Ariri (estrada de terra com trechos mal conservados)',1,1,2,'2018-12-16 13:11:15','2018-12-16 13:11:15',NULL),(22,'Sítios, roças e agroflorestas caiçaras','Conheça as diferentes formas de manejo da terra e de produção de alimentos nos sítios e roças caiçaras da área continental de Cananeia.','A agricultura itinerante de subsistência nas florestas evoluiu, de forma independente, em todas as regiões tropicais e se mostrou sustentável ao longo dos séculos em diversas regiões. Neste tipo de agricultura, o fogo desempenha um papel fundamental e, apesar de haver muitas variantes, a maioria segue um mesmo esquema básico. Este sistema envolve, de forma geral, alguns poucos anos de cultivo, alternados com vários anos de pousio e inclui o corte, derrubada e queima da floresta. No Brasil, o cultivo ou agricultura itinerante é uma herança indígena, e pode receber várias denominações, como agricultura/roça de coivara, roça de toco, agricultura de subsistência ou de derrubada e queima. Embarque conosco nessa experiência e conheça os sítios caiçaras que tem obtido sucesso com o manejo sustentável de plantações na Mata Atlântica.','1544966506.jpg','Matimpererê Turismo de Experiência (www.matimperere.com.br)','Comunidade Caiçara do Rio Branco','-24.9064244','-48.0102086','O acesso a aldeia se dá por via terrestre.',1,1,2,'2018-12-16 13:21:46','2018-12-16 13:21:46',NULL),(25,'Vila Rápida','Pequena comunidade caiçara que mantém vivas as tradições da pesca artesanal.','A Vila Rápida mantém preservadas as tradições da pesca artesanal e da culinária típica caiçara. Descobrir a Vila é fazer uma imersão no tempo e desfrutar de toda a tranquilidade da vida típica desses povos que habitam a Ilha do Cardoso há mais de um século. A comunidade ainda recebe poucos turistas e se quiser saber como visitar acesse a fanpage da comunidade: https://www.facebook.com/pg/vilarapida. Contrate um guia de turismo clicando aqui.','1547907000.jpg','https://www.facebook.com/pg/vilarapida','Ilha do Cardoso','-25.2620395','-48.0635689','Acesso pela BR 116 e SP 122. Traslado de barco a partir de do centro de Cananeia (aprox. 1h30 de duração em lancha rápida).',1,1,2,'2019-01-19 14:10:00','2019-01-19 14:10:00',NULL);
/*!40000 ALTER TABLE `information` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_batches`
--

DROP TABLE IF EXISTS `job_batches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_batches`
--

LOCK TABLES `job_batches` WRITE;
/*!40000 ALTER TABLE `job_batches` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_batches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint(3) unsigned NOT NULL,
  `reserved_at` int(10) unsigned DEFAULT NULL,
  `available_at` int(10) unsigned NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2017_03_14_001042_create_products_table',1),(4,'2017_04_24_002505_create_categories_table',1),(5,'2017_04_24_002516_create_cities_table',1),(6,'2017_04_24_002529_create_companies_table',1),(7,'2017_06_22_001145_create_information_table',1),(8,'2017_06_22_001229_create_img_table',1),(9,'2017_06_22_190916_create_informationContent_table',1),(10,'2018_01_29_135351_add_planoAssinatura_table',1),(11,'2018_01_29_141158_add_colum_comercio',1),(12,'2018_01_31_211342_add_conteudo_sliders',1),(13,'2018_02_21_151041_add_table_subCategories',1),(14,'2018_02_22_141314_add_columm_id_subCategori_atrativos',1),(15,'2018_02_27_210139_add_table_atrativo_subs',2),(16,'2018_02_28_135027_add_collum_id_subcategoria_comercios',2),(17,'2018_03_11_174605_update_comercio_table',3),(18,'2018_03_11_174907_remove_comercio_table',3),(19,'2018_11_20_125754_add_columm_information',4),(20,'2019_01_05_184726_add_collum_city_subcategory_new',5),(21,'2019_01_12_133730_create_area_sliders_table',6),(22,'2019_01_12_133740_create_tipo_sliders_table',6),(23,'2019_01_12_135058_add_camp_slider_2',7),(24,'2019_02_01_215551_add_city_atrativos_subs',7),(25,'2019_03_02_140251_add_cep_collum',8),(26,'2019_03_10_031425_add_collum_id_subctegory_company',9),(27,'2019_03_16_205142_add_status_company',9),(28,'0001_01_01_000000_create_users_table',10),(29,'0001_01_01_000001_create_cache_table',10),(30,'0001_01_01_000002_create_jobs_table',10);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_reset_tokens`
--

LOCK TABLES `password_reset_tokens` WRITE;
/*!40000 ALTER TABLE `password_reset_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_reset_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`),
  KEY `password_resets_token_index` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
INSERT INTO `password_resets` VALUES ('fernando@matimperere.com.br','$2y$10$q0bzxGaXJiFPNQN3fOqfquKj3DZepCfmhNziI/7vjoBoqUBTLO0nu','2018-11-21 18:44:23');
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plano_assinaturas`
--

DROP TABLE IF EXISTS `plano_assinaturas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plano_assinaturas` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nome_plano` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `valor_anual` double NOT NULL,
  `valor_mensal` double NOT NULL,
  `descricao` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plano_assinaturas`
--

LOCK TABLES `plano_assinaturas` WRITE;
/*!40000 ALTER TABLE `plano_assinaturas` DISABLE KEYS */;
INSERT INTO `plano_assinaturas` VALUES (1,'PLANO A',1200,100,'ANUAL 1','2018-02-23 22:15:15','2024-06-22 18:27:40'),(2,'PLANO B',0,0,'PLANO B','2018-03-05 23:13:44','2018-03-12 17:07:56'),(3,'PALO C',0,0,'Descrição','2018-03-18 14:52:04','2018-03-18 14:52:04'),(4,'PLANO D',0,0,'Descrição','2018-03-18 14:52:17','2018-03-18 14:52:17');
/*!40000 ALTER TABLE `plano_assinaturas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sub_categories`
--

DROP TABLE IF EXISTS `sub_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sub_categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nome_subcategory` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `imagem` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` int(10) unsigned NOT NULL,
  `cities_id` int(10) unsigned NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sub_categories_category_id_foreign` (`category_id`),
  KEY `sub_categories_cities_id_foreign` (`cities_id`),
  CONSTRAINT `sub_categories_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  CONSTRAINT `sub_categories_cities_id_foreign` FOREIGN KEY (`cities_id`) REFERENCES `cities` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sub_categories`
--

LOCK TABLES `sub_categories` WRITE;
/*!40000 ALTER TABLE `sub_categories` DISABLE KEYS */;
INSERT INTO `sub_categories` VALUES (1,'ECOTURISMO','1546277657.png',1,1,'2018-02-23 22:13:49','2018-02-23 22:13:49'),(2,'TURISMO RURAL','1546446227.png',1,1,'2018-02-26 22:09:27','2018-02-26 22:09:27'),(3,'CICLOTURISMO','1546281940.png',1,1,'2018-02-27 00:27:37','2018-02-27 00:27:37'),(4,'TURISMO CULTURAL','1546446609.png',1,2,'2018-02-27 00:28:00','2018-02-27 00:28:00'),(5,'TURISMO RURAL antigo','1521066018.png',1,1,'2018-02-27 00:28:21','2024-05-30 17:08:48'),(6,'TURISMO COMUNITÁRIO','1546447610.png',1,1,'2018-02-27 00:28:41','2018-02-27 00:28:41'),(7,'TURISMO NÁUTICO','1546449170.png',1,1,'2018-02-27 00:29:04','2018-02-27 00:29:04'),(8,'TURISMO RELIGIOSO','1546449600.png',1,1,'2018-02-27 00:29:27','2018-02-27 00:29:27'),(9,'TURISMO DE AVENTURA','1546449459.png',1,1,'2018-02-27 00:30:08','2018-02-27 00:30:08'),(10,'TURISMO DE SAÚDE','1546450211.png',1,1,'2018-02-27 00:30:32','2018-02-27 00:30:32'),(11,'TURISMO SOL E PRAIA','1546449888.png',1,1,'2018-02-27 00:31:00','2018-02-27 00:31:00'),(13,'ILHA DO CARDOSO','1521066155.png',3,1,'2018-03-08 19:40:03','2018-03-08 19:40:03'),(14,'OSTRAS DO MANDIRA','1547910354.png',3,1,'2018-03-08 19:40:58','2018-03-08 19:40:58'),(15,'SÍTIOS E ROÇAS CAIÇARAS','1547911457.png',3,1,'2018-03-08 19:41:20','2018-03-08 19:41:20'),(16,'VIVA TAKUARI-TY','1547911708.png',3,1,'2018-03-08 19:41:40','2018-03-08 19:41:40'),(19,'CIRCUITO DAS CACHOEIRAS','1547911953.png',3,1,'2018-03-08 19:43:13','2018-03-08 19:43:13'),(20,'TERRITÓRIO DO FANDANGO CAIÇARA','1547914074.png',3,1,'2018-03-08 19:43:44','2018-03-08 19:43:44'),(21,'OBSERVAÇÃO DE BOTOS','1521066261.png',3,1,'2018-03-08 19:44:05','2018-03-08 19:44:05'),(22,'PESCA ARTESANAL','1521066272.png',3,1,'2018-03-08 19:44:26','2018-03-08 19:44:26'),(23,'ILHA DO BOM ABRIGO','1521066282.png',3,1,'2018-03-08 19:44:48','2018-03-08 19:44:48'),(24,'HOTEIS','1521066293.png',4,1,'2018-03-08 19:45:31','2018-03-08 19:45:31'),(25,'POUSADAS','1521066304.png',4,1,'2018-03-08 19:45:53','2018-03-08 19:45:53'),(26,'HOSTELS','1521066313.png',4,1,'2018-03-08 19:46:13','2018-03-08 19:46:13'),(27,'CAMPINGS','1521066324.png',4,1,'2018-03-08 19:46:54','2018-03-08 19:46:54'),(28,'CASA P/ ALUGAR','1521066335.png',4,1,'2018-03-08 19:47:14','2018-03-08 19:47:14'),(29,'RESTAURANTES','1521066345.png',5,1,'2018-03-08 19:47:42','2018-03-08 19:47:42'),(30,'PIZZARIAS','1521066356.png',5,1,'2018-03-08 19:48:03','2018-03-08 19:48:03'),(31,'LANCHONETES','1521066366.png',5,1,'2018-03-08 19:48:29','2018-03-08 19:48:29'),(32,'COMERCIOS COMUNITÁRIOS E/OU FAMILIARES','1521066375.png',5,1,'2018-03-08 19:49:57','2018-03-08 19:49:57'),(33,'BARES','1521066385.png',5,1,'2018-03-08 19:50:13','2018-03-08 19:50:13'),(34,'SORVETERIAS','1521066395.png',5,1,'2018-03-08 19:50:31','2024-05-30 17:10:50'),(35,'FESTAS COMUNITÁRIAS','1521066404.png',6,1,'2018-03-08 19:51:04','2018-03-08 19:51:04'),(36,'FESTAS RELIGIOSAS','1521066413.png',6,1,'2018-03-08 19:51:23','2018-03-08 19:51:23'),(37,'EVENTOS CULTURAIS','1521066422.png',6,1,'2018-03-08 19:51:40','2018-03-08 19:51:40'),(38,'FERIADOS','1521066431.png',6,1,'2018-03-08 19:51:56','2018-03-08 19:51:56'),(39,'AGÊNCIAS DE TURISMO','1521066439.png',8,1,'2018-03-08 19:52:22','2018-03-08 19:52:22'),(40,'GUIAS DE TURISMO','1521066449.png',8,1,'2018-03-08 19:52:38','2018-03-08 19:52:38'),(41,'MONITORES AMBIENTAIS','1521066457.png',8,1,'2018-03-08 19:53:05','2018-03-08 19:53:05'),(42,'ESCUNAS E LANCHAS','1521066465.png',8,1,'2018-03-08 19:53:24','2018-03-08 19:53:24'),(43,'MERCADOS E PADARIAS','1521066473.png',8,1,'2018-03-08 19:53:43','2018-03-08 19:53:43'),(44,'POSTO DE GASOLINA','1521066482.png',8,1,'2018-03-08 19:54:06','2018-03-08 19:54:06'),(45,'FARMÁCIAS','1521066490.png',8,1,'2018-03-08 19:54:26','2018-03-08 19:54:26'),(46,'BANCOS','1521066499.png',8,1,'2018-03-08 19:54:37','2018-03-08 19:54:37'),(47,'EMERGÊNCIA','1521066507.png',8,1,'2018-03-08 19:54:57','2018-03-08 19:54:57'),(48,'TAXI','1521066517.png',8,1,'2018-03-08 19:55:10','2018-03-08 19:55:10'),(49,'MECANICA','1523306127.png',8,1,'2018-03-30 18:28:41','2018-03-30 18:28:41'),(50,'MARINA','1523306156.png',8,1,'2018-03-30 18:46:06','2018-03-30 18:46:06'),(51,'PEIXARIA','1523306172.png',8,1,'2018-03-30 19:20:16','2018-03-30 19:20:16'),(52,'TURISMO DE PESCA','1523306185.png',8,1,'2018-03-30 19:48:35','2018-03-30 19:48:35'),(53,'LOJA DE VARIEDADES','1523306216.png',8,1,'2018-03-30 20:21:33','2018-03-30 20:21:33'),(54,'LOJA DE CONTRUCÃO','1523306264.png',8,1,'2018-03-30 21:03:50','2018-03-30 21:03:50'),(55,'CASAS DE CARNE','1523306281.png',8,1,'2018-04-06 17:42:47','2018-04-06 17:42:47'),(56,'LOJAS PARA ANIMAIS','1523306295.png',8,1,'2018-04-06 17:56:31','2018-04-06 17:56:31'),(57,'BICICLETARIAS','1523306308.png',8,1,'2018-04-06 18:44:55','2018-04-06 18:44:55'),(58,'LOJAS DE ROUPAS','1523306327.png',8,1,'2018-04-09 13:36:04','2018-04-09 13:36:04'),(59,'EDUCAÇÃO','1523306341.png',8,1,'2018-04-09 15:54:53','2018-04-09 15:54:53'),(60,'CHURRASCARIA','1523306358.png',8,1,'2018-04-09 16:13:57','2018-04-09 16:13:57'),(61,'ASSISTENCIA TECNICA','1523306370.png',8,1,'2018-04-09 17:48:12','2018-04-09 17:48:12'),(62,'CHAVEIROS','1523306380.png',8,1,'2018-04-09 18:28:12','2018-04-09 18:28:12'),(63,'GAS','1523306389.png',8,1,'2018-04-09 19:17:26','2018-04-09 19:17:26'),(64,'GRAFICAS','1523306400.png',8,1,'2018-04-09 19:26:44','2018-04-09 19:26:44'),(65,'LOJA DE MOVEIS','1523489650.png',8,1,'2018-04-10 22:42:43','2018-04-10 22:42:43'),(68,'TURISMO GASTRONÔMICO','1546451152.png',1,1,'2019-01-02 17:45:52','2019-01-02 17:45:52'),(69,'TURISMO DE ESPORTES','1546453557.png',1,1,'2019-01-02 18:25:57','2019-01-02 18:25:57'),(70,'ECOTURISMO','1546821941.png',1,2,'2019-01-07 00:45:41','2019-01-07 00:45:41');
/*!40000 ALTER TABLE `sub_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_sliders`
--

DROP TABLE IF EXISTS `tipo_sliders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_sliders` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name_tipo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_sliders`
--

LOCK TABLES `tipo_sliders` WRITE;
/*!40000 ALTER TABLE `tipo_sliders` DISABLE KEYS */;
INSERT INTO `tipo_sliders` VALUES (1,'cabeçalho',NULL,NULL),(2,'rodape',NULL,NULL);
/*!40000 ALTER TABLE `tipo_sliders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `role` char(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'agnaldo','agnaldootb@gmail.com','$2y$12$Ibxb/4m3cmNxdt3ML6Dkde3yw34VyMf4F2VlaWSjBfiZQfowGm5Li','GnAcnCFyWzwPsJ8nUomVqw8yGCeKQrS2yHOlH2lvEowxImdJ2XABO3KAwtRm','2018-02-23 22:12:10','2024-06-29 22:32:23','admin'),(2,'Fernando Oliveira Silva','fernando@matimperere.com.br','$2y$12$QR9OTDA079iIY2CPhHhuleJwAP6LAmodA.rRE1kA2v7ifZLLcwe3e','qGcdJJmdpOIjP5N3YIze2j57nN0kY0Uu6BDb4vsJmXNaGfjAOUNz1ZmTtX06','2018-02-23 22:30:21','2024-06-29 22:49:56','admin'),(3,'agnaldo','agnaldobernardojunior@yahoo.com.br','$2y$10$MMR6Z85zkflcBdwna80qMeNI9MnN2oo7E5vgEXkcwmxGy5BBsGydG','ZMiFF9yr4QkP8UEqdXDxop24r63jgGefvlP5EbPWrmDePabzn9IhKqoXrAfx','2018-02-24 20:12:18','2019-07-26 22:14:13','user'),(4,'Luan','luanrochaesil@gmail.com','$2y$10$V2HegBCW1tDK7F7Y8km2E.XSszeXRZP9qibvrCB/VToDoiIyPVxoG','DLl7RgKcmmG5JHBdIUX3MKA2i2TX0IAiv8TY2KSASrmWD8fL5KgwYXQ0YRFk','2018-03-05 23:16:30','2018-03-05 23:16:30','user'),(5,'Victor','victor.abelino4@gmail.com','$2y$10$EALHNOafV98YtdqZd12seu8/rvC.yxecXEis36F1HSGYlzwnV6Emq','lYLy9fKMhJz55ys7igUjXwvXdb65PcfziPWXPDWfbgOeq36rMSMfoQWvCIpp','2018-03-05 23:17:31','2018-03-05 23:17:31','user'),(6,'Fernando','feroliveirasil@gmail.com','$2y$10$5pOsjiS2d50CeN.WSkMDgOTLs24gBfObBpemoXJONdDDx3GW/hPi.',NULL,'2018-11-21 18:46:40','2018-11-21 18:46:40','user'),(11,'agnaldo bernardo junior','agnaldootbd@gmail.com','123',NULL,'2019-08-10 22:27:42','2019-08-10 22:27:42','user');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-29 17:14:59
