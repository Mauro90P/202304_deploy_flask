CREATE DATABASE  IF NOT EXISTS `db_tareas` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `db_tareas`;
-- MySQL dump 10.13  Distrib 8.0.31, for macos12 (x86_64)
--
-- Host: 127.0.0.1    Database: db_tareas
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
-- Table structure for table `tareas`
--

DROP TABLE IF EXISTS `tareas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tareas` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `nombre_tarea` varchar(255) NOT NULL,
  `descripcion` varchar(255) NOT NULL,
  `tiempo_inicio` time DEFAULT NULL,
  `usuarios_id` int unsigned NOT NULL,
  `timepo_total` varchar(45) DEFAULT NULL,
  `tiempo_terminado` varchar(45) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_tareas_usuarios_idx` (`usuarios_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tareas`
--

LOCK TABLES `tareas` WRITE;
/*!40000 ALTER TABLE `tareas` DISABLE KEYS */;
INSERT INTO `tareas` VALUES (4,'Historia','Estudiar sobre la 2 guerra Mundial',NULL,1,NULL,NULL,'2023-07-15 23:51:24','2023-07-15 23:51:24'),(6,'Musica ','Estudiar sobre las nota musicales y su variantes.',NULL,1,NULL,NULL,'2023-07-15 23:52:31','2023-07-15 23:52:31'),(9,'PYTHON','ESTUDIAR LAS FUNCIONES Y HERENCIA','22:04:36',1,'2 horas','3 horas','2023-07-16 02:04:36','2023-07-16 02:04:36'),(10,'JAVA','ESTUDIAR LAS FUNCIONES Y HERENCIA','22:05:04',1,'2 horas','3 horas','2023-07-16 02:05:04','2023-07-16 02:05:04'),(11,'RUBI','ESTUDIAR LAS FUNCIONES Y HERENCIA','22:05:14',1,'2 horas','3 horas','2023-07-16 02:05:14','2023-07-16 02:05:14'),(12,'C#','ESTUDIAR LAS FUNCIONES Y HERENCIA','22:05:28',1,'2 horas','3 horas','2023-07-16 02:05:28','2023-07-16 02:05:28'),(24,'ingles','Estudiar los verbos ',NULL,6,NULL,NULL,'2023-07-17 23:47:34','2023-07-17 23:47:34');
/*!40000 ALTER TABLE `tareas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `apellido` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'MARGARITA','LOPEZ','margaritalopez@gmail.com','$2b$12$EfdbXNwaoUdNaMhG8DK4n.iCk6M1q4deKVwAENmxFjQ.1h/CGloJG'),(4,'Hector','Roler','hector23@gmaail.com','$2b$12$C6KIBQdUCXxJ.XIa6Q/yFuROdJufhJOWr6VVF2F04Dszc9qad4HP.'),(5,'Mnauel','Soto','manuelsoto@gmail.com','$2b$12$rLE6M.tAkK/Kl8RgMyvMJ.xBkwwZT7HCKR0SIKnnHUT2aLweibB8C'),(6,'ENRIQUE ','SOTO','cuevas@gmail.com','$2b$12$gelov1PBohxJ7DAMhGDtR.FibXxlyxuQlebc9lnRo1RGQ8/1IFeMy');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-07-18 17:44:13
