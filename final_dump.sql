-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: 172.16.7.85    Database: university008
-- ------------------------------------------------------
-- Server version	8.0.39-0ubuntu0.24.04.2

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
-- Table structure for table `director`
--

DROP TABLE IF EXISTS `director`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `director` (
  `#dtable1` int NOT NULL AUTO_INCREMENT,
  `dirname` varchar(25) NOT NULL,
  `facult` varchar(10) NOT NULL,
  PRIMARY KEY (`#dtable1`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `director`
--

LOCK TABLES `director` WRITE;
/*!40000 ALTER TABLE `director` DISABLE KEYS */;
INSERT INTO `director` VALUES (1,'Иванова','ИФМИТО'),(2,'Петров','ИД'),(3,'Грачёв','ИИГСО'),(4,'Мегов','ИЭСЕН');
/*!40000 ALTER TABLE `director` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `#employee` int NOT NULL AUTO_INCREMENT,
  `employeename` varchar(25) NOT NULL,
  `director_#dtable1` int NOT NULL,
  `post_postname` varchar(15) NOT NULL,
  PRIMARY KEY (`#employee`),
  KEY `fk_employee_director1_idx` (`director_#dtable1`),
  KEY `fk_employee_post1_idx` (`post_postname`),
  CONSTRAINT `fk_employee_director1` FOREIGN KEY (`director_#dtable1`) REFERENCES `director` (`#dtable1`),
  CONSTRAINT `fk_employee_post1` FOREIGN KEY (`post_postname`) REFERENCES `post` (`postname`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,'ПЕТРОВ',2,'СТ.ПР.'),(2,'КЛАССОВ',3,'ДОЦЕНТ'),(3,'СТУПИН',1,'ДОЦЕНТ'),(4,'РОЗОВ',4,'ПРОФЕССОР'),(5,'НЕКРАСОВ',1,'АССИСТЕНТ');
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_has_subject`
--

DROP TABLE IF EXISTS `employee_has_subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee_has_subject` (
  `employee_#employee` int NOT NULL,
  `subject_#subject` int NOT NULL,
  PRIMARY KEY (`employee_#employee`,`subject_#subject`),
  KEY `fk_employee_has_subject_subject1_idx` (`subject_#subject`),
  KEY `fk_employee_has_subject_employee1_idx` (`employee_#employee`),
  CONSTRAINT `fk_employee_has_subject_employee1` FOREIGN KEY (`employee_#employee`) REFERENCES `employee` (`#employee`),
  CONSTRAINT `fk_employee_has_subject_subject1` FOREIGN KEY (`subject_#subject`) REFERENCES `subject` (`#subject`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_has_subject`
--

LOCK TABLES `employee_has_subject` WRITE;
/*!40000 ALTER TABLE `employee_has_subject` DISABLE KEYS */;
INSERT INTO `employee_has_subject` VALUES (1,1),(4,1),(2,2),(3,2),(1,3),(2,3),(3,5);
/*!40000 ALTER TABLE `employee_has_subject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group`
--

DROP TABLE IF EXISTS `group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `group` (
  `#group` char(10) NOT NULL,
  `napr` mediumtext NOT NULL,
  `profil` mediumtext,
  PRIMARY KEY (`#group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group`
--

LOCK TABLES `group` WRITE;
/*!40000 ALTER TABLE `group` DISABLE KEYS */;
INSERT INTO `group` VALUES ('1','ИСИТ','ИСИТВО'),('2','АТ','ОВСАЙНТ'),('3','МО','МО'),('4','МИ','МИ');
/*!40000 ALTER TABLE `group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lessontype`
--

DROP TABLE IF EXISTS `lessontype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lessontype` (
  `lessonname` varchar(12) NOT NULL,
  PRIMARY KEY (`lessonname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lessontype`
--

LOCK TABLES `lessontype` WRITE;
/*!40000 ALTER TABLE `lessontype` DISABLE KEYS */;
INSERT INTO `lessontype` VALUES ('ЛАБ.Р.'),('ЛЕКЦИЯ'),('СЕМИНАР');
/*!40000 ALTER TABLE `lessontype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post`
--

DROP TABLE IF EXISTS `post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post` (
  `postname` varchar(15) NOT NULL,
  PRIMARY KEY (`postname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post`
--

LOCK TABLES `post` WRITE;
/*!40000 ALTER TABLE `post` DISABLE KEYS */;
INSERT INTO `post` VALUES ('АССИСТЕНТ'),('ДОЦЕНТ'),('ПРОФЕССОР'),('СТ.ПР.');
/*!40000 ALTER TABLE `post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schedule`
--

DROP TABLE IF EXISTS `schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `schedule` (
  `group_#group` char(10) NOT NULL,
  `subject_#subject` int NOT NULL,
  `lessontype_lessonname` varchar(12) NOT NULL,
  `#week` int NOT NULL,
  `day` char(3) NOT NULL,
  `#room` char(3) NOT NULL,
  PRIMARY KEY (`group_#group`,`subject_#subject`,`lessontype_lessonname`,`#week`,`day`),
  KEY `fk_group_has_subject_subject1_idx` (`subject_#subject`),
  KEY `fk_group_has_subject_group1_idx` (`group_#group`),
  KEY `fk_group_has_subject_lessontype1_idx` (`lessontype_lessonname`),
  CONSTRAINT `fk_group_has_subject_group1` FOREIGN KEY (`group_#group`) REFERENCES `group` (`#group`),
  CONSTRAINT `fk_group_has_subject_lessontype1` FOREIGN KEY (`lessontype_lessonname`) REFERENCES `lessontype` (`lessonname`),
  CONSTRAINT `fk_group_has_subject_subject1` FOREIGN KEY (`subject_#subject`) REFERENCES `subject` (`#subject`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedule`
--

LOCK TABLES `schedule` WRITE;
/*!40000 ALTER TABLE `schedule` DISABLE KEYS */;
INSERT INTO `schedule` VALUES ('1',1,'ЛЕКЦИЯ',1,'ПН','308'),('1',1,'СЕМИНАР',1,'ПН','308'),('1',5,'ЛЕКЦИЯ',2,'СР','109'),('1',5,'СЕМИНАР',2,'СР','109'),('2',1,'СЕМИНАР',1,'ПН','308'),('2',2,'ЛЕКЦИЯ',2,'ВТ','116'),('2',2,'СЕМИНАР',2,'ВТ','116'),('2',3,'ЛЕКЦИЯ',1,'ПН','415'),('3',1,'ЛАБ.Р.',4,'СР','308'),('3',1,'ЛЕКЦИЯ',3,'СР','308'),('3',1,'СЕМИНАР',3,'СР','308'),('3',2,'ЛЕКЦИЯ',2,'ПТ','116'),('3',2,'СЕМИНАР',2,'ПТ','116'),('4',1,'ЛЕКЦИЯ',5,'ПТ','308'),('4',1,'СЕМИНАР',5,'ПТ','308'),('4',4,'ЛЕКЦИЯ',4,'ВТ','415'),('4',4,'СЕМИНАР',4,'ВТ','415');
/*!40000 ALTER TABLE `schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student` (
  `#stud` int NOT NULL AUTO_INCREMENT,
  `studname` varchar(25) NOT NULL,
  `director_#dtable1` int NOT NULL,
  `group_#group` char(10) DEFAULT NULL,
  PRIMARY KEY (`#stud`),
  KEY `fk_student_director_idx` (`director_#dtable1`),
  KEY `fk_student_group1_idx` (`group_#group`),
  CONSTRAINT `fk_student_director` FOREIGN KEY (`director_#dtable1`) REFERENCES `director` (`#dtable1`),
  CONSTRAINT `fk_student_group1` FOREIGN KEY (`group_#group`) REFERENCES `group` (`#group`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (13,'ПЕТРОВ',2,'1'),(14,'ИВАНОВА',1,'2'),(15,'ГАЛИНА',3,'3'),(16,'ШЕВЦОВ',1,'1'),(17,'ШВЕДКИНА',2,'2'),(18,'МАРГАРЯН',4,'4'),(19,'ПЕТРОСЯН',2,'4'),(20,'МИХЕЕВ',1,'3'),(21,'ПАВЛОВ',4,'2'),(22,'ГАНЖИН',2,'1'),(23,'МАЛЕТИНА',3,'1'),(24,'ГРАЧЁВА',1,'2');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subject`
--

DROP TABLE IF EXISTS `subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subject` (
  `#subject` int NOT NULL AUTO_INCREMENT,
  `subjectname` varchar(85) NOT NULL,
  `subjectinfo` mediumtext,
  PRIMARY KEY (`#subject`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subject`
--

LOCK TABLES `subject` WRITE;
/*!40000 ALTER TABLE `subject` DISABLE KEYS */;
INSERT INTO `subject` VALUES (1,'ИИ',NULL),(2,'МУЛЬТИМЕДИА',NULL),(3,'ЯЗЫКИ ПРОГРАММИРОВАНИЯ',NULL),(4,'МАТЕМАТИКА',NULL),(5,'ВР',NULL);
/*!40000 ALTER TABLE `subject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vedomost`
--

DROP TABLE IF EXISTS `vedomost`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vedomost` (
  `date` date NOT NULL,
  `student_#stud` int NOT NULL,
  `employee_#employee` int NOT NULL,
  `mark` varchar(14) NOT NULL,
  PRIMARY KEY (`date`,`student_#stud`,`employee_#employee`),
  KEY `fk_student_has_employee_employee1_idx` (`employee_#employee`),
  KEY `fk_student_has_employee_student1_idx` (`student_#stud`),
  CONSTRAINT `fk_student_has_employee_employee1` FOREIGN KEY (`employee_#employee`) REFERENCES `employee` (`#employee`),
  CONSTRAINT `fk_student_has_employee_student1` FOREIGN KEY (`student_#stud`) REFERENCES `student` (`#stud`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vedomost`
--

LOCK TABLES `vedomost` WRITE;
/*!40000 ALTER TABLE `vedomost` DISABLE KEYS */;
INSERT INTO `vedomost` VALUES ('2024-09-12',14,4,'зачтено'),('2024-09-12',14,5,'зачтено'),('2024-09-12',15,5,'зачтено'),('2024-09-25',14,5,'зачтено');
/*!40000 ALTER TABLE `vedomost` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-02 13:20:13
