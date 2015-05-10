CREATE DATABASE  IF NOT EXISTS `repouniversity` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `repouniversity`;
-- MySQL dump 10.13  Distrib 5.6.17, for Win32 (x86)
--
-- Host: localhost    Database: repouniversity
-- ------------------------------------------------------
-- Server version	5.6.17

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
  `Idcarrera` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_alumno`),
  KEY `fk_alumno_1` (`id_alumno`),
  KEY `fk_idcarrera_idx` (`Idcarrera`),
  CONSTRAINT `fk_idcarrera` FOREIGN KEY (`Idcarrera`) REFERENCES `carrera` (`idcarrera`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alumno`
--

LOCK TABLES `alumno` WRITE;
/*!40000 ALTER TABLE `alumno` DISABLE KEYS */;
INSERT INTO `alumno` VALUES (3,6,1,'2014-04-14 18:52:58',NULL),(4,6,1,'2014-04-14 19:19:28',NULL),(5,8,1,'2014-04-14 19:19:49',NULL),(8,22,1,'2014-04-14 19:21:25',NULL),(9,23,1,'2014-04-14 19:21:25',NULL),(11,26,1,'2014-04-14 19:21:25',NULL),(12,27,1,'2014-04-14 19:21:25',NULL),(14,29,1,'2014-04-14 19:21:25',NULL),(15,30,1,'2014-04-14 19:21:37',NULL),(17,33,1,'2014-04-14 19:21:37',NULL),(18,35,1,'2014-04-14 19:21:37',NULL),(19,38,1,'2014-04-14 19:21:49',NULL),(21,45,1,'2014-04-14 19:22:48',NULL),(22,46,1,'2014-04-14 19:22:49',NULL),(23,47,1,'2014-04-14 19:22:49',NULL),(24,48,1,'2014-04-14 19:22:49',NULL),(25,49,1,'2014-04-14 19:22:49',NULL),(26,51,1,'2014-04-14 19:22:49',NULL),(27,53,1,'2014-04-14 19:22:49',NULL),(28,56,1,'2014-04-14 19:22:49',NULL);
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
INSERT INTO `alumno_curso` VALUES (3,2,2),(4,3,2),(5,4,2),(8,3,2),(9,3,2),(9,4,3);
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
  CONSTRAINT `estado_fk` FOREIGN KEY (`estado`) REFERENCES `estado` (`id_estado`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_archivo_1` FOREIGN KEY (`id_tipo`) REFERENCES `archivo_tipo` (`id_tipo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_archivo_estado1` FOREIGN KEY (`estado`) REFERENCES `estado` (`id_estado`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_archivo_persona1` FOREIGN KEY (`persona_id_persona`) REFERENCES `persona` (`id_persona`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_curso` FOREIGN KEY (`id_curso`) REFERENCES `curso` (`id_curso`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `archivo`
--

LOCK TABLES `archivo` WRITE;
/*!40000 ALTER TABLE `archivo` DISABLE KEYS */;
INSERT INTO `archivo` VALUES (1,'practica Algebra','practica ejercicios del 1 a 20 ','0000-00-00','0000-00-00',1,'2014-04-15 14:21:04',1,1,'c:\\algebra.doc',31,3,NULL),(5,'Teoria nº 1 programción','Teoria de pilas y  colas','0000-00-00','0000-00-00',1,'2014-04-15 14:24:29',1,1,'c:\\prog.doc',32,4,NULL),(6,'Teoria nº 2 programción','Recursividad','0000-00-00','0000-00-00',1,'2014-04-15 14:33:11',1,1,'c:\\prog2.doc',32,4,NULL),(7,'practica Nº 2  Algebra ','practica ejercicios del 1 a 20 ','0000-00-00','0000-00-00',1,'2014-04-15 14:34:15',1,1,'c:\\algebra2.doc',32,5,NULL),(8,'practica Nº 3  Algebra ','practica ejercicios del 20 a 30 ','0000-00-00','0000-00-00',1,'2014-04-15 14:45:37',1,1,'c:\\algebra3.doc',32,5,NULL),(9,'practica Nº 3  Algebra ','practica ejercicios del 20 a 30 ','0000-00-00','0000-00-00',1,'2014-04-15 14:46:14',1,1,'c:\\algebra3.doc',31,3,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `archivo_tipo`
--

LOCK TABLES `archivo_tipo` WRITE;
/*!40000 ALTER TABLE `archivo_tipo` DISABLE KEYS */;
INSERT INTO `archivo_tipo` VALUES (1,'Word','2014-04-14 20:04:21',1),(2,'PDF','2014-04-14 20:04:31',1),(3,'Excel','2014-04-14 20:04:39',1);
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
  PRIMARY KEY (`idcarrera`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carrera`
--

LOCK TABLES `carrera` WRITE;
/*!40000 ALTER TABLE `carrera` DISABLE KEYS */;
INSERT INTO `carrera` VALUES (1,'Licenciatura en Sistemas'),(2,'Ingenieria en Sistemas'),(3,'DiseÃ±o Grafico'),(4,'Abogacia');
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
INSERT INTO `carrera_materia` VALUES (1,1),(1,2),(1,3),(2,1),(3,1),(3,4);
/*!40000 ALTER TABLE `carrera_materia` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `curso`
--

LOCK TABLES `curso` WRITE;
/*!40000 ALTER TABLE `curso` DISABLE KEYS */;
INSERT INTO `curso` VALUES (1,'TELEPROCESOS Y REDES II','7292/04S','Turno Noche','2015-07-14 03:00:00',1,'2015-04-18 18:46:40',2,1),(2,'TELEPROCESOS Y REDES II','7293/04S','Turno Mañana','2016-04-14 03:00:00',1,'2015-04-18 18:47:59',29,1),(3,'ALGEBRA','6587/05S','Turno Noche','2016-04-14 03:00:00',1,'2015-04-18 18:50:33',30,2),(4,'PROGRAMACIÓN','3265/08S','Turno Noche','2016-04-14 03:00:00',1,'2015-04-18 18:52:22',29,3),(5,'ALGEBRA','6289/05S','Turno Mañana','2016-04-14 03:00:00',1,'2015-04-18 18:54:17',32,2);
/*!40000 ALTER TABLE `curso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `docente`
--

DROP TABLE IF EXISTS `docente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `docente` (
  `id_docente` int(10) NOT NULL,
  `id_persona` int(10) NOT NULL,
  `activo` tinyint(1) NOT NULL DEFAULT '1',
  `fecsys` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_docente`),
  KEY `fk_docente_1` (`id_docente`),
  CONSTRAINT `fk_docente_1` FOREIGN KEY (`id_docente`) REFERENCES `persona` (`id_persona`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `docente`
--

LOCK TABLES `docente` WRITE;
/*!40000 ALTER TABLE `docente` DISABLE KEYS */;
INSERT INTO `docente` VALUES (2,2,1,'2014-04-14 15:52:40'),(29,4,1,'2014-04-14 16:24:39'),(30,7,1,'2014-04-14 16:24:39'),(31,10,1,'2014-04-14 16:24:39'),(32,12,1,'2014-04-14 16:24:39'),(33,32,1,'2014-04-14 16:24:39'),(34,42,1,'2014-04-14 16:24:39'),(35,52,1,'2014-04-14 16:24:49'),(36,60,1,'2014-04-14 16:24:53');
/*!40000 ALTER TABLE `docente` ENABLE KEYS */;
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
INSERT INTO `grupo` VALUES (1,'Smart Solution',1,'2014-04-14 19:35:53'),(2,'Grupo 1001',1,'2014-04-14 19:58:47'),(3,'grupo1',1,'2014-11-30 16:11:22'),(4,'pepitos',1,'2015-01-18 21:17:08'),(5,'pepitos',1,'2015-01-18 21:32:18'),(6,'pepitos',1,'2015-01-18 21:41:03'),(7,'pepitos',1,'2015-01-18 22:01:45'),(8,'pepitos',1,'2015-01-18 22:08:08'),(9,'pepitos',1,'2015-01-18 22:10:08'),(10,'pepitos',1,'2015-01-18 22:17:38'),(11,'pepitos',1,'2015-01-18 22:35:57');
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `materia`
--

LOCK TABLES `materia` WRITE;
/*!40000 ALTER TABLE `materia` DISABLE KEYS */;
INSERT INTO `materia` VALUES (1,'TELEPROCESOS Y REDES II','TELEPROCESOS Y REDES II ',1,'2014-04-14 19:22:37'),(2,'ALGEBRA','ALGEBRA',1,'2014-04-14 19:24:12'),(3,'PROGRAMACIÓN','PROGRAMACIÓN',1,'2014-04-14 19:24:25');
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
  PRIMARY KEY (`idnotificacion`),
  KEY `idcurso_idx` (`idcurso`),
  KEY `tiponotificacion_idx` (`tiponotificacion`),
  CONSTRAINT `idcurso` FOREIGN KEY (`idcurso`) REFERENCES `curso` (`id_curso`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `tiponotificacion` FOREIGN KEY (`tiponotificacion`) REFERENCES `tipo_notificacion` (`idTipoNotificacion`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1 COMMENT='En esta tabla se alojaran todas las notificaciones del sistema, ej alta de cursos, alta de grupo, etc.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notificacion`
--

LOCK TABLES `notificacion` WRITE;
/*!40000 ALTER TABLE `notificacion` DISABLE KEYS */;
INSERT INTO `notificacion` VALUES (10,3,1,2,9),(16,4,4,2,9),(17,3,4,2,3),(18,1,3,2,5),(20,3,3,2,9),(21,3,4,2,9);
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
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persona`
--

LOCK TABLES `persona` WRITE;
/*!40000 ALTER TABLE `persona` DISABLE KEYS */;
INSERT INTO `persona` VALUES (1,'Esteban','Lopez','sinmail@nada.com',1,'2014-01-09 02:43:04'),(2,'Federico jose','Perez','jperez@nada.com',1,'2014-04-14 03:00:00'),(3,'Manuel','Gonzales','mgonzales@yahoo.com',1,'2014-04-14 15:52:04'),(4,'Juan','Lopez','sinmail@nada.com',1,'2014-04-14 16:04:18'),(5,'Mariana','Surezwer','sinmail@nada.com',1,'2014-04-14 16:04:18'),(6,'Martin','Liutewe','sinmail@nada.com',1,'2014-04-14 16:04:18'),(7,'Silvia','Calvose','sinmail@nada.com',1,'2014-04-14 16:04:18'),(8,'Nancy','Rattose','sinmail@nada.com',1,'2014-04-14 16:04:18'),(9,'Maria Eugenia','Bjergin','sinmail@nada.com',1,'2014-04-14 16:04:18'),(10,'Marta','Collebede','sinmail@nada.com',1,'2014-04-14 16:04:18'),(11,'Roxana','Paez','sinmail@nada.com',1,'2014-04-14 16:04:18'),(12,'Sarar','Boicas','sinmail@nada.com',1,'2014-04-14 16:04:18'),(14,'Ana','Fornachio','sinmail@nada.com',1,'2014-04-14 16:04:18'),(15,'Sara','Baragar','sinmail@nada.com',1,'2014-04-14 16:04:18'),(16,'Silvia','Lopez Chorne','sinmail@nada.com',1,'2014-04-14 16:04:18'),(17,'Ana','Sonder','sinmail@nada.com',1,'2014-04-14 16:04:18'),(18,'Maria','Jusid','sinmail@nada.com',1,'2014-04-14 16:04:18'),(19,'German','Rembado','sinmail@nada.com',1,'2014-04-14 16:04:18'),(20,'Patricia','Torres','sinmail@nada.com',1,'2014-04-14 16:04:18'),(21,'Esteban','Berrotarrs','sinmail@nada.com',1,'2014-04-14 16:04:18'),(22,'Sebastian','Levaivas','sinmail@nada.com',1,'2014-04-14 16:04:18'),(23,'Esteban','Lopez','sinmail@nada.com',1,'2014-04-14 16:04:21'),(24,'Mariana','Surez','sinmail@nada.com',1,'2014-04-14 16:04:21'),(25,'Martin','Liut','sinmail@nada.com',1,'2014-04-14 16:04:21'),(26,'Nancy','Calvos','sinmail@nada.com',1,'2014-04-14 16:04:21'),(27,'Silvia','Rattor','sinmail@nada.com',1,'2014-04-14 16:04:21'),(28,'Maria ','Bjergre','sinmail@nada.com',1,'2014-04-14 16:04:21'),(29,'Maria Eugenia','Collebechi','sinmail@nada.com',1,'2014-04-14 16:04:21'),(30,'Sarar','Paez','sinmail@nada.com',1,'2014-04-14 16:04:21'),(31,'Roxana','Boixa','sinmail@nada.com',1,'2014-04-14 16:04:21'),(32,'Sergio','Galianos','sinmail@nada.com',1,'2014-04-14 16:04:21'),(33,'Silvina','Fornasarir','sinmail@nada.com',1,'2014-04-14 16:04:21'),(34,'Inez','Baraga','sinmail@nada.com',1,'2014-04-14 16:04:21'),(35,'Juan','Lopez ','sinmail@nada.com',1,'2014-04-14 16:04:21'),(36,'Maria','Sonderre','sinmail@nada.com',1,'2014-04-14 16:04:21'),(37,'Ana MAria','Jusider','sinmail@nada.com',1,'2014-04-14 16:04:21'),(38,'Mabeler','Remba','sinmail@nada.com',1,'2014-04-14 16:04:21'),(39,'Sebastian','Torres','sinmail@nada.com',1,'2014-04-14 16:04:21'),(40,'Patricia','Berroero','sinmail@nada.com',1,'2014-04-14 16:04:21'),(41,'German','Laraere','sinmail@nada.com',1,'2014-04-14 16:04:21'),(42,'Luis','Lopez','eiamodio@gmail.com',1,'2014-04-14 16:04:22'),(43,'Maria','Surezest','sinmail@nada.com',1,'2014-04-14 16:04:22'),(44,'Martin','Liutasa','sinmail@nada.com',1,'2014-04-14 16:04:22'),(45,'Nancy','Calvoner','sinmail@nada.com',1,'2014-04-14 16:04:22'),(46,'Silvia','Rattose','sinmail@nada.com',1,'2014-04-14 16:04:22'),(47,'Maria','Beijer','sinmail@nada.com',1,'2014-04-14 16:04:22'),(48,'Maria Eugenia','Colle','sinmail@nada.com',1,'2014-04-14 16:04:22'),(49,'Saras','PAez','sinmail@nada.com',1,'2014-04-14 16:04:22'),(50,'Roxana','Boixar','sinmail@nada.com',1,'2014-04-14 16:04:22'),(51,'Sergio','Galiano','sinmail@nada.com',1,'2014-04-14 16:04:22'),(52,'Marta','Fornasari','sinmail@nada.com',1,'2014-04-14 16:04:22'),(53,'Silvia','Baragatti','sinmail@nada.com',1,'2014-04-14 16:04:22'),(54,'Juan','Lopez Chorne','sinmail@nada.com',1,'2014-04-14 16:04:22'),(55,'Marta','Sondereguer','sinmail@nada.com',1,'2014-04-14 16:04:22'),(56,'Mabel','Jusids','sinmail@nada.com',1,'2014-04-14 16:04:22'),(57,'Angel','Remba','sinmail@nada.com',1,'2014-04-14 16:04:22'),(58,'Juan','Torres','sinmail@nada.com',1,'2014-04-14 16:04:22'),(59,'Patricia','Berrotare','sinmail@nada.com',1,'2014-04-14 16:04:22'),(60,'German','Levaba','sinmail@nada.com',1,'2014-04-14 16:04:22'),(61,'','','sinmail@nada.com',1,'2014-04-14 16:11:06');
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
  PRIMARY KEY (`idTipoNotificacion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Se alojaran los tipos de notificaciones';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_notificacion`
--

LOCK TABLES `tipo_notificacion` WRITE;
/*!40000 ALTER TABLE `tipo_notificacion` DISABLE KEYS */;
INSERT INTO `tipo_notificacion` VALUES (1,'Solicitud alta curso'),(2,'Nuevo archivo subido'),(3,'Solicitud Confirmada'),(4,'Solicitud Rechazada');
/*!40000 ALTER TABLE `tipo_notificacion` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'repo','repo',1,'2014-01-08 03:00:00',2),(2,'alumno','alumno',1,'2014-09-21 01:28:39',23),(3,'admin','admin',1,'2014-09-21 01:36:06',55),(4,'doc','doc',1,'2014-11-01 16:52:13',4);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

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
/*!50001 VIEW `roles` AS select `u`.`id_usuario` AS `id_usuario`,`u`.`user` AS `user`,`u`.`pass` AS `pass`,'docente' AS `rol`,`p`.`id_persona` AS `id_persona`,`a`.`id_docente` AS `id_alu_doc` from ((`usuario` `u` join `persona` `p` on((`p`.`id_persona` = `u`.`id_persona`))) join `docente` `a` on((`a`.`id_persona` = `p`.`id_persona`))) union select `u`.`id_usuario` AS `id_usuario`,`u`.`user` AS `user`,`u`.`pass` AS `pass`,'alumno' AS `rol`,`p`.`id_persona` AS `id_persona`,`a`.`id_alumno` AS `id_alu_doc` from ((`usuario` `u` join `persona` `p` on((`p`.`id_persona` = `u`.`id_persona`))) join `alumno` `a` on((`a`.`id_persona` = `p`.`id_persona`))) union select `u`.`id_usuario` AS `id_usuario`,`u`.`user` AS `user`,`u`.`pass` AS `pass`,'administrador' AS `rol`,`u`.`id_persona` AS `id_persona`,`u`.`id_usuario` AS `id_alu_doc` from `usuario` `u` where ((not(`u`.`id_persona` in (select `alumno`.`id_persona` from `alumno`))) and (not(`u`.`id_persona` in (select `docente`.`id_persona` from `docente`)))) */;
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

-- Dump completed on 2015-04-20  0:25:25
