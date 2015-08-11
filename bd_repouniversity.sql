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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alumno`
--

LOCK TABLES `alumno` WRITE;
/*!40000 ALTER TABLE `alumno` DISABLE KEYS */;
INSERT INTO `alumno` VALUES (1,31,1,'2015-08-11 18:42:12',1);
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
INSERT INTO `alumno_curso` VALUES (1,6,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `archivo`
--

LOCK TABLES `archivo` WRITE;
/*!40000 ALTER TABLE `archivo` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `archivo_tipo`
--

LOCK TABLES `archivo_tipo` WRITE;
/*!40000 ALTER TABLE `archivo_tipo` DISABLE KEYS */;
INSERT INTO `archivo_tipo` VALUES (1,'Word','2014-04-14 20:04:21',1),(2,'PDF','2014-04-14 20:04:31',1),(3,'Excel','2014-04-14 20:04:39',1),(4,'Imagem','2014-04-14 20:04:39',1);
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comentario`
--

LOCK TABLES `comentario` WRITE;
/*!40000 ALTER TABLE `comentario` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `curso`
--

LOCK TABLES `curso` WRITE;
/*!40000 ALTER TABLE `curso` DISABLE KEYS */;
INSERT INTO `curso` VALUES (6,'Algebra','P-400','Algebra 2015',NULL,1,'2015-08-11 19:01:17',4,6);
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
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `docente`
--

LOCK TABLES `docente` WRITE;
/*!40000 ALTER TABLE `docente` DISABLE KEYS */;
INSERT INTO `docente` VALUES (1,1,1,'2015-08-11 18:46:39'),(2,2,1,'2015-08-11 18:46:39'),(3,3,1,'2015-08-11 18:46:39'),(4,4,1,'2015-08-11 18:46:39'),(5,5,1,'2015-08-11 18:46:39'),(6,6,1,'2015-08-11 18:46:39'),(7,7,1,'2015-08-11 18:46:39'),(8,8,1,'2015-08-11 18:46:39'),(9,9,1,'2015-08-11 18:46:39'),(10,10,1,'2015-08-11 18:46:39'),(11,11,1,'2015-08-11 18:46:39'),(12,12,1,'2015-08-11 18:46:39'),(13,13,1,'2015-08-11 18:46:39'),(14,14,1,'2015-08-11 18:46:39'),(15,15,1,'2015-08-11 18:46:39'),(16,16,1,'2015-08-11 18:46:39'),(17,17,1,'2015-08-11 18:46:39'),(18,18,1,'2015-08-11 18:46:39'),(19,19,1,'2015-08-11 18:46:39'),(20,20,1,'2015-08-11 18:46:39'),(21,21,1,'2015-08-11 18:46:39'),(22,22,1,'2015-08-11 18:46:39'),(23,23,1,'2015-08-11 18:46:39'),(24,24,1,'2015-08-11 18:46:39'),(25,25,1,'2015-08-11 18:46:39'),(26,26,1,'2015-08-11 18:46:39'),(27,27,1,'2015-08-11 18:46:39'),(28,28,1,'2015-08-11 18:46:39'),(29,29,1,'2015-08-11 18:46:39'),(30,30,1,'2015-08-11 18:46:39');
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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grupo`
--

LOCK TABLES `grupo` WRITE;
/*!40000 ALTER TABLE `grupo` DISABLE KEYS */;
INSERT INTO `grupo` VALUES (1,'Sin Grupo',1,'2014-04-14 19:35:53');
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
INSERT INTO `materia` VALUES (1,'Fundamentos de la matemAtica','Lic. en Matematica -  Fundamentos de la matemAtica',1,'2015-08-11 18:37:07'),(2,'AdministraciOn de empresas de servicios','Lic. en Turismo - AdministraciOn de empresas de servicios',1,'2015-08-11 18:37:07'),(3,'AdministraciOn Financiera','Lic. en Turismo - AdministraciOn Financiera',1,'2015-08-11 18:37:07'),(4,'AdministraciOn Financiera','Lic. en Admin. Negocios - AdministraciOn Financiera',1,'2015-08-11 18:37:07'),(5,'Agenda internacional','Lic. en Turismo - Agenda internacional',1,'2015-08-11 18:37:07'),(6,'Algebra','Lic. en Sistemas - Algebra',1,'2015-08-11 18:37:07'),(7,'Algebra lineal','Lic. en Matematica - Algebra lineal',1,'2015-08-11 18:37:07'),(8,'Algebra ','Lic. en Matematica - Algebra ',1,'2015-08-11 18:37:07'),(9,'Algoritmos y Estructuras de datos I','Lic. en Sistemas - Algoritmos y Estructuras de datos I',1,'2015-08-11 18:37:07'),(10,'Algoritmos y estructuras de datos I','Lic. en Matematica - Algoritmos y estructuras de datos I',1,'2015-08-11 18:37:07'),(11,'Algoritmos y Estructuras de datos II','Lic. en Sistemas - Algoritmos y Estructuras de datos II',1,'2015-08-11 18:37:07'),(12,'AnAlisis EconOmico','Lic. en Admin. Negocios - AnAlisis EconOmico',1,'2015-08-11 18:37:07'),(13,'AnAlisis Funcional','Lic. en Matematica - AnAlisis Funcional',1,'2015-08-11 18:37:07'),(14,'AnAlisis vectorial','Lic. en Matematica - AnAlisis vectorial',1,'2015-08-11 18:37:07'),(15,'Arquitectura Avanzada','Lic. en Sistemas - Arquitectura Avanzada',1,'2015-08-11 18:37:07'),(16,'Arquitectura de computadores','Lic. en Sistemas - Arquitectura de computadores',1,'2015-08-11 18:37:07'),(17,'Arquitectura Web','Lic. en Sistemas - Arquitectura Web',1,'2015-08-11 18:37:07'),(18,'Aspectos profesionales para IngenierIa','Lic. en Sistemas - Aspectos profesionales para IngenierIa',1,'2015-08-11 18:37:07'),(19,'Auditoria y Seguridad InformAtica','Lic. en Sistemas - Auditoria y Seguridad InformAtica',1,'2015-08-11 18:37:07'),(20,'Base de datos I','Lic. en Sistemas - Base de datos I',1,'2015-08-11 18:37:07'),(21,'Base de datos II','Lic. en Sistemas - Base de datos II',1,'2015-08-11 18:37:07'),(22,'CAlculo en una variable','Lic. en Sistemas - CAlculo en una variable',1,'2015-08-11 18:37:07'),(23,'CAlculo en una variable','Lic. en Matematica - CAlculo en una variable',1,'2015-08-11 18:37:07'),(24,'CAlculo en varias variables','Lic. en Sistemas - CAlculo en varias variables',1,'2015-08-11 18:37:07'),(25,'CAlculo en varias variables','Lic. en Matematica - CAlculo en varias variables',1,'2015-08-11 18:37:07'),(26,'CAlculo numErico','Lic. en Matematica - CAlculo numErico',1,'2015-08-11 18:37:07'),(27,'ComercializaciOn','Lic. en Admin. Negocios - ComercializaciOn',1,'2015-08-11 18:37:07'),(28,'Contabilidad','Lic. en Turismo - Contabilidad',1,'2015-08-11 18:37:07'),(29,'Contabilidad','Lic. en Admin. Negocios - Contabilidad',1,'2015-08-11 18:37:07'),(30,'Contabilidad Gerencial','Lic. en Admin. Negocios - Contabilidad Gerencial',1,'2015-08-11 18:37:07'),(31,'Contratos Civiles y Comerciales anual','ABOGACIA - Contratos Civiles y Comerciales anual',1,'2015-08-11 18:37:07'),(32,'Costos','Lic. en Turismo - Costos',1,'2015-08-11 18:37:07'),(33,'Costos y Control Presupuestario','Lic. en Admin. Negocios - Costos y Control Presupuestario',1,'2015-08-11 18:37:07'),(34,'Derecho Civil y Comercial','Lic. en Admin. Negocios - Derecho Civil y Comercial',1,'2015-08-11 18:37:07'),(35,'Derecho Constitucional','ABOGACIA - Derecho constitucional',1,'2015-08-11 18:37:07'),(36,'Derecho Constitucional y Administrativo','Lic. en Admin. Negocios - Derecho Constitucional y Administrativo',1,'2015-08-11 18:37:07'),(37,'Derecho de Familia y Sucesiones','ABOGACIA - Derecho de Familia y Sucesiones',1,'2015-08-11 18:37:07'),(38,'Derecho del Trabajo y de la Seguridad Social','ABOGACIA - Derecho del Trabajo y de la Seguridad Social',1,'2015-08-11 18:37:07'),(39,'Derecho Empresarial','ABOGACIA - Derecho Empresarial',1,'2015-08-11 18:37:07'),(40,'Derecho Notarial, Registral e Inmobiliario','ABOGACIA - Derecho Notarial, Registral e Inmobiliario',1,'2015-08-11 18:37:07'),(41,'Derecho Penal','ABOGACIA - Derecho Penal',1,'2015-08-11 18:37:07'),(42,'Derecho Privado','ABOGACIA - Derecho Privado',1,'2015-08-11 18:37:07'),(43,'Derecho PUblico','ABOGACIA - Derecho PUblico',1,'2015-08-11 18:37:07'),(44,'Derecho Tributario','ABOGACIA - Derecho Tributario',1,'2015-08-11 18:37:07'),(45,'Derechos Humanos y GarantIas','ABOGACIA - Derechos Humanos y GarantIas',1,'2015-08-11 18:37:07'),(46,'Desarrollo de un Proyecto de Negocios','Lic. en Admin. Negocios - Desarrollo de un Proyecto de Negocios',1,'2015-08-11 18:37:07'),(47,'DirecciOn estratEgica','Lic. en Sistemas - DirecciOn estratEgica',1,'2015-08-11 18:37:07'),(48,'DirecciOn General','Lic. en Admin. Negocios - DirecciOn General',1,'2015-08-11 18:37:07'),(49,'EconomIa','Lic. en Sistemas - EconomIa',1,'2015-08-11 18:37:07'),(50,'EconomIa de Empresas','Lic. en Admin. Negocios - EconomIa de Empresas',1,'2015-08-11 18:37:07'),(51,'EconomIa Internacional','Lic. en Admin. Negocios - EconomIa Internacional',1,'2015-08-11 18:37:07'),(52,'Ecuaciones diferenciales en derivadas parciales','Lic. en Matematica - Ecuaciones diferenciales en derivadas parciales',1,'2015-08-11 18:37:07'),(53,'Ecuaciones diferenciales ordinarias','Lic. en Matematica - Ecuaciones diferenciales ordinarias',1,'2015-08-11 18:37:07'),(54,'Elementos de Algebra','Lic. en Admin. Negocios - Elementos de Algebra',1,'2015-08-11 18:37:07'),(55,'Elementos de AnAlisis EconOmico y Financiero  ','ABOGACIA - Elementos de AnAlisis EconOmico y Financiero  ',1,'2015-08-11 18:37:07'),(56,'Elementos de AnAlisis MatemAtico','Lic. en Admin. Negocios - Elementos de AnAlisis MatemAtico',1,'2015-08-11 18:37:07'),(57,'Elementos de Derecho Administrativo','ABOGACIA - Elementos de Derecho Administrativo',1,'2015-08-11 18:37:07'),(58,'Elementos de Derecho Civil','ABOGACIA - Elementos de Derecho Civil',1,'2015-08-11 18:37:07'),(59,'Elementos de Derecho Comercial','ABOGACIA - Elementos de Derecho Comercial',1,'2015-08-11 18:37:07'),(60,'Elementos de Derecho Constitucional','ABOGACIA - Elementos de Derecho Constitucional',1,'2015-08-11 18:37:07'),(61,'Elementos de Derecho del Trabajo y de la','ABOGACIA - Elementos de Derecho del Trabajo y de la',1,'2015-08-11 18:37:07'),(62,'Elementos de Derecho Penal y de Procesal Penal anual','ABOGACIA - Elementos de Derecho Penal y de Procesal Penal anual',1,'2015-08-11 18:37:07'),(63,'Elementos de Derecho Procesal Civil y Comercial','ABOGACIA - Elementos de Derecho Procesal Civil y Comercial',1,'2015-08-11 18:37:07'),(64,'Elementos de Derechos Reales','ABOGACIA - Elementos de Derechos Reales',1,'2015-08-11 18:37:07'),(65,'Espacios mEtricos y topolOgicos','Lic. en Matematica - Espacios mEtricos y topolOgicos',1,'2015-08-11 18:37:07'),(66,'EstadIstica aplicada','Lic. en Turismo - EstadIstica aplicada',1,'2015-08-11 18:37:07'),(67,'EstadIstica II','Lic. en Matematica - EstadIstica II',1,'2015-08-11 18:37:07'),(68,'Estrategia Competitiva','Lic. en Turismo - Estrategia Competitiva',1,'2015-08-11 18:37:07'),(69,'Estrategia Competitiva','Lic. en Admin. Negocios - Estrategia Competitiva',1,'2015-08-11 18:37:07'),(70,'Estructura y Procedimientos de las Organizaciones','Lic. en Admin. Negocios - Estructura y Procedimientos de las Organizaciones',1,'2015-08-11 18:37:07'),(71,'Estructuras algebraicas I','Lic. en Matematica - Estructuras algebraicas I',1,'2015-08-11 18:37:07'),(72,'Estructuras algebraicas II','Lic. en Matematica - Estructuras algebraicas II',1,'2015-08-11 18:37:07'),(73,'Estructuras algebraicas III','Lic. en Matematica - Estructuras algebraicas III',1,'2015-08-11 18:37:07'),(74,'Etica en los Negocios','Lic. en Admin. Negocios - Etica en los Negocios',1,'2015-08-11 18:37:07'),(75,'Etica profesional','Lic. en Turismo - Etica profesional',1,'2015-08-11 18:37:07'),(76,'FIsica I','Lic. en Sistemas - FIsica I',1,'2015-08-11 18:37:07'),(77,'FIsica II','Lic. en Sistemas - FIsica II',1,'2015-08-11 18:37:07'),(78,'FormulaciOn y EvaluaciOn de proyectos','Lic. en Turismo - FormulaciOn y EvaluaciOn de proyectos',1,'2015-08-11 18:37:07'),(79,'Funciones reales','Lic. en Matematica - Funciones reales',1,'2015-08-11 18:37:07'),(80,'Fundamentos de administraciOn','Lic. en Turismo - Fundamentos de administraciOn',1,'2015-08-11 18:37:07'),(81,'Fundamentos de AdministraciOn','Lic. en Admin. Negocios - Fundamentos de AdministraciOn',1,'2015-08-11 18:37:07'),(82,'Fundamentos de anAlisis','Lic. en Matematica - Fundamentos de anAlisis',1,'2015-08-11 18:37:07'),(83,'Fundamentos de comunicaciOn','Lic. en Sistemas - Fundamentos de comunicaciOn',1,'2015-08-11 18:37:07'),(84,'GeografIa TurIstica I','Lic. en Turismo - GeografIa TurIstica I',1,'2015-08-11 18:37:07'),(85,'GeografIa turIstica II','Lic. en Turismo - GeografIa turIstica II',1,'2015-08-11 18:37:07'),(86,'GeografIa turIstica III','Lic. en Turismo - GeografIa turIstica III',1,'2015-08-11 18:37:07'),(87,'GeografIa y Patrimonio turIstico','Lic. en Turismo - GeografIa y Patrimonio turIstico',1,'2015-08-11 18:37:07'),(88,'GeometrIa diferencial','Lic. en Matematica - GeometrIa diferencial',1,'2015-08-11 18:37:07'),(89,'GeometrIa I','Lic. en Matematica - GeometrIa I',1,'2015-08-11 18:37:07'),(90,'GeometrIa II','Lic. en Matematica - GeometrIa II',1,'2015-08-11 18:37:07'),(91,'GestiOn Ambiental','Lic. en Sistemas - GestiOn Ambiental',1,'2015-08-11 18:37:07'),(92,'GestiOn de Empresas y Servicios','Lic. en Turismo - GestiOn de Empresas y Servicios',1,'2015-08-11 18:37:07'),(93,'GestiOn de Proyectos y Calidad','Lic. en Sistemas - GestiOn de Proyectos y Calidad',1,'2015-08-11 18:37:07'),(94,'InformAtica','Lic. en Admin. Negocios - InformAtica',1,'2015-08-11 18:37:07'),(95,'Informatica aplicada','Lic. en Turismo - Informatica aplicada',1,'2015-08-11 18:37:07'),(96,'IngenierIa del Software I','Lic. en Sistemas - IngenierIa del Software I',1,'2015-08-11 18:37:07'),(97,'IngenierIa del Software II','Lic. en Sistemas - IngenierIa del Software II',1,'2015-08-11 18:37:07'),(98,'InglEs I','Lic. en Turismo - InglEs I',1,'2015-08-11 18:37:07'),(99,'InglEs II','Lic. en Turismo - InglEs II',1,'2015-08-11 18:37:07'),(100,'InglEs III','Lic. en Turismo - InglEs III',1,'2015-08-11 18:37:07'),(101,'Inteligencia de Negocios','Lic. en Sistemas - Inteligencia de Negocios',1,'2015-08-11 18:37:07'),(102,'IntroducciOn a la informAtica','Lic. en Sistemas - IntroducciOn a la informAtica',1,'2015-08-11 18:37:07'),(103,'IntroducciOn a la InformAtica','Lic. en Matematica - IntroducciOn a la InformAtica',1,'2015-08-11 18:37:07'),(104,'IntroducciOn a la matemAtica','Lic. en Sistemas - IntroducciOn a la matemAtica',1,'2015-08-11 18:37:07'),(105,'IntroducciOn a la MatemAtica','Lic. en Matematica - IntroducciOn a la MatemAtica',1,'2015-08-11 18:37:07'),(106,'IntroducciOn al Turismo y la HotelerIa','Lic. en Turismo - IntroducciOn al Turismo y la HotelerIa',1,'2015-08-11 18:37:07'),(107,'Juego de Empresas','Lic. en Admin. Negocios - Juego de Empresas',1,'2015-08-11 18:37:07'),(108,'LegislaciOn aplicada','Lic. en Turismo - LegislaciOn aplicada',1,'2015-08-11 18:37:07'),(109,'Lenguajes de programaciOn','Lic. en Sistemas - Lenguajes de programaciOn',1,'2015-08-11 18:37:07'),(110,'Lenguajes Formales','Lic. en Sistemas - Lenguajes Formales',1,'2015-08-11 18:37:07'),(111,'Liderazgo y NegociaciOn','Lic. en Admin. Negocios - Liderazgo y NegociaciOn',1,'2015-08-11 18:37:07'),(112,'LOgica','Lic. en Matematica - LOgica',1,'2015-08-11 18:37:07'),(113,'Marketing turIstico y hotelero','Lic. en Turismo - Marketing turIstico y hotelero',1,'2015-08-11 18:37:07'),(114,'MatemAtica Discreta','Lic. en Sistemas - MatemAtica Discreta',1,'2015-08-11 18:37:07'),(115,'MatemAtica Discreta','Lic. en Matematica - MatemAtica Discreta',1,'2015-08-11 18:37:07'),(116,'Mercado de Capitales','Lic. en Admin. Negocios - Mercado de Capitales',1,'2015-08-11 18:37:07'),(117,'MetodologIa y tEcnica de la investigaciOn','Lic. en Turismo - MetodologIa y tEcnica de la investigaciOn',1,'2015-08-11 18:37:07'),(118,'Modelos y SimulaciOn','Lic. en Sistemas - Modelos y SimulaciOn',1,'2015-08-11 18:37:07'),(119,'Negocios en Internet','Lic. en Admin. Negocios - Negocios en Internet',1,'2015-08-11 18:37:07'),(120,'Obligaciones Civiles y Comerciales','ABOGACIA - Obligaciones Civiles y Comerciales',1,'2015-08-11 18:37:07'),(121,'OrganizaciOn de empresas turIsticas','Lic. en Turismo - OrganizaciOn de empresas turIsticas',1,'2015-08-11 18:37:07'),(122,'OrganizaciOn para el Comercio Exterior','Lic. en Admin. Negocios - OrganizaciOn para el Comercio Exterior',1,'2015-08-11 18:37:07'),(123,'Patrimonio Turistico I','Lic. en Turismo - Patrimonio Turistico I',1,'2015-08-11 18:37:07'),(124,'Patrimonio TurIstico II','Lic. en Turismo - Patrimonio TurIstico II',1,'2015-08-11 18:37:07'),(125,'Patrimonio turIstico III','Lic. en Turismo - Patrimonio turIstico III',1,'2015-08-11 18:37:07'),(126,'Planeamiento a Largo Plazo y Estudio de Factibilidad','Lic. en Admin. Negocios - Planeamiento a Largo Plazo y Estudio de Factibilidad',1,'2015-08-11 18:37:07'),(127,'PlanificaciOn TurIstica','Lic. en Turismo - PlanificaciOn TurIstica',1,'2015-08-11 18:37:07'),(128,'Politica turIstica','Lic. en Turismo - Politica turIstica',1,'2015-08-11 18:37:07'),(129,'PortuguEs I','Lic. en Turismo - PortuguEs I',1,'2015-08-11 18:37:07'),(130,'PortuguEs II','Lic. en Turismo - PortuguEs II',1,'2015-08-11 18:37:07'),(131,'PrActica Profesional Supervisada (*)','Lic. en Sistemas - PrActica Profesional Supervisada (*)',1,'2015-08-11 18:37:07'),(132,'Principios de economIa','Lic. en Turismo - Principios de economIa',1,'2015-08-11 18:37:07'),(133,'Probabilidades y estadIstica','Lic. en Sistemas - Probabilidades y estadIstica',1,'2015-08-11 18:37:07'),(134,'Probabilidades y estadIstica','Lic. en Matematica - Probabilidades y estadIstica',1,'2015-08-11 18:37:07'),(135,'Probabilidades y EstadIstica','Lic. en Admin. Negocios - Probabilidades y EstadIstica',1,'2015-08-11 18:37:07'),(136,'ProgramaciOn de servicios turIsticos','Lic. en Turismo - ProgramaciOn de servicios turIsticos',1,'2015-08-11 18:37:07'),(137,'Proyecto Final de IngenierIa I','Lic. en Sistemas - Proyecto Final de IngenierIa I',1,'2015-08-11 18:37:07'),(138,'Proyecto Final de IngenierIa II','Lic. en Sistemas - Proyecto Final de IngenierIa II',1,'2015-08-11 18:37:07'),(139,'PsicosociologIa del turismo','Lic. en Turismo - PsicosociologIa del turismo',1,'2015-08-11 18:37:07'),(140,'QuImica','Lic. en Sistemas - QuImica',1,'2015-08-11 18:37:07'),(141,'Recursos humanos','Lic. en Turismo - Recursos humanos',1,'2015-08-11 18:37:07'),(142,'Recursos Humanos','Lic. en Admin. Negocios - Recursos Humanos',1,'2015-08-11 18:37:07'),(143,'REgimen Tributario','Lic. en Admin. Negocios - REgimen Tributario',1,'2015-08-11 18:37:07'),(144,'Seguridad Social','ABOGACIA - Seguridad Social',1,'2015-08-11 18:37:07'),(145,'Seminario','Lic. en Matematica - Seminario',1,'2015-08-11 18:37:07'),(146,'Servicios turIsticos I','Lic. en Turismo - Servicios turIsticos I',1,'2015-08-11 18:37:07'),(147,'Servicios turIsticos II','Lic. en Turismo - Servicios turIsticos II',1,'2015-08-11 18:37:07'),(148,'Sistemas de InformaciOn','Lic. en Admin. Negocios - Sistemas de InformaciOn',1,'2015-08-11 18:37:07'),(149,'Sistemas de informaciOn y organizaciOn','Lic. en Sistemas - Sistemas de informaciOn y organizaciOn',1,'2015-08-11 18:37:07'),(150,'Sistemas de ProducciOn','Lic. en Admin. Negocios - Sistemas de ProducciOn',1,'2015-08-11 18:37:07'),(151,'Sistemas de representaciOn','Lic. en Sistemas - Sistemas de representaciOn',1,'2015-08-11 18:37:07'),(152,'Sistemas Inteligentes','Lic. en Sistemas - Sistemas Inteligentes',1,'2015-08-11 18:37:07'),(153,'Sistemas Operativos I','Lic. en Sistemas - Sistemas Operativos I',1,'2015-08-11 18:37:07'),(154,'Sistemas Operativos II','Lic. en Sistemas - Sistemas Operativos II',1,'2015-08-11 18:37:07'),(155,'Sociedades Civiles y Comerciales','ABOGACIA - Sociedades Civiles y Comerciales',1,'2015-08-11 18:37:07'),(156,'SociologIa','Lic. en Admin. Negocios - SociologIa',1,'2015-08-11 18:37:07'),(157,'Taller: Desarrollo de un proyecto turIstico','Lic. en Turismo - Taller: Desarrollo de un proyecto turIstico',1,'2015-08-11 18:37:07'),(158,'TEcnicas de ComunicaciOn','Lic. en Turismo - TEcnicas de ComunicaciOn',1,'2015-08-11 18:37:07'),(159,'TEcnicas de ComunicaciOn','Lic. en Admin. Negocios - TEcnicas de ComunicaciOn',1,'2015-08-11 18:37:07'),(160,'Teleprocesos y redes I','Lic. en Sistemas - Teleprocesos y redes I',1,'2015-08-11 18:37:07'),(161,'Teleprocesos y redes II','Lic. en Sistemas - Teleprocesos y redes II',1,'2015-08-11 18:37:07'),(162,'TeorIa de Decisiones en Negocios','Lic. en Admin. Negocios - TeorIa de Decisiones en Negocios',1,'2015-08-11 18:37:07'),(163,'TeorIa del Estado','ABOGACIA - TeorIa del Estado',1,'2015-08-11 18:37:07'),(164,'TeorIa del Estado','ABOGACIA - TeorIa del Estado',1,'2015-08-11 18:37:07'),(165,'TeorIa General del Derecho','ABOGACIA - TeorIa General del Derecho',1,'2015-08-11 18:37:07'),(166,'Turismo y Medio ambiente','Lic. en Turismo - Turismo y Medio ambiente',1,'2015-08-11 18:37:07'),(167,'Variable compleja','Lic. en Matematica - Variable compleja',1,'2015-08-11 18:37:07');
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
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1 COMMENT='En esta tabla se alojaran todas las notificaciones del siste';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notificacion`
--

LOCK TABLES `notificacion` WRITE;
/*!40000 ALTER TABLE `notificacion` DISABLE KEYS */;
INSERT INTO `notificacion` VALUES (26,1,6,1,1,'nuevo',0),(27,3,6,1,1,'nuevo',1);
/*!40000 ALTER TABLE `notificacion` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persona`
--

LOCK TABLES `persona` WRITE;
/*!40000 ALTER TABLE `persona` DISABLE KEYS */;
INSERT INTO `persona` VALUES (1,'Maria Claudia','Abeledo','ariaClaudia.Abeledo@caece.edu.ar',1,'2015-08-11 18:30:15'),(2,'Alberto','Acosta','costa@caece.edu.ar',1,'2015-08-11 18:30:56'),(3,'Ariel','Acuña','cuña@caece.edu.ar',1,'2015-08-11 18:30:56'),(4,'Ignacio','Albalustri Chaparro','lbalustriChaparro@caece.edu.ar',1,'2015-08-11 18:30:56'),(5,'Gustavo','Alonso','G.Alonso@caece.edu.ar',1,'2015-08-11 18:30:56'),(6,'Fabian','Altieri','ltieri@caece.edu.ar',1,'2015-08-11 18:30:56'),(7,'Claudio','Amador Rodriguez','madorRodriguez@caece.edu.ar',1,'2015-08-11 18:30:56'),(8,' Sergio Gabriel','Amitrano','Sergio.Gabriel.Amitrano@caece.edu.ar',1,'2015-08-11 18:30:56'),(9,'Oscar','Andorno','O.Andorno@caece.edu.ar',1,'2015-08-11 18:30:56'),(10,'Nora','Andrade','ndrade@caece.edu.ar',1,'2015-08-11 18:30:56'),(11,'Nadia','Andreau','ndreau@caece.edu.ar',1,'2015-08-11 18:30:56'),(12,' Jorge Daniel','Antoniotti','Jorge.Daniel.Antoniotti@caece.edu.ar',1,'2015-08-11 18:30:56'),(13,'Graciela','Anzivino','G.Anzivino@caece.edu.ar',1,'2015-08-11 18:30:56'),(14,'Sergio','Apesteguia','S.Apesteguia@caece.edu.ar',1,'2015-08-11 18:30:56'),(15,'Damian','Atar','D.Atar@caece.edu.ar',1,'2015-08-11 18:30:56'),(16,'German','Badaloni Fernandez','G.Badaloni.Fernandez@caece.edu.ar',1,'2015-08-11 18:30:56'),(17,'Liliana Maria','Balboa','Liliana.Maria.Balboa@caece.edu.ar',1,'2015-08-11 18:30:56'),(18,'Ricardo','Barca','Ricardo.Barca@caece.edu.ar',1,'2015-08-11 18:30:56'),(19,'Erik','Barreto','E.Barreto@caece.edu.ar',1,'2015-08-11 18:30:56'),(20,'Hernan','Bedorrou Garcia','Bedorrou.Garcia@caece.edu.ar',1,'2015-08-11 18:30:56'),(21,'Federico','Blanco','F.Blanco@caece.edu.ar',1,'2015-08-11 18:30:56'),(22,'Diego','Boggetti ','Boggetti.@caece.edu.ar',1,'2015-08-11 18:30:56'),(23,'Hernan Diego','Bosco','Hernan.Diego.Bosco@caece.edu.ar',1,'2015-08-11 18:30:56'),(24,'Maria Candela','Bracalente','Maria.Candela.Bracalente@caece.edu.ar',1,'2015-08-11 18:30:56'),(25,'Maria Fernanda','Braica','Maria.Fernanda.Braica@caece.edu.ar',1,'2015-08-11 18:30:56'),(26,'Gustavo','Bravin','Bravin@caece.edu.ar',1,'2015-08-11 18:30:56'),(27,'Andres','Broitman Buzarquis Garcia','A.Broitman.Buzarquis.Garcia@caece.edu.ar',1,'2015-08-11 18:30:56'),(28,'Andres','Buchner','A.Buchner@caece.edu.ar',1,'2015-08-11 18:30:56'),(29,'Alejandro Gabrie','Buonomo','Alejandro.Gabrie.Buonomo@caece.edu.ar',1,'2015-08-11 18:30:56'),(30,'Agustina','Buzarquis Garcia','A.Buzarquis.Garcia@caece.edu.ar',1,'2015-08-11 18:30:56'),(31,'Alumno','Test','alumno.test@caece.edu.ar',1,'2015-08-11 18:30:56'),(32,'Admin','Test','Admin.test@caece.edu.ar',1,'2015-08-11 18:30:56');
/*!40000 ALTER TABLE `persona` ENABLE KEYS */;
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
  `id_alu_doc` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tp_entrega`
--

LOCK TABLES `tp_entrega` WRITE;
/*!40000 ALTER TABLE `tp_entrega` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tp_grupo`
--

LOCK TABLES `tp_grupo` WRITE;
/*!40000 ALTER TABLE `tp_grupo` DISABLE KEYS */;
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
  PRIMARY KEY (`id_usuario`),
  UNIQUE KEY `user_UNIQUE` (`user`),
  KEY `fk_usuario_persona1` (`id_persona`),
  CONSTRAINT `fk_usuario_persona1` FOREIGN KEY (`id_persona`) REFERENCES `persona` (`id_persona`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (5,'repo','repo',1,'2014-01-08 03:00:00',2),(6,'alumno','alumno',1,'2014-09-21 01:28:39',31),(7,'admin','admin',1,'2014-09-21 01:36:06',32),(8,'doc','doc',1,'2014-11-01 16:52:13',4);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
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
/*!50001 VIEW `roles` AS select `u`.`id_usuario` AS `id_usuario`,`u`.`user` AS `user`,`u`.`pass` AS `pass`,`u`.`activo` AS `activo`,'docente' AS `rol`,`p`.`id_persona` AS `id_persona`,`a`.`id_docente` AS `id_alu_doc` from ((`usuario` `u` join `persona` `p` on((`p`.`id_persona` = `u`.`id_persona`))) join `docente` `a` on((`a`.`id_persona` = `p`.`id_persona`))) union select `u`.`id_usuario` AS `id_usuario`,`u`.`user` AS `user`,`u`.`pass` AS `pass`,`u`.`activo` AS `activo`,'alumno' AS `rol`,`p`.`id_persona` AS `id_persona`,`a`.`id_alumno` AS `id_alu_doc` from ((`usuario` `u` join `persona` `p` on((`p`.`id_persona` = `u`.`id_persona`))) join `alumno` `a` on((`a`.`id_persona` = `p`.`id_persona`))) union select `u`.`id_usuario` AS `id_usuario`,`u`.`user` AS `user`,`u`.`pass` AS `pass`,`u`.`activo` AS `activo`,'administrador' AS `rol`,`u`.`id_persona` AS `id_persona`,`u`.`id_usuario` AS `id_alu_doc` from `usuario` `u` where ((not(`u`.`id_persona` in (select `alumno`.`id_persona` AS `id_persona` from `alumno`))) and (not(`u`.`id_persona` in (select `docente`.`id_persona` AS `id_persona` from `docente`))) and (`u`.`activo` = 1)) */;
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

-- Dump completed on 2015-08-11 16:16:39
