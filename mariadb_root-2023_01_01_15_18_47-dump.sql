-- MariaDB dump 10.19  Distrib 10.6.11-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: 127.0.0.1    Database: Students_Registration
-- ------------------------------------------------------
-- Server version	10.6.11-MariaDB-0ubuntu0.22.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `addresses`
--

DROP TABLE IF EXISTS `addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `addresses` (
  `address_id` int(11) NOT NULL AUTO_INCREMENT,
  `address_description` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`address_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addresses`
--

LOCK TABLES `addresses` WRITE;
/*!40000 ALTER TABLE `addresses` DISABLE KEYS */;
INSERT INTO `addresses` VALUES (1,'Gaza'),(2,'Gaza'),(6,'Dair Al Balah'),(7,'Khan Younes'),(8,'Gaza'),(9,'gaza city');
/*!40000 ALTER TABLE `addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contacts`
--

DROP TABLE IF EXISTS `contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contacts` (
  `contact_id` int(11) NOT NULL AUTO_INCREMENT,
  `mobile_number` varchar(40) DEFAULT NULL,
  `email` varchar(120) DEFAULT NULL,
  PRIMARY KEY (`contact_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contacts`
--

LOCK TABLES `contacts` WRITE;
/*!40000 ALTER TABLE `contacts` DISABLE KEYS */;
INSERT INTO `contacts` VALUES (1,'111','ali@gmail.com'),(18,'22222','aseel@gmail.com'),(19,'0444444','khaled@gmail.com');
/*!40000 ALTER TABLE `contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_shedules`
--

DROP TABLE IF EXISTS `course_shedules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_shedules` (
  `course_schedule_id` int(11) NOT NULL AUTO_INCREMENT,
  `course_id` int(11) DEFAULT NULL,
  `day` varchar(40) DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  `start_time` time DEFAULT NULL,
  PRIMARY KEY (`course_schedule_id`),
  KEY `courseShedules_courses_course_id_fk` (`course_id`),
  CONSTRAINT `courseShedules_courses_course_id_fk` FOREIGN KEY (`course_id`) REFERENCES `courses` (`course_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_shedules`
--

LOCK TABLES `course_shedules` WRITE;
/*!40000 ALTER TABLE `course_shedules` DISABLE KEYS */;
INSERT INTO `course_shedules` VALUES (1,5,'sunday',2,'18:00:00'),(2,6,'monday',2,'09:00:00');
/*!40000 ALTER TABLE `course_shedules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courses`
--

DROP TABLE IF EXISTS `courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `courses` (
  `course_id` int(11) NOT NULL,
  `level_id` int(11) DEFAULT NULL,
  `course_name` varchar(40) DEFAULT NULL,
  `max_ capacity` varchar(40) DEFAULT NULL,
  `rate_per_hour` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`course_id`),
  KEY `courses_levels_level_id_fk` (`level_id`),
  CONSTRAINT `courses_levels_level_id_fk` FOREIGN KEY (`level_id`) REFERENCES `levels` (`level_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses`
--

LOCK TABLES `courses` WRITE;
/*!40000 ALTER TABLE `courses` DISABLE KEYS */;
INSERT INTO `courses` VALUES (1,2,'database101','40',2),(4,3,'python1','20',12),(5,1,'java1','30 ',2),(6,2,'java2','30',2);
/*!40000 ALTER TABLE `courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enrollment_histories`
--

DROP TABLE IF EXISTS `enrollment_histories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enrollment_histories` (
  `enroll_id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  `enroll_date` datetime DEFAULT NULL,
  `total_hours` int(11) DEFAULT NULL,
  `total` int(11) DEFAULT NULL,
  PRIMARY KEY (`enroll_id`),
  KEY `histories_courses_course_id_fk` (`course_id`),
  KEY `histories_students_student_id_fk` (`student_id`),
  CONSTRAINT `histories_courses_course_id_fk` FOREIGN KEY (`course_id`) REFERENCES `courses` (`course_id`),
  CONSTRAINT `histories_students_student_id_fk` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enrollment_histories`
--

LOCK TABLES `enrollment_histories` WRITE;
/*!40000 ALTER TABLE `enrollment_histories` DISABLE KEYS */;
INSERT INTO `enrollment_histories` VALUES (2,1,5,'2022-12-29 19:39:52',4,8),(3,1,6,'2022-12-29 20:09:51',2,4),(6,18,5,'2022-12-30 15:30:57',2,4),(7,19,4,'2023-01-01 15:17:11',2,24);
/*!40000 ALTER TABLE `enrollment_histories` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50032 DROP TRIGGER IF EXISTS before_insert_enrollment_history */;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger before_insert_enrollment_history
before insert
on enrollment_histories
for each row
begin

DECLARE rate int(10);
SELECT rate_per_hour from courses where courses.course_id = NEW.course_id  INTO rate;
set NEW.total= NEW.total_hours * rate;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `levels`
--

DROP TABLE IF EXISTS `levels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `levels` (
  `level_id` int(11) NOT NULL AUTO_INCREMENT,
  `level_name` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`level_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `levels`
--

LOCK TABLES `levels` WRITE;
/*!40000 ALTER TABLE `levels` DISABLE KEYS */;
INSERT INTO `levels` VALUES (1,'A'),(2,'B'),(3,'C'),(4,'D');
/*!40000 ALTER TABLE `levels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `students` (
  `student_id` int(11) NOT NULL AUTO_INCREMENT,
  `student_name` varchar(40) DEFAULT NULL,
  `contact_id` int(11) DEFAULT NULL,
  `address_id` int(11) DEFAULT NULL,
  `level_id` int(11) DEFAULT NULL,
  `DOB` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`student_id`),
  KEY `students_addresses_address_id_fk` (`address_id`),
  KEY `students_contacts_contact_id_fk` (`contact_id`),
  KEY `students_levels_level_id_fk` (`level_id`),
  CONSTRAINT `students_addresses_address_id_fk` FOREIGN KEY (`address_id`) REFERENCES `addresses` (`address_id`),
  CONSTRAINT `students_contacts_contact_id_fk` FOREIGN KEY (`contact_id`) REFERENCES `contacts` (`contact_id`),
  CONSTRAINT `students_levels_level_id_fk` FOREIGN KEY (`level_id`) REFERENCES `levels` (`level_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students`
--

LOCK TABLES `students` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
INSERT INTO `students` VALUES (1,'Ali',1,1,1,'2022-12-28'),(18,'a',18,8,1,'2-2-2022'),(19,'Khaled',19,9,3,'20-20-2022');
/*!40000 ALTER TABLE `students` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-01-01 15:18:47
