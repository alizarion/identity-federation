
CREATE DATABASE keycloak DEFAULT CHARACTER SET utf8 DEFAULT COLLATE utf8_general_ci;

CREATE USER 'keycloak'@'%' IDENTIFIED BY 'keycloak';
GRANT ALL PRIVILEGES ON *.* TO 'keycloak'@'%' WITH GRANT OPTION;

CREATE USER 'keycloak'@'localhost' IDENTIFIED BY 'keycloak';
GRANT ALL PRIVILEGES ON keycloak.* TO 'keycloak'@'localhost' WITH GRANT OPTION;
USE keycloak;

-- MySQL dump 10.13  Distrib 5.6.27, for Linux (x86_64)
--
-- Host: localhost    Database: keycloak
-- ------------------------------------------------------
-- Server version	5.6.27

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
-- Table structure for table `ADMIN_EVENT_ENTITY`
--

DROP TABLE IF EXISTS `ADMIN_EVENT_ENTITY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ADMIN_EVENT_ENTITY` (
  `ID` varchar(36) NOT NULL,
  `ADMIN_EVENT_TIME` bigint(20) DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `OPERATION_TYPE` varchar(255) DEFAULT NULL,
  `AUTH_REALM_ID` varchar(255) DEFAULT NULL,
  `AUTH_CLIENT_ID` varchar(255) DEFAULT NULL,
  `AUTH_USER_ID` varchar(255) DEFAULT NULL,
  `IP_ADDRESS` varchar(255) DEFAULT NULL,
  `RESOURCE_PATH` varchar(2550) DEFAULT NULL,
  `REPRESENTATION` text,
  `ERROR` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ADMIN_EVENT_ENTITY`
--

LOCK TABLES `ADMIN_EVENT_ENTITY` WRITE;
/*!40000 ALTER TABLE `ADMIN_EVENT_ENTITY` DISABLE KEYS */;
/*!40000 ALTER TABLE `ADMIN_EVENT_ENTITY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AUTHENTICATION_EXECUTION`
--

DROP TABLE IF EXISTS `AUTHENTICATION_EXECUTION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AUTHENTICATION_EXECUTION` (
  `ID` varchar(36) NOT NULL,
  `ALIAS` varchar(255) DEFAULT NULL,
  `AUTHENTICATOR` varchar(36) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `FLOW_ID` varchar(36) DEFAULT NULL,
  `REQUIREMENT` int(11) DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  `AUTHENTICATOR_FLOW` bit(1) NOT NULL DEFAULT b'0',
  `AUTH_FLOW_ID` varchar(36) DEFAULT NULL,
  `AUTH_CONFIG` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_AUTH_EXEC_REALM` (`REALM_ID`),
  KEY `FK_AUTH_EXEC_FLOW` (`FLOW_ID`),
  CONSTRAINT `FK_AUTH_EXEC_FLOW` FOREIGN KEY (`FLOW_ID`) REFERENCES `AUTHENTICATION_FLOW` (`ID`),
  CONSTRAINT `FK_AUTH_EXEC_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AUTHENTICATION_EXECUTION`
--

LOCK TABLES `AUTHENTICATION_EXECUTION` WRITE;
/*!40000 ALTER TABLE `AUTHENTICATION_EXECUTION` DISABLE KEYS */;
INSERT INTO `AUTHENTICATION_EXECUTION` VALUES ('02dfa637-6771-4b99-8d82-490a24e6b4f6',NULL,'direct-grant-validate-username','master','8bb0480a-a05e-4be5-9858-681c1dcbe867',0,10,'\0',NULL,NULL),('04837425-09dc-4288-bc7c-0c4a9a9691e5',NULL,'client-secret','itesoft','c277c38d-773e-4b0c-91bd-1627927005f0',2,10,'\0',NULL,NULL),('0ba6a146-1225-4ee5-b592-182a987d00ba',NULL,NULL,'itesoft','74a7dd1e-339d-4211-981f-1d8d304abe95',2,30,'','1ceb7956-99d3-4029-a828-a2fc06a78cbb',NULL),('0ce5834f-d326-49c8-9e56-5fa4aa41ee82',NULL,'registration-password-action','itesoft','a41f352b-5e65-4fdf-9944-7e02c1810d3a',0,50,'\0',NULL,NULL),('133835c1-3174-43db-a669-8b8cd5b09885',NULL,'registration-profile-action','master','ebe4b75a-ed73-412c-86d5-20a64ee99fca',0,40,'\0',NULL,NULL),('14355a26-de96-4a39-8510-9e905106334b',NULL,NULL,'master','96891a6b-fee2-4989-9d8f-73f6ad82ef70',2,30,'','2999029a-7c5b-4525-96b5-804e96bf4069',NULL),('2095d44f-a38e-4315-895d-89336ba6e43b',NULL,'auth-cookie','master','96891a6b-fee2-4989-9d8f-73f6ad82ef70',2,10,'\0',NULL,NULL),('2097d3de-d8ab-457e-850b-6456b3d3a840',NULL,'idp-username-password-form','itesoft','6db58451-2440-4d71-8bfe-564407705cf0',0,10,'\0',NULL,NULL),('28f82913-68ae-4359-a7e4-b095071646a0',NULL,'registration-recaptcha-action','master','ebe4b75a-ed73-412c-86d5-20a64ee99fca',3,60,'\0',NULL,NULL),('2b76b067-f1ba-4a0e-86d5-6c36bcc88d69',NULL,'auth-otp-form','itesoft','6db58451-2440-4d71-8bfe-564407705cf0',1,20,'\0',NULL,NULL),('4806d695-f63d-49f2-8e1c-562bfb6994a6',NULL,NULL,'master','31eba8b2-28ad-4bc5-9a24-a919b701039e',2,30,'','6eb129a6-2471-4f6d-b851-3919fc9696dd',NULL),('48f94448-54f0-46ac-b0b2-a3c7b1b4ad23',NULL,NULL,'master','6eb129a6-2471-4f6d-b851-3919fc9696dd',2,30,'','dc326cd5-b562-41fd-8a7a-67a059bb4a3a',NULL),('49c1d1f6-cc08-4230-bf71-6261d82c20b0',NULL,'reset-credential-email','itesoft','5896ed51-07cf-4478-b3fb-057b7ced2eb5',0,20,'\0',NULL,NULL),('56e15dac-0f46-4f59-b4fa-ce9ec8b98175',NULL,'auth-spnego','master','96891a6b-fee2-4989-9d8f-73f6ad82ef70',3,20,'\0',NULL,NULL),('59a24936-8617-43ed-9802-df75dbaf0373',NULL,'client-jwt','master','c9a4a7b7-f851-4b52-87f0-5d827e3663ec',2,20,'\0',NULL,NULL),('5bd0a3bd-5081-4025-89e6-fefc7a21520c',NULL,'auth-cookie','itesoft','74a7dd1e-339d-4211-981f-1d8d304abe95',2,10,'\0',NULL,NULL),('5de33d52-04ef-4c7a-991e-cf92254f7191',NULL,'auth-otp-form','itesoft','1ceb7956-99d3-4029-a828-a2fc06a78cbb',1,20,'\0',NULL,NULL),('64b1adf0-2e3f-401a-a7ba-e4f592f68e86',NULL,'client-secret','master','c9a4a7b7-f851-4b52-87f0-5d827e3663ec',2,10,'\0',NULL,NULL),('694b38cf-a119-4513-b4bc-6fecb6b18d6f',NULL,'reset-password','itesoft','5896ed51-07cf-4478-b3fb-057b7ced2eb5',0,30,'\0',NULL,NULL),('6bc16d95-be33-4c22-8163-b8519fe31f5b',NULL,'registration-page-form','itesoft','835f475c-ec2d-4c77-8396-3b7a2f35fbc7',0,10,'','a41f352b-5e65-4fdf-9944-7e02c1810d3a',NULL),('70747287-4dbf-4df2-a69d-d5d9635979bf',NULL,'registration-user-creation','master','ebe4b75a-ed73-412c-86d5-20a64ee99fca',0,20,'\0',NULL,NULL),('747e486d-56e9-4f09-b54d-baf391209c04',NULL,'auth-otp-form','master','2999029a-7c5b-4525-96b5-804e96bf4069',1,20,'\0',NULL,NULL),('751bac89-9081-4d6e-8097-f534c5576603',NULL,'idp-create-user-if-unique','itesoft','07d529de-0233-44cc-bd0f-61559fc61228',2,20,'\0',NULL,'128fcbe1-543c-42c6-81f2-0224ac3aa3c4'),('77822505-973a-4f53-9ce9-e38f964cbac9',NULL,'direct-grant-validate-password','itesoft','842bcabe-d53a-4669-b4b8-70b8dfbfd590',0,20,'\0',NULL,NULL),('7f0b4e2e-2af9-4b10-b3fc-88e8feb7bbed',NULL,'reset-otp','master','abcde03e-ae76-43e1-82af-b53f852e417f',1,40,'\0',NULL,NULL),('7f3dc922-e554-48a4-819f-e3155aabc690',NULL,'idp-confirm-link','master','6eb129a6-2471-4f6d-b851-3919fc9696dd',0,10,'\0',NULL,NULL),('8674cca2-1832-41ad-8b77-afe69db21028',NULL,'auth-spnego','itesoft','74a7dd1e-339d-4211-981f-1d8d304abe95',3,20,'\0',NULL,NULL),('9c99688d-fddb-49b6-8054-695f06ff9a36',NULL,NULL,'itesoft','a828fc19-9549-4adf-aa2a-5c6024b1bfde',2,30,'','6db58451-2440-4d71-8bfe-564407705cf0',NULL),('9eb54444-4224-4ca9-9157-74944a256d43',NULL,'direct-grant-validate-otp','master','8bb0480a-a05e-4be5-9858-681c1dcbe867',1,30,'\0',NULL,NULL),('9fca73db-d8ec-494d-9f64-2e0530be024f',NULL,'reset-password','master','abcde03e-ae76-43e1-82af-b53f852e417f',0,30,'\0',NULL,NULL),('a26f37ce-2f1b-40f4-b666-4a0e527aee57',NULL,'reset-credentials-choose-user','master','abcde03e-ae76-43e1-82af-b53f852e417f',0,10,'\0',NULL,NULL),('abf0fe94-cb57-48b0-a750-3780408c576e',NULL,'reset-otp','itesoft','5896ed51-07cf-4478-b3fb-057b7ced2eb5',1,40,'\0',NULL,NULL),('af0ccf41-364e-4068-8097-975c2130a44f',NULL,'idp-username-password-form','master','dc326cd5-b562-41fd-8a7a-67a059bb4a3a',0,10,'\0',NULL,NULL),('afe39b50-958e-4a12-9801-43cdce9abd01',NULL,'idp-confirm-link','itesoft','a828fc19-9549-4adf-aa2a-5c6024b1bfde',0,10,'\0',NULL,NULL),('b2220b4f-3dce-4ccc-9599-4af337663150',NULL,NULL,'itesoft','07d529de-0233-44cc-bd0f-61559fc61228',2,30,'','a828fc19-9549-4adf-aa2a-5c6024b1bfde',NULL),('b88438b0-9d44-487d-99a7-f942e52fde0e',NULL,'reset-credential-email','master','abcde03e-ae76-43e1-82af-b53f852e417f',0,20,'\0',NULL,NULL),('bd179153-bff4-4d15-ab2f-b0fefbbf6bed',NULL,'registration-user-creation','itesoft','a41f352b-5e65-4fdf-9944-7e02c1810d3a',0,20,'\0',NULL,NULL),('c40ed015-8a5b-4f14-b282-126843c8ab54',NULL,'registration-recaptcha-action','itesoft','a41f352b-5e65-4fdf-9944-7e02c1810d3a',3,60,'\0',NULL,NULL),('c4b93941-1299-465c-8f90-e23a8ded15dd',NULL,'idp-review-profile','master','31eba8b2-28ad-4bc5-9a24-a919b701039e',0,10,'\0',NULL,'84eaabb0-2a66-46d4-84db-e80d62ecf30d'),('c9802c15-5dc1-43c6-97aa-69e03bf3e885',NULL,'registration-password-action','master','ebe4b75a-ed73-412c-86d5-20a64ee99fca',0,50,'\0',NULL,NULL),('cfd4cc24-1624-4b8e-8dc2-02365e52c0a6',NULL,'registration-page-form','master','4b0d1947-8eb6-4a5c-91f8-b00c182489c9',0,10,'','ebe4b75a-ed73-412c-86d5-20a64ee99fca',NULL),('d265813a-73fb-40a6-a1be-7d8ff1f27803',NULL,'direct-grant-validate-otp','itesoft','842bcabe-d53a-4669-b4b8-70b8dfbfd590',1,30,'\0',NULL,NULL),('d6f1908a-40ac-4f8a-baee-74c2c557395f',NULL,'auth-username-password-form','master','2999029a-7c5b-4525-96b5-804e96bf4069',0,10,'\0',NULL,NULL),('d92ac716-1564-4ee6-87ab-241d7c21257c',NULL,'idp-email-verification','itesoft','a828fc19-9549-4adf-aa2a-5c6024b1bfde',2,20,'\0',NULL,NULL),('db4db579-64f3-4f50-88e9-5a6e7b7d6bf4',NULL,'auth-otp-form','master','dc326cd5-b562-41fd-8a7a-67a059bb4a3a',1,20,'\0',NULL,NULL),('e1c5ebb0-5553-4ede-b247-5b549d0d0d43',NULL,'idp-email-verification','master','6eb129a6-2471-4f6d-b851-3919fc9696dd',2,20,'\0',NULL,NULL),('e2f4cae8-ad87-45bb-85f3-0a4124ad2651',NULL,'auth-username-password-form','itesoft','1ceb7956-99d3-4029-a828-a2fc06a78cbb',0,10,'\0',NULL,NULL),('e59c30cc-0a5d-4493-b3bd-afb241b5dbd5',NULL,'registration-profile-action','itesoft','a41f352b-5e65-4fdf-9944-7e02c1810d3a',0,40,'\0',NULL,NULL),('e7d3618d-0b93-4b69-86a9-e53fa94cd4b2',NULL,'client-jwt','itesoft','c277c38d-773e-4b0c-91bd-1627927005f0',2,20,'\0',NULL,NULL),('ec0bb138-bdd6-4cf3-8a75-7958437a0c43',NULL,'direct-grant-validate-username','itesoft','842bcabe-d53a-4669-b4b8-70b8dfbfd590',0,10,'\0',NULL,NULL),('f8c9a89b-ff97-4af9-aeee-d6038170ae2d',NULL,'idp-create-user-if-unique','master','31eba8b2-28ad-4bc5-9a24-a919b701039e',2,20,'\0',NULL,'889c455d-5c3f-4bfc-8a97-3752f22a56f7'),('f9c4cd45-94ec-4715-a7cc-fe6a297d5fa6',NULL,'direct-grant-validate-password','master','8bb0480a-a05e-4be5-9858-681c1dcbe867',0,20,'\0',NULL,NULL),('f9e8d50f-04fc-494e-ac8f-ebc78169221f',NULL,'reset-credentials-choose-user','itesoft','5896ed51-07cf-4478-b3fb-057b7ced2eb5',0,10,'\0',NULL,NULL),('fe16673b-d7e7-4d52-a848-80d61bd63051',NULL,'idp-review-profile','itesoft','07d529de-0233-44cc-bd0f-61559fc61228',0,10,'\0',NULL,'64659219-45d7-4611-bae7-5f0692f9bfa7');
/*!40000 ALTER TABLE `AUTHENTICATION_EXECUTION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AUTHENTICATION_FLOW`
--

DROP TABLE IF EXISTS `AUTHENTICATION_FLOW`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AUTHENTICATION_FLOW` (
  `ID` varchar(36) NOT NULL,
  `ALIAS` varchar(255) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `PROVIDER_ID` varchar(36) NOT NULL DEFAULT 'basic-flow',
  `TOP_LEVEL` bit(1) NOT NULL DEFAULT b'0',
  `BUILT_IN` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`ID`),
  KEY `FK_AUTH_FLOW_REALM` (`REALM_ID`),
  CONSTRAINT `FK_AUTH_FLOW_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AUTHENTICATION_FLOW`
--

LOCK TABLES `AUTHENTICATION_FLOW` WRITE;
/*!40000 ALTER TABLE `AUTHENTICATION_FLOW` DISABLE KEYS */;
INSERT INTO `AUTHENTICATION_FLOW` VALUES ('07d529de-0233-44cc-bd0f-61559fc61228','first broker login','Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account','itesoft','basic-flow','',''),('1ceb7956-99d3-4029-a828-a2fc06a78cbb','forms','Username, password, otp and other auth forms.','itesoft','basic-flow','\0',''),('2999029a-7c5b-4525-96b5-804e96bf4069','forms','Username, password, otp and other auth forms.','master','basic-flow','\0',''),('31eba8b2-28ad-4bc5-9a24-a919b701039e','first broker login','Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account','master','basic-flow','',''),('4b0d1947-8eb6-4a5c-91f8-b00c182489c9','registration','registration flow','master','basic-flow','',''),('5896ed51-07cf-4478-b3fb-057b7ced2eb5','reset credentials','Reset credentials for a user if they forgot their password or something','itesoft','basic-flow','',''),('6db58451-2440-4d71-8bfe-564407705cf0','Verify Existing Account by Re-authentication','Reauthentication of existing account','itesoft','basic-flow','\0',''),('6eb129a6-2471-4f6d-b851-3919fc9696dd','Handle Existing Account','Handle what to do if there is existing account with same email/username like authenticated identity provider','master','basic-flow','\0',''),('74a7dd1e-339d-4211-981f-1d8d304abe95','browser','browser based authentication','itesoft','basic-flow','',''),('835f475c-ec2d-4c77-8396-3b7a2f35fbc7','registration','registration flow','itesoft','basic-flow','',''),('842bcabe-d53a-4669-b4b8-70b8dfbfd590','direct grant','OpenID Connect Resource Owner Grant','itesoft','basic-flow','',''),('8bb0480a-a05e-4be5-9858-681c1dcbe867','direct grant','OpenID Connect Resource Owner Grant','master','basic-flow','',''),('96891a6b-fee2-4989-9d8f-73f6ad82ef70','browser','browser based authentication','master','basic-flow','',''),('a41f352b-5e65-4fdf-9944-7e02c1810d3a','registration form','registration form','itesoft','form-flow','\0',''),('a828fc19-9549-4adf-aa2a-5c6024b1bfde','Handle Existing Account','Handle what to do if there is existing account with same email/username like authenticated identity provider','itesoft','basic-flow','\0',''),('abcde03e-ae76-43e1-82af-b53f852e417f','reset credentials','Reset credentials for a user if they forgot their password or something','master','basic-flow','',''),('c277c38d-773e-4b0c-91bd-1627927005f0','clients','Base authentication for clients','itesoft','client-flow','',''),('c9a4a7b7-f851-4b52-87f0-5d827e3663ec','clients','Base authentication for clients','master','client-flow','',''),('dc326cd5-b562-41fd-8a7a-67a059bb4a3a','Verify Existing Account by Re-authentication','Reauthentication of existing account','master','basic-flow','\0',''),('ebe4b75a-ed73-412c-86d5-20a64ee99fca','registration form','registration form','master','form-flow','\0','');
/*!40000 ALTER TABLE `AUTHENTICATION_FLOW` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AUTHENTICATOR_CONFIG`
--

DROP TABLE IF EXISTS `AUTHENTICATOR_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AUTHENTICATOR_CONFIG` (
  `ID` varchar(36) NOT NULL,
  `ALIAS` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_AUTH_REALM` (`REALM_ID`),
  CONSTRAINT `FK_AUTH_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AUTHENTICATOR_CONFIG`
--

LOCK TABLES `AUTHENTICATOR_CONFIG` WRITE;
/*!40000 ALTER TABLE `AUTHENTICATOR_CONFIG` DISABLE KEYS */;
INSERT INTO `AUTHENTICATOR_CONFIG` VALUES ('128fcbe1-543c-42c6-81f2-0224ac3aa3c4','create unique user config','itesoft'),('64659219-45d7-4611-bae7-5f0692f9bfa7','review profile config','itesoft'),('84eaabb0-2a66-46d4-84db-e80d62ecf30d','review profile config','master'),('889c455d-5c3f-4bfc-8a97-3752f22a56f7','create unique user config','master');
/*!40000 ALTER TABLE `AUTHENTICATOR_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AUTHENTICATOR_CONFIG_ENTRY`
--

DROP TABLE IF EXISTS `AUTHENTICATOR_CONFIG_ENTRY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AUTHENTICATOR_CONFIG_ENTRY` (
  `AUTHENTICATOR_ID` varchar(36) NOT NULL,
  `VALUE` longtext,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`AUTHENTICATOR_ID`,`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AUTHENTICATOR_CONFIG_ENTRY`
--

LOCK TABLES `AUTHENTICATOR_CONFIG_ENTRY` WRITE;
/*!40000 ALTER TABLE `AUTHENTICATOR_CONFIG_ENTRY` DISABLE KEYS */;
INSERT INTO `AUTHENTICATOR_CONFIG_ENTRY` VALUES ('128fcbe1-543c-42c6-81f2-0224ac3aa3c4','false','require.password.update.after.registration'),('64659219-45d7-4611-bae7-5f0692f9bfa7','missing','update.profile.on.first.login'),('84eaabb0-2a66-46d4-84db-e80d62ecf30d','missing','update.profile.on.first.login'),('889c455d-5c3f-4bfc-8a97-3752f22a56f7','false','require.password.update.after.registration');
/*!40000 ALTER TABLE `AUTHENTICATOR_CONFIG_ENTRY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT`
--

DROP TABLE IF EXISTS `CLIENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CLIENT` (
  `ID` varchar(36) NOT NULL,
  `ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `FULL_SCOPE_ALLOWED` bit(1) NOT NULL DEFAULT b'0',
  `CLIENT_ID` varchar(255) DEFAULT NULL,
  `NOT_BEFORE` int(11) DEFAULT NULL,
  `PUBLIC_CLIENT` bit(1) NOT NULL DEFAULT b'0',
  `SECRET` varchar(255) DEFAULT NULL,
  `BASE_URL` varchar(255) DEFAULT NULL,
  `BEARER_ONLY` bit(1) NOT NULL DEFAULT b'0',
  `MANAGEMENT_URL` varchar(255) DEFAULT NULL,
  `SURROGATE_AUTH_REQUIRED` bit(1) NOT NULL DEFAULT b'0',
  `REALM_ID` varchar(36) DEFAULT NULL,
  `PROTOCOL` varchar(255) DEFAULT NULL,
  `NODE_REREG_TIMEOUT` int(11) DEFAULT '0',
  `FRONTCHANNEL_LOGOUT` bit(1) NOT NULL DEFAULT b'0',
  `CONSENT_REQUIRED` bit(1) NOT NULL DEFAULT b'0',
  `NAME` varchar(255) DEFAULT NULL,
  `SERVICE_ACCOUNTS_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `CLIENT_AUTHENTICATOR_TYPE` varchar(255) DEFAULT NULL,
  `ROOT_URL` varchar(255) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `REGISTRATION_TOKEN` varchar(255) DEFAULT NULL,
  `STANDARD_FLOW_ENABLED` bit(1) NOT NULL DEFAULT b'1',
  `IMPLICIT_FLOW_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `DIRECT_ACCESS_GRANTS_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_B71CJLBENV945RB6GCON438AT` (`REALM_ID`,`CLIENT_ID`),
  CONSTRAINT `FK_P56CTINXXB9GSK57FO49F9TAC` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT`
--

LOCK TABLES `CLIENT` WRITE;
/*!40000 ALTER TABLE `CLIENT` DISABLE KEYS */;
INSERT INTO `CLIENT` VALUES ('064f5c8b-d948-4923-923f-d67569c61d2c','','','itesoft-realm',0,'\0','9e35605e-68cc-4d14-8aa6-3927ee92361b',NULL,'',NULL,'\0','master',NULL,0,'\0','\0','itesoft Realm','\0','client-secret',NULL,NULL,NULL,'','\0','\0'),('39238724-3f56-427b-bde1-46844130b205','','\0','security-admin-console',0,'','0164fa7b-21a4-429c-aa7f-c62d231f9731','/auth/admin/itesoft/console/index.html','\0',NULL,'\0','itesoft',NULL,0,'\0','\0','${client_security-admin-console}','\0','client-secret',NULL,NULL,NULL,'','\0','\0'),('3d4f25da-6732-4a75-8bca-4e2e87efeb5d','','\0','account',0,'\0','61eba914-4b10-46aa-a179-65f9afa89f1f','/auth/realms/master/account','\0',NULL,'\0','master',NULL,0,'\0','\0','${client_account}','\0','client-secret',NULL,NULL,NULL,'','\0','\0'),('41efe014-736d-41c6-8240-1a253c8d63af','','\0','broker',0,'\0','fa483f8c-0744-4fb3-8de5-f00d81027787',NULL,'\0',NULL,'\0','itesoft',NULL,0,'\0','\0','${client_broker}','\0','client-secret',NULL,NULL,NULL,'','\0','\0'),('42582697-7e79-491d-8559-ae07bc6408ae','','\0','security-admin-console',0,'','914a2d6b-0fd7-4b3d-9ed9-4398059b8a3f','/auth/admin/master/console/index.html','\0',NULL,'\0','master',NULL,0,'\0','\0','${client_security-admin-console}','\0','client-secret',NULL,NULL,NULL,'','\0','\0'),('679f9c84-39c2-4300-929b-8b0bf875e85e','','','master-realm',0,'\0','2df70f9d-4cbd-4d06-9e83-69ad72d3808a',NULL,'',NULL,'\0','master',NULL,0,'\0','\0','master Realm','\0','client-secret',NULL,NULL,NULL,'','\0','\0'),('68a6d182-a55b-49de-92fc-0c48a4abd2a8','','\0','admin-cli',0,'','32c9f6d2-db9e-48d4-90bf-c699ab4e6ee6',NULL,'\0',NULL,'\0','itesoft',NULL,0,'\0','\0','${client_admin-cli}','\0','client-secret',NULL,NULL,NULL,'\0','\0',''),('74e4631d-ad8e-4634-bcfc-341abc22c533','','\0','admin-cli',0,'','96f87a69-a22b-4335-a821-938a5f68dcd7',NULL,'\0',NULL,'\0','master',NULL,0,'\0','\0','${client_admin-cli}','\0','client-secret',NULL,NULL,NULL,'\0','\0',''),('7b18d0f1-b433-4cbd-b43c-481ef43518dd','','\0','account',0,'\0','d7e80221-671a-46a8-93db-e8d836acafde','/auth/realms/itesoft/account','\0',NULL,'\0','itesoft',NULL,0,'\0','\0','${client_account}','\0','client-secret',NULL,NULL,NULL,'','\0','\0'),('a5aad6e5-6d25-4c09-a971-0654cfd9dce9','','\0','realm-management',0,'\0','f5da825c-37af-4954-a1a0-8334335d606a',NULL,'',NULL,'\0','itesoft',NULL,0,'\0','\0','${client_realm-management}','\0','client-secret',NULL,NULL,NULL,'','\0','\0'),('fcba708e-4cb6-40a4-b527-7769e0018a0c','','\0','broker',0,'\0','f2c71717-3b99-4f0b-a94f-d4146403502a',NULL,'\0',NULL,'\0','master',NULL,0,'\0','\0','${client_broker}','\0','client-secret',NULL,NULL,NULL,'','\0','\0');
/*!40000 ALTER TABLE `CLIENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_ATTRIBUTES`
--

DROP TABLE IF EXISTS `CLIENT_ATTRIBUTES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CLIENT_ATTRIBUTES` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `VALUE` varchar(2048) DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`NAME`),
  CONSTRAINT `FK3C47C64BEACCA966` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_ATTRIBUTES`
--

LOCK TABLES `CLIENT_ATTRIBUTES` WRITE;
/*!40000 ALTER TABLE `CLIENT_ATTRIBUTES` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_ATTRIBUTES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_DEFAULT_ROLES`
--

DROP TABLE IF EXISTS `CLIENT_DEFAULT_ROLES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CLIENT_DEFAULT_ROLES` (
  `CLIENT_ID` varchar(36) DEFAULT NULL,
  `ROLE_ID` varchar(36) NOT NULL,
  UNIQUE KEY `UK_8AELWNIBJI49AVXSRTUF6XJOW` (`ROLE_ID`),
  KEY `FK_NUILTS7KLWQW2H8M2B5JOYTKY` (`CLIENT_ID`),
  CONSTRAINT `FK_8AELWNIBJI49AVXSRTUF6XJOW` FOREIGN KEY (`ROLE_ID`) REFERENCES `KEYCLOAK_ROLE` (`ID`),
  CONSTRAINT `FK_NUILTS7KLWQW2H8M2B5JOYTKY` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_DEFAULT_ROLES`
--

LOCK TABLES `CLIENT_DEFAULT_ROLES` WRITE;
/*!40000 ALTER TABLE `CLIENT_DEFAULT_ROLES` DISABLE KEYS */;
INSERT INTO `CLIENT_DEFAULT_ROLES` VALUES ('3d4f25da-6732-4a75-8bca-4e2e87efeb5d','82494c54-ef8b-4412-98b5-08a9a8c8010f'),('3d4f25da-6732-4a75-8bca-4e2e87efeb5d','d6e7ef07-0f3b-427f-bbff-1b8ba2802cd7'),('7b18d0f1-b433-4cbd-b43c-481ef43518dd','358916ed-1d6a-4602-becf-b32ee6f43e2d'),('7b18d0f1-b433-4cbd-b43c-481ef43518dd','604b65f5-4896-48f2-9390-acbf841adcf7');
/*!40000 ALTER TABLE `CLIENT_DEFAULT_ROLES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_IDENTITY_PROV_MAPPING`
--

DROP TABLE IF EXISTS `CLIENT_IDENTITY_PROV_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CLIENT_IDENTITY_PROV_MAPPING` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `IDENTITY_PROVIDER_ID` varchar(36) NOT NULL,
  `RETRIEVE_TOKEN` bit(1) NOT NULL DEFAULT b'0',
  UNIQUE KEY `UK_7CAELWNIBJI49AVXSRTUF6XJ12` (`IDENTITY_PROVIDER_ID`,`CLIENT_ID`),
  KEY `FK_56ELWNIBJI49AVXSRTUF6XJ23` (`CLIENT_ID`),
  CONSTRAINT `FK_56ELWNIBJI49AVXSRTUF6XJ23` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`),
  CONSTRAINT `FK_7CELWNIBJI49AVXSRTUF6XJ12` FOREIGN KEY (`IDENTITY_PROVIDER_ID`) REFERENCES `IDENTITY_PROVIDER` (`INTERNAL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_IDENTITY_PROV_MAPPING`
--

LOCK TABLES `CLIENT_IDENTITY_PROV_MAPPING` WRITE;
/*!40000 ALTER TABLE `CLIENT_IDENTITY_PROV_MAPPING` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_IDENTITY_PROV_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_NODE_REGISTRATIONS`
--

DROP TABLE IF EXISTS `CLIENT_NODE_REGISTRATIONS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CLIENT_NODE_REGISTRATIONS` (
  `CLIENT_ID` varchar(36) NOT NULL DEFAULT '',
  `VALUE` int(11) DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`NAME`),
  CONSTRAINT `FK4129723BA992F594` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_NODE_REGISTRATIONS`
--

LOCK TABLES `CLIENT_NODE_REGISTRATIONS` WRITE;
/*!40000 ALTER TABLE `CLIENT_NODE_REGISTRATIONS` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_NODE_REGISTRATIONS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SESSION`
--

DROP TABLE IF EXISTS `CLIENT_SESSION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CLIENT_SESSION` (
  `ID` varchar(36) NOT NULL,
  `CLIENT_ID` varchar(36) DEFAULT NULL,
  `REDIRECT_URI` varchar(255) DEFAULT NULL,
  `STATE` varchar(255) DEFAULT NULL,
  `TIMESTAMP` int(11) DEFAULT NULL,
  `SESSION_ID` varchar(36) DEFAULT NULL,
  `AUTH_METHOD` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `AUTH_USER_ID` varchar(36) DEFAULT NULL,
  `CURRENT_ACTION` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_B4AO2VCVAT6UKAU74WBWTFQO1` (`SESSION_ID`),
  CONSTRAINT `FK_B4AO2VCVAT6UKAU74WBWTFQO1` FOREIGN KEY (`SESSION_ID`) REFERENCES `USER_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SESSION`
--

LOCK TABLES `CLIENT_SESSION` WRITE;
/*!40000 ALTER TABLE `CLIENT_SESSION` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_SESSION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SESSION_AUTH_STATUS`
--

DROP TABLE IF EXISTS `CLIENT_SESSION_AUTH_STATUS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CLIENT_SESSION_AUTH_STATUS` (
  `AUTHENTICATOR` varchar(36) NOT NULL,
  `STATUS` int(11) DEFAULT NULL,
  `CLIENT_SESSION` varchar(36) NOT NULL,
  PRIMARY KEY (`CLIENT_SESSION`,`AUTHENTICATOR`),
  CONSTRAINT `AUTH_STATUS_CONSTRAINT` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `CLIENT_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SESSION_AUTH_STATUS`
--

LOCK TABLES `CLIENT_SESSION_AUTH_STATUS` WRITE;
/*!40000 ALTER TABLE `CLIENT_SESSION_AUTH_STATUS` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_SESSION_AUTH_STATUS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SESSION_NOTE`
--

DROP TABLE IF EXISTS `CLIENT_SESSION_NOTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CLIENT_SESSION_NOTE` (
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `CLIENT_SESSION` varchar(36) NOT NULL,
  PRIMARY KEY (`CLIENT_SESSION`,`NAME`),
  CONSTRAINT `FK5EDFB00FF51C2736` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `CLIENT_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SESSION_NOTE`
--

LOCK TABLES `CLIENT_SESSION_NOTE` WRITE;
/*!40000 ALTER TABLE `CLIENT_SESSION_NOTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_SESSION_NOTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SESSION_PROT_MAPPER`
--

DROP TABLE IF EXISTS `CLIENT_SESSION_PROT_MAPPER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CLIENT_SESSION_PROT_MAPPER` (
  `PROTOCOL_MAPPER_ID` varchar(36) NOT NULL,
  `CLIENT_SESSION` varchar(36) NOT NULL,
  PRIMARY KEY (`CLIENT_SESSION`,`PROTOCOL_MAPPER_ID`),
  CONSTRAINT `FK_33A8SGQW18I532811V7O2DK89` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `CLIENT_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SESSION_PROT_MAPPER`
--

LOCK TABLES `CLIENT_SESSION_PROT_MAPPER` WRITE;
/*!40000 ALTER TABLE `CLIENT_SESSION_PROT_MAPPER` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_SESSION_PROT_MAPPER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SESSION_ROLE`
--

DROP TABLE IF EXISTS `CLIENT_SESSION_ROLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CLIENT_SESSION_ROLE` (
  `ROLE_ID` varchar(255) NOT NULL,
  `CLIENT_SESSION` varchar(36) NOT NULL,
  PRIMARY KEY (`CLIENT_SESSION`,`ROLE_ID`),
  CONSTRAINT `FK_11B7SGQW18I532811V7O2DV76` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `CLIENT_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SESSION_ROLE`
--

LOCK TABLES `CLIENT_SESSION_ROLE` WRITE;
/*!40000 ALTER TABLE `CLIENT_SESSION_ROLE` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_SESSION_ROLE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_USER_SESSION_NOTE`
--

DROP TABLE IF EXISTS `CLIENT_USER_SESSION_NOTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CLIENT_USER_SESSION_NOTE` (
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(2048) DEFAULT NULL,
  `CLIENT_SESSION` varchar(36) NOT NULL,
  PRIMARY KEY (`CLIENT_SESSION`,`NAME`),
  CONSTRAINT `FK_CL_USR_SES_NOTE` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `CLIENT_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_USER_SESSION_NOTE`
--

LOCK TABLES `CLIENT_USER_SESSION_NOTE` WRITE;
/*!40000 ALTER TABLE `CLIENT_USER_SESSION_NOTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_USER_SESSION_NOTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `COMPOSITE_ROLE`
--

DROP TABLE IF EXISTS `COMPOSITE_ROLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `COMPOSITE_ROLE` (
  `COMPOSITE` varchar(36) NOT NULL,
  `CHILD_ROLE` varchar(36) NOT NULL,
  KEY `FK_A63WVEKFTU8JO1PNJ81E7MCE2` (`COMPOSITE`),
  KEY `FK_GR7THLLB9LU8Q4VQA4524JJY8` (`CHILD_ROLE`),
  CONSTRAINT `FK_A63WVEKFTU8JO1PNJ81E7MCE2` FOREIGN KEY (`COMPOSITE`) REFERENCES `KEYCLOAK_ROLE` (`ID`),
  CONSTRAINT `FK_GR7THLLB9LU8Q4VQA4524JJY8` FOREIGN KEY (`CHILD_ROLE`) REFERENCES `KEYCLOAK_ROLE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `COMPOSITE_ROLE`
--

LOCK TABLES `COMPOSITE_ROLE` WRITE;
/*!40000 ALTER TABLE `COMPOSITE_ROLE` DISABLE KEYS */;
INSERT INTO `COMPOSITE_ROLE` VALUES ('8e33d585-66f9-4705-9d7e-f666da51257a','21cf52ef-fbae-488c-88bc-84776c796189'),('8e33d585-66f9-4705-9d7e-f666da51257a','1f05f5f5-37fe-4118-9bb6-11093e897d08'),('8e33d585-66f9-4705-9d7e-f666da51257a','1d332c47-ed93-4f8e-88d9-4939912972db'),('8e33d585-66f9-4705-9d7e-f666da51257a','7b7cc7ca-987a-4d88-baed-a8ca04e1b327'),('8e33d585-66f9-4705-9d7e-f666da51257a','3525ce97-3349-4924-8a02-6fc16cee6c79'),('8e33d585-66f9-4705-9d7e-f666da51257a','ac9a1e86-9722-404c-95da-919b0ee27ce8'),('8e33d585-66f9-4705-9d7e-f666da51257a','54f7d868-0415-4f70-9508-616b59114eb8'),('8e33d585-66f9-4705-9d7e-f666da51257a','9b6064bd-1f66-451e-a864-524fb5544c62'),('8e33d585-66f9-4705-9d7e-f666da51257a','a90ab45e-a615-4ea6-bb7a-3c439b12bfad'),('8e33d585-66f9-4705-9d7e-f666da51257a','68402144-8b7f-4a8d-9c4d-565c91e0ac49'),('8e33d585-66f9-4705-9d7e-f666da51257a','85fda6d6-fe9e-4368-a1e1-7b89a42e0490'),('8e33d585-66f9-4705-9d7e-f666da51257a','fe8bf752-9d60-42fa-b09a-dbb3281a6479'),('8e33d585-66f9-4705-9d7e-f666da51257a','82760acd-589a-4bed-b34d-a78cfc6f2c57'),('8e33d585-66f9-4705-9d7e-f666da51257a','09838fa7-3520-41e2-bc00-d74260ee82a8'),('8e33d585-66f9-4705-9d7e-f666da51257a','47215bdc-cf85-42d1-8e82-31270692d154'),('8e33d585-66f9-4705-9d7e-f666da51257a','6999a2a7-ed01-44bd-a0ab-da715375bb50'),('8e33d585-66f9-4705-9d7e-f666da51257a','c3452a78-2677-4730-92af-31526d5f0402'),('8e33d585-66f9-4705-9d7e-f666da51257a','599cabdf-73ad-4fc4-89d2-fdcfdcf6afb3'),('8e33d585-66f9-4705-9d7e-f666da51257a','85b501d7-378d-4c29-aae2-449442997c8b'),('8e33d585-66f9-4705-9d7e-f666da51257a','aafd26a6-b028-4094-ba25-3d2ff987a2aa'),('8e33d585-66f9-4705-9d7e-f666da51257a','497f059f-d902-4874-b14a-b6d2e09a86f1'),('8e33d585-66f9-4705-9d7e-f666da51257a','3c03d7e0-1507-4000-b1de-c636065ab419'),('8e33d585-66f9-4705-9d7e-f666da51257a','329368b4-6ebe-4262-8357-0ec68038425e'),('8e33d585-66f9-4705-9d7e-f666da51257a','b3153522-fd4a-4b6e-8ca9-f698d7fdcd9c'),('8e33d585-66f9-4705-9d7e-f666da51257a','1fa4eb8c-3007-47d8-8574-f30c1b5a3640'),('c53374e2-052a-4d69-a00a-ff978e628f24','a8e05df9-35a6-4f80-8ddb-ace811426bc5'),('c53374e2-052a-4d69-a00a-ff978e628f24','d4f4354c-dd56-4881-9105-acb461d5c995'),('c53374e2-052a-4d69-a00a-ff978e628f24','c700f482-6251-4292-bb9c-95b5e4fe4f28'),('c53374e2-052a-4d69-a00a-ff978e628f24','80cae253-b57f-4ae3-94ed-ead77247e732'),('c53374e2-052a-4d69-a00a-ff978e628f24','1faf4f34-8898-46e8-981b-9a457f818ba4'),('c53374e2-052a-4d69-a00a-ff978e628f24','c810e890-be8e-483e-b43a-1f8b04b1cc7b'),('c53374e2-052a-4d69-a00a-ff978e628f24','15308199-3894-4923-b747-f054db952ea4'),('c53374e2-052a-4d69-a00a-ff978e628f24','1cccee2d-1b3d-417b-bde1-01e05a06bdf7'),('c53374e2-052a-4d69-a00a-ff978e628f24','070a1a1d-a5fd-4e3e-9792-bee0505b45c6'),('c53374e2-052a-4d69-a00a-ff978e628f24','a28da220-ea29-4706-857b-3464d0d58fbe'),('c53374e2-052a-4d69-a00a-ff978e628f24','0f223988-6f9b-4873-9e53-13ddcabcd752'),('c53374e2-052a-4d69-a00a-ff978e628f24','0e753f45-7cf3-459e-94ac-cfedd43cc670');
/*!40000 ALTER TABLE `COMPOSITE_ROLE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CREDENTIAL`
--

DROP TABLE IF EXISTS `CREDENTIAL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CREDENTIAL` (
  `ID` varchar(36) NOT NULL,
  `DEVICE` varchar(255) DEFAULT NULL,
  `HASH_ITERATIONS` int(11) DEFAULT NULL,
  `SALT` blob,
  `TYPE` varchar(255) DEFAULT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `USER_ID` varchar(36) DEFAULT NULL,
  `CREATED_DATE` bigint(20) DEFAULT NULL,
  `COUNTER` int(11) DEFAULT '0',
  `DIGITS` int(11) DEFAULT '6',
  `PERIOD` int(11) DEFAULT '30',
  `ALGORITHM` varchar(36) DEFAULT 'HmacSHA1',
  PRIMARY KEY (`ID`),
  KEY `FK_PFYR0GLASQYL0DEI3KL69R6V0` (`USER_ID`),
  CONSTRAINT `FK_PFYR0GLASQYL0DEI3KL69R6V0` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CREDENTIAL`
--

LOCK TABLES `CREDENTIAL` WRITE;
/*!40000 ALTER TABLE `CREDENTIAL` DISABLE KEYS */;
INSERT INTO `CREDENTIAL` VALUES ('bbde0cfb-ab82-4156-9aa4-b4a5be0c35ea',NULL,1,'��}�v���<�7���','password','zuQmoZ3aJTSHejiCsSQC8gDYJnOq/4eBFp16hw9tIDmEaFryFrBpvRa1zVv19G+NpTw59f0JvNCWk2/FyahWxQ==','3eeb7d53-0b3d-4133-ba77-44bed88b2005',1449592708000,0,0,0,NULL);
/*!40000 ALTER TABLE `CREDENTIAL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DATABASECHANGELOG`
--

DROP TABLE IF EXISTS `DATABASECHANGELOG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DATABASECHANGELOG` (
  `ID` varchar(255) NOT NULL,
  `AUTHOR` varchar(255) NOT NULL,
  `FILENAME` varchar(255) NOT NULL,
  `DATEEXECUTED` datetime NOT NULL,
  `ORDEREXECUTED` int(11) NOT NULL,
  `EXECTYPE` varchar(10) NOT NULL,
  `MD5SUM` varchar(35) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `COMMENTS` varchar(255) DEFAULT NULL,
  `TAG` varchar(255) DEFAULT NULL,
  `LIQUIBASE` varchar(20) DEFAULT NULL,
  `CONTEXTS` varchar(255) DEFAULT NULL,
  `LABELS` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DATABASECHANGELOG`
--

LOCK TABLES `DATABASECHANGELOG` WRITE;
/*!40000 ALTER TABLE `DATABASECHANGELOG` DISABLE KEYS */;
INSERT INTO `DATABASECHANGELOG` VALUES ('1.0.0.Final','sthorger@redhat.com','META-INF/jpa-changelog-1.0.0.Final.xml','2015-12-08 16:35:35',1,'EXECUTED','7:00a57f7a6fb456639b34e62972e0ec02','createTable (x29), addPrimaryKey (x21), addUniqueConstraint (x9), addForeignKeyConstraint (x32)','',NULL,'3.4.1',NULL,NULL),('1.1.0.Beta1','sthorger@redhat.com','META-INF/jpa-changelog-1.1.0.Beta1.xml','2015-12-08 16:35:39',2,'EXECUTED','7:0310eb8ba07cec616460794d42ade0fa','delete (x3), createTable (x3), addColumn (x5), addPrimaryKey (x3), addForeignKeyConstraint (x3), customChange','',NULL,'3.4.1',NULL,NULL),('1.1.0.Final','sthorger@redhat.com','META-INF/jpa-changelog-1.1.0.Final.xml','2015-12-08 16:35:39',3,'EXECUTED','7:5d25857e708c3233ef4439df1f93f012','renameColumn','',NULL,'3.4.1',NULL,NULL),('1.2.0.Beta1','psilva@redhat.com','META-INF/jpa-changelog-1.2.0.Beta1.xml','2015-12-08 16:35:42',4,'EXECUTED','7:c7a54a1041d58eb3817a4a883b4d4e84','delete (x4), createTable (x8), addColumn (x2), addPrimaryKey (x6), addForeignKeyConstraint (x9), addUniqueConstraint (x2), addColumn, dropForeignKeyConstraint (x2), dropUniqueConstraint, renameColumn (x3), addUniqueConstraint, addForeignKeyConstra...','',NULL,'3.4.1',NULL,NULL),('1.2.0.RC1','bburke@redhat.com','META-INF/jpa-changelog-1.2.0.CR1.xml','2015-12-08 16:35:45',5,'EXECUTED','7:0f08df48468428e0f30ee59a8ec01a41','delete (x5), createTable (x3), addColumn, createTable (x4), addPrimaryKey (x7), addForeignKeyConstraint (x6), renameColumn, addColumn (x2), update, dropColumn, dropForeignKeyConstraint, renameColumn, addForeignKeyConstraint, dropForeignKeyConstrai...','',NULL,'3.4.1',NULL,NULL),('1.2.0.Final','keycloak','META-INF/jpa-changelog-1.2.0.Final.xml','2015-12-08 16:35:45',6,'EXECUTED','7:a3377a2059aefbf3b90ebb4c4cc8e2ab','update (x3)','',NULL,'3.4.1',NULL,NULL),('1.3.0','bburke@redhat.com','META-INF/jpa-changelog-1.3.0.xml','2015-12-08 16:35:47',7,'EXECUTED','7:04c1dbedc2aa3e9756d1a1668e003451','delete (x6), createTable (x7), addColumn, createTable, addColumn (x2), update, dropDefaultValue, dropColumn, addColumn, update (x4), addPrimaryKey (x4), dropPrimaryKey, dropColumn, addPrimaryKey (x4), addForeignKeyConstraint (x8), dropDefaultValue...','',NULL,'3.4.1',NULL,NULL),('1.4.0','bburke@redhat.com','META-INF/jpa-changelog-1.4.0.xml','2015-12-08 16:35:48',8,'EXECUTED','7:36ef39ed560ad07062d956db861042ba','delete (x7), addColumn (x5), dropColumn, renameTable (x2), update (x10), createTable (x3), customChange, dropPrimaryKey, addPrimaryKey (x4), addForeignKeyConstraint (x2), dropColumn, addColumn','',NULL,'3.4.1',NULL,NULL),('1.5.0','bburke@redhat.com','META-INF/jpa-changelog-1.5.0.xml','2015-12-08 16:35:49',9,'EXECUTED','7:cf12b04b79bea5152f165eb41f3955f6','delete (x7), dropDefaultValue, dropColumn, addColumn (x3)','',NULL,'3.4.1',NULL,NULL),('1.6.1_from15','mposolda@redhat.com','META-INF/jpa-changelog-1.6.1.xml','2015-12-08 16:35:49',10,'EXECUTED','7:7e32c8f05c755e8675764e7d5f514509','addColumn (x3), createTable (x2), addPrimaryKey (x2)','',NULL,'3.4.1',NULL,NULL),('1.6.1_from16','mposolda@redhat.com','META-INF/jpa-changelog-1.6.1.xml','2015-12-08 16:35:49',11,'MARK_RAN','7:2fa220758991285312eb84f3b4ff5336','dropPrimaryKey (x2), addColumn, update, dropColumn, addColumn, update, dropColumn, addPrimaryKey (x2)','',NULL,'3.4.1',NULL,NULL),('1.6.1','mposolda@redhat.com','META-INF/jpa-changelog-1.6.1.xml','2015-12-08 16:35:49',12,'EXECUTED','7:d41d8cd98f00b204e9800998ecf8427e','Empty','',NULL,'3.4.1',NULL,NULL),('1.7.0','bburke@redhat.com','META-INF/jpa-changelog-1.7.0.xml','2015-12-08 16:35:51',13,'EXECUTED','7:91ace540896df890cc00a0490ee52bbc','createTable (x5), addColumn (x2), dropDefaultValue, dropColumn, addPrimaryKey, addForeignKeyConstraint, addPrimaryKey, addForeignKeyConstraint, addPrimaryKey, addForeignKeyConstraint, addPrimaryKey, addForeignKeyConstraint (x2), addUniqueConstrain...','',NULL,'3.4.1',NULL,NULL);
/*!40000 ALTER TABLE `DATABASECHANGELOG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DATABASECHANGELOGLOCK`
--

DROP TABLE IF EXISTS `DATABASECHANGELOGLOCK`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DATABASECHANGELOGLOCK` (
  `ID` int(11) NOT NULL,
  `LOCKED` bit(1) NOT NULL,
  `LOCKGRANTED` datetime DEFAULT NULL,
  `LOCKEDBY` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DATABASECHANGELOGLOCK`
--

LOCK TABLES `DATABASECHANGELOGLOCK` WRITE;
/*!40000 ALTER TABLE `DATABASECHANGELOGLOCK` DISABLE KEYS */;
INSERT INTO `DATABASECHANGELOGLOCK` VALUES (1,'\0',NULL,NULL);
/*!40000 ALTER TABLE `DATABASECHANGELOGLOCK` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EVENT_ENTITY`
--

DROP TABLE IF EXISTS `EVENT_ENTITY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EVENT_ENTITY` (
  `ID` varchar(36) NOT NULL,
  `CLIENT_ID` varchar(255) DEFAULT NULL,
  `DETAILS_JSON` varchar(2550) DEFAULT NULL,
  `ERROR` varchar(255) DEFAULT NULL,
  `IP_ADDRESS` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `SESSION_ID` varchar(255) DEFAULT NULL,
  `EVENT_TIME` bigint(20) DEFAULT NULL,
  `TYPE` varchar(255) DEFAULT NULL,
  `USER_ID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EVENT_ENTITY`
--

LOCK TABLES `EVENT_ENTITY` WRITE;
/*!40000 ALTER TABLE `EVENT_ENTITY` DISABLE KEYS */;
/*!40000 ALTER TABLE `EVENT_ENTITY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FEDERATED_IDENTITY`
--

DROP TABLE IF EXISTS `FEDERATED_IDENTITY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FEDERATED_IDENTITY` (
  `IDENTITY_PROVIDER` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `FEDERATED_USER_ID` varchar(255) DEFAULT NULL,
  `FEDERATED_USERNAME` varchar(255) DEFAULT NULL,
  `TOKEN` text,
  `USER_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`IDENTITY_PROVIDER`,`USER_ID`),
  KEY `FK404288B92EF007A6` (`USER_ID`),
  CONSTRAINT `FK404288B92EF007A6` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FEDERATED_IDENTITY`
--

LOCK TABLES `FEDERATED_IDENTITY` WRITE;
/*!40000 ALTER TABLE `FEDERATED_IDENTITY` DISABLE KEYS */;
/*!40000 ALTER TABLE `FEDERATED_IDENTITY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_PROVIDERS`
--

DROP TABLE IF EXISTS `FED_PROVIDERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FED_PROVIDERS` (
  `REALM_ID` varchar(36) NOT NULL,
  `USERFEDERATIONPROVIDERS_ID` varchar(36) NOT NULL,
  UNIQUE KEY `UK_DCCIRJLIPU1478VQC89DID88C` (`USERFEDERATIONPROVIDERS_ID`),
  KEY `FK_213LYQ09FKXQ8K8NY8DY3737T` (`REALM_ID`),
  CONSTRAINT `FK_213LYQ09FKXQ8K8NY8DY3737T` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`),
  CONSTRAINT `FK_DCCIRJLIPU1478VQC89DID88C` FOREIGN KEY (`USERFEDERATIONPROVIDERS_ID`) REFERENCES `USER_FEDERATION_PROVIDER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_PROVIDERS`
--

LOCK TABLES `FED_PROVIDERS` WRITE;
/*!40000 ALTER TABLE `FED_PROVIDERS` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_PROVIDERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GROUP_ATTRIBUTE`
--

DROP TABLE IF EXISTS `GROUP_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GROUP_ATTRIBUTE` (
  `ID` varchar(36) NOT NULL DEFAULT 'sybase-needs-something-here',
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `GROUP_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_GROUP_ATTRIBUTE_GROUP` (`GROUP_ID`),
  CONSTRAINT `FK_GROUP_ATTRIBUTE_GROUP` FOREIGN KEY (`GROUP_ID`) REFERENCES `KEYCLOAK_GROUP` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GROUP_ATTRIBUTE`
--

LOCK TABLES `GROUP_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `GROUP_ATTRIBUTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `GROUP_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GROUP_ROLE_MAPPING`
--

DROP TABLE IF EXISTS `GROUP_ROLE_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GROUP_ROLE_MAPPING` (
  `ROLE_ID` varchar(36) NOT NULL,
  `GROUP_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ROLE_ID`,`GROUP_ID`),
  KEY `FK_GROUP_ROLE_GROUP` (`GROUP_ID`),
  CONSTRAINT `FK_GROUP_ROLE_GROUP` FOREIGN KEY (`GROUP_ID`) REFERENCES `KEYCLOAK_GROUP` (`ID`),
  CONSTRAINT `FK_GROUP_ROLE_ROLE` FOREIGN KEY (`ROLE_ID`) REFERENCES `KEYCLOAK_ROLE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GROUP_ROLE_MAPPING`
--

LOCK TABLES `GROUP_ROLE_MAPPING` WRITE;
/*!40000 ALTER TABLE `GROUP_ROLE_MAPPING` DISABLE KEYS */;
/*!40000 ALTER TABLE `GROUP_ROLE_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDENTITY_PROVIDER`
--

DROP TABLE IF EXISTS `IDENTITY_PROVIDER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IDENTITY_PROVIDER` (
  `INTERNAL_ID` varchar(36) NOT NULL,
  `ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `PROVIDER_ALIAS` varchar(255) DEFAULT NULL,
  `PROVIDER_ID` varchar(255) DEFAULT NULL,
  `STORE_TOKEN` bit(1) NOT NULL DEFAULT b'0',
  `AUTHENTICATE_BY_DEFAULT` bit(1) NOT NULL DEFAULT b'0',
  `REALM_ID` varchar(36) DEFAULT NULL,
  `ADD_TOKEN_ROLE` bit(1) NOT NULL DEFAULT b'1',
  `TRUST_EMAIL` bit(1) NOT NULL DEFAULT b'0',
  `FIRST_BROKER_LOGIN_FLOW_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`INTERNAL_ID`),
  UNIQUE KEY `UK_2DAELWNIBJI49AVXSRTUF6XJ33` (`PROVIDER_ALIAS`,`REALM_ID`),
  KEY `FK2B4EBC52AE5C3B34` (`REALM_ID`),
  CONSTRAINT `FK2B4EBC52AE5C3B34` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDENTITY_PROVIDER`
--

LOCK TABLES `IDENTITY_PROVIDER` WRITE;
/*!40000 ALTER TABLE `IDENTITY_PROVIDER` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDENTITY_PROVIDER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDENTITY_PROVIDER_CONFIG`
--

DROP TABLE IF EXISTS `IDENTITY_PROVIDER_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IDENTITY_PROVIDER_CONFIG` (
  `IDENTITY_PROVIDER_ID` varchar(36) NOT NULL,
  `VALUE` longtext,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`IDENTITY_PROVIDER_ID`,`NAME`),
  CONSTRAINT `FKDC4897CF864C4E43` FOREIGN KEY (`IDENTITY_PROVIDER_ID`) REFERENCES `IDENTITY_PROVIDER` (`INTERNAL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDENTITY_PROVIDER_CONFIG`
--

LOCK TABLES `IDENTITY_PROVIDER_CONFIG` WRITE;
/*!40000 ALTER TABLE `IDENTITY_PROVIDER_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDENTITY_PROVIDER_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDENTITY_PROVIDER_MAPPER`
--

DROP TABLE IF EXISTS `IDENTITY_PROVIDER_MAPPER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IDENTITY_PROVIDER_MAPPER` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `IDP_ALIAS` varchar(255) NOT NULL,
  `IDP_MAPPER_NAME` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_IDPM_REALM` (`REALM_ID`),
  CONSTRAINT `FK_IDPM_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDENTITY_PROVIDER_MAPPER`
--

LOCK TABLES `IDENTITY_PROVIDER_MAPPER` WRITE;
/*!40000 ALTER TABLE `IDENTITY_PROVIDER_MAPPER` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDENTITY_PROVIDER_MAPPER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDP_MAPPER_CONFIG`
--

DROP TABLE IF EXISTS `IDP_MAPPER_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IDP_MAPPER_CONFIG` (
  `IDP_MAPPER_ID` varchar(36) NOT NULL,
  `VALUE` longtext,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`IDP_MAPPER_ID`,`NAME`),
  CONSTRAINT `FK_IDPMCONFIG` FOREIGN KEY (`IDP_MAPPER_ID`) REFERENCES `IDENTITY_PROVIDER_MAPPER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDP_MAPPER_CONFIG`
--

LOCK TABLES `IDP_MAPPER_CONFIG` WRITE;
/*!40000 ALTER TABLE `IDP_MAPPER_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDP_MAPPER_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `KEYCLOAK_GROUP`
--

DROP TABLE IF EXISTS `KEYCLOAK_GROUP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `KEYCLOAK_GROUP` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `PARENT_GROUP` varchar(36) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_GROUP_REALM` (`REALM_ID`),
  CONSTRAINT `FK_GROUP_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `KEYCLOAK_GROUP`
--

LOCK TABLES `KEYCLOAK_GROUP` WRITE;
/*!40000 ALTER TABLE `KEYCLOAK_GROUP` DISABLE KEYS */;
/*!40000 ALTER TABLE `KEYCLOAK_GROUP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `KEYCLOAK_ROLE`
--

DROP TABLE IF EXISTS `KEYCLOAK_ROLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `KEYCLOAK_ROLE` (
  `ID` varchar(36) NOT NULL,
  `CLIENT_REALM_CONSTRAINT` varchar(36) DEFAULT NULL,
  `CLIENT_ROLE` bit(1) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `CLIENT` varchar(36) DEFAULT NULL,
  `REALM` varchar(36) DEFAULT NULL,
  `SCOPE_PARAM_REQUIRED` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_J3RWUVD56ONTGSUHOGM184WW2-2` (`NAME`,`CLIENT_REALM_CONSTRAINT`),
  KEY `FK_6VYQFE4CN4WLQ8R6KT5VDSJ5C` (`REALM`),
  KEY `FK_KJHO5LE2C0RAL09FL8CM9WFW9` (`CLIENT`),
  CONSTRAINT `FK_6VYQFE4CN4WLQ8R6KT5VDSJ5C` FOREIGN KEY (`REALM`) REFERENCES `REALM` (`ID`),
  CONSTRAINT `FK_KJHO5LE2C0RAL09FL8CM9WFW9` FOREIGN KEY (`CLIENT`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `KEYCLOAK_ROLE`
--

LOCK TABLES `KEYCLOAK_ROLE` WRITE;
/*!40000 ALTER TABLE `KEYCLOAK_ROLE` DISABLE KEYS */;
INSERT INTO `KEYCLOAK_ROLE` VALUES ('070a1a1d-a5fd-4e3e-9792-bee0505b45c6','a5aad6e5-6d25-4c09-a971-0654cfd9dce9','','${role_manage-clients}','manage-clients','itesoft','a5aad6e5-6d25-4c09-a971-0654cfd9dce9',NULL,'\0'),('09838fa7-3520-41e2-bc00-d74260ee82a8','064f5c8b-d948-4923-923f-d67569c61d2c','','${role_create-client}','create-client','master','064f5c8b-d948-4923-923f-d67569c61d2c',NULL,'\0'),('0e753f45-7cf3-459e-94ac-cfedd43cc670','a5aad6e5-6d25-4c09-a971-0654cfd9dce9','','${role_impersonation}','impersonation','itesoft','a5aad6e5-6d25-4c09-a971-0654cfd9dce9',NULL,'\0'),('0f223988-6f9b-4873-9e53-13ddcabcd752','a5aad6e5-6d25-4c09-a971-0654cfd9dce9','','${role_manage-identity-providers}','manage-identity-providers','itesoft','a5aad6e5-6d25-4c09-a971-0654cfd9dce9',NULL,'\0'),('15308199-3894-4923-b747-f054db952ea4','a5aad6e5-6d25-4c09-a971-0654cfd9dce9','','${role_manage-realm}','manage-realm','itesoft','a5aad6e5-6d25-4c09-a971-0654cfd9dce9',NULL,'\0'),('1cccee2d-1b3d-417b-bde1-01e05a06bdf7','a5aad6e5-6d25-4c09-a971-0654cfd9dce9','','${role_manage-users}','manage-users','itesoft','a5aad6e5-6d25-4c09-a971-0654cfd9dce9',NULL,'\0'),('1d332c47-ed93-4f8e-88d9-4939912972db','679f9c84-39c2-4300-929b-8b0bf875e85e','','${role_view-realm}','view-realm','master','679f9c84-39c2-4300-929b-8b0bf875e85e',NULL,'\0'),('1f05f5f5-37fe-4118-9bb6-11093e897d08','679f9c84-39c2-4300-929b-8b0bf875e85e','','${role_create-client}','create-client','master','679f9c84-39c2-4300-929b-8b0bf875e85e',NULL,'\0'),('1fa4eb8c-3007-47d8-8574-f30c1b5a3640','064f5c8b-d948-4923-923f-d67569c61d2c','','${role_impersonation}','impersonation','master','064f5c8b-d948-4923-923f-d67569c61d2c',NULL,'\0'),('1faf4f34-8898-46e8-981b-9a457f818ba4','a5aad6e5-6d25-4c09-a971-0654cfd9dce9','','${role_view-events}','view-events','itesoft','a5aad6e5-6d25-4c09-a971-0654cfd9dce9',NULL,'\0'),('21cf52ef-fbae-488c-88bc-84776c796189','master','\0','${role_create-realm}','create-realm','master',NULL,'master','\0'),('329368b4-6ebe-4262-8357-0ec68038425e','064f5c8b-d948-4923-923f-d67569c61d2c','','${role_manage-events}','manage-events','master','064f5c8b-d948-4923-923f-d67569c61d2c',NULL,'\0'),('3525ce97-3349-4924-8a02-6fc16cee6c79','679f9c84-39c2-4300-929b-8b0bf875e85e','','${role_view-clients}','view-clients','master','679f9c84-39c2-4300-929b-8b0bf875e85e',NULL,'\0'),('358916ed-1d6a-4602-becf-b32ee6f43e2d','7b18d0f1-b433-4cbd-b43c-481ef43518dd','','${role_manage-account}','manage-account','itesoft','7b18d0f1-b433-4cbd-b43c-481ef43518dd',NULL,'\0'),('38655f62-e26e-4c1d-86c5-25e89be3286d','41efe014-736d-41c6-8240-1a253c8d63af','','${role_read-token}','read-token','itesoft','41efe014-736d-41c6-8240-1a253c8d63af',NULL,'\0'),('3c03d7e0-1507-4000-b1de-c636065ab419','064f5c8b-d948-4923-923f-d67569c61d2c','','${role_manage-clients}','manage-clients','master','064f5c8b-d948-4923-923f-d67569c61d2c',NULL,'\0'),('47215bdc-cf85-42d1-8e82-31270692d154','064f5c8b-d948-4923-923f-d67569c61d2c','','${role_view-realm}','view-realm','master','064f5c8b-d948-4923-923f-d67569c61d2c',NULL,'\0'),('497f059f-d902-4874-b14a-b6d2e09a86f1','064f5c8b-d948-4923-923f-d67569c61d2c','','${role_manage-users}','manage-users','master','064f5c8b-d948-4923-923f-d67569c61d2c',NULL,'\0'),('54f7d868-0415-4f70-9508-616b59114eb8','679f9c84-39c2-4300-929b-8b0bf875e85e','','${role_view-identity-providers}','view-identity-providers','master','679f9c84-39c2-4300-929b-8b0bf875e85e',NULL,'\0'),('599cabdf-73ad-4fc4-89d2-fdcfdcf6afb3','064f5c8b-d948-4923-923f-d67569c61d2c','','${role_view-events}','view-events','master','064f5c8b-d948-4923-923f-d67569c61d2c',NULL,'\0'),('604b65f5-4896-48f2-9390-acbf841adcf7','7b18d0f1-b433-4cbd-b43c-481ef43518dd','','${role_view-profile}','view-profile','itesoft','7b18d0f1-b433-4cbd-b43c-481ef43518dd',NULL,'\0'),('68402144-8b7f-4a8d-9c4d-565c91e0ac49','679f9c84-39c2-4300-929b-8b0bf875e85e','','${role_manage-clients}','manage-clients','master','679f9c84-39c2-4300-929b-8b0bf875e85e',NULL,'\0'),('6999a2a7-ed01-44bd-a0ab-da715375bb50','064f5c8b-d948-4923-923f-d67569c61d2c','','${role_view-users}','view-users','master','064f5c8b-d948-4923-923f-d67569c61d2c',NULL,'\0'),('6e0f6cb2-cf79-4b6f-a790-5a4ffb7dcbdc','master','\0','${role_offline-access}','offline_access','master',NULL,'master',''),('7b7cc7ca-987a-4d88-baed-a8ca04e1b327','679f9c84-39c2-4300-929b-8b0bf875e85e','','${role_view-users}','view-users','master','679f9c84-39c2-4300-929b-8b0bf875e85e',NULL,'\0'),('80cae253-b57f-4ae3-94ed-ead77247e732','a5aad6e5-6d25-4c09-a971-0654cfd9dce9','','${role_view-clients}','view-clients','itesoft','a5aad6e5-6d25-4c09-a971-0654cfd9dce9',NULL,'\0'),('82494c54-ef8b-4412-98b5-08a9a8c8010f','3d4f25da-6732-4a75-8bca-4e2e87efeb5d','','${role_manage-account}','manage-account','master','3d4f25da-6732-4a75-8bca-4e2e87efeb5d',NULL,'\0'),('82760acd-589a-4bed-b34d-a78cfc6f2c57','679f9c84-39c2-4300-929b-8b0bf875e85e','','${role_impersonation}','impersonation','master','679f9c84-39c2-4300-929b-8b0bf875e85e',NULL,'\0'),('85b501d7-378d-4c29-aae2-449442997c8b','064f5c8b-d948-4923-923f-d67569c61d2c','','${role_view-identity-providers}','view-identity-providers','master','064f5c8b-d948-4923-923f-d67569c61d2c',NULL,'\0'),('85fda6d6-fe9e-4368-a1e1-7b89a42e0490','679f9c84-39c2-4300-929b-8b0bf875e85e','','${role_manage-events}','manage-events','master','679f9c84-39c2-4300-929b-8b0bf875e85e',NULL,'\0'),('8e33d585-66f9-4705-9d7e-f666da51257a','master','\0','${role_admin}','admin','master',NULL,'master','\0'),('8f28588d-3f64-4a0e-9926-12e22b33c214','itesoft','\0','${role_offline-access}','offline_access','itesoft',NULL,'itesoft',''),('9b6064bd-1f66-451e-a864-524fb5544c62','679f9c84-39c2-4300-929b-8b0bf875e85e','','${role_manage-realm}','manage-realm','master','679f9c84-39c2-4300-929b-8b0bf875e85e',NULL,'\0'),('a28da220-ea29-4706-857b-3464d0d58fbe','a5aad6e5-6d25-4c09-a971-0654cfd9dce9','','${role_manage-events}','manage-events','itesoft','a5aad6e5-6d25-4c09-a971-0654cfd9dce9',NULL,'\0'),('a8e05df9-35a6-4f80-8ddb-ace811426bc5','a5aad6e5-6d25-4c09-a971-0654cfd9dce9','','${role_create-client}','create-client','itesoft','a5aad6e5-6d25-4c09-a971-0654cfd9dce9',NULL,'\0'),('a90ab45e-a615-4ea6-bb7a-3c439b12bfad','679f9c84-39c2-4300-929b-8b0bf875e85e','','${role_manage-users}','manage-users','master','679f9c84-39c2-4300-929b-8b0bf875e85e',NULL,'\0'),('aafd26a6-b028-4094-ba25-3d2ff987a2aa','064f5c8b-d948-4923-923f-d67569c61d2c','','${role_manage-realm}','manage-realm','master','064f5c8b-d948-4923-923f-d67569c61d2c',NULL,'\0'),('ac2d80da-1f45-498e-ab91-e0f0a45976b9','fcba708e-4cb6-40a4-b527-7769e0018a0c','','${role_read-token}','read-token','master','fcba708e-4cb6-40a4-b527-7769e0018a0c',NULL,'\0'),('ac9a1e86-9722-404c-95da-919b0ee27ce8','679f9c84-39c2-4300-929b-8b0bf875e85e','','${role_view-events}','view-events','master','679f9c84-39c2-4300-929b-8b0bf875e85e',NULL,'\0'),('b3153522-fd4a-4b6e-8ca9-f698d7fdcd9c','064f5c8b-d948-4923-923f-d67569c61d2c','','${role_manage-identity-providers}','manage-identity-providers','master','064f5c8b-d948-4923-923f-d67569c61d2c',NULL,'\0'),('c3452a78-2677-4730-92af-31526d5f0402','064f5c8b-d948-4923-923f-d67569c61d2c','','${role_view-clients}','view-clients','master','064f5c8b-d948-4923-923f-d67569c61d2c',NULL,'\0'),('c53374e2-052a-4d69-a00a-ff978e628f24','a5aad6e5-6d25-4c09-a971-0654cfd9dce9','','${role_realm-admin}','realm-admin','itesoft','a5aad6e5-6d25-4c09-a971-0654cfd9dce9',NULL,'\0'),('c700f482-6251-4292-bb9c-95b5e4fe4f28','a5aad6e5-6d25-4c09-a971-0654cfd9dce9','','${role_view-users}','view-users','itesoft','a5aad6e5-6d25-4c09-a971-0654cfd9dce9',NULL,'\0'),('c810e890-be8e-483e-b43a-1f8b04b1cc7b','a5aad6e5-6d25-4c09-a971-0654cfd9dce9','','${role_view-identity-providers}','view-identity-providers','itesoft','a5aad6e5-6d25-4c09-a971-0654cfd9dce9',NULL,'\0'),('d4f4354c-dd56-4881-9105-acb461d5c995','a5aad6e5-6d25-4c09-a971-0654cfd9dce9','','${role_view-realm}','view-realm','itesoft','a5aad6e5-6d25-4c09-a971-0654cfd9dce9',NULL,'\0'),('d6e7ef07-0f3b-427f-bbff-1b8ba2802cd7','3d4f25da-6732-4a75-8bca-4e2e87efeb5d','','${role_view-profile}','view-profile','master','3d4f25da-6732-4a75-8bca-4e2e87efeb5d',NULL,'\0'),('fe8bf752-9d60-42fa-b09a-dbb3281a6479','679f9c84-39c2-4300-929b-8b0bf875e85e','','${role_manage-identity-providers}','manage-identity-providers','master','679f9c84-39c2-4300-929b-8b0bf875e85e',NULL,'\0');
/*!40000 ALTER TABLE `KEYCLOAK_ROLE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MIGRATION_MODEL`
--

DROP TABLE IF EXISTS `MIGRATION_MODEL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MIGRATION_MODEL` (
  `ID` varchar(36) NOT NULL,
  `VERSION` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MIGRATION_MODEL`
--

LOCK TABLES `MIGRATION_MODEL` WRITE;
/*!40000 ALTER TABLE `MIGRATION_MODEL` DISABLE KEYS */;
INSERT INTO `MIGRATION_MODEL` VALUES ('SINGLETON','1.7.0');
/*!40000 ALTER TABLE `MIGRATION_MODEL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OFFLINE_CLIENT_SESSION`
--

DROP TABLE IF EXISTS `OFFLINE_CLIENT_SESSION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `OFFLINE_CLIENT_SESSION` (
  `CLIENT_SESSION_ID` varchar(36) NOT NULL,
  `USER_SESSION_ID` varchar(36) NOT NULL,
  `CLIENT_ID` varchar(36) NOT NULL,
  `OFFLINE_FLAG` varchar(4) NOT NULL,
  `TIMESTAMP` int(11) DEFAULT NULL,
  `DATA` longtext,
  PRIMARY KEY (`CLIENT_SESSION_ID`,`OFFLINE_FLAG`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OFFLINE_CLIENT_SESSION`
--

LOCK TABLES `OFFLINE_CLIENT_SESSION` WRITE;
/*!40000 ALTER TABLE `OFFLINE_CLIENT_SESSION` DISABLE KEYS */;
/*!40000 ALTER TABLE `OFFLINE_CLIENT_SESSION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OFFLINE_USER_SESSION`
--

DROP TABLE IF EXISTS `OFFLINE_USER_SESSION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `OFFLINE_USER_SESSION` (
  `USER_SESSION_ID` varchar(36) NOT NULL,
  `USER_ID` varchar(36) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `LAST_SESSION_REFRESH` int(11) DEFAULT NULL,
  `OFFLINE_FLAG` varchar(4) NOT NULL,
  `DATA` longtext,
  PRIMARY KEY (`USER_SESSION_ID`,`OFFLINE_FLAG`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OFFLINE_USER_SESSION`
--

LOCK TABLES `OFFLINE_USER_SESSION` WRITE;
/*!40000 ALTER TABLE `OFFLINE_USER_SESSION` DISABLE KEYS */;
/*!40000 ALTER TABLE `OFFLINE_USER_SESSION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PROTOCOL_MAPPER`
--

DROP TABLE IF EXISTS `PROTOCOL_MAPPER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PROTOCOL_MAPPER` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `PROTOCOL` varchar(255) NOT NULL,
  `PROTOCOL_MAPPER_NAME` varchar(255) NOT NULL,
  `CONSENT_REQUIRED` bit(1) NOT NULL DEFAULT b'0',
  `CONSENT_TEXT` varchar(255) DEFAULT NULL,
  `CLIENT_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_PCM_REALM` (`CLIENT_ID`),
  CONSTRAINT `FK_PCM_REALM` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PROTOCOL_MAPPER`
--

LOCK TABLES `PROTOCOL_MAPPER` WRITE;
/*!40000 ALTER TABLE `PROTOCOL_MAPPER` DISABLE KEYS */;
INSERT INTO `PROTOCOL_MAPPER` VALUES ('01c5c4d6-025d-40f1-8f5b-e8821486d8b1','given name','openid-connect','oidc-usermodel-property-mapper','','${givenName}','679f9c84-39c2-4300-929b-8b0bf875e85e'),('069c4752-ec95-4fdc-a472-b0075b4679f1','email','openid-connect','oidc-usermodel-property-mapper','','${email}','41efe014-736d-41c6-8240-1a253c8d63af'),('08f5a9d7-9c0c-4456-808f-ffe28ffa1d11','username','openid-connect','oidc-usermodel-property-mapper','','${username}','064f5c8b-d948-4923-923f-d67569c61d2c'),('0c0762a8-e7b4-45b9-ab07-331f62f10eba','full name','openid-connect','oidc-full-name-mapper','','${fullName}','a5aad6e5-6d25-4c09-a971-0654cfd9dce9'),('15bcd8c6-4139-4e1b-83cd-55166e658a3c','role list','saml','saml-role-list-mapper','\0',NULL,'74e4631d-ad8e-4634-bcfc-341abc22c533'),('2085a20e-dd41-44b4-9a99-cfaf46d80c35','email','openid-connect','oidc-usermodel-property-mapper','','${email}','064f5c8b-d948-4923-923f-d67569c61d2c'),('2301e561-a238-4c86-9309-cc2dd8d57b4f','full name','openid-connect','oidc-full-name-mapper','','${fullName}','064f5c8b-d948-4923-923f-d67569c61d2c'),('2600ee07-1ea3-4f1b-9b86-b61ff8916e5a','email','openid-connect','oidc-usermodel-property-mapper','','${email}','42582697-7e79-491d-8559-ae07bc6408ae'),('2e1388b9-9251-4149-a701-95a443336299','given name','openid-connect','oidc-usermodel-property-mapper','','${givenName}','68a6d182-a55b-49de-92fc-0c48a4abd2a8'),('30fa8974-a8a7-4dd6-9da8-2f626551bfe7','role list','saml','saml-role-list-mapper','\0',NULL,'7b18d0f1-b433-4cbd-b43c-481ef43518dd'),('35480fdd-f663-46bc-9802-d9c83cb20558','given name','openid-connect','oidc-usermodel-property-mapper','','${givenName}','a5aad6e5-6d25-4c09-a971-0654cfd9dce9'),('3738a494-36ad-4ead-b5c4-a0f193875396','role list','saml','saml-role-list-mapper','\0',NULL,'fcba708e-4cb6-40a4-b527-7769e0018a0c'),('3814e2e4-f659-4a2a-9273-255e86040f25','username','openid-connect','oidc-usermodel-property-mapper','','${username}','fcba708e-4cb6-40a4-b527-7769e0018a0c'),('3e338c3e-bec6-4031-901f-f9c0ed4df42b','email','openid-connect','oidc-usermodel-property-mapper','','${email}','3d4f25da-6732-4a75-8bca-4e2e87efeb5d'),('3f74e55a-d954-4d33-965b-2b9602266bcd','email','openid-connect','oidc-usermodel-property-mapper','','${email}','39238724-3f56-427b-bde1-46844130b205'),('4dbac890-ac68-4216-a969-ad1406a81ee6','full name','openid-connect','oidc-full-name-mapper','','${fullName}','74e4631d-ad8e-4634-bcfc-341abc22c533'),('4e9fa5dd-8aa0-4a1a-8aaf-ef52d4a2201c','given name','openid-connect','oidc-usermodel-property-mapper','','${givenName}','7b18d0f1-b433-4cbd-b43c-481ef43518dd'),('522d7fa7-a0b0-4ae9-b170-59927b90b7de','given name','openid-connect','oidc-usermodel-property-mapper','','${givenName}','74e4631d-ad8e-4634-bcfc-341abc22c533'),('5664f228-8dcb-40e1-894c-fb7ae6fa64c0','given name','openid-connect','oidc-usermodel-property-mapper','','${givenName}','39238724-3f56-427b-bde1-46844130b205'),('57ffb29b-8f95-42b5-a146-0ebb7d7010eb','family name','openid-connect','oidc-usermodel-property-mapper','','${familyName}','679f9c84-39c2-4300-929b-8b0bf875e85e'),('5a3aa53c-55f7-46cf-9360-ef94e982d3cf','username','openid-connect','oidc-usermodel-property-mapper','','${username}','68a6d182-a55b-49de-92fc-0c48a4abd2a8'),('66cf1b22-db79-41e4-a3d4-5dba6ca8b796','role list','saml','saml-role-list-mapper','\0',NULL,'39238724-3f56-427b-bde1-46844130b205'),('6af92bcf-c52c-47db-bff0-78e17884af65','full name','openid-connect','oidc-full-name-mapper','','${fullName}','fcba708e-4cb6-40a4-b527-7769e0018a0c'),('6b2cceb0-3334-43fc-83be-ac7a99f6480b','username','openid-connect','oidc-usermodel-property-mapper','','${username}','3d4f25da-6732-4a75-8bca-4e2e87efeb5d'),('77db4407-7e2a-4450-9495-0e75d6aeb9e4','username','openid-connect','oidc-usermodel-property-mapper','','${username}','42582697-7e79-491d-8559-ae07bc6408ae'),('7c521029-1b97-4832-9063-7de3307e35c7','family name','openid-connect','oidc-usermodel-property-mapper','','${familyName}','7b18d0f1-b433-4cbd-b43c-481ef43518dd'),('84e557dd-6896-479e-900d-34b2fdb77562','full name','openid-connect','oidc-full-name-mapper','','${fullName}','7b18d0f1-b433-4cbd-b43c-481ef43518dd'),('8501b8cf-d13f-4d28-94a1-9b1b454f2912','given name','openid-connect','oidc-usermodel-property-mapper','','${givenName}','3d4f25da-6732-4a75-8bca-4e2e87efeb5d'),('8588a753-57a4-4fc8-9912-cfc4a7dedf6b','role list','saml','saml-role-list-mapper','\0',NULL,'68a6d182-a55b-49de-92fc-0c48a4abd2a8'),('85e99556-eb07-4c4a-955f-fb473a90a588','email','openid-connect','oidc-usermodel-property-mapper','','${email}','7b18d0f1-b433-4cbd-b43c-481ef43518dd'),('89cebad7-a345-4c0c-9203-f346006a0ac3','role list','saml','saml-role-list-mapper','\0',NULL,'064f5c8b-d948-4923-923f-d67569c61d2c'),('90b9858c-7fd6-412e-a6f4-d90043c45df6','role list','saml','saml-role-list-mapper','\0',NULL,'679f9c84-39c2-4300-929b-8b0bf875e85e'),('9289601c-35c6-4ff1-964e-1d70493ae4fd','family name','openid-connect','oidc-usermodel-property-mapper','','${familyName}','41efe014-736d-41c6-8240-1a253c8d63af'),('934a2825-a588-428e-8e02-b33107f8c9a0','family name','openid-connect','oidc-usermodel-property-mapper','','${familyName}','fcba708e-4cb6-40a4-b527-7769e0018a0c'),('96844a40-5df6-4112-9c60-607f0346c018','family name','openid-connect','oidc-usermodel-property-mapper','','${familyName}','39238724-3f56-427b-bde1-46844130b205'),('973c980e-482d-48c2-ad46-fc589a9d9e7f','family name','openid-connect','oidc-usermodel-property-mapper','','${familyName}','42582697-7e79-491d-8559-ae07bc6408ae'),('98f494fc-420c-4579-9185-1f0f31c26a29','given name','openid-connect','oidc-usermodel-property-mapper','','${givenName}','41efe014-736d-41c6-8240-1a253c8d63af'),('9ba0d2be-ec7f-4dd0-a188-3f45184dc2ce','username','openid-connect','oidc-usermodel-property-mapper','','${username}','679f9c84-39c2-4300-929b-8b0bf875e85e'),('9e26ecb5-acb3-461f-b475-64bd4facd3c5','username','openid-connect','oidc-usermodel-property-mapper','','${username}','39238724-3f56-427b-bde1-46844130b205'),('a0f9d67f-87f8-482b-a3dc-538f551e5b92','full name','openid-connect','oidc-full-name-mapper','','${fullName}','68a6d182-a55b-49de-92fc-0c48a4abd2a8'),('a4f094ac-ada7-49de-b915-091c6084141b','role list','saml','saml-role-list-mapper','\0',NULL,'42582697-7e79-491d-8559-ae07bc6408ae'),('a8b0ddb6-1bcd-497f-ae2e-5416f7a0c92f','family name','openid-connect','oidc-usermodel-property-mapper','','${familyName}','064f5c8b-d948-4923-923f-d67569c61d2c'),('acdc3d24-375f-4266-881b-cd700439c754','email','openid-connect','oidc-usermodel-property-mapper','','${email}','74e4631d-ad8e-4634-bcfc-341abc22c533'),('b0d443f7-c4cf-497d-9c30-c2a591ba9bcb','full name','openid-connect','oidc-full-name-mapper','','${fullName}','41efe014-736d-41c6-8240-1a253c8d63af'),('b12ae031-941d-4b13-9598-4501b70673a8','locale','openid-connect','oidc-usermodel-attribute-mapper','\0','${locale}','39238724-3f56-427b-bde1-46844130b205'),('b3e875b2-eafb-49a4-8f77-9951d0abce00','role list','saml','saml-role-list-mapper','\0',NULL,'3d4f25da-6732-4a75-8bca-4e2e87efeb5d'),('bda22df8-2a03-43bf-a737-b50d598e72c4','role list','saml','saml-role-list-mapper','\0',NULL,'41efe014-736d-41c6-8240-1a253c8d63af'),('c4d3a58b-04f8-416a-ae68-91bd403c9c1e','username','openid-connect','oidc-usermodel-property-mapper','','${username}','41efe014-736d-41c6-8240-1a253c8d63af'),('c8435aae-df83-4aeb-9f49-ecd653272d4e','role list','saml','saml-role-list-mapper','\0',NULL,'a5aad6e5-6d25-4c09-a971-0654cfd9dce9'),('cb40583f-2df0-41de-a3ac-bcd509d38437','email','openid-connect','oidc-usermodel-property-mapper','','${email}','679f9c84-39c2-4300-929b-8b0bf875e85e'),('cdd69f6f-fe73-4cce-8c40-c18d5efafeaa','username','openid-connect','oidc-usermodel-property-mapper','','${username}','a5aad6e5-6d25-4c09-a971-0654cfd9dce9'),('cf1381fe-9bb0-4bdd-b041-bb9d17a924fa','given name','openid-connect','oidc-usermodel-property-mapper','','${givenName}','fcba708e-4cb6-40a4-b527-7769e0018a0c'),('d29dffa7-d734-4f47-8077-c04cab292a61','locale','openid-connect','oidc-usermodel-attribute-mapper','\0','${locale}','42582697-7e79-491d-8559-ae07bc6408ae'),('d2aa30c0-3690-4ee9-ba33-74bf72c332a0','email','openid-connect','oidc-usermodel-property-mapper','','${email}','fcba708e-4cb6-40a4-b527-7769e0018a0c'),('d8f9aca4-28e5-48ad-b44b-d6358c0fd622','family name','openid-connect','oidc-usermodel-property-mapper','','${familyName}','68a6d182-a55b-49de-92fc-0c48a4abd2a8'),('e023b09d-620d-4563-9f2a-4ded3cb6c2f6','family name','openid-connect','oidc-usermodel-property-mapper','','${familyName}','74e4631d-ad8e-4634-bcfc-341abc22c533'),('e6b8181d-6c22-4a2c-ba9a-6d1cf2569b6c','given name','openid-connect','oidc-usermodel-property-mapper','','${givenName}','064f5c8b-d948-4923-923f-d67569c61d2c'),('e9fbead8-ccc7-45a9-9148-c8edfeb57b01','full name','openid-connect','oidc-full-name-mapper','','${fullName}','3d4f25da-6732-4a75-8bca-4e2e87efeb5d'),('ecef4d33-92e3-428d-a1cf-10a24faad9aa','email','openid-connect','oidc-usermodel-property-mapper','','${email}','a5aad6e5-6d25-4c09-a971-0654cfd9dce9'),('ef193b13-8579-4b71-acd4-bdb564fbe964','full name','openid-connect','oidc-full-name-mapper','','${fullName}','42582697-7e79-491d-8559-ae07bc6408ae'),('ef341a36-721e-4088-85e9-807cf58b714f','username','openid-connect','oidc-usermodel-property-mapper','','${username}','74e4631d-ad8e-4634-bcfc-341abc22c533'),('f3f7d205-8a3a-474b-9a6f-dfa23fe129c6','username','openid-connect','oidc-usermodel-property-mapper','','${username}','7b18d0f1-b433-4cbd-b43c-481ef43518dd'),('f769b68b-9598-4b06-84a3-4430f98d595a','given name','openid-connect','oidc-usermodel-property-mapper','','${givenName}','42582697-7e79-491d-8559-ae07bc6408ae'),('f849ccc4-0fc1-4606-8c69-9dff5e4be767','email','openid-connect','oidc-usermodel-property-mapper','','${email}','68a6d182-a55b-49de-92fc-0c48a4abd2a8'),('f8e4483e-7806-451a-91c6-8ceea7c09871','family name','openid-connect','oidc-usermodel-property-mapper','','${familyName}','a5aad6e5-6d25-4c09-a971-0654cfd9dce9'),('fa820664-8e4d-4eb3-b5ba-10679e8434b2','full name','openid-connect','oidc-full-name-mapper','','${fullName}','39238724-3f56-427b-bde1-46844130b205'),('fb911be9-9e48-4b4c-ae21-3064c052c11b','family name','openid-connect','oidc-usermodel-property-mapper','','${familyName}','3d4f25da-6732-4a75-8bca-4e2e87efeb5d'),('fece4d1e-8baf-49b4-804e-76aeeb5a5ae3','full name','openid-connect','oidc-full-name-mapper','','${fullName}','679f9c84-39c2-4300-929b-8b0bf875e85e');
/*!40000 ALTER TABLE `PROTOCOL_MAPPER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PROTOCOL_MAPPER_CONFIG`
--

DROP TABLE IF EXISTS `PROTOCOL_MAPPER_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PROTOCOL_MAPPER_CONFIG` (
  `PROTOCOL_MAPPER_ID` varchar(36) NOT NULL,
  `VALUE` longtext,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`PROTOCOL_MAPPER_ID`,`NAME`),
  CONSTRAINT `FK_PMCONFIG` FOREIGN KEY (`PROTOCOL_MAPPER_ID`) REFERENCES `PROTOCOL_MAPPER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PROTOCOL_MAPPER_CONFIG`
--

LOCK TABLES `PROTOCOL_MAPPER_CONFIG` WRITE;
/*!40000 ALTER TABLE `PROTOCOL_MAPPER_CONFIG` DISABLE KEYS */;
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('01c5c4d6-025d-40f1-8f5b-e8821486d8b1','true','access.token.claim'),('01c5c4d6-025d-40f1-8f5b-e8821486d8b1','given_name','claim.name'),('01c5c4d6-025d-40f1-8f5b-e8821486d8b1','true','id.token.claim'),('01c5c4d6-025d-40f1-8f5b-e8821486d8b1','String','jsonType.label'),('01c5c4d6-025d-40f1-8f5b-e8821486d8b1','firstName','user.attribute'),('069c4752-ec95-4fdc-a472-b0075b4679f1','true','access.token.claim'),('069c4752-ec95-4fdc-a472-b0075b4679f1','email','claim.name'),('069c4752-ec95-4fdc-a472-b0075b4679f1','true','id.token.claim'),('069c4752-ec95-4fdc-a472-b0075b4679f1','String','jsonType.label'),('069c4752-ec95-4fdc-a472-b0075b4679f1','email','user.attribute'),('08f5a9d7-9c0c-4456-808f-ffe28ffa1d11','true','access.token.claim'),('08f5a9d7-9c0c-4456-808f-ffe28ffa1d11','preferred_username','claim.name'),('08f5a9d7-9c0c-4456-808f-ffe28ffa1d11','true','id.token.claim'),('08f5a9d7-9c0c-4456-808f-ffe28ffa1d11','String','jsonType.label'),('08f5a9d7-9c0c-4456-808f-ffe28ffa1d11','username','user.attribute'),('0c0762a8-e7b4-45b9-ab07-331f62f10eba','true','access.token.claim'),('0c0762a8-e7b4-45b9-ab07-331f62f10eba','true','id.token.claim'),('15bcd8c6-4139-4e1b-83cd-55166e658a3c','Role','attribute.name'),('15bcd8c6-4139-4e1b-83cd-55166e658a3c','Basic','attribute.nameformat'),('15bcd8c6-4139-4e1b-83cd-55166e658a3c','false','single'),('2085a20e-dd41-44b4-9a99-cfaf46d80c35','true','access.token.claim'),('2085a20e-dd41-44b4-9a99-cfaf46d80c35','email','claim.name'),('2085a20e-dd41-44b4-9a99-cfaf46d80c35','true','id.token.claim'),('2085a20e-dd41-44b4-9a99-cfaf46d80c35','String','jsonType.label'),('2085a20e-dd41-44b4-9a99-cfaf46d80c35','email','user.attribute'),('2301e561-a238-4c86-9309-cc2dd8d57b4f','true','access.token.claim'),('2301e561-a238-4c86-9309-cc2dd8d57b4f','true','id.token.claim'),('2600ee07-1ea3-4f1b-9b86-b61ff8916e5a','true','access.token.claim'),('2600ee07-1ea3-4f1b-9b86-b61ff8916e5a','email','claim.name'),('2600ee07-1ea3-4f1b-9b86-b61ff8916e5a','true','id.token.claim'),('2600ee07-1ea3-4f1b-9b86-b61ff8916e5a','String','jsonType.label'),('2600ee07-1ea3-4f1b-9b86-b61ff8916e5a','email','user.attribute'),('2e1388b9-9251-4149-a701-95a443336299','true','access.token.claim'),('2e1388b9-9251-4149-a701-95a443336299','given_name','claim.name'),('2e1388b9-9251-4149-a701-95a443336299','true','id.token.claim'),('2e1388b9-9251-4149-a701-95a443336299','String','jsonType.label'),('2e1388b9-9251-4149-a701-95a443336299','firstName','user.attribute'),('30fa8974-a8a7-4dd6-9da8-2f626551bfe7','Role','attribute.name'),('30fa8974-a8a7-4dd6-9da8-2f626551bfe7','Basic','attribute.nameformat'),('30fa8974-a8a7-4dd6-9da8-2f626551bfe7','false','single'),('35480fdd-f663-46bc-9802-d9c83cb20558','true','access.token.claim'),('35480fdd-f663-46bc-9802-d9c83cb20558','given_name','claim.name'),('35480fdd-f663-46bc-9802-d9c83cb20558','true','id.token.claim'),('35480fdd-f663-46bc-9802-d9c83cb20558','String','jsonType.label'),('35480fdd-f663-46bc-9802-d9c83cb20558','firstName','user.attribute'),('3738a494-36ad-4ead-b5c4-a0f193875396','Role','attribute.name'),('3738a494-36ad-4ead-b5c4-a0f193875396','Basic','attribute.nameformat'),('3738a494-36ad-4ead-b5c4-a0f193875396','false','single'),('3814e2e4-f659-4a2a-9273-255e86040f25','true','access.token.claim'),('3814e2e4-f659-4a2a-9273-255e86040f25','preferred_username','claim.name'),('3814e2e4-f659-4a2a-9273-255e86040f25','true','id.token.claim'),('3814e2e4-f659-4a2a-9273-255e86040f25','String','jsonType.label'),('3814e2e4-f659-4a2a-9273-255e86040f25','username','user.attribute'),('3e338c3e-bec6-4031-901f-f9c0ed4df42b','true','access.token.claim'),('3e338c3e-bec6-4031-901f-f9c0ed4df42b','email','claim.name'),('3e338c3e-bec6-4031-901f-f9c0ed4df42b','true','id.token.claim'),('3e338c3e-bec6-4031-901f-f9c0ed4df42b','String','jsonType.label'),('3e338c3e-bec6-4031-901f-f9c0ed4df42b','email','user.attribute'),('3f74e55a-d954-4d33-965b-2b9602266bcd','true','access.token.claim'),('3f74e55a-d954-4d33-965b-2b9602266bcd','email','claim.name'),('3f74e55a-d954-4d33-965b-2b9602266bcd','true','id.token.claim'),('3f74e55a-d954-4d33-965b-2b9602266bcd','String','jsonType.label'),('3f74e55a-d954-4d33-965b-2b9602266bcd','email','user.attribute'),('4dbac890-ac68-4216-a969-ad1406a81ee6','true','access.token.claim'),('4dbac890-ac68-4216-a969-ad1406a81ee6','true','id.token.claim'),('4e9fa5dd-8aa0-4a1a-8aaf-ef52d4a2201c','true','access.token.claim'),('4e9fa5dd-8aa0-4a1a-8aaf-ef52d4a2201c','given_name','claim.name'),('4e9fa5dd-8aa0-4a1a-8aaf-ef52d4a2201c','true','id.token.claim'),('4e9fa5dd-8aa0-4a1a-8aaf-ef52d4a2201c','String','jsonType.label'),('4e9fa5dd-8aa0-4a1a-8aaf-ef52d4a2201c','firstName','user.attribute'),('522d7fa7-a0b0-4ae9-b170-59927b90b7de','true','access.token.claim'),('522d7fa7-a0b0-4ae9-b170-59927b90b7de','given_name','claim.name'),('522d7fa7-a0b0-4ae9-b170-59927b90b7de','true','id.token.claim'),('522d7fa7-a0b0-4ae9-b170-59927b90b7de','String','jsonType.label'),('522d7fa7-a0b0-4ae9-b170-59927b90b7de','firstName','user.attribute'),('5664f228-8dcb-40e1-894c-fb7ae6fa64c0','true','access.token.claim'),('5664f228-8dcb-40e1-894c-fb7ae6fa64c0','given_name','claim.name'),('5664f228-8dcb-40e1-894c-fb7ae6fa64c0','true','id.token.claim'),('5664f228-8dcb-40e1-894c-fb7ae6fa64c0','String','jsonType.label'),('5664f228-8dcb-40e1-894c-fb7ae6fa64c0','firstName','user.attribute'),('57ffb29b-8f95-42b5-a146-0ebb7d7010eb','true','access.token.claim'),('57ffb29b-8f95-42b5-a146-0ebb7d7010eb','family_name','claim.name'),('57ffb29b-8f95-42b5-a146-0ebb7d7010eb','true','id.token.claim'),('57ffb29b-8f95-42b5-a146-0ebb7d7010eb','String','jsonType.label'),('57ffb29b-8f95-42b5-a146-0ebb7d7010eb','lastName','user.attribute'),('5a3aa53c-55f7-46cf-9360-ef94e982d3cf','true','access.token.claim'),('5a3aa53c-55f7-46cf-9360-ef94e982d3cf','preferred_username','claim.name'),('5a3aa53c-55f7-46cf-9360-ef94e982d3cf','true','id.token.claim'),('5a3aa53c-55f7-46cf-9360-ef94e982d3cf','String','jsonType.label'),('5a3aa53c-55f7-46cf-9360-ef94e982d3cf','username','user.attribute'),('66cf1b22-db79-41e4-a3d4-5dba6ca8b796','Role','attribute.name'),('66cf1b22-db79-41e4-a3d4-5dba6ca8b796','Basic','attribute.nameformat'),('66cf1b22-db79-41e4-a3d4-5dba6ca8b796','false','single'),('6af92bcf-c52c-47db-bff0-78e17884af65','true','access.token.claim'),('6af92bcf-c52c-47db-bff0-78e17884af65','true','id.token.claim'),('6b2cceb0-3334-43fc-83be-ac7a99f6480b','true','access.token.claim'),('6b2cceb0-3334-43fc-83be-ac7a99f6480b','preferred_username','claim.name'),('6b2cceb0-3334-43fc-83be-ac7a99f6480b','true','id.token.claim'),('6b2cceb0-3334-43fc-83be-ac7a99f6480b','String','jsonType.label'),('6b2cceb0-3334-43fc-83be-ac7a99f6480b','username','user.attribute'),('77db4407-7e2a-4450-9495-0e75d6aeb9e4','true','access.token.claim'),('77db4407-7e2a-4450-9495-0e75d6aeb9e4','preferred_username','claim.name'),('77db4407-7e2a-4450-9495-0e75d6aeb9e4','true','id.token.claim'),('77db4407-7e2a-4450-9495-0e75d6aeb9e4','String','jsonType.label'),('77db4407-7e2a-4450-9495-0e75d6aeb9e4','username','user.attribute'),('7c521029-1b97-4832-9063-7de3307e35c7','true','access.token.claim'),('7c521029-1b97-4832-9063-7de3307e35c7','family_name','claim.name'),('7c521029-1b97-4832-9063-7de3307e35c7','true','id.token.claim'),('7c521029-1b97-4832-9063-7de3307e35c7','String','jsonType.label'),('7c521029-1b97-4832-9063-7de3307e35c7','lastName','user.attribute'),('84e557dd-6896-479e-900d-34b2fdb77562','true','access.token.claim'),('84e557dd-6896-479e-900d-34b2fdb77562','true','id.token.claim'),('8501b8cf-d13f-4d28-94a1-9b1b454f2912','true','access.token.claim'),('8501b8cf-d13f-4d28-94a1-9b1b454f2912','given_name','claim.name'),('8501b8cf-d13f-4d28-94a1-9b1b454f2912','true','id.token.claim'),('8501b8cf-d13f-4d28-94a1-9b1b454f2912','String','jsonType.label'),('8501b8cf-d13f-4d28-94a1-9b1b454f2912','firstName','user.attribute'),('8588a753-57a4-4fc8-9912-cfc4a7dedf6b','Role','attribute.name'),('8588a753-57a4-4fc8-9912-cfc4a7dedf6b','Basic','attribute.nameformat'),('8588a753-57a4-4fc8-9912-cfc4a7dedf6b','false','single'),('85e99556-eb07-4c4a-955f-fb473a90a588','true','access.token.claim'),('85e99556-eb07-4c4a-955f-fb473a90a588','email','claim.name'),('85e99556-eb07-4c4a-955f-fb473a90a588','true','id.token.claim'),('85e99556-eb07-4c4a-955f-fb473a90a588','String','jsonType.label'),('85e99556-eb07-4c4a-955f-fb473a90a588','email','user.attribute'),('89cebad7-a345-4c0c-9203-f346006a0ac3','Role','attribute.name'),('89cebad7-a345-4c0c-9203-f346006a0ac3','Basic','attribute.nameformat'),('89cebad7-a345-4c0c-9203-f346006a0ac3','false','single'),('90b9858c-7fd6-412e-a6f4-d90043c45df6','Role','attribute.name'),('90b9858c-7fd6-412e-a6f4-d90043c45df6','Basic','attribute.nameformat'),('90b9858c-7fd6-412e-a6f4-d90043c45df6','false','single'),('9289601c-35c6-4ff1-964e-1d70493ae4fd','true','access.token.claim'),('9289601c-35c6-4ff1-964e-1d70493ae4fd','family_name','claim.name'),('9289601c-35c6-4ff1-964e-1d70493ae4fd','true','id.token.claim'),('9289601c-35c6-4ff1-964e-1d70493ae4fd','String','jsonType.label'),('9289601c-35c6-4ff1-964e-1d70493ae4fd','lastName','user.attribute'),('934a2825-a588-428e-8e02-b33107f8c9a0','true','access.token.claim'),('934a2825-a588-428e-8e02-b33107f8c9a0','family_name','claim.name'),('934a2825-a588-428e-8e02-b33107f8c9a0','true','id.token.claim'),('934a2825-a588-428e-8e02-b33107f8c9a0','String','jsonType.label'),('934a2825-a588-428e-8e02-b33107f8c9a0','lastName','user.attribute'),('96844a40-5df6-4112-9c60-607f0346c018','true','access.token.claim'),('96844a40-5df6-4112-9c60-607f0346c018','family_name','claim.name'),('96844a40-5df6-4112-9c60-607f0346c018','true','id.token.claim'),('96844a40-5df6-4112-9c60-607f0346c018','String','jsonType.label'),('96844a40-5df6-4112-9c60-607f0346c018','lastName','user.attribute'),('973c980e-482d-48c2-ad46-fc589a9d9e7f','true','access.token.claim'),('973c980e-482d-48c2-ad46-fc589a9d9e7f','family_name','claim.name'),('973c980e-482d-48c2-ad46-fc589a9d9e7f','true','id.token.claim'),('973c980e-482d-48c2-ad46-fc589a9d9e7f','String','jsonType.label'),('973c980e-482d-48c2-ad46-fc589a9d9e7f','lastName','user.attribute'),('98f494fc-420c-4579-9185-1f0f31c26a29','true','access.token.claim'),('98f494fc-420c-4579-9185-1f0f31c26a29','given_name','claim.name'),('98f494fc-420c-4579-9185-1f0f31c26a29','true','id.token.claim'),('98f494fc-420c-4579-9185-1f0f31c26a29','String','jsonType.label'),('98f494fc-420c-4579-9185-1f0f31c26a29','firstName','user.attribute'),('9ba0d2be-ec7f-4dd0-a188-3f45184dc2ce','true','access.token.claim'),('9ba0d2be-ec7f-4dd0-a188-3f45184dc2ce','preferred_username','claim.name'),('9ba0d2be-ec7f-4dd0-a188-3f45184dc2ce','true','id.token.claim'),('9ba0d2be-ec7f-4dd0-a188-3f45184dc2ce','String','jsonType.label'),('9ba0d2be-ec7f-4dd0-a188-3f45184dc2ce','username','user.attribute'),('9e26ecb5-acb3-461f-b475-64bd4facd3c5','true','access.token.claim'),('9e26ecb5-acb3-461f-b475-64bd4facd3c5','preferred_username','claim.name'),('9e26ecb5-acb3-461f-b475-64bd4facd3c5','true','id.token.claim'),('9e26ecb5-acb3-461f-b475-64bd4facd3c5','String','jsonType.label'),('9e26ecb5-acb3-461f-b475-64bd4facd3c5','username','user.attribute'),('a0f9d67f-87f8-482b-a3dc-538f551e5b92','true','access.token.claim'),('a0f9d67f-87f8-482b-a3dc-538f551e5b92','true','id.token.claim'),('a4f094ac-ada7-49de-b915-091c6084141b','Role','attribute.name'),('a4f094ac-ada7-49de-b915-091c6084141b','Basic','attribute.nameformat'),('a4f094ac-ada7-49de-b915-091c6084141b','false','single'),('a8b0ddb6-1bcd-497f-ae2e-5416f7a0c92f','true','access.token.claim'),('a8b0ddb6-1bcd-497f-ae2e-5416f7a0c92f','family_name','claim.name'),('a8b0ddb6-1bcd-497f-ae2e-5416f7a0c92f','true','id.token.claim'),('a8b0ddb6-1bcd-497f-ae2e-5416f7a0c92f','String','jsonType.label'),('a8b0ddb6-1bcd-497f-ae2e-5416f7a0c92f','lastName','user.attribute'),('acdc3d24-375f-4266-881b-cd700439c754','true','access.token.claim'),('acdc3d24-375f-4266-881b-cd700439c754','email','claim.name'),('acdc3d24-375f-4266-881b-cd700439c754','true','id.token.claim'),('acdc3d24-375f-4266-881b-cd700439c754','String','jsonType.label'),('acdc3d24-375f-4266-881b-cd700439c754','email','user.attribute'),('b0d443f7-c4cf-497d-9c30-c2a591ba9bcb','true','access.token.claim'),('b0d443f7-c4cf-497d-9c30-c2a591ba9bcb','true','id.token.claim'),('b12ae031-941d-4b13-9598-4501b70673a8','true','access.token.claim'),('b12ae031-941d-4b13-9598-4501b70673a8','locale','claim.name'),('b12ae031-941d-4b13-9598-4501b70673a8','true','id.token.claim'),('b12ae031-941d-4b13-9598-4501b70673a8','String','jsonType.label'),('b12ae031-941d-4b13-9598-4501b70673a8','locale','user.attribute'),('b3e875b2-eafb-49a4-8f77-9951d0abce00','Role','attribute.name'),('b3e875b2-eafb-49a4-8f77-9951d0abce00','Basic','attribute.nameformat'),('b3e875b2-eafb-49a4-8f77-9951d0abce00','false','single'),('bda22df8-2a03-43bf-a737-b50d598e72c4','Role','attribute.name'),('bda22df8-2a03-43bf-a737-b50d598e72c4','Basic','attribute.nameformat'),('bda22df8-2a03-43bf-a737-b50d598e72c4','false','single'),('c4d3a58b-04f8-416a-ae68-91bd403c9c1e','true','access.token.claim'),('c4d3a58b-04f8-416a-ae68-91bd403c9c1e','preferred_username','claim.name'),('c4d3a58b-04f8-416a-ae68-91bd403c9c1e','true','id.token.claim'),('c4d3a58b-04f8-416a-ae68-91bd403c9c1e','String','jsonType.label'),('c4d3a58b-04f8-416a-ae68-91bd403c9c1e','username','user.attribute'),('c8435aae-df83-4aeb-9f49-ecd653272d4e','Role','attribute.name'),('c8435aae-df83-4aeb-9f49-ecd653272d4e','Basic','attribute.nameformat'),('c8435aae-df83-4aeb-9f49-ecd653272d4e','false','single'),('cb40583f-2df0-41de-a3ac-bcd509d38437','true','access.token.claim'),('cb40583f-2df0-41de-a3ac-bcd509d38437','email','claim.name'),('cb40583f-2df0-41de-a3ac-bcd509d38437','true','id.token.claim'),('cb40583f-2df0-41de-a3ac-bcd509d38437','String','jsonType.label'),('cb40583f-2df0-41de-a3ac-bcd509d38437','email','user.attribute'),('cdd69f6f-fe73-4cce-8c40-c18d5efafeaa','true','access.token.claim'),('cdd69f6f-fe73-4cce-8c40-c18d5efafeaa','preferred_username','claim.name'),('cdd69f6f-fe73-4cce-8c40-c18d5efafeaa','true','id.token.claim'),('cdd69f6f-fe73-4cce-8c40-c18d5efafeaa','String','jsonType.label'),('cdd69f6f-fe73-4cce-8c40-c18d5efafeaa','username','user.attribute'),('cf1381fe-9bb0-4bdd-b041-bb9d17a924fa','true','access.token.claim'),('cf1381fe-9bb0-4bdd-b041-bb9d17a924fa','given_name','claim.name'),('cf1381fe-9bb0-4bdd-b041-bb9d17a924fa','true','id.token.claim'),('cf1381fe-9bb0-4bdd-b041-bb9d17a924fa','String','jsonType.label'),('cf1381fe-9bb0-4bdd-b041-bb9d17a924fa','firstName','user.attribute'),('d29dffa7-d734-4f47-8077-c04cab292a61','true','access.token.claim'),('d29dffa7-d734-4f47-8077-c04cab292a61','locale','claim.name'),('d29dffa7-d734-4f47-8077-c04cab292a61','true','id.token.claim'),('d29dffa7-d734-4f47-8077-c04cab292a61','String','jsonType.label'),('d29dffa7-d734-4f47-8077-c04cab292a61','locale','user.attribute'),('d2aa30c0-3690-4ee9-ba33-74bf72c332a0','true','access.token.claim'),('d2aa30c0-3690-4ee9-ba33-74bf72c332a0','email','claim.name'),('d2aa30c0-3690-4ee9-ba33-74bf72c332a0','true','id.token.claim'),('d2aa30c0-3690-4ee9-ba33-74bf72c332a0','String','jsonType.label'),('d2aa30c0-3690-4ee9-ba33-74bf72c332a0','email','user.attribute'),('d8f9aca4-28e5-48ad-b44b-d6358c0fd622','true','access.token.claim'),('d8f9aca4-28e5-48ad-b44b-d6358c0fd622','family_name','claim.name'),('d8f9aca4-28e5-48ad-b44b-d6358c0fd622','true','id.token.claim'),('d8f9aca4-28e5-48ad-b44b-d6358c0fd622','String','jsonType.label'),('d8f9aca4-28e5-48ad-b44b-d6358c0fd622','lastName','user.attribute'),('e023b09d-620d-4563-9f2a-4ded3cb6c2f6','true','access.token.claim'),('e023b09d-620d-4563-9f2a-4ded3cb6c2f6','family_name','claim.name'),('e023b09d-620d-4563-9f2a-4ded3cb6c2f6','true','id.token.claim'),('e023b09d-620d-4563-9f2a-4ded3cb6c2f6','String','jsonType.label'),('e023b09d-620d-4563-9f2a-4ded3cb6c2f6','lastName','user.attribute'),('e6b8181d-6c22-4a2c-ba9a-6d1cf2569b6c','true','access.token.claim'),('e6b8181d-6c22-4a2c-ba9a-6d1cf2569b6c','given_name','claim.name'),('e6b8181d-6c22-4a2c-ba9a-6d1cf2569b6c','true','id.token.claim'),('e6b8181d-6c22-4a2c-ba9a-6d1cf2569b6c','String','jsonType.label'),('e6b8181d-6c22-4a2c-ba9a-6d1cf2569b6c','firstName','user.attribute'),('e9fbead8-ccc7-45a9-9148-c8edfeb57b01','true','access.token.claim'),('e9fbead8-ccc7-45a9-9148-c8edfeb57b01','true','id.token.claim'),('ecef4d33-92e3-428d-a1cf-10a24faad9aa','true','access.token.claim'),('ecef4d33-92e3-428d-a1cf-10a24faad9aa','email','claim.name'),('ecef4d33-92e3-428d-a1cf-10a24faad9aa','true','id.token.claim'),('ecef4d33-92e3-428d-a1cf-10a24faad9aa','String','jsonType.label'),('ecef4d33-92e3-428d-a1cf-10a24faad9aa','email','user.attribute'),('ef193b13-8579-4b71-acd4-bdb564fbe964','true','access.token.claim'),('ef193b13-8579-4b71-acd4-bdb564fbe964','true','id.token.claim'),('ef341a36-721e-4088-85e9-807cf58b714f','true','access.token.claim'),('ef341a36-721e-4088-85e9-807cf58b714f','preferred_username','claim.name'),('ef341a36-721e-4088-85e9-807cf58b714f','true','id.token.claim'),('ef341a36-721e-4088-85e9-807cf58b714f','String','jsonType.label'),('ef341a36-721e-4088-85e9-807cf58b714f','username','user.attribute'),('f3f7d205-8a3a-474b-9a6f-dfa23fe129c6','true','access.token.claim'),('f3f7d205-8a3a-474b-9a6f-dfa23fe129c6','preferred_username','claim.name'),('f3f7d205-8a3a-474b-9a6f-dfa23fe129c6','true','id.token.claim'),('f3f7d205-8a3a-474b-9a6f-dfa23fe129c6','String','jsonType.label'),('f3f7d205-8a3a-474b-9a6f-dfa23fe129c6','username','user.attribute'),('f769b68b-9598-4b06-84a3-4430f98d595a','true','access.token.claim'),('f769b68b-9598-4b06-84a3-4430f98d595a','given_name','claim.name'),('f769b68b-9598-4b06-84a3-4430f98d595a','true','id.token.claim'),('f769b68b-9598-4b06-84a3-4430f98d595a','String','jsonType.label'),('f769b68b-9598-4b06-84a3-4430f98d595a','firstName','user.attribute'),('f849ccc4-0fc1-4606-8c69-9dff5e4be767','true','access.token.claim'),('f849ccc4-0fc1-4606-8c69-9dff5e4be767','email','claim.name'),('f849ccc4-0fc1-4606-8c69-9dff5e4be767','true','id.token.claim'),('f849ccc4-0fc1-4606-8c69-9dff5e4be767','String','jsonType.label'),('f849ccc4-0fc1-4606-8c69-9dff5e4be767','email','user.attribute'),('f8e4483e-7806-451a-91c6-8ceea7c09871','true','access.token.claim'),('f8e4483e-7806-451a-91c6-8ceea7c09871','family_name','claim.name'),('f8e4483e-7806-451a-91c6-8ceea7c09871','true','id.token.claim'),('f8e4483e-7806-451a-91c6-8ceea7c09871','String','jsonType.label'),('f8e4483e-7806-451a-91c6-8ceea7c09871','lastName','user.attribute'),('fa820664-8e4d-4eb3-b5ba-10679e8434b2','true','access.token.claim'),('fa820664-8e4d-4eb3-b5ba-10679e8434b2','true','id.token.claim'),('fb911be9-9e48-4b4c-ae21-3064c052c11b','true','access.token.claim'),('fb911be9-9e48-4b4c-ae21-3064c052c11b','family_name','claim.name'),('fb911be9-9e48-4b4c-ae21-3064c052c11b','true','id.token.claim'),('fb911be9-9e48-4b4c-ae21-3064c052c11b','String','jsonType.label'),('fb911be9-9e48-4b4c-ae21-3064c052c11b','lastName','user.attribute'),('fece4d1e-8baf-49b4-804e-76aeeb5a5ae3','true','access.token.claim'),('fece4d1e-8baf-49b4-804e-76aeeb5a5ae3','true','id.token.claim');
/*!40000 ALTER TABLE `PROTOCOL_MAPPER_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM`
--

DROP TABLE IF EXISTS `REALM`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `REALM` (
  `ID` varchar(36) NOT NULL,
  `ACCESS_CODE_LIFESPAN` int(11) DEFAULT NULL,
  `USER_ACTION_LIFESPAN` int(11) DEFAULT NULL,
  `ACCESS_TOKEN_LIFESPAN` int(11) DEFAULT NULL,
  `ACCOUNT_THEME` varchar(255) DEFAULT NULL,
  `ADMIN_THEME` varchar(255) DEFAULT NULL,
  `EMAIL_THEME` varchar(255) DEFAULT NULL,
  `ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `EVENTS_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `EVENTS_EXPIRATION` bigint(20) DEFAULT NULL,
  `LOGIN_THEME` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `NOT_BEFORE` int(11) DEFAULT NULL,
  `PASSWORD_POLICY` varchar(2550) DEFAULT NULL,
  `PRIVATE_KEY` varchar(2048) DEFAULT NULL,
  `PUBLIC_KEY` varchar(2048) DEFAULT NULL,
  `REGISTRATION_ALLOWED` bit(1) NOT NULL DEFAULT b'0',
  `REMEMBER_ME` bit(1) NOT NULL DEFAULT b'0',
  `RESET_PASSWORD_ALLOWED` bit(1) NOT NULL DEFAULT b'0',
  `SOCIAL` bit(1) NOT NULL DEFAULT b'0',
  `SSL_REQUIRED` varchar(255) DEFAULT NULL,
  `SSO_IDLE_TIMEOUT` int(11) DEFAULT NULL,
  `SSO_MAX_LIFESPAN` int(11) DEFAULT NULL,
  `UPDATE_PROFILE_ON_SOC_LOGIN` bit(1) NOT NULL DEFAULT b'0',
  `VERIFY_EMAIL` bit(1) NOT NULL DEFAULT b'0',
  `MASTER_ADMIN_CLIENT` varchar(36) DEFAULT NULL,
  `CERTIFICATE` varchar(2048) DEFAULT NULL,
  `CODE_SECRET` varchar(255) DEFAULT NULL,
  `LOGIN_LIFESPAN` int(11) DEFAULT NULL,
  `INTERNATIONALIZATION_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `DEFAULT_LOCALE` varchar(255) DEFAULT NULL,
  `REG_EMAIL_AS_USERNAME` bit(1) NOT NULL DEFAULT b'0',
  `ADMIN_EVENTS_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `ADMIN_EVENTS_DETAILS_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `EDIT_USERNAME_ALLOWED` bit(1) NOT NULL DEFAULT b'0',
  `OTP_POLICY_COUNTER` int(11) DEFAULT '0',
  `OTP_POLICY_WINDOW` int(11) DEFAULT '1',
  `OTP_POLICY_PERIOD` int(11) DEFAULT '30',
  `OTP_POLICY_DIGITS` int(11) DEFAULT '6',
  `OTP_POLICY_ALG` varchar(36) DEFAULT 'HmacSHA1',
  `OTP_POLICY_TYPE` varchar(36) DEFAULT 'totp',
  `BROWSER_FLOW` varchar(36) DEFAULT NULL,
  `REGISTRATION_FLOW` varchar(36) DEFAULT NULL,
  `DIRECT_GRANT_FLOW` varchar(36) DEFAULT NULL,
  `RESET_CREDENTIALS_FLOW` varchar(36) DEFAULT NULL,
  `CLIENT_AUTH_FLOW` varchar(36) DEFAULT NULL,
  `OFFLINE_SESSION_IDLE_TIMEOUT` int(11) DEFAULT '0',
  `REVOKE_REFRESH_TOKEN` bit(1) NOT NULL DEFAULT b'0',
  `ACCESS_TOKEN_LIFE_IMPLICIT` int(11) DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_ORVSDMLA56612EAEFIQ6WL5OI` (`NAME`),
  KEY `FK_TRAF444KK6QRKMS7N56AIWQ5Y` (`MASTER_ADMIN_CLIENT`),
  CONSTRAINT `FK_TRAF444KK6QRKMS7N56AIWQ5Y` FOREIGN KEY (`MASTER_ADMIN_CLIENT`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM`
--

LOCK TABLES `REALM` WRITE;
/*!40000 ALTER TABLE `REALM` DISABLE KEYS */;
INSERT INTO `REALM` VALUES ('itesoft',60,300,300,NULL,NULL,NULL,'','\0',0,NULL,'itesoft',0,NULL,'MIIEpAIBAAKCAQEAn2UG+yzh8Y9Bec0ChMEVnpUQpFMh4fU/PKBsw5s5sEwjOdxVmN8/F4Q+81gpcglX6IKyolrHoN1+eNoCCgQaCEzRMlAsPIXQk5ToojnW4LarARfSLB4Lk99EAs+eyAQkQE142c7ZwTIDRiddpEBUeO9zIVgseFPtHqnRkpH9JJsRLWcdqOKJCf2O6tHI++nNAyIfkFUPITv0S2AJq09psxBkWYBYAIYEvKqaXDZV8iffckKlpmNqXctN9ZI17hZxelXT1/DC2/V5hyaXso1HSX0IPdqMiKuW10ujDdJp8Vs0KtiMbXXBFYi2ZwHIcKo+hMYddd2dgkLqWQ/frCPUfQIDAQABAoIBACtsXHCFE7C5ND84aJ099OPU/EmoFCz4oRelJLxNR3QN6fLTYcZZ21hOwM+OjwvwG7DOGlg8nvHmJZRK4A9WerkUJFGuob6DPgVWpeG8HBvv57pOgQVf0gug4Whao4keB7o04N2FirElLNsp0kry85BWu2i0GrlVM94MqXliqDIWVAKL8VXDUsDpfsdCgAZw4KwkT0TFgOTcK8HJrFSiIWFTK68KQbU5PWkNsZbZaD3itmFOYKdDz+mRoUd51Mp5c/aefEmwCQIlCzRfuA+SPbjIDRFtJX9K7c2CMkiz/iIuQdRzhcKLKqyJ/0tvDP85zjsPmovGm6cqX2/2TF5EZkkCgYEA+oDqelvwQE7B98RKJqr/sCbklUvPWb+I9zBFXz56CJJpNnqqOFcZvwTg/ek6n7X6i8tSNaIyoM3IQJevFgbtPDNhTLdIkJyh9/nkPM7lcK7yyM94lJfIlALBjvfPtDBkcqX8Ubri1X/8nVy2RbuYaNNK0gKgW4ytHz//q9WpwusCgYEAouRZtgCR6/yG30MwQ+0prH0wyYrbJGn4uPDtq3P/BK45RjbY3a7xqzr/dRixkOheebTO23lxwK55N9mri3ABHH/JYnJ3zuD6W8OIF2TItlsjaf7TbiuNy7w/+t2vVXQpQY1FnUnNqXzgGGOIcXCTzpGnCGmAUBJZC/XotZ873DcCgYEAjmaQZGQ1K+lZfEZaPKcCWJmTYYdJ5OPrsVEAbocuigboxm5uqz5gRWU5nT1i9P1W4vb+0bxVeXHhf0562lOvsoQmsJyUJJjVvgiRBTw705WwMBU4n4e1HuZ+L46RxQWpZD8VM0TAw8tQyAe3GebtWdGa+81AaSqME3KnHYCFU2cCgYAe8SN9aBRP8HMqO9gSPx24bztyPVctTpf5gYKUG/+oQvQMO2Tsj0vGy/k0pBEuxoUTt13H4QTTphDOpCFq5ka/xCJb+gR6HtBP2A+k6fcadKuAefBtsAZKWiMJI00n/V3M3uoHW7qeZGMpHtcPPWRGS/KfrXK7QxD5Lagbv/id9wKBgQDOxlSvUdukIzlhRSMgw+Z/rjkpGCMlEAoJabQGltjGZfn0nXvUZoaojFOWXbbmgzIv4JsoOV0zwm8D8LauFjN73I655nhlpbHvtb5K2LwEgvuxAAXsr2HZSUsDLSBew1J8/B4qi3gIFdw4hMGo9li8t24QbLwuy/hrSlY6wHTIpQ==','MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAn2UG+yzh8Y9Bec0ChMEVnpUQpFMh4fU/PKBsw5s5sEwjOdxVmN8/F4Q+81gpcglX6IKyolrHoN1+eNoCCgQaCEzRMlAsPIXQk5ToojnW4LarARfSLB4Lk99EAs+eyAQkQE142c7ZwTIDRiddpEBUeO9zIVgseFPtHqnRkpH9JJsRLWcdqOKJCf2O6tHI++nNAyIfkFUPITv0S2AJq09psxBkWYBYAIYEvKqaXDZV8iffckKlpmNqXctN9ZI17hZxelXT1/DC2/V5hyaXso1HSX0IPdqMiKuW10ujDdJp8Vs0KtiMbXXBFYi2ZwHIcKo+hMYddd2dgkLqWQ/frCPUfQIDAQAB','\0','\0','\0','\0','EXTERNAL',1800,36000,'\0','\0','064f5c8b-d948-4923-923f-d67569c61d2c','MIICnTCCAYUCBgFRgnWMODANBgkqhkiG9w0BAQsFADASMRAwDgYDVQQDDAdpdGVzb2Z0MB4XDTE1MTIwODE2MzcwMFoXDTI1MTIwODE2Mzg0MFowEjEQMA4GA1UEAwwHaXRlc29mdDCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAJ9lBvss4fGPQXnNAoTBFZ6VEKRTIeH1PzygbMObObBMIzncVZjfPxeEPvNYKXIJV+iCsqJax6DdfnjaAgoEGghM0TJQLDyF0JOU6KI51uC2qwEX0iweC5PfRALPnsgEJEBNeNnO2cEyA0YnXaRAVHjvcyFYLHhT7R6p0ZKR/SSbES1nHajiiQn9jurRyPvpzQMiH5BVDyE79EtgCatPabMQZFmAWACGBLyqmlw2VfIn33JCpaZjal3LTfWSNe4WcXpV09fwwtv1eYcml7KNR0l9CD3ajIirltdLow3SafFbNCrYjG11wRWItmcByHCqPoTGHXXdnYJC6lkP36wj1H0CAwEAATANBgkqhkiG9w0BAQsFAAOCAQEALEXkpuElCEgzcL0dNbVqRcddJDvHPhNXnA1GHI68kj3iG2R5yOXFkAUtL84I5I7gNnyK5l8pE1Mg8qhS4662yuNQL8wi5KoY6Fw+fwb2XMbHj0It4551P5TOmR82TeUPaEUN4pZu6jhwHwmQnm1uR332v/qiq041An+1T+CYkYth0g7pLKEmQb8lcDSNSaqtc9Syz4b9GtBgF+W+4m/HgsfXSH4hLWEdtlQjD4IG2tcqvngGZDqRwUbTrYw49Gbri/hTdTo5VPFPpIBcf3br/8ajwWOThDZqqw6IzVXyIUXxRiKLebuGhO7Ta1zKX9iMMB013IrvyU7QK2oiP8Uvhw==','c8fc0c8c-33a4-40f1-8797-2390760285b8',1800,'\0',NULL,'\0','\0','\0','\0',0,1,30,6,'HmacSHA1','totp','74a7dd1e-339d-4211-981f-1d8d304abe95','835f475c-ec2d-4c77-8396-3b7a2f35fbc7','842bcabe-d53a-4669-b4b8-70b8dfbfd590','5896ed51-07cf-4478-b3fb-057b7ced2eb5','c277c38d-773e-4b0c-91bd-1627927005f0',2592000,'\0',900),('master',60,300,60,NULL,NULL,NULL,'','\0',0,NULL,'master',0,NULL,'MIIEogIBAAKCAQEAkd7vEe3yp7MkBbU4wPuprBQrmIED+WyW7qFVH1DknuKzf2WE2Wl5GG3e59Une1Zu3YIeEfdLaOTXYFyiW+UqwxvZV849/QHojR3UueOKT0WVTUW/A7Y9U3uRDtZNScC7MUkvvjCP7umVaCnjF3TcO+sSChrId6u6FsW0/Yy/sLqZp14NTKK6ErKO1go9nsG61Ewtp1W+1nBKPUzDEIlfgKz0E7rL1rwY2FWyZKx/XnQ57Ll0TjCAi0pJUoSbasfZhErxw82vLb2RPpGzRGZStOEiDOB0ibmgBKocZPcmMzMECRRZzR4iIYx8CQOUFrGydzRNHBK15SM1KVaPvECfUwIDAQABAoIBAARLtmqmwUCjC+qHHbbBMov4xBfnpMBRrFg2tBUKAtGTB4o26SSl8IUBp1DYfCMrtnQbgtswly3tn1IdKELgitPYHBxz3Gt5BOoy+LLIuqf++pid9zQax8+PkgQH15rWbCzVZOyK7ZIxms7IfQGR1XKGR6+4fjLYAdDt3Zih7ns72ACDUaldcWfXLldjOUtgk+NFmn7Rew9PPQOMYh653OJDrvjfTF9u+VbW5AhAdBOVWINmt4wj7uaVYnIVCOPACu7dwHNQGs6MaqHmcDc1/rVXkUHBwWNRyGdmFFTj+dZEDGDTes1OANUBk1zfq8nok8pVO3tgQDUasC6L/QAi7jECgYEA5gINMfo9EUoPcZzDMa3gVsOP5+l42sfn9tjKdoz7G/vNYCnEvi5nslCxPHed3wevusPIsHMD8fkd9FPij64E8T92XQGD33JpGlQAJV6iPo6sS8o4VMy1jLMkW10vg803VuEIN+0PrUuZIbL6LNcWlUyn/wbMb9PVZAq1Yp/VlicCgYEAolrcX5u8Cj0E+u0yy2WfbrJciRFuSH61YZ0YOpe4OwNWysESRhDwSRukFGo1DJIAtB4qeKqyH1kZXDpkGwUPe+l7RUwpsjLPqlbtl8J0gQEHqLiTA72oDurLB3ewdUSSicHueEELQTyP0nNYorpiYgUB2c6+gMf3bb0/WJnoNPUCgYBbkLGEFeS9v0gKqKekXV4T7GKbpnxwTGjyAjgHnfRRnZqTD829EGhDuo/0TIJSyZKRvWNlq0QEznG4VLS7EkHxcJxERlgjWj6xNoOgXN4mHVJGEcj/KUeVLbPpk11ZERdYxNkqunslOBVMLx4dP7tD0HKIukIkuqYW35R6ILs8vQKBgFsaT0TbF8ZK/Uts5K7bxH4SWfiULmVBrLgstdbTIg8DTaWSd5WXla4Ac6789e2q0/g+YSi66B7NGXz2SwwaZ9jpaEG3fkI/XuY/xyz8cfGdyVV01RIpT2+ncuwqznrPUsc4an9SSGV//VhjX15Y5jIIi0RUTfPnwcDzi+NE4dctAoGAHRsLhBNp0jsnZ327xOpMVWi76x9UY005sGITUaiMwnt/VK90WAhJagnEV3H1jWRetfH+FeTG7/PwIJ6x9u6VGjRy8zT/aW8clQeph8R855zKkFW5epOK6yvQeVLmxllo7QZUn4wg4PLaZ5i8jAgNE8FmipUYeRtkXMBXM+KN8Uw=','MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAkd7vEe3yp7MkBbU4wPuprBQrmIED+WyW7qFVH1DknuKzf2WE2Wl5GG3e59Une1Zu3YIeEfdLaOTXYFyiW+UqwxvZV849/QHojR3UueOKT0WVTUW/A7Y9U3uRDtZNScC7MUkvvjCP7umVaCnjF3TcO+sSChrId6u6FsW0/Yy/sLqZp14NTKK6ErKO1go9nsG61Ewtp1W+1nBKPUzDEIlfgKz0E7rL1rwY2FWyZKx/XnQ57Ll0TjCAi0pJUoSbasfZhErxw82vLb2RPpGzRGZStOEiDOB0ibmgBKocZPcmMzMECRRZzR4iIYx8CQOUFrGydzRNHBK15SM1KVaPvECfUwIDAQAB','\0','\0','\0','\0','EXTERNAL',1800,36000,'\0','\0','679f9c84-39c2-4300-929b-8b0bf875e85e','MIICmzCCAYMCBgFRgnMszDANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZtYXN0ZXIwHhcNMTUxMjA4MTYzNDI0WhcNMjUxMjA4MTYzNjA0WjARMQ8wDQYDVQQDDAZtYXN0ZXIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCR3u8R7fKnsyQFtTjA+6msFCuYgQP5bJbuoVUfUOSe4rN/ZYTZaXkYbd7n1Sd7Vm7dgh4R90to5NdgXKJb5SrDG9lXzj39AeiNHdS544pPRZVNRb8Dtj1Te5EO1k1JwLsxSS++MI/u6ZVoKeMXdNw76xIKGsh3q7oWxbT9jL+wupmnXg1MoroSso7WCj2ewbrUTC2nVb7WcEo9TMMQiV+ArPQTusvWvBjYVbJkrH9edDnsuXROMICLSklShJtqx9mESvHDza8tvZE+kbNEZlK04SIM4HSJuaAEqhxk9yYzMwQJFFnNHiIhjHwJA5QWsbJ3NE0cErXlIzUpVo+8QJ9TAgMBAAEwDQYJKoZIhvcNAQELBQADggEBAIKXORpqqXuMisE99IPjiAlPbEd7SqFLCfzJ+0oU3sm1V9fGS8rUUdc/6QqCjb681pRC8wuvUfth8OUjrHHRtsFtSQfwDkLppcWWQx43ET+F9auoQKUKxH+a3x0kn2EbzsjJ2Eh7WtPuDmfxGqzvfFbd0aVHdFbU2olEZcH2tJ4elzUJne/xfzMVLjUwAhY89rwBgbQaB9KzgspbYsoswPoos8+VIN6rkkcKmax/zQovdCoqUqcmn/+zONA/j+gAmx/N1a00XLAaEqIiHIgEwcCfZXacYnyJr/ByknxwZ7nVWKR1KZE0ettbkAl61rqwmqkZRHGfmp4qmG2Ah+S9yxg=','de1fd54f-25ba-42a4-a82c-abbfcfda7e34',1800,'\0',NULL,'\0','\0','\0','\0',0,1,30,6,'HmacSHA1','totp','96891a6b-fee2-4989-9d8f-73f6ad82ef70','4b0d1947-8eb6-4a5c-91f8-b00c182489c9','8bb0480a-a05e-4be5-9858-681c1dcbe867','abcde03e-ae76-43e1-82af-b53f852e417f','c9a4a7b7-f851-4b52-87f0-5d827e3663ec',2592000,'\0',900);
/*!40000 ALTER TABLE `REALM` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_ATTRIBUTE`
--

DROP TABLE IF EXISTS `REALM_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `REALM_ATTRIBUTE` (
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`NAME`,`REALM_ID`),
  KEY `FK_8SHXD6L3E9ATQUKACXGPFFPTW` (`REALM_ID`),
  CONSTRAINT `FK_8SHXD6L3E9ATQUKACXGPFFPTW` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_ATTRIBUTE`
--

LOCK TABLES `REALM_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `REALM_ATTRIBUTE` DISABLE KEYS */;
INSERT INTO `REALM_ATTRIBUTE` VALUES ('bruteForceProtected','false','itesoft'),('bruteForceProtected','false','master'),('failureFactor','30','itesoft'),('failureFactor','30','master'),('maxDeltaTimeSeconds','43200','itesoft'),('maxDeltaTimeSeconds','43200','master'),('maxFailureWaitSeconds','900','itesoft'),('maxFailureWaitSeconds','900','master'),('minimumQuickLoginWaitSeconds','60','itesoft'),('minimumQuickLoginWaitSeconds','60','master'),('quickLoginCheckMilliSeconds','1000','itesoft'),('quickLoginCheckMilliSeconds','1000','master'),('waitIncrementSeconds','60','itesoft'),('waitIncrementSeconds','60','master'),('_browser_header.contentSecurityPolicy','frame-src \'self\'','itesoft'),('_browser_header.contentSecurityPolicy','frame-src \'self\'','master'),('_browser_header.xFrameOptions','SAMEORIGIN','itesoft'),('_browser_header.xFrameOptions','SAMEORIGIN','master');
/*!40000 ALTER TABLE `REALM_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_CLIENT`
--

DROP TABLE IF EXISTS `REALM_CLIENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `REALM_CLIENT` (
  `REALM_ID` varchar(36) DEFAULT NULL,
  `CLIENT_ID` varchar(36) DEFAULT NULL,
  UNIQUE KEY `UK_M6QGA3RFME47335JY8JXYXH3I` (`CLIENT_ID`),
  KEY `FK_M6QGA3RFME47335JY8JXYXH3I` (`REALM_ID`),
  CONSTRAINT `FK_93S3P0DIUXAWWQQSA528UBY2Q` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`),
  CONSTRAINT `FK_M6QGA3RFME47335JY8JXYXH3I` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_CLIENT`
--

LOCK TABLES `REALM_CLIENT` WRITE;
/*!40000 ALTER TABLE `REALM_CLIENT` DISABLE KEYS */;
INSERT INTO `REALM_CLIENT` VALUES ('master','3d4f25da-6732-4a75-8bca-4e2e87efeb5d'),('master','42582697-7e79-491d-8559-ae07bc6408ae'),('master','679f9c84-39c2-4300-929b-8b0bf875e85e'),('master','74e4631d-ad8e-4634-bcfc-341abc22c533'),('master','fcba708e-4cb6-40a4-b527-7769e0018a0c'),('master','064f5c8b-d948-4923-923f-d67569c61d2c'),('itesoft','a5aad6e5-6d25-4c09-a971-0654cfd9dce9'),('itesoft','7b18d0f1-b433-4cbd-b43c-481ef43518dd'),('itesoft','41efe014-736d-41c6-8240-1a253c8d63af'),('itesoft','39238724-3f56-427b-bde1-46844130b205'),('itesoft','68a6d182-a55b-49de-92fc-0c48a4abd2a8');
/*!40000 ALTER TABLE `REALM_CLIENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_DEFAULT_GROUPS`
--

DROP TABLE IF EXISTS `REALM_DEFAULT_GROUPS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `REALM_DEFAULT_GROUPS` (
  `REALM_ID` varchar(36) NOT NULL,
  `GROUP_ID` varchar(36) NOT NULL,
  UNIQUE KEY `CON_GROUP_ID_DEF_GROUPS` (`GROUP_ID`),
  KEY `FK_DEF_GROUPS_REALM` (`REALM_ID`),
  CONSTRAINT `FK_DEF_GROUPS_GROUP` FOREIGN KEY (`GROUP_ID`) REFERENCES `KEYCLOAK_GROUP` (`ID`),
  CONSTRAINT `FK_DEF_GROUPS_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_DEFAULT_GROUPS`
--

LOCK TABLES `REALM_DEFAULT_GROUPS` WRITE;
/*!40000 ALTER TABLE `REALM_DEFAULT_GROUPS` DISABLE KEYS */;
/*!40000 ALTER TABLE `REALM_DEFAULT_GROUPS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_DEFAULT_ROLES`
--

DROP TABLE IF EXISTS `REALM_DEFAULT_ROLES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `REALM_DEFAULT_ROLES` (
  `REALM_ID` varchar(36) NOT NULL,
  `ROLE_ID` varchar(36) NOT NULL,
  UNIQUE KEY `UK_H4WPD7W4HSOOLNI3H0SW7BTJE` (`ROLE_ID`),
  KEY `FK_EVUDB1PPW84OXFAX2DRS03ICC` (`REALM_ID`),
  CONSTRAINT `FK_EVUDB1PPW84OXFAX2DRS03ICC` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`),
  CONSTRAINT `FK_H4WPD7W4HSOOLNI3H0SW7BTJE` FOREIGN KEY (`ROLE_ID`) REFERENCES `KEYCLOAK_ROLE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_DEFAULT_ROLES`
--

LOCK TABLES `REALM_DEFAULT_ROLES` WRITE;
/*!40000 ALTER TABLE `REALM_DEFAULT_ROLES` DISABLE KEYS */;
INSERT INTO `REALM_DEFAULT_ROLES` VALUES ('itesoft','8f28588d-3f64-4a0e-9926-12e22b33c214'),('master','6e0f6cb2-cf79-4b6f-a790-5a4ffb7dcbdc');
/*!40000 ALTER TABLE `REALM_DEFAULT_ROLES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_ENABLED_EVENT_TYPES`
--

DROP TABLE IF EXISTS `REALM_ENABLED_EVENT_TYPES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `REALM_ENABLED_EVENT_TYPES` (
  `REALM_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  KEY `FK_H846O4H0W8EPX5NWEDRF5Y69J` (`REALM_ID`),
  CONSTRAINT `FK_H846O4H0W8EPX5NWEDRF5Y69J` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_ENABLED_EVENT_TYPES`
--

LOCK TABLES `REALM_ENABLED_EVENT_TYPES` WRITE;
/*!40000 ALTER TABLE `REALM_ENABLED_EVENT_TYPES` DISABLE KEYS */;
/*!40000 ALTER TABLE `REALM_ENABLED_EVENT_TYPES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_EVENTS_LISTENERS`
--

DROP TABLE IF EXISTS `REALM_EVENTS_LISTENERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `REALM_EVENTS_LISTENERS` (
  `REALM_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  KEY `FK_H846O4H0W8EPX5NXEV9F5Y69J` (`REALM_ID`),
  CONSTRAINT `FK_H846O4H0W8EPX5NXEV9F5Y69J` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_EVENTS_LISTENERS`
--

LOCK TABLES `REALM_EVENTS_LISTENERS` WRITE;
/*!40000 ALTER TABLE `REALM_EVENTS_LISTENERS` DISABLE KEYS */;
INSERT INTO `REALM_EVENTS_LISTENERS` VALUES ('master','jboss-logging'),('itesoft','jboss-logging');
/*!40000 ALTER TABLE `REALM_EVENTS_LISTENERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_REQUIRED_CREDENTIAL`
--

DROP TABLE IF EXISTS `REALM_REQUIRED_CREDENTIAL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `REALM_REQUIRED_CREDENTIAL` (
  `TYPE` varchar(255) NOT NULL,
  `FORM_LABEL` varchar(255) DEFAULT NULL,
  `INPUT` bit(1) NOT NULL DEFAULT b'0',
  `SECRET` bit(1) NOT NULL DEFAULT b'0',
  `REALM_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`REALM_ID`,`TYPE`),
  CONSTRAINT `FK_5HG65LYBEVAVKQFKI3KPONH9V` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_REQUIRED_CREDENTIAL`
--

LOCK TABLES `REALM_REQUIRED_CREDENTIAL` WRITE;
/*!40000 ALTER TABLE `REALM_REQUIRED_CREDENTIAL` DISABLE KEYS */;
INSERT INTO `REALM_REQUIRED_CREDENTIAL` VALUES ('password','password','','','itesoft'),('password','password','','','master');
/*!40000 ALTER TABLE `REALM_REQUIRED_CREDENTIAL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_SMTP_CONFIG`
--

DROP TABLE IF EXISTS `REALM_SMTP_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `REALM_SMTP_CONFIG` (
  `REALM_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`REALM_ID`,`NAME`),
  CONSTRAINT `FK_70EJ8XDXGXD0B9HH6180IRR0O` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_SMTP_CONFIG`
--

LOCK TABLES `REALM_SMTP_CONFIG` WRITE;
/*!40000 ALTER TABLE `REALM_SMTP_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `REALM_SMTP_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_SUPPORTED_LOCALES`
--

DROP TABLE IF EXISTS `REALM_SUPPORTED_LOCALES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `REALM_SUPPORTED_LOCALES` (
  `REALM_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  KEY `FK_SUPPORTED_LOCALES_REALM` (`REALM_ID`),
  CONSTRAINT `FK_SUPPORTED_LOCALES_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_SUPPORTED_LOCALES`
--

LOCK TABLES `REALM_SUPPORTED_LOCALES` WRITE;
/*!40000 ALTER TABLE `REALM_SUPPORTED_LOCALES` DISABLE KEYS */;
/*!40000 ALTER TABLE `REALM_SUPPORTED_LOCALES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REDIRECT_URIS`
--

DROP TABLE IF EXISTS `REDIRECT_URIS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `REDIRECT_URIS` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  KEY `FK_1BURS8PB4OUJ97H5WUPPAHV9F` (`CLIENT_ID`),
  CONSTRAINT `FK_1BURS8PB4OUJ97H5WUPPAHV9F` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REDIRECT_URIS`
--

LOCK TABLES `REDIRECT_URIS` WRITE;
/*!40000 ALTER TABLE `REDIRECT_URIS` DISABLE KEYS */;
INSERT INTO `REDIRECT_URIS` VALUES ('3d4f25da-6732-4a75-8bca-4e2e87efeb5d','/auth/realms/master/account/*'),('42582697-7e79-491d-8559-ae07bc6408ae','/auth/admin/master/console/*'),('7b18d0f1-b433-4cbd-b43c-481ef43518dd','/auth/realms/itesoft/account/*'),('39238724-3f56-427b-bde1-46844130b205','/auth/admin/itesoft/console/*');
/*!40000 ALTER TABLE `REDIRECT_URIS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REQUIRED_ACTION_CONFIG`
--

DROP TABLE IF EXISTS `REQUIRED_ACTION_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `REQUIRED_ACTION_CONFIG` (
  `REQUIRED_ACTION_ID` varchar(36) NOT NULL,
  `VALUE` longtext,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`REQUIRED_ACTION_ID`,`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REQUIRED_ACTION_CONFIG`
--

LOCK TABLES `REQUIRED_ACTION_CONFIG` WRITE;
/*!40000 ALTER TABLE `REQUIRED_ACTION_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `REQUIRED_ACTION_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REQUIRED_ACTION_PROVIDER`
--

DROP TABLE IF EXISTS `REQUIRED_ACTION_PROVIDER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `REQUIRED_ACTION_PROVIDER` (
  `ID` varchar(36) NOT NULL,
  `ALIAS` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `DEFAULT_ACTION` bit(1) NOT NULL DEFAULT b'0',
  `PROVIDER_ID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_REQ_ACT_REALM` (`REALM_ID`),
  CONSTRAINT `FK_REQ_ACT_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REQUIRED_ACTION_PROVIDER`
--

LOCK TABLES `REQUIRED_ACTION_PROVIDER` WRITE;
/*!40000 ALTER TABLE `REQUIRED_ACTION_PROVIDER` DISABLE KEYS */;
INSERT INTO `REQUIRED_ACTION_PROVIDER` VALUES ('002cfe78-0530-4689-8396-037abed6cd63','VERIFY_EMAIL','Verify Email','master','','\0','VERIFY_EMAIL'),('015724fd-61d1-4e72-aacd-fc960537671f','CONFIGURE_TOTP','Configure Totp','master','','\0','CONFIGURE_TOTP'),('0cc8d87e-064b-49ca-9e55-2c4f2477c02e','terms_and_conditions','Terms and Conditions','master','\0','\0','terms_and_conditions'),('135ea94c-7f77-4d1e-a252-9e829e80b2e7','UPDATE_PROFILE','Update Profile','itesoft','','\0','UPDATE_PROFILE'),('255c1edc-0fef-494d-8a0c-0a28f3773054','CONFIGURE_TOTP','Configure Totp','itesoft','','\0','CONFIGURE_TOTP'),('5966d6c1-c080-4b12-80e7-fb0aa99e881b','UPDATE_PASSWORD','Update Password','master','','\0','UPDATE_PASSWORD'),('61c86a4f-7209-4f5c-8a76-3e52cd8069a5','UPDATE_PASSWORD','Update Password','itesoft','','\0','UPDATE_PASSWORD'),('95265559-4dcd-4b42-9a4d-f08eebda2a0c','VERIFY_EMAIL','Verify Email','itesoft','','\0','VERIFY_EMAIL'),('b08888e6-3ed0-445d-a42c-c815d895cfd6','UPDATE_PROFILE','Update Profile','master','','\0','UPDATE_PROFILE'),('dbdd85d0-86bd-4ddc-a0c8-7106cb2f2340','terms_and_conditions','Terms and Conditions','itesoft','\0','\0','terms_and_conditions');
/*!40000 ALTER TABLE `REQUIRED_ACTION_PROVIDER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SCOPE_MAPPING`
--

DROP TABLE IF EXISTS `SCOPE_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SCOPE_MAPPING` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `ROLE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`ROLE_ID`),
  KEY `FK_P3RH9GRKU11KQFRS4FLTT7RNQ` (`ROLE_ID`),
  CONSTRAINT `FK_OUSE064PLMLR732LXJCN1Q5F1` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`),
  CONSTRAINT `FK_P3RH9GRKU11KQFRS4FLTT7RNQ` FOREIGN KEY (`ROLE_ID`) REFERENCES `KEYCLOAK_ROLE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SCOPE_MAPPING`
--

LOCK TABLES `SCOPE_MAPPING` WRITE;
/*!40000 ALTER TABLE `SCOPE_MAPPING` DISABLE KEYS */;
INSERT INTO `SCOPE_MAPPING` VALUES ('42582697-7e79-491d-8559-ae07bc6408ae','8e33d585-66f9-4705-9d7e-f666da51257a'),('74e4631d-ad8e-4634-bcfc-341abc22c533','8e33d585-66f9-4705-9d7e-f666da51257a'),('39238724-3f56-427b-bde1-46844130b205','c53374e2-052a-4d69-a00a-ff978e628f24'),('68a6d182-a55b-49de-92fc-0c48a4abd2a8','c53374e2-052a-4d69-a00a-ff978e628f24');
/*!40000 ALTER TABLE `SCOPE_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USERNAME_LOGIN_FAILURE`
--

DROP TABLE IF EXISTS `USERNAME_LOGIN_FAILURE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USERNAME_LOGIN_FAILURE` (
  `REALM_ID` varchar(36) NOT NULL,
  `USERNAME` varchar(200) NOT NULL,
  `FAILED_LOGIN_NOT_BEFORE` int(11) DEFAULT NULL,
  `LAST_FAILURE` bigint(20) DEFAULT NULL,
  `LAST_IP_FAILURE` varchar(255) DEFAULT NULL,
  `NUM_FAILURES` int(11) DEFAULT NULL,
  PRIMARY KEY (`REALM_ID`,`USERNAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USERNAME_LOGIN_FAILURE`
--

LOCK TABLES `USERNAME_LOGIN_FAILURE` WRITE;
/*!40000 ALTER TABLE `USERNAME_LOGIN_FAILURE` DISABLE KEYS */;
/*!40000 ALTER TABLE `USERNAME_LOGIN_FAILURE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_ATTRIBUTE`
--

DROP TABLE IF EXISTS `USER_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USER_ATTRIBUTE` (
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `USER_ID` varchar(36) NOT NULL,
  `ID` varchar(36) NOT NULL DEFAULT 'sybase-needs-something-here',
  PRIMARY KEY (`ID`),
  KEY `FK_5HRM2VLF9QL5FU043KQEPOVBR` (`USER_ID`),
  CONSTRAINT `FK_5HRM2VLF9QL5FU043KQEPOVBR` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_ATTRIBUTE`
--

LOCK TABLES `USER_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `USER_ATTRIBUTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_CONSENT`
--

DROP TABLE IF EXISTS `USER_CONSENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USER_CONSENT` (
  `ID` varchar(36) NOT NULL,
  `CLIENT_ID` varchar(36) NOT NULL,
  `USER_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_JKUWUVD56ONTGSUHOGM8UEWRT` (`CLIENT_ID`,`USER_ID`),
  KEY `FK_GRNTCSNT_USER` (`USER_ID`),
  CONSTRAINT `FK_GRNTCSNT_USER` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_CONSENT`
--

LOCK TABLES `USER_CONSENT` WRITE;
/*!40000 ALTER TABLE `USER_CONSENT` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_CONSENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_CONSENT_PROT_MAPPER`
--

DROP TABLE IF EXISTS `USER_CONSENT_PROT_MAPPER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USER_CONSENT_PROT_MAPPER` (
  `USER_CONSENT_ID` varchar(36) NOT NULL,
  `PROTOCOL_MAPPER_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`USER_CONSENT_ID`,`PROTOCOL_MAPPER_ID`),
  CONSTRAINT `FK_GRNTCSNT_PRM_GR` FOREIGN KEY (`USER_CONSENT_ID`) REFERENCES `USER_CONSENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_CONSENT_PROT_MAPPER`
--

LOCK TABLES `USER_CONSENT_PROT_MAPPER` WRITE;
/*!40000 ALTER TABLE `USER_CONSENT_PROT_MAPPER` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_CONSENT_PROT_MAPPER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_CONSENT_ROLE`
--

DROP TABLE IF EXISTS `USER_CONSENT_ROLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USER_CONSENT_ROLE` (
  `USER_CONSENT_ID` varchar(36) NOT NULL,
  `ROLE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`USER_CONSENT_ID`,`ROLE_ID`),
  CONSTRAINT `FK_GRNTCSNT_ROLE_GR` FOREIGN KEY (`USER_CONSENT_ID`) REFERENCES `USER_CONSENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_CONSENT_ROLE`
--

LOCK TABLES `USER_CONSENT_ROLE` WRITE;
/*!40000 ALTER TABLE `USER_CONSENT_ROLE` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_CONSENT_ROLE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_ENTITY`
--

DROP TABLE IF EXISTS `USER_ENTITY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USER_ENTITY` (
  `ID` varchar(36) NOT NULL,
  `EMAIL` varchar(255) DEFAULT NULL,
  `EMAIL_CONSTRAINT` varchar(255) DEFAULT NULL,
  `EMAIL_VERIFIED` bit(1) NOT NULL DEFAULT b'0',
  `ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `FEDERATION_LINK` varchar(255) DEFAULT NULL,
  `FIRST_NAME` varchar(255) DEFAULT NULL,
  `LAST_NAME` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `TOTP` bit(1) NOT NULL DEFAULT b'0',
  `USERNAME` varchar(255) DEFAULT NULL,
  `CREATED_TIMESTAMP` bigint(20) DEFAULT NULL,
  `SERVICE_ACCOUNT_CLIENT_LINK` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_DYKN684SL8UP1CRFEI6ECKHD7` (`REALM_ID`,`EMAIL_CONSTRAINT`),
  UNIQUE KEY `UK_RU8TT6T700S9V50BU18WS5HA6` (`REALM_ID`,`USERNAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_ENTITY`
--

LOCK TABLES `USER_ENTITY` WRITE;
/*!40000 ALTER TABLE `USER_ENTITY` DISABLE KEYS */;
INSERT INTO `USER_ENTITY` VALUES ('3eeb7d53-0b3d-4133-ba77-44bed88b2005',NULL,'37018c3a-bf25-4496-836e-9231fd263f69','\0','',NULL,NULL,NULL,'master','\0','admin',1449592565803,NULL);
/*!40000 ALTER TABLE `USER_ENTITY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_FEDERATION_CONFIG`
--

DROP TABLE IF EXISTS `USER_FEDERATION_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USER_FEDERATION_CONFIG` (
  `USER_FEDERATION_PROVIDER_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`USER_FEDERATION_PROVIDER_ID`,`NAME`),
  CONSTRAINT `FK_T13HPU1J94R2EBPEKR39X5EU5` FOREIGN KEY (`USER_FEDERATION_PROVIDER_ID`) REFERENCES `USER_FEDERATION_PROVIDER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_FEDERATION_CONFIG`
--

LOCK TABLES `USER_FEDERATION_CONFIG` WRITE;
/*!40000 ALTER TABLE `USER_FEDERATION_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_FEDERATION_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_FEDERATION_MAPPER`
--

DROP TABLE IF EXISTS `USER_FEDERATION_MAPPER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USER_FEDERATION_MAPPER` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `FEDERATION_PROVIDER_ID` varchar(36) NOT NULL,
  `FEDERATION_MAPPER_TYPE` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_FEDMAPPERPM_REALM` (`REALM_ID`),
  KEY `FK_FEDMAPPERPM_FEDPRV` (`FEDERATION_PROVIDER_ID`),
  CONSTRAINT `FK_FEDMAPPERPM_FEDPRV` FOREIGN KEY (`FEDERATION_PROVIDER_ID`) REFERENCES `USER_FEDERATION_PROVIDER` (`ID`),
  CONSTRAINT `FK_FEDMAPPERPM_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_FEDERATION_MAPPER`
--

LOCK TABLES `USER_FEDERATION_MAPPER` WRITE;
/*!40000 ALTER TABLE `USER_FEDERATION_MAPPER` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_FEDERATION_MAPPER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_FEDERATION_MAPPER_CONFIG`
--

DROP TABLE IF EXISTS `USER_FEDERATION_MAPPER_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USER_FEDERATION_MAPPER_CONFIG` (
  `USER_FEDERATION_MAPPER_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`USER_FEDERATION_MAPPER_ID`,`NAME`),
  CONSTRAINT `FK_FEDMAPPER_CFG` FOREIGN KEY (`USER_FEDERATION_MAPPER_ID`) REFERENCES `USER_FEDERATION_MAPPER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_FEDERATION_MAPPER_CONFIG`
--

LOCK TABLES `USER_FEDERATION_MAPPER_CONFIG` WRITE;
/*!40000 ALTER TABLE `USER_FEDERATION_MAPPER_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_FEDERATION_MAPPER_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_FEDERATION_PROVIDER`
--

DROP TABLE IF EXISTS `USER_FEDERATION_PROVIDER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USER_FEDERATION_PROVIDER` (
  `ID` varchar(36) NOT NULL,
  `CHANGED_SYNC_PERIOD` int(11) DEFAULT NULL,
  `DISPLAY_NAME` varchar(255) DEFAULT NULL,
  `FULL_SYNC_PERIOD` int(11) DEFAULT NULL,
  `LAST_SYNC` int(11) DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  `PROVIDER_NAME` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_1FJ32F6PTOLW2QY60CD8N01E8` (`REALM_ID`),
  CONSTRAINT `FK_1FJ32F6PTOLW2QY60CD8N01E8` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_FEDERATION_PROVIDER`
--

LOCK TABLES `USER_FEDERATION_PROVIDER` WRITE;
/*!40000 ALTER TABLE `USER_FEDERATION_PROVIDER` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_FEDERATION_PROVIDER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_GROUP_MEMBERSHIP`
--

DROP TABLE IF EXISTS `USER_GROUP_MEMBERSHIP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USER_GROUP_MEMBERSHIP` (
  `GROUP_ID` varchar(36) NOT NULL,
  `USER_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`GROUP_ID`,`USER_ID`),
  KEY `FK_USER_GROUP_USER` (`USER_ID`),
  CONSTRAINT `FK_USER_GROUP_USER` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_GROUP_MEMBERSHIP`
--

LOCK TABLES `USER_GROUP_MEMBERSHIP` WRITE;
/*!40000 ALTER TABLE `USER_GROUP_MEMBERSHIP` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_GROUP_MEMBERSHIP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_REQUIRED_ACTION`
--

DROP TABLE IF EXISTS `USER_REQUIRED_ACTION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USER_REQUIRED_ACTION` (
  `USER_ID` varchar(36) NOT NULL,
  `REQUIRED_ACTION` varchar(255) NOT NULL DEFAULT ' ',
  PRIMARY KEY (`REQUIRED_ACTION`,`USER_ID`),
  KEY `FK_6QJ3W1JW9CVAFHE19BWSIUVMD` (`USER_ID`),
  CONSTRAINT `FK_6QJ3W1JW9CVAFHE19BWSIUVMD` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_REQUIRED_ACTION`
--

LOCK TABLES `USER_REQUIRED_ACTION` WRITE;
/*!40000 ALTER TABLE `USER_REQUIRED_ACTION` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_REQUIRED_ACTION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_ROLE_MAPPING`
--

DROP TABLE IF EXISTS `USER_ROLE_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USER_ROLE_MAPPING` (
  `ROLE_ID` varchar(255) NOT NULL,
  `USER_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ROLE_ID`,`USER_ID`),
  KEY `FK_C4FQV34P1MBYLLOXANG7B1Q3L` (`USER_ID`),
  CONSTRAINT `FK_C4FQV34P1MBYLLOXANG7B1Q3L` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_ROLE_MAPPING`
--

LOCK TABLES `USER_ROLE_MAPPING` WRITE;
/*!40000 ALTER TABLE `USER_ROLE_MAPPING` DISABLE KEYS */;
INSERT INTO `USER_ROLE_MAPPING` VALUES ('6e0f6cb2-cf79-4b6f-a790-5a4ffb7dcbdc','3eeb7d53-0b3d-4133-ba77-44bed88b2005'),('82494c54-ef8b-4412-98b5-08a9a8c8010f','3eeb7d53-0b3d-4133-ba77-44bed88b2005'),('8e33d585-66f9-4705-9d7e-f666da51257a','3eeb7d53-0b3d-4133-ba77-44bed88b2005'),('d6e7ef07-0f3b-427f-bbff-1b8ba2802cd7','3eeb7d53-0b3d-4133-ba77-44bed88b2005');
/*!40000 ALTER TABLE `USER_ROLE_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_SESSION`
--

DROP TABLE IF EXISTS `USER_SESSION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USER_SESSION` (
  `ID` varchar(36) NOT NULL,
  `AUTH_METHOD` varchar(255) DEFAULT NULL,
  `IP_ADDRESS` varchar(255) DEFAULT NULL,
  `LAST_SESSION_REFRESH` int(11) DEFAULT NULL,
  `LOGIN_USERNAME` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `REMEMBER_ME` bit(1) NOT NULL DEFAULT b'0',
  `STARTED` int(11) DEFAULT NULL,
  `USER_ID` varchar(255) DEFAULT NULL,
  `USER_SESSION_STATE` int(11) DEFAULT NULL,
  `BROKER_SESSION_ID` varchar(255) DEFAULT NULL,
  `BROKER_USER_ID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_SESSION`
--

LOCK TABLES `USER_SESSION` WRITE;
/*!40000 ALTER TABLE `USER_SESSION` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_SESSION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_SESSION_NOTE`
--

DROP TABLE IF EXISTS `USER_SESSION_NOTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USER_SESSION_NOTE` (
  `USER_SESSION` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(2048) DEFAULT NULL,
  PRIMARY KEY (`USER_SESSION`,`NAME`),
  CONSTRAINT `FK5EDFB00FF51D3472` FOREIGN KEY (`USER_SESSION`) REFERENCES `USER_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_SESSION_NOTE`
--

LOCK TABLES `USER_SESSION_NOTE` WRITE;
/*!40000 ALTER TABLE `USER_SESSION_NOTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_SESSION_NOTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `WEB_ORIGINS`
--

DROP TABLE IF EXISTS `WEB_ORIGINS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `WEB_ORIGINS` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  KEY `FK_LOJPHO213XCX4WNKOG82SSRFY` (`CLIENT_ID`),
  CONSTRAINT `FK_LOJPHO213XCX4WNKOG82SSRFY` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WEB_ORIGINS`
--

LOCK TABLES `WEB_ORIGINS` WRITE;
/*!40000 ALTER TABLE `WEB_ORIGINS` DISABLE KEYS */;
/*!40000 ALTER TABLE `WEB_ORIGINS` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-12-08 16:39:09
