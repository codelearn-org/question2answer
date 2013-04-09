-- MySQL dump 10.13  Distrib 5.5.24, for debian-linux-gnu (i686)
--
-- Host: localhost    Database: q2a
-- ------------------------------------------------------
-- Server version	5.5.24-0ubuntu0.12.04.1

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
-- Table structure for table `qa_categories`
--

DROP TABLE IF EXISTS `qa_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qa_categories` (
  `categoryid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parentid` int(10) unsigned DEFAULT NULL,
  `title` varchar(80) NOT NULL,
  `tags` varchar(200) NOT NULL,
  `content` varchar(800) NOT NULL DEFAULT '',
  `qcount` int(10) unsigned NOT NULL DEFAULT '0',
  `position` smallint(5) unsigned NOT NULL,
  `backpath` varchar(804) NOT NULL DEFAULT '',
  PRIMARY KEY (`categoryid`),
  UNIQUE KEY `parentid` (`parentid`,`tags`),
  UNIQUE KEY `parentid_2` (`parentid`,`position`),
  KEY `backpath` (`backpath`(200))
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qa_categories`
--

LOCK TABLES `qa_categories` WRITE;
/*!40000 ALTER TABLE `qa_categories` DISABLE KEYS */;
INSERT INTO `qa_categories` VALUES (1,NULL,'Module 1 - Getting started with Rails','module-1','',1,1,'module-1'),(2,1,'1. Zero to app in 5 steps','lesson-1','',1,1,'lesson-1/module-1'),(3,1,'2. Rails directory structure','lesson-2','',0,2,'lesson-2/module-1'),(4,1,'3. Say hello through Rails','lesson-3','',0,3,'lesson-3/module-1'),(5,1,'4. Pages using controller','lesson-4','',0,4,'lesson-4/module-1'),(6,1,'5. Visualizing Rails flow','lesson-5','',0,5,'lesson-5/module-1'),(7,NULL,'Module 2. Starting with to-do list app','module-2','',0,2,'module-2'),(8,7,'1. Designing to-do list app','lesson-1','',0,1,'lesson-1/module-2'),(9,7,'2. Todos from controller','lesson-2','',0,2,'lesson-2/module-2'),(10,7,'3. Model to store/fetch todos','lesson-3','',0,3,'lesson-3/module-2'),(11,7,'4. Learning to delete last todo','lesson-4','',0,4,'lesson-4/module-2'),(12,7,'5. Add Twitter Bootstrap CSS','lesson-5','',0,5,'lesson-5/module-2'),(13,NULL,'Module 3. Add, delete, mark & unmark todos','module-3','',0,3,'module-3'),(14,13,'1. Add todo from the view','lesson-1','',0,1,'lesson-1/module-3'),(15,13,'2. Adding todo through form_for','lesson-2','',0,2,'lesson-2/module-3'),(16,13,'3. Mark todo complete','lesson-3','',0,3,'lesson-3/module-3'),(17,13,'4. Edit & delete todo','lesson-4','',0,4,'lesson-4/module-3'),(18,13,'5. Ajaxifying operations','lesson-5','',0,5,'lesson-5/module-3');
/*!40000 ALTER TABLE `qa_categories` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-04-09  0:14:15
