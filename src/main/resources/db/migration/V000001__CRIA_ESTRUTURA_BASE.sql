-- MySQL dump 10.13  Distrib 5.7.27, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: devdb
-- ------------------------------------------------------
-- Server version	5.7.27-0ubuntu0.18.04.1

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
-- Table structure for table `ANAMNESE`
--

DROP TABLE IF EXISTS `ANAMNESE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ANAMNESE` (
  `ID` bigint(20) NOT NULL,
  `ID_VISITA` bigint(20) NOT NULL,
  `ID_PACIENTE` bigint(20) NOT NULL,
  `ID_ANAMNESE_ITEM` bigint(20) NOT NULL,
  `RESPOSTA` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_PACITENTE` (`ID_ANAMNESE_ITEM`,`ID_PACIENTE`,`ID_VISITA`,`ID`),
  KEY `fk_ANAMNESE_VISIT_idx` (`ID_VISITA`),
  KEY `fk_ANAMNESE_PACIENT_idx` (`ID_PACIENTE`),
  CONSTRAINT `fk_ANAMNESE_ITEM` FOREIGN KEY (`ID_ANAMNESE_ITEM`) REFERENCES `ANAMNESE_ITEM` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_ANAMNESE_PACIENT` FOREIGN KEY (`ID_PACIENTE`) REFERENCES `PACIENTE` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_ANAMNESE_VISIT` FOREIGN KEY (`ID_VISITA`) REFERENCES `VISITA` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ANAMNESE`
--

LOCK TABLES `ANAMNESE` WRITE;
/*!40000 ALTER TABLE `ANAMNESE` DISABLE KEYS */;
/*!40000 ALTER TABLE `ANAMNESE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ANAMNESE_ITEM`
--

DROP TABLE IF EXISTS `ANAMNESE_ITEM`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ANAMNESE_ITEM` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `PERGUNTA` varchar(45) NOT NULL,
  `SIM_NAO` varchar(3) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ANAMNESE_ITEM`
--

LOCK TABLES `ANAMNESE_ITEM` WRITE;
/*!40000 ALTER TABLE `ANAMNESE_ITEM` DISABLE KEYS */;
/*!40000 ALTER TABLE `ANAMNESE_ITEM` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PACIENTE`
--

DROP TABLE IF EXISTS `PACIENTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PACIENTE` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `NOME` varchar(50) NOT NULL,
  `SOBRENOME` varchar(200) NOT NULL,
  `RG` varchar(7) DEFAULT NULL,
  `USUARIO` varchar(11) NOT NULL,
  `DATA_NASCIMENTO` date NOT NULL,
  `SEXO` varchar(1) NOT NULL COMMENT 'TABELA DE CADASTRO DE PACIENTES',
  `NOME_COMP_PAI` varchar(250) DEFAULT NULL,
  `NOME_COMP_MAE` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PACIENTE`
--

LOCK TABLES `PACIENTE` WRITE;
/*!40000 ALTER TABLE `PACIENTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `PACIENTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PERMISSAO`
--

DROP TABLE IF EXISTS `PERMISSAO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PERMISSAO` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `DESCRICAO` varchar(45) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `DESCRICAO_UNIQUE` (`DESCRICAO`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PERMISSAO`
--

LOCK TABLES `PERMISSAO` WRITE;
/*!40000 ALTER TABLE `PERMISSAO` DISABLE KEYS */;
INSERT INTO `PERMISSAO` VALUES (1,'ROLE_COMUM');
INSERT INTO `PERMISSAO` VALUES (1,'ROLE_ADMIN');
INSERT INTO `PERMISSAO` VALUES (1,'ROLE_MEDICO');
INSERT INTO `PERMISSAO` VALUES (1,'ROLE_TECNICO');
INSERT INTO `PERMISSAO` VALUES (1,'ROLE_ENFERMEIRO');
INSERT INTO `PERMISSAO` VALUES (1,'ROLE_RECEPCAO');
/*!40000 ALTER TABLE `PERMISSAO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESPONSAVEL`
--

DROP TABLE IF EXISTS `RESPONSAVEL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RESPONSAVEL` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `NOME` varchar(100) NOT NULL,
  `USUARIO` varchar(11) NOT NULL,
  `REGISTRO_PROFISSIONAL` varchar(100) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESPONSAVEL`
--

LOCK TABLES `RESPONSAVEL` WRITE;
/*!40000 ALTER TABLE `RESPONSAVEL` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESPONSAVEL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TIPO_EVENTO`
--

DROP TABLE IF EXISTS `TIPO_EVENTO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TIPO_EVENTO` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `NOME` varchar(45) NOT NULL,
  `DESCRICAO` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TIPO_EVENTO`
--

LOCK TABLES `TIPO_EVENTO` WRITE;
/*!40000 ALTER TABLE `TIPO_EVENTO` DISABLE KEYS */;
/*!40000 ALTER TABLE `TIPO_EVENTO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USUARIO`
--

DROP TABLE IF EXISTS `USUARIO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USUARIO` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `USUARIO` varchar(11) NOT NULL,
  `EMAIL` varchar(100) DEFAULT NULL,
  `SENHA` varchar(500) DEFAULT NULL,
  `ATIVO` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `USUARIO_UNIQUE` (`USUARIO`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USUARIO`
--

LOCK TABLES `USUARIO` WRITE;
/*!40000 ALTER TABLE `USUARIO` DISABLE KEYS */;
INSERT INTO `USUARIO` VALUES (1,'ADMIN','admin@admin.com','$2a$10$XIMO9M5wVNb236vYW2N2hO3mgbWcjBE4sL5MyBLEqsnUKrY2sYKXS',1);
/*!40000 ALTER TABLE `USUARIO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USUARIO_PERMISSAO`
--

DROP TABLE IF EXISTS `USUARIO_PERMISSAO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USUARIO_PERMISSAO` (
  `ID_USUARIO` bigint(20) NOT NULL,
  `ID_PERMISSAO` bigint(20) NOT NULL,
  PRIMARY KEY (`ID_USUARIO`,`ID_PERMISSAO`),
  KEY `fk_PERMISSAO_USUARIO_idx` (`ID_PERMISSAO`),
  CONSTRAINT `fk_PERMISSAO_USUARIO` FOREIGN KEY (`ID_PERMISSAO`) REFERENCES `PERMISSAO` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_USUARIO_PERMISSAO` FOREIGN KEY (`ID_USUARIO`) REFERENCES `USUARIO` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USUARIO_PERMISSAO`
--

LOCK TABLES `USUARIO_PERMISSAO` WRITE;
/*!40000 ALTER TABLE `USUARIO_PERMISSAO` DISABLE KEYS */;
INSERT INTO `USUARIO_PERMISSAO` VALUES (1,1);
/*!40000 ALTER TABLE `USUARIO_PERMISSAO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `VISITA`
--

DROP TABLE IF EXISTS `VISITA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `VISITA` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `ID_PACIENTE` bigint(20) NOT NULL,
  `DH_ENTRADA` datetime NOT NULL,
  `DH_SAIDA` datetime DEFAULT NULL,
  `MOTIVO_ENTRADA` varchar(200) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_VISITA_PACIENT_idx` (`ID_PACIENTE`),
  CONSTRAINT `fk_VISITA_PACIENT` FOREIGN KEY (`ID_PACIENTE`) REFERENCES `PACIENTE` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `VISITA`
--

LOCK TABLES `VISITA` WRITE;
/*!40000 ALTER TABLE `VISITA` DISABLE KEYS */;
/*!40000 ALTER TABLE `VISITA` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `VISITA_EVENTO`
--

DROP TABLE IF EXISTS `VISITA_EVENTO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `VISITA_EVENTO` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `ID_VISITA` bigint(20) NOT NULL,
  `ID_PACIENTE` bigint(20) NOT NULL,
  `ID_TIPO_EVENTO` bigint(20) NOT NULL,
  `ID_RESPONSAVEL` bigint(20) NOT NULL,
  `URL_DOC` varchar(500) DEFAULT NULL,
  `TITULO` varchar(45) NOT NULL,
  `OBSERVACOES` varchar(500) DEFAULT NULL,
  `DH_EVENTO` datetime NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_VISITA_EVENTO_PACIENT_idx` (`ID_PACIENTE`),
  KEY `fk_VISITA_VISITA_idx` (`ID_VISITA`),
  KEY `fk_VISITA_TIPO_EVE_idx` (`ID_TIPO_EVENTO`),
  KEY `fk_VISITA_RESP_idx` (`ID_RESPONSAVEL`),
  CONSTRAINT `fk_VISITA_EVENTO_PACIENT` FOREIGN KEY (`ID_PACIENTE`) REFERENCES `PACIENTE` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_VISITA_RESP` FOREIGN KEY (`ID_RESPONSAVEL`) REFERENCES `RESPONSAVEL` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_VISITA_TIPO_EVE` FOREIGN KEY (`ID_TIPO_EVENTO`) REFERENCES `TIPO_EVENTO` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_VISITA_VISITA` FOREIGN KEY (`ID_VISITA`) REFERENCES `VISITA_EVENTO` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `VISITA_EVENTO`
--

LOCK TABLES `VISITA_EVENTO` WRITE;
/*!40000 ALTER TABLE `VISITA_EVENTO` DISABLE KEYS */;
/*!40000 ALTER TABLE `VISITA_EVENTO` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-09-15 17:05:03