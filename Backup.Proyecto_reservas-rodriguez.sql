-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: proyecto_reservas
-- ------------------------------------------------------
-- Server version	8.0.36

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
-- Table structure for table `actividades`
--

DROP TABLE IF EXISTS `actividades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `actividades` (
  `ID_ACTIVIDAD` int NOT NULL AUTO_INCREMENT,
  `NOMBRE` varchar(50) NOT NULL,
  `DISPONIBILIDAD` tinyint(1) NOT NULL,
  `FECHA_HORA` datetime DEFAULT NULL,
  `ID_PROFESOR` int DEFAULT NULL,
  PRIMARY KEY (`ID_ACTIVIDAD`),
  UNIQUE KEY `ID_ACTIVIDAD` (`ID_ACTIVIDAD`),
  KEY `FK_ACTIVIDAD_PROFESOR` (`ID_PROFESOR`),
  CONSTRAINT `FK_ACTIVIDAD_PROFESOR` FOREIGN KEY (`ID_PROFESOR`) REFERENCES `profesores` (`ID_PROFESOR`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actividades`
--

LOCK TABLES `actividades` WRITE;
/*!40000 ALTER TABLE `actividades` DISABLE KEYS */;
INSERT INTO `actividades` VALUES (1,'Yoga',1,'2023-01-01 10:00:00',1),(2,'Pilates',1,'2023-02-01 11:00:00',2),(3,'Zumba',1,'2023-03-01 12:00:00',3),(4,'Crossfit',1,'2023-04-01 13:00:00',4),(5,'Spinning',1,'2023-05-01 14:00:00',5),(6,'Karate',1,'2023-06-01 15:00:00',6),(7,'Boxeo',1,'2023-07-01 16:00:00',7),(8,'Natación',1,'2023-08-01 17:00:00',8),(9,'Aerobics',1,'2023-09-01 18:00:00',9),(10,'Baile',1,'2023-10-01 19:00:00',10),(11,'Tennis',1,'2023-11-01 20:00:00',11),(12,'Fútbol',1,'2023-12-01 21:00:00',12),(13,'Vóley',1,'2024-01-01 22:00:00',13),(14,'Basketball',1,'2024-02-01 23:00:00',14),(15,'Rugby',1,'2024-03-01 10:00:00',15),(16,'Hockey',1,'2024-04-01 11:00:00',16),(17,'Gimnasia',1,'2024-05-01 12:00:00',17),(18,'Ciclismo',1,'2024-06-01 13:00:00',18),(19,'Atletismo',1,'2023-01-01 14:00:00',19),(20,'Escalada',1,'2023-02-01 15:00:00',20),(21,'Judo',1,'2023-03-01 16:00:00',21),(22,'Taekwondo',1,'2023-04-01 17:00:00',22),(23,'Kickboxing',1,'2023-05-01 18:00:00',23),(24,'Capoeira',1,'2023-06-01 19:00:00',24),(25,'Patinaje',1,'2023-07-01 20:00:00',25),(26,'Escalada',1,'2023-08-01 21:00:00',26),(27,'Senderismo',1,'2023-09-01 22:00:00',27),(28,'Surf',1,'2023-10-01 23:00:00',28),(29,'Esquí',1,'2023-11-01 10:00:00',29),(30,'Snowboard',1,'2023-12-01 11:00:00',30);
/*!40000 ALTER TABLE `actividades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dueno`
--

DROP TABLE IF EXISTS `dueno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dueno` (
  `ID_DUENO` int NOT NULL AUTO_INCREMENT,
  `NOMBRE` varchar(50) DEFAULT NULL,
  `APELLIDO` varchar(50) DEFAULT NULL,
  `TELEFONO` int NOT NULL,
  PRIMARY KEY (`ID_DUENO`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dueno`
--

LOCK TABLES `dueno` WRITE;
/*!40000 ALTER TABLE `dueno` DISABLE KEYS */;
INSERT INTO `dueno` VALUES (1,'Roberto','Jiménez',45345601),(2,'Santiago','Paredes',45345602),(3,'Mónica','Castillo',45345603),(4,'Raúl','Guzmán',45345604),(5,'Sara','Soto',45345605),(6,'Tomás','Campos',45345606),(7,'Lorena','Suárez',45345607),(8,'David','Vargas',45345608),(9,'Elena','Muñoz',45345609),(10,'Clara','Ibáñez',45345610);
/*!40000 ALTER TABLE `dueno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profesores`
--

DROP TABLE IF EXISTS `profesores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profesores` (
  `ID_PROFESOR` int NOT NULL AUTO_INCREMENT,
  `NOMBRES` varchar(50) NOT NULL,
  `APELLIDO` varchar(50) NOT NULL,
  `DNI` int DEFAULT NULL,
  `TELEFONO` int DEFAULT NULL,
  `ALTA` datetime DEFAULT NULL,
  `ID_ACTIVIDAD` int DEFAULT NULL,
  `ID_SEDE` int DEFAULT NULL,
  PRIMARY KEY (`ID_PROFESOR`),
  UNIQUE KEY `ID_PROFESOR` (`ID_PROFESOR`),
  UNIQUE KEY `DNI` (`DNI`),
  KEY `FK_PROFESOR_ACTIVIDAD` (`ID_ACTIVIDAD`),
  KEY `FK_PROFESOR_SEDE` (`ID_SEDE`),
  CONSTRAINT `FK_PROFESOR_ACTIVIDAD` FOREIGN KEY (`ID_ACTIVIDAD`) REFERENCES `actividades` (`ID_ACTIVIDAD`),
  CONSTRAINT `FK_PROFESOR_SEDE` FOREIGN KEY (`ID_SEDE`) REFERENCES `sede` (`ID_SEDE`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profesores`
--

LOCK TABLES `profesores` WRITE;
/*!40000 ALTER TABLE `profesores` DISABLE KEYS */;
INSERT INTO `profesores` VALUES (1,'Laura','García',22345601,32345601,'2023-01-01 10:00:00',1,1),(2,'Pedro','Martínez',22345602,32345602,'2023-02-01 11:00:00',2,2),(3,'Juan','Pérez',22345603,32345603,'2023-03-01 12:00:00',3,3),(4,'Ana','López',22345604,32345604,'2023-04-01 13:00:00',4,4),(5,'Luis','Gómez',22345605,32345605,'2023-05-01 14:00:00',5,5),(6,'Carlos','Rodríguez',22345606,32345606,'2023-06-01 15:00:00',6,6),(7,'Laura','Fernández',22345607,32345607,'2023-07-01 16:00:00',7,7),(8,'Jorge','Sánchez',22345608,32345608,'2023-08-01 17:00:00',8,8),(9,'Sofía','Ramírez',22345609,32345609,'2023-09-01 18:00:00',9,9),(10,'Marta','Díaz',22345610,32345610,'2023-10-01 19:00:00',10,10),(11,'Hugo','Cruz',22345611,32345611,'2023-11-01 20:00:00',11,1),(12,'Lucas','Morales',22345612,32345612,'2023-12-01 21:00:00',12,2),(13,'Daniela','Herrera',22345613,32345613,'2024-01-01 22:00:00',13,3),(14,'Emilia','Reyes',22345614,32345614,'2024-02-01 23:00:00',14,4),(15,'Iván','Ruiz',22345615,32345615,'2024-03-01 10:00:00',15,5),(16,'Nicolás','Ortega',22345616,32345616,'2024-04-01 11:00:00',16,6),(17,'Camila','Silva',22345617,32345617,'2024-05-01 12:00:00',17,7),(18,'Gabriela','Ramos',22345618,32345618,'2024-06-01 13:00:00',18,8),(19,'Valeria','Moreno',22345619,32345619,'2023-01-01 14:00:00',19,9),(20,'Martín','Rojas',22345620,32345620,'2023-02-01 15:00:00',20,10),(21,'Fernando','Peña',22345621,32345621,'2023-03-01 16:00:00',21,1),(22,'Paula','Navarro',22345622,32345622,'2023-04-01 17:00:00',22,2),(23,'Andrea','Rivera',22345623,32345623,'2023-05-01 18:00:00',23,3),(24,'Manuel','Román',22345624,32345624,'2023-06-01 19:00:00',24,4),(25,'Inés','Flores',22345625,32345625,'2023-07-01 20:00:00',25,5),(26,'Julieta','Aguilar',22345626,32345626,'2023-08-01 21:00:00',26,6),(27,'Santiago','Molina',22345627,32345627,'2023-09-01 22:00:00',27,7),(28,'Victoria','Ortiz',22345628,32345628,'2023-10-01 23:00:00',28,8),(29,'Esteban','Blanco',22345629,32345629,'2023-11-01 10:00:00',29,9),(30,'Isabel','Castro',22345630,32345630,'2023-12-01 11:00:00',30,10);
/*!40000 ALTER TABLE `profesores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `profesores_sede`
--

DROP TABLE IF EXISTS `profesores_sede`;
/*!50001 DROP VIEW IF EXISTS `profesores_sede`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `profesores_sede` AS SELECT 
 1 AS `ID_SEDE`,
 1 AS `PROFESOR`,
 1 AS `ACTIVIDAD`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `reservas`
--

DROP TABLE IF EXISTS `reservas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservas` (
  `ID_RESERVA` int NOT NULL AUTO_INCREMENT,
  `FECHA_HORA` datetime DEFAULT NULL,
  `CANCELACION` datetime DEFAULT NULL,
  `ID_SOCIO` int DEFAULT NULL,
  `ID_ACTIVIDAD` int DEFAULT NULL,
  `ID_PROFESOR` int DEFAULT NULL,
  `ID_SEDE` int DEFAULT NULL,
  PRIMARY KEY (`ID_RESERVA`),
  KEY `FK_RESERVAS_SOCIO` (`ID_SOCIO`),
  KEY `FK_RESERVAS_ACTIVIDAD` (`ID_ACTIVIDAD`),
  KEY `FK_RESERVAS_PROFESOR` (`ID_PROFESOR`),
  KEY `FK_RESERVAS_SEDE` (`ID_SEDE`),
  CONSTRAINT `FK_RESERVAS_ACTIVIDAD` FOREIGN KEY (`ID_ACTIVIDAD`) REFERENCES `actividades` (`ID_ACTIVIDAD`),
  CONSTRAINT `FK_RESERVAS_PROFESOR` FOREIGN KEY (`ID_PROFESOR`) REFERENCES `profesores` (`ID_PROFESOR`),
  CONSTRAINT `FK_RESERVAS_SEDE` FOREIGN KEY (`ID_SEDE`) REFERENCES `sede` (`ID_SEDE`),
  CONSTRAINT `FK_RESERVAS_SOCIO` FOREIGN KEY (`ID_SOCIO`) REFERENCES `socios` (`ID_SOCIO`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservas`
--

LOCK TABLES `reservas` WRITE;
/*!40000 ALTER TABLE `reservas` DISABLE KEYS */;
INSERT INTO `reservas` VALUES (1,'2023-01-01 10:00:00',NULL,1,1,1,1),(2,'2023-02-01 11:00:00',NULL,2,2,2,2),(3,'2023-03-01 12:00:00',NULL,3,3,3,3),(4,'2023-04-01 13:00:00',NULL,4,4,4,4),(5,'2023-05-01 14:00:00',NULL,5,5,5,5),(6,'2023-06-01 15:00:00',NULL,6,6,6,6),(7,'2023-07-01 16:00:00',NULL,7,7,7,7),(8,'2023-08-01 17:00:00',NULL,8,8,8,8),(9,'2023-09-01 18:00:00',NULL,9,9,9,9),(10,'2023-10-01 19:00:00',NULL,10,10,10,10),(11,'2023-11-01 20:00:00',NULL,11,11,11,1),(12,'2023-12-01 21:00:00',NULL,12,12,12,2),(13,'2024-01-01 22:00:00',NULL,13,13,13,3),(14,'2024-02-01 23:00:00',NULL,14,14,14,4),(15,'2024-03-01 10:00:00',NULL,15,15,15,5),(16,'2024-04-01 11:00:00',NULL,16,16,16,6),(17,'2024-05-01 12:00:00',NULL,17,17,17,7),(18,'2024-06-01 13:00:00',NULL,18,18,18,8),(19,'2023-01-01 14:00:00',NULL,19,19,19,9),(20,'2023-02-01 15:00:00',NULL,20,20,20,10),(21,'2023-03-01 16:00:00',NULL,21,21,21,1),(22,'2023-04-01 17:00:00',NULL,22,22,22,2),(23,'2023-05-01 18:00:00',NULL,23,23,23,3),(24,'2023-06-01 19:00:00',NULL,24,24,24,4),(25,'2023-07-01 20:00:00',NULL,25,25,25,5),(26,'2023-08-01 21:00:00',NULL,26,26,26,6),(27,'2023-09-01 22:00:00',NULL,27,27,27,7),(28,'2023-10-01 23:00:00',NULL,28,28,28,8),(29,'2023-11-01 10:00:00',NULL,29,29,29,9),(30,'2023-12-01 11:00:00',NULL,30,30,30,10);
/*!40000 ALTER TABLE `reservas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `reservas_pilates`
--

DROP TABLE IF EXISTS `reservas_pilates`;
/*!50001 DROP VIEW IF EXISTS `reservas_pilates`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `reservas_pilates` AS SELECT 
 1 AS `ID_ACTIVIDAD`,
 1 AS `ACTIVIDAD`,
 1 AS `DISPONIBILIDAD`,
 1 AS `DIRECCION`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `sede`
--

DROP TABLE IF EXISTS `sede`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sede` (
  `ID_SEDE` int NOT NULL AUTO_INCREMENT,
  `DIRECCION` varchar(100) DEFAULT NULL,
  `TELEFONO` int DEFAULT NULL,
  `ID_DUENO` int DEFAULT NULL,
  PRIMARY KEY (`ID_SEDE`),
  KEY `FK_SEDE_DUENO` (`ID_DUENO`),
  CONSTRAINT `FK_SEDE_DUENO` FOREIGN KEY (`ID_DUENO`) REFERENCES `dueno` (`ID_DUENO`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sede`
--

LOCK TABLES `sede` WRITE;
/*!40000 ALTER TABLE `sede` DISABLE KEYS */;
INSERT INTO `sede` VALUES (1,'Av. Siempre Viva 123',36345601,1),(2,'Calle Falsa 456',36345602,2),(3,'Pasaje Verdadero 789',36345603,3),(4,'Boulevard Principal 101',36345604,4),(5,'Camino Real 102',36345605,5),(6,'Ruta 103',36345606,6),(7,'Avenida Central 104',36345607,7),(8,'Callejón 105',36345608,8),(9,'Plaza Mayor 106',36345609,9),(10,'Parque 107',36345610,10);
/*!40000 ALTER TABLE `sede` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `socios`
--

DROP TABLE IF EXISTS `socios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `socios` (
  `ID_SOCIO` int NOT NULL AUTO_INCREMENT,
  `NOMBRE` varchar(50) NOT NULL,
  `APELLIDO` varchar(50) NOT NULL,
  `DNI` int NOT NULL,
  `TELEFONO` int NOT NULL,
  `MAIL` varchar(60) NOT NULL,
  `FECHA_ALTA` datetime DEFAULT NULL,
  PRIMARY KEY (`ID_SOCIO`),
  UNIQUE KEY `DNI` (`DNI`),
  UNIQUE KEY `MAIL` (`MAIL`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socios`
--

LOCK TABLES `socios` WRITE;
/*!40000 ALTER TABLE `socios` DISABLE KEYS */;
INSERT INTO `socios` VALUES (1,'Pedro','Ramírez',12345601,23456701,'pedro1@example.com','2023-01-01 10:00:00'),(2,'Juan','González',12345602,23456702,'juan2@example.com','2023-02-01 11:00:00'),(3,'María','López',12345603,23456703,'maria3@example.com','2023-03-01 12:00:00'),(4,'Ana','Martínez',12345604,23456704,'ana4@example.com','2023-04-01 13:00:00'),(5,'Luis','Hernández',12345605,23456705,'luis5@example.com','2023-05-01 14:00:00'),(6,'Carlos','Gómez',12345606,23456706,'carlos6@example.com','2023-06-01 15:00:00'),(7,'Laura','Díaz',12345607,23456707,'laura7@example.com','2023-07-01 16:00:00'),(8,'Jorge','Pérez',12345608,23456708,'jorge8@example.com','2023-08-01 17:00:00'),(9,'Sofía','Sánchez',12345609,23456709,'sofia9@example.com','2023-09-01 18:00:00'),(10,'Marta','Romero',12345610,23456710,'marta10@example.com','2023-10-01 19:00:00'),(11,'Hugo','Torres',12345611,23456711,'hugo11@example.com','2023-11-01 20:00:00'),(12,'Lucas','Mendoza',12345612,23456712,'lucas12@example.com','2023-12-01 21:00:00'),(13,'Daniela','Cruz',12345613,23456713,'daniela13@example.com','2024-01-01 22:00:00'),(14,'Emilia','Reyes',12345614,23456714,'emilia14@example.com','2024-02-01 23:00:00'),(15,'Iván','Ruiz',12345615,23456715,'ivan15@example.com','2024-03-01 10:00:00'),(16,'Nicolás','Ortega',12345616,23456716,'nicolas16@example.com','2024-04-01 11:00:00'),(17,'Camila','Silva',12345617,23456717,'camila17@example.com','2024-05-01 12:00:00'),(18,'Gabriela','Ramos',12345618,23456718,'gabriela18@example.com','2024-06-01 13:00:00'),(19,'Valeria','Moreno',12345619,23456719,'valeria19@example.com','2023-01-01 14:00:00'),(20,'Martín','Rojas',12345620,23456720,'martin20@example.com','2023-02-01 15:00:00'),(21,'Fernando','Peña',12345621,23456721,'fernando21@example.com','2023-03-01 16:00:00'),(22,'Paula','Navarro',12345622,23456722,'paula22@example.com','2023-04-01 17:00:00'),(23,'Andrea','Rivera',12345623,23456723,'andrea23@example.com','2023-05-01 18:00:00'),(24,'Manuel','Román',12345624,23456724,'manuel24@example.com','2023-06-01 19:00:00'),(25,'Inés','Flores',12345625,23456725,'ines25@example.com','2023-07-01 20:00:00'),(26,'Julieta','Aguilar',12345626,23456726,'julieta26@example.com','2023-08-01 21:00:00'),(27,'Santiago','Molina',12345627,23456727,'santiago27@example.com','2023-09-01 22:00:00'),(28,'Victoria','Ortiz',12345628,23456728,'victoria28@example.com','2023-10-01 23:00:00'),(29,'Esteban','Blanco',12345629,23456729,'esteban29@example.com','2023-11-01 10:00:00'),(30,'Isabel','Castro',12345630,23456730,'isabel30@example.com','2023-12-01 11:00:00'),(31,'Juliana','Dominguez',45000995,1255897774,'julia.martinez8@example.com','2024-09-15 10:00:00');
/*!40000 ALTER TABLE `socios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vista_actividades`
--

DROP TABLE IF EXISTS `vista_actividades`;
/*!50001 DROP VIEW IF EXISTS `vista_actividades`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_actividades` AS SELECT 
 1 AS `ID_ACTIVIDAD`,
 1 AS `NOMBRE`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_reservas_futbol`
--

DROP TABLE IF EXISTS `vista_reservas_futbol`;
/*!50001 DROP VIEW IF EXISTS `vista_reservas_futbol`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_reservas_futbol` AS SELECT 
 1 AS `ID_RESERVA`,
 1 AS `ID_ACTIVIDAD`,
 1 AS `ID_SEDE`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_socios_filtro`
--

DROP TABLE IF EXISTS `vista_socios_filtro`;
/*!50001 DROP VIEW IF EXISTS `vista_socios_filtro`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_socios_filtro` AS SELECT 
 1 AS `ID_SOCIO`,
 1 AS `NOMBRE`,
 1 AS `APELLIDO`,
 1 AS `FECHA_ALTA`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_spinning`
--

DROP TABLE IF EXISTS `vista_spinning`;
/*!50001 DROP VIEW IF EXISTS `vista_spinning`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_spinning` AS SELECT 
 1 AS `ID_ACTIVIDAD`,
 1 AS `ACTIVIDAD`,
 1 AS `PROFESOR`,
 1 AS `DIRECCION_DE_SEDE`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `profesores_sede`
--

/*!50001 DROP VIEW IF EXISTS `profesores_sede`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `profesores_sede` AS select `sede`.`ID_SEDE` AS `ID_SEDE`,`profesores`.`APELLIDO` AS `PROFESOR`,`actividades`.`NOMBRE` AS `ACTIVIDAD` from ((`profesores` join `sede` on((`sede`.`ID_SEDE` = `profesores`.`ID_SEDE`))) join `actividades` on((`profesores`.`ID_PROFESOR` = `actividades`.`ID_PROFESOR`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `reservas_pilates`
--

/*!50001 DROP VIEW IF EXISTS `reservas_pilates`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `reservas_pilates` AS select `reservas`.`ID_ACTIVIDAD` AS `ID_ACTIVIDAD`,`actividades`.`NOMBRE` AS `ACTIVIDAD`,`reservas`.`FECHA_HORA` AS `DISPONIBILIDAD`,`sede`.`DIRECCION` AS `DIRECCION` from ((`actividades` join `reservas` on((`reservas`.`ID_ACTIVIDAD` = `actividades`.`ID_ACTIVIDAD`))) join `sede` on((`sede`.`ID_SEDE` = `reservas`.`ID_SEDE`))) where (`reservas`.`ID_ACTIVIDAD` = 2) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_actividades`
--

/*!50001 DROP VIEW IF EXISTS `vista_actividades`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_actividades` AS select `actividades`.`ID_ACTIVIDAD` AS `ID_ACTIVIDAD`,`actividades`.`NOMBRE` AS `NOMBRE` from `actividades` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_reservas_futbol`
--

/*!50001 DROP VIEW IF EXISTS `vista_reservas_futbol`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_reservas_futbol` AS select `reservas`.`ID_RESERVA` AS `ID_RESERVA`,`reservas`.`ID_ACTIVIDAD` AS `ID_ACTIVIDAD`,`reservas`.`ID_SEDE` AS `ID_SEDE` from `reservas` where (`reservas`.`ID_ACTIVIDAD` = 12) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_socios_filtro`
--

/*!50001 DROP VIEW IF EXISTS `vista_socios_filtro`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_socios_filtro` AS select `socios`.`ID_SOCIO` AS `ID_SOCIO`,`socios`.`NOMBRE` AS `NOMBRE`,`socios`.`APELLIDO` AS `APELLIDO`,`socios`.`FECHA_ALTA` AS `FECHA_ALTA` from `socios` where (`socios`.`FECHA_ALTA` between '2024-01-01 00:00:00' and '2024-06-30 23:59:59') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_spinning`
--

/*!50001 DROP VIEW IF EXISTS `vista_spinning`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_spinning` AS select `a`.`ID_ACTIVIDAD` AS `ID_ACTIVIDAD`,`a`.`NOMBRE` AS `ACTIVIDAD`,`p`.`APELLIDO` AS `PROFESOR`,`s`.`DIRECCION` AS `DIRECCION_DE_SEDE` from ((`actividades` `a` join `profesores` `p` on((`a`.`ID_ACTIVIDAD` = `p`.`ID_ACTIVIDAD`))) join `sede` `s` on((`p`.`ID_SEDE` = `s`.`ID_SEDE`))) where (`a`.`NOMBRE` = 'SPINNING') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-30 21:14:49
