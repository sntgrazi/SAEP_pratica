-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: containers-us-west-117.railway.app    Database: railway
-- ------------------------------------------------------
-- Server version	8.0.33

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
-- Table structure for table `alocacao`
--

DROP TABLE IF EXISTS `alocacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alocacao` (
  `id` int NOT NULL AUTO_INCREMENT,
  `area` int NOT NULL,
  `automovel_id` int NOT NULL,
  `concessionaria_id` int NOT NULL,
  `quantidade` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `alocacao_ibfk_1` (`automovel_id`),
  KEY `alocacao_ibfk_2` (`concessionaria_id`),
  CONSTRAINT `alocacao_ibfk_1` FOREIGN KEY (`automovel_id`) REFERENCES `automoveis` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `alocacao_ibfk_2` FOREIGN KEY (`concessionaria_id`) REFERENCES `concessionaria` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alocacao`
--

LOCK TABLES `alocacao` WRITE;
/*!40000 ALTER TABLE `alocacao` DISABLE KEYS */;
INSERT INTO `alocacao` VALUES (1,1,2,2,8),(2,2,3,3,1),(3,4,4,4,4),(4,7,5,2,6),(5,8,6,3,3),(6,9,7,4,4),(7,10,8,2,1),(8,1,9,3,7),(9,2,10,4,2),(10,4,11,2,6),(11,7,12,3,4),(12,8,13,4,9),(13,9,14,2,9),(14,10,15,3,6),(15,1,16,4,4),(16,2,17,2,1),(17,4,18,3,8),(18,7,19,4,3),(19,8,20,2,10),(20,9,21,3,10),(21,10,22,4,7),(22,1,23,2,3),(23,2,24,3,5),(24,4,25,4,4),(25,7,26,2,3),(26,8,27,3,3),(27,9,28,4,10),(28,10,29,2,4),(29,1,30,3,2),(30,2,31,4,3),(31,4,32,2,4),(32,7,33,3,2),(33,8,34,4,3),(34,9,35,2,4),(35,10,36,3,3),(36,1,37,4,2),(37,2,38,2,3),(38,4,39,3,3),(39,7,40,4,2),(41,3,-1,-1,0),(42,5,-1,-1,0),(43,6,-1,-1,0),(44,11,-1,-1,0);
/*!40000 ALTER TABLE `alocacao` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-06-18 19:57:57
