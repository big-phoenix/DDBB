-- MySQL dump 10.13  Distrib 8.0.23, for Win64 (x86_64)
--
-- Host: localhost    Database: youtube
-- ------------------------------------------------------
-- Server version	8.0.23

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
-- Table structure for table `canal`
--

DROP TABLE IF EXISTS `canal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `canal` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `descripcion` text NOT NULL,
  `fecha` date NOT NULL,
  `usuario_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `canal_usuario_idx` (`usuario_id`),
  CONSTRAINT `canal_usuario` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `canal`
--

LOCK TABLES `canal` WRITE;
/*!40000 ALTER TABLE `canal` DISABLE KEYS */;
INSERT INTO `canal` VALUES (1,'moteros','video de motos','2021-03-12',2);
/*!40000 ALTER TABLE `canal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comentarios`
--

DROP TABLE IF EXISTS `comentarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comentarios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `texto` text NOT NULL,
  `fecha` datetime NOT NULL,
  `usuario_id` int NOT NULL,
  `video_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `comentarios_usuario_idx` (`usuario_id`),
  KEY `comentarios_video_idx` (`video_id`),
  CONSTRAINT `comentarios_usuario` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `comentarios_video` FOREIGN KEY (`video_id`) REFERENCES `video` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comentarios`
--

LOCK TABLES `comentarios` WRITE;
/*!40000 ALTER TABLE `comentarios` DISABLE KEYS */;
INSERT INTO `comentarios` VALUES (1,'me gusta las motos','2021-03-28 00:00:00',1,2),(2,'que bonitas las motos','2021-03-29 00:00:00',1,2);
/*!40000 ALTER TABLE `comentarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comentarios_like_dislike`
--

DROP TABLE IF EXISTS `comentarios_like_dislike`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comentarios_like_dislike` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fecha` datetime NOT NULL,
  `clasificacion` varchar(45) NOT NULL,
  `usuario_id` int NOT NULL,
  `comentario_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `comentarios_like_dislike__usuario_idx` (`usuario_id`),
  KEY `comentarios_like_dislike__comentario_idx` (`comentario_id`),
  CONSTRAINT `comentarios_like_dislike__comentario` FOREIGN KEY (`comentario_id`) REFERENCES `comentarios` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `comentarios_like_dislike__usuario` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comentarios_like_dislike`
--

LOCK TABLES `comentarios_like_dislike` WRITE;
/*!40000 ALTER TABLE `comentarios_like_dislike` DISABLE KEYS */;
/*!40000 ALTER TABLE `comentarios_like_dislike` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `etiquetas`
--

DROP TABLE IF EXISTS `etiquetas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `etiquetas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `etiquetas`
--

LOCK TABLES `etiquetas` WRITE;
/*!40000 ALTER TABLE `etiquetas` DISABLE KEYS */;
INSERT INTO `etiquetas` VALUES (1,'deportes'),(2,'ciclismo'),(3,'ciencia'),(4,'motos'),(5,'coches');
/*!40000 ALTER TABLE `etiquetas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `etiquetas_videos`
--

DROP TABLE IF EXISTS `etiquetas_videos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `etiquetas_videos` (
  `etiquetas_id` int NOT NULL,
  `video_id` int NOT NULL,
  PRIMARY KEY (`etiquetas_id`,`video_id`),
  KEY `etiquetas_videos_idx` (`video_id`),
  CONSTRAINT `etiquetasvideos_etiquetas` FOREIGN KEY (`etiquetas_id`) REFERENCES `etiquetas` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `etiquetasvideos_video` FOREIGN KEY (`video_id`) REFERENCES `video` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `etiquetas_videos`
--

LOCK TABLES `etiquetas_videos` WRITE;
/*!40000 ALTER TABLE `etiquetas_videos` DISABLE KEYS */;
INSERT INTO `etiquetas_videos` VALUES (1,2);
/*!40000 ALTER TABLE `etiquetas_videos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `like_dislikes`
--

DROP TABLE IF EXISTS `like_dislikes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `like_dislikes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `clasificacion` varchar(20) NOT NULL,
  `fecha` datetime NOT NULL,
  `usuario_id` int NOT NULL,
  `video_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `Like_Dislikes_usuario_idx` (`usuario_id`),
  KEY `Like_Dislikes_video_idx` (`video_id`),
  CONSTRAINT `Like_Dislikes_usuario` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `Like_Dislikes_video` FOREIGN KEY (`video_id`) REFERENCES `video` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `like_dislikes`
--

LOCK TABLES `like_dislikes` WRITE;
/*!40000 ALTER TABLE `like_dislikes` DISABLE KEYS */;
INSERT INTO `like_dislikes` VALUES (1,'','2021-03-05 20:02:02',1,1),(2,'','2021-03-14 08:02:02',2,1),(3,'','2021-03-10 12:02:02',1,2);
/*!40000 ALTER TABLE `like_dislikes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `playlist`
--

DROP TABLE IF EXISTS `playlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `playlist` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `fecha` date NOT NULL,
  `estado` varchar(45) NOT NULL,
  `usuario_id` int NOT NULL,
  `video_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `playlist_usuario_idx` (`usuario_id`),
  KEY `playlist_video_idx` (`video_id`),
  CONSTRAINT `playlist_usuario` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `playlist_video` FOREIGN KEY (`video_id`) REFERENCES `video` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `playlist`
--

LOCK TABLES `playlist` WRITE;
/*!40000 ALTER TABLE `playlist` DISABLE KEYS */;
INSERT INTO `playlist` VALUES (1,'american bike','2021-04-12','publico',1,1);
/*!40000 ALTER TABLE `playlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subcritor`
--

DROP TABLE IF EXISTS `subcritor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subcritor` (
  `id` int NOT NULL AUTO_INCREMENT,
  `usuario_id` int NOT NULL,
  `canal_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `subcritor_usuario_idx` (`usuario_id`),
  KEY `subcritor_canal_idx` (`canal_id`),
  CONSTRAINT `subcritor_canal` FOREIGN KEY (`canal_id`) REFERENCES `canal` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `subcritor_usuario` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subcritor`
--

LOCK TABLES `subcritor` WRITE;
/*!40000 ALTER TABLE `subcritor` DISABLE KEYS */;
INSERT INTO `subcritor` VALUES (2,1,1);
/*!40000 ALTER TABLE `subcritor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `password` varchar(45) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `f_nacimiento` date NOT NULL,
  `sexo` varchar(45) NOT NULL,
  `pais` varchar(100) NOT NULL,
  `cp` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'hgdfshgjkhsdkgh@gmail.com','jhdhghds','juan','2021-02-01','hombre','españa',8032),(2,'hgdfshgjkhsdkgh@gmail.com','jhdhghds','maria','2021-03-15','mujer','españa',21036);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `video`
--

DROP TABLE IF EXISTS `video`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `video` (
  `id` int NOT NULL AUTO_INCREMENT,
  `titulo` varchar(255) NOT NULL,
  `descripcion` text NOT NULL,
  `tamaño` int NOT NULL,
  `nombre_archivo` varchar(255) NOT NULL,
  `tiempo_video` int NOT NULL,
  `thumbnail` longblob NOT NULL,
  `reproduciones` bigint DEFAULT NULL,
  `likes` mediumint DEFAULT NULL,
  `dislikes` mediumint DEFAULT NULL,
  `estado` varchar(7) NOT NULL,
  `fecha` datetime NOT NULL,
  `usuario_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `video_usuario_idx` (`usuario_id`),
  CONSTRAINT `video_usuario` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `video`
--

LOCK TABLES `video` WRITE;
/*!40000 ALTER TABLE `video` DISABLE KEYS */;
INSERT INTO `video` VALUES (1,'safari','de visita por africa',150,'safaris',2,_binary 'hgdhsjkghk.jpg',NULL,NULL,NULL,'publico','2021-01-19 03:14:07',1),(2,'quedada','quedada en moteros',223,'motos',6,_binary 'hgdhsjkghk.jpg',NULL,NULL,NULL,'publico','2021-01-26 14:35:12',2);
/*!40000 ALTER TABLE `video` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-03-11 20:26:13
