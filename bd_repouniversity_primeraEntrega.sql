CREATE DATABASE  IF NOT EXISTS `repouniversity` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `repouniversity`;
-- MySQL dump 10.13  Distrib 5.6.17, for Win32 (x86)
--
-- Host: 127.0.0.1    Database: repouniversity
-- ------------------------------------------------------
-- Server version	5.6.20

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `alumno`
--

DROP TABLE IF EXISTS `alumno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alumno` (
  `id_alumno` int(10) NOT NULL AUTO_INCREMENT,
  `id_persona` int(10) NOT NULL,
  `activo` tinyint(1) NOT NULL DEFAULT '1',
  `fecsys` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Idcarrera` int(11) DEFAULT '1',
  PRIMARY KEY (`id_alumno`),
  KEY `fk_alumno_1` (`id_alumno`),
  KEY `fk_idcarrera_idx` (`Idcarrera`),
  CONSTRAINT `fk_idcarrera` FOREIGN KEY (`Idcarrera`) REFERENCES `carrera` (`idcarrera`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alumno`
--

LOCK TABLES `alumno` WRITE;
/*!40000 ALTER TABLE `alumno` DISABLE KEYS */;
INSERT INTO `alumno` VALUES (1,31,1,'2015-09-01 03:28:45',5),(2,35,1,'2015-09-01 03:36:20',5),(3,36,1,'2015-09-01 03:37:17',5);
/*!40000 ALTER TABLE `alumno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alumno_curso`
--

DROP TABLE IF EXISTS `alumno_curso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alumno_curso` (
  `id_alumno` int(10) NOT NULL,
  `id_curso` int(10) NOT NULL,
  `id_grupo` int(10) NOT NULL,
  PRIMARY KEY (`id_curso`,`id_alumno`,`id_grupo`),
  KEY `fk_alumno_has_carrera_alumno1` (`id_alumno`),
  KEY `fk_alumno_has_carrera_carrera1` (`id_curso`),
  KEY `fk_alumno_has_carrera_grupo` (`id_grupo`),
  CONSTRAINT `fk_alumno_has_carrera_alumno1` FOREIGN KEY (`id_alumno`) REFERENCES `alumno` (`id_alumno`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_alumno_has_carrera_carrera1` FOREIGN KEY (`id_curso`) REFERENCES `curso` (`id_curso`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_alumno_has_carrera_grupo` FOREIGN KEY (`id_grupo`) REFERENCES `grupo` (`id_grupo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alumno_curso`
--

LOCK TABLES `alumno_curso` WRITE;
/*!40000 ALTER TABLE `alumno_curso` DISABLE KEYS */;
INSERT INTO `alumno_curso` VALUES (1,6,15),(2,6,15),(3,6,1);
/*!40000 ALTER TABLE `alumno_curso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `archivo`
--

DROP TABLE IF EXISTS `archivo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `archivo` (
  `id_archivo` int(10) NOT NULL AUTO_INCREMENT COMMENT 'codigo del archivo\n',
  `nombre` varchar(255) NOT NULL,
  `descripcion` text,
  `fecha_despublicacion` date NOT NULL,
  `fecha_publicacion` date NOT NULL,
  `id_tipo` int(10) NOT NULL,
  `fecsys` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `activo` tinyint(1) NOT NULL DEFAULT '1',
  `estado` int(10) NOT NULL,
  `path` varchar(255) NOT NULL,
  `persona_id_persona` int(10) NOT NULL,
  `id_curso` int(10) NOT NULL,
  `Tags` varchar(500) DEFAULT NULL,
  `binario` mediumblob NOT NULL,
  PRIMARY KEY (`id_archivo`,`persona_id_persona`),
  KEY `fk_archivo_1` (`id_tipo`),
  KEY `fk_archivo_estado1` (`estado`),
  KEY `fk_archivo_persona1_idx` (`persona_id_persona`),
  KEY `FK_curso` (`id_curso`),
  CONSTRAINT `FK_curso` FOREIGN KEY (`id_curso`) REFERENCES `curso` (`id_curso`),
  CONSTRAINT `estado_fk` FOREIGN KEY (`estado`) REFERENCES `estado` (`id_estado`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_archivo_1` FOREIGN KEY (`id_tipo`) REFERENCES `archivo_tipo` (`id_tipo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_archivo_estado1` FOREIGN KEY (`estado`) REFERENCES `estado` (`id_estado`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_archivo_persona1` FOREIGN KEY (`persona_id_persona`) REFERENCES `persona` (`id_persona`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `archivo`
--

LOCK TABLES `archivo` WRITE;
/*!40000 ALTER TABLE `archivo` DISABLE KEYS */;
INSERT INTO `archivo` VALUES (10,'IT_TEC_BuenasPracticasSQL.odt','TP Numero 1','2015-08-11','2015-08-11',1,'2015-08-12 01:25:43',1,2,'1439342743079-aa-IT_TEC_BuenasPracticasSQL.odt',4,7,'',''),(11,'principios-ghezzi.odt','TP Numero 2','2015-08-11','2015-08-11',1,'2015-08-12 01:26:05',1,2,'1439342765741-aa-principios-ghezzi.odt',4,7,'',''),(12,'Concepto de Costos.odt','Entrega 1','2015-08-11','2015-08-11',1,'2015-08-12 01:26:54',1,2,'1439342814664-aa-Concepto de Costos.odt',31,7,'',''),(13,'Costos y contabilidad 2008.odt','Entrega 2','2015-08-11','2015-08-11',1,'2015-08-12 01:29:10',1,2,'1439342950855-aa-Costos y contabilidad 2008.odt',31,7,'',''),(14,'2- METODOLOGIA EN PROYECTOS.pdf','entrega 3','2015-08-11','2015-08-11',2,'2015-08-12 01:29:59',1,2,'1439342999563-aa-2- METODOLOGIA EN PROYECTOS.pdf',31,7,'',''),(15,'IT_TEC_BuenasPracticasSQL.odt','IT_TEC_BuenasPracticasSQL','2015-08-11','2015-08-11',1,'2015-08-12 01:32:43',1,1,'1439343163421-aa-IT_TEC_BuenasPracticasSQL.odt',31,7,'Base;Datos;',''),(16,'Programa de Taller de Programacion Avanzada.pdf','Programa de Taller de Programacion Avanzada','2015-08-11','2015-08-11',2,'2015-08-12 01:32:43',1,1,'1439343163420-aa-Programa de Taller de Programacion Avanzada.pdf',31,7,'java;',''),(17,'RepoUniversitySRS_ver2_sinFormato.odt','RepoUniversitySRS_ver2_sinFormato','2015-08-11','2015-08-11',1,'2015-08-12 01:32:43',1,1,'1439343163421-aa-RepoUniversitySRS_ver2_sinFormato.odt',31,7,'nosotros;',''),(18,'CRONOGRAMAS SEMANALES INTENSIVO.odt','CRONOGRAMAS SEMANALES INTENSIVO','2015-08-11','2015-08-11',1,'2015-08-12 01:32:43',1,1,'1439343163420-aa-CRONOGRAMAS SEMANALES INTENSIVO.odt',31,7,'Cronograma;',''),(19,'Informe TNS - HotSale_ OFERTA_v6.odp','Informe TNS - HotSale_ OFERTA_v6','2015-08-11','2015-08-11',5,'2015-08-12 01:32:43',1,1,'1439343163421-aa-Informe TNS - HotSale_ OFERTA_v6.odp',31,7,'compras;promos;',''),(20,'Pedidos de Notebooks por clientes.ods','Pedidos de Notebooks por clientes','2015-08-11','2015-08-11',3,'2015-08-12 01:32:43',1,1,'1439343163420-aa-Pedidos de Notebooks por clientes.ods',31,7,'compras;',''),(21,'Trabajo Parctico Curso Lunes.odt','Trabajo Parctico Curso Lunes','2015-08-11','2015-08-11',1,'2015-08-12 01:32:43',1,1,'1439343163476-aa-Trabajo Parctico Curso Lunes.odt',31,7,'redes;',''),(22,'SECUENCIA BANDERA.odt','SECUENCIA BANDERA','2015-08-11','2015-08-11',1,'2015-08-12 01:32:43',1,1,'1439343163463-aa-SECUENCIA BANDERA.odt',31,7,'cantante;',''),(23,'Bancos.ods','Bancos','2015-08-11','2015-08-11',3,'2015-08-12 01:34:19',1,1,'1439343259757-aa-Bancos.ods',4,6,'santander;',''),(24,'Informe TNS - HotSale_ OFERTA_v6.odp','Informe TNS - HotSale_ OFERTA_v6','2015-08-11','2015-08-11',5,'2015-08-12 01:34:19',1,1,'1439343259767-aa-Informe TNS - HotSale_ OFERTA_v6.odp',4,6,'ventas;',''),(25,'Penguins.jpg','Penguins','2015-08-11','2015-08-11',4,'2015-08-12 01:34:52',1,1,'1439343292668-aa-Penguins.jpg',4,6,'pinguino;',''),(26,'Koala.jpg','Koala','2015-08-11','2015-08-11',4,'2015-08-12 01:34:52',1,1,'1439343292666-aa-Koala.jpg',4,6,'imagen;',''),(27,'Tulips.jpg','Tulips','2015-08-11','2015-08-11',4,'2015-08-12 01:34:52',1,1,'1439343292680-aa-Tulips.jpg',4,6,'tulipanes;',''),(28,'Jellyfish.jpg','Jellyfish','2015-08-11','2015-08-11',4,'2015-08-12 01:34:52',1,1,'1439343292687-aa-Jellyfish.jpg',4,6,'imagen;','');
/*!40000 ALTER TABLE `archivo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `archivo_tipo`
--

DROP TABLE IF EXISTS `archivo_tipo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `archivo_tipo` (
  `id_tipo` int(10) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `fecsys` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `activo` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_tipo`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `archivo_tipo`
--

LOCK TABLES `archivo_tipo` WRITE;
/*!40000 ALTER TABLE `archivo_tipo` DISABLE KEYS */;
INSERT INTO `archivo_tipo` VALUES (1,'Word','2014-04-14 20:04:21',1),(2,'PDF','2014-04-14 20:04:31',1),(3,'Excel','2014-04-14 20:04:39',1),(4,'Imagem','2014-04-14 20:04:39',1),(5,'Power Point','2015-08-12 02:41:33',1);
/*!40000 ALTER TABLE `archivo_tipo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carrera`
--

DROP TABLE IF EXISTS `carrera`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `carrera` (
  `idcarrera` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `activo` int(11) DEFAULT '1',
  PRIMARY KEY (`idcarrera`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carrera`
--

LOCK TABLES `carrera` WRITE;
/*!40000 ALTER TABLE `carrera` DISABLE KEYS */;
INSERT INTO `carrera` VALUES (1,'Abogacia',1),(2,'Lic. en Turismo',1),(3,'Lic. en Admin. Negocios',1),(4,'Lic. en Matematica',1),(5,'Lic. en Sistemas',1);
/*!40000 ALTER TABLE `carrera` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carrera_materia`
--

DROP TABLE IF EXISTS `carrera_materia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `carrera_materia` (
  `idmateria` int(11) NOT NULL,
  `idcarrera` int(11) NOT NULL,
  KEY `idmateria_idx` (`idmateria`),
  KEY `idcarrera_idx` (`idcarrera`),
  CONSTRAINT `idcarrera` FOREIGN KEY (`idcarrera`) REFERENCES `carrera` (`idcarrera`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `idmateria` FOREIGN KEY (`idmateria`) REFERENCES `materia` (`id_materia`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Se alojan las materias correspondientes a una carrera.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carrera_materia`
--

LOCK TABLES `carrera_materia` WRITE;
/*!40000 ALTER TABLE `carrera_materia` DISABLE KEYS */;
INSERT INTO `carrera_materia` VALUES (31,1),(35,1),(37,1),(38,1),(39,1),(40,1),(41,1),(42,1),(43,1),(44,1),(45,1),(55,1),(57,1),(58,1),(59,1),(60,1),(61,1),(62,1),(63,1),(64,1),(120,1),(144,1),(155,1),(163,1),(164,1),(165,1),(2,2),(3,2),(5,2),(28,2),(32,2),(66,2),(68,2),(75,2),(78,2),(80,2),(84,2),(85,2),(86,2),(87,2),(92,2),(95,2),(98,2),(99,2),(100,2),(106,2),(108,2),(113,2),(117,2),(121,2),(123,2),(124,2),(125,2),(127,2),(128,2),(129,2),(130,2),(132,2),(136,2),(139,2),(141,2),(146,2),(147,2),(157,2),(158,2),(166,2),(4,3),(12,3),(27,3),(29,3),(30,3),(33,3),(34,3),(36,3),(46,3),(48,3),(50,3),(51,3),(54,3),(56,3),(69,3),(70,3),(74,3),(81,3),(94,3),(107,3),(111,3),(116,3),(119,3),(122,3),(126,3),(135,3),(142,3),(143,3),(148,3),(150,3),(156,3),(159,3),(162,3),(1,4),(7,4),(8,4),(10,4),(13,4),(14,4),(23,4),(25,4),(26,4),(52,4),(53,4),(65,4),(67,4),(71,4),(72,4),(73,4),(79,4),(82,4),(88,4),(89,4),(90,4),(103,4),(105,4),(112,4),(115,4),(134,4),(145,4),(167,4),(6,5),(9,5),(11,5),(15,5),(16,5),(17,5),(18,5),(19,5),(20,5),(21,5),(22,5),(24,5),(47,5),(49,5),(76,5),(77,5),(83,5),(91,5),(93,5),(96,5),(97,5),(101,5),(102,5),(104,5),(109,5),(110,5),(114,5),(118,5),(131,5),(133,5),(137,5),(138,5),(140,5),(149,5),(151,5),(152,5),(153,5),(154,5),(160,5),(161,5);
/*!40000 ALTER TABLE `carrera_materia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `color`
--

DROP TABLE IF EXISTS `color`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `color` (
  `id_color` int(10) NOT NULL AUTO_INCREMENT,
  `color` varchar(30) NOT NULL,
  `activo` tinyint(4) NOT NULL DEFAULT '1',
  `colorPantalla` varchar(30) NOT NULL DEFAULT '',
  PRIMARY KEY (`id_color`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `color`
--

LOCK TABLES `color` WRITE;
/*!40000 ALTER TABLE `color` DISABLE KEYS */;
INSERT INTO `color` VALUES (1,'Verde',1,'navy'),(2,'Azul',1,'blue'),(3,'Rojo',1,'red'),(4,'Amarillo',1,'yellow');
/*!40000 ALTER TABLE `color` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comentario`
--

DROP TABLE IF EXISTS `comentario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comentario` (
  `id_comentario` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(500) DEFAULT NULL,
  `id_persona` int(11) DEFAULT NULL,
  `fecsys` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `activo` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_comentario`),
  KEY `id_persona_fk_idx` (`id_persona`),
  CONSTRAINT `id_persona_fk` FOREIGN KEY (`id_persona`) REFERENCES `persona` (`id_persona`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comentario`
--

LOCK TABLES `comentario` WRITE;
/*!40000 ALTER TABLE `comentario` DISABLE KEYS */;
INSERT INTO `comentario` VALUES (5,'Se entrego el tp en fecha',31,'2015-08-12 01:27:10',1),(6,'Volver  entregar faltan respuestas',4,'2015-08-12 01:28:31',1);
/*!40000 ALTER TABLE `comentario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comentario_tp`
--

DROP TABLE IF EXISTS `comentario_tp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comentario_tp` (
  `id_comentario` int(11) NOT NULL,
  `id_tpgrupo` int(11) NOT NULL,
  `fecsys` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `activo` int(11) DEFAULT '1',
  PRIMARY KEY (`id_comentario`,`id_tpgrupo`),
  KEY `FK_comentario_tp_2` (`id_tpgrupo`),
  CONSTRAINT `FK_comentario_tp_1` FOREIGN KEY (`id_comentario`) REFERENCES `comentario` (`id_comentario`),
  CONSTRAINT `FK_comentario_tp_2` FOREIGN KEY (`id_tpgrupo`) REFERENCES `tp_grupo` (`idtp_grupo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comentario_tp`
--

LOCK TABLES `comentario_tp` WRITE;
/*!40000 ALTER TABLE `comentario_tp` DISABLE KEYS */;
INSERT INTO `comentario_tp` VALUES (5,4,'2015-08-12 01:27:10',1),(6,4,'2015-08-12 01:28:31',1);
/*!40000 ALTER TABLE `comentario_tp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `curso`
--

DROP TABLE IF EXISTS `curso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `curso` (
  `id_curso` int(10) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `codigo` varchar(255) DEFAULT NULL COMMENT 'nombre resumido de la carrera\n',
  `descripcion` text,
  `fecha_fin` timestamp NULL DEFAULT NULL,
  `activo` tinyint(1) NOT NULL DEFAULT '1',
  `fecsys` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id_docente` int(11) NOT NULL,
  `id_materia` int(11) NOT NULL,
  PRIMARY KEY (`id_curso`),
  KEY `docente_fk_idx` (`id_docente`),
  KEY `idmateria_idx` (`id_materia`),
  CONSTRAINT `iddocente_fk` FOREIGN KEY (`id_docente`) REFERENCES `docente` (`id_docente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `idmateria_fk` FOREIGN KEY (`id_materia`) REFERENCES `materia` (`id_materia`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `curso`
--

LOCK TABLES `curso` WRITE;
/*!40000 ALTER TABLE `curso` DISABLE KEYS */;
INSERT INTO `curso` VALUES (6,'Algebra','P-400','Algebra 2015',NULL,1,'2015-08-11 19:01:17',4,6),(7,'Calculo en una variable','CU001','Calculo en una variable',NULL,1,'2015-08-24 23:04:11',4,22),(8,'Calculo en varias variables','CV001','Calculo en varias variables',NULL,1,'2015-09-01 03:23:52',4,24),(9,'Arquitectura avanzada','CA002','Arquitectura avanzada',NULL,1,'2015-09-01 03:25:48',4,15);
/*!40000 ALTER TABLE `curso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `docente`
--

DROP TABLE IF EXISTS `docente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `docente` (
  `id_docente` int(10) NOT NULL AUTO_INCREMENT,
  `id_persona` int(10) NOT NULL,
  `activo` tinyint(1) NOT NULL DEFAULT '1',
  `fecsys` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_docente`),
  KEY `fk_docente_1` (`id_docente`),
  CONSTRAINT `fk_docente_1` FOREIGN KEY (`id_docente`) REFERENCES `persona` (`id_persona`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `docente`
--

LOCK TABLES `docente` WRITE;
/*!40000 ALTER TABLE `docente` DISABLE KEYS */;
INSERT INTO `docente` VALUES (1,1,1,'2015-08-11 18:46:39'),(2,2,0,'2015-08-11 18:46:39'),(3,3,1,'2015-08-11 18:46:39'),(4,4,1,'2015-08-11 18:46:39'),(5,5,0,'2015-08-11 18:46:39'),(6,6,1,'2015-08-11 18:46:39'),(7,7,1,'2015-08-11 18:46:39'),(8,8,1,'2015-08-11 18:46:39'),(9,9,1,'2015-08-11 18:46:39'),(10,10,1,'2015-08-11 18:46:39'),(11,11,1,'2015-08-11 18:46:39'),(12,12,1,'2015-08-11 18:46:39'),(13,13,1,'2015-08-11 18:46:39'),(14,14,1,'2015-08-11 18:46:39'),(15,15,1,'2015-08-11 18:46:39'),(16,16,1,'2015-08-11 18:46:39'),(17,17,1,'2015-08-11 18:46:39'),(18,18,1,'2015-08-11 18:46:39'),(19,19,1,'2015-08-11 18:46:39'),(20,20,1,'2015-08-11 18:46:39'),(21,21,1,'2015-08-11 18:46:39'),(22,22,1,'2015-08-11 18:46:39'),(23,23,1,'2015-08-11 18:46:39'),(24,24,1,'2015-08-11 18:46:39'),(25,25,1,'2015-08-11 18:46:39'),(26,26,1,'2015-08-11 18:46:39'),(27,27,1,'2015-08-11 18:46:39'),(28,28,1,'2015-08-11 18:46:39'),(29,29,1,'2015-08-11 18:46:39'),(30,30,1,'2015-08-11 18:46:39'),(31,33,1,'2015-08-23 21:00:08');
/*!40000 ALTER TABLE `docente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `error_archivo`
--

DROP TABLE IF EXISTS `error_archivo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `error_archivo` (
  `iderror_archivo` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(500) DEFAULT NULL,
  `id_archivo` int(11) DEFAULT NULL,
  `id_persona` int(11) DEFAULT NULL,
  `fecsys` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `activo` int(11) DEFAULT '1',
  PRIMARY KEY (`iderror_archivo`),
  KEY `id_archivo_fk_idx` (`id_archivo`),
  KEY `id_persona_fk_error_idx` (`id_persona`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `error_archivo`
--

LOCK TABLES `error_archivo` WRITE;
/*!40000 ALTER TABLE `error_archivo` DISABLE KEYS */;
/*!40000 ALTER TABLE `error_archivo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estado`
--

DROP TABLE IF EXISTS `estado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estado` (
  `id_estado` int(10) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `descripcion` text,
  `codigo` varchar(45) DEFAULT NULL,
  `fecsys` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `activo` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_estado`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estado`
--

LOCK TABLES `estado` WRITE;
/*!40000 ALTER TABLE `estado` DISABLE KEYS */;
INSERT INTO `estado` VALUES (1,'Publico','pub','1','2014-04-14 20:03:18',1),(2,'Privado','pri','2','2014-04-14 20:03:18',1);
/*!40000 ALTER TABLE `estado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grupo`
--

DROP TABLE IF EXISTS `grupo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grupo` (
  `id_grupo` int(10) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `activo` tinyint(1) NOT NULL DEFAULT '1',
  `fecsys` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_grupo`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grupo`
--

LOCK TABLES `grupo` WRITE;
/*!40000 ALTER TABLE `grupo` DISABLE KEYS */;
INSERT INTO `grupo` VALUES (1,'Sin Grupo',1,'2014-04-14 19:35:53'),(12,'Grupo Test',0,'2015-08-12 01:21:06'),(13,'Nuevo',0,'2015-08-12 01:22:28'),(14,'Nuevo grupo',1,'2015-08-12 01:25:16'),(15,'Grupo 1',1,'2015-09-01 03:39:24');
/*!40000 ALTER TABLE `grupo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `materia`
--

DROP TABLE IF EXISTS `materia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `materia` (
  `id_materia` int(10) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `descripcion` text,
  `activo` tinyint(1) NOT NULL DEFAULT '1',
  `fecsys` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_materia`)
) ENGINE=InnoDB AUTO_INCREMENT=168 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `materia`
--

LOCK TABLES `materia` WRITE;
/*!40000 ALTER TABLE `materia` DISABLE KEYS */;
INSERT INTO `materia` VALUES (1,'Fundamentos de la matematica (Lic. en Matematica)','Lic. en Matematica -  Fundamentos de la matematica',1,'2015-08-11 18:37:07'),(2,'administracion de empresas de servicios (Lic. en Turismo)','Lic. en Turismo - administracion de empresas de servicios',1,'2015-08-11 18:37:07'),(3,'administracion Financiera (Lic. en Turismo)','Lic. en Turismo - administracion Financiera',1,'2015-08-11 18:37:07'),(4,'administracion Financiera (Lic. en Admin. Negocios)','Lic. en admin. Negocios - administracion Financiera',1,'2015-08-11 18:37:07'),(5,'agenda internacional (Lic. en Turismo)','Lic. en Turismo - agenda internacional',1,'2015-08-11 18:37:07'),(6,'algebra (Lic. en Sistemas)','Lic. en Sistemas - algebra',1,'2015-08-11 18:37:07'),(7,'algebra lineal (Lic. en Matematica)','Lic. en Matematica - algebra lineal',1,'2015-08-11 18:37:07'),(8,'algebra  (Lic. en Matematica)','Lic. en Matematica - algebra ',1,'2015-08-11 18:37:07'),(9,'algoritmos y estructuras de datos i (Lic. en Sistemas)','Lic. en Sistemas - algoritmos y estructuras de datos i',1,'2015-08-11 18:37:07'),(10,'algoritmos y estructuras de datos i (Lic. en Matematica)','Lic. en Matematica - algoritmos y estructuras de datos i',1,'2015-08-11 18:37:07'),(11,'algoritmos y estructuras de datos ii (Lic. en Sistemas)','Lic. en Sistemas - algoritmos y estructuras de datos ii',1,'2015-08-11 18:37:07'),(12,'analisis economico (Lic. en Admin. Negocios)','Lic. en admin. Negocios - analisis economico',1,'2015-08-11 18:37:07'),(13,'analisis Funcional (Lic. en Matematica)','Lic. en Matematica - analisis Funcional',1,'2015-08-11 18:37:07'),(14,'analisis vectorial (Lic. en Matematica)','Lic. en Matematica - analisis vectorial',1,'2015-08-11 18:37:07'),(15,'arquitectura avanzada (Lic. en Sistemas)','Lic. en Sistemas - arquitectura avanzada',1,'2015-08-11 18:37:07'),(16,'arquitectura de computadores (Lic. en Sistemas)','Lic. en Sistemas - arquitectura de computadores',1,'2015-08-11 18:37:07'),(17,'arquitectura Web (Lic. en Sistemas)','Lic. en Sistemas - arquitectura Web',1,'2015-08-11 18:37:07'),(18,'aspectos profesionales para ingenieria (Lic. en Sistemas)','Lic. en Sistemas - aspectos profesionales para ingenieria',1,'2015-08-11 18:37:07'),(19,'auditoria y Seguridad informatica (Lic. en Sistemas)','Lic. en Sistemas - auditoria y Seguridad informatica',1,'2015-08-11 18:37:07'),(20,'Base de datos i (Lic. en Sistemas)','Lic. en Sistemas - Base de datos i',1,'2015-08-11 18:37:07'),(21,'Base de datos ii (Lic. en Sistemas)','Lic. en Sistemas - Base de datos ii',1,'2015-08-11 18:37:07'),(22,'Calculo en una variable (Lic. en Sistemas)','Lic. en Sistemas - Calculo en una variable',1,'2015-08-11 18:37:07'),(23,'Calculo en una variable (Lic. en Matematica)','Lic. en Matematica - Calculo en una variable',1,'2015-08-11 18:37:07'),(24,'Calculo en varias variables (Lic. en Sistemas)','Lic. en Sistemas - Calculo en varias variables',1,'2015-08-11 18:37:07'),(25,'Calculo en varias variables (Lic. en Matematica)','Lic. en Matematica - Calculo en varias variables',1,'2015-08-11 18:37:07'),(26,'Calculo numerico (Lic. en Matematica)','Lic. en Matematica - Calculo numerico',1,'2015-08-11 18:37:07'),(27,'Comercializacion (Lic. en Admin. Negocios)','Lic. en admin. Negocios - Comercializacion',1,'2015-08-11 18:37:07'),(28,'Contabilidad (Lic. en Turismo)','Lic. en Turismo - Contabilidad',1,'2015-08-11 18:37:07'),(29,'Contabilidad (Lic. en Admin. Negocios)','Lic. en admin. Negocios - Contabilidad',1,'2015-08-11 18:37:07'),(30,'Contabilidad Gerencial (Lic. en Admin. Negocios)','Lic. en admin. Negocios - Contabilidad Gerencial',1,'2015-08-11 18:37:07'),(31,'Contratos Civiles y Comerciales anual (Abogacia)','aBoGaCia - Contratos Civiles y Comerciales anual',1,'2015-08-11 18:37:07'),(32,'Costos (Lic. en Turismo)','Lic. en Turismo - Costos',1,'2015-08-11 18:37:07'),(33,'Costos y Control Presupuestario (Lic. en Admin. Negocios)','Lic. en admin. Negocios - Costos y Control Presupuestario',1,'2015-08-11 18:37:07'),(34,'Derecho Civil y Comercial (Lic. en Admin. Negocios)','Lic. en admin. Negocios - Derecho Civil y Comercial',1,'2015-08-11 18:37:07'),(35,'Derecho Constitucional (Abogacia)','aBoGaCia - Derecho constitucional',1,'2015-08-11 18:37:07'),(36,'Derecho Constitucional y administrativo (Lic. en Admin. Negocios)','Lic. en admin. Negocios - Derecho Constitucional y administrativo',1,'2015-08-11 18:37:07'),(37,'Derecho de Familia y Sucesiones (Abogacia)','aBoGaCia - Derecho de Familia y Sucesiones',1,'2015-08-11 18:37:07'),(38,'Derecho del Trabajo y de la Seguridad Social (Abogacia)','aBoGaCia - Derecho del Trabajo y de la Seguridad Social',1,'2015-08-11 18:37:07'),(39,'Derecho empresarial (Abogacia)','aBoGaCia - Derecho empresarial',1,'2015-08-11 18:37:07'),(40,'Derecho Notarial, Registral e inmobiliario (Abogacia)','aBoGaCia - Derecho Notarial, Registral e inmobiliario',1,'2015-08-11 18:37:07'),(41,'Derecho Penal (Abogacia)','aBoGaCia - Derecho Penal',1,'2015-08-11 18:37:07'),(42,'Derecho Privado (Abogacia)','aBoGaCia - Derecho Privado',1,'2015-08-11 18:37:07'),(43,'Derecho Publico (Abogacia)','aBoGaCia - Derecho Publico',1,'2015-08-11 18:37:07'),(44,'Derecho Tributario (Abogacia)','aBoGaCia - Derecho Tributario',1,'2015-08-11 18:37:07'),(45,'Derechos Humanos y Garantias (Abogacia)','aBoGaCia - Derechos Humanos y Garantias',1,'2015-08-11 18:37:07'),(46,'Desarrollo de un Proyecto de Negocios (Lic. en Admin. Negocios)','Lic. en admin. Negocios - Desarrollo de un Proyecto de Negocios',1,'2015-08-11 18:37:07'),(47,'Direccion estrategica (Lic. en Sistemas)','Lic. en Sistemas - Direccion estrategica',1,'2015-08-11 18:37:07'),(48,'Direccion General (Lic. en Admin. Negocios)','Lic. en admin. Negocios - Direccion General',1,'2015-08-11 18:37:07'),(49,'economia (Lic. en Sistemas)','Lic. en Sistemas - economia',1,'2015-08-11 18:37:07'),(50,'economia de empresas (Lic. en Admin. Negocios)','Lic. en admin. Negocios - economia de empresas',1,'2015-08-11 18:37:07'),(51,'economia internacional (Lic. en Admin. Negocios)','Lic. en admin. Negocios - economia internacional',1,'2015-08-11 18:37:07'),(52,'ecuaciones diferenciales en derivadas parciales (Lic. en Matematica)','Lic. en Matematica - ecuaciones diferenciales en derivadas parciales',1,'2015-08-11 18:37:07'),(53,'ecuaciones diferenciales ordinarias (Lic. en Matematica)','Lic. en Matematica - ecuaciones diferenciales ordinarias',1,'2015-08-11 18:37:07'),(54,'elementos de algebra (Lic. en Admin. Negocios)','Lic. en admin. Negocios - elementos de algebra',1,'2015-08-11 18:37:07'),(55,'elementos de analisis economico y Financiero   (Abogacia)','aBoGaCia - elementos de analisis economico y Financiero  ',1,'2015-08-11 18:37:07'),(56,'elementos de analisis Matematico (Lic. en Admin. Negocios)','Lic. en admin. Negocios - elementos de analisis Matematico',1,'2015-08-11 18:37:07'),(57,'elementos de Derecho administrativo (Abogacia)','aBoGaCia - elementos de Derecho administrativo',1,'2015-08-11 18:37:07'),(58,'elementos de Derecho Civil (Abogacia)','aBoGaCia - elementos de Derecho Civil',1,'2015-08-11 18:37:07'),(59,'elementos de Derecho Comercial (Abogacia)','aBoGaCia - elementos de Derecho Comercial',1,'2015-08-11 18:37:07'),(60,'elementos de Derecho Constitucional (Abogacia)','aBoGaCia - elementos de Derecho Constitucional',1,'2015-08-11 18:37:07'),(61,'elementos de Derecho del Trabajo y de la (Abogacia)','aBoGaCia - elementos de Derecho del Trabajo y de la',1,'2015-08-11 18:37:07'),(62,'elementos de Derecho Penal y de Procesal Penal anual (Abogacia)','aBoGaCia - elementos de Derecho Penal y de Procesal Penal anual',1,'2015-08-11 18:37:07'),(63,'elementos de Derecho Procesal Civil y Comercial (Abogacia)','aBoGaCia - elementos de Derecho Procesal Civil y Comercial',1,'2015-08-11 18:37:07'),(64,'elementos de Derechos Reales (Abogacia)','aBoGaCia - elementos de Derechos Reales',1,'2015-08-11 18:37:07'),(65,'espacios metricos y topologicos (Lic. en Matematica)','Lic. en Matematica - espacios metricos y topologicos',1,'2015-08-11 18:37:07'),(66,'estadistica aplicada (Lic. en Turismo)','Lic. en Turismo - estadistica aplicada',1,'2015-08-11 18:37:07'),(67,'estadistica ii (Lic. en Matematica)','Lic. en Matematica - estadistica ii',1,'2015-08-11 18:37:07'),(68,'estrategia Competitiva (Lic. en Turismo)','Lic. en Turismo - estrategia Competitiva',1,'2015-08-11 18:37:07'),(69,'estrategia Competitiva (Lic. en Admin. Negocios)','Lic. en admin. Negocios - estrategia Competitiva',1,'2015-08-11 18:37:07'),(70,'estructura y Procedimientos de las organizaciones (Lic. en Admin. Negocios)','Lic. en admin. Negocios - estructura y Procedimientos de las organizaciones',1,'2015-08-11 18:37:07'),(71,'estructuras algebraicas i (Lic. en Matematica)','Lic. en Matematica - estructuras algebraicas i',1,'2015-08-11 18:37:07'),(72,'estructuras algebraicas ii (Lic. en Matematica)','Lic. en Matematica - estructuras algebraicas ii',1,'2015-08-11 18:37:07'),(73,'estructuras algebraicas iii (Lic. en Matematica)','Lic. en Matematica - estructuras algebraicas iii',1,'2015-08-11 18:37:07'),(74,'etica en los Negocios (Lic. en Admin. Negocios)','Lic. en admin. Negocios - etica en los Negocios',1,'2015-08-11 18:37:07'),(75,'etica profesional (Lic. en Turismo)','Lic. en Turismo - etica profesional',1,'2015-08-11 18:37:07'),(76,'Fisica i (Lic. en Sistemas)','Lic. en Sistemas - Fisica i',1,'2015-08-11 18:37:07'),(77,'Fisica ii (Lic. en Sistemas)','Lic. en Sistemas - Fisica ii',1,'2015-08-11 18:37:07'),(78,'Formulacion y evaluacion de proyectos (Lic. en Turismo)','Lic. en Turismo - Formulacion y evaluacion de proyectos',1,'2015-08-11 18:37:07'),(79,'Funciones reales (Lic. en Matematica)','Lic. en Matematica - Funciones reales',1,'2015-08-11 18:37:07'),(80,'Fundamentos de administracion (Lic. en Turismo)','Lic. en Turismo - Fundamentos de administracion',1,'2015-08-11 18:37:07'),(81,'Fundamentos de administracion (Lic. en Admin. Negocios)','Lic. en admin. Negocios - Fundamentos de administracion',1,'2015-08-11 18:37:07'),(82,'Fundamentos de analisis (Lic. en Matematica)','Lic. en Matematica - Fundamentos de analisis',1,'2015-08-11 18:37:07'),(83,'Fundamentos de comunicacion (Lic. en Sistemas)','Lic. en Sistemas - Fundamentos de comunicacion',1,'2015-08-11 18:37:07'),(84,'Geografia Turistica i (Lic. en Turismo)','Lic. en Turismo - Geografia Turistica i',1,'2015-08-11 18:37:07'),(85,'Geografia turistica ii (Lic. en Turismo)','Lic. en Turismo - Geografia turistica ii',1,'2015-08-11 18:37:07'),(86,'Geografia turistica iii (Lic. en Turismo)','Lic. en Turismo - Geografia turistica iii',1,'2015-08-11 18:37:07'),(87,'Geografia y Patrimonio turistico (Lic. en Turismo)','Lic. en Turismo - Geografia y Patrimonio turistico',1,'2015-08-11 18:37:07'),(88,'Geometria diferencial (Lic. en Matematica)','Lic. en Matematica - Geometria diferencial',1,'2015-08-11 18:37:07'),(89,'Geometria i (Lic. en Matematica)','Lic. en Matematica - Geometria i',1,'2015-08-11 18:37:07'),(90,'Geometria ii (Lic. en Matematica)','Lic. en Matematica - Geometria ii',1,'2015-08-11 18:37:07'),(91,'Gestion ambiental (Lic. en Sistemas)','Lic. en Sistemas - Gestion ambiental',1,'2015-08-11 18:37:07'),(92,'Gestion de empresas y Servicios (Lic. en Turismo)','Lic. en Turismo - Gestion de empresas y Servicios',1,'2015-08-11 18:37:07'),(93,'Gestion de Proyectos y Calidad (Lic. en Sistemas)','Lic. en Sistemas - Gestion de Proyectos y Calidad',1,'2015-08-11 18:37:07'),(94,'informatica (Lic. en Admin. Negocios)','Lic. en admin. Negocios - informatica',1,'2015-08-11 18:37:07'),(95,'informatica aplicada (Lic. en Turismo)','Lic. en Turismo - informatica aplicada',1,'2015-08-11 18:37:07'),(96,'ingenieria del Software i (Lic. en Sistemas)','Lic. en Sistemas - ingenieria del Software i',1,'2015-08-11 18:37:07'),(97,'ingenieria del Software ii (Lic. en Sistemas)','Lic. en Sistemas - ingenieria del Software ii',1,'2015-08-11 18:37:07'),(98,'ingles i (Lic. en Turismo)','Lic. en Turismo - ingles i',1,'2015-08-11 18:37:07'),(99,'ingles ii (Lic. en Turismo)','Lic. en Turismo - ingles ii',1,'2015-08-11 18:37:07'),(100,'ingles iii (Lic. en Turismo)','Lic. en Turismo - ingles iii',1,'2015-08-11 18:37:07'),(101,'inteligencia de Negocios (Lic. en Sistemas)','Lic. en Sistemas - inteligencia de Negocios',1,'2015-08-11 18:37:07'),(102,'introduccion a la informatica (Lic. en Sistemas)','Lic. en Sistemas - introduccion a la informatica',1,'2015-08-11 18:37:07'),(103,'introduccion a la informatica (Lic. en Matematica)','Lic. en Matematica - introduccion a la informatica',1,'2015-08-11 18:37:07'),(104,'introduccion a la matematica (Lic. en Sistemas)','Lic. en Sistemas - introduccion a la matematica',1,'2015-08-11 18:37:07'),(105,'introduccion a la Matematica (Lic. en Matematica)','Lic. en Matematica - introduccion a la Matematica',1,'2015-08-11 18:37:07'),(106,'introduccion al Turismo y la Hoteleria (Lic. en Turismo)','Lic. en Turismo - introduccion al Turismo y la Hoteleria',1,'2015-08-11 18:37:07'),(107,'Juego de empresas (Lic. en Admin. Negocios)','Lic. en admin. Negocios - Juego de empresas',1,'2015-08-11 18:37:07'),(108,'Legislacion aplicada (Lic. en Turismo)','Lic. en Turismo - Legislacion aplicada',1,'2015-08-11 18:37:07'),(109,'Lenguajes de programacion (Lic. en Sistemas)','Lic. en Sistemas - Lenguajes de programacion',1,'2015-08-11 18:37:07'),(110,'Lenguajes Formales (Lic. en Sistemas)','Lic. en Sistemas - Lenguajes Formales',1,'2015-08-11 18:37:07'),(111,'Liderazgo y Negociacion (Lic. en Admin. Negocios)','Lic. en admin. Negocios - Liderazgo y Negociacion',1,'2015-08-11 18:37:07'),(112,'Logica (Lic. en Matematica)','Lic. en Matematica - Logica',1,'2015-08-11 18:37:07'),(113,'Marketing turistico y hotelero (Lic. en Turismo)','Lic. en Turismo - Marketing turistico y hotelero',1,'2015-08-11 18:37:07'),(114,'Matematica Discreta (Lic. en Sistemas)','Lic. en Sistemas - Matematica Discreta',1,'2015-08-11 18:37:07'),(115,'Matematica Discreta (Lic. en Matematica)','Lic. en Matematica - Matematica Discreta',1,'2015-08-11 18:37:07'),(116,'Mercado de Capitales (Lic. en Admin. Negocios)','Lic. en admin. Negocios - Mercado de Capitales',1,'2015-08-11 18:37:07'),(117,'Metodologia y tecnica de la investigacion (Lic. en Turismo)','Lic. en Turismo - Metodologia y tecnica de la investigacion',1,'2015-08-11 18:37:07'),(118,'Modelos y Simulacion (Lic. en Sistemas)','Lic. en Sistemas - Modelos y Simulacion',1,'2015-08-11 18:37:07'),(119,'Negocios en internet (Lic. en Admin. Negocios)','Lic. en admin. Negocios - Negocios en internet',1,'2015-08-11 18:37:07'),(120,'obligaciones Civiles y Comerciales (Abogacia)','aBoGaCia - obligaciones Civiles y Comerciales',1,'2015-08-11 18:37:07'),(121,'organizacion de empresas turisticas (Lic. en Turismo)','Lic. en Turismo - organizacion de empresas turisticas',1,'2015-08-11 18:37:07'),(122,'organizacion para el Comercio exterior (Lic. en Admin. Negocios)','Lic. en admin. Negocios - organizacion para el Comercio exterior',1,'2015-08-11 18:37:07'),(123,'Patrimonio Turistico i (Lic. en Turismo)','Lic. en Turismo - Patrimonio Turistico i',1,'2015-08-11 18:37:07'),(124,'Patrimonio Turistico ii (Lic. en Turismo)','Lic. en Turismo - Patrimonio Turistico ii',1,'2015-08-11 18:37:07'),(125,'Patrimonio turistico iii (Lic. en Turismo)','Lic. en Turismo - Patrimonio turistico iii',1,'2015-08-11 18:37:07'),(126,'Planeamiento a Largo Plazo y estudio de Factibilidad (Lic. en Admin. Negocios)','Lic. en admin. Negocios - Planeamiento a Largo Plazo y estudio de Factibilidad',1,'2015-08-11 18:37:07'),(127,'Planificacion Turistica (Lic. en Turismo)','Lic. en Turismo - Planificacion Turistica',1,'2015-08-11 18:37:07'),(128,'Politica turistica (Lic. en Turismo)','Lic. en Turismo - Politica turistica',1,'2015-08-11 18:37:07'),(129,'Portugues i (Lic. en Turismo)','Lic. en Turismo - Portugues i',1,'2015-08-11 18:37:07'),(130,'Portugues ii (Lic. en Turismo)','Lic. en Turismo - Portugues ii',1,'2015-08-11 18:37:07'),(131,'Practica Profesional Supervisada (*) (Lic. en Sistemas)','Lic. en Sistemas - Practica Profesional Supervisada (*)',1,'2015-08-11 18:37:07'),(132,'Principios de economia (Lic. en Turismo)','Lic. en Turismo - Principios de economia',1,'2015-08-11 18:37:07'),(133,'Probabilidades y estadistica (Lic. en Sistemas)','Lic. en Sistemas - Probabilidades y estadistica',1,'2015-08-11 18:37:07'),(134,'Probabilidades y estadistica (Lic. en Matematica)','Lic. en Matematica - Probabilidades y estadistica',1,'2015-08-11 18:37:07'),(135,'Probabilidades y estadistica (Lic. en Admin. Negocios)','Lic. en admin. Negocios - Probabilidades y estadistica',1,'2015-08-11 18:37:07'),(136,'Programacion de servicios turisticos (Lic. en Turismo)','Lic. en Turismo - Programacion de servicios turisticos',1,'2015-08-11 18:37:07'),(137,'Proyecto Final de ingenieria i (Lic. en Sistemas)','Lic. en Sistemas - Proyecto Final de ingenieria i',1,'2015-08-11 18:37:07'),(138,'Proyecto Final de ingenieria ii (Lic. en Sistemas)','Lic. en Sistemas - Proyecto Final de ingenieria ii',1,'2015-08-11 18:37:07'),(139,'Psicosociologia del turismo (Lic. en Turismo)','Lic. en Turismo - Psicosociologia del turismo',1,'2015-08-11 18:37:07'),(140,'Quimica (Lic. en Sistemas)','Lic. en Sistemas - Quimica',1,'2015-08-11 18:37:07'),(141,'Recursos humanos (Lic. en Turismo)','Lic. en Turismo - Recursos humanos',1,'2015-08-11 18:37:07'),(142,'Recursos Humanos (Lic. en Admin. Negocios)','Lic. en admin. Negocios - Recursos Humanos',1,'2015-08-11 18:37:07'),(143,'Regimen Tributario (Lic. en Admin. Negocios)','Lic. en admin. Negocios - Regimen Tributario',1,'2015-08-11 18:37:07'),(144,'Seguridad Social (Abogacia)','aBoGaCia - Seguridad Social',1,'2015-08-11 18:37:07'),(145,'Seminario (Lic. en Matematica)','Lic. en Matematica - Seminario',1,'2015-08-11 18:37:07'),(146,'Servicios turisticos i (Lic. en Turismo)','Lic. en Turismo - Servicios turisticos i',1,'2015-08-11 18:37:07'),(147,'Servicios turisticos ii (Lic. en Turismo)','Lic. en Turismo - Servicios turisticos ii',1,'2015-08-11 18:37:07'),(148,'Sistemas de informacion (Lic. en Admin. Negocios)','Lic. en admin. Negocios - Sistemas de informacion',1,'2015-08-11 18:37:07'),(149,'Sistemas de informacion y organizacion (Lic. en Sistemas)','Lic. en Sistemas - Sistemas de informacion y organizacion',1,'2015-08-11 18:37:07'),(150,'Sistemas de Produccion (Lic. en Admin. Negocios)','Lic. en admin. Negocios - Sistemas de Produccion',1,'2015-08-11 18:37:07'),(151,'Sistemas de representacion (Lic. en Sistemas)','Lic. en Sistemas - Sistemas de representacion',1,'2015-08-11 18:37:07'),(152,'Sistemas inteligentes (Lic. en Sistemas)','Lic. en Sistemas - Sistemas inteligentes',1,'2015-08-11 18:37:07'),(153,'Sistemas operativos i (Lic. en Sistemas)','Lic. en Sistemas - Sistemas operativos i',1,'2015-08-11 18:37:07'),(154,'Sistemas operativos ii (Lic. en Sistemas)','Lic. en Sistemas - Sistemas operativos ii',1,'2015-08-11 18:37:07'),(155,'Sociedades Civiles y Comerciales (Abogacia)','aBoGaCia - Sociedades Civiles y Comerciales',1,'2015-08-11 18:37:07'),(156,'Sociologia (Lic. en Admin. Negocios)','Lic. en admin. Negocios - Sociologia',1,'2015-08-11 18:37:07'),(157,'Taller: Desarrollo de un proyecto turistico (Lic. en Turismo)','Lic. en Turismo - Taller: Desarrollo de un proyecto turistico',1,'2015-08-11 18:37:07'),(158,'Tecnicas de Comunicacion (Lic. en Turismo)','Lic. en Turismo - Tecnicas de Comunicacion',1,'2015-08-11 18:37:07'),(159,'Tecnicas de Comunicacion (Lic. en Admin. Negocios)','Lic. en admin. Negocios - Tecnicas de Comunicacion',1,'2015-08-11 18:37:07'),(160,'Teleprocesos y redes i (Lic. en Sistemas)','Lic. en Sistemas - Teleprocesos y redes i',1,'2015-08-11 18:37:07'),(161,'Teleprocesos y redes ii (Lic. en Sistemas)','Lic. en Sistemas - Teleprocesos y redes ii',1,'2015-08-11 18:37:07'),(162,'Teoria de Decisiones en Negocios (Lic. en Admin. Negocios)','Lic. en admin. Negocios - Teoria de Decisiones en Negocios',1,'2015-08-11 18:37:07'),(163,'Teoria del estado (Abogacia)','aBoGaCia - Teoria del estado',1,'2015-08-11 18:37:07'),(164,'Teoria del estado (Abogacia)','aBoGaCia - Teoria del estado',1,'2015-08-11 18:37:07'),(165,'Teoria General del Derecho (Abogacia)','aBoGaCia - Teoria General del Derecho',1,'2015-08-11 18:37:07'),(166,'Turismo y Medio ambiente (Lic. en Turismo)','Lic. en Turismo - Turismo y Medio ambiente',1,'2015-08-11 18:37:07'),(167,'Variable compleja (Lic. en Matematica)','Lic. en Matematica - Variable compleja',1,'2015-08-11 18:37:07');
/*!40000 ALTER TABLE `materia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notificacion`
--

DROP TABLE IF EXISTS `notificacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notificacion` (
  `idnotificacion` int(11) NOT NULL AUTO_INCREMENT,
  `tiponotificacion` int(11) NOT NULL,
  `idcurso` int(11) DEFAULT NULL,
  `iddocente` int(11) DEFAULT NULL,
  `idalumno` int(11) DEFAULT NULL,
  `estado` varchar(45) DEFAULT 'nuevo',
  `activo` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`idnotificacion`),
  KEY `idcurso_idx` (`idcurso`),
  KEY `tiponotificacion_idx` (`tiponotificacion`),
  CONSTRAINT `idcurso` FOREIGN KEY (`idcurso`) REFERENCES `curso` (`id_curso`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `tiponotificacion` FOREIGN KEY (`tiponotificacion`) REFERENCES `tipo_notificacion` (`idTipoNotificacion`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=latin1 COMMENT='En esta tabla se alojaran todas las notificaciones del siste';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notificacion`
--

LOCK TABLES `notificacion` WRITE;
/*!40000 ALTER TABLE `notificacion` DISABLE KEYS */;
INSERT INTO `notificacion` VALUES (26,1,6,1,1,'nuevo',0),(27,3,6,1,1,'nuevo',1),(28,1,7,4,1,'nuevo',0),(29,1,8,4,1,'nuevo',1),(30,3,7,4,1,'nuevo',1),(31,1,7,4,1,'nuevo',1),(32,1,6,4,2,'nuevo',0),(33,1,6,4,3,'nuevo',0),(34,3,6,4,2,'nuevo',1),(35,3,6,4,3,'nuevo',1);
/*!40000 ALTER TABLE `notificacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parametro`
--

DROP TABLE IF EXISTS `parametro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `parametro` (
  `id_parametro` int(10) NOT NULL AUTO_INCREMENT,
  `id_role` int(10) NOT NULL,
  `parametro` varchar(100) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `variable` varchar(100) NOT NULL,
  `activo` tinyint(1) NOT NULL DEFAULT '1',
  `fesys` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `icono` varchar(45) NOT NULL DEFAULT '',
  `link` varchar(200) NOT NULL DEFAULT '',
  PRIMARY KEY (`id_parametro`),
  KEY `fk_parametro_role_idx` (`id_role`),
  CONSTRAINT `fk_parametro_role` FOREIGN KEY (`id_role`) REFERENCES `role` (`id_role`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parametro`
--

LOCK TABLES `parametro` WRITE;
/*!40000 ALTER TABLE `parametro` DISABLE KEYS */;
INSERT INTO `parametro` VALUES (1,1,'Materias disponibles','materias creadas','0',1,'2015-08-22 00:12:35','fa fa-book fa-4x','/repouniversity/admin/verMaterias?bread=Ver materias-1'),(2,1,'Notificaciones','errores reportados','1',1,'2015-08-22 00:12:35','fa fa-bell fa-4x','/repouniversity/admin/verReporteErrores?bread=Ver reportes de errores-1'),(7,1,'Usuarios del sistema','usuarios activos','2',1,'2015-08-22 00:19:09','fa fa-group fa-4x','/repouniversity/admin/verUsuarios?bread=Ver usuario-1'),(8,1,'Cursos disponibles','cursos creados','3',1,'2015-08-22 00:19:09','fa fa-laptop fa-4x','/repouniversity/admin/verCursos?bread=Ver cursos-1'),(9,1,'Archivos disponibles','Archivos del repositorio','4',1,'2015-08-22 00:19:09','fa fa-file-pdf-o fa-4x','/repouniversity/admin/verArchivos?bread=Ver archivos-1'),(10,1,'Carreras disponibles','carreras creados','5',1,'2015-08-22 00:19:09','fa fa-bank fa-4x','/repouniversity/admin/verCarreras?bread=Ver carreras-1'),(11,2,'Cursos a cargo','Cursos a cargo','0',1,'2015-08-22 22:02:03','fa fa-pencil-square-o fa-4x','/repouniversity/docente/verCursos?bread=Ver Cursos-1'),(12,2,'Notificaciones','tiene nuevas novedades','1',1,'2015-08-22 22:02:03','fa fa-bell fa-4x','/repouniversity/docente/notificaciones?bread=Notificaciones-1'),(13,2,'Alumnos a cargo','mis alumnos','2',1,'2015-08-22 22:08:13','fa fa-user fa-4x',''),(14,2,'Archivos subidos','mis archivos','3',1,'2015-08-22 22:10:42','fa fa-file-pdf-o fa-4x','/repouniversity/verArchivos?bread=Ver archivos-1'),(15,2,'TPs pendientes','correccion','4',1,'2015-08-22 22:10:42','fa fa-thumbs-up fa-4x',''),(16,3,'Cursos inscripto','mis cursos','0',1,'2015-08-22 22:15:23','fa fa-pencil-square-o fa-4x','/repouniversity/alumno/cursos?bread=Ver cursos-1'),(17,3,'Notificaciones','tiene nuevas novedades','1',1,'2015-08-22 22:15:23','fa fa-bell fa-4x','/repouniversity/alumno/notificaciones?bread=Notificaciones-1'),(18,3,'Grupos inscripto','mis grupos','2',1,'2015-08-22 22:15:23','fa fa-group fa-4x','/repouniversity/alumno/verGrupos?bread=Ver Grupos-1'),(19,3,'Archivos subidos','mis archivos','3',1,'2015-08-22 22:15:23','fa fa-file-pdf-o fa-4x','/repouniversity/verArchivos?bread=Ver archivos-1'),(20,3,'TP','aprobados','4',1,'2015-08-22 22:15:23','fa fa-thumbs-up fa-4x','');
/*!40000 ALTER TABLE `parametro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permiso`
--

DROP TABLE IF EXISTS `permiso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permiso` (
  `id_permiso` int(10) NOT NULL AUTO_INCREMENT,
  `permiso` varchar(30) NOT NULL DEFAULT '',
  `activo` tinyint(1) NOT NULL DEFAULT '1',
  `fecsys` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_permiso`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permiso`
--

LOCK TABLES `permiso` WRITE;
/*!40000 ALTER TABLE `permiso` DISABLE KEYS */;
INSERT INTO `permiso` VALUES (1,'Alto',1,'2015-08-27 13:43:03'),(2,'Medio',1,'2015-08-27 13:43:03'),(3,'Bajo',1,'2015-08-27 13:43:03');
/*!40000 ALTER TABLE `permiso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `persona`
--

DROP TABLE IF EXISTS `persona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `persona` (
  `id_persona` int(10) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `apellido` varchar(255) NOT NULL,
  `mail` varchar(45) NOT NULL,
  `activo` tinyint(1) NOT NULL DEFAULT '1',
  `fecsys` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_persona`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persona`
--

LOCK TABLES `persona` WRITE;
/*!40000 ALTER TABLE `persona` DISABLE KEYS */;
INSERT INTO `persona` VALUES (1,'Maria Claudia','Abeledo','ariaClaudia.Abeledo@caece.edu.ar',1,'2015-08-11 18:30:15'),(2,'claudio','Acosta','costa@caece.edu.ar',1,'2015-08-23 20:59:35'),(3,'Ariel','Acuña','cuña@caece.edu.ar',1,'2015-08-11 18:30:56'),(4,'Ignacio','Albalustri Chaparro','lbalustriChaparro@caece.edu.ar',1,'2015-08-11 18:30:56'),(5,'Gustavo','Alonso','G.Alonso@caece.edu.ar',1,'2015-08-11 18:30:56'),(6,'Fabian','Altieri','ltieri@caece.edu.ar',1,'2015-08-11 18:30:56'),(7,'Claudio','Amador Rodriguez','madorRodriguez@caece.edu.ar',1,'2015-08-11 18:30:56'),(8,' Sergio Gabriel','Amitrano','Sergio.Gabriel.Amitrano@caece.edu.ar',1,'2015-08-11 18:30:56'),(9,'Oscar','Andorno','O.Andorno@caece.edu.ar',1,'2015-08-11 18:30:56'),(10,'Nora','Andrade','ndrade@caece.edu.ar',1,'2015-08-11 18:30:56'),(11,'Nadia','Andreau','ndreau@caece.edu.ar',1,'2015-08-11 18:30:56'),(12,' Jorge Daniel','Antoniotti','Jorge.Daniel.Antoniotti@caece.edu.ar',1,'2015-08-11 18:30:56'),(13,'Graciela','Anzivino','G.Anzivino@caece.edu.ar',1,'2015-08-11 18:30:56'),(14,'Sergio','Apesteguia','S.Apesteguia@caece.edu.ar',1,'2015-08-11 18:30:56'),(15,'Damian','Atar','D.Atar@caece.edu.ar',1,'2015-08-11 18:30:56'),(16,'German','Badaloni Fernandez','G.Badaloni.Fernandez@caece.edu.ar',1,'2015-08-11 18:30:56'),(17,'Liliana Maria','Balboa','Liliana.Maria.Balboa@caece.edu.ar',1,'2015-08-11 18:30:56'),(18,'Ricardo','Barca','Ricardo.Barca@caece.edu.ar',1,'2015-08-11 18:30:56'),(19,'Erik','Barreto','E.Barreto@caece.edu.ar',1,'2015-08-11 18:30:56'),(20,'Hernan','Bedorrou Garcia','Bedorrou.Garcia@caece.edu.ar',1,'2015-08-11 18:30:56'),(21,'Federico','Blanco','F.Blanco@caece.edu.ar',1,'2015-08-11 18:30:56'),(22,'Diego','Boggetti ','Boggetti.@caece.edu.ar',1,'2015-08-11 18:30:56'),(23,'Hernan Diego','Bosco','Hernan.Diego.Bosco@caece.edu.ar',1,'2015-08-11 18:30:56'),(24,'Maria Candela','Bracalente','Maria.Candela.Bracalente@caece.edu.ar',1,'2015-08-11 18:30:56'),(25,'Maria Fernanda','Braica','Maria.Fernanda.Braica@caece.edu.ar',1,'2015-08-11 18:30:56'),(26,'Gustavo','Bravin','Bravin@caece.edu.ar',1,'2015-08-11 18:30:56'),(27,'Andres','Broitman Buzarquis Garcia','A.Broitman.Buzarquis.Garcia@caece.edu.ar',1,'2015-08-11 18:30:56'),(28,'Andres','Buchner','A.Buchner@caece.edu.ar',1,'2015-08-11 18:30:56'),(29,'Alejandro Gabrie','Buonomo','Alejandro.Gabrie.Buonomo@caece.edu.ar',1,'2015-08-11 18:30:56'),(30,'Agustina','Buzarquis Garcia','A.Buzarquis.Garcia@caece.edu.ar',1,'2015-08-11 18:30:56'),(31,'Alumno','Test','alumno.test@caece.edu.ar',1,'2015-09-01 03:28:45'),(32,'Admin','Test','Admin.test@caece.edu.ar',1,'2015-08-11 18:30:56'),(33,'sasrassa','sasa','aassa@saddf.com',1,'2015-08-23 21:00:08'),(34,'seguridad','seguridada','asss@asas.com',1,'2015-08-23 23:32:34'),(35,'Alumno2','Test','Alumno@test.com.ar',1,'2015-09-01 03:36:20'),(36,'Alumno3','Test','Alumno3@mail.com.ar',1,'2015-09-01 03:37:17');
/*!40000 ALTER TABLE `persona` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `id_role` int(10) NOT NULL AUTO_INCREMENT,
  `role` varchar(100) NOT NULL,
  `activo` tinyint(1) NOT NULL DEFAULT '1',
  `fecsys` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_role`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'administrador',1,'2015-08-20 02:37:33'),(2,'docente',1,'2015-08-20 02:37:54'),(3,'alumno',1,'2015-08-20 02:37:54'),(4,'seguridad',1,'2015-08-20 02:37:54');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!50001 DROP VIEW IF EXISTS `roles`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `roles` (
  `id_usuario` tinyint NOT NULL,
  `user` tinyint NOT NULL,
  `pass` tinyint NOT NULL,
  `activo` tinyint NOT NULL,
  `rol` tinyint NOT NULL,
  `id_persona` tinyint NOT NULL,
  `id_alu_doc` tinyint NOT NULL,
  `permiso` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `seguridad`
--

DROP TABLE IF EXISTS `seguridad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seguridad` (
  `id_seguridad` int(10) NOT NULL AUTO_INCREMENT,
  `mayusculas` int(10) NOT NULL DEFAULT '0',
  `minusculas` int(10) NOT NULL DEFAULT '0',
  `especiales` int(10) NOT NULL DEFAULT '0',
  `longMinima` int(10) NOT NULL DEFAULT '0',
  `activo` tinyint(1) NOT NULL DEFAULT '1',
  `fesys` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `numeros` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_seguridad`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seguridad`
--

LOCK TABLES `seguridad` WRITE;
/*!40000 ALTER TABLE `seguridad` DISABLE KEYS */;
INSERT INTO `seguridad` VALUES (1,1,1,1,5,1,'2015-08-24 02:58:24',1);
/*!40000 ALTER TABLE `seguridad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_notificacion`
--

DROP TABLE IF EXISTS `tipo_notificacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_notificacion` (
  `idTipoNotificacion` int(11) NOT NULL,
  `descripcion` varchar(45) NOT NULL,
  `activo` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`idTipoNotificacion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Se alojaran los tipos de notificaciones';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_notificacion`
--

LOCK TABLES `tipo_notificacion` WRITE;
/*!40000 ALTER TABLE `tipo_notificacion` DISABLE KEYS */;
INSERT INTO `tipo_notificacion` VALUES (1,'Solicitud alta curso',1),(2,'Nuevo archivo subido',1),(3,'Solicitud Confirmada',1),(4,'Solicitud Rechazada',1);
/*!40000 ALTER TABLE `tipo_notificacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tp_entrega`
--

DROP TABLE IF EXISTS `tp_entrega`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tp_entrega` (
  `idtp_entrega` int(11) NOT NULL AUTO_INCREMENT,
  `idtp_grupo` int(11) NOT NULL,
  `id_archivo` int(11) NOT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  `fecsys` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `activo` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`idtp_entrega`),
  KEY `fk_tp_grupo_idx` (`idtp_grupo`),
  KEY `fk_archivo_idx` (`id_archivo`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tp_entrega`
--

LOCK TABLES `tp_entrega` WRITE;
/*!40000 ALTER TABLE `tp_entrega` DISABLE KEYS */;
INSERT INTO `tp_entrega` VALUES (1,4,12,'Entrega 1','2015-08-12 01:26:54',''),(2,4,13,'Entrega 2','2015-08-12 01:29:10',''),(3,5,14,'entrega 3','2015-08-12 01:29:59','');
/*!40000 ALTER TABLE `tp_entrega` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tp_grupo`
--

DROP TABLE IF EXISTS `tp_grupo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tp_grupo` (
  `idtp_grupo` int(11) NOT NULL AUTO_INCREMENT,
  `id_grupo` int(11) NOT NULL,
  `id_archivo` int(11) NOT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  `nota` varchar(30) DEFAULT NULL,
  `fecsys` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `activo` int(11) DEFAULT '1',
  PRIMARY KEY (`idtp_grupo`),
  KEY `fk_grupo_tp_idx` (`id_grupo`),
  KEY `fk_archivo_tp_idx` (`id_archivo`),
  CONSTRAINT `fk_archivo_tp` FOREIGN KEY (`id_archivo`) REFERENCES `archivo` (`id_archivo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_grupo_tp` FOREIGN KEY (`id_grupo`) REFERENCES `grupo` (`id_grupo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tp_grupo`
--

LOCK TABLES `tp_grupo` WRITE;
/*!40000 ALTER TABLE `tp_grupo` DISABLE KEYS */;
INSERT INTO `tp_grupo` VALUES (4,15,10,'TP Numero 1','Aprobado','2015-08-12 01:33:36',1),(5,15,11,'TP Numero 2',NULL,'2015-08-12 01:26:05',1);
/*!40000 ALTER TABLE `tp_grupo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `id_usuario` int(10) NOT NULL AUTO_INCREMENT,
  `user` varchar(255) NOT NULL,
  `pass` varchar(255) NOT NULL,
  `activo` tinyint(1) NOT NULL DEFAULT '1',
  `fecsys` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id_persona` int(10) DEFAULT NULL,
  `id_role` int(10) DEFAULT NULL,
  `id_permiso` int(10) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_usuario`),
  UNIQUE KEY `user_UNIQUE` (`user`),
  KEY `fk_usuario_persona1` (`id_persona`),
  KEY `fk_usuario_role_idx` (`id_role`),
  CONSTRAINT `fk_usuario_persona1` FOREIGN KEY (`id_persona`) REFERENCES `persona` (`id_persona`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuario_role` FOREIGN KEY (`id_role`) REFERENCES `role` (`id_role`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (5,'repo','0c267daf663b5caca2036ae9a3f05e6432e97a56',1,'2014-01-08 03:00:00',2,2,1),(6,'alumno','acc00dce8622b05645d97f1a11111eec6b12dcb0',1,'2014-09-21 01:28:39',31,3,1),(7,'admin','294b81569ea0d3b72d39290df36c68412ee33e9b',1,'2014-09-21 01:36:06',32,1,1),(8,'doc','1fe437a42e34c3c3d4dfe02b2528a14b6128e0a9',1,'2014-11-01 16:52:13',4,2,1),(9,'seg','b6fcc775cf6257a149dd47b83c2a354bcba2db17',1,'2015-08-23 21:00:08',33,4,1),(10,'seguridad','74d8048fae5866ec6197033bb864423e738eff6a',1,'2015-08-23 23:32:34',34,4,1),(11,'alumno2','360c0c0d9f7579ce640bc7bd6e3693074377bf7b',1,'2015-09-01 03:36:20',35,3,1),(12,'alumno3','c9b0f586ccc6519cab0538be9626b495f57d43b4',1,'2015-09-01 03:37:17',36,3,1);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario_parametro`
--

DROP TABLE IF EXISTS `usuario_parametro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario_parametro` (
  `id_usuario_parametro` int(10) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(10) NOT NULL,
  `id_parametro` int(10) NOT NULL,
  `orden` int(10) NOT NULL DEFAULT '1',
  `color` int(10) NOT NULL DEFAULT '1',
  `fesys` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `activo` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_usuario_parametro`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario_parametro`
--

LOCK TABLES `usuario_parametro` WRITE;
/*!40000 ALTER TABLE `usuario_parametro` DISABLE KEYS */;
INSERT INTO `usuario_parametro` VALUES (7,8,11,2,3,'2015-08-24 02:50:36',1),(8,8,12,1,3,'2015-08-24 22:46:04',1),(9,8,13,3,1,'2015-08-22 22:37:37',1),(10,8,14,4,1,'2015-08-22 22:37:37',1),(11,8,15,5,2,'2015-08-24 22:38:35',0),(17,6,16,1,1,'2015-08-22 22:40:56',1),(18,6,17,2,1,'2015-08-25 00:36:22',0),(19,6,18,3,1,'2015-08-22 22:40:56',1),(20,6,19,4,1,'2015-08-22 22:40:56',1),(21,6,20,5,1,'2015-08-25 00:36:16',1),(37,5,11,1,1,'2015-08-27 16:38:02',1),(38,5,12,2,1,'2015-08-27 16:38:03',1),(39,5,13,3,1,'2015-08-27 16:38:03',1),(40,5,14,4,1,'2015-08-27 16:38:03',1),(41,5,15,5,1,'2015-08-27 16:38:03',1),(42,7,1,1,1,'2015-08-27 16:38:37',1),(43,7,2,2,1,'2015-08-27 16:38:37',1),(44,7,7,3,1,'2015-08-27 16:38:37',1),(45,7,8,4,1,'2015-08-27 16:38:37',1),(46,7,9,5,1,'2015-08-27 16:38:37',1),(47,7,10,6,1,'2015-08-27 16:38:37',1),(48,11,16,1,1,'2015-09-01 03:36:20',1),(49,11,17,2,1,'2015-09-01 03:36:20',1),(50,11,18,3,1,'2015-09-01 03:36:20',1),(51,11,19,4,1,'2015-09-01 03:36:20',1),(52,11,20,5,1,'2015-09-01 03:36:20',1),(53,12,16,1,1,'2015-09-01 03:37:18',1),(54,12,17,2,1,'2015-09-01 03:37:18',1),(55,12,18,3,1,'2015-09-01 03:37:18',1),(56,12,19,4,1,'2015-09-01 03:37:18',1),(57,12,20,5,1,'2015-09-01 03:37:18',1);
/*!40000 ALTER TABLE `usuario_parametro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `vw_archivos`
--

DROP TABLE IF EXISTS `vw_archivos`;
/*!50001 DROP VIEW IF EXISTS `vw_archivos`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_archivos` (
  `id_archivo` tinyint NOT NULL,
  `nombre` tinyint NOT NULL,
  `descripcion` tinyint NOT NULL,
  `fecha_despublicacion` tinyint NOT NULL,
  `fecha_publicacion` tinyint NOT NULL,
  `id_tipo` tinyint NOT NULL,
  `fecsys` tinyint NOT NULL,
  `activo` tinyint NOT NULL,
  `estado` tinyint NOT NULL,
  `path` tinyint NOT NULL,
  `persona_id_persona` tinyint NOT NULL,
  `id_curso` tinyint NOT NULL,
  `Tags` tinyint NOT NULL,
  `tipoArchivo` tinyint NOT NULL,
  `estadoArchivo` tinyint NOT NULL,
  `Curso` tinyint NOT NULL,
  `descripcionCurso` tinyint NOT NULL,
  `id_docente` tinyint NOT NULL,
  `id_materia` tinyint NOT NULL,
  `nombreDocente` tinyint NOT NULL,
  `apellidoDocente` tinyint NOT NULL,
  `materia` tinyint NOT NULL,
  `nombrePersona` tinyint NOT NULL,
  `apellidoPersona` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `roles`
--

/*!50001 DROP TABLE IF EXISTS `roles`*/;
/*!50001 DROP VIEW IF EXISTS `roles`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `roles` AS select `u`.`id_usuario` AS `id_usuario`,`u`.`user` AS `user`,`u`.`pass` AS `pass`,`u`.`activo` AS `activo`,`r`.`role` AS `rol`,`p`.`id_persona` AS `id_persona`,`a`.`id_docente` AS `id_alu_doc`,`u`.`id_permiso` AS `permiso` from (((`usuario` `u` join `persona` `p` on((`p`.`id_persona` = `u`.`id_persona`))) join `docente` `a` on(((`a`.`id_persona` = `p`.`id_persona`) and (`a`.`activo` = 1)))) join `role` `r` on((`r`.`id_role` = `u`.`id_role`))) union select `u`.`id_usuario` AS `id_usuario`,`u`.`user` AS `user`,`u`.`pass` AS `pass`,`u`.`activo` AS `activo`,`r`.`role` AS `rol`,`p`.`id_persona` AS `id_persona`,`a`.`id_alumno` AS `id_alu_doc`,`u`.`id_permiso` AS `permiso` from (((`usuario` `u` join `persona` `p` on((`p`.`id_persona` = `u`.`id_persona`))) join `alumno` `a` on(((`a`.`id_persona` = `p`.`id_persona`) and (`a`.`activo` = 1)))) join `role` `r` on((`r`.`id_role` = `u`.`id_role`))) union select `u`.`id_usuario` AS `id_usuario`,`u`.`user` AS `user`,`u`.`pass` AS `pass`,`u`.`activo` AS `activo`,`r`.`role` AS `rol`,`u`.`id_persona` AS `id_persona`,`u`.`id_usuario` AS `id_alu_doc`,`u`.`id_permiso` AS `permiso` from (`usuario` `u` join `role` `r` on((`r`.`id_role` = `u`.`id_role`))) where ((not(`u`.`id_persona` in (select `alumno`.`id_persona` AS `id_persona` from `alumno` where (`alumno`.`activo` = 1)))) and (not(`u`.`id_persona` in (select `docente`.`id_persona` AS `id_persona` from `docente` where (`docente`.`activo` = 1)))) and (`u`.`activo` = 1)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_archivos`
--

/*!50001 DROP TABLE IF EXISTS `vw_archivos`*/;
/*!50001 DROP VIEW IF EXISTS `vw_archivos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_archivos` AS select `a`.`id_archivo` AS `id_archivo`,`a`.`nombre` AS `nombre`,`a`.`descripcion` AS `descripcion`,`a`.`fecha_despublicacion` AS `fecha_despublicacion`,`a`.`fecha_publicacion` AS `fecha_publicacion`,`a`.`id_tipo` AS `id_tipo`,`a`.`fecsys` AS `fecsys`,`a`.`activo` AS `activo`,`a`.`estado` AS `estado`,`a`.`path` AS `path`,`a`.`persona_id_persona` AS `persona_id_persona`,`a`.`id_curso` AS `id_curso`,`a`.`Tags` AS `Tags`,`t`.`nombre` AS `tipoArchivo`,`e`.`nombre` AS `estadoArchivo`,`c`.`nombre` AS `Curso`,`c`.`descripcion` AS `descripcionCurso`,`c`.`id_docente` AS `id_docente`,`c`.`id_materia` AS `id_materia`,`p`.`nombre` AS `nombreDocente`,`p`.`apellido` AS `apellidoDocente`,`m`.`nombre` AS `materia`,`pe`.`nombre` AS `nombrePersona`,`pe`.`apellido` AS `apellidoPersona` from (((((((`archivo` `a` join `estado` `e` on((`e`.`id_estado` = `a`.`estado`))) join `archivo_tipo` `t` on((`t`.`id_tipo` = `a`.`id_tipo`))) join `curso` `c` on((`c`.`id_curso` = `a`.`id_curso`))) join `docente` `d` on((`d`.`id_docente` = `c`.`id_docente`))) join `persona` `p` on((`p`.`id_persona` = `d`.`id_persona`))) join `materia` `m` on((`m`.`id_materia` = `c`.`id_materia`))) join `persona` `pe` on((`pe`.`id_persona` = `a`.`persona_id_persona`))) */;
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

-- Dump completed on 2015-09-01  0:45:48
