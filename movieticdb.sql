CREATE DATABASE  IF NOT EXISTS `db_theatre` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `db_theatre`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: frtservermovietic.mysql.database.azure.com    Database: db_theatre
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `booked_tickets`
--

DROP TABLE IF EXISTS `booked_tickets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `booked_tickets` (
  `ticket_no` int NOT NULL,
  `show_id` int NOT NULL,
  `seat_no` int DEFAULT NULL,
  PRIMARY KEY (`ticket_no`,`show_id`),
  KEY `show_id` (`show_id`),
  CONSTRAINT `booked_tickets_ibfk_1` FOREIGN KEY (`show_id`) REFERENCES `shows` (`show_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booked_tickets`
--

LOCK TABLES `booked_tickets` WRITE;
/*!40000 ALTER TABLE `booked_tickets` DISABLE KEYS */;
/*!40000 ALTER TABLE `booked_tickets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `halls`
--

DROP TABLE IF EXISTS `halls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `halls` (
  `hall_id` int NOT NULL,
  `class` varchar(10) NOT NULL,
  `no_of_seats` int DEFAULT NULL,
  PRIMARY KEY (`hall_id`,`class`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `halls`
--

LOCK TABLES `halls` WRITE;
/*!40000 ALTER TABLE `halls` DISABLE KEYS */;
INSERT INTO `halls` VALUES (1,'gold',35),(1,'standard',75),(2,'gold',27),(2,'standard',97),(3,'gold',26),(3,'standard',98);
/*!40000 ALTER TABLE `halls` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movies`
--

DROP TABLE IF EXISTS `movies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movies` (
  `movie_id` int NOT NULL,
  `movie_name` varchar(40) DEFAULT NULL,
  `length` int DEFAULT NULL,
  `language` varchar(10) DEFAULT NULL,
  `show_start` date DEFAULT NULL,
  `show_end` date DEFAULT NULL,
  PRIMARY KEY (`movie_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movies`
--

LOCK TABLES `movies` WRITE;
/*!40000 ALTER TABLE `movies` DISABLE KEYS */;
/*!40000 ALTER TABLE `movies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `price_listing`
--

DROP TABLE IF EXISTS `price_listing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `price_listing` (
  `price_id` int NOT NULL,
  `type` varchar(3) DEFAULT NULL,
  `day` varchar(10) DEFAULT NULL,
  `price` int DEFAULT NULL,
  PRIMARY KEY (`price_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `price_listing`
--

LOCK TABLES `price_listing` WRITE;
/*!40000 ALTER TABLE `price_listing` DISABLE KEYS */;
INSERT INTO `price_listing` VALUES (1,'2D','Monday',210),(2,'3D','Monday',295),(3,'4DX','Monday',380),(4,'2D','Tuesday',210),(5,'3D','Tuesday',295),(6,'4DX','Tuesday',380),(7,'2D','Wednesday',210),(8,'3D','Wednesday',295),(9,'4DX','Wednesday',380),(10,'2D','Thursday',210),(11,'3D','Thursday',300),(12,'4DX','Thursday',380),(13,'2D','Friday',320),(14,'3D','Friday',335),(15,'4DX','Friday',495),(16,'2D','Saturday',320),(17,'3D','Saturday',335),(18,'4DX','Saturday',495),(19,'2D','Sunday',550),(20,'3D','Sunday',335),(21,'4DX','Sunday',0);
/*!40000 ALTER TABLE `price_listing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shows`
--

DROP TABLE IF EXISTS `shows`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shows` (
  `show_id` int NOT NULL,
  `movie_id` int DEFAULT NULL,
  `hall_id` int DEFAULT NULL,
  `type` varchar(3) DEFAULT NULL,
  `time` int DEFAULT NULL,
  `Date` date DEFAULT NULL,
  `price_id` int DEFAULT NULL,
  PRIMARY KEY (`show_id`),
  KEY `movie_id` (`movie_id`),
  KEY `hall_id` (`hall_id`),
  KEY `price_id` (`price_id`),
  CONSTRAINT `shows_ibfk_1` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`movie_id`),
  CONSTRAINT `shows_ibfk_2` FOREIGN KEY (`hall_id`) REFERENCES `halls` (`hall_id`),
  CONSTRAINT `shows_ibfk_3` FOREIGN KEY (`price_id`) REFERENCES `price_listing` (`price_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shows`
--

LOCK TABLES `shows` WRITE;
/*!40000 ALTER TABLE `shows` DISABLE KEYS */;
/*!40000 ALTER TABLE `shows` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `types`
--

DROP TABLE IF EXISTS `types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `types` (
  `movie_id` int NOT NULL,
  `type1` varchar(3) DEFAULT NULL,
  `type2` varchar(3) DEFAULT NULL,
  `type3` varchar(3) DEFAULT NULL,
  PRIMARY KEY (`movie_id`),
  CONSTRAINT `types_ibfk_1` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`movie_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `types`
--

LOCK TABLES `types` WRITE;
/*!40000 ALTER TABLE `types` DISABLE KEYS */;
/*!40000 ALTER TABLE `types` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-01-18 19:34:43
