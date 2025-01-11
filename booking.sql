-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: train_booking_database
-- ------------------------------------------------------
-- Server version	8.2.0

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
-- Table structure for table `booking`
--

DROP TABLE IF EXISTS `booking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `booking` (
  `id` int NOT NULL AUTO_INCREMENT,
  `passenger_id` int DEFAULT NULL,
  `position` int NOT NULL,
  `status_id` int DEFAULT NULL,
  `booking_date` date NOT NULL,
  `starting_station_id` int DEFAULT NULL,
  `ending_station_id` int DEFAULT NULL,
  `train_journey_id` int DEFAULT NULL,
  `ticket_class_id` int DEFAULT NULL,
  `amount_paid` decimal(10,2) NOT NULL,
  `ticket_no` int NOT NULL,
  `seat_no` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `passenger_id` (`passenger_id`),
  KEY `status_id` (`status_id`),
  KEY `starting_station_id` (`starting_station_id`),
  KEY `ending_station_id` (`ending_station_id`),
  KEY `train_journey_id` (`train_journey_id`),
  KEY `ticket_class_id` (`ticket_class_id`),
  CONSTRAINT `booking_ibfk_1` FOREIGN KEY (`passenger_id`) REFERENCES `passenger` (`id`),
  CONSTRAINT `booking_ibfk_2` FOREIGN KEY (`status_id`) REFERENCES `booking_status` (`id`),
  CONSTRAINT `booking_ibfk_3` FOREIGN KEY (`starting_station_id`) REFERENCES `train_station` (`id`),
  CONSTRAINT `booking_ibfk_4` FOREIGN KEY (`ending_station_id`) REFERENCES `train_station` (`id`),
  CONSTRAINT `booking_ibfk_5` FOREIGN KEY (`train_journey_id`) REFERENCES `train_journey` (`id`),
  CONSTRAINT `booking_ibfk_6` FOREIGN KEY (`ticket_class_id`) REFERENCES `carriage_class` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking`
--

LOCK TABLES `booking` WRITE;
/*!40000 ALTER TABLE `booking` DISABLE KEYS */;
INSERT INTO `booking` VALUES (1,1,2,2,'2022-09-18',1,9,1,1,3000.00,2002,15),(2,2,3,2,'2022-10-20',1,9,1,1,2800.00,2004,18),(3,3,4,1,'2022-10-30',6,9,9,2,2000.00,2008,10),(4,4,4,3,'2022-10-31',6,9,9,2,2200.00,2010,12),(5,5,3,2,'2022-09-19',1,9,1,1,2800.00,2003,15),(6,6,9,2,'2022-10-29',3,8,3,3,1000.00,2009,20),(7,7,9,3,'2022-10-29',3,8,3,3,1200.00,2011,24),(8,8,9,3,'2022-10-29',3,8,3,3,1000.00,2013,28),(9,9,4,3,'2022-10-31',6,9,9,2,2200.00,2012,14),(10,10,3,2,'2022-10-20',1,9,1,1,2800.00,2006,19);
/*!40000 ALTER TABLE `booking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `booking_status`
--

DROP TABLE IF EXISTS `booking_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `booking_status` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking_status`
--

LOCK TABLES `booking_status` WRITE;
/*!40000 ALTER TABLE `booking_status` DISABLE KEYS */;
INSERT INTO `booking_status` VALUES (1,'Pending'),(2,'Complete'),(3,'Cancelled');
/*!40000 ALTER TABLE `booking_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carriage_class`
--

DROP TABLE IF EXISTS `carriage_class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carriage_class` (
  `id` int NOT NULL AUTO_INCREMENT,
  `class_name` varchar(200) NOT NULL,
  `seating_capacity` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carriage_class`
--

LOCK TABLES `carriage_class` WRITE;
/*!40000 ALTER TABLE `carriage_class` DISABLE KEYS */;
INSERT INTO `carriage_class` VALUES (1,'First-Class',50),(2,'Business',100),(3,'Economy',200);
/*!40000 ALTER TABLE `carriage_class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carriage_price`
--

DROP TABLE IF EXISTS `carriage_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carriage_price` (
  `schedule_id` int DEFAULT NULL,
  `carriage_class_id` int DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  KEY `schedule_id` (`schedule_id`),
  KEY `carriage_class_id` (`carriage_class_id`),
  CONSTRAINT `carriage_price_ibfk_1` FOREIGN KEY (`schedule_id`) REFERENCES `schedule` (`id`),
  CONSTRAINT `carriage_price_ibfk_2` FOREIGN KEY (`carriage_class_id`) REFERENCES `carriage_class` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carriage_price`
--

LOCK TABLES `carriage_price` WRITE;
/*!40000 ALTER TABLE `carriage_price` DISABLE KEYS */;
INSERT INTO `carriage_price` VALUES (1,1,2500.50),(1,2,2000.50),(1,3,1500.50),(2,1,2200.50),(2,2,1800.50),(2,3,1300.50),(3,1,2000.50),(3,2,1500.50),(3,3,1000.50);
/*!40000 ALTER TABLE `carriage_price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `journey_carriage`
--

DROP TABLE IF EXISTS `journey_carriage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `journey_carriage` (
  `journey_id` int DEFAULT NULL,
  `carriage_class_id` int DEFAULT NULL,
  `position` int NOT NULL,
  KEY `journey_id` (`journey_id`),
  KEY `carriage_class_id` (`carriage_class_id`),
  CONSTRAINT `journey_carriage_ibfk_1` FOREIGN KEY (`journey_id`) REFERENCES `train_journey` (`id`),
  CONSTRAINT `journey_carriage_ibfk_2` FOREIGN KEY (`carriage_class_id`) REFERENCES `carriage_class` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `journey_carriage`
--

LOCK TABLES `journey_carriage` WRITE;
/*!40000 ALTER TABLE `journey_carriage` DISABLE KEYS */;
INSERT INTO `journey_carriage` VALUES (1,1,2),(2,1,2),(3,1,3),(4,1,3),(5,2,4),(6,2,5),(7,2,6),(8,2,7),(9,3,8),(10,3,9),(11,3,10),(12,3,11);
/*!40000 ALTER TABLE `journey_carriage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `journey_station`
--

DROP TABLE IF EXISTS `journey_station`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `journey_station` (
  `journey_id` int NOT NULL,
  `station_id` int NOT NULL,
  `stop_order` int NOT NULL,
  `departure_time` datetime NOT NULL,
  KEY `journey_id` (`journey_id`),
  KEY `station_id` (`station_id`),
  CONSTRAINT `journey_station_ibfk_1` FOREIGN KEY (`journey_id`) REFERENCES `train_journey` (`id`),
  CONSTRAINT `journey_station_ibfk_2` FOREIGN KEY (`station_id`) REFERENCES `train_station` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `journey_station`
--

LOCK TABLES `journey_station` WRITE;
/*!40000 ALTER TABLE `journey_station` DISABLE KEYS */;
INSERT INTO `journey_station` VALUES (1,1,369,'2022-10-21 08:30:00'),(2,2,46,'2022-10-22 09:00:00'),(3,3,57,'2022-10-24 11:00:00'),(4,4,5,'2022-10-24 14:00:00'),(5,5,43,'2022-10-26 16:00:00'),(6,6,53,'2022-10-26 18:00:00'),(7,7,643,'2022-10-27 20:00:00'),(8,8,754,'2022-10-27 08:00:00'),(9,9,642,'2022-10-28 10:00:00'),(10,6,78,'2022-10-28 12:00:00'),(11,8,64,'2022-10-30 10:00:00'),(12,5,432,'2022-10-30 10:00:00');
/*!40000 ALTER TABLE `journey_station` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `passenger`
--

DROP TABLE IF EXISTS `passenger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `passenger` (
  `id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(200) NOT NULL,
  `last_name` varchar(200) NOT NULL,
  `email_address` varchar(200) NOT NULL,
  `password` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `passenger`
--

LOCK TABLES `passenger` WRITE;
/*!40000 ALTER TABLE `passenger` DISABLE KEYS */;
INSERT INTO `passenger` VALUES (1,'Mike','Mghenyi','mikemghenyi5@gmail.com','MikeMghenyi#55'),(2,'Maryanne','Wambui','marieleewambui@gmail.com','MaryanneWambui#98'),(3,'Samson','Mutemi','samsonmutemi377@gmail.com','SamsonMutemi#45'),(4,'Valerie','Cherono','cheronovalerine@gmail.com','ValerieCherono#23'),(5,'Washington','Amolo','amolowashington659@gmail.com','WashingtonAmolo#69'),(6,'Rosemary','Nduati','rosenduati06@gmail.com','RosemaryNduati#65'),(7,'Anerico','Kaikai','anericomisiko@gmail.com','AnericoKaikai#78'),(8,'Hussein','Osman','huska8081@gmail.com','HusseinOsman#34'),(9,'Abel','Morara','am.abelmokaya832@gmail.com','AbelMorara#90'),(10,'Damaris','Kavinya','damarismutyandii@gmail.com','DamarisKavinya#98');
/*!40000 ALTER TABLE `passenger` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schedule`
--

DROP TABLE IF EXISTS `schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `schedule` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(300) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedule`
--

LOCK TABLES `schedule` WRITE;
/*!40000 ALTER TABLE `schedule` DISABLE KEYS */;
INSERT INTO `schedule` VALUES (1,'Weekdays'),(2,'Weekends'),(3,'Holidays');
/*!40000 ALTER TABLE `schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `train_journey`
--

DROP TABLE IF EXISTS `train_journey`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `train_journey` (
  `id` int NOT NULL AUTO_INCREMENT,
  `schedule_id` int NOT NULL,
  `name` varchar(300) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `schedule_id` (`schedule_id`),
  CONSTRAINT `train_journey_ibfk_1` FOREIGN KEY (`schedule_id`) REFERENCES `schedule` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `train_journey`
--

LOCK TABLES `train_journey` WRITE;
/*!40000 ALTER TABLE `train_journey` DISABLE KEYS */;
INSERT INTO `train_journey` VALUES (1,1,'NAIROBI TO MOMBASA'),(2,1,'ATHI-RIVER TO VOI '),(3,1,'EMALI TO MARIAKANI'),(4,1,'KIBWEZI TO MIASENYI'),(5,2,'MARIAKANI TO NAIROBI'),(6,2,'VOI TO ATHI-RIVER'),(7,2,'MTITTO-ANDEI TO ATHI-RIVER'),(8,2,'MOMBASA TO NAIROBI'),(9,3,'VOI TO MOMBASA'),(10,3,'MTITO-ANDEI TO NAIROBI'),(11,3,'MIASANYI TO ATHI-RIVER'),(12,3,'MARIAKANI TO EMALI');
/*!40000 ALTER TABLE `train_journey` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `train_station`
--

DROP TABLE IF EXISTS `train_station`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `train_station` (
  `id` int NOT NULL AUTO_INCREMENT,
  `station_name` varchar(300) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `train_station`
--

LOCK TABLES `train_station` WRITE;
/*!40000 ALTER TABLE `train_station` DISABLE KEYS */;
INSERT INTO `train_station` VALUES (1,'NAIROBI'),(2,'ATHI-RIVER'),(3,'EMALI'),(4,'KIBWEZI'),(5,'MTITO-ANDEI'),(6,'VOI'),(7,'MIASENYI'),(8,'MARIAKANI'),(9,'MOMBASA');
/*!40000 ALTER TABLE `train_station` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-01-11  7:28:20
