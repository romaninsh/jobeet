-- MySQL dump 10.13  Distrib 5.5.9, for osx10.4 (i386)
--
-- Host: localhost    Database: jobeet
-- ------------------------------------------------------
-- Server version	5.5.9

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
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Category 1'),(2,'Category 2'),(3,'Category 75'),(4,'Category 46'),(5,'Category 68');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `filestore_file`
--

DROP TABLE IF EXISTS `filestore_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `filestore_file` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `filestore_type_id` int(11) NOT NULL DEFAULT '0',
  `filestore_volume_id` int(11) NOT NULL DEFAULT '0',
  `filename` varchar(255) NOT NULL DEFAULT '',
  `original_filename` varchar(255) DEFAULT NULL,
  `filesize` int(11) NOT NULL DEFAULT '0',
  `filenum` int(11) NOT NULL DEFAULT '0',
  `deleted` enum('Y','N') NOT NULL DEFAULT 'N',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filestore_file`
--

LOCK TABLES `filestore_file` WRITE;
/*!40000 ALTER TABLE `filestore_file` DISABLE KEYS */;
INSERT INTO `filestore_file` VALUES (1,1,1,'0/fsAoRJr7','Screen Shot 2011-05-03 at 23.53.34.png',21261,0,'N'),(2,1,1,'0/fschfLDh','Screen Shot 2011-05-03 at 23.53.34.png',21261,0,'N'),(3,1,1,'0/fspYm4pZ','Screen Shot 2011-05-03 at 23.53.34.png',21261,0,'N');
/*!40000 ALTER TABLE `filestore_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `filestore_image`
--

DROP TABLE IF EXISTS `filestore_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `filestore_image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `original_file_id` int(11) NOT NULL DEFAULT '0',
  `thumb_file_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filestore_image`
--

LOCK TABLES `filestore_image` WRITE;
/*!40000 ALTER TABLE `filestore_image` DISABLE KEYS */;
/*!40000 ALTER TABLE `filestore_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `filestore_type`
--

DROP TABLE IF EXISTS `filestore_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `filestore_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `mime_type` varchar(64) NOT NULL DEFAULT '',
  `extension` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filestore_type`
--

LOCK TABLES `filestore_type` WRITE;
/*!40000 ALTER TABLE `filestore_type` DISABLE KEYS */;
INSERT INTO `filestore_type` VALUES (1,'png','image/png','png'),(2,'jpeg','image/jpeg','jpeg'),(3,'gif','image/gif','gif');
/*!40000 ALTER TABLE `filestore_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `filestore_volume`
--

DROP TABLE IF EXISTS `filestore_volume`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `filestore_volume` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL DEFAULT '',
  `dirname` varchar(255) NOT NULL DEFAULT '',
  `total_space` bigint(20) NOT NULL DEFAULT '0',
  `used_space` bigint(20) NOT NULL DEFAULT '0',
  `stored_files_cnt` int(11) NOT NULL DEFAULT '0',
  `enabled` enum('Y','N') DEFAULT 'Y',
  `last_filenum` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filestore_volume`
--

LOCK TABLES `filestore_volume` WRITE;
/*!40000 ALTER TABLE `filestore_volume` DISABLE KEYS */;
INSERT INTO `filestore_volume` VALUES (1,'upload','upload',1000000000,0,7,'Y',NULL);
/*!40000 ALTER TABLE `filestore_volume` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job`
--

DROP TABLE IF EXISTS `job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `job` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` varchar(255) DEFAULT NULL,
  `category` int(11) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `company` varchar(255) DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `position` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `description` text,
  `how_to_apply` text,
  `is_public` enum('Y','N') DEFAULT NULL,
  `is_activated` enum('Y','N') DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `token` varchar(255) DEFAULT NULL,
  `created_dts` datetime DEFAULT NULL,
  `updated_dts` datetime DEFAULT NULL,
  `expires_at` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=55 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job`
--

LOCK TABLES `job` WRITE;
/*!40000 ALTER TABLE `job` DISABLE KEYS */;
INSERT INTO `job` VALUES (1,'1',NULL,'123','Agile\'tech','','http://agileteceh.ie','mega job!','Dublin','natoehusn aoehunsa esutnhasnu hasnth','sn haosenu asnuh snato eusnah ins h','Y','N','',NULL,NULL,'2011-04-26 02:48:46',NULL),(2,'1',NULL,'','Comp2','','','posi','loca','desc','','N','N','',NULL,'2011-04-26 03:38:13',NULL,'2011-05-26'),(3,'2',NULL,'blah bub','snth','nth','','','','','','N','N','',NULL,'2011-04-26 04:40:25',NULL,'2011-05-26'),(4,'4',NULL,NULL,'Company 0',NULL,NULL,'Web Developer','London, UK','Lorem ipsum dolor sit amet, consectetur adipisicing elit','Send your resume to lorem.ipsum [at] company_0','Y','Y','job@example.com',NULL,'2011-04-26 05:00:10',NULL,'2011-05-26'),(5,'5',NULL,NULL,'Company 0',NULL,NULL,'Web Developer','London, UK','Lorem ipsum dolor sit amet, consectetur adipisicing elit','Send your resume to lorem.ipsum [at] company_0','Y','Y','job@example.com',NULL,'2011-04-26 05:01:45',NULL,'2011-05-26'),(6,'5',NULL,NULL,'Company 1',NULL,NULL,'Web Developer','London, UK','Lorem ipsum dolor sit amet, consectetur adipisicing elit','Send your resume to lorem.ipsum [at] company_1','Y','Y','job@example.com',NULL,'2011-04-26 05:01:45',NULL,'2011-05-26'),(7,'5',NULL,NULL,'Company 2',NULL,NULL,'Web Developer','London, UK','Lorem ipsum dolor sit amet, consectetur adipisicing elit','Send your resume to lorem.ipsum [at] company_2','Y','Y','job@example.com',NULL,'2011-04-26 05:01:45',NULL,'2011-05-26'),(8,'5',NULL,NULL,'Company 3',NULL,NULL,'Web Developer','London, UK','Lorem ipsum dolor sit amet, consectetur adipisicing elit','Send your resume to lorem.ipsum [at] company_3','Y','Y','job@example.com',NULL,'2011-04-26 05:01:45',NULL,'2011-05-26'),(9,'5',NULL,NULL,'Company 4',NULL,NULL,'Web Developer','London, UK','Lorem ipsum dolor sit amet, consectetur adipisicing elit','Send your resume to lorem.ipsum [at] company_4','Y','Y','job@example.com',NULL,'2011-04-26 05:01:45',NULL,'2011-05-26'),(10,'5',NULL,NULL,'Company 5',NULL,NULL,'Web Developer','London, UK','Lorem ipsum dolor sit amet, consectetur adipisicing elit','Send your resume to lorem.ipsum [at] company_5','Y','Y','job@example.com',NULL,'2011-04-26 05:01:45',NULL,'2011-05-26'),(11,'5',NULL,NULL,'Company 6',NULL,NULL,'Web Developer','London, UK','Lorem ipsum dolor sit amet, consectetur adipisicing elit','Send your resume to lorem.ipsum [at] company_6','Y','Y','job@example.com',NULL,'2011-04-26 05:01:45',NULL,'2011-05-26'),(12,'5',NULL,NULL,'Company 7',NULL,NULL,'Web Developer','London, UK','Lorem ipsum dolor sit amet, consectetur adipisicing elit','Send your resume to lorem.ipsum [at] company_7','Y','Y','job@example.com',NULL,'2011-04-26 05:01:45',NULL,'2011-05-26'),(13,'5',NULL,NULL,'Company 8',NULL,NULL,'Web Developer','London, UK','Lorem ipsum dolor sit amet, consectetur adipisicing elit','Send your resume to lorem.ipsum [at] company_8','Y','Y','job@example.com',NULL,'2011-04-26 05:01:45',NULL,'2011-05-26'),(14,'5',NULL,NULL,'Company 9',NULL,NULL,'Web Developer','London, UK','Lorem ipsum dolor sit amet, consectetur adipisicing elit','Send your resume to lorem.ipsum [at] company_9','Y','Y','job@example.com',NULL,'2011-04-26 05:01:45',NULL,'2011-05-26'),(15,'5',NULL,NULL,'Company 10',NULL,NULL,'Web Developer','London, UK','Lorem ipsum dolor sit amet, consectetur adipisicing elit','Send your resume to lorem.ipsum [at] company_10','Y','Y','job@example.com',NULL,'2011-04-26 05:01:45',NULL,'2011-05-26'),(16,'5',NULL,NULL,'Company 11',NULL,NULL,'Web Developer','London, UK','Lorem ipsum dolor sit amet, consectetur adipisicing elit','Send your resume to lorem.ipsum [at] company_11','Y','Y','job@example.com',NULL,'2011-04-26 05:01:45',NULL,'2011-05-26'),(17,'5',NULL,NULL,'Company 12',NULL,NULL,'Web Developer','London, UK','Lorem ipsum dolor sit amet, consectetur adipisicing elit','Send your resume to lorem.ipsum [at] company_12','Y','Y','job@example.com',NULL,'2011-04-26 05:01:45',NULL,'2011-05-26'),(18,'5',NULL,NULL,'Company 13',NULL,NULL,'Web Developer','London, UK','Lorem ipsum dolor sit amet, consectetur adipisicing elit','Send your resume to lorem.ipsum [at] company_13','Y','Y','job@example.com',NULL,'2011-04-26 05:01:45',NULL,'2011-05-26'),(19,'5',NULL,NULL,'Company 14',NULL,NULL,'Web Developer','London, UK','Lorem ipsum dolor sit amet, consectetur adipisicing elit','Send your resume to lorem.ipsum [at] company_14','Y','Y','job@example.com',NULL,'2011-04-26 05:01:45',NULL,'2011-05-26'),(20,'5',NULL,NULL,'Company 15',NULL,NULL,'Web Developer','London, UK','Lorem ipsum dolor sit amet, consectetur adipisicing elit','Send your resume to lorem.ipsum [at] company_15','Y','Y','job@example.com',NULL,'2011-04-26 05:01:45',NULL,'2011-05-26'),(21,'5',NULL,NULL,'Company 16',NULL,NULL,'Web Developer','London, UK','Lorem ipsum dolor sit amet, consectetur adipisicing elit','Send your resume to lorem.ipsum [at] company_16','Y','Y','job@example.com',NULL,'2011-04-26 05:01:45',NULL,'2011-05-26'),(22,'5',NULL,NULL,'Company 17',NULL,NULL,'Web Developer','London, UK','Lorem ipsum dolor sit amet, consectetur adipisicing elit','Send your resume to lorem.ipsum [at] company_17','Y','Y','job@example.com',NULL,'2011-04-26 05:01:45',NULL,'2011-05-26'),(23,'5',NULL,NULL,'Company 18',NULL,NULL,'Web Developer','London, UK','Lorem ipsum dolor sit amet, consectetur adipisicing elit','Send your resume to lorem.ipsum [at] company_18','Y','Y','job@example.com',NULL,'2011-04-26 05:01:45',NULL,'2011-05-26'),(24,'5',NULL,NULL,'Company 19',NULL,NULL,'Web Developer','London, UK','Lorem ipsum dolor sit amet, consectetur adipisicing elit','Send your resume to lorem.ipsum [at] company_19','Y','Y','job@example.com',NULL,'2011-04-26 05:01:45',NULL,'2011-05-26'),(25,'5',NULL,NULL,'Company 20',NULL,NULL,'Web Developer','London, UK','Lorem ipsum dolor sit amet, consectetur adipisicing elit','Send your resume to lorem.ipsum [at] company_20','Y','Y','job@example.com',NULL,'2011-04-26 05:01:45',NULL,'2011-05-26'),(26,'5',NULL,NULL,'Company 21',NULL,NULL,'Web Developer','London, UK','Lorem ipsum dolor sit amet, consectetur adipisicing elit','Send your resume to lorem.ipsum [at] company_21','Y','Y','job@example.com',NULL,'2011-04-26 05:01:45',NULL,'2011-05-26'),(27,'5',NULL,NULL,'Company 22',NULL,NULL,'Web Developer','London, UK','Lorem ipsum dolor sit amet, consectetur adipisicing elit','Send your resume to lorem.ipsum [at] company_22','Y','Y','job@example.com',NULL,'2011-04-26 05:01:45',NULL,'2011-05-26'),(28,'5',NULL,NULL,'Company 23',NULL,NULL,'Web Developer','London, UK','Lorem ipsum dolor sit amet, consectetur adipisicing elit','Send your resume to lorem.ipsum [at] company_23','Y','Y','job@example.com',NULL,'2011-04-26 05:01:45',NULL,'2011-05-26'),(29,'5',NULL,NULL,'Company 24',NULL,NULL,'Web Developer','London, UK','Lorem ipsum dolor sit amet, consectetur adipisicing elit','Send your resume to lorem.ipsum [at] company_24','Y','Y','job@example.com',NULL,'2011-04-26 05:01:45',NULL,'2011-05-26'),(30,'5',NULL,NULL,'Company 25',NULL,NULL,'Web Developer','London, UK','Lorem ipsum dolor sit amet, consectetur adipisicing elit','Send your resume to lorem.ipsum [at] company_25','Y','Y','job@example.com',NULL,'2011-04-26 05:01:45',NULL,'2011-05-26'),(31,'5',NULL,NULL,'Company 26',NULL,NULL,'Web Developer','London, UK','Lorem ipsum dolor sit amet, consectetur adipisicing elit','Send your resume to lorem.ipsum [at] company_26','Y','Y','job@example.com',NULL,'2011-04-26 05:01:45',NULL,'2011-05-26'),(32,'5',NULL,NULL,'Company 27',NULL,NULL,'Web Developer','London, UK','Lorem ipsum dolor sit amet, consectetur adipisicing elit','Send your resume to lorem.ipsum [at] company_27','Y','Y','job@example.com',NULL,'2011-04-26 05:01:45',NULL,'2011-05-26'),(33,'5',NULL,NULL,'Company 28',NULL,NULL,'Web Developer','London, UK','Lorem ipsum dolor sit amet, consectetur adipisicing elit','Send your resume to lorem.ipsum [at] company_28','Y','Y','job@example.com',NULL,'2011-04-26 05:01:45',NULL,'2011-05-26'),(34,'5',NULL,NULL,'Company 29',NULL,NULL,'Web Developer','London, UK','Lorem ipsum dolor sit amet, consectetur adipisicing elit','Send your resume to lorem.ipsum [at] company_29','Y','Y','job@example.com',NULL,'2011-04-26 05:01:45',NULL,'2011-05-26'),(35,NULL,NULL,'','','','','','','','','N','N','',NULL,'2011-05-04 23:22:46',NULL,'2011-06-03'),(36,NULL,NULL,'','','','','','','','','N','N','',NULL,'2011-05-04 23:25:25',NULL,'2011-06-03'),(37,NULL,NULL,'','','','','','','','','N','N','',NULL,'2011-05-04 23:31:43',NULL,'2011-06-03'),(38,NULL,NULL,'','nthsnhsnthnshsnth','','','','','','','N','N','',NULL,'2011-05-04 23:47:40',NULL,'2011-06-03'),(39,NULL,NULL,'','aoeuaoeuaou','','nateu','snathoeunat','snaoheusnatuh','santehusantuh','asunethaesunth','N','N','snthsnth',NULL,'2011-05-04 23:55:52',NULL,'2011-06-03'),(40,NULL,NULL,'','aoeuaoeuaou','','nateu','snathoeunat','snaoheusnatuh','santehusantuh','asunethaesunth','N','N','snthsnth',NULL,'2011-05-05 00:02:13',NULL,'2011-06-04'),(41,NULL,NULL,'','aoeuaoeuaou','','nateu','snathoeunat','snaoheusnatuh','santehusantuh','asunethaesunth','N','N','snthsnth',NULL,'2011-05-05 00:02:23',NULL,'2011-06-04'),(42,NULL,NULL,'','aoeuaoeuaou','','nateu','snathoeunat','snaoheusnatuh','santehusantuh','asunethaesunth','N','N','snthsnth',NULL,'2011-05-05 00:02:36',NULL,'2011-06-04'),(43,NULL,NULL,'','aoeuaoeuaou','','nateu','snathoeunat','snaoheusnatuh','santehusantuh','asunethaesunth','N','N','snthsnth',NULL,'2011-05-05 00:02:44',NULL,'2011-06-04'),(44,NULL,NULL,'','aoeuaoeuaou','','nateu','snathoeunat','snaoheusnatuh','santehusantuh','asunethaesunth','N','N','snthsnth',NULL,'2011-05-05 00:03:48',NULL,'2011-06-04'),(45,NULL,NULL,'','aoeuaoeuaou','','nateu','snathoeunat','snaoheusnatuh','santehusantuh','asunethaesunth','N','N','snthsnth',NULL,'2011-05-05 00:03:55',NULL,'2011-06-04'),(46,NULL,NULL,'','aoeuaoeuaou','','nateu','snathoeunat','snaoheusnatuh','santehusantuh','asunethaesunth','N','N','snthsnth',NULL,'2011-05-05 00:04:05',NULL,'2011-06-04'),(47,NULL,NULL,'','aoeuaoeuaou','','nateu','snathoeunat','snaoheusnatuh','santehusantuh','asunethaesunth','N','N','snthsnth',NULL,'2011-05-05 00:05:42',NULL,'2011-06-04'),(48,NULL,NULL,'','aoeuaoeuaou','','nateu','snathoeunat','snaoheusnatuh','santehusantuh','asunethaesunth','N','N','snthsnth',NULL,'2011-05-05 00:05:51',NULL,'2011-06-04'),(49,NULL,NULL,'','aoeuaoeuaou','','nateu','snathoeunat','snaoheusnatuh','santehusantuh','asunethaesunth','N','N','snthsnth',NULL,'2011-05-05 00:08:47',NULL,'2011-06-04'),(50,NULL,NULL,'','aoeuaoeuaou','','http://yahoo.com/','snathoeunat','snaoheusnatuh','santehusantuh','asunethaesunth','N','N','snthsnth',NULL,'2011-05-05 00:09:19',NULL,'2011-06-04'),(51,NULL,NULL,'','aoeuaoeuaou','','http://yahoo.com/','snathoeunat','snaoheusnatuh','santehusantuh','asunethaesunth','N','N','snthsnth',NULL,'2011-05-05 00:11:26',NULL,'2011-06-04'),(52,NULL,NULL,'','aoeuaoeuaou','','http://yahoo.co','snathoeunat','snaoheusnatuh','santehusantuh','asunethaesunth','N','N','snthsnth',NULL,'2011-05-05 00:11:29',NULL,'2011-06-04'),(53,'3',NULL,'full-time','Compa','','http://yahoo.com','CEO','Dublin','aoeuau','aoua','N',NULL,'r@agiletech.ie','5721926a4b5a655b495f940788dcdb7b6966921d','2011-05-05 01:01:58',NULL,'2011-06-04'),(54,'3',NULL,'full-time','Compa','3','http://yahoo.com','CEO','Dublin','aoeuau','aoua','N',NULL,'r@agiletech.ie','95b075aaa88f588e70f563a8acb8e1775f9513ec','2011-05-05 01:02:18',NULL,'2011-06-04');
/*!40000 ALTER TABLE `job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `surname` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `manager_id` varchar(255) DEFAULT NULL,
  `manager` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2011-05-05  1:03:03
