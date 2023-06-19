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
-- Table structure for table `automoveis`
--

DROP TABLE IF EXISTS `automoveis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `automoveis` (
  `id` int NOT NULL AUTO_INCREMENT,
  `modelo` varchar(100) NOT NULL,
  `preco` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `automoveis`
--

LOCK TABLES `automoveis` WRITE;
/*!40000 ALTER TABLE `automoveis` DISABLE KEYS */;
INSERT INTO `automoveis` VALUES (-1,'Sem Veículo','0'),(2,'Fiat Argo',' R$ 47.660,00 '),(3,'Fiat Mobi',' R$ 32.102,00 '),(4,'Jeep Compass',' R$ 34.950,00 '),(5,'Hyundai HB20',' R$ 49.302,00 '),(6,'Jeep Renegade',' R$ 36.661,00 '),(7,'Volkswagen T-Cross',' R$ 38.182,00 '),(8,'Fiat Toro',' R$ 57.733,00 '),(9,'Hyundai Creta',' R$ 55.998,00 '),(10,'Chevrolet S10',' R$ 51.035,00 '),(11,'Toyota Corolla Cross',' R$ 34.544,00 '),(12,'Toyota Hilux',' R$ 53.937,00 '),(13,'Toyota Corolla',' R$ 55.022,00 '),(14,'Volkswagen Gol',' R$ 48.253,00 '),(15,'Honda HR-V',' R$ 53.438,00 '),(16,'Renault Kwid',' R$ 31.810,00 '),(17,'Volkswagen Nivus',' R$ 35.104,00 '),(18,'Hyundai HB20S',' R$ 31.855,00 '),(19,'Ford Ranger',' R$ 48.927,00 '),(20,'Fiat Uno',' R$ 38.111,00 '),(21,'Fiat Cronos',' R$ 36.515,00 '),(22,'Citro?n C4 Cactus',' R$ 53.654,00 '),(23,'Toyota Yaris Hatchback',' R$ 55.869,00 '),(24,'Volkswagen Voyage',' R$ 30.954,00 '),(25,'Honda Civic',' R$ 30.871,00 '),(26,'Volkswagen Saveiro',' R$ 32.306,00 '),(27,'Caoa Chery Tiggo 5x',' R$ 30.069,00 '),(28,'Volkswagen Virtus',' R$ 40.689,00 '),(29,'Fiat Grand Siena',' R$ 33.469,00 '),(30,'Caoa Chery Tiggo 8',' R$ 48.481,00 '),(31,'Chevrolet Tracker',' R$ 30.648,00 '),(32,'Peugeot 208',' R$ 46.934,00 '),(33,'Toyota SW4',' R$ 54.252,00 '),(34,'Nissan Frontier',' R$ 32.596,00 '),(35,'Honda WR-V',' R$ 35.139,00 '),(36,'Volkswagen Taos',' R$ 47.546,00 '),(37,'Mitsubishi L200',' R$ 57.049,00 '),(38,'Renault Oroch',' R$ 48.756,00 '),(39,'Toyota Yaris Sedan',' R$ 43.077,00 '),(40,'Renault Duster',' R$ 52.641,00 ');
/*!40000 ALTER TABLE `automoveis` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-06-18 19:58:08
