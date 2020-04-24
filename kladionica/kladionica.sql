-- MySQL dump 10.13  Distrib 8.0.17, for Win64 (x86_64)
--
-- Host: localhost    Database: kladionica
-- ------------------------------------------------------
-- Server version	8.0.17

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `liga`
--

DROP TABLE IF EXISTS `liga`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `liga` (
  `id` int(11) NOT NULL,
  `ime` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `liga`
--

LOCK TABLES `liga` WRITE;
/*!40000 ALTER TABLE `liga` DISABLE KEYS */;
INSERT INTO `liga` VALUES (1,'Serie A'),(2,'Primera Division');
/*!40000 ALTER TABLE `liga` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `match_`
--

DROP TABLE IF EXISTS `match_`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `match_` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `team1` int(11) DEFAULT NULL,
  `team2` int(11) DEFAULT NULL,
  `odds` int(11) DEFAULT NULL,
  `kickoff_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_match_team1_idx` (`team1`),
  KEY `fk_match_team2_idx` (`team2`),
  KEY `fk_match_odds_idx` (`odds`),
  CONSTRAINT `fk_match_odds` FOREIGN KEY (`odds`) REFERENCES `odds` (`id`),
  CONSTRAINT `fk_match_team1` FOREIGN KEY (`team1`) REFERENCES `team` (`id`),
  CONSTRAINT `fk_match_team2` FOREIGN KEY (`team2`) REFERENCES `team` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `match_`
--

LOCK TABLES `match_` WRITE;
/*!40000 ALTER TABLE `match_` DISABLE KEYS */;
INSERT INTO `match_` VALUES (1,4,5,1,'2020-03-14 14:30:00'),(2,6,7,2,'2020-03-14 14:30:00'),(3,8,9,3,'2020-03-14 19:00:00'),(4,11,12,4,'2020-03-15 19:30:00'),(5,13,14,5,'2020-03-15 15:30:00'),(6,15,16,6,'2020-03-15 16:00:00');
/*!40000 ALTER TABLE `match_` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `mecevi`
--

DROP TABLE IF EXISTS `mecevi`;
/*!50001 DROP VIEW IF EXISTS `mecevi`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `mecevi` AS SELECT 
 1 AS `id`,
 1 AS `team1`,
 1 AS `team2`,
 1 AS `ime`,
 1 AS `kickoff_time`,
 1 AS `home`,
 1 AS `draw`,
 1 AS `away`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `odds`
--

DROP TABLE IF EXISTS `odds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `odds` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `home` int(11) DEFAULT NULL,
  `draw` int(11) DEFAULT NULL,
  `away` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `odds`
--

LOCK TABLES `odds` WRITE;
/*!40000 ALTER TABLE `odds` DISABLE KEYS */;
INSERT INTO `odds` VALUES (1,265,285,265),(2,235,320,285),(3,130,330,545),(4,225,285,255),(5,185,310,330),(6,145,310,355);
/*!40000 ALTER TABLE `odds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `team`
--

DROP TABLE IF EXISTS `team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `team` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ime` varchar(100) DEFAULT NULL,
  `liga` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_team_liga_idx` (`liga`),
  CONSTRAINT `fk_team_liga` FOREIGN KEY (`liga`) REFERENCES `liga` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team`
--

LOCK TABLES `team` WRITE;
/*!40000 ALTER TABLE `team` DISABLE KEYS */;
INSERT INTO `team` VALUES (4,'Juventus',1),(5,'AC Milan',1),(6,'Parma',1),(7,'Roma',1),(8,'Inter Milano',1),(9,'Samprodia',1),(11,'Real Madrid',2),(12,'Barcelona',2),(13,'Valencia',2),(14,'Sevilla',2),(15,'Atletico Madrid',2),(16,'Atletik de Bilbao',2);
/*!40000 ALTER TABLE `team` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket`
--

DROP TABLE IF EXISTS `ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ticket` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sum` int(11) DEFAULT NULL,
  `total_quota` decimal(9,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket`
--

LOCK TABLES `ticket` WRITE;
/*!40000 ALTER TABLE `ticket` DISABLE KEYS */;
INSERT INTO `ticket` VALUES (1,300,NULL),(2,500,NULL);
/*!40000 ALTER TABLE `ticket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket_match`
--

DROP TABLE IF EXISTS `ticket_match`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ticket_match` (
  `ticket_match_id` int(11) NOT NULL,
  `ticket_id` int(11) DEFAULT NULL,
  `match_id` int(11) DEFAULT NULL,
  `tip` int(11) DEFAULT NULL,
  PRIMARY KEY (`ticket_match_id`),
  KEY `fk_ticket_id_idx` (`ticket_id`),
  CONSTRAINT `fk_ticket_id` FOREIGN KEY (`ticket_id`) REFERENCES `ticket` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket_match`
--

LOCK TABLES `ticket_match` WRITE;
/*!40000 ALTER TABLE `ticket_match` DISABLE KEYS */;
INSERT INTO `ticket_match` VALUES (1,1,6,2),(2,1,7,0),(3,2,8,1),(4,2,9,1),(5,2,10,0);
/*!40000 ALTER TABLE `ticket_match` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `mecevi`
--

/*!50001 DROP VIEW IF EXISTS `mecevi`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `mecevi` AS select `match_`.`id` AS `id`,`match_`.`team1` AS `team1`,`match_`.`team2` AS `team2`,`team`.`ime` AS `ime`,`match_`.`kickoff_time` AS `kickoff_time`,`odds`.`home` AS `home`,`odds`.`draw` AS `draw`,`odds`.`away` AS `away` from ((`match_` join `team` on((`team`.`id` = `match_`.`team2`))) join `odds` on((`odds`.`id` = `match_`.`odds`))) */;
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

-- Dump completed on 2020-03-08 17:27:34
