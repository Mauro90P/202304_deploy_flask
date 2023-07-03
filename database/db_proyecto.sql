CREATE DATABASE  IF NOT EXISTS `db_proyecto` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `db_proyecto`;
-- MySQL dump 10.13  Distrib 8.0.31, for macos12 (x86_64)
--
-- Host: 127.0.0.1    Database: db_proyecto
-- ------------------------------------------------------
-- Server version	8.0.22

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
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `apellido` varchar(250) NOT NULL,
  `email` varchar(250) NOT NULL,
  `password` varchar(250) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'Mauricio','Pardo Figueroaa','mauriciopardo.figueroa@gmail.com','$2b$12$zcUfYm.jM8UwNL7PMiM9q.5KqxjPBq6SX3dtN9Q7OkmXHc5hjyMYK'),(2,'Marco ','Fuentes Ruiz','manuel223@gmail.com','$2b$12$qUbCQ4o31Cx5oIC6EZiHLeC91lD8oPOgPsCXsScwP1V3FKNvPO6dK'),(3,'Marcelo ','Cortez Vidal','sam123@gmail.com','$2b$12$UH0aGbPVLu935MZ8JQ3ZJu62wUNQ6iTdRxXB2u8fmTyqzPcKi6yvC'),(4,'RAMON FEDERICO','ROLES','juanrman23@gmail.com','$2b$12$SKOFCahoT8IEf797h0vsoeMHVgcGzGu6BapBou1dkK6RFmKyO1mKy'),(5,'JUAN ','LOAN','carlos123@gmail.com','$2b$12$9fR22pER2TPA2zFv80WfKe9ho9W6MJ/MTzcqUjVaaZGgJR8QLuBVm'),(6,'KARINA ','JOREZ','karina23@gmail.com','$2b$12$0WY/CjJ/Jc1yA8MdqoNzSeUq0L/3OrKwh2EnFU5QoRy1Pw39ikA9a');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Viajes`
--

DROP TABLE IF EXISTS `Viajes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Viajes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `creador_id` int NOT NULL,
  `destino` varchar(255) NOT NULL,
  `descripcion` varchar(255) NOT NULL,
  `fecha_desde` date NOT NULL,
  `fecha_hasta` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Viajes`
--

LOCK TABLES `Viajes` WRITE;
/*!40000 ALTER TABLE `Viajes` DISABLE KEYS */;
INSERT INTO `Viajes` VALUES (1,2,'ESTADOS UNIDOS','Viaje a centro america con todo incluido','2023-04-14','2023-08-17'),(2,2,'Black Rock, Nevada','Viaje gratis, por evento','2023-07-08','2023-07-25'),(3,2,'EL QUISCO','Viaje a la playa con desayuno incluido','2023-07-13','2023-07-27'),(4,2,'PERU,CUSCO','Viaje de aventura hacia el amazona','2023-08-16','2023-09-27'),(5,2,'COLOMBIA, SAN ANDRES','Viaje todo incluido con unas vistas maravillosas','2023-10-04','2023-12-21'),(6,4,'ISLA DE PASCUA','Viaje a las islas de chile mas tropical que tiene','2023-08-17','2023-08-30'),(7,4,'OSORNO','Viaje al Sur de chile con desayuno incluido','2023-09-05','2023-09-20'),(8,4,'CHILLAN, TERMAS','Viaje al Sur de chile con desayuno incluido y con termas','2023-10-31','2023-11-08'),(9,4,'CURICO','Viaje al Sur de CHILE a las viñas','2023-09-12','2023-09-27'),(10,3,'BRASIL, PLAYAS','Viaje con todo incluido a las playas mas tropicales de este pais','2023-07-12','2023-07-27'),(11,3,'ECUADOR, CULTURA','Viaje con todo incluido a las lindas culturas de este pais','2023-07-19','2023-07-31'),(12,3,'ARGENTINA, VIÑAS','Viaje al pais trasandino con su hermosa cultura y gastronomia','2023-08-09','2023-09-27'),(13,2,'PUERTO MONTT','Viaje con todo incluido','2023-08-09','2023-07-19'),(14,2,'PUERTO MONTT','Viaje con todo incluido','2023-08-09','2023-07-19'),(15,2,'PUERTO MONTT 2','Viaje con todo incluido2','2023-08-09','2023-07-19'),(16,3,'PUCON','Un lugar excelente para disfrutar ','2023-07-12','2023-07-26'),(17,3,'PUCON 3','Un lugar excelente para disfrutar 3','2023-07-12','2023-07-26'),(18,5,'SANTIAGO','CENTRO DE CHILE','2023-07-07','2023-07-27'),(19,1,'CARTAJENAS','PLAYA CARIBE','2023-07-14','2023-07-28'),(20,1,'ISLA GALAPAGOS','ISLA PRECIOSA','2023-07-14','2023-07-27'),(21,1,'VENEZUELA','PLAYAS Y CARIBE ','2023-07-07','2023-07-26'),(22,1,'CUBA','Viaje paraiso con playas blancas ','2023-07-07','2023-07-27'),(23,1,'THAITI','BELLO','2023-07-06','2023-07-26'),(24,1,'THAITI','BELLO','2023-07-06','2023-07-26'),(25,1,'INDIA','LUGAR DE CULTURA BUDISTA','2023-07-07','2023-07-20'),(26,1,'Black Rock, Nevada 222','ccccx','2023-07-13','2023-07-21'),(27,1,'THAITI .-sorry por no cumplir con el 100','prueba ','2023-07-07','2023-07-26'),(28,6,'MEXICO','Lindas playas','2023-07-12','2023-07-27');
/*!40000 ALTER TABLE `Viajes` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-07-02 22:54:34
