
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AUTHENTICATION_EXECUTION`
--

LOCK TABLES `AUTHENTICATION_EXECUTION` WRITE;
/*!40000 ALTER TABLE `AUTHENTICATION_EXECUTION` DISABLE KEYS */;
INSERT INTO `AUTHENTICATION_EXECUTION` VALUES ('00bb0cb6-c053-40b5-80af-b6d913022fcb',NULL,'auth-cookie','itesoft','93b930ae-a898-4e38-8624-ff8c75f5cb42',2,10,'\0',NULL,NULL),('0501d02c-35ba-47f9-a559-9084df092771',NULL,'reset-credential-email','master','0d2de298-6be1-479f-9569-a9841f90e064',0,20,'\0',NULL,NULL),('0ab86e92-6160-44cf-97d0-15f1d1b8f26c',NULL,'auth-cookie','master','ba2acb03-264c-4f2e-9016-1001fad0f805',2,10,'\0',NULL,NULL),('0d6dd6a2-e33b-497f-a54c-091ff614b772',NULL,NULL,'master','5f40c8d2-c1da-4c52-a4d3-fdb03950c4bc',2,30,'','ea959c98-61eb-4764-9518-83d1208f0b8d',NULL),('12380e79-8f46-4448-9cf3-3736367dc40a',NULL,'idp-review-profile','itesoft','4a4db2bb-f077-47ff-a7cb-f9bea09e559b',0,10,'\0',NULL,'c71c3fc1-b288-4d61-8ab5-95a62f48b298'),('13783ada-7cd9-4104-b035-74a6d1858d3a',NULL,'reset-otp','master','0d2de298-6be1-479f-9569-a9841f90e064',1,40,'\0',NULL,NULL),('1503b634-607a-43bf-948d-fffc1c174262',NULL,'direct-grant-validate-username','master','92357ae4-d49d-4af5-827f-ad2cb82a0e9f',0,10,'\0',NULL,NULL),('183c2b92-43d6-4da2-80e6-4578f1820958',NULL,'auth-username-password-form','itesoft','0a8e4c07-bd9a-4f6f-b2a7-15df78a1ddd0',0,10,'\0',NULL,NULL),('18c9a950-3500-4572-b46a-d39dc810bc23',NULL,'registration-recaptcha-action','master','eed6e2aa-84a6-463d-b352-9df50e0da962',3,60,'\0',NULL,NULL),('197deae6-b2d6-494e-ae4b-b21d3645992f',NULL,'reset-otp','itesoft','c9dcc34f-fc04-498c-abce-36087d02fd1a',1,40,'\0',NULL,NULL),('1c871894-dc2f-44cc-a4f4-e111077fc2f6',NULL,'auth-otp-form','itesoft','8715d2f0-c918-4609-be5b-915411423d7e',1,20,'\0',NULL,NULL),('1cb85c53-26f9-48ff-93b6-47f3367ef030',NULL,'client-secret','master','3278bc14-dfe4-4be0-a1c0-41fca9d9d306',2,10,'\0',NULL,NULL),('213a6e27-28d4-4c2f-bec1-8b0f42bd18a1',NULL,'reset-password','itesoft','c9dcc34f-fc04-498c-abce-36087d02fd1a',0,30,'\0',NULL,NULL),('2ec98fe1-c433-4c83-92fe-8fdc69a547c9',NULL,'direct-grant-validate-username','itesoft','8807dfdf-e118-43f0-97a3-c7bda65c2db4',0,10,'\0',NULL,NULL),('392924be-788f-4981-bdd0-e7a1c0cacb22',NULL,'auth-username-password-form','master','4309430a-dea4-4d5c-98cf-da3b62c5f505',0,10,'\0',NULL,NULL),('4093fc89-e32b-4a9c-9e3c-2f478a814e7b',NULL,'reset-credentials-choose-user','master','0d2de298-6be1-479f-9569-a9841f90e064',0,10,'\0',NULL,NULL),('47458439-dab3-4a8c-93b0-00cc5947a7ae',NULL,'registration-recaptcha-action','itesoft','6c84676b-ec77-474e-a2d8-88b066cb2f99',3,60,'\0',NULL,NULL),('47e3e733-9fce-413f-8417-52af550e951d',NULL,'registration-password-action','itesoft','6c84676b-ec77-474e-a2d8-88b066cb2f99',0,50,'\0',NULL,NULL),('5351d9ec-5e6b-4453-9e4a-8da2c87202ce',NULL,'auth-otp-form','itesoft','0a8e4c07-bd9a-4f6f-b2a7-15df78a1ddd0',1,20,'\0',NULL,NULL),('54c9c6a0-5d2e-4179-936a-7c8b1343e7b1',NULL,'registration-page-form','master','bc257658-d4af-4ad6-8e30-a3a9459e2db3',0,10,'','eed6e2aa-84a6-463d-b352-9df50e0da962',NULL),('56d3de1a-21b0-4923-8614-024bc1269caa',NULL,NULL,'itesoft','93b930ae-a898-4e38-8624-ff8c75f5cb42',2,30,'','0a8e4c07-bd9a-4f6f-b2a7-15df78a1ddd0',NULL),('5f37a41e-94f7-43f7-8d36-e235ea7c9767',NULL,'auth-otp-form','master','4309430a-dea4-4d5c-98cf-da3b62c5f505',1,20,'\0',NULL,NULL),('5f57e876-b52c-402e-81c8-b0bf3757bd12',NULL,'idp-confirm-link','itesoft','792fd5b0-1f19-41ae-b531-b1b083cbd2ac',0,10,'\0',NULL,NULL),('6d8dece9-b713-483f-9cb9-2a96151e52ba',NULL,'reset-credentials-choose-user','itesoft','c9dcc34f-fc04-498c-abce-36087d02fd1a',0,10,'\0',NULL,NULL),('75d21a0c-85e0-436a-989a-6846ef5a4d16',NULL,'client-secret','itesoft','1b7ea6aa-0cf1-4234-8572-f3f6c8851f75',2,10,'\0',NULL,NULL),('76cacd12-044f-403d-a3a8-69ab6bdbfca1',NULL,'idp-review-profile','master','5f40c8d2-c1da-4c52-a4d3-fdb03950c4bc',0,10,'\0',NULL,'833b8e6d-958c-40ad-87e6-22a415beed43'),('7908fd2c-0292-4e92-9023-1e14f9bc2c39',NULL,'registration-profile-action','itesoft','6c84676b-ec77-474e-a2d8-88b066cb2f99',0,40,'\0',NULL,NULL),('7a86ba54-58cf-4f12-b9fb-a933d09e077d',NULL,'registration-user-creation','master','eed6e2aa-84a6-463d-b352-9df50e0da962',0,20,'\0',NULL,NULL),('7b18f295-ac64-40ce-8b89-182ac5884621',NULL,'reset-password','master','0d2de298-6be1-479f-9569-a9841f90e064',0,30,'\0',NULL,NULL),('7c3d9b01-f7b7-42b5-9d85-6f6e0424bfe7',NULL,'idp-confirm-link','master','ea959c98-61eb-4764-9518-83d1208f0b8d',0,10,'\0',NULL,NULL),('81a8ff67-8f1a-4bf3-bce6-a2c48f580028',NULL,NULL,'itesoft','4a4db2bb-f077-47ff-a7cb-f9bea09e559b',2,30,'','792fd5b0-1f19-41ae-b531-b1b083cbd2ac',NULL),('8f5c37c8-214d-40c7-8f3d-56a116ee5bb3',NULL,'auth-spnego','itesoft','93b930ae-a898-4e38-8624-ff8c75f5cb42',3,20,'\0',NULL,NULL),('94846a15-c58b-4c22-88b1-45f538bf040d',NULL,'registration-profile-action','master','eed6e2aa-84a6-463d-b352-9df50e0da962',0,40,'\0',NULL,NULL),('954acaf6-906a-403f-8356-2fd01e424e2e',NULL,'client-jwt','master','3278bc14-dfe4-4be0-a1c0-41fca9d9d306',2,20,'\0',NULL,NULL),('9773c88c-d5bb-4bdb-ac77-1c5920dfcd18',NULL,'client-jwt','itesoft','1b7ea6aa-0cf1-4234-8572-f3f6c8851f75',2,20,'\0',NULL,NULL),('97ce4b9c-7006-4fa6-9211-e82477163da5',NULL,NULL,'itesoft','792fd5b0-1f19-41ae-b531-b1b083cbd2ac',2,30,'','8715d2f0-c918-4609-be5b-915411423d7e',NULL),('982b30fb-df70-49dd-8e6f-50fee8cdc70c',NULL,'idp-email-verification','itesoft','792fd5b0-1f19-41ae-b531-b1b083cbd2ac',2,20,'\0',NULL,NULL),('9959aa9a-1486-472c-8498-7365a965a390',NULL,'idp-username-password-form','master','2751638e-1455-47a7-a539-f9d7ac306e57',0,10,'\0',NULL,NULL),('9cadcddd-1118-410c-bf87-633660980578',NULL,'reset-credential-email','itesoft','c9dcc34f-fc04-498c-abce-36087d02fd1a',0,20,'\0',NULL,NULL),('b50a8b73-4db5-4cd0-98db-26a6fd8ee22c',NULL,'registration-user-creation','itesoft','6c84676b-ec77-474e-a2d8-88b066cb2f99',0,20,'\0',NULL,NULL),('b6a8bbac-f5cb-44fa-83f9-074db0f31eba',NULL,'idp-create-user-if-unique','itesoft','4a4db2bb-f077-47ff-a7cb-f9bea09e559b',2,20,'\0',NULL,'ad44a79c-c478-47c9-a11a-7a998284c6eb'),('b8079878-b09d-4a47-beaa-4ab63b159fc5',NULL,'direct-grant-validate-password','itesoft','8807dfdf-e118-43f0-97a3-c7bda65c2db4',0,20,'\0',NULL,NULL),('c0b694c2-4c46-4afe-8308-ecb6abaa4385',NULL,'registration-password-action','master','eed6e2aa-84a6-463d-b352-9df50e0da962',0,50,'\0',NULL,NULL),('c3a11f9c-b698-4067-8a00-9b454e7202a9',NULL,'auth-spnego','master','ba2acb03-264c-4f2e-9016-1001fad0f805',3,20,'\0',NULL,NULL),('cde49ced-229c-446c-868c-2fd68edff2ab',NULL,'idp-username-password-form','itesoft','8715d2f0-c918-4609-be5b-915411423d7e',0,10,'\0',NULL,NULL),('d1e5ac37-d2c9-4e75-aa15-003bdf0f251d',NULL,'idp-email-verification','master','ea959c98-61eb-4764-9518-83d1208f0b8d',2,20,'\0',NULL,NULL),('dcdea0cd-50a1-4cec-8ecb-e3ad8d80dcd0',NULL,NULL,'master','ba2acb03-264c-4f2e-9016-1001fad0f805',2,30,'','4309430a-dea4-4d5c-98cf-da3b62c5f505',NULL),('e7f38fd5-237c-4ca5-915c-de63895f54cf',NULL,'direct-grant-validate-otp','itesoft','8807dfdf-e118-43f0-97a3-c7bda65c2db4',1,30,'\0',NULL,NULL),('e99a06ba-4cc5-4ae3-afae-92d6276479f6',NULL,'direct-grant-validate-otp','master','92357ae4-d49d-4af5-827f-ad2cb82a0e9f',1,30,'\0',NULL,NULL),('ecab7f5d-acba-413d-bf96-c517cc0fae9b',NULL,'direct-grant-validate-password','master','92357ae4-d49d-4af5-827f-ad2cb82a0e9f',0,20,'\0',NULL,NULL),('f02ab336-f4d7-4832-8d87-f018ac3c0b00',NULL,NULL,'master','ea959c98-61eb-4764-9518-83d1208f0b8d',2,30,'','2751638e-1455-47a7-a539-f9d7ac306e57',NULL),('fc39c0aa-d6a3-4b8d-9555-616cd4dede65',NULL,'registration-page-form','itesoft','ec2f79e5-d462-4e11-a953-c2c95e20f2cb',0,10,'','6c84676b-ec77-474e-a2d8-88b066cb2f99',NULL),('fd181d69-2377-4ffb-9fa7-731afd0cd79b',NULL,'auth-otp-form','master','2751638e-1455-47a7-a539-f9d7ac306e57',1,20,'\0',NULL,NULL),('fea1e29b-6638-4383-9220-1c5d1dc8918e',NULL,'idp-create-user-if-unique','master','5f40c8d2-c1da-4c52-a4d3-fdb03950c4bc',2,20,'\0',NULL,'476ead3b-c6fe-40bf-8b78-7fa29927fc5b');
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AUTHENTICATION_FLOW`
--

LOCK TABLES `AUTHENTICATION_FLOW` WRITE;
/*!40000 ALTER TABLE `AUTHENTICATION_FLOW` DISABLE KEYS */;
INSERT INTO `AUTHENTICATION_FLOW` VALUES ('0a8e4c07-bd9a-4f6f-b2a7-15df78a1ddd0','forms','Username, password, otp and other auth forms.','itesoft','basic-flow','\0',''),('0d2de298-6be1-479f-9569-a9841f90e064','reset credentials','Reset credentials for a user if they forgot their password or something','master','basic-flow','',''),('1b7ea6aa-0cf1-4234-8572-f3f6c8851f75','clients','Base authentication for clients','itesoft','client-flow','',''),('2751638e-1455-47a7-a539-f9d7ac306e57','Verify Existing Account by Re-authentication','Reauthentication of existing account','master','basic-flow','\0',''),('3278bc14-dfe4-4be0-a1c0-41fca9d9d306','clients','Base authentication for clients','master','client-flow','',''),('4309430a-dea4-4d5c-98cf-da3b62c5f505','forms','Username, password, otp and other auth forms.','master','basic-flow','\0',''),('4a4db2bb-f077-47ff-a7cb-f9bea09e559b','first broker login','Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account','itesoft','basic-flow','',''),('5f40c8d2-c1da-4c52-a4d3-fdb03950c4bc','first broker login','Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account','master','basic-flow','',''),('6c84676b-ec77-474e-a2d8-88b066cb2f99','registration form','registration form','itesoft','form-flow','\0',''),('792fd5b0-1f19-41ae-b531-b1b083cbd2ac','Handle Existing Account','Handle what to do if there is existing account with same email/username like authenticated identity provider','itesoft','basic-flow','\0',''),('8715d2f0-c918-4609-be5b-915411423d7e','Verify Existing Account by Re-authentication','Reauthentication of existing account','itesoft','basic-flow','\0',''),('8807dfdf-e118-43f0-97a3-c7bda65c2db4','direct grant','OpenID Connect Resource Owner Grant','itesoft','basic-flow','',''),('92357ae4-d49d-4af5-827f-ad2cb82a0e9f','direct grant','OpenID Connect Resource Owner Grant','master','basic-flow','',''),('93b930ae-a898-4e38-8624-ff8c75f5cb42','browser','browser based authentication','itesoft','basic-flow','',''),('ba2acb03-264c-4f2e-9016-1001fad0f805','browser','browser based authentication','master','basic-flow','',''),('bc257658-d4af-4ad6-8e30-a3a9459e2db3','registration','registration flow','master','basic-flow','',''),('c9dcc34f-fc04-498c-abce-36087d02fd1a','reset credentials','Reset credentials for a user if they forgot their password or something','itesoft','basic-flow','',''),('ea959c98-61eb-4764-9518-83d1208f0b8d','Handle Existing Account','Handle what to do if there is existing account with same email/username like authenticated identity provider','master','basic-flow','\0',''),('ec2f79e5-d462-4e11-a953-c2c95e20f2cb','registration','registration flow','itesoft','basic-flow','',''),('eed6e2aa-84a6-463d-b352-9df50e0da962','registration form','registration form','master','form-flow','\0','');
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AUTHENTICATOR_CONFIG`
--

LOCK TABLES `AUTHENTICATOR_CONFIG` WRITE;
/*!40000 ALTER TABLE `AUTHENTICATOR_CONFIG` DISABLE KEYS */;
INSERT INTO `AUTHENTICATOR_CONFIG` VALUES ('476ead3b-c6fe-40bf-8b78-7fa29927fc5b','create unique user config','master'),('833b8e6d-958c-40ad-87e6-22a415beed43','review profile config','master'),('ad44a79c-c478-47c9-a11a-7a998284c6eb','create unique user config','itesoft'),('c71c3fc1-b288-4d61-8ab5-95a62f48b298','review profile config','itesoft');
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AUTHENTICATOR_CONFIG_ENTRY`
--

LOCK TABLES `AUTHENTICATOR_CONFIG_ENTRY` WRITE;
/*!40000 ALTER TABLE `AUTHENTICATOR_CONFIG_ENTRY` DISABLE KEYS */;
INSERT INTO `AUTHENTICATOR_CONFIG_ENTRY` VALUES ('476ead3b-c6fe-40bf-8b78-7fa29927fc5b','false','require.password.update.after.registration'),('833b8e6d-958c-40ad-87e6-22a415beed43','missing','update.profile.on.first.login'),('ad44a79c-c478-47c9-a11a-7a998284c6eb','false','require.password.update.after.registration'),('c71c3fc1-b288-4d61-8ab5-95a62f48b298','missing','update.profile.on.first.login');
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT`
--

LOCK TABLES `CLIENT` WRITE;
/*!40000 ALTER TABLE `CLIENT` DISABLE KEYS */;
INSERT INTO `CLIENT` VALUES ('09d3d1f3-f87c-4957-8fbd-fc264bcb2463','','\0','admin-cli',0,'','f8b120e8-504b-486f-b431-c4b49e5914ee',NULL,'\0',NULL,'\0','master',NULL,0,'\0','\0','${client_admin-cli}','\0','client-secret',NULL,NULL,NULL,'\0','\0',''),('16a57720-ac20-4614-aa05-8eca4324be7b','','\0','security-admin-console',0,'','2d83faf6-47f1-4236-96e5-6a1063c4422b','/auth/admin/itesoft/console/index.html','\0',NULL,'\0','itesoft',NULL,0,'\0','\0','${client_security-admin-console}','\0','client-secret',NULL,NULL,NULL,'','\0','\0'),('2bbb5fa6-f721-4792-a927-743769cd5a35','','\0','broker',0,'\0','684f6c74-5106-40c2-b259-76b7519fc9f9',NULL,'\0',NULL,'\0','itesoft',NULL,0,'\0','\0','${client_broker}','\0','client-secret',NULL,NULL,NULL,'','\0','\0'),('39228268-e409-487e-af5b-6309b2dd9791','','\0','admin-cli',0,'','430e6f64-15b4-4be7-b281-9daf4536dff1',NULL,'\0',NULL,'\0','itesoft',NULL,0,'\0','\0','${client_admin-cli}','\0','client-secret',NULL,NULL,NULL,'\0','\0',''),('637d8e9c-f0f6-4e38-a1f1-e46b76480758','','\0','realm-management',0,'\0','92524691-1828-420f-b08d-30c965d17a63',NULL,'',NULL,'\0','itesoft',NULL,0,'\0','\0','${client_realm-management}','\0','client-secret',NULL,NULL,NULL,'','\0','\0'),('a02a824d-ebc5-4a49-a59a-e477c52c2393','','','itesoft-realm',0,'\0','f834ff5e-394e-4312-b3eb-eeba99456679',NULL,'',NULL,'\0','master',NULL,0,'\0','\0','itesoft Realm','\0','client-secret',NULL,NULL,NULL,'','\0','\0'),('a3b50ef7-6117-4784-9c61-adb467c2e851','','\0','account',0,'\0','f9883868-ace1-4447-b54a-e44e89b88540','/auth/realms/itesoft/account','\0',NULL,'\0','itesoft',NULL,0,'\0','\0','${client_account}','\0','client-secret',NULL,NULL,NULL,'','\0','\0'),('a578ca15-e5d2-4413-96d9-d953d7e9640d','','\0','broker',0,'\0','31ff7520-fb2b-402c-863c-39c0ac968fa8',NULL,'\0',NULL,'\0','master',NULL,0,'\0','\0','${client_broker}','\0','client-secret',NULL,NULL,NULL,'','\0','\0'),('bca50426-1b9c-4317-a7d4-7bf3aab26e17','','','demo-client',0,'\0','3ff3a0cd-f7bd-41d2-9cd2-1332bfdf8b61','/auth/realms/itesoft/client-demo','\0',NULL,'\0','itesoft','openid-connect',-1,'\0','\0',NULL,'\0','client-secret','',NULL,NULL,'','\0','\0'),('c36f99d0-138c-423b-95f5-02cd1987dc7d','','','master-realm',0,'\0','727cb561-4ef7-47ed-9160-90c03ef9d1de',NULL,'',NULL,'\0','master',NULL,0,'\0','\0','master Realm','\0','client-secret',NULL,NULL,NULL,'','\0','\0'),('f202d16f-1258-40e1-9cca-d68108a7acfb','','\0','security-admin-console',0,'','fdf1160a-774a-4fc7-bd63-be1aec0d43d5','/auth/admin/master/console/index.html','\0',NULL,'\0','master',NULL,0,'\0','\0','${client_security-admin-console}','\0','client-secret',NULL,NULL,NULL,'','\0','\0'),('fe007228-1a74-4346-8a9f-2979434fe5f4','','\0','account',0,'\0','7158c258-6213-4a0f-a45a-b7c091f12281','/auth/realms/master/account','\0',NULL,'\0','master',NULL,0,'\0','\0','${client_account}','\0','client-secret',NULL,NULL,NULL,'','\0','\0');
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_ATTRIBUTES`
--

LOCK TABLES `CLIENT_ATTRIBUTES` WRITE;
/*!40000 ALTER TABLE `CLIENT_ATTRIBUTES` DISABLE KEYS */;
INSERT INTO `CLIENT_ATTRIBUTES` VALUES ('bca50426-1b9c-4317-a7d4-7bf3aab26e17','false','saml.assertion.signature'),('bca50426-1b9c-4317-a7d4-7bf3aab26e17','true','saml.authnstatement'),('bca50426-1b9c-4317-a7d4-7bf3aab26e17','false','saml.client.signature'),('bca50426-1b9c-4317-a7d4-7bf3aab26e17','false','saml.encrypt'),('bca50426-1b9c-4317-a7d4-7bf3aab26e17','false','saml.force.post.binding'),('bca50426-1b9c-4317-a7d4-7bf3aab26e17','false','saml.multivalued.roles'),('bca50426-1b9c-4317-a7d4-7bf3aab26e17','false','saml.server.signature'),('bca50426-1b9c-4317-a7d4-7bf3aab26e17','RSA_SHA256','saml.signature.algorithm'),('bca50426-1b9c-4317-a7d4-7bf3aab26e17','false','saml_force_name_id_format'),('bca50426-1b9c-4317-a7d4-7bf3aab26e17','username','saml_name_id_format'),('bca50426-1b9c-4317-a7d4-7bf3aab26e17','http://www.w3.org/2001/10/xml-exc-c14n#','saml_signature_canonicalization_method');
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_DEFAULT_ROLES`
--

LOCK TABLES `CLIENT_DEFAULT_ROLES` WRITE;
/*!40000 ALTER TABLE `CLIENT_DEFAULT_ROLES` DISABLE KEYS */;
INSERT INTO `CLIENT_DEFAULT_ROLES` VALUES ('a3b50ef7-6117-4784-9c61-adb467c2e851','82b9be06-d701-4acb-bbc8-d079284de5c4'),('a3b50ef7-6117-4784-9c61-adb467c2e851','f3932562-e4cc-49b7-a433-0d3a7656d8e7'),('fe007228-1a74-4346-8a9f-2979434fe5f4','158bad65-2f3f-457e-8fff-5979eb979128'),('fe007228-1a74-4346-8a9f-2979434fe5f4','ff63221b-be40-4281-a6a3-d1b2ef9251dc');
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `COMPOSITE_ROLE`
--

LOCK TABLES `COMPOSITE_ROLE` WRITE;
/*!40000 ALTER TABLE `COMPOSITE_ROLE` DISABLE KEYS */;
INSERT INTO `COMPOSITE_ROLE` VALUES ('d377b7de-e976-4474-ba2e-b6fccb87957e','47c7c6a3-f900-455f-8a0a-a2262c1b5af4'),('d377b7de-e976-4474-ba2e-b6fccb87957e','10016f49-e960-4628-83c8-16189e29993e'),('d377b7de-e976-4474-ba2e-b6fccb87957e','e099ede8-45a8-4230-abea-951eee539c00'),('d377b7de-e976-4474-ba2e-b6fccb87957e','61f165fa-1e32-4fa9-920b-6b0c45cdf817'),('d377b7de-e976-4474-ba2e-b6fccb87957e','c690e2b0-c85a-4e5b-9c82-741547e42f5d'),('d377b7de-e976-4474-ba2e-b6fccb87957e','871838c1-4c5d-4bdc-a80a-f7415258c7d3'),('d377b7de-e976-4474-ba2e-b6fccb87957e','68ea541f-d63f-4350-b144-e36b3d55ebca'),('d377b7de-e976-4474-ba2e-b6fccb87957e','652ffa0c-2b93-4496-9e92-a76d48b42f81'),('d377b7de-e976-4474-ba2e-b6fccb87957e','7a2588bd-2278-4164-9ca4-7f4adb553bf0'),('d377b7de-e976-4474-ba2e-b6fccb87957e','94c49602-1e26-41da-8162-a30ab343959a'),('d377b7de-e976-4474-ba2e-b6fccb87957e','999a41a8-8950-4a6a-b8e8-d352ba95b4a6'),('d377b7de-e976-4474-ba2e-b6fccb87957e','f92be25f-7d6d-4439-b033-134b73a164ca'),('d377b7de-e976-4474-ba2e-b6fccb87957e','8c07d336-4de8-462e-ab0e-6fa51d3966fa'),('d377b7de-e976-4474-ba2e-b6fccb87957e','1bfa2931-037f-4cb7-a32d-390450e156e6'),('d377b7de-e976-4474-ba2e-b6fccb87957e','92cb1c8d-597b-4683-b342-6da652e5db14'),('d377b7de-e976-4474-ba2e-b6fccb87957e','3e44a15b-6d70-4cc4-b987-6b2b862adb3b'),('d377b7de-e976-4474-ba2e-b6fccb87957e','cccee5f3-c36f-4821-a7da-89c079fba386'),('d377b7de-e976-4474-ba2e-b6fccb87957e','a2a1b884-b5c4-44ae-ab15-bc7a9aa8009c'),('d377b7de-e976-4474-ba2e-b6fccb87957e','6361b9bf-a324-4151-a0fc-6d1f1d3185aa'),('d377b7de-e976-4474-ba2e-b6fccb87957e','8184e6f4-916b-4ea1-a447-8beb29f068db'),('d377b7de-e976-4474-ba2e-b6fccb87957e','59488e01-b00d-4e60-aada-286c66fa48de'),('d377b7de-e976-4474-ba2e-b6fccb87957e','7ff059cc-758e-45d8-b082-a8552d368cab'),('d377b7de-e976-4474-ba2e-b6fccb87957e','f8dca4fa-402b-4e79-9cc6-0f6bc5d9e675'),('d377b7de-e976-4474-ba2e-b6fccb87957e','88c4df54-96cd-4d18-a8bf-f03767e04b8d'),('d377b7de-e976-4474-ba2e-b6fccb87957e','72912105-e743-42be-b0c0-db3dddcdcd18'),('4146c1bb-d450-4d51-8569-84746a7624c0','bc03628d-09ad-4f20-ab43-b106aa8d3c3c'),('4146c1bb-d450-4d51-8569-84746a7624c0','2e1ec2c4-e731-4fdf-b143-a3562abfda01'),('4146c1bb-d450-4d51-8569-84746a7624c0','fe57511f-cd0a-4f2c-98b1-68e277ff6419'),('4146c1bb-d450-4d51-8569-84746a7624c0','f4779551-a757-4939-ba22-8a1fe09b3c43'),('4146c1bb-d450-4d51-8569-84746a7624c0','eb589803-5f83-4d3f-a982-8cb5e855ee6b'),('4146c1bb-d450-4d51-8569-84746a7624c0','29837c2e-c712-4b9f-89dd-e2f3f5c5c6ea'),('4146c1bb-d450-4d51-8569-84746a7624c0','c635265f-a232-4b40-b642-2435215ee42c'),('4146c1bb-d450-4d51-8569-84746a7624c0','604d194c-5943-4591-98fc-48855ef82bc5'),('4146c1bb-d450-4d51-8569-84746a7624c0','312c5a36-5457-4b2e-b7e0-b82e5159a489'),('4146c1bb-d450-4d51-8569-84746a7624c0','acb1fdd1-9175-4882-8e99-b20714f5cf10'),('4146c1bb-d450-4d51-8569-84746a7624c0','498a6f55-7f7d-40b7-ab7e-db029835571f'),('4146c1bb-d450-4d51-8569-84746a7624c0','dc4f95b0-d7cb-447b-9f84-133c039901ec');
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CREDENTIAL`
--

LOCK TABLES `CREDENTIAL` WRITE;
/*!40000 ALTER TABLE `CREDENTIAL` DISABLE KEYS */;
INSERT INTO `CREDENTIAL` VALUES ('c42f2d41-c916-4831-b8ff-67d8c6231d2e',NULL,1,'\DEI\FD\F7\81=:2E`c\8E;U\FF\F3','password','IeReEpoCzHjkLagr3Gc7AiZRUqGIuukiQLToQbRfy8n2hDWWCQ1D8aI7+SO2qGrCThOicAJpxJ5IPXbIchcruw==','e504efc2-0c46-4ac5-a3cf-94b36be6b1ed',1449578201000,0,0,0,NULL),('cc96f263-047d-41c3-82c4-dae02c340883',NULL,1,'萖J\B1\8C\B7\80m\E0+=9`\E7\84','password','n5EgfquvBVi6V3aoWrBuWNeq6iJ2CpeA1pmzk3JKUiSatTQFje0+w+d5Ze/bPbIJIgraWN1V0vQ1fcfILi1viw==','981bb108-91ff-4590-9e96-72e3e2a68c11',1449578013000,0,0,0,NULL);
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DATABASECHANGELOG`
--

LOCK TABLES `DATABASECHANGELOG` WRITE;
/*!40000 ALTER TABLE `DATABASECHANGELOG` DISABLE KEYS */;
INSERT INTO `DATABASECHANGELOG` VALUES ('1.0.0.Final','sthorger@redhat.com','META-INF/jpa-changelog-1.0.0.Final.xml','2015-12-08 12:32:34',1,'EXECUTED','7:00a57f7a6fb456639b34e62972e0ec02','createTable (x29), addPrimaryKey (x21), addUniqueConstraint (x9), addForeignKeyConstraint (x32)','',NULL,'3.4.1',NULL,NULL),('1.1.0.Beta1','sthorger@redhat.com','META-INF/jpa-changelog-1.1.0.Beta1.xml','2015-12-08 12:32:35',2,'EXECUTED','7:0310eb8ba07cec616460794d42ade0fa','delete (x3), createTable (x3), addColumn (x5), addPrimaryKey (x3), addForeignKeyConstraint (x3), customChange','',NULL,'3.4.1',NULL,NULL),('1.1.0.Final','sthorger@redhat.com','META-INF/jpa-changelog-1.1.0.Final.xml','2015-12-08 12:32:35',3,'EXECUTED','7:5d25857e708c3233ef4439df1f93f012','renameColumn','',NULL,'3.4.1',NULL,NULL),('1.2.0.Beta1','psilva@redhat.com','META-INF/jpa-changelog-1.2.0.Beta1.xml','2015-12-08 12:32:37',4,'EXECUTED','7:c7a54a1041d58eb3817a4a883b4d4e84','delete (x4), createTable (x8), addColumn (x2), addPrimaryKey (x6), addForeignKeyConstraint (x9), addUniqueConstraint (x2), addColumn, dropForeignKeyConstraint (x2), dropUniqueConstraint, renameColumn (x3), addUniqueConstraint, addForeignKeyConstra...','',NULL,'3.4.1',NULL,NULL),('1.2.0.RC1','bburke@redhat.com','META-INF/jpa-changelog-1.2.0.CR1.xml','2015-12-08 12:32:39',5,'EXECUTED','7:0f08df48468428e0f30ee59a8ec01a41','delete (x5), createTable (x3), addColumn, createTable (x4), addPrimaryKey (x7), addForeignKeyConstraint (x6), renameColumn, addColumn (x2), update, dropColumn, dropForeignKeyConstraint, renameColumn, addForeignKeyConstraint, dropForeignKeyConstrai...','',NULL,'3.4.1',NULL,NULL),('1.2.0.Final','keycloak','META-INF/jpa-changelog-1.2.0.Final.xml','2015-12-08 12:32:39',6,'EXECUTED','7:a3377a2059aefbf3b90ebb4c4cc8e2ab','update (x3)','',NULL,'3.4.1',NULL,NULL),('1.3.0','bburke@redhat.com','META-INF/jpa-changelog-1.3.0.xml','2015-12-08 12:32:41',7,'EXECUTED','7:04c1dbedc2aa3e9756d1a1668e003451','delete (x6), createTable (x7), addColumn, createTable, addColumn (x2), update, dropDefaultValue, dropColumn, addColumn, update (x4), addPrimaryKey (x4), dropPrimaryKey, dropColumn, addPrimaryKey (x4), addForeignKeyConstraint (x8), dropDefaultValue...','',NULL,'3.4.1',NULL,NULL),('1.4.0','bburke@redhat.com','META-INF/jpa-changelog-1.4.0.xml','2015-12-08 12:32:42',8,'EXECUTED','7:36ef39ed560ad07062d956db861042ba','delete (x7), addColumn (x5), dropColumn, renameTable (x2), update (x10), createTable (x3), customChange, dropPrimaryKey, addPrimaryKey (x4), addForeignKeyConstraint (x2), dropColumn, addColumn','',NULL,'3.4.1',NULL,NULL),('1.5.0','bburke@redhat.com','META-INF/jpa-changelog-1.5.0.xml','2015-12-08 12:32:42',9,'EXECUTED','7:cf12b04b79bea5152f165eb41f3955f6','delete (x7), dropDefaultValue, dropColumn, addColumn (x3)','',NULL,'3.4.1',NULL,NULL),('1.6.1_from15','mposolda@redhat.com','META-INF/jpa-changelog-1.6.1.xml','2015-12-08 12:32:44',10,'EXECUTED','7:7e32c8f05c755e8675764e7d5f514509','addColumn (x3), createTable (x2), addPrimaryKey (x2)','',NULL,'3.4.1',NULL,NULL),('1.6.1_from16','mposolda@redhat.com','META-INF/jpa-changelog-1.6.1.xml','2015-12-08 12:32:44',11,'MARK_RAN','7:2fa220758991285312eb84f3b4ff5336','dropPrimaryKey (x2), addColumn, update, dropColumn, addColumn, update, dropColumn, addPrimaryKey (x2)','',NULL,'3.4.1',NULL,NULL),('1.6.1','mposolda@redhat.com','META-INF/jpa-changelog-1.6.1.xml','2015-12-08 12:32:44',12,'EXECUTED','7:d41d8cd98f00b204e9800998ecf8427e','Empty','',NULL,'3.4.1',NULL,NULL),('1.7.0','bburke@redhat.com','META-INF/jpa-changelog-1.7.0.xml','2015-12-08 12:32:45',13,'EXECUTED','7:91ace540896df890cc00a0490ee52bbc','createTable (x5), addColumn (x2), dropDefaultValue, dropColumn, addPrimaryKey, addForeignKeyConstraint, addPrimaryKey, addForeignKeyConstraint, addPrimaryKey, addForeignKeyConstraint, addPrimaryKey, addForeignKeyConstraint (x2), addUniqueConstrain...','',NULL,'3.4.1',NULL,NULL);
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `KEYCLOAK_ROLE`
--

LOCK TABLES `KEYCLOAK_ROLE` WRITE;
/*!40000 ALTER TABLE `KEYCLOAK_ROLE` DISABLE KEYS */;
INSERT INTO `KEYCLOAK_ROLE` VALUES ('10016f49-e960-4628-83c8-16189e29993e','c36f99d0-138c-423b-95f5-02cd1987dc7d','','${role_create-client}','create-client','master','c36f99d0-138c-423b-95f5-02cd1987dc7d',NULL,'\0'),('158bad65-2f3f-457e-8fff-5979eb979128','fe007228-1a74-4346-8a9f-2979434fe5f4','','${role_view-profile}','view-profile','master','fe007228-1a74-4346-8a9f-2979434fe5f4',NULL,'\0'),('1bfa2931-037f-4cb7-a32d-390450e156e6','a02a824d-ebc5-4a49-a59a-e477c52c2393','','${role_create-client}','create-client','master','a02a824d-ebc5-4a49-a59a-e477c52c2393',NULL,'\0'),('2642a07e-f32a-4804-a4fb-98e0e245a7cf','2bbb5fa6-f721-4792-a927-743769cd5a35','','${role_read-token}','read-token','itesoft','2bbb5fa6-f721-4792-a927-743769cd5a35',NULL,'\0'),('29837c2e-c712-4b9f-89dd-e2f3f5c5c6ea','637d8e9c-f0f6-4e38-a1f1-e46b76480758','','${role_view-identity-providers}','view-identity-providers','itesoft','637d8e9c-f0f6-4e38-a1f1-e46b76480758',NULL,'\0'),('2e1ec2c4-e731-4fdf-b143-a3562abfda01','637d8e9c-f0f6-4e38-a1f1-e46b76480758','','${role_view-realm}','view-realm','itesoft','637d8e9c-f0f6-4e38-a1f1-e46b76480758',NULL,'\0'),('312c5a36-5457-4b2e-b7e0-b82e5159a489','637d8e9c-f0f6-4e38-a1f1-e46b76480758','','${role_manage-clients}','manage-clients','itesoft','637d8e9c-f0f6-4e38-a1f1-e46b76480758',NULL,'\0'),('3442a672-bfdb-464f-83cf-82fe8c7f1186','itesoft','\0','${role_offline-access}','offline_access','itesoft',NULL,'itesoft',''),('3e44a15b-6d70-4cc4-b987-6b2b862adb3b','a02a824d-ebc5-4a49-a59a-e477c52c2393','','${role_view-users}','view-users','master','a02a824d-ebc5-4a49-a59a-e477c52c2393',NULL,'\0'),('4146c1bb-d450-4d51-8569-84746a7624c0','637d8e9c-f0f6-4e38-a1f1-e46b76480758','','${role_realm-admin}','realm-admin','itesoft','637d8e9c-f0f6-4e38-a1f1-e46b76480758',NULL,'\0'),('4566456f-767f-4f47-93e6-b23922dc2922','master','\0','${role_offline-access}','offline_access','master',NULL,'master',''),('47c7c6a3-f900-455f-8a0a-a2262c1b5af4','master','\0','${role_create-realm}','create-realm','master',NULL,'master','\0'),('498a6f55-7f7d-40b7-ab7e-db029835571f','637d8e9c-f0f6-4e38-a1f1-e46b76480758','','${role_manage-identity-providers}','manage-identity-providers','itesoft','637d8e9c-f0f6-4e38-a1f1-e46b76480758',NULL,'\0'),('59488e01-b00d-4e60-aada-286c66fa48de','a02a824d-ebc5-4a49-a59a-e477c52c2393','','${role_manage-users}','manage-users','master','a02a824d-ebc5-4a49-a59a-e477c52c2393',NULL,'\0'),('604d194c-5943-4591-98fc-48855ef82bc5','637d8e9c-f0f6-4e38-a1f1-e46b76480758','','${role_manage-users}','manage-users','itesoft','637d8e9c-f0f6-4e38-a1f1-e46b76480758',NULL,'\0'),('61f165fa-1e32-4fa9-920b-6b0c45cdf817','c36f99d0-138c-423b-95f5-02cd1987dc7d','','${role_view-users}','view-users','master','c36f99d0-138c-423b-95f5-02cd1987dc7d',NULL,'\0'),('6361b9bf-a324-4151-a0fc-6d1f1d3185aa','a02a824d-ebc5-4a49-a59a-e477c52c2393','','${role_view-identity-providers}','view-identity-providers','master','a02a824d-ebc5-4a49-a59a-e477c52c2393',NULL,'\0'),('652ffa0c-2b93-4496-9e92-a76d48b42f81','c36f99d0-138c-423b-95f5-02cd1987dc7d','','${role_manage-realm}','manage-realm','master','c36f99d0-138c-423b-95f5-02cd1987dc7d',NULL,'\0'),('68ea541f-d63f-4350-b144-e36b3d55ebca','c36f99d0-138c-423b-95f5-02cd1987dc7d','','${role_view-identity-providers}','view-identity-providers','master','c36f99d0-138c-423b-95f5-02cd1987dc7d',NULL,'\0'),('72912105-e743-42be-b0c0-db3dddcdcd18','a02a824d-ebc5-4a49-a59a-e477c52c2393','','${role_impersonation}','impersonation','master','a02a824d-ebc5-4a49-a59a-e477c52c2393',NULL,'\0'),('7a2588bd-2278-4164-9ca4-7f4adb553bf0','c36f99d0-138c-423b-95f5-02cd1987dc7d','','${role_manage-users}','manage-users','master','c36f99d0-138c-423b-95f5-02cd1987dc7d',NULL,'\0'),('7ff059cc-758e-45d8-b082-a8552d368cab','a02a824d-ebc5-4a49-a59a-e477c52c2393','','${role_manage-clients}','manage-clients','master','a02a824d-ebc5-4a49-a59a-e477c52c2393',NULL,'\0'),('8184e6f4-916b-4ea1-a447-8beb29f068db','a02a824d-ebc5-4a49-a59a-e477c52c2393','','${role_manage-realm}','manage-realm','master','a02a824d-ebc5-4a49-a59a-e477c52c2393',NULL,'\0'),('82b9be06-d701-4acb-bbc8-d079284de5c4','a3b50ef7-6117-4784-9c61-adb467c2e851','','${role_view-profile}','view-profile','itesoft','a3b50ef7-6117-4784-9c61-adb467c2e851',NULL,'\0'),('871838c1-4c5d-4bdc-a80a-f7415258c7d3','c36f99d0-138c-423b-95f5-02cd1987dc7d','','${role_view-events}','view-events','master','c36f99d0-138c-423b-95f5-02cd1987dc7d',NULL,'\0'),('88c4df54-96cd-4d18-a8bf-f03767e04b8d','a02a824d-ebc5-4a49-a59a-e477c52c2393','','${role_manage-identity-providers}','manage-identity-providers','master','a02a824d-ebc5-4a49-a59a-e477c52c2393',NULL,'\0'),('8c07d336-4de8-462e-ab0e-6fa51d3966fa','c36f99d0-138c-423b-95f5-02cd1987dc7d','','${role_impersonation}','impersonation','master','c36f99d0-138c-423b-95f5-02cd1987dc7d',NULL,'\0'),('92cb1c8d-597b-4683-b342-6da652e5db14','a02a824d-ebc5-4a49-a59a-e477c52c2393','','${role_view-realm}','view-realm','master','a02a824d-ebc5-4a49-a59a-e477c52c2393',NULL,'\0'),('94c49602-1e26-41da-8162-a30ab343959a','c36f99d0-138c-423b-95f5-02cd1987dc7d','','${role_manage-clients}','manage-clients','master','c36f99d0-138c-423b-95f5-02cd1987dc7d',NULL,'\0'),('999a41a8-8950-4a6a-b8e8-d352ba95b4a6','c36f99d0-138c-423b-95f5-02cd1987dc7d','','${role_manage-events}','manage-events','master','c36f99d0-138c-423b-95f5-02cd1987dc7d',NULL,'\0'),('a2a1b884-b5c4-44ae-ab15-bc7a9aa8009c','a02a824d-ebc5-4a49-a59a-e477c52c2393','','${role_view-events}','view-events','master','a02a824d-ebc5-4a49-a59a-e477c52c2393',NULL,'\0'),('acb1fdd1-9175-4882-8e99-b20714f5cf10','637d8e9c-f0f6-4e38-a1f1-e46b76480758','','${role_manage-events}','manage-events','itesoft','637d8e9c-f0f6-4e38-a1f1-e46b76480758',NULL,'\0'),('bc03628d-09ad-4f20-ab43-b106aa8d3c3c','637d8e9c-f0f6-4e38-a1f1-e46b76480758','','${role_create-client}','create-client','itesoft','637d8e9c-f0f6-4e38-a1f1-e46b76480758',NULL,'\0'),('c635265f-a232-4b40-b642-2435215ee42c','637d8e9c-f0f6-4e38-a1f1-e46b76480758','','${role_manage-realm}','manage-realm','itesoft','637d8e9c-f0f6-4e38-a1f1-e46b76480758',NULL,'\0'),('c690e2b0-c85a-4e5b-9c82-741547e42f5d','c36f99d0-138c-423b-95f5-02cd1987dc7d','','${role_view-clients}','view-clients','master','c36f99d0-138c-423b-95f5-02cd1987dc7d',NULL,'\0'),('cccee5f3-c36f-4821-a7da-89c079fba386','a02a824d-ebc5-4a49-a59a-e477c52c2393','','${role_view-clients}','view-clients','master','a02a824d-ebc5-4a49-a59a-e477c52c2393',NULL,'\0'),('d377b7de-e976-4474-ba2e-b6fccb87957e','master','\0','${role_admin}','admin','master',NULL,'master','\0'),('dc4f95b0-d7cb-447b-9f84-133c039901ec','637d8e9c-f0f6-4e38-a1f1-e46b76480758','','${role_impersonation}','impersonation','itesoft','637d8e9c-f0f6-4e38-a1f1-e46b76480758',NULL,'\0'),('e099ede8-45a8-4230-abea-951eee539c00','c36f99d0-138c-423b-95f5-02cd1987dc7d','','${role_view-realm}','view-realm','master','c36f99d0-138c-423b-95f5-02cd1987dc7d',NULL,'\0'),('eb589803-5f83-4d3f-a982-8cb5e855ee6b','637d8e9c-f0f6-4e38-a1f1-e46b76480758','','${role_view-events}','view-events','itesoft','637d8e9c-f0f6-4e38-a1f1-e46b76480758',NULL,'\0'),('f3932562-e4cc-49b7-a433-0d3a7656d8e7','a3b50ef7-6117-4784-9c61-adb467c2e851','','${role_manage-account}','manage-account','itesoft','a3b50ef7-6117-4784-9c61-adb467c2e851',NULL,'\0'),('f4779551-a757-4939-ba22-8a1fe09b3c43','637d8e9c-f0f6-4e38-a1f1-e46b76480758','','${role_view-clients}','view-clients','itesoft','637d8e9c-f0f6-4e38-a1f1-e46b76480758',NULL,'\0'),('f8dca4fa-402b-4e79-9cc6-0f6bc5d9e675','a02a824d-ebc5-4a49-a59a-e477c52c2393','','${role_manage-events}','manage-events','master','a02a824d-ebc5-4a49-a59a-e477c52c2393',NULL,'\0'),('f92be25f-7d6d-4439-b033-134b73a164ca','c36f99d0-138c-423b-95f5-02cd1987dc7d','','${role_manage-identity-providers}','manage-identity-providers','master','c36f99d0-138c-423b-95f5-02cd1987dc7d',NULL,'\0'),('fe57511f-cd0a-4f2c-98b1-68e277ff6419','637d8e9c-f0f6-4e38-a1f1-e46b76480758','','${role_view-users}','view-users','itesoft','637d8e9c-f0f6-4e38-a1f1-e46b76480758',NULL,'\0'),('ff216b46-53eb-4e01-9d31-195aa1af4d22','a578ca15-e5d2-4413-96d9-d953d7e9640d','','${role_read-token}','read-token','master','a578ca15-e5d2-4413-96d9-d953d7e9640d',NULL,'\0'),('ff63221b-be40-4281-a6a3-d1b2ef9251dc','fe007228-1a74-4346-8a9f-2979434fe5f4','','${role_manage-account}','manage-account','master','fe007228-1a74-4346-8a9f-2979434fe5f4',NULL,'\0');
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PROTOCOL_MAPPER`
--

LOCK TABLES `PROTOCOL_MAPPER` WRITE;
/*!40000 ALTER TABLE `PROTOCOL_MAPPER` DISABLE KEYS */;
INSERT INTO `PROTOCOL_MAPPER` VALUES ('0121eb3c-799c-438c-9762-afebacca3223','family name','openid-connect','oidc-usermodel-property-mapper','','${familyName}','2bbb5fa6-f721-4792-a927-743769cd5a35'),('047b0e35-de6d-4122-87fb-050dded6a2fc','given name','openid-connect','oidc-usermodel-property-mapper','','${givenName}','fe007228-1a74-4346-8a9f-2979434fe5f4'),('049f6223-459d-4880-9bc1-a8ac579300ac','username','openid-connect','oidc-usermodel-property-mapper','','${username}','637d8e9c-f0f6-4e38-a1f1-e46b76480758'),('0afda6af-5214-4549-bafd-3ed14b7ec99d','full name','openid-connect','oidc-full-name-mapper','','${fullName}','bca50426-1b9c-4317-a7d4-7bf3aab26e17'),('0bd8bb27-8285-4190-bf14-43e4dde9b2a9','email','openid-connect','oidc-usermodel-property-mapper','','${email}','16a57720-ac20-4614-aa05-8eca4324be7b'),('0d29d816-8ad3-483e-9939-a3fc48c6fa9d','username','openid-connect','oidc-usermodel-property-mapper','','${username}','bca50426-1b9c-4317-a7d4-7bf3aab26e17'),('0e36d392-6bf0-42fe-85de-22f65919f3f7','username','openid-connect','oidc-usermodel-property-mapper','','${username}','09d3d1f3-f87c-4957-8fbd-fc264bcb2463'),('112dbfce-322c-4707-b07c-ebdaaab8113c','username','openid-connect','oidc-usermodel-property-mapper','','${username}','a02a824d-ebc5-4a49-a59a-e477c52c2393'),('12a30dbf-a75a-457a-aaac-1fc49243e32d','full name','openid-connect','oidc-full-name-mapper','','${fullName}','fe007228-1a74-4346-8a9f-2979434fe5f4'),('15f85d23-d8e4-4874-b125-2241bed88d2b','email','openid-connect','oidc-usermodel-property-mapper','','${email}','39228268-e409-487e-af5b-6309b2dd9791'),('1ac845ae-aa2f-4647-bd04-25b9f15062b7','locale','openid-connect','oidc-usermodel-attribute-mapper','\0','${locale}','16a57720-ac20-4614-aa05-8eca4324be7b'),('1f2e565a-8879-49e9-a589-3442c66beb31','role list','saml','saml-role-list-mapper','\0',NULL,'2bbb5fa6-f721-4792-a927-743769cd5a35'),('1f9f53d0-cc55-46bb-93cc-f7f0420400fd','role list','saml','saml-role-list-mapper','\0',NULL,'09d3d1f3-f87c-4957-8fbd-fc264bcb2463'),('24f93393-bc07-487c-bc5f-161ab30f80af','role list','saml','saml-role-list-mapper','\0',NULL,'a578ca15-e5d2-4413-96d9-d953d7e9640d'),('25a9df71-e0a0-4e5e-bced-c6b2f143e042','username','openid-connect','oidc-usermodel-property-mapper','','${username}','a3b50ef7-6117-4784-9c61-adb467c2e851'),('28344c28-d232-4481-9d91-67cdabadeba1','username','openid-connect','oidc-usermodel-property-mapper','','${username}','f202d16f-1258-40e1-9cca-d68108a7acfb'),('29b5d805-4de3-4fa7-a9e5-e1f0e6d639e7','full name','openid-connect','oidc-full-name-mapper','','${fullName}','39228268-e409-487e-af5b-6309b2dd9791'),('2a47c5cf-bb2e-4fb2-9dc6-7416b6aa72ab','given name','openid-connect','oidc-usermodel-property-mapper','','${givenName}','bca50426-1b9c-4317-a7d4-7bf3aab26e17'),('2b6e50e0-6510-4bf0-b747-8fef6d76d7fc','email','openid-connect','oidc-usermodel-property-mapper','','${email}','a3b50ef7-6117-4784-9c61-adb467c2e851'),('2d065643-1549-45d4-9fb5-eb96f0f706df','full name','openid-connect','oidc-full-name-mapper','','${fullName}','16a57720-ac20-4614-aa05-8eca4324be7b'),('367199a6-564a-47e1-8f30-2fdf13414d06','family name','openid-connect','oidc-usermodel-property-mapper','','${familyName}','a3b50ef7-6117-4784-9c61-adb467c2e851'),('36a4fb42-7c19-4faf-8551-356adec871ae','full name','openid-connect','oidc-full-name-mapper','','${fullName}','09d3d1f3-f87c-4957-8fbd-fc264bcb2463'),('374702fc-f46e-47ad-bafd-6b6dbca5e29b','role list','saml','saml-role-list-mapper','\0',NULL,'c36f99d0-138c-423b-95f5-02cd1987dc7d'),('3c0eaaae-803e-42a7-ac9c-ade1bec001ba','given name','openid-connect','oidc-usermodel-property-mapper','','${givenName}','16a57720-ac20-4614-aa05-8eca4324be7b'),('3d5a79c0-afc3-4506-99fa-03d6d8e53de0','given name','openid-connect','oidc-usermodel-property-mapper','','${givenName}','a02a824d-ebc5-4a49-a59a-e477c52c2393'),('3ed83c72-06ef-4a01-b565-093653f68030','role list','saml','saml-role-list-mapper','\0',NULL,'fe007228-1a74-4346-8a9f-2979434fe5f4'),('409eeb77-8d06-4095-ab6f-1676008880c5','family name','openid-connect','oidc-usermodel-property-mapper','','${familyName}','fe007228-1a74-4346-8a9f-2979434fe5f4'),('44e1a99d-052a-4241-b8f2-5d72ec5744ec','role list','saml','saml-role-list-mapper','\0',NULL,'39228268-e409-487e-af5b-6309b2dd9791'),('4a11f02b-e6c1-4ac2-86ac-ccd3e38744fe','email','openid-connect','oidc-usermodel-property-mapper','','${email}','fe007228-1a74-4346-8a9f-2979434fe5f4'),('4e19517d-20ce-4e47-afe6-db6041c925b8','username','openid-connect','oidc-usermodel-property-mapper','','${username}','39228268-e409-487e-af5b-6309b2dd9791'),('503898e3-a8ca-4e98-84cf-c752042b543f','given name','openid-connect','oidc-usermodel-property-mapper','','${givenName}','a578ca15-e5d2-4413-96d9-d953d7e9640d'),('5131a075-e265-4ea0-bac8-afc4b4c5497b','full name','openid-connect','oidc-full-name-mapper','','${fullName}','637d8e9c-f0f6-4e38-a1f1-e46b76480758'),('55776e7e-f4c6-4c44-8eb2-26fa79db9556','given name','openid-connect','oidc-usermodel-property-mapper','','${givenName}','2bbb5fa6-f721-4792-a927-743769cd5a35'),('57571566-9f0c-43fc-a084-b7b6e1359d29','email','openid-connect','oidc-usermodel-property-mapper','','${email}','c36f99d0-138c-423b-95f5-02cd1987dc7d'),('5cac744a-3a3f-4f14-8a04-92c73795c216','family name','openid-connect','oidc-usermodel-property-mapper','','${familyName}','bca50426-1b9c-4317-a7d4-7bf3aab26e17'),('620b7a75-624e-4abf-a78b-1d2f9eac5121','email','openid-connect','oidc-usermodel-property-mapper','','${email}','637d8e9c-f0f6-4e38-a1f1-e46b76480758'),('7717de92-bc0a-44f0-8d42-15e71a47397c','email','openid-connect','oidc-usermodel-property-mapper','','${email}','2bbb5fa6-f721-4792-a927-743769cd5a35'),('793bf229-3cb6-436c-9da5-cb52942bc3ef','username','openid-connect','oidc-usermodel-property-mapper','','${username}','16a57720-ac20-4614-aa05-8eca4324be7b'),('7a5d027b-6bf2-4450-abb5-12139b97d071','username','openid-connect','oidc-usermodel-property-mapper','','${username}','2bbb5fa6-f721-4792-a927-743769cd5a35'),('833654e4-9c27-4685-ad1e-5afd2f54f5fe','locale','openid-connect','oidc-usermodel-attribute-mapper','\0','${locale}','f202d16f-1258-40e1-9cca-d68108a7acfb'),('89ca4c8f-f06f-4a9e-abc7-671119465571','email','openid-connect','oidc-usermodel-property-mapper','','${email}','bca50426-1b9c-4317-a7d4-7bf3aab26e17'),('8c43e073-d19e-49e6-8c74-5226dd5534bb','role list','saml','saml-role-list-mapper','\0',NULL,'16a57720-ac20-4614-aa05-8eca4324be7b'),('9202b56e-957a-4c46-b8cb-ed17a49e0395','role list','saml','saml-role-list-mapper','\0',NULL,'a3b50ef7-6117-4784-9c61-adb467c2e851'),('93393cf4-02e9-4167-8e0c-9049a9ffaf18','email','openid-connect','oidc-usermodel-property-mapper','','${email}','a578ca15-e5d2-4413-96d9-d953d7e9640d'),('96122e83-b62d-4383-9572-5faa40a12752','email','openid-connect','oidc-usermodel-property-mapper','','${email}','f202d16f-1258-40e1-9cca-d68108a7acfb'),('96dc5fbf-533c-408a-b71e-64e13e7313c7','role list','saml','saml-role-list-mapper','\0',NULL,'637d8e9c-f0f6-4e38-a1f1-e46b76480758'),('97f5f400-2788-40c3-9a6a-eb4655d2aed1','username','openid-connect','oidc-usermodel-property-mapper','','${username}','c36f99d0-138c-423b-95f5-02cd1987dc7d'),('9ac901ba-e912-4cef-a23b-e079732868d2','email','openid-connect','oidc-usermodel-property-mapper','','${email}','09d3d1f3-f87c-4957-8fbd-fc264bcb2463'),('9c11be56-5240-41db-a29d-210e2d6034d0','username','openid-connect','oidc-usermodel-property-mapper','','${username}','fe007228-1a74-4346-8a9f-2979434fe5f4'),('9fcaf46e-c5ad-42dc-85c2-d148776bd985','family name','openid-connect','oidc-usermodel-property-mapper','','${familyName}','39228268-e409-487e-af5b-6309b2dd9791'),('a33c635d-b74b-43ae-856d-76f3f9bc1de4','given name','openid-connect','oidc-usermodel-property-mapper','','${givenName}','09d3d1f3-f87c-4957-8fbd-fc264bcb2463'),('a72df056-c253-4602-a292-21da45bb9b3b','family name','openid-connect','oidc-usermodel-property-mapper','','${familyName}','a02a824d-ebc5-4a49-a59a-e477c52c2393'),('a756995a-9340-447e-87e2-2abe823fd9bc','given name','openid-connect','oidc-usermodel-property-mapper','','${givenName}','f202d16f-1258-40e1-9cca-d68108a7acfb'),('ad8d7466-9a22-4902-bdbd-a1afaf530e48','full name','openid-connect','oidc-full-name-mapper','','${fullName}','f202d16f-1258-40e1-9cca-d68108a7acfb'),('b07b250d-1a83-451a-be2c-ea62b4dd6be8','family name','openid-connect','oidc-usermodel-property-mapper','','${familyName}','637d8e9c-f0f6-4e38-a1f1-e46b76480758'),('b98da83e-84f5-4327-8456-684dd46852ee','username','openid-connect','oidc-usermodel-property-mapper','','${username}','a578ca15-e5d2-4413-96d9-d953d7e9640d'),('bcb1d37e-ec64-4fc4-8858-d45f3c3e0dfb','full name','openid-connect','oidc-full-name-mapper','','${fullName}','a3b50ef7-6117-4784-9c61-adb467c2e851'),('be6699a5-8103-4e32-b26d-68ff42b4da1d','family name','openid-connect','oidc-usermodel-property-mapper','','${familyName}','a578ca15-e5d2-4413-96d9-d953d7e9640d'),('c17af4fa-f2aa-46e8-89a1-1f8378718e7d','role list','saml','saml-role-list-mapper','\0',NULL,'f202d16f-1258-40e1-9cca-d68108a7acfb'),('c3d0b52a-abcf-4787-91dd-8389d55025ea','role list','saml','saml-role-list-mapper','\0',NULL,'bca50426-1b9c-4317-a7d4-7bf3aab26e17'),('c435d028-9fa0-4535-bab9-e7d09f8d68d1','given name','openid-connect','oidc-usermodel-property-mapper','','${givenName}','c36f99d0-138c-423b-95f5-02cd1987dc7d'),('cfecf2c8-1ec9-4c4a-8320-7cd74ad7ba31','given name','openid-connect','oidc-usermodel-property-mapper','','${givenName}','637d8e9c-f0f6-4e38-a1f1-e46b76480758'),('d02297f2-06aa-4293-8b5e-70e33e3ede8a','full name','openid-connect','oidc-full-name-mapper','','${fullName}','a578ca15-e5d2-4413-96d9-d953d7e9640d'),('d76d6cf5-b533-4bc6-941c-6699f346400a','email','openid-connect','oidc-usermodel-property-mapper','','${email}','a02a824d-ebc5-4a49-a59a-e477c52c2393'),('d9a492bd-3173-4e8d-a4cf-db3b74d1e4f2','full name','openid-connect','oidc-full-name-mapper','','${fullName}','c36f99d0-138c-423b-95f5-02cd1987dc7d'),('e16f019e-762f-4487-8859-9ffddec096ee','given name','openid-connect','oidc-usermodel-property-mapper','','${givenName}','a3b50ef7-6117-4784-9c61-adb467c2e851'),('e1f324a1-e860-49ad-85d9-26f47dd33a6e','family name','openid-connect','oidc-usermodel-property-mapper','','${familyName}','09d3d1f3-f87c-4957-8fbd-fc264bcb2463'),('e518584c-ca18-445e-a675-637e08a85ea3','full name','openid-connect','oidc-full-name-mapper','','${fullName}','2bbb5fa6-f721-4792-a927-743769cd5a35'),('e9986938-506d-4898-8085-7e7492748ef3','family name','openid-connect','oidc-usermodel-property-mapper','','${familyName}','f202d16f-1258-40e1-9cca-d68108a7acfb'),('ec5980a5-e027-4084-87b6-676e028f71b0','role list','saml','saml-role-list-mapper','\0',NULL,'a02a824d-ebc5-4a49-a59a-e477c52c2393'),('f0656efe-9f90-4750-84e4-ecb3628afe85','family name','openid-connect','oidc-usermodel-property-mapper','','${familyName}','16a57720-ac20-4614-aa05-8eca4324be7b'),('f1648608-3bf5-4a2a-b17a-fe33d7a1d9e9','family name','openid-connect','oidc-usermodel-property-mapper','','${familyName}','c36f99d0-138c-423b-95f5-02cd1987dc7d'),('fb482552-261f-46b1-a979-db1d909e0479','given name','openid-connect','oidc-usermodel-property-mapper','','${givenName}','39228268-e409-487e-af5b-6309b2dd9791'),('fefd79c5-1ccf-4283-8dc1-522b31cd1fc5','full name','openid-connect','oidc-full-name-mapper','','${fullName}','a02a824d-ebc5-4a49-a59a-e477c52c2393');
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PROTOCOL_MAPPER_CONFIG`
--

LOCK TABLES `PROTOCOL_MAPPER_CONFIG` WRITE;
/*!40000 ALTER TABLE `PROTOCOL_MAPPER_CONFIG` DISABLE KEYS */;
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('0121eb3c-799c-438c-9762-afebacca3223','true','access.token.claim'),('0121eb3c-799c-438c-9762-afebacca3223','family_name','claim.name'),('0121eb3c-799c-438c-9762-afebacca3223','true','id.token.claim'),('0121eb3c-799c-438c-9762-afebacca3223','String','jsonType.label'),('0121eb3c-799c-438c-9762-afebacca3223','lastName','user.attribute'),('047b0e35-de6d-4122-87fb-050dded6a2fc','true','access.token.claim'),('047b0e35-de6d-4122-87fb-050dded6a2fc','given_name','claim.name'),('047b0e35-de6d-4122-87fb-050dded6a2fc','true','id.token.claim'),('047b0e35-de6d-4122-87fb-050dded6a2fc','String','jsonType.label'),('047b0e35-de6d-4122-87fb-050dded6a2fc','firstName','user.attribute'),('049f6223-459d-4880-9bc1-a8ac579300ac','true','access.token.claim'),('049f6223-459d-4880-9bc1-a8ac579300ac','preferred_username','claim.name'),('049f6223-459d-4880-9bc1-a8ac579300ac','true','id.token.claim'),('049f6223-459d-4880-9bc1-a8ac579300ac','String','jsonType.label'),('049f6223-459d-4880-9bc1-a8ac579300ac','username','user.attribute'),('0afda6af-5214-4549-bafd-3ed14b7ec99d','true','access.token.claim'),('0afda6af-5214-4549-bafd-3ed14b7ec99d','true','id.token.claim'),('0bd8bb27-8285-4190-bf14-43e4dde9b2a9','true','access.token.claim'),('0bd8bb27-8285-4190-bf14-43e4dde9b2a9','email','claim.name'),('0bd8bb27-8285-4190-bf14-43e4dde9b2a9','true','id.token.claim'),('0bd8bb27-8285-4190-bf14-43e4dde9b2a9','String','jsonType.label'),('0bd8bb27-8285-4190-bf14-43e4dde9b2a9','email','user.attribute'),('0d29d816-8ad3-483e-9939-a3fc48c6fa9d','true','access.token.claim'),('0d29d816-8ad3-483e-9939-a3fc48c6fa9d','preferred_username','claim.name'),('0d29d816-8ad3-483e-9939-a3fc48c6fa9d','true','id.token.claim'),('0d29d816-8ad3-483e-9939-a3fc48c6fa9d','String','jsonType.label'),('0d29d816-8ad3-483e-9939-a3fc48c6fa9d','username','user.attribute'),('0e36d392-6bf0-42fe-85de-22f65919f3f7','true','access.token.claim'),('0e36d392-6bf0-42fe-85de-22f65919f3f7','preferred_username','claim.name'),('0e36d392-6bf0-42fe-85de-22f65919f3f7','true','id.token.claim'),('0e36d392-6bf0-42fe-85de-22f65919f3f7','String','jsonType.label'),('0e36d392-6bf0-42fe-85de-22f65919f3f7','username','user.attribute'),('112dbfce-322c-4707-b07c-ebdaaab8113c','true','access.token.claim'),('112dbfce-322c-4707-b07c-ebdaaab8113c','preferred_username','claim.name'),('112dbfce-322c-4707-b07c-ebdaaab8113c','true','id.token.claim'),('112dbfce-322c-4707-b07c-ebdaaab8113c','String','jsonType.label'),('112dbfce-322c-4707-b07c-ebdaaab8113c','username','user.attribute'),('12a30dbf-a75a-457a-aaac-1fc49243e32d','true','access.token.claim'),('12a30dbf-a75a-457a-aaac-1fc49243e32d','true','id.token.claim'),('15f85d23-d8e4-4874-b125-2241bed88d2b','true','access.token.claim'),('15f85d23-d8e4-4874-b125-2241bed88d2b','email','claim.name'),('15f85d23-d8e4-4874-b125-2241bed88d2b','true','id.token.claim'),('15f85d23-d8e4-4874-b125-2241bed88d2b','String','jsonType.label'),('15f85d23-d8e4-4874-b125-2241bed88d2b','email','user.attribute'),('1ac845ae-aa2f-4647-bd04-25b9f15062b7','true','access.token.claim'),('1ac845ae-aa2f-4647-bd04-25b9f15062b7','locale','claim.name'),('1ac845ae-aa2f-4647-bd04-25b9f15062b7','true','id.token.claim'),('1ac845ae-aa2f-4647-bd04-25b9f15062b7','String','jsonType.label'),('1ac845ae-aa2f-4647-bd04-25b9f15062b7','locale','user.attribute'),('1f2e565a-8879-49e9-a589-3442c66beb31','Role','attribute.name'),('1f2e565a-8879-49e9-a589-3442c66beb31','Basic','attribute.nameformat'),('1f2e565a-8879-49e9-a589-3442c66beb31','false','single'),('1f9f53d0-cc55-46bb-93cc-f7f0420400fd','Role','attribute.name'),('1f9f53d0-cc55-46bb-93cc-f7f0420400fd','Basic','attribute.nameformat'),('1f9f53d0-cc55-46bb-93cc-f7f0420400fd','false','single'),('24f93393-bc07-487c-bc5f-161ab30f80af','Role','attribute.name'),('24f93393-bc07-487c-bc5f-161ab30f80af','Basic','attribute.nameformat'),('24f93393-bc07-487c-bc5f-161ab30f80af','false','single'),('25a9df71-e0a0-4e5e-bced-c6b2f143e042','true','access.token.claim'),('25a9df71-e0a0-4e5e-bced-c6b2f143e042','preferred_username','claim.name'),('25a9df71-e0a0-4e5e-bced-c6b2f143e042','true','id.token.claim'),('25a9df71-e0a0-4e5e-bced-c6b2f143e042','String','jsonType.label'),('25a9df71-e0a0-4e5e-bced-c6b2f143e042','username','user.attribute'),('28344c28-d232-4481-9d91-67cdabadeba1','true','access.token.claim'),('28344c28-d232-4481-9d91-67cdabadeba1','preferred_username','claim.name'),('28344c28-d232-4481-9d91-67cdabadeba1','true','id.token.claim'),('28344c28-d232-4481-9d91-67cdabadeba1','String','jsonType.label'),('28344c28-d232-4481-9d91-67cdabadeba1','username','user.attribute'),('29b5d805-4de3-4fa7-a9e5-e1f0e6d639e7','true','access.token.claim'),('29b5d805-4de3-4fa7-a9e5-e1f0e6d639e7','true','id.token.claim'),('2a47c5cf-bb2e-4fb2-9dc6-7416b6aa72ab','true','access.token.claim'),('2a47c5cf-bb2e-4fb2-9dc6-7416b6aa72ab','given_name','claim.name'),('2a47c5cf-bb2e-4fb2-9dc6-7416b6aa72ab','true','id.token.claim'),('2a47c5cf-bb2e-4fb2-9dc6-7416b6aa72ab','String','jsonType.label'),('2a47c5cf-bb2e-4fb2-9dc6-7416b6aa72ab','firstName','user.attribute'),('2b6e50e0-6510-4bf0-b747-8fef6d76d7fc','true','access.token.claim'),('2b6e50e0-6510-4bf0-b747-8fef6d76d7fc','email','claim.name'),('2b6e50e0-6510-4bf0-b747-8fef6d76d7fc','true','id.token.claim'),('2b6e50e0-6510-4bf0-b747-8fef6d76d7fc','String','jsonType.label'),('2b6e50e0-6510-4bf0-b747-8fef6d76d7fc','email','user.attribute'),('2d065643-1549-45d4-9fb5-eb96f0f706df','true','access.token.claim'),('2d065643-1549-45d4-9fb5-eb96f0f706df','true','id.token.claim'),('367199a6-564a-47e1-8f30-2fdf13414d06','true','access.token.claim'),('367199a6-564a-47e1-8f30-2fdf13414d06','family_name','claim.name'),('367199a6-564a-47e1-8f30-2fdf13414d06','true','id.token.claim'),('367199a6-564a-47e1-8f30-2fdf13414d06','String','jsonType.label'),('367199a6-564a-47e1-8f30-2fdf13414d06','lastName','user.attribute'),('36a4fb42-7c19-4faf-8551-356adec871ae','true','access.token.claim'),('36a4fb42-7c19-4faf-8551-356adec871ae','true','id.token.claim'),('374702fc-f46e-47ad-bafd-6b6dbca5e29b','Role','attribute.name'),('374702fc-f46e-47ad-bafd-6b6dbca5e29b','Basic','attribute.nameformat'),('374702fc-f46e-47ad-bafd-6b6dbca5e29b','false','single'),('3c0eaaae-803e-42a7-ac9c-ade1bec001ba','true','access.token.claim'),('3c0eaaae-803e-42a7-ac9c-ade1bec001ba','given_name','claim.name'),('3c0eaaae-803e-42a7-ac9c-ade1bec001ba','true','id.token.claim'),('3c0eaaae-803e-42a7-ac9c-ade1bec001ba','String','jsonType.label'),('3c0eaaae-803e-42a7-ac9c-ade1bec001ba','firstName','user.attribute'),('3d5a79c0-afc3-4506-99fa-03d6d8e53de0','true','access.token.claim'),('3d5a79c0-afc3-4506-99fa-03d6d8e53de0','given_name','claim.name'),('3d5a79c0-afc3-4506-99fa-03d6d8e53de0','true','id.token.claim'),('3d5a79c0-afc3-4506-99fa-03d6d8e53de0','String','jsonType.label'),('3d5a79c0-afc3-4506-99fa-03d6d8e53de0','firstName','user.attribute'),('3ed83c72-06ef-4a01-b565-093653f68030','Role','attribute.name'),('3ed83c72-06ef-4a01-b565-093653f68030','Basic','attribute.nameformat'),('3ed83c72-06ef-4a01-b565-093653f68030','false','single'),('409eeb77-8d06-4095-ab6f-1676008880c5','true','access.token.claim'),('409eeb77-8d06-4095-ab6f-1676008880c5','family_name','claim.name'),('409eeb77-8d06-4095-ab6f-1676008880c5','true','id.token.claim'),('409eeb77-8d06-4095-ab6f-1676008880c5','String','jsonType.label'),('409eeb77-8d06-4095-ab6f-1676008880c5','lastName','user.attribute'),('44e1a99d-052a-4241-b8f2-5d72ec5744ec','Role','attribute.name'),('44e1a99d-052a-4241-b8f2-5d72ec5744ec','Basic','attribute.nameformat'),('44e1a99d-052a-4241-b8f2-5d72ec5744ec','false','single'),('4a11f02b-e6c1-4ac2-86ac-ccd3e38744fe','true','access.token.claim'),('4a11f02b-e6c1-4ac2-86ac-ccd3e38744fe','email','claim.name'),('4a11f02b-e6c1-4ac2-86ac-ccd3e38744fe','true','id.token.claim'),('4a11f02b-e6c1-4ac2-86ac-ccd3e38744fe','String','jsonType.label'),('4a11f02b-e6c1-4ac2-86ac-ccd3e38744fe','email','user.attribute'),('4e19517d-20ce-4e47-afe6-db6041c925b8','true','access.token.claim'),('4e19517d-20ce-4e47-afe6-db6041c925b8','preferred_username','claim.name'),('4e19517d-20ce-4e47-afe6-db6041c925b8','true','id.token.claim'),('4e19517d-20ce-4e47-afe6-db6041c925b8','String','jsonType.label'),('4e19517d-20ce-4e47-afe6-db6041c925b8','username','user.attribute'),('503898e3-a8ca-4e98-84cf-c752042b543f','true','access.token.claim'),('503898e3-a8ca-4e98-84cf-c752042b543f','given_name','claim.name'),('503898e3-a8ca-4e98-84cf-c752042b543f','true','id.token.claim'),('503898e3-a8ca-4e98-84cf-c752042b543f','String','jsonType.label'),('503898e3-a8ca-4e98-84cf-c752042b543f','firstName','user.attribute'),('5131a075-e265-4ea0-bac8-afc4b4c5497b','true','access.token.claim'),('5131a075-e265-4ea0-bac8-afc4b4c5497b','true','id.token.claim'),('55776e7e-f4c6-4c44-8eb2-26fa79db9556','true','access.token.claim'),('55776e7e-f4c6-4c44-8eb2-26fa79db9556','given_name','claim.name'),('55776e7e-f4c6-4c44-8eb2-26fa79db9556','true','id.token.claim'),('55776e7e-f4c6-4c44-8eb2-26fa79db9556','String','jsonType.label'),('55776e7e-f4c6-4c44-8eb2-26fa79db9556','firstName','user.attribute'),('57571566-9f0c-43fc-a084-b7b6e1359d29','true','access.token.claim'),('57571566-9f0c-43fc-a084-b7b6e1359d29','email','claim.name'),('57571566-9f0c-43fc-a084-b7b6e1359d29','true','id.token.claim'),('57571566-9f0c-43fc-a084-b7b6e1359d29','String','jsonType.label'),('57571566-9f0c-43fc-a084-b7b6e1359d29','email','user.attribute'),('5cac744a-3a3f-4f14-8a04-92c73795c216','true','access.token.claim'),('5cac744a-3a3f-4f14-8a04-92c73795c216','family_name','claim.name'),('5cac744a-3a3f-4f14-8a04-92c73795c216','true','id.token.claim'),('5cac744a-3a3f-4f14-8a04-92c73795c216','String','jsonType.label'),('5cac744a-3a3f-4f14-8a04-92c73795c216','lastName','user.attribute'),('620b7a75-624e-4abf-a78b-1d2f9eac5121','true','access.token.claim'),('620b7a75-624e-4abf-a78b-1d2f9eac5121','email','claim.name'),('620b7a75-624e-4abf-a78b-1d2f9eac5121','true','id.token.claim'),('620b7a75-624e-4abf-a78b-1d2f9eac5121','String','jsonType.label'),('620b7a75-624e-4abf-a78b-1d2f9eac5121','email','user.attribute'),('7717de92-bc0a-44f0-8d42-15e71a47397c','true','access.token.claim'),('7717de92-bc0a-44f0-8d42-15e71a47397c','email','claim.name'),('7717de92-bc0a-44f0-8d42-15e71a47397c','true','id.token.claim'),('7717de92-bc0a-44f0-8d42-15e71a47397c','String','jsonType.label'),('7717de92-bc0a-44f0-8d42-15e71a47397c','email','user.attribute'),('793bf229-3cb6-436c-9da5-cb52942bc3ef','true','access.token.claim'),('793bf229-3cb6-436c-9da5-cb52942bc3ef','preferred_username','claim.name'),('793bf229-3cb6-436c-9da5-cb52942bc3ef','true','id.token.claim'),('793bf229-3cb6-436c-9da5-cb52942bc3ef','String','jsonType.label'),('793bf229-3cb6-436c-9da5-cb52942bc3ef','username','user.attribute'),('7a5d027b-6bf2-4450-abb5-12139b97d071','true','access.token.claim'),('7a5d027b-6bf2-4450-abb5-12139b97d071','preferred_username','claim.name'),('7a5d027b-6bf2-4450-abb5-12139b97d071','true','id.token.claim'),('7a5d027b-6bf2-4450-abb5-12139b97d071','String','jsonType.label'),('7a5d027b-6bf2-4450-abb5-12139b97d071','username','user.attribute'),('833654e4-9c27-4685-ad1e-5afd2f54f5fe','true','access.token.claim'),('833654e4-9c27-4685-ad1e-5afd2f54f5fe','locale','claim.name'),('833654e4-9c27-4685-ad1e-5afd2f54f5fe','true','id.token.claim'),('833654e4-9c27-4685-ad1e-5afd2f54f5fe','String','jsonType.label'),('833654e4-9c27-4685-ad1e-5afd2f54f5fe','locale','user.attribute'),('89ca4c8f-f06f-4a9e-abc7-671119465571','true','access.token.claim'),('89ca4c8f-f06f-4a9e-abc7-671119465571','email','claim.name'),('89ca4c8f-f06f-4a9e-abc7-671119465571','true','id.token.claim'),('89ca4c8f-f06f-4a9e-abc7-671119465571','String','jsonType.label'),('89ca4c8f-f06f-4a9e-abc7-671119465571','email','user.attribute'),('8c43e073-d19e-49e6-8c74-5226dd5534bb','Role','attribute.name'),('8c43e073-d19e-49e6-8c74-5226dd5534bb','Basic','attribute.nameformat'),('8c43e073-d19e-49e6-8c74-5226dd5534bb','false','single'),('9202b56e-957a-4c46-b8cb-ed17a49e0395','Role','attribute.name'),('9202b56e-957a-4c46-b8cb-ed17a49e0395','Basic','attribute.nameformat'),('9202b56e-957a-4c46-b8cb-ed17a49e0395','false','single'),('93393cf4-02e9-4167-8e0c-9049a9ffaf18','true','access.token.claim'),('93393cf4-02e9-4167-8e0c-9049a9ffaf18','email','claim.name'),('93393cf4-02e9-4167-8e0c-9049a9ffaf18','true','id.token.claim'),('93393cf4-02e9-4167-8e0c-9049a9ffaf18','String','jsonType.label'),('93393cf4-02e9-4167-8e0c-9049a9ffaf18','email','user.attribute'),('96122e83-b62d-4383-9572-5faa40a12752','true','access.token.claim'),('96122e83-b62d-4383-9572-5faa40a12752','email','claim.name'),('96122e83-b62d-4383-9572-5faa40a12752','true','id.token.claim'),('96122e83-b62d-4383-9572-5faa40a12752','String','jsonType.label'),('96122e83-b62d-4383-9572-5faa40a12752','email','user.attribute'),('96dc5fbf-533c-408a-b71e-64e13e7313c7','Role','attribute.name'),('96dc5fbf-533c-408a-b71e-64e13e7313c7','Basic','attribute.nameformat'),('96dc5fbf-533c-408a-b71e-64e13e7313c7','false','single'),('97f5f400-2788-40c3-9a6a-eb4655d2aed1','true','access.token.claim'),('97f5f400-2788-40c3-9a6a-eb4655d2aed1','preferred_username','claim.name'),('97f5f400-2788-40c3-9a6a-eb4655d2aed1','true','id.token.claim'),('97f5f400-2788-40c3-9a6a-eb4655d2aed1','String','jsonType.label'),('97f5f400-2788-40c3-9a6a-eb4655d2aed1','username','user.attribute'),('9ac901ba-e912-4cef-a23b-e079732868d2','true','access.token.claim'),('9ac901ba-e912-4cef-a23b-e079732868d2','email','claim.name'),('9ac901ba-e912-4cef-a23b-e079732868d2','true','id.token.claim'),('9ac901ba-e912-4cef-a23b-e079732868d2','String','jsonType.label'),('9ac901ba-e912-4cef-a23b-e079732868d2','email','user.attribute'),('9c11be56-5240-41db-a29d-210e2d6034d0','true','access.token.claim'),('9c11be56-5240-41db-a29d-210e2d6034d0','preferred_username','claim.name'),('9c11be56-5240-41db-a29d-210e2d6034d0','true','id.token.claim'),('9c11be56-5240-41db-a29d-210e2d6034d0','String','jsonType.label'),('9c11be56-5240-41db-a29d-210e2d6034d0','username','user.attribute'),('9fcaf46e-c5ad-42dc-85c2-d148776bd985','true','access.token.claim'),('9fcaf46e-c5ad-42dc-85c2-d148776bd985','family_name','claim.name'),('9fcaf46e-c5ad-42dc-85c2-d148776bd985','true','id.token.claim'),('9fcaf46e-c5ad-42dc-85c2-d148776bd985','String','jsonType.label'),('9fcaf46e-c5ad-42dc-85c2-d148776bd985','lastName','user.attribute'),('a33c635d-b74b-43ae-856d-76f3f9bc1de4','true','access.token.claim'),('a33c635d-b74b-43ae-856d-76f3f9bc1de4','given_name','claim.name'),('a33c635d-b74b-43ae-856d-76f3f9bc1de4','true','id.token.claim'),('a33c635d-b74b-43ae-856d-76f3f9bc1de4','String','jsonType.label'),('a33c635d-b74b-43ae-856d-76f3f9bc1de4','firstName','user.attribute'),('a72df056-c253-4602-a292-21da45bb9b3b','true','access.token.claim'),('a72df056-c253-4602-a292-21da45bb9b3b','family_name','claim.name'),('a72df056-c253-4602-a292-21da45bb9b3b','true','id.token.claim'),('a72df056-c253-4602-a292-21da45bb9b3b','String','jsonType.label'),('a72df056-c253-4602-a292-21da45bb9b3b','lastName','user.attribute'),('a756995a-9340-447e-87e2-2abe823fd9bc','true','access.token.claim'),('a756995a-9340-447e-87e2-2abe823fd9bc','given_name','claim.name'),('a756995a-9340-447e-87e2-2abe823fd9bc','true','id.token.claim'),('a756995a-9340-447e-87e2-2abe823fd9bc','String','jsonType.label'),('a756995a-9340-447e-87e2-2abe823fd9bc','firstName','user.attribute'),('ad8d7466-9a22-4902-bdbd-a1afaf530e48','true','access.token.claim'),('ad8d7466-9a22-4902-bdbd-a1afaf530e48','true','id.token.claim'),('b07b250d-1a83-451a-be2c-ea62b4dd6be8','true','access.token.claim'),('b07b250d-1a83-451a-be2c-ea62b4dd6be8','family_name','claim.name'),('b07b250d-1a83-451a-be2c-ea62b4dd6be8','true','id.token.claim'),('b07b250d-1a83-451a-be2c-ea62b4dd6be8','String','jsonType.label'),('b07b250d-1a83-451a-be2c-ea62b4dd6be8','lastName','user.attribute'),('b98da83e-84f5-4327-8456-684dd46852ee','true','access.token.claim'),('b98da83e-84f5-4327-8456-684dd46852ee','preferred_username','claim.name'),('b98da83e-84f5-4327-8456-684dd46852ee','true','id.token.claim'),('b98da83e-84f5-4327-8456-684dd46852ee','String','jsonType.label'),('b98da83e-84f5-4327-8456-684dd46852ee','username','user.attribute'),('bcb1d37e-ec64-4fc4-8858-d45f3c3e0dfb','true','access.token.claim'),('bcb1d37e-ec64-4fc4-8858-d45f3c3e0dfb','true','id.token.claim'),('be6699a5-8103-4e32-b26d-68ff42b4da1d','true','access.token.claim'),('be6699a5-8103-4e32-b26d-68ff42b4da1d','family_name','claim.name'),('be6699a5-8103-4e32-b26d-68ff42b4da1d','true','id.token.claim'),('be6699a5-8103-4e32-b26d-68ff42b4da1d','String','jsonType.label'),('be6699a5-8103-4e32-b26d-68ff42b4da1d','lastName','user.attribute'),('c17af4fa-f2aa-46e8-89a1-1f8378718e7d','Role','attribute.name'),('c17af4fa-f2aa-46e8-89a1-1f8378718e7d','Basic','attribute.nameformat'),('c17af4fa-f2aa-46e8-89a1-1f8378718e7d','false','single'),('c3d0b52a-abcf-4787-91dd-8389d55025ea','Role','attribute.name'),('c3d0b52a-abcf-4787-91dd-8389d55025ea','Basic','attribute.nameformat'),('c3d0b52a-abcf-4787-91dd-8389d55025ea','false','single'),('c435d028-9fa0-4535-bab9-e7d09f8d68d1','true','access.token.claim'),('c435d028-9fa0-4535-bab9-e7d09f8d68d1','given_name','claim.name'),('c435d028-9fa0-4535-bab9-e7d09f8d68d1','true','id.token.claim'),('c435d028-9fa0-4535-bab9-e7d09f8d68d1','String','jsonType.label'),('c435d028-9fa0-4535-bab9-e7d09f8d68d1','firstName','user.attribute'),('cfecf2c8-1ec9-4c4a-8320-7cd74ad7ba31','true','access.token.claim'),('cfecf2c8-1ec9-4c4a-8320-7cd74ad7ba31','given_name','claim.name'),('cfecf2c8-1ec9-4c4a-8320-7cd74ad7ba31','true','id.token.claim'),('cfecf2c8-1ec9-4c4a-8320-7cd74ad7ba31','String','jsonType.label'),('cfecf2c8-1ec9-4c4a-8320-7cd74ad7ba31','firstName','user.attribute'),('d02297f2-06aa-4293-8b5e-70e33e3ede8a','true','access.token.claim'),('d02297f2-06aa-4293-8b5e-70e33e3ede8a','true','id.token.claim'),('d76d6cf5-b533-4bc6-941c-6699f346400a','true','access.token.claim'),('d76d6cf5-b533-4bc6-941c-6699f346400a','email','claim.name'),('d76d6cf5-b533-4bc6-941c-6699f346400a','true','id.token.claim'),('d76d6cf5-b533-4bc6-941c-6699f346400a','String','jsonType.label'),('d76d6cf5-b533-4bc6-941c-6699f346400a','email','user.attribute'),('d9a492bd-3173-4e8d-a4cf-db3b74d1e4f2','true','access.token.claim'),('d9a492bd-3173-4e8d-a4cf-db3b74d1e4f2','true','id.token.claim'),('e16f019e-762f-4487-8859-9ffddec096ee','true','access.token.claim'),('e16f019e-762f-4487-8859-9ffddec096ee','given_name','claim.name'),('e16f019e-762f-4487-8859-9ffddec096ee','true','id.token.claim'),('e16f019e-762f-4487-8859-9ffddec096ee','String','jsonType.label'),('e16f019e-762f-4487-8859-9ffddec096ee','firstName','user.attribute'),('e1f324a1-e860-49ad-85d9-26f47dd33a6e','true','access.token.claim'),('e1f324a1-e860-49ad-85d9-26f47dd33a6e','family_name','claim.name'),('e1f324a1-e860-49ad-85d9-26f47dd33a6e','true','id.token.claim'),('e1f324a1-e860-49ad-85d9-26f47dd33a6e','String','jsonType.label'),('e1f324a1-e860-49ad-85d9-26f47dd33a6e','lastName','user.attribute'),('e518584c-ca18-445e-a675-637e08a85ea3','true','access.token.claim'),('e518584c-ca18-445e-a675-637e08a85ea3','true','id.token.claim'),('e9986938-506d-4898-8085-7e7492748ef3','true','access.token.claim'),('e9986938-506d-4898-8085-7e7492748ef3','family_name','claim.name'),('e9986938-506d-4898-8085-7e7492748ef3','true','id.token.claim'),('e9986938-506d-4898-8085-7e7492748ef3','String','jsonType.label'),('e9986938-506d-4898-8085-7e7492748ef3','lastName','user.attribute'),('ec5980a5-e027-4084-87b6-676e028f71b0','Role','attribute.name'),('ec5980a5-e027-4084-87b6-676e028f71b0','Basic','attribute.nameformat'),('ec5980a5-e027-4084-87b6-676e028f71b0','false','single'),('f0656efe-9f90-4750-84e4-ecb3628afe85','true','access.token.claim'),('f0656efe-9f90-4750-84e4-ecb3628afe85','family_name','claim.name'),('f0656efe-9f90-4750-84e4-ecb3628afe85','true','id.token.claim'),('f0656efe-9f90-4750-84e4-ecb3628afe85','String','jsonType.label'),('f0656efe-9f90-4750-84e4-ecb3628afe85','lastName','user.attribute'),('f1648608-3bf5-4a2a-b17a-fe33d7a1d9e9','true','access.token.claim'),('f1648608-3bf5-4a2a-b17a-fe33d7a1d9e9','family_name','claim.name'),('f1648608-3bf5-4a2a-b17a-fe33d7a1d9e9','true','id.token.claim'),('f1648608-3bf5-4a2a-b17a-fe33d7a1d9e9','String','jsonType.label'),('f1648608-3bf5-4a2a-b17a-fe33d7a1d9e9','lastName','user.attribute'),('fb482552-261f-46b1-a979-db1d909e0479','true','access.token.claim'),('fb482552-261f-46b1-a979-db1d909e0479','given_name','claim.name'),('fb482552-261f-46b1-a979-db1d909e0479','true','id.token.claim'),('fb482552-261f-46b1-a979-db1d909e0479','String','jsonType.label'),('fb482552-261f-46b1-a979-db1d909e0479','firstName','user.attribute'),('fefd79c5-1ccf-4283-8dc1-522b31cd1fc5','true','access.token.claim'),('fefd79c5-1ccf-4283-8dc1-522b31cd1fc5','true','id.token.claim');
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM`
--

LOCK TABLES `REALM` WRITE;
/*!40000 ALTER TABLE `REALM` DISABLE KEYS */;
INSERT INTO `REALM` VALUES ('itesoft',60,300,300,NULL,NULL,NULL,'','\0',0,NULL,'itesoft',0,NULL,'MIIEpAIBAAKCAQEAhE2wJGJ0gKQn7eXGWO0ZoPRumsxPcazuzlrbsRXKbKi2NcbmWQ89UWV3IKM77uVK8uSfDp67FkyQmQqoe2TwvNNRG16EFacfmHameV78IpAx178y211pB87kODMR+1HbR/oZgHV2+6QiNkcOs8qqZ+8IT+QCAE+pHXulu/m+eKBPej08TpINYyvBVb53JcIOSOz0PMY4ze9xJ0Ntkq+2Lu4bfk84WAyvKcRSdOegBRtmctEJmWaRceHcd7vlZTRQX3IVIY+eFvrc/M7HneMQWNmZHvkdGHLZcUCamGThxwA6UeW0pwL06G8PC9fEb9FmJPk3c8WW9TsjhHAITf9NUQIDAQABAoIBADKqMX7teSHeOzA+IsPhIERj9osvHGkyyUyavLDG4HrV7NkRLxsB3AB0s7b667OjeR0k8cg+fvSeI22ICFcgo5Qb9F5fxoMoOdA/96ZY+oMd5whwvsAEuHj2AK2I2ST+BtQ8cVGhKgxZoYRZl8bAIJumjO9TKHUIDIIu3JvsmsVEQkwhMGWYxzqhhfDbWpxYemz5DlqCtzT0HazQXovRvTJb+zgzflaXgTOHGXMoH9v79liPEx1JkPURJsnzGE0vuF8fCfqvbKs/UkXdGcTzEOw2M2pDah8BYDh7iWllvNcNhw+TKaP94JCnROTu/u9nSe8GDfUWPEEZteHHa7J63nECgYEA/uSggS+r6TH2D1TkcZ3r7NZzkCs9nEuR8F2BPsMQ+U+u1lpkvk/QEUIbaTJebaN3vvgN/+t4k3/bLD26rTfE2Z/jkOjnvkuEpbSRd2Mlrs5eQqQ5LBwDFRIKdoRKgJx1jLY7QgNXkdYNbn8Y2Vw9BGSeev/cRtOae4Ha+R3wWO0CgYEAhODGMLaeR/s4sDwaVzf595HgWcKh9lkFB0VtkRHb0/Rhb4LQObpT2wFPkN7h0/7r4UpLnVZH2u5c8dMQM4iOOP8cgV41qA2FEpl+BLcYRKFPH27rRNGuehqlj6xaX+Ss3mqB+Gf2DGS17ZTQv/xfEiy5TfChRi65qvvOXEX5LXUCgYEAmNZ8S5pLKbQ0h/LuXBZGfigE+WCEO/CwXIGk2v5acjPOcWeYWuk+qOqLxyNVrcZEKjVRJ7CJB2C2CiwlgHIdTiTqblzJgLiFnFrOktjXop7JtIoGYiWVz4+WyIQArGeksLAgji+01ZSVTzlUrBj72WOAB97dtXZyfjZaF+BU2u0CgYBoUHEmYublSWJacASZvfb9lMaUkMhHNeFNsQJv5Z42yd4IBaDkANO91UyaRW7x12lkBshPryFfzMqoiXJpkmVcd2HwaX4j/OEgFeGpX/esQRp1acVG1HltoCejH8IfD81qGiEIWsz9M77i0XYDkeMsyHF8r1BcYWgew+lf5QrV1QKBgQCRoO1jUa4e6rsxLDxkltGkLWcM9fU3jb/If5PgKFNhKDnZqYs+4sqewg6Wkyq9tEwJxfsqW50gElBu/4GohkmSC9ykF1JV5YaCtACe2+sYV8VPE/vSpZDrr+zKysrqG0CTuIqEAU/EI23BH83IaIHVeXbxklLhDZKmlxZMbi8G/g==','MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAhE2wJGJ0gKQn7eXGWO0ZoPRumsxPcazuzlrbsRXKbKi2NcbmWQ89UWV3IKM77uVK8uSfDp67FkyQmQqoe2TwvNNRG16EFacfmHameV78IpAx178y211pB87kODMR+1HbR/oZgHV2+6QiNkcOs8qqZ+8IT+QCAE+pHXulu/m+eKBPej08TpINYyvBVb53JcIOSOz0PMY4ze9xJ0Ntkq+2Lu4bfk84WAyvKcRSdOegBRtmctEJmWaRceHcd7vlZTRQX3IVIY+eFvrc/M7HneMQWNmZHvkdGHLZcUCamGThxwA6UeW0pwL06G8PC9fEb9FmJPk3c8WW9TsjhHAITf9NUQIDAQAB','\0','\0','\0','\0','EXTERNAL',1800,36000,'\0','\0','a02a824d-ebc5-4a49-a59a-e477c52c2393','MIICnTCCAYUCBgFRgZYOxDANBgkqhkiG9w0BAQsFADASMRAwDgYDVQQDDAdpdGVzb2Z0MB4XDTE1MTIwODEyMzI1M1oXDTI1MTIwODEyMzQzM1owEjEQMA4GA1UEAwwHaXRlc29mdDCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAIRNsCRidICkJ+3lxljtGaD0bprMT3Gs7s5a27EVymyotjXG5lkPPVFldyCjO+7lSvLknw6euxZMkJkKqHtk8LzTURtehBWnH5h2pnle/CKQMde/MttdaQfO5DgzEftR20f6GYB1dvukIjZHDrPKqmfvCE/kAgBPqR17pbv5vnigT3o9PE6SDWMrwVW+dyXCDkjs9DzGOM3vcSdDbZKvti7uG35POFgMrynEUnTnoAUbZnLRCZlmkXHh3He75WU0UF9yFSGPnhb63PzOx53jEFjZmR75HRhy2XFAmphk4ccAOlHltKcC9OhvDwvXxG/RZiT5N3PFlvU7I4RwCE3/TVECAwEAATANBgkqhkiG9w0BAQsFAAOCAQEAMkTOvcC7itBho5fMS1QzD3LMO/T0eDh0++xWe+2YPFqqahqQXvIsBayPq3xzmjD5wuKi1VmGvI74ThRnpB0ZGR3FIxBsi7EsSDIw5Csys78TmiUJRa1Qj8iP9TcF4yt1OLq+WCYlM0KA8bhUQxRB/E7ZpsVWdIqxsKNV+AycBJWrNJnCKx1G729caajAHCGiHlpPQLQNqOsh65RJmtbqFkCLIfJVT4n7OR//kNBg1Rc4twQ1c+w0LN0MUpsdV6S6t5Cb7qTrf+bAVm59mLmLKQTNtme+Cgv6P9Uxpi4G+fTOtsindTH0TRzsJfrC29IoaUI/tIMDmpsLxFq2t/ay5w==','db68a658-15e1-409e-bf34-c8493459fbff',1800,'\0',NULL,'\0','\0','\0','\0',0,1,30,6,'HmacSHA1','totp','93b930ae-a898-4e38-8624-ff8c75f5cb42','ec2f79e5-d462-4e11-a953-c2c95e20f2cb','8807dfdf-e118-43f0-97a3-c7bda65c2db4','c9dcc34f-fc04-498c-abce-36087d02fd1a','1b7ea6aa-0cf1-4234-8572-f3f6c8851f75',2592000,'\0',900),('master',60,300,60,NULL,NULL,NULL,'','\0',0,NULL,'master',0,NULL,'MIIEpAIBAAKCAQEAsMcHwKOmxWS2buRezSrk7qvqW3aSKCiUpqCLETdS36TkWJjspCzVq2OHmhbRUSs3k+KfEJ6w0Ul3LAw2WmAgZKFyqfBWQGRxUd3xNXaYZAAfu5ETIJHvKx4BI2gkoBCLi1bxGSrfVYHb/j2eUZpq05tUZmm7UUx2tFkyCgWS2/px+w50kYc5RCMiXWNnMa7XvD2loEAki+OogfWRSlLD/FAbuHWZmBMMNNRrOwPXfflRHXsbzoGa++aE8CLCXtgkkopVH1LNI2kxPeUBUGEqnEmdGEbC7wH/N5pMZKwBNb3tQK23agHQao2yctfwvUjfmZG1e6+oeulSa9j8Ds/rDQIDAQABAoIBAAMgUfPHMSDWih9l7INGWewaoDdj3mvVY+OafTsdtlp8KQmkErNIk7LHPNOtyZ/c2svDuzppBAl/ehsOUDvC7W+6JzP4Kx5SaGqhOS3P3hwOoIEJrMPrsMYbbru4kMU/5afeLr9aMb7qYACcCFu7Fl6Npa11+zkR2BuSZD8nIBTBznOJ32jtjPYXZu6pNM+0URCNgsgZETO6/Rgr+dMFs686a73ZuBsb8fIs96Pn+fKNRbZcusi0Uw8p8gLUzG+BKK0dJ5sNlKCcDxSXQA4E8KZJUSThLij7zYmKmgoP2MA73zTdWkkDi5IIKV5fYXRQvCv2XFAuTy84/S1oiZvAuEECgYEA/hPsXE8EK/ComlhDiXT9o/zXIilW6Id7aU9a/wwUAFKqg8muUu/gpUSzQFXEGPKnyoBCsPxmcJl3yBmv4KxgZRb0A3hb96lsieQVJHSiVJrtU342Io3vVx3Z1YcISxzeJW/CPaix6IUgm3Z0p2VgAxS0bbo0s2LZJGJnJHejE70CgYEAsh1l6pTorm09yLlU/nJyvn067SGvTC+oVzz4OauveliPgxwtjZjx5JeTZzlEotFJ9SKIyQpoFYOQRdUqX8CxlCFI2hw12vTdk/2hxu6FevPk6s0EP5j2tfCjLgy2TnyTCbJQmwbtQ6ejjwbTFwzEwBehzX1PzhoDR8rHGSC2AZECgYEApc84s7D5RveiAD/Tq1PG5wrtFqUly1AHMN2Rw9oM/3zzPFgUxJk44IHp/PU7qRBKgfOcEkZVT+xHaDWjOpsjuTT2f4E/e2t8oqxPQ+A9w7rrYE6AY6J+7DpV22xo9CPdsU6y02xQ1i5y7iGq1UdqFfigGu+mzt6WWJFDQGA2830CgYAowBUbMGpzzcZ+7/gEJwcdkeUzb6t9kMHBA8/+0craAP0EkCPT65QcKpms2itb3OpAzV/iLyFVGr6dW4HQWnPGYj8at62SpMc1HqgurU+Yq8hJ+BHqwwJe6elLldj36AR0CXnrnhAWlHoVNQiCk4dIM5/vNaZWjxkFCd23YAaEIQKBgQDA+p+9libzVyKg9Dyu8gU2hcxOV9MiIhYlqjalzpMnjz5RS8g+k7TeUMa4+s5YGMrNNQ49rXVnlPMROaBaqPqOnSrYe5JOn9Y0YIzrH0jM72k9aB3GedMHEUjkjM6tELzts1gTrDkZ2gOOPu1qqYfdrLHtD31qQ7V+8wWLEiNcLA==','MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAsMcHwKOmxWS2buRezSrk7qvqW3aSKCiUpqCLETdS36TkWJjspCzVq2OHmhbRUSs3k+KfEJ6w0Ul3LAw2WmAgZKFyqfBWQGRxUd3xNXaYZAAfu5ETIJHvKx4BI2gkoBCLi1bxGSrfVYHb/j2eUZpq05tUZmm7UUx2tFkyCgWS2/px+w50kYc5RCMiXWNnMa7XvD2loEAki+OogfWRSlLD/FAbuHWZmBMMNNRrOwPXfflRHXsbzoGa++aE8CLCXtgkkopVH1LNI2kxPeUBUGEqnEmdGEbC7wH/N5pMZKwBNb3tQK23agHQao2yctfwvUjfmZG1e6+oeulSa9j8Ds/rDQIDAQAB','\0','\0','\0','\0','EXTERNAL',1800,36000,'\0','\0','c36f99d0-138c-423b-95f5-02cd1987dc7d','MIICmzCCAYMCBgFRgZST3DANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZtYXN0ZXIwHhcNMTUxMjA4MTIzMTE2WhcNMjUxMjA4MTIzMjU2WjARMQ8wDQYDVQQDDAZtYXN0ZXIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCwxwfAo6bFZLZu5F7NKuTuq+pbdpIoKJSmoIsRN1LfpORYmOykLNWrY4eaFtFRKzeT4p8QnrDRSXcsDDZaYCBkoXKp8FZAZHFR3fE1dphkAB+7kRMgke8rHgEjaCSgEIuLVvEZKt9Vgdv+PZ5RmmrTm1RmabtRTHa0WTIKBZLb+nH7DnSRhzlEIyJdY2cxrte8PaWgQCSL46iB9ZFKUsP8UBu4dZmYEww01Gs7A9d9+VEdexvOgZr75oTwIsJe2CSSilUfUs0jaTE95QFQYSqcSZ0YRsLvAf83mkxkrAE1ve1ArbdqAdBqjbJy1/C9SN+ZkbV7r6h66VJr2PwOz+sNAgMBAAEwDQYJKoZIhvcNAQELBQADggEBAAFCajZCliMxCzsGcJXcJYUC9CoVvbQ4yxf6cROVPOBkljjk72wXAKxmV1q6ZnbsFryz8H5u3ZJjCvkrD9jDWYbIGbFIRcYnbNiBGoJir4rqkSVbpRJv2c6gPndvyFTDE0r1Q7B2a4+PUX6uqGOAsVh2znQN9mCm/hWfhYA16caqZdxoLojBB7/c17tOMjaQtwP8OsVDDdG56APDlLkRTid9Zqh8PRAY53wnWDzPHaD8zuOWMft1Gq+enB07gRDwG2bpOBMHyF8XayJjdQA3M1K9U9gZ6uLwXqc/JIzrRzNULm9oQ3XeZ2YQyy6YFYJpvm5tzZ24y8vStvVHyhhF8hg=','1e0a0ece-2246-4166-a30e-aa9984b1e4b8',1800,'\0',NULL,'\0','\0','\0','\0',0,1,30,6,'HmacSHA1','totp','ba2acb03-264c-4f2e-9016-1001fad0f805','bc257658-d4af-4ad6-8e30-a3a9459e2db3','92357ae4-d49d-4af5-827f-ad2cb82a0e9f','0d2de298-6be1-479f-9569-a9841f90e064','3278bc14-dfe4-4be0-a1c0-41fca9d9d306',2592000,'\0',900);
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_CLIENT`
--

LOCK TABLES `REALM_CLIENT` WRITE;
/*!40000 ALTER TABLE `REALM_CLIENT` DISABLE KEYS */;
INSERT INTO `REALM_CLIENT` VALUES ('master','09d3d1f3-f87c-4957-8fbd-fc264bcb2463'),('master','a578ca15-e5d2-4413-96d9-d953d7e9640d'),('master','c36f99d0-138c-423b-95f5-02cd1987dc7d'),('master','f202d16f-1258-40e1-9cca-d68108a7acfb'),('master','fe007228-1a74-4346-8a9f-2979434fe5f4'),('master','a02a824d-ebc5-4a49-a59a-e477c52c2393'),('itesoft','637d8e9c-f0f6-4e38-a1f1-e46b76480758'),('itesoft','a3b50ef7-6117-4784-9c61-adb467c2e851'),('itesoft','2bbb5fa6-f721-4792-a927-743769cd5a35'),('itesoft','16a57720-ac20-4614-aa05-8eca4324be7b'),('itesoft','39228268-e409-487e-af5b-6309b2dd9791'),('itesoft','bca50426-1b9c-4317-a7d4-7bf3aab26e17');
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_DEFAULT_ROLES`
--

LOCK TABLES `REALM_DEFAULT_ROLES` WRITE;
/*!40000 ALTER TABLE `REALM_DEFAULT_ROLES` DISABLE KEYS */;
INSERT INTO `REALM_DEFAULT_ROLES` VALUES ('itesoft','3442a672-bfdb-464f-83cf-82fe8c7f1186'),('master','4566456f-767f-4f47-93e6-b23922dc2922');
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REDIRECT_URIS`
--

LOCK TABLES `REDIRECT_URIS` WRITE;
/*!40000 ALTER TABLE `REDIRECT_URIS` DISABLE KEYS */;
INSERT INTO `REDIRECT_URIS` VALUES ('fe007228-1a74-4346-8a9f-2979434fe5f4','/auth/realms/master/account/*'),('f202d16f-1258-40e1-9cca-d68108a7acfb','/auth/admin/master/console/*'),('a3b50ef7-6117-4784-9c61-adb467c2e851','/auth/realms/itesoft/account/*'),('16a57720-ac20-4614-aa05-8eca4324be7b','/auth/admin/itesoft/console/*'),('bca50426-1b9c-4317-a7d4-7bf3aab26e17','http://localhost/*');
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REQUIRED_ACTION_PROVIDER`
--

LOCK TABLES `REQUIRED_ACTION_PROVIDER` WRITE;
/*!40000 ALTER TABLE `REQUIRED_ACTION_PROVIDER` DISABLE KEYS */;
INSERT INTO `REQUIRED_ACTION_PROVIDER` VALUES ('4af05bbb-380b-42ec-acc4-57141648662d','terms_and_conditions','Terms and Conditions','itesoft','\0','\0','terms_and_conditions'),('5355e126-d7e7-4d7d-805b-9f5c30b086a5','terms_and_conditions','Terms and Conditions','master','\0','\0','terms_and_conditions'),('5731d419-f18d-437e-be21-a44fed3472fc','CONFIGURE_TOTP','Configure Totp','master','','\0','CONFIGURE_TOTP'),('57f393ae-5382-4c3f-ad90-bafeb053ab06','VERIFY_EMAIL','Verify Email','master','','\0','VERIFY_EMAIL'),('7a5d2b5b-be9c-4345-a6e6-66e5cab35a7b','UPDATE_PASSWORD','Update Password','master','','\0','UPDATE_PASSWORD'),('ac48b851-45fe-46d0-a898-916db010fe56','UPDATE_PROFILE','Update Profile','master','','\0','UPDATE_PROFILE'),('b9de8754-69c0-428d-a18f-65f80c9a144d','UPDATE_PROFILE','Update Profile','itesoft','','\0','UPDATE_PROFILE'),('ce92a6bf-8fb7-414d-ac44-6b3537a9858a','VERIFY_EMAIL','Verify Email','itesoft','','\0','VERIFY_EMAIL'),('d54ce5ea-6697-4ce1-a195-88bd17dd5fd8','CONFIGURE_TOTP','Configure Totp','itesoft','','\0','CONFIGURE_TOTP'),('db3748db-fc4f-41b7-82b8-144e7df5c352','UPDATE_PASSWORD','Update Password','itesoft','','\0','UPDATE_PASSWORD');
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SCOPE_MAPPING`
--

LOCK TABLES `SCOPE_MAPPING` WRITE;
/*!40000 ALTER TABLE `SCOPE_MAPPING` DISABLE KEYS */;
INSERT INTO `SCOPE_MAPPING` VALUES ('16a57720-ac20-4614-aa05-8eca4324be7b','4146c1bb-d450-4d51-8569-84746a7624c0'),('39228268-e409-487e-af5b-6309b2dd9791','4146c1bb-d450-4d51-8569-84746a7624c0'),('09d3d1f3-f87c-4957-8fbd-fc264bcb2463','d377b7de-e976-4474-ba2e-b6fccb87957e'),('f202d16f-1258-40e1-9cca-d68108a7acfb','d377b7de-e976-4474-ba2e-b6fccb87957e');
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_ENTITY`
--

LOCK TABLES `USER_ENTITY` WRITE;
/*!40000 ALTER TABLE `USER_ENTITY` DISABLE KEYS */;
INSERT INTO `USER_ENTITY` VALUES ('981bb108-91ff-4590-9e96-72e3e2a68c11',NULL,'b55eeb42-5aa2-4292-b7af-a4593f6903c1','\0','',NULL,NULL,NULL,'master','\0','admin',1449577978171,NULL),('e504efc2-0c46-4ac5-a3cf-94b36be6b1ed','john.doe@itesoft.com','john.doe@itesoft.com','\0','',NULL,'john','doe','itesoft','\0','john',1449578177871,NULL);
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_ROLE_MAPPING`
--

LOCK TABLES `USER_ROLE_MAPPING` WRITE;
/*!40000 ALTER TABLE `USER_ROLE_MAPPING` DISABLE KEYS */;
INSERT INTO `USER_ROLE_MAPPING` VALUES ('158bad65-2f3f-457e-8fff-5979eb979128','981bb108-91ff-4590-9e96-72e3e2a68c11'),('4566456f-767f-4f47-93e6-b23922dc2922','981bb108-91ff-4590-9e96-72e3e2a68c11'),('d377b7de-e976-4474-ba2e-b6fccb87957e','981bb108-91ff-4590-9e96-72e3e2a68c11'),('ff63221b-be40-4281-a6a3-d1b2ef9251dc','981bb108-91ff-4590-9e96-72e3e2a68c11'),('3442a672-bfdb-464f-83cf-82fe8c7f1186','e504efc2-0c46-4ac5-a3cf-94b36be6b1ed'),('82b9be06-d701-4acb-bbc8-d079284de5c4','e504efc2-0c46-4ac5-a3cf-94b36be6b1ed'),('f3932562-e4cc-49b7-a433-0d3a7656d8e7','e504efc2-0c46-4ac5-a3cf-94b36be6b1ed');
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WEB_ORIGINS`
--

LOCK TABLES `WEB_ORIGINS` WRITE;
/*!40000 ALTER TABLE `WEB_ORIGINS` DISABLE KEYS */;
INSERT INTO `WEB_ORIGINS` VALUES ('bca50426-1b9c-4317-a7d4-7bf3aab26e17','http://localhost');
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

-- Dump completed on 2015-12-08 12:40:53
