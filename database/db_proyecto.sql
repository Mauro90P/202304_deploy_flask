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
-- Table structure for table `PasajerosViaje`
--

DROP TABLE IF EXISTS `PasajerosViaje`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PasajerosViaje` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `usuario_id` int unsigned NOT NULL,
  `viaje_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Usuarios_has_Viajes_Viajes1_idx` (`viaje_id`),
  KEY `fk_Usuarios_has_Viajes_Usuarios_idx` (`usuario_id`),
  CONSTRAINT `fk_Usuarios_has_Viajes_Usuarios` FOREIGN KEY (`usuario_id`) REFERENCES `Usuarios` (`id`),
  CONSTRAINT `fk_Usuarios_has_Viajes_Viajes1` FOREIGN KEY (`viaje_id`) REFERENCES `Viajes` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PasajerosViaje`
--

LOCK TABLES `PasajerosViaje` WRITE;
/*!40000 ALTER TABLE `PasajerosViaje` DISABLE KEYS */;
/*!40000 ALTER TABLE `PasajerosViaje` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Usuarios`
--

DROP TABLE IF EXISTS `Usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Usuarios` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `apellido` varchar(250) NOT NULL,
  `email` varchar(250) NOT NULL,
  `password` varchar(250) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Usuarios`
--

LOCK TABLES `Usuarios` WRITE;
/*!40000 ALTER TABLE `Usuarios` DISABLE KEYS */;
INSERT INTO `Usuarios` VALUES (1,'Mauricio Pardo','RODRIGUEZ GALVEZ','mauriciopardo.figueroa@gmail.com','$2b$12$uJRS3mI6/ulR5EDg2VnUTuGcpvoawe4k7kFwzoypr8ZM4NLlSLlMK'),(2,'Carlos ','Cuevas ','cuevas@gmail.com','$2b$12$qK2dhD1XhX4W9ZEHc3EzleAz3J8hGXni/Ih7D.3j383wVpy5M9VzO'),(3,'Karina ','Fernandez','karina23@gmail.com','$2b$12$KR/LJsbcVP4L2530Z/da9uoUbN9lqqsa8I7Lx6h42PoWQg/FF5Sy6'),(4,'Marcos','Mendez','marcosmendez@gmail.com','$2b$12$FvCn.PavxBggHgw/cVso7.14O9tdaqq1mtj5jr/VI.kgZe8TybMxK'),(5,'MANUEL','SOTO','soto@gmail.com','$2b$12$i5vg2LlqdwqVXcG1BUiMA.wCh2FML1m5jR7L.VJQdOmyKuh/DBlr.');
/*!40000 ALTER TABLE `Usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Viajes`
--

DROP TABLE IF EXISTS `Viajes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Viajes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `creador_id` int NOT NULL,
  `destino` varchar(255) NOT NULL,
  `descripcion` varchar(255) NOT NULL,
  `fecha_desde` date NOT NULL,
  `fecha_hasta` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Viajes`
--

LOCK TABLES `Viajes` WRITE;
/*!40000 ALTER TABLE `Viajes` DISABLE KEYS */;
INSERT INTO `Viajes` VALUES (1,1,'Black Rock, Nevada','LUGAR DE NIEVE ','2023-07-14','2023-07-22'),(2,1,'TEMUCO','LUGAR DE HERMOSO','2023-07-14','2023-07-26'),(3,1,'VALDIVIA','LINDO LUGAR DE PASEO','2023-07-05','2023-07-20'),(4,1,'VALDIVIA','LINDO LUGAR DE PASEO','2023-07-05','2023-07-20'),(5,1,'VALDIVIA','LINDO LUGAR DE PASEO','2023-07-05','2023-07-20'),(6,1,'PICHILEMU','Playas','2023-07-15','2023-07-20'),(7,1,'OSORNO','Playas','2023-07-15','2023-07-20'),(8,1,'THAITI','LUGAR PARADISICO','2023-07-20','2023-07-31'),(9,1,'THAITI','LUGAR DE EN SUEÑO','2023-07-20','2023-07-31'),(10,1,'THAITI33','VOLCAN','2023-07-20','2023-07-31'),(15,2,'Carlos RESORT 1','Lugar de paisajes y playas hermosas ','2023-09-06','2023-11-21'),(16,2,'Carlos PUCON','Lugar de paisajes y playas hermosas ','2023-09-06','2023-11-21'),(17,2,'Carlos Bariloche ','Lugar de paisajes y playas hermosas ','2023-09-06','2023-11-21'),(18,2,'Carlos Bariloche ','Lugar de paisajes y playas hermosas ','2023-09-06','2023-11-21'),(20,4,'SAN ANDRES ','PLAYAS','2023-07-07','2023-07-18'),(21,4,'SAN ANDRES 222','PLAYAS','2023-07-07','2023-07-18'),(22,4,'SAN ANDRES 222','PLAYAS','2023-07-07','2023-07-18'),(24,4,'juan fernandez','marcos','2023-07-06','2023-07-26'),(25,4,'MEXICO','MEXICO1','2023-07-19','2023-07-25'),(26,4,'cuba','dd','2023-07-07','2023-07-20'),(27,4,'ECUADOR','DDFDD','2023-07-07','2023-07-25'),(28,3,'Black Rock, Nevada','fdfdfd','2023-07-21','2023-07-19');
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

-- Dump completed on 2023-07-08 17:26:46
