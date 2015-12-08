
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
INSERT INTO `AUTHENTICATION_EXECUTION` VALUES ('018c5f91-9863-4e1e-82c8-56a0ae7ec423',NULL,'auth-username-password-form','itesoft','9e8c1fbf-04dd-4078-bd18-d7f9fb47fc45',0,10,'\0',NULL,NULL),('035aa9cc-8fb1-4e95-8e11-a08957bbfa68',NULL,'auth-username-password-form','master','d0e0580e-5ab0-4c73-bd03-e752609f9a97',0,10,'\0',NULL,NULL),('061584de-83a6-4eb2-a1c2-777669e3422d',NULL,'idp-confirm-link','itesoft','4a907f80-3b6d-4448-a4a6-4eb5e74e1159',0,10,'\0',NULL,NULL),('1294b617-0b0e-476f-8d45-79df68a99d6e',NULL,'auth-cookie','itesoft','81dd220b-bad6-4dd9-88f9-e7d76dcaafc8',2,10,'\0',NULL,NULL),('14aba53e-72e3-4e51-8ef3-4b7b33701edc',NULL,'auth-spnego','master','57aded64-6ea4-4e65-9f89-abc3ba0d29f9',3,20,'\0',NULL,NULL),('1f8a26ec-4324-4cd8-971b-1cef7e28132f',NULL,'direct-grant-validate-password','master','050195c4-b012-4f7f-8d70-511e09923be2',0,20,'\0',NULL,NULL),('27164766-ab52-4fc7-8560-badf78226a5a',NULL,'reset-otp','itesoft','e671affd-0c6f-4a81-8a8b-c1ca0e055abe',1,40,'\0',NULL,NULL),('27430236-9dda-4eff-bb45-6a7694f8cb41',NULL,'registration-password-action','itesoft','e217207c-e3cd-4347-a077-a5f24fb8406e',0,50,'\0',NULL,NULL),('282446b9-f6e5-4a5b-acab-7eb1504e83f1',NULL,'idp-email-verification','master','c0dca193-2280-4f15-b5be-d4ea07809da1',2,20,'\0',NULL,NULL),('291774f6-6a5c-4099-bebd-93828069ff83',NULL,'client-jwt','master','16c590c7-a83e-4f97-b7d0-e35884bc412b',2,20,'\0',NULL,NULL),('2c79a94c-5802-4a9e-a495-bc65808e6177',NULL,'auth-cookie','master','57aded64-6ea4-4e65-9f89-abc3ba0d29f9',2,10,'\0',NULL,NULL),('326dae09-ea7e-448e-afea-a7cd6ede97d0',NULL,'registration-user-creation','master','11d6c516-22ca-43d7-b6c2-5b7a7cd558a6',0,20,'\0',NULL,NULL),('359ecdbd-06d5-4fbb-bd78-0a2d6b2dfa50',NULL,'reset-credentials-choose-user','master','5c5083e3-eae8-4b69-a484-2cf93e12387b',0,10,'\0',NULL,NULL),('3a66d0d8-b58e-4f86-9d90-81c9ceeae2e0',NULL,'registration-password-action','master','11d6c516-22ca-43d7-b6c2-5b7a7cd558a6',0,50,'\0',NULL,NULL),('43f07254-5500-42c7-bc30-5382f5bfde56',NULL,'idp-username-password-form','itesoft','db10945d-b374-42b2-96f6-a56abc6a084b',0,10,'\0',NULL,NULL),('443adf67-785f-47a0-9a29-360bda9c40b1',NULL,'direct-grant-validate-otp','itesoft','00a27090-97e3-4007-893c-34e6e1dcce12',1,30,'\0',NULL,NULL),('562de6ca-fc9f-494c-9e6f-925e8645fd65',NULL,'auth-otp-form','master','5a4a999b-e656-4d6a-942b-2d89b982e339',1,20,'\0',NULL,NULL),('72f051fd-9717-45f8-a34e-717d1b8e62c3',NULL,'idp-create-user-if-unique','master','a0102c40-f831-4138-9238-0603a4ea238e',2,20,'\0',NULL,'a749f0ba-85ce-4ec0-891f-e8dd2f52b8e4'),('75c7ff10-cac9-409e-a4ea-c49fcb8f9161',NULL,'reset-credentials-choose-user','itesoft','e671affd-0c6f-4a81-8a8b-c1ca0e055abe',0,10,'\0',NULL,NULL),('76bdd2ac-4a1a-4a63-b354-5e08c14b645c',NULL,'idp-username-password-form','master','5a4a999b-e656-4d6a-942b-2d89b982e339',0,10,'\0',NULL,NULL),('79318b86-f1a2-4968-91e0-7a6f0f21b8bd',NULL,NULL,'master','a0102c40-f831-4138-9238-0603a4ea238e',2,30,'','c0dca193-2280-4f15-b5be-d4ea07809da1',NULL),('7c14a663-d610-4fe5-8089-f111c481e185',NULL,'idp-email-verification','itesoft','4a907f80-3b6d-4448-a4a6-4eb5e74e1159',2,20,'\0',NULL,NULL),('828bbb9d-b4f4-4dcf-85e5-34c3de22b100',NULL,'reset-credential-email','itesoft','e671affd-0c6f-4a81-8a8b-c1ca0e055abe',0,20,'\0',NULL,NULL),('82dbe709-4d22-4999-8497-29489ed0ebee',NULL,'registration-profile-action','itesoft','e217207c-e3cd-4347-a077-a5f24fb8406e',0,40,'\0',NULL,NULL),('83a24afb-0876-40d8-93ee-1c0f28b46784',NULL,NULL,'itesoft','81dd220b-bad6-4dd9-88f9-e7d76dcaafc8',2,30,'','9e8c1fbf-04dd-4078-bd18-d7f9fb47fc45',NULL),('84580144-047e-4887-84bb-89e85edb789f',NULL,'idp-create-user-if-unique','itesoft','ca039554-59c2-4cb9-b7e2-7084eb40d615',2,20,'\0',NULL,'0ec80620-9a06-476b-8854-d94c5d7e00ea'),('847b781c-0c39-4a1a-8964-b0f8a0e202c9',NULL,'reset-otp','master','5c5083e3-eae8-4b69-a484-2cf93e12387b',1,40,'\0',NULL,NULL),('84f0403c-43d7-4b55-8e29-905bffbfc93c',NULL,'registration-user-creation','itesoft','e217207c-e3cd-4347-a077-a5f24fb8406e',0,20,'\0',NULL,NULL),('90b4fc28-e5b0-4878-b1f0-4f3d86a61eac',NULL,NULL,'master','57aded64-6ea4-4e65-9f89-abc3ba0d29f9',2,30,'','d0e0580e-5ab0-4c73-bd03-e752609f9a97',NULL),('90ff4c7d-140d-4214-9fca-b743f74d29ca',NULL,'idp-review-profile','master','a0102c40-f831-4138-9238-0603a4ea238e',0,10,'\0',NULL,'ce8f0b15-442a-44fd-b906-7f9f1a147e22'),('9634ff6a-7878-44a1-8958-a3280d95d348',NULL,NULL,'itesoft','ca039554-59c2-4cb9-b7e2-7084eb40d615',2,30,'','4a907f80-3b6d-4448-a4a6-4eb5e74e1159',NULL),('9c4d6b63-6694-49ef-aeb4-d25bf157e451',NULL,'reset-password','master','5c5083e3-eae8-4b69-a484-2cf93e12387b',0,30,'\0',NULL,NULL),('9cc8549e-1e34-42dd-be26-39daeb66a4ee',NULL,NULL,'itesoft','4a907f80-3b6d-4448-a4a6-4eb5e74e1159',2,30,'','db10945d-b374-42b2-96f6-a56abc6a084b',NULL),('9f9d82bc-2ea5-4b90-9f5e-67fa1c28c038',NULL,'registration-page-form','itesoft','d8017d9d-ab9d-4071-b007-544d07b9dfb7',0,10,'','e217207c-e3cd-4347-a077-a5f24fb8406e',NULL),('ab20f62b-006a-48dd-a67d-49435a56ab88',NULL,'registration-page-form','master','ca4412a2-6a27-4f67-a069-33c9a8a04573',0,10,'','11d6c516-22ca-43d7-b6c2-5b7a7cd558a6',NULL),('aba8a87f-0cc8-4975-a556-438a3303ed4c',NULL,'direct-grant-validate-username','itesoft','00a27090-97e3-4007-893c-34e6e1dcce12',0,10,'\0',NULL,NULL),('adc61449-db4b-4566-bcb2-b76a09a4821b',NULL,'client-secret','master','16c590c7-a83e-4f97-b7d0-e35884bc412b',2,10,'\0',NULL,NULL),('ae5efea7-4505-4de3-b182-b5947091230d',NULL,'reset-credential-email','master','5c5083e3-eae8-4b69-a484-2cf93e12387b',0,20,'\0',NULL,NULL),('b0a3c548-f7ac-48bb-8bbc-5cc880e9a2fd',NULL,NULL,'master','c0dca193-2280-4f15-b5be-d4ea07809da1',2,30,'','5a4a999b-e656-4d6a-942b-2d89b982e339',NULL),('b5acec35-bded-458c-816a-5e1b6babb7b3',NULL,'registration-recaptcha-action','master','11d6c516-22ca-43d7-b6c2-5b7a7cd558a6',3,60,'\0',NULL,NULL),('bd191691-cf6a-44c6-bc7f-47ac48393006',NULL,'client-jwt','itesoft','3b1ad2e8-4a72-48f6-a3ea-974cfd0fc6a7',2,20,'\0',NULL,NULL),('bfc32271-4e2a-46f4-93ff-53e88785e428',NULL,'client-secret','itesoft','3b1ad2e8-4a72-48f6-a3ea-974cfd0fc6a7',2,10,'\0',NULL,NULL),('c2da5504-b1fc-4cdb-b85d-735ebd2a9329',NULL,'registration-recaptcha-action','itesoft','e217207c-e3cd-4347-a077-a5f24fb8406e',3,60,'\0',NULL,NULL),('cbcb4c05-1c60-4b38-b1fe-076b88895b50',NULL,'auth-otp-form','master','d0e0580e-5ab0-4c73-bd03-e752609f9a97',1,20,'\0',NULL,NULL),('d7d30e63-d6e2-43a8-8b45-23169fd3c6f5',NULL,'idp-review-profile','itesoft','ca039554-59c2-4cb9-b7e2-7084eb40d615',0,10,'\0',NULL,'301b2af0-74ef-4e22-8168-036d11915f22'),('dbc63620-2f95-4c14-a7ff-b88294da06f5',NULL,'idp-confirm-link','master','c0dca193-2280-4f15-b5be-d4ea07809da1',0,10,'\0',NULL,NULL),('e5bb9de9-0d5b-44b5-a7f5-3bf3ffdd639a',NULL,'direct-grant-validate-otp','master','050195c4-b012-4f7f-8d70-511e09923be2',1,30,'\0',NULL,NULL),('e70976b7-e6a4-4294-9559-51803be3d07b',NULL,'direct-grant-validate-password','itesoft','00a27090-97e3-4007-893c-34e6e1dcce12',0,20,'\0',NULL,NULL),('e80aa22d-1503-449b-8f40-76fdf1eab937',NULL,'reset-password','itesoft','e671affd-0c6f-4a81-8a8b-c1ca0e055abe',0,30,'\0',NULL,NULL),('ea4bfe8e-47c4-4004-b6d0-97c4560cb7cb',NULL,'auth-otp-form','itesoft','9e8c1fbf-04dd-4078-bd18-d7f9fb47fc45',1,20,'\0',NULL,NULL),('ec52a7ae-8825-4c5e-865c-994fef2c65c0',NULL,'auth-otp-form','itesoft','db10945d-b374-42b2-96f6-a56abc6a084b',1,20,'\0',NULL,NULL),('ed66e3ea-cc4f-4e0e-a333-cbabd68861d7',NULL,'direct-grant-validate-username','master','050195c4-b012-4f7f-8d70-511e09923be2',0,10,'\0',NULL,NULL),('f23b7700-c173-411d-a3d4-99a357c9df35',NULL,'auth-spnego','itesoft','81dd220b-bad6-4dd9-88f9-e7d76dcaafc8',3,20,'\0',NULL,NULL),('f2a7d15c-0b98-4afc-b491-a26d8353e74f',NULL,'registration-profile-action','master','11d6c516-22ca-43d7-b6c2-5b7a7cd558a6',0,40,'\0',NULL,NULL);
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
INSERT INTO `AUTHENTICATION_FLOW` VALUES ('00a27090-97e3-4007-893c-34e6e1dcce12','direct grant','OpenID Connect Resource Owner Grant','itesoft','basic-flow','',''),('050195c4-b012-4f7f-8d70-511e09923be2','direct grant','OpenID Connect Resource Owner Grant','master','basic-flow','',''),('11d6c516-22ca-43d7-b6c2-5b7a7cd558a6','registration form','registration form','master','form-flow','\0',''),('16c590c7-a83e-4f97-b7d0-e35884bc412b','clients','Base authentication for clients','master','client-flow','',''),('3b1ad2e8-4a72-48f6-a3ea-974cfd0fc6a7','clients','Base authentication for clients','itesoft','client-flow','',''),('4a907f80-3b6d-4448-a4a6-4eb5e74e1159','Handle Existing Account','Handle what to do if there is existing account with same email/username like authenticated identity provider','itesoft','basic-flow','\0',''),('57aded64-6ea4-4e65-9f89-abc3ba0d29f9','browser','browser based authentication','master','basic-flow','',''),('5a4a999b-e656-4d6a-942b-2d89b982e339','Verify Existing Account by Re-authentication','Reauthentication of existing account','master','basic-flow','\0',''),('5c5083e3-eae8-4b69-a484-2cf93e12387b','reset credentials','Reset credentials for a user if they forgot their password or something','master','basic-flow','',''),('81dd220b-bad6-4dd9-88f9-e7d76dcaafc8','browser','browser based authentication','itesoft','basic-flow','',''),('9e8c1fbf-04dd-4078-bd18-d7f9fb47fc45','forms','Username, password, otp and other auth forms.','itesoft','basic-flow','\0',''),('a0102c40-f831-4138-9238-0603a4ea238e','first broker login','Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account','master','basic-flow','',''),('c0dca193-2280-4f15-b5be-d4ea07809da1','Handle Existing Account','Handle what to do if there is existing account with same email/username like authenticated identity provider','master','basic-flow','\0',''),('ca039554-59c2-4cb9-b7e2-7084eb40d615','first broker login','Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account','itesoft','basic-flow','',''),('ca4412a2-6a27-4f67-a069-33c9a8a04573','registration','registration flow','master','basic-flow','',''),('d0e0580e-5ab0-4c73-bd03-e752609f9a97','forms','Username, password, otp and other auth forms.','master','basic-flow','\0',''),('d8017d9d-ab9d-4071-b007-544d07b9dfb7','registration','registration flow','itesoft','basic-flow','',''),('db10945d-b374-42b2-96f6-a56abc6a084b','Verify Existing Account by Re-authentication','Reauthentication of existing account','itesoft','basic-flow','\0',''),('e217207c-e3cd-4347-a077-a5f24fb8406e','registration form','registration form','itesoft','form-flow','\0',''),('e671affd-0c6f-4a81-8a8b-c1ca0e055abe','reset credentials','Reset credentials for a user if they forgot their password or something','itesoft','basic-flow','','');
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
INSERT INTO `AUTHENTICATOR_CONFIG` VALUES ('0ec80620-9a06-476b-8854-d94c5d7e00ea','create unique user config','itesoft'),('301b2af0-74ef-4e22-8168-036d11915f22','review profile config','itesoft'),('a749f0ba-85ce-4ec0-891f-e8dd2f52b8e4','create unique user config','master'),('ce8f0b15-442a-44fd-b906-7f9f1a147e22','review profile config','master');
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
INSERT INTO `AUTHENTICATOR_CONFIG_ENTRY` VALUES ('0ec80620-9a06-476b-8854-d94c5d7e00ea','false','require.password.update.after.registration'),('301b2af0-74ef-4e22-8168-036d11915f22','missing','update.profile.on.first.login'),('a749f0ba-85ce-4ec0-891f-e8dd2f52b8e4','false','require.password.update.after.registration'),('ce8f0b15-442a-44fd-b906-7f9f1a147e22','missing','update.profile.on.first.login');
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
INSERT INTO `CLIENT` VALUES ('2165c3e8-c375-4bb6-bc7a-072bdb04de07','','','master-realm',0,'\0','2830fa8f-9165-4c9b-9652-bdc555639761',NULL,'',NULL,'\0','master',NULL,0,'\0','\0','master Realm','\0','client-secret',NULL,NULL,NULL,'','\0','\0'),('4032f5ce-a5dd-45a1-91fc-6a7041a685f2','','\0','admin-cli',0,'','58c23704-87b5-4644-975e-ddd75fc69906',NULL,'\0',NULL,'\0','itesoft',NULL,0,'\0','\0','${client_admin-cli}','\0','client-secret',NULL,NULL,NULL,'\0','\0',''),('571d349e-f297-423c-85a8-02043a6dced6','','\0','broker',0,'\0','9ec98cc4-d5b6-4747-b9aa-1f9eacadedd7',NULL,'\0',NULL,'\0','itesoft',NULL,0,'\0','\0','${client_broker}','\0','client-secret',NULL,NULL,NULL,'','\0','\0'),('59af5029-c076-40f8-9ba8-cc4a0bd09bd2','','\0','realm-management',0,'\0','394311e1-c286-448f-b7f7-cfc84eb3bb21',NULL,'',NULL,'\0','itesoft',NULL,0,'\0','\0','${client_realm-management}','\0','client-secret',NULL,NULL,NULL,'','\0','\0'),('6a710a53-ee93-418c-9542-29318c681535','','\0','security-admin-console',0,'','e18b6caf-2852-41cc-9138-a2ac4154effc','/auth/admin/itesoft/console/index.html','\0',NULL,'\0','itesoft',NULL,0,'\0','\0','${client_security-admin-console}','\0','client-secret',NULL,NULL,NULL,'','\0','\0'),('84978901-d2c6-4a38-bbbb-f9cd54e5fe10','','','itesoft-realm',0,'\0','1f235255-9f04-48b6-ac01-23481291ff47',NULL,'',NULL,'\0','master',NULL,0,'\0','\0','itesoft Realm','\0','client-secret',NULL,NULL,NULL,'','\0','\0'),('8d3218d6-f904-4d28-845b-ef57eeef0c48','','\0','security-admin-console',0,'','82782291-c5c9-4cc7-98fc-8acab85fa69a','/auth/admin/master/console/index.html','\0',NULL,'\0','master',NULL,0,'\0','\0','${client_security-admin-console}','\0','client-secret',NULL,NULL,NULL,'','\0','\0'),('a32a134d-158b-4eda-af8e-3a2765e408e1','','\0','account',0,'\0','4a196b5b-387c-4620-8b5a-631e5e6ba899','/auth/realms/itesoft/account','\0',NULL,'\0','itesoft',NULL,0,'\0','\0','${client_account}','\0','client-secret',NULL,NULL,NULL,'','\0','\0'),('ad5c7379-f4b8-4cbf-841e-deaeb6ddc267','','\0','admin-cli',0,'','584b2f83-9a03-4a5c-a803-1ceba63958e5',NULL,'\0',NULL,'\0','master',NULL,0,'\0','\0','${client_admin-cli}','\0','client-secret',NULL,NULL,NULL,'\0','\0',''),('bd7e0a02-230a-4e98-bdad-820a26f315a2','','\0','account',0,'\0','ffeb637e-0e12-41f2-9f8c-9c3b4d4b5fda','/auth/realms/master/account','\0',NULL,'\0','master',NULL,0,'\0','\0','${client_account}','\0','client-secret',NULL,NULL,NULL,'','\0','\0'),('d49bf1e6-ec47-4abb-b78e-aac9d7fb4717','','\0','broker',0,'\0','37d0ef56-1bff-4784-8cba-39cb43d1a0f1',NULL,'\0',NULL,'\0','master',NULL,0,'\0','\0','${client_broker}','\0','client-secret',NULL,NULL,NULL,'','\0','\0');
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
INSERT INTO `CLIENT_DEFAULT_ROLES` VALUES ('a32a134d-158b-4eda-af8e-3a2765e408e1','39566107-3ae2-4d29-af4f-63bf1f221b73'),('a32a134d-158b-4eda-af8e-3a2765e408e1','90024724-5d91-4e2e-a6dd-41b407927131'),('bd7e0a02-230a-4e98-bdad-820a26f315a2','7124b56f-32c9-4711-98c5-64d512bcbe6c'),('bd7e0a02-230a-4e98-bdad-820a26f315a2','99c92156-1bff-4748-8084-e8c053762f6a');
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
INSERT INTO `COMPOSITE_ROLE` VALUES ('2be679ad-d56d-4e93-8344-936f14519f8d','ca4cdbb6-30d9-4c7f-8d9b-9de0dd9de0e1'),('2be679ad-d56d-4e93-8344-936f14519f8d','933c2790-ebb4-4be3-a2a7-43f9c736adaf'),('2be679ad-d56d-4e93-8344-936f14519f8d','76a4f713-5b87-4877-8a5b-5b0273d32f35'),('2be679ad-d56d-4e93-8344-936f14519f8d','473ca9e5-d258-496c-9e10-04607ca97aff'),('2be679ad-d56d-4e93-8344-936f14519f8d','ee809472-8735-42fd-9d72-2bcc7f5a207e'),('2be679ad-d56d-4e93-8344-936f14519f8d','87c32192-8cf5-4acf-8e3a-b8027a22f623'),('2be679ad-d56d-4e93-8344-936f14519f8d','5abc8d4e-c03f-41dc-90db-d55a62c13b38'),('2be679ad-d56d-4e93-8344-936f14519f8d','5b6ee4e2-fe2e-4a08-bf7c-58ca0fa5c279'),('2be679ad-d56d-4e93-8344-936f14519f8d','1aea95f9-ba60-42e3-b21a-a4f95bf0695b'),('2be679ad-d56d-4e93-8344-936f14519f8d','8f82adb6-cb17-4ee1-ae4c-22594b051f32'),('2be679ad-d56d-4e93-8344-936f14519f8d','d95561cc-42f4-4fb7-bd36-76e29ca9c4fa'),('2be679ad-d56d-4e93-8344-936f14519f8d','19ce314c-51fc-4195-a9ba-3de53a8da914'),('2be679ad-d56d-4e93-8344-936f14519f8d','06df5122-7251-415c-8e44-4a856e910768'),('2be679ad-d56d-4e93-8344-936f14519f8d','a823060f-0be5-4714-9127-3fa31766c328'),('2be679ad-d56d-4e93-8344-936f14519f8d','bae0de65-7617-4130-a5b0-edb42c3bed22'),('2be679ad-d56d-4e93-8344-936f14519f8d','d56e9b35-d646-42b0-895d-d310103d529f'),('2be679ad-d56d-4e93-8344-936f14519f8d','1b7b63b8-e7b8-4457-8dce-4023c86348c9'),('2be679ad-d56d-4e93-8344-936f14519f8d','0291a364-0b17-4146-88cb-f61d335d56f3'),('2be679ad-d56d-4e93-8344-936f14519f8d','40a8ead7-aa13-44a5-809f-78a00fc120fe'),('2be679ad-d56d-4e93-8344-936f14519f8d','9deebdc2-3622-499e-8b9c-2ce2105a147e'),('2be679ad-d56d-4e93-8344-936f14519f8d','e2710d41-0715-4dd9-aba0-fdc4da0ca6ff'),('2be679ad-d56d-4e93-8344-936f14519f8d','a32970dc-ce26-4d72-b9a3-972ef0634b73'),('2be679ad-d56d-4e93-8344-936f14519f8d','a137608c-2836-49f5-9b56-f4c718908f98'),('2be679ad-d56d-4e93-8344-936f14519f8d','bc2db694-188f-4a7e-874d-3273fa74adba'),('2be679ad-d56d-4e93-8344-936f14519f8d','121f2686-48cd-4f1f-a276-832d688a1098'),('700ef8f7-dfc9-4a50-9a53-9453ea0a9fcc','4488171a-acb8-4569-87c3-b2039f1101dd'),('700ef8f7-dfc9-4a50-9a53-9453ea0a9fcc','dad28560-c0a0-4ce0-80e7-acafa19f04c7'),('700ef8f7-dfc9-4a50-9a53-9453ea0a9fcc','cea98309-ba4d-4e34-8732-4f08065193db'),('700ef8f7-dfc9-4a50-9a53-9453ea0a9fcc','33224458-1e63-4c3e-9115-7a18fbf9a5f6'),('700ef8f7-dfc9-4a50-9a53-9453ea0a9fcc','f8b2b19d-7198-42c4-864d-4b587c94d83f'),('700ef8f7-dfc9-4a50-9a53-9453ea0a9fcc','8d9a0a75-0864-4409-a3b4-7d41f3d0aa15'),('700ef8f7-dfc9-4a50-9a53-9453ea0a9fcc','2a608209-6294-477d-9ffb-3d936796e343'),('700ef8f7-dfc9-4a50-9a53-9453ea0a9fcc','efc481d1-3ad5-4e89-875d-b9d0ff843812'),('700ef8f7-dfc9-4a50-9a53-9453ea0a9fcc','4eb75196-fc1f-4ea9-b48a-07127265fda4'),('700ef8f7-dfc9-4a50-9a53-9453ea0a9fcc','60f99db3-e411-47dd-ab35-45a4f69450fa'),('700ef8f7-dfc9-4a50-9a53-9453ea0a9fcc','aacd60a1-8272-472c-bb37-ae028bb6bbe4'),('700ef8f7-dfc9-4a50-9a53-9453ea0a9fcc','23148457-9ea0-4c56-a349-ac29039f0171');
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
INSERT INTO `CREDENTIAL` VALUES ('e07f1d36-a405-4f40-a0a8-5a183a86ad6d',NULL,1,'�B��u�����(��','password','IAbvSD6CchgXQvY7VNKNz92BGrNvOhKfaKgcUcGwMRKOWZ4KEctJUigR1M07aFeuk7h4bNIl+1fi00v8fhvDbQ==','0cd778e8-4334-4ec4-b5fc-d6a3c81b7d36',1449587517000,0,0,0,NULL);
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
INSERT INTO `DATABASECHANGELOG` VALUES ('1.0.0.Final','sthorger@redhat.com','META-INF/jpa-changelog-1.0.0.Final.xml','2015-12-08 15:11:12',1,'EXECUTED','7:00a57f7a6fb456639b34e62972e0ec02','createTable (x29), addPrimaryKey (x21), addUniqueConstraint (x9), addForeignKeyConstraint (x32)','',NULL,'3.4.1',NULL,NULL),('1.1.0.Beta1','sthorger@redhat.com','META-INF/jpa-changelog-1.1.0.Beta1.xml','2015-12-08 15:11:12',2,'EXECUTED','7:0310eb8ba07cec616460794d42ade0fa','delete (x3), createTable (x3), addColumn (x5), addPrimaryKey (x3), addForeignKeyConstraint (x3), customChange','',NULL,'3.4.1',NULL,NULL),('1.1.0.Final','sthorger@redhat.com','META-INF/jpa-changelog-1.1.0.Final.xml','2015-12-08 15:11:12',3,'EXECUTED','7:5d25857e708c3233ef4439df1f93f012','renameColumn','',NULL,'3.4.1',NULL,NULL),('1.2.0.Beta1','psilva@redhat.com','META-INF/jpa-changelog-1.2.0.Beta1.xml','2015-12-08 15:11:14',4,'EXECUTED','7:c7a54a1041d58eb3817a4a883b4d4e84','delete (x4), createTable (x8), addColumn (x2), addPrimaryKey (x6), addForeignKeyConstraint (x9), addUniqueConstraint (x2), addColumn, dropForeignKeyConstraint (x2), dropUniqueConstraint, renameColumn (x3), addUniqueConstraint, addForeignKeyConstra...','',NULL,'3.4.1',NULL,NULL),('1.2.0.RC1','bburke@redhat.com','META-INF/jpa-changelog-1.2.0.CR1.xml','2015-12-08 15:11:16',5,'EXECUTED','7:0f08df48468428e0f30ee59a8ec01a41','delete (x5), createTable (x3), addColumn, createTable (x4), addPrimaryKey (x7), addForeignKeyConstraint (x6), renameColumn, addColumn (x2), update, dropColumn, dropForeignKeyConstraint, renameColumn, addForeignKeyConstraint, dropForeignKeyConstrai...','',NULL,'3.4.1',NULL,NULL),('1.2.0.Final','keycloak','META-INF/jpa-changelog-1.2.0.Final.xml','2015-12-08 15:11:16',6,'EXECUTED','7:a3377a2059aefbf3b90ebb4c4cc8e2ab','update (x3)','',NULL,'3.4.1',NULL,NULL),('1.3.0','bburke@redhat.com','META-INF/jpa-changelog-1.3.0.xml','2015-12-08 15:11:18',7,'EXECUTED','7:04c1dbedc2aa3e9756d1a1668e003451','delete (x6), createTable (x7), addColumn, createTable, addColumn (x2), update, dropDefaultValue, dropColumn, addColumn, update (x4), addPrimaryKey (x4), dropPrimaryKey, dropColumn, addPrimaryKey (x4), addForeignKeyConstraint (x8), dropDefaultValue...','',NULL,'3.4.1',NULL,NULL),('1.4.0','bburke@redhat.com','META-INF/jpa-changelog-1.4.0.xml','2015-12-08 15:11:19',8,'EXECUTED','7:36ef39ed560ad07062d956db861042ba','delete (x7), addColumn (x5), dropColumn, renameTable (x2), update (x10), createTable (x3), customChange, dropPrimaryKey, addPrimaryKey (x4), addForeignKeyConstraint (x2), dropColumn, addColumn','',NULL,'3.4.1',NULL,NULL),('1.5.0','bburke@redhat.com','META-INF/jpa-changelog-1.5.0.xml','2015-12-08 15:11:19',9,'EXECUTED','7:cf12b04b79bea5152f165eb41f3955f6','delete (x7), dropDefaultValue, dropColumn, addColumn (x3)','',NULL,'3.4.1',NULL,NULL),('1.6.1_from15','mposolda@redhat.com','META-INF/jpa-changelog-1.6.1.xml','2015-12-08 15:11:20',10,'EXECUTED','7:7e32c8f05c755e8675764e7d5f514509','addColumn (x3), createTable (x2), addPrimaryKey (x2)','',NULL,'3.4.1',NULL,NULL),('1.6.1_from16','mposolda@redhat.com','META-INF/jpa-changelog-1.6.1.xml','2015-12-08 15:11:20',11,'MARK_RAN','7:2fa220758991285312eb84f3b4ff5336','dropPrimaryKey (x2), addColumn, update, dropColumn, addColumn, update, dropColumn, addPrimaryKey (x2)','',NULL,'3.4.1',NULL,NULL),('1.6.1','mposolda@redhat.com','META-INF/jpa-changelog-1.6.1.xml','2015-12-08 15:11:20',12,'EXECUTED','7:d41d8cd98f00b204e9800998ecf8427e','Empty','',NULL,'3.4.1',NULL,NULL),('1.7.0','bburke@redhat.com','META-INF/jpa-changelog-1.7.0.xml','2015-12-08 15:11:21',13,'EXECUTED','7:91ace540896df890cc00a0490ee52bbc','createTable (x5), addColumn (x2), dropDefaultValue, dropColumn, addPrimaryKey, addForeignKeyConstraint, addPrimaryKey, addForeignKeyConstraint, addPrimaryKey, addForeignKeyConstraint, addPrimaryKey, addForeignKeyConstraint (x2), addUniqueConstrain...','',NULL,'3.4.1',NULL,NULL);
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
INSERT INTO `KEYCLOAK_ROLE` VALUES ('0291a364-0b17-4146-88cb-f61d335d56f3','84978901-d2c6-4a38-bbbb-f9cd54e5fe10','','${role_view-events}','view-events','master','84978901-d2c6-4a38-bbbb-f9cd54e5fe10',NULL,'\0'),('0474ee1c-ef26-40bb-a607-3e139688faab','571d349e-f297-423c-85a8-02043a6dced6','','${role_read-token}','read-token','itesoft','571d349e-f297-423c-85a8-02043a6dced6',NULL,'\0'),('06df5122-7251-415c-8e44-4a856e910768','2165c3e8-c375-4bb6-bc7a-072bdb04de07','','${role_impersonation}','impersonation','master','2165c3e8-c375-4bb6-bc7a-072bdb04de07',NULL,'\0'),('121f2686-48cd-4f1f-a276-832d688a1098','84978901-d2c6-4a38-bbbb-f9cd54e5fe10','','${role_impersonation}','impersonation','master','84978901-d2c6-4a38-bbbb-f9cd54e5fe10',NULL,'\0'),('19b5846c-cb31-4d7a-9ce9-ff9b6b4a3ffc','d49bf1e6-ec47-4abb-b78e-aac9d7fb4717','','${role_read-token}','read-token','master','d49bf1e6-ec47-4abb-b78e-aac9d7fb4717',NULL,'\0'),('19ce314c-51fc-4195-a9ba-3de53a8da914','2165c3e8-c375-4bb6-bc7a-072bdb04de07','','${role_manage-identity-providers}','manage-identity-providers','master','2165c3e8-c375-4bb6-bc7a-072bdb04de07',NULL,'\0'),('1aea95f9-ba60-42e3-b21a-a4f95bf0695b','2165c3e8-c375-4bb6-bc7a-072bdb04de07','','${role_manage-users}','manage-users','master','2165c3e8-c375-4bb6-bc7a-072bdb04de07',NULL,'\0'),('1b7b63b8-e7b8-4457-8dce-4023c86348c9','84978901-d2c6-4a38-bbbb-f9cd54e5fe10','','${role_view-clients}','view-clients','master','84978901-d2c6-4a38-bbbb-f9cd54e5fe10',NULL,'\0'),('23148457-9ea0-4c56-a349-ac29039f0171','59af5029-c076-40f8-9ba8-cc4a0bd09bd2','','${role_impersonation}','impersonation','itesoft','59af5029-c076-40f8-9ba8-cc4a0bd09bd2',NULL,'\0'),('2a608209-6294-477d-9ffb-3d936796e343','59af5029-c076-40f8-9ba8-cc4a0bd09bd2','','${role_manage-realm}','manage-realm','itesoft','59af5029-c076-40f8-9ba8-cc4a0bd09bd2',NULL,'\0'),('2be679ad-d56d-4e93-8344-936f14519f8d','master','\0','${role_admin}','admin','master',NULL,'master','\0'),('33224458-1e63-4c3e-9115-7a18fbf9a5f6','59af5029-c076-40f8-9ba8-cc4a0bd09bd2','','${role_view-clients}','view-clients','itesoft','59af5029-c076-40f8-9ba8-cc4a0bd09bd2',NULL,'\0'),('39566107-3ae2-4d29-af4f-63bf1f221b73','a32a134d-158b-4eda-af8e-3a2765e408e1','','${role_manage-account}','manage-account','itesoft','a32a134d-158b-4eda-af8e-3a2765e408e1',NULL,'\0'),('3f28ba6b-8766-4a33-be52-a6ad9782c2b3','master','\0','${role_offline-access}','offline_access','master',NULL,'master',''),('3faed298-1a70-4eaf-9b81-c1eb435e2093','itesoft','\0','${role_offline-access}','offline_access','itesoft',NULL,'itesoft',''),('40a8ead7-aa13-44a5-809f-78a00fc120fe','84978901-d2c6-4a38-bbbb-f9cd54e5fe10','','${role_view-identity-providers}','view-identity-providers','master','84978901-d2c6-4a38-bbbb-f9cd54e5fe10',NULL,'\0'),('4488171a-acb8-4569-87c3-b2039f1101dd','59af5029-c076-40f8-9ba8-cc4a0bd09bd2','','${role_create-client}','create-client','itesoft','59af5029-c076-40f8-9ba8-cc4a0bd09bd2',NULL,'\0'),('473ca9e5-d258-496c-9e10-04607ca97aff','2165c3e8-c375-4bb6-bc7a-072bdb04de07','','${role_view-users}','view-users','master','2165c3e8-c375-4bb6-bc7a-072bdb04de07',NULL,'\0'),('4eb75196-fc1f-4ea9-b48a-07127265fda4','59af5029-c076-40f8-9ba8-cc4a0bd09bd2','','${role_manage-clients}','manage-clients','itesoft','59af5029-c076-40f8-9ba8-cc4a0bd09bd2',NULL,'\0'),('5abc8d4e-c03f-41dc-90db-d55a62c13b38','2165c3e8-c375-4bb6-bc7a-072bdb04de07','','${role_view-identity-providers}','view-identity-providers','master','2165c3e8-c375-4bb6-bc7a-072bdb04de07',NULL,'\0'),('5b6ee4e2-fe2e-4a08-bf7c-58ca0fa5c279','2165c3e8-c375-4bb6-bc7a-072bdb04de07','','${role_manage-realm}','manage-realm','master','2165c3e8-c375-4bb6-bc7a-072bdb04de07',NULL,'\0'),('60f99db3-e411-47dd-ab35-45a4f69450fa','59af5029-c076-40f8-9ba8-cc4a0bd09bd2','','${role_manage-events}','manage-events','itesoft','59af5029-c076-40f8-9ba8-cc4a0bd09bd2',NULL,'\0'),('700ef8f7-dfc9-4a50-9a53-9453ea0a9fcc','59af5029-c076-40f8-9ba8-cc4a0bd09bd2','','${role_realm-admin}','realm-admin','itesoft','59af5029-c076-40f8-9ba8-cc4a0bd09bd2',NULL,'\0'),('7124b56f-32c9-4711-98c5-64d512bcbe6c','bd7e0a02-230a-4e98-bdad-820a26f315a2','','${role_manage-account}','manage-account','master','bd7e0a02-230a-4e98-bdad-820a26f315a2',NULL,'\0'),('76a4f713-5b87-4877-8a5b-5b0273d32f35','2165c3e8-c375-4bb6-bc7a-072bdb04de07','','${role_view-realm}','view-realm','master','2165c3e8-c375-4bb6-bc7a-072bdb04de07',NULL,'\0'),('87c32192-8cf5-4acf-8e3a-b8027a22f623','2165c3e8-c375-4bb6-bc7a-072bdb04de07','','${role_view-events}','view-events','master','2165c3e8-c375-4bb6-bc7a-072bdb04de07',NULL,'\0'),('8d9a0a75-0864-4409-a3b4-7d41f3d0aa15','59af5029-c076-40f8-9ba8-cc4a0bd09bd2','','${role_view-identity-providers}','view-identity-providers','itesoft','59af5029-c076-40f8-9ba8-cc4a0bd09bd2',NULL,'\0'),('8f82adb6-cb17-4ee1-ae4c-22594b051f32','2165c3e8-c375-4bb6-bc7a-072bdb04de07','','${role_manage-clients}','manage-clients','master','2165c3e8-c375-4bb6-bc7a-072bdb04de07',NULL,'\0'),('90024724-5d91-4e2e-a6dd-41b407927131','a32a134d-158b-4eda-af8e-3a2765e408e1','','${role_view-profile}','view-profile','itesoft','a32a134d-158b-4eda-af8e-3a2765e408e1',NULL,'\0'),('933c2790-ebb4-4be3-a2a7-43f9c736adaf','2165c3e8-c375-4bb6-bc7a-072bdb04de07','','${role_create-client}','create-client','master','2165c3e8-c375-4bb6-bc7a-072bdb04de07',NULL,'\0'),('99c92156-1bff-4748-8084-e8c053762f6a','bd7e0a02-230a-4e98-bdad-820a26f315a2','','${role_view-profile}','view-profile','master','bd7e0a02-230a-4e98-bdad-820a26f315a2',NULL,'\0'),('9deebdc2-3622-499e-8b9c-2ce2105a147e','84978901-d2c6-4a38-bbbb-f9cd54e5fe10','','${role_manage-realm}','manage-realm','master','84978901-d2c6-4a38-bbbb-f9cd54e5fe10',NULL,'\0'),('a137608c-2836-49f5-9b56-f4c718908f98','84978901-d2c6-4a38-bbbb-f9cd54e5fe10','','${role_manage-events}','manage-events','master','84978901-d2c6-4a38-bbbb-f9cd54e5fe10',NULL,'\0'),('a32970dc-ce26-4d72-b9a3-972ef0634b73','84978901-d2c6-4a38-bbbb-f9cd54e5fe10','','${role_manage-clients}','manage-clients','master','84978901-d2c6-4a38-bbbb-f9cd54e5fe10',NULL,'\0'),('a823060f-0be5-4714-9127-3fa31766c328','84978901-d2c6-4a38-bbbb-f9cd54e5fe10','','${role_create-client}','create-client','master','84978901-d2c6-4a38-bbbb-f9cd54e5fe10',NULL,'\0'),('aacd60a1-8272-472c-bb37-ae028bb6bbe4','59af5029-c076-40f8-9ba8-cc4a0bd09bd2','','${role_manage-identity-providers}','manage-identity-providers','itesoft','59af5029-c076-40f8-9ba8-cc4a0bd09bd2',NULL,'\0'),('bae0de65-7617-4130-a5b0-edb42c3bed22','84978901-d2c6-4a38-bbbb-f9cd54e5fe10','','${role_view-realm}','view-realm','master','84978901-d2c6-4a38-bbbb-f9cd54e5fe10',NULL,'\0'),('bc2db694-188f-4a7e-874d-3273fa74adba','84978901-d2c6-4a38-bbbb-f9cd54e5fe10','','${role_manage-identity-providers}','manage-identity-providers','master','84978901-d2c6-4a38-bbbb-f9cd54e5fe10',NULL,'\0'),('ca4cdbb6-30d9-4c7f-8d9b-9de0dd9de0e1','master','\0','${role_create-realm}','create-realm','master',NULL,'master','\0'),('cea98309-ba4d-4e34-8732-4f08065193db','59af5029-c076-40f8-9ba8-cc4a0bd09bd2','','${role_view-users}','view-users','itesoft','59af5029-c076-40f8-9ba8-cc4a0bd09bd2',NULL,'\0'),('d56e9b35-d646-42b0-895d-d310103d529f','84978901-d2c6-4a38-bbbb-f9cd54e5fe10','','${role_view-users}','view-users','master','84978901-d2c6-4a38-bbbb-f9cd54e5fe10',NULL,'\0'),('d95561cc-42f4-4fb7-bd36-76e29ca9c4fa','2165c3e8-c375-4bb6-bc7a-072bdb04de07','','${role_manage-events}','manage-events','master','2165c3e8-c375-4bb6-bc7a-072bdb04de07',NULL,'\0'),('dad28560-c0a0-4ce0-80e7-acafa19f04c7','59af5029-c076-40f8-9ba8-cc4a0bd09bd2','','${role_view-realm}','view-realm','itesoft','59af5029-c076-40f8-9ba8-cc4a0bd09bd2',NULL,'\0'),('e2710d41-0715-4dd9-aba0-fdc4da0ca6ff','84978901-d2c6-4a38-bbbb-f9cd54e5fe10','','${role_manage-users}','manage-users','master','84978901-d2c6-4a38-bbbb-f9cd54e5fe10',NULL,'\0'),('ee809472-8735-42fd-9d72-2bcc7f5a207e','2165c3e8-c375-4bb6-bc7a-072bdb04de07','','${role_view-clients}','view-clients','master','2165c3e8-c375-4bb6-bc7a-072bdb04de07',NULL,'\0'),('efc481d1-3ad5-4e89-875d-b9d0ff843812','59af5029-c076-40f8-9ba8-cc4a0bd09bd2','','${role_manage-users}','manage-users','itesoft','59af5029-c076-40f8-9ba8-cc4a0bd09bd2',NULL,'\0'),('f8b2b19d-7198-42c4-864d-4b587c94d83f','59af5029-c076-40f8-9ba8-cc4a0bd09bd2','','${role_view-events}','view-events','itesoft','59af5029-c076-40f8-9ba8-cc4a0bd09bd2',NULL,'\0');
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
INSERT INTO `PROTOCOL_MAPPER` VALUES ('01a83c86-da92-437c-ae1b-7453400ceaee','family name','openid-connect','oidc-usermodel-property-mapper','','${familyName}','4032f5ce-a5dd-45a1-91fc-6a7041a685f2'),('069189c7-3c99-404b-8609-ecba18d404dd','given name','openid-connect','oidc-usermodel-property-mapper','','${givenName}','8d3218d6-f904-4d28-845b-ef57eeef0c48'),('0b50111a-38a8-49bc-9ab7-f22877617f19','email','openid-connect','oidc-usermodel-property-mapper','','${email}','2165c3e8-c375-4bb6-bc7a-072bdb04de07'),('0eee504a-e70d-4e2c-a2bf-5b8eeca39497','email','openid-connect','oidc-usermodel-property-mapper','','${email}','84978901-d2c6-4a38-bbbb-f9cd54e5fe10'),('1035d878-593d-4418-90e7-59f1448982f1','role list','saml','saml-role-list-mapper','\0',NULL,'a32a134d-158b-4eda-af8e-3a2765e408e1'),('1113b936-0ef7-4124-aedb-f20becf9e5b3','full name','openid-connect','oidc-full-name-mapper','','${fullName}','a32a134d-158b-4eda-af8e-3a2765e408e1'),('1416e8a6-d89a-4098-94de-441db0ebfe73','email','openid-connect','oidc-usermodel-property-mapper','','${email}','bd7e0a02-230a-4e98-bdad-820a26f315a2'),('1561e84d-6a9d-47b0-a7a9-ca9d169c2543','given name','openid-connect','oidc-usermodel-property-mapper','','${givenName}','d49bf1e6-ec47-4abb-b78e-aac9d7fb4717'),('1853890b-3574-4c50-8267-8febe92b20b4','username','openid-connect','oidc-usermodel-property-mapper','','${username}','6a710a53-ee93-418c-9542-29318c681535'),('18aaf929-c981-4a5c-8a7d-8f75663145f5','family name','openid-connect','oidc-usermodel-property-mapper','','${familyName}','571d349e-f297-423c-85a8-02043a6dced6'),('2acb0fb5-a750-4dec-8325-a2dd4dbe2f94','email','openid-connect','oidc-usermodel-property-mapper','','${email}','59af5029-c076-40f8-9ba8-cc4a0bd09bd2'),('2c40a908-5e3b-4294-8cf0-f9b989deca2d','email','openid-connect','oidc-usermodel-property-mapper','','${email}','6a710a53-ee93-418c-9542-29318c681535'),('34436390-5eb9-4dd6-9077-246df4f5a555','family name','openid-connect','oidc-usermodel-property-mapper','','${familyName}','a32a134d-158b-4eda-af8e-3a2765e408e1'),('3c5ecc8b-66a0-4940-a82f-b84dd6a6c7b6','role list','saml','saml-role-list-mapper','\0',NULL,'84978901-d2c6-4a38-bbbb-f9cd54e5fe10'),('3cc1a484-068e-412c-909b-d98030cfa9f9','given name','openid-connect','oidc-usermodel-property-mapper','','${givenName}','2165c3e8-c375-4bb6-bc7a-072bdb04de07'),('3f99e219-c033-432d-92e2-0fc8c1b2e045','full name','openid-connect','oidc-full-name-mapper','','${fullName}','4032f5ce-a5dd-45a1-91fc-6a7041a685f2'),('412e1c68-1ae2-402a-a24b-888395db2b9e','email','openid-connect','oidc-usermodel-property-mapper','','${email}','571d349e-f297-423c-85a8-02043a6dced6'),('4ffdc8a1-2f64-4527-84d6-bcb7687b47f0','username','openid-connect','oidc-usermodel-property-mapper','','${username}','571d349e-f297-423c-85a8-02043a6dced6'),('525d478d-f6b9-4c65-a5ac-cef06d3c8f81','role list','saml','saml-role-list-mapper','\0',NULL,'bd7e0a02-230a-4e98-bdad-820a26f315a2'),('537ea662-47af-4c7f-8ce6-bb781a084242','full name','openid-connect','oidc-full-name-mapper','','${fullName}','59af5029-c076-40f8-9ba8-cc4a0bd09bd2'),('5c7711ad-7ddb-4967-a5ec-a0c973a1d584','full name','openid-connect','oidc-full-name-mapper','','${fullName}','6a710a53-ee93-418c-9542-29318c681535'),('5dfd6e60-765d-49c4-8fb6-73f7da90863e','full name','openid-connect','oidc-full-name-mapper','','${fullName}','8d3218d6-f904-4d28-845b-ef57eeef0c48'),('616f20b4-e7d2-4f81-bdff-b14e2be74d98','given name','openid-connect','oidc-usermodel-property-mapper','','${givenName}','bd7e0a02-230a-4e98-bdad-820a26f315a2'),('6376461b-ee08-4132-8846-a583e599e346','family name','openid-connect','oidc-usermodel-property-mapper','','${familyName}','2165c3e8-c375-4bb6-bc7a-072bdb04de07'),('6400d46a-b4d4-45f8-858b-4d47ec1a17e0','role list','saml','saml-role-list-mapper','\0',NULL,'571d349e-f297-423c-85a8-02043a6dced6'),('67adac33-12eb-476c-bfcf-d2a98acd009e','family name','openid-connect','oidc-usermodel-property-mapper','','${familyName}','59af5029-c076-40f8-9ba8-cc4a0bd09bd2'),('6c3e8d28-8f4a-4d83-a3b9-f8f3b8409169','given name','openid-connect','oidc-usermodel-property-mapper','','${givenName}','4032f5ce-a5dd-45a1-91fc-6a7041a685f2'),('6d596206-9137-4d17-8d2c-8493ace59337','role list','saml','saml-role-list-mapper','\0',NULL,'4032f5ce-a5dd-45a1-91fc-6a7041a685f2'),('6d77aaaa-c510-4ace-80e5-622932fc70d8','full name','openid-connect','oidc-full-name-mapper','','${fullName}','bd7e0a02-230a-4e98-bdad-820a26f315a2'),('7368bcca-11a8-47a6-8f1e-f7a0009b79b2','full name','openid-connect','oidc-full-name-mapper','','${fullName}','d49bf1e6-ec47-4abb-b78e-aac9d7fb4717'),('7fe9a207-bd85-475a-9701-a1cf34a2b251','role list','saml','saml-role-list-mapper','\0',NULL,'d49bf1e6-ec47-4abb-b78e-aac9d7fb4717'),('835ee34f-5e0a-436a-b5a8-e24452f08602','full name','openid-connect','oidc-full-name-mapper','','${fullName}','84978901-d2c6-4a38-bbbb-f9cd54e5fe10'),('85cbae4a-4874-4acf-9761-c44dffa2f912','role list','saml','saml-role-list-mapper','\0',NULL,'59af5029-c076-40f8-9ba8-cc4a0bd09bd2'),('8c6621e5-84e2-40ae-be0f-3fcc0f232352','locale','openid-connect','oidc-usermodel-attribute-mapper','\0','${locale}','6a710a53-ee93-418c-9542-29318c681535'),('937d8994-522e-4e4c-ac3f-5285cd937e71','email','openid-connect','oidc-usermodel-property-mapper','','${email}','8d3218d6-f904-4d28-845b-ef57eeef0c48'),('94359a62-3a30-4d6c-8a33-0ee9a954eeee','locale','openid-connect','oidc-usermodel-attribute-mapper','\0','${locale}','8d3218d6-f904-4d28-845b-ef57eeef0c48'),('9856d0f4-a897-47d2-9d07-927de0da18f8','given name','openid-connect','oidc-usermodel-property-mapper','','${givenName}','59af5029-c076-40f8-9ba8-cc4a0bd09bd2'),('986503f0-2fe1-48f7-9977-39595ab87ab2','full name','openid-connect','oidc-full-name-mapper','','${fullName}','ad5c7379-f4b8-4cbf-841e-deaeb6ddc267'),('99e96e45-ac3f-4a48-9a64-81c0049f5718','family name','openid-connect','oidc-usermodel-property-mapper','','${familyName}','d49bf1e6-ec47-4abb-b78e-aac9d7fb4717'),('9a83f3c3-1679-49f6-a0b8-be98e31fc717','username','openid-connect','oidc-usermodel-property-mapper','','${username}','59af5029-c076-40f8-9ba8-cc4a0bd09bd2'),('9ec878f5-3312-47d5-b5aa-ae7e5222ca62','username','openid-connect','oidc-usermodel-property-mapper','','${username}','d49bf1e6-ec47-4abb-b78e-aac9d7fb4717'),('a24738a6-f409-4195-b94a-459ad6d8e5ac','email','openid-connect','oidc-usermodel-property-mapper','','${email}','d49bf1e6-ec47-4abb-b78e-aac9d7fb4717'),('a4d497ec-00e4-44de-a7b2-d35534023975','family name','openid-connect','oidc-usermodel-property-mapper','','${familyName}','6a710a53-ee93-418c-9542-29318c681535'),('a79afe6a-8d4c-4fab-b17d-7b2908af629b','username','openid-connect','oidc-usermodel-property-mapper','','${username}','84978901-d2c6-4a38-bbbb-f9cd54e5fe10'),('a903a293-ff90-4459-984a-81a7bf9bd074','username','openid-connect','oidc-usermodel-property-mapper','','${username}','4032f5ce-a5dd-45a1-91fc-6a7041a685f2'),('aa061f5c-985e-4a69-aae8-5d7af8878f43','given name','openid-connect','oidc-usermodel-property-mapper','','${givenName}','571d349e-f297-423c-85a8-02043a6dced6'),('ae569638-def1-409b-9c34-c4f6891e8354','given name','openid-connect','oidc-usermodel-property-mapper','','${givenName}','ad5c7379-f4b8-4cbf-841e-deaeb6ddc267'),('af6f28ea-69e8-4b49-b620-41937d627c0c','family name','openid-connect','oidc-usermodel-property-mapper','','${familyName}','84978901-d2c6-4a38-bbbb-f9cd54e5fe10'),('b0d73fc2-5c3a-4851-9f7c-337f024582a6','given name','openid-connect','oidc-usermodel-property-mapper','','${givenName}','6a710a53-ee93-418c-9542-29318c681535'),('b2ec069b-7d56-43e5-bb89-d39ba8db9a03','family name','openid-connect','oidc-usermodel-property-mapper','','${familyName}','8d3218d6-f904-4d28-845b-ef57eeef0c48'),('b72014e2-2579-4ae3-ad60-dd171ecc7662','username','openid-connect','oidc-usermodel-property-mapper','','${username}','bd7e0a02-230a-4e98-bdad-820a26f315a2'),('b81bb84b-e4cb-4a5b-b5bd-333eab431fb7','role list','saml','saml-role-list-mapper','\0',NULL,'ad5c7379-f4b8-4cbf-841e-deaeb6ddc267'),('b96448b5-1ba5-403a-bef4-0d07b3fe3f50','given name','openid-connect','oidc-usermodel-property-mapper','','${givenName}','a32a134d-158b-4eda-af8e-3a2765e408e1'),('ba64c60f-daf0-4966-9134-a35744ce872f','given name','openid-connect','oidc-usermodel-property-mapper','','${givenName}','84978901-d2c6-4a38-bbbb-f9cd54e5fe10'),('bb3bc0bf-4408-42d9-8762-8e4d1117cc95','role list','saml','saml-role-list-mapper','\0',NULL,'2165c3e8-c375-4bb6-bc7a-072bdb04de07'),('c03cab2d-b2e5-4a07-97d0-01181dc4ce4f','family name','openid-connect','oidc-usermodel-property-mapper','','${familyName}','bd7e0a02-230a-4e98-bdad-820a26f315a2'),('c0f259ea-9381-48a4-9cf8-df224f6027b4','username','openid-connect','oidc-usermodel-property-mapper','','${username}','8d3218d6-f904-4d28-845b-ef57eeef0c48'),('c4744cc5-aa66-404d-b6a2-250a1c2a337f','email','openid-connect','oidc-usermodel-property-mapper','','${email}','a32a134d-158b-4eda-af8e-3a2765e408e1'),('c5375ffd-59f1-4537-a79c-669f661764f6','full name','openid-connect','oidc-full-name-mapper','','${fullName}','2165c3e8-c375-4bb6-bc7a-072bdb04de07'),('cda431e1-9054-4fdc-bdbe-996fde179173','email','openid-connect','oidc-usermodel-property-mapper','','${email}','ad5c7379-f4b8-4cbf-841e-deaeb6ddc267'),('cdcd1e3f-07f0-4d78-a95a-8ebd248e08a1','username','openid-connect','oidc-usermodel-property-mapper','','${username}','a32a134d-158b-4eda-af8e-3a2765e408e1'),('cf0318b2-7a66-4acb-b278-c7f4db59d271','username','openid-connect','oidc-usermodel-property-mapper','','${username}','2165c3e8-c375-4bb6-bc7a-072bdb04de07'),('d448c71a-b68a-42eb-ae1c-4a117da54676','email','openid-connect','oidc-usermodel-property-mapper','','${email}','4032f5ce-a5dd-45a1-91fc-6a7041a685f2'),('dc2458f8-ab6b-4b8b-bf75-b1ded8162691','role list','saml','saml-role-list-mapper','\0',NULL,'6a710a53-ee93-418c-9542-29318c681535'),('dfeff558-c506-44a6-ba37-cdbde213e36c','full name','openid-connect','oidc-full-name-mapper','','${fullName}','571d349e-f297-423c-85a8-02043a6dced6'),('e02b012c-3185-4bd7-9186-bd77fc32f248','role list','saml','saml-role-list-mapper','\0',NULL,'8d3218d6-f904-4d28-845b-ef57eeef0c48'),('ed310ae1-b9ea-4945-83e1-7620a71f1f93','family name','openid-connect','oidc-usermodel-property-mapper','','${familyName}','ad5c7379-f4b8-4cbf-841e-deaeb6ddc267'),('f0393076-40c4-4261-8698-f2f9ebb23dca','username','openid-connect','oidc-usermodel-property-mapper','','${username}','ad5c7379-f4b8-4cbf-841e-deaeb6ddc267');
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
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('01a83c86-da92-437c-ae1b-7453400ceaee','true','access.token.claim'),('01a83c86-da92-437c-ae1b-7453400ceaee','family_name','claim.name'),('01a83c86-da92-437c-ae1b-7453400ceaee','true','id.token.claim'),('01a83c86-da92-437c-ae1b-7453400ceaee','String','jsonType.label'),('01a83c86-da92-437c-ae1b-7453400ceaee','lastName','user.attribute'),('069189c7-3c99-404b-8609-ecba18d404dd','true','access.token.claim'),('069189c7-3c99-404b-8609-ecba18d404dd','given_name','claim.name'),('069189c7-3c99-404b-8609-ecba18d404dd','true','id.token.claim'),('069189c7-3c99-404b-8609-ecba18d404dd','String','jsonType.label'),('069189c7-3c99-404b-8609-ecba18d404dd','firstName','user.attribute'),('0b50111a-38a8-49bc-9ab7-f22877617f19','true','access.token.claim'),('0b50111a-38a8-49bc-9ab7-f22877617f19','email','claim.name'),('0b50111a-38a8-49bc-9ab7-f22877617f19','true','id.token.claim'),('0b50111a-38a8-49bc-9ab7-f22877617f19','String','jsonType.label'),('0b50111a-38a8-49bc-9ab7-f22877617f19','email','user.attribute'),('0eee504a-e70d-4e2c-a2bf-5b8eeca39497','true','access.token.claim'),('0eee504a-e70d-4e2c-a2bf-5b8eeca39497','email','claim.name'),('0eee504a-e70d-4e2c-a2bf-5b8eeca39497','true','id.token.claim'),('0eee504a-e70d-4e2c-a2bf-5b8eeca39497','String','jsonType.label'),('0eee504a-e70d-4e2c-a2bf-5b8eeca39497','email','user.attribute'),('1035d878-593d-4418-90e7-59f1448982f1','Role','attribute.name'),('1035d878-593d-4418-90e7-59f1448982f1','Basic','attribute.nameformat'),('1035d878-593d-4418-90e7-59f1448982f1','false','single'),('1113b936-0ef7-4124-aedb-f20becf9e5b3','true','access.token.claim'),('1113b936-0ef7-4124-aedb-f20becf9e5b3','true','id.token.claim'),('1416e8a6-d89a-4098-94de-441db0ebfe73','true','access.token.claim'),('1416e8a6-d89a-4098-94de-441db0ebfe73','email','claim.name'),('1416e8a6-d89a-4098-94de-441db0ebfe73','true','id.token.claim'),('1416e8a6-d89a-4098-94de-441db0ebfe73','String','jsonType.label'),('1416e8a6-d89a-4098-94de-441db0ebfe73','email','user.attribute'),('1561e84d-6a9d-47b0-a7a9-ca9d169c2543','true','access.token.claim'),('1561e84d-6a9d-47b0-a7a9-ca9d169c2543','given_name','claim.name'),('1561e84d-6a9d-47b0-a7a9-ca9d169c2543','true','id.token.claim'),('1561e84d-6a9d-47b0-a7a9-ca9d169c2543','String','jsonType.label'),('1561e84d-6a9d-47b0-a7a9-ca9d169c2543','firstName','user.attribute'),('1853890b-3574-4c50-8267-8febe92b20b4','true','access.token.claim'),('1853890b-3574-4c50-8267-8febe92b20b4','preferred_username','claim.name'),('1853890b-3574-4c50-8267-8febe92b20b4','true','id.token.claim'),('1853890b-3574-4c50-8267-8febe92b20b4','String','jsonType.label'),('1853890b-3574-4c50-8267-8febe92b20b4','username','user.attribute'),('18aaf929-c981-4a5c-8a7d-8f75663145f5','true','access.token.claim'),('18aaf929-c981-4a5c-8a7d-8f75663145f5','family_name','claim.name'),('18aaf929-c981-4a5c-8a7d-8f75663145f5','true','id.token.claim'),('18aaf929-c981-4a5c-8a7d-8f75663145f5','String','jsonType.label'),('18aaf929-c981-4a5c-8a7d-8f75663145f5','lastName','user.attribute'),('2acb0fb5-a750-4dec-8325-a2dd4dbe2f94','true','access.token.claim'),('2acb0fb5-a750-4dec-8325-a2dd4dbe2f94','email','claim.name'),('2acb0fb5-a750-4dec-8325-a2dd4dbe2f94','true','id.token.claim'),('2acb0fb5-a750-4dec-8325-a2dd4dbe2f94','String','jsonType.label'),('2acb0fb5-a750-4dec-8325-a2dd4dbe2f94','email','user.attribute'),('2c40a908-5e3b-4294-8cf0-f9b989deca2d','true','access.token.claim'),('2c40a908-5e3b-4294-8cf0-f9b989deca2d','email','claim.name'),('2c40a908-5e3b-4294-8cf0-f9b989deca2d','true','id.token.claim'),('2c40a908-5e3b-4294-8cf0-f9b989deca2d','String','jsonType.label'),('2c40a908-5e3b-4294-8cf0-f9b989deca2d','email','user.attribute'),('34436390-5eb9-4dd6-9077-246df4f5a555','true','access.token.claim'),('34436390-5eb9-4dd6-9077-246df4f5a555','family_name','claim.name'),('34436390-5eb9-4dd6-9077-246df4f5a555','true','id.token.claim'),('34436390-5eb9-4dd6-9077-246df4f5a555','String','jsonType.label'),('34436390-5eb9-4dd6-9077-246df4f5a555','lastName','user.attribute'),('3c5ecc8b-66a0-4940-a82f-b84dd6a6c7b6','Role','attribute.name'),('3c5ecc8b-66a0-4940-a82f-b84dd6a6c7b6','Basic','attribute.nameformat'),('3c5ecc8b-66a0-4940-a82f-b84dd6a6c7b6','false','single'),('3cc1a484-068e-412c-909b-d98030cfa9f9','true','access.token.claim'),('3cc1a484-068e-412c-909b-d98030cfa9f9','given_name','claim.name'),('3cc1a484-068e-412c-909b-d98030cfa9f9','true','id.token.claim'),('3cc1a484-068e-412c-909b-d98030cfa9f9','String','jsonType.label'),('3cc1a484-068e-412c-909b-d98030cfa9f9','firstName','user.attribute'),('3f99e219-c033-432d-92e2-0fc8c1b2e045','true','access.token.claim'),('3f99e219-c033-432d-92e2-0fc8c1b2e045','true','id.token.claim'),('412e1c68-1ae2-402a-a24b-888395db2b9e','true','access.token.claim'),('412e1c68-1ae2-402a-a24b-888395db2b9e','email','claim.name'),('412e1c68-1ae2-402a-a24b-888395db2b9e','true','id.token.claim'),('412e1c68-1ae2-402a-a24b-888395db2b9e','String','jsonType.label'),('412e1c68-1ae2-402a-a24b-888395db2b9e','email','user.attribute'),('4ffdc8a1-2f64-4527-84d6-bcb7687b47f0','true','access.token.claim'),('4ffdc8a1-2f64-4527-84d6-bcb7687b47f0','preferred_username','claim.name'),('4ffdc8a1-2f64-4527-84d6-bcb7687b47f0','true','id.token.claim'),('4ffdc8a1-2f64-4527-84d6-bcb7687b47f0','String','jsonType.label'),('4ffdc8a1-2f64-4527-84d6-bcb7687b47f0','username','user.attribute'),('525d478d-f6b9-4c65-a5ac-cef06d3c8f81','Role','attribute.name'),('525d478d-f6b9-4c65-a5ac-cef06d3c8f81','Basic','attribute.nameformat'),('525d478d-f6b9-4c65-a5ac-cef06d3c8f81','false','single'),('537ea662-47af-4c7f-8ce6-bb781a084242','true','access.token.claim'),('537ea662-47af-4c7f-8ce6-bb781a084242','true','id.token.claim'),('5c7711ad-7ddb-4967-a5ec-a0c973a1d584','true','access.token.claim'),('5c7711ad-7ddb-4967-a5ec-a0c973a1d584','true','id.token.claim'),('5dfd6e60-765d-49c4-8fb6-73f7da90863e','true','access.token.claim'),('5dfd6e60-765d-49c4-8fb6-73f7da90863e','true','id.token.claim'),('616f20b4-e7d2-4f81-bdff-b14e2be74d98','true','access.token.claim'),('616f20b4-e7d2-4f81-bdff-b14e2be74d98','given_name','claim.name'),('616f20b4-e7d2-4f81-bdff-b14e2be74d98','true','id.token.claim'),('616f20b4-e7d2-4f81-bdff-b14e2be74d98','String','jsonType.label'),('616f20b4-e7d2-4f81-bdff-b14e2be74d98','firstName','user.attribute'),('6376461b-ee08-4132-8846-a583e599e346','true','access.token.claim'),('6376461b-ee08-4132-8846-a583e599e346','family_name','claim.name'),('6376461b-ee08-4132-8846-a583e599e346','true','id.token.claim'),('6376461b-ee08-4132-8846-a583e599e346','String','jsonType.label'),('6376461b-ee08-4132-8846-a583e599e346','lastName','user.attribute'),('6400d46a-b4d4-45f8-858b-4d47ec1a17e0','Role','attribute.name'),('6400d46a-b4d4-45f8-858b-4d47ec1a17e0','Basic','attribute.nameformat'),('6400d46a-b4d4-45f8-858b-4d47ec1a17e0','false','single'),('67adac33-12eb-476c-bfcf-d2a98acd009e','true','access.token.claim'),('67adac33-12eb-476c-bfcf-d2a98acd009e','family_name','claim.name'),('67adac33-12eb-476c-bfcf-d2a98acd009e','true','id.token.claim'),('67adac33-12eb-476c-bfcf-d2a98acd009e','String','jsonType.label'),('67adac33-12eb-476c-bfcf-d2a98acd009e','lastName','user.attribute'),('6c3e8d28-8f4a-4d83-a3b9-f8f3b8409169','true','access.token.claim'),('6c3e8d28-8f4a-4d83-a3b9-f8f3b8409169','given_name','claim.name'),('6c3e8d28-8f4a-4d83-a3b9-f8f3b8409169','true','id.token.claim'),('6c3e8d28-8f4a-4d83-a3b9-f8f3b8409169','String','jsonType.label'),('6c3e8d28-8f4a-4d83-a3b9-f8f3b8409169','firstName','user.attribute'),('6d596206-9137-4d17-8d2c-8493ace59337','Role','attribute.name'),('6d596206-9137-4d17-8d2c-8493ace59337','Basic','attribute.nameformat'),('6d596206-9137-4d17-8d2c-8493ace59337','false','single'),('6d77aaaa-c510-4ace-80e5-622932fc70d8','true','access.token.claim'),('6d77aaaa-c510-4ace-80e5-622932fc70d8','true','id.token.claim'),('7368bcca-11a8-47a6-8f1e-f7a0009b79b2','true','access.token.claim'),('7368bcca-11a8-47a6-8f1e-f7a0009b79b2','true','id.token.claim'),('7fe9a207-bd85-475a-9701-a1cf34a2b251','Role','attribute.name'),('7fe9a207-bd85-475a-9701-a1cf34a2b251','Basic','attribute.nameformat'),('7fe9a207-bd85-475a-9701-a1cf34a2b251','false','single'),('835ee34f-5e0a-436a-b5a8-e24452f08602','true','access.token.claim'),('835ee34f-5e0a-436a-b5a8-e24452f08602','true','id.token.claim'),('85cbae4a-4874-4acf-9761-c44dffa2f912','Role','attribute.name'),('85cbae4a-4874-4acf-9761-c44dffa2f912','Basic','attribute.nameformat'),('85cbae4a-4874-4acf-9761-c44dffa2f912','false','single'),('8c6621e5-84e2-40ae-be0f-3fcc0f232352','true','access.token.claim'),('8c6621e5-84e2-40ae-be0f-3fcc0f232352','locale','claim.name'),('8c6621e5-84e2-40ae-be0f-3fcc0f232352','true','id.token.claim'),('8c6621e5-84e2-40ae-be0f-3fcc0f232352','String','jsonType.label'),('8c6621e5-84e2-40ae-be0f-3fcc0f232352','locale','user.attribute'),('937d8994-522e-4e4c-ac3f-5285cd937e71','true','access.token.claim'),('937d8994-522e-4e4c-ac3f-5285cd937e71','email','claim.name'),('937d8994-522e-4e4c-ac3f-5285cd937e71','true','id.token.claim'),('937d8994-522e-4e4c-ac3f-5285cd937e71','String','jsonType.label'),('937d8994-522e-4e4c-ac3f-5285cd937e71','email','user.attribute'),('94359a62-3a30-4d6c-8a33-0ee9a954eeee','true','access.token.claim'),('94359a62-3a30-4d6c-8a33-0ee9a954eeee','locale','claim.name'),('94359a62-3a30-4d6c-8a33-0ee9a954eeee','true','id.token.claim'),('94359a62-3a30-4d6c-8a33-0ee9a954eeee','String','jsonType.label'),('94359a62-3a30-4d6c-8a33-0ee9a954eeee','locale','user.attribute'),('9856d0f4-a897-47d2-9d07-927de0da18f8','true','access.token.claim'),('9856d0f4-a897-47d2-9d07-927de0da18f8','given_name','claim.name'),('9856d0f4-a897-47d2-9d07-927de0da18f8','true','id.token.claim'),('9856d0f4-a897-47d2-9d07-927de0da18f8','String','jsonType.label'),('9856d0f4-a897-47d2-9d07-927de0da18f8','firstName','user.attribute'),('986503f0-2fe1-48f7-9977-39595ab87ab2','true','access.token.claim'),('986503f0-2fe1-48f7-9977-39595ab87ab2','true','id.token.claim'),('99e96e45-ac3f-4a48-9a64-81c0049f5718','true','access.token.claim'),('99e96e45-ac3f-4a48-9a64-81c0049f5718','family_name','claim.name'),('99e96e45-ac3f-4a48-9a64-81c0049f5718','true','id.token.claim'),('99e96e45-ac3f-4a48-9a64-81c0049f5718','String','jsonType.label'),('99e96e45-ac3f-4a48-9a64-81c0049f5718','lastName','user.attribute'),('9a83f3c3-1679-49f6-a0b8-be98e31fc717','true','access.token.claim'),('9a83f3c3-1679-49f6-a0b8-be98e31fc717','preferred_username','claim.name'),('9a83f3c3-1679-49f6-a0b8-be98e31fc717','true','id.token.claim'),('9a83f3c3-1679-49f6-a0b8-be98e31fc717','String','jsonType.label'),('9a83f3c3-1679-49f6-a0b8-be98e31fc717','username','user.attribute'),('9ec878f5-3312-47d5-b5aa-ae7e5222ca62','true','access.token.claim'),('9ec878f5-3312-47d5-b5aa-ae7e5222ca62','preferred_username','claim.name'),('9ec878f5-3312-47d5-b5aa-ae7e5222ca62','true','id.token.claim'),('9ec878f5-3312-47d5-b5aa-ae7e5222ca62','String','jsonType.label'),('9ec878f5-3312-47d5-b5aa-ae7e5222ca62','username','user.attribute'),('a24738a6-f409-4195-b94a-459ad6d8e5ac','true','access.token.claim'),('a24738a6-f409-4195-b94a-459ad6d8e5ac','email','claim.name'),('a24738a6-f409-4195-b94a-459ad6d8e5ac','true','id.token.claim'),('a24738a6-f409-4195-b94a-459ad6d8e5ac','String','jsonType.label'),('a24738a6-f409-4195-b94a-459ad6d8e5ac','email','user.attribute'),('a4d497ec-00e4-44de-a7b2-d35534023975','true','access.token.claim'),('a4d497ec-00e4-44de-a7b2-d35534023975','family_name','claim.name'),('a4d497ec-00e4-44de-a7b2-d35534023975','true','id.token.claim'),('a4d497ec-00e4-44de-a7b2-d35534023975','String','jsonType.label'),('a4d497ec-00e4-44de-a7b2-d35534023975','lastName','user.attribute'),('a79afe6a-8d4c-4fab-b17d-7b2908af629b','true','access.token.claim'),('a79afe6a-8d4c-4fab-b17d-7b2908af629b','preferred_username','claim.name'),('a79afe6a-8d4c-4fab-b17d-7b2908af629b','true','id.token.claim'),('a79afe6a-8d4c-4fab-b17d-7b2908af629b','String','jsonType.label'),('a79afe6a-8d4c-4fab-b17d-7b2908af629b','username','user.attribute'),('a903a293-ff90-4459-984a-81a7bf9bd074','true','access.token.claim'),('a903a293-ff90-4459-984a-81a7bf9bd074','preferred_username','claim.name'),('a903a293-ff90-4459-984a-81a7bf9bd074','true','id.token.claim'),('a903a293-ff90-4459-984a-81a7bf9bd074','String','jsonType.label'),('a903a293-ff90-4459-984a-81a7bf9bd074','username','user.attribute'),('aa061f5c-985e-4a69-aae8-5d7af8878f43','true','access.token.claim'),('aa061f5c-985e-4a69-aae8-5d7af8878f43','given_name','claim.name'),('aa061f5c-985e-4a69-aae8-5d7af8878f43','true','id.token.claim'),('aa061f5c-985e-4a69-aae8-5d7af8878f43','String','jsonType.label'),('aa061f5c-985e-4a69-aae8-5d7af8878f43','firstName','user.attribute'),('ae569638-def1-409b-9c34-c4f6891e8354','true','access.token.claim'),('ae569638-def1-409b-9c34-c4f6891e8354','given_name','claim.name'),('ae569638-def1-409b-9c34-c4f6891e8354','true','id.token.claim'),('ae569638-def1-409b-9c34-c4f6891e8354','String','jsonType.label'),('ae569638-def1-409b-9c34-c4f6891e8354','firstName','user.attribute'),('af6f28ea-69e8-4b49-b620-41937d627c0c','true','access.token.claim'),('af6f28ea-69e8-4b49-b620-41937d627c0c','family_name','claim.name'),('af6f28ea-69e8-4b49-b620-41937d627c0c','true','id.token.claim'),('af6f28ea-69e8-4b49-b620-41937d627c0c','String','jsonType.label'),('af6f28ea-69e8-4b49-b620-41937d627c0c','lastName','user.attribute'),('b0d73fc2-5c3a-4851-9f7c-337f024582a6','true','access.token.claim'),('b0d73fc2-5c3a-4851-9f7c-337f024582a6','given_name','claim.name'),('b0d73fc2-5c3a-4851-9f7c-337f024582a6','true','id.token.claim'),('b0d73fc2-5c3a-4851-9f7c-337f024582a6','String','jsonType.label'),('b0d73fc2-5c3a-4851-9f7c-337f024582a6','firstName','user.attribute'),('b2ec069b-7d56-43e5-bb89-d39ba8db9a03','true','access.token.claim'),('b2ec069b-7d56-43e5-bb89-d39ba8db9a03','family_name','claim.name'),('b2ec069b-7d56-43e5-bb89-d39ba8db9a03','true','id.token.claim'),('b2ec069b-7d56-43e5-bb89-d39ba8db9a03','String','jsonType.label'),('b2ec069b-7d56-43e5-bb89-d39ba8db9a03','lastName','user.attribute'),('b72014e2-2579-4ae3-ad60-dd171ecc7662','true','access.token.claim'),('b72014e2-2579-4ae3-ad60-dd171ecc7662','preferred_username','claim.name'),('b72014e2-2579-4ae3-ad60-dd171ecc7662','true','id.token.claim'),('b72014e2-2579-4ae3-ad60-dd171ecc7662','String','jsonType.label'),('b72014e2-2579-4ae3-ad60-dd171ecc7662','username','user.attribute'),('b81bb84b-e4cb-4a5b-b5bd-333eab431fb7','Role','attribute.name'),('b81bb84b-e4cb-4a5b-b5bd-333eab431fb7','Basic','attribute.nameformat'),('b81bb84b-e4cb-4a5b-b5bd-333eab431fb7','false','single'),('b96448b5-1ba5-403a-bef4-0d07b3fe3f50','true','access.token.claim'),('b96448b5-1ba5-403a-bef4-0d07b3fe3f50','given_name','claim.name'),('b96448b5-1ba5-403a-bef4-0d07b3fe3f50','true','id.token.claim'),('b96448b5-1ba5-403a-bef4-0d07b3fe3f50','String','jsonType.label'),('b96448b5-1ba5-403a-bef4-0d07b3fe3f50','firstName','user.attribute'),('ba64c60f-daf0-4966-9134-a35744ce872f','true','access.token.claim'),('ba64c60f-daf0-4966-9134-a35744ce872f','given_name','claim.name'),('ba64c60f-daf0-4966-9134-a35744ce872f','true','id.token.claim'),('ba64c60f-daf0-4966-9134-a35744ce872f','String','jsonType.label'),('ba64c60f-daf0-4966-9134-a35744ce872f','firstName','user.attribute'),('bb3bc0bf-4408-42d9-8762-8e4d1117cc95','Role','attribute.name'),('bb3bc0bf-4408-42d9-8762-8e4d1117cc95','Basic','attribute.nameformat'),('bb3bc0bf-4408-42d9-8762-8e4d1117cc95','false','single'),('c03cab2d-b2e5-4a07-97d0-01181dc4ce4f','true','access.token.claim'),('c03cab2d-b2e5-4a07-97d0-01181dc4ce4f','family_name','claim.name'),('c03cab2d-b2e5-4a07-97d0-01181dc4ce4f','true','id.token.claim'),('c03cab2d-b2e5-4a07-97d0-01181dc4ce4f','String','jsonType.label'),('c03cab2d-b2e5-4a07-97d0-01181dc4ce4f','lastName','user.attribute'),('c0f259ea-9381-48a4-9cf8-df224f6027b4','true','access.token.claim'),('c0f259ea-9381-48a4-9cf8-df224f6027b4','preferred_username','claim.name'),('c0f259ea-9381-48a4-9cf8-df224f6027b4','true','id.token.claim'),('c0f259ea-9381-48a4-9cf8-df224f6027b4','String','jsonType.label'),('c0f259ea-9381-48a4-9cf8-df224f6027b4','username','user.attribute'),('c4744cc5-aa66-404d-b6a2-250a1c2a337f','true','access.token.claim'),('c4744cc5-aa66-404d-b6a2-250a1c2a337f','email','claim.name'),('c4744cc5-aa66-404d-b6a2-250a1c2a337f','true','id.token.claim'),('c4744cc5-aa66-404d-b6a2-250a1c2a337f','String','jsonType.label'),('c4744cc5-aa66-404d-b6a2-250a1c2a337f','email','user.attribute'),('c5375ffd-59f1-4537-a79c-669f661764f6','true','access.token.claim'),('c5375ffd-59f1-4537-a79c-669f661764f6','true','id.token.claim'),('cda431e1-9054-4fdc-bdbe-996fde179173','true','access.token.claim'),('cda431e1-9054-4fdc-bdbe-996fde179173','email','claim.name'),('cda431e1-9054-4fdc-bdbe-996fde179173','true','id.token.claim'),('cda431e1-9054-4fdc-bdbe-996fde179173','String','jsonType.label'),('cda431e1-9054-4fdc-bdbe-996fde179173','email','user.attribute'),('cdcd1e3f-07f0-4d78-a95a-8ebd248e08a1','true','access.token.claim'),('cdcd1e3f-07f0-4d78-a95a-8ebd248e08a1','preferred_username','claim.name'),('cdcd1e3f-07f0-4d78-a95a-8ebd248e08a1','true','id.token.claim'),('cdcd1e3f-07f0-4d78-a95a-8ebd248e08a1','String','jsonType.label'),('cdcd1e3f-07f0-4d78-a95a-8ebd248e08a1','username','user.attribute'),('cf0318b2-7a66-4acb-b278-c7f4db59d271','true','access.token.claim'),('cf0318b2-7a66-4acb-b278-c7f4db59d271','preferred_username','claim.name'),('cf0318b2-7a66-4acb-b278-c7f4db59d271','true','id.token.claim'),('cf0318b2-7a66-4acb-b278-c7f4db59d271','String','jsonType.label'),('cf0318b2-7a66-4acb-b278-c7f4db59d271','username','user.attribute'),('d448c71a-b68a-42eb-ae1c-4a117da54676','true','access.token.claim'),('d448c71a-b68a-42eb-ae1c-4a117da54676','email','claim.name'),('d448c71a-b68a-42eb-ae1c-4a117da54676','true','id.token.claim'),('d448c71a-b68a-42eb-ae1c-4a117da54676','String','jsonType.label'),('d448c71a-b68a-42eb-ae1c-4a117da54676','email','user.attribute'),('dc2458f8-ab6b-4b8b-bf75-b1ded8162691','Role','attribute.name'),('dc2458f8-ab6b-4b8b-bf75-b1ded8162691','Basic','attribute.nameformat'),('dc2458f8-ab6b-4b8b-bf75-b1ded8162691','false','single'),('dfeff558-c506-44a6-ba37-cdbde213e36c','true','access.token.claim'),('dfeff558-c506-44a6-ba37-cdbde213e36c','true','id.token.claim'),('e02b012c-3185-4bd7-9186-bd77fc32f248','Role','attribute.name'),('e02b012c-3185-4bd7-9186-bd77fc32f248','Basic','attribute.nameformat'),('e02b012c-3185-4bd7-9186-bd77fc32f248','false','single'),('ed310ae1-b9ea-4945-83e1-7620a71f1f93','true','access.token.claim'),('ed310ae1-b9ea-4945-83e1-7620a71f1f93','family_name','claim.name'),('ed310ae1-b9ea-4945-83e1-7620a71f1f93','true','id.token.claim'),('ed310ae1-b9ea-4945-83e1-7620a71f1f93','String','jsonType.label'),('ed310ae1-b9ea-4945-83e1-7620a71f1f93','lastName','user.attribute'),('f0393076-40c4-4261-8698-f2f9ebb23dca','true','access.token.claim'),('f0393076-40c4-4261-8698-f2f9ebb23dca','preferred_username','claim.name'),('f0393076-40c4-4261-8698-f2f9ebb23dca','true','id.token.claim'),('f0393076-40c4-4261-8698-f2f9ebb23dca','String','jsonType.label'),('f0393076-40c4-4261-8698-f2f9ebb23dca','username','user.attribute');
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
INSERT INTO `REALM` VALUES ('itesoft',60,300,300,NULL,NULL,NULL,'','\0',0,NULL,'itesoft',0,NULL,'MIIEowIBAAKCAQEA/EzFMchQ4x7/ZPz6S6SzJM6kyhU/vaKUjE1oKZHtsl7FIUsqEYSdEUjUqodzOxUqh3OueWMC2ob7IKaowyhgj7FFYCdB1ih8Wjii3OxjIfrf74eWzNQXdbP3AWiEvIKMsj+dqp/iDky7jIeF2fu5IeBgSmdyKu9lnHxuFantCQbhfqrZHlrtYbw/cvv9hN2QZADvL+FuoWGbi/QznU8DizqYLOrUpXY+W/7qeY0q9a3yYEY1UxJvNdNIiaxdB2biDs/z9+pw9z28lLT+1cAdjDF2asvz2jBcffWM/4SFGBy5wkOJAE0GVJ2r0YbvRPGBFH8VjbZSS1qJivCGzxveDwIDAQABAoIBAQDFnkhTDwk0bQI0kuZmO5JKQUXYN76eher+3l65OOFK9mpIArznzczNThOtorzCSXjvcc/2qnQAwPuQ/plvi3/e7UZe40DxQvLsJDKFAu8/HWcsEjMvKu1ZN2ZBByH5GfSkZanUjLke5EF++GQCcuX2v+4MOWy2bp9TbC857siIaPozYNSKY9kA1kA1n7rVH7esbTIOFZmh8wV9PId9XTMq4+0j1N3070Qbd7tpJUQAyC24ikgzXIoOpN9ZOgSudncIwetvpKEAW91DldPLeCevBJi/PNKPgrR7uOshm9psifDEVkm5n5pTbGR5QK0CRTGnh90RqLEvgoJx9dsopqXJAoGBAP7bZ0OB3iCtzcsnNhw3EO+e/KXwx0WBh6ZBwpPcCPnF+oSvEFWNYbliHlmTB30Vi693+EDiHi5RhAmDbveeZIkq2ougq3UWSwaCoJVCXRfU8/d5HLUl3KCtUF9PK7VUJElD/lDhQP7hzL5CXzminrYh4fLsyuvklkEG/WBwoaO1AoGBAP1ublvUjMf4wurJ73/sL2W/SERh+nMN/ArczETJbIkW3ikL/T9LuEs2ZAzRtn3dcJ7LjyWUkqjvhpjx/t5348i9InwJbYee6lCd7lWccYs5Hc8ySfQ9vSKH87mkhdCEP8mdh2bpAXd/T2FHxlibItUtcYK2HZxAI3svu2i5Yd0zAoGAcJ1EiQj2vVvvhqhh+Z+/hRKssyqs8yKkbSu7rhhZgv0fkMfGoPcjSoZ3wL7+XSBLJBMQCKOiEHeGr6l7PEGqTQ45md86RDfAmTTZfnrfpes8jorey5DaZ8mNrT/PoYV3r0QzOUv/q2DdVuj/KPmZxgM801oc5JWSa1OKXLYIRs0CgYBUX764LgSM0yI5vu9QvJZvHob11VTnl0FRcH9Fa3YKEiX2rnoq54+84qfeqLdEIkRLaeQHk/Zb7hr2sqKy+GFKxMVFXHIt09eY7Wua7xHSUzq8b7a1bRSZ+X9IUCEI8e62tg6NUYfee/E2pwm/GC85n/6JkQ48phHqAlM3o3iUhwKBgDzaYNs6DR6A4VODmy5ngANJQ9rAxmJdYOhfoQUmnljrBN1mZ69xMMJDOUDkciCA7/MvRgsZ0ZmZ6fj3NdXRoWXv/NwYdCDMDm4NfWJ9rm6ndyW0/TOlS8W3/zsqKyLvaCDeGonPLOfiFyQnYojvEvRkOVB84mVOK5WZ0PlssyIo','MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA/EzFMchQ4x7/ZPz6S6SzJM6kyhU/vaKUjE1oKZHtsl7FIUsqEYSdEUjUqodzOxUqh3OueWMC2ob7IKaowyhgj7FFYCdB1ih8Wjii3OxjIfrf74eWzNQXdbP3AWiEvIKMsj+dqp/iDky7jIeF2fu5IeBgSmdyKu9lnHxuFantCQbhfqrZHlrtYbw/cvv9hN2QZADvL+FuoWGbi/QznU8DizqYLOrUpXY+W/7qeY0q9a3yYEY1UxJvNdNIiaxdB2biDs/z9+pw9z28lLT+1cAdjDF2asvz2jBcffWM/4SFGBy5wkOJAE0GVJ2r0YbvRPGBFH8VjbZSS1qJivCGzxveDwIDAQAB','\0','\0','\0','\0','EXTERNAL',1800,36000,'\0','\0','84978901-d2c6-4a38-bbbb-f9cd54e5fe10','MIICnTCCAYUCBgFRgiZW8jANBgkqhkiG9w0BAQsFADASMRAwDgYDVQQDDAdpdGVzb2Z0MB4XDTE1MTIwODE1MTAyOVoXDTI1MTIwODE1MTIwOVowEjEQMA4GA1UEAwwHaXRlc29mdDCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAPxMxTHIUOMe/2T8+kuksyTOpMoVP72ilIxNaCmR7bJexSFLKhGEnRFI1KqHczsVKodzrnljAtqG+yCmqMMoYI+xRWAnQdYofFo4otzsYyH63++HlszUF3Wz9wFohLyCjLI/naqf4g5Mu4yHhdn7uSHgYEpncirvZZx8bhWp7QkG4X6q2R5a7WG8P3L7/YTdkGQA7y/hbqFhm4v0M51PA4s6mCzq1KV2Plv+6nmNKvWt8mBGNVMSbzXTSImsXQdm4g7P8/fqcPc9vJS0/tXAHYwxdmrL89owXH31jP+EhRgcucJDiQBNBlSdq9GG70TxgRR/FY22UktaiYrwhs8b3g8CAwEAATANBgkqhkiG9w0BAQsFAAOCAQEAHXJeIg4d0uEvP35lz2akO6xhxW7/nYLgTFh7U8muk//ZVAkyer8UDtsYaMy8/0+lMoLwGMzAMKBsYYDVu4ID2nNxgV5hPHUuxg/1vPtVKoqs+JvFPbrPzTDpWzJ6nunxKd6WeFLxt6cigh/hr/FlTc5rIm64VadQIK53U+R98Ali1xdgwX0Gix/nojnYjUUS516tIenBV6I7JtxOCdGIgIBHv8U2a3ZxTAP/r9CmTsCydIRZlEGgPEBcNERhiMcjgMNPcI5+wcYbRzVav4dTC0n92OcZjBHr7rnzYltCG3GLuEKPgufsYiIFqcHAR9h7P6o5j7aNIdE40S+syEV+hQ==','8cecdae9-1ac2-451b-9b93-b8cc48edc6c2',1800,'\0',NULL,'\0','\0','\0','\0',0,1,30,6,'HmacSHA1','totp','81dd220b-bad6-4dd9-88f9-e7d76dcaafc8','d8017d9d-ab9d-4071-b007-544d07b9dfb7','00a27090-97e3-4007-893c-34e6e1dcce12','e671affd-0c6f-4a81-8a8b-c1ca0e055abe','3b1ad2e8-4a72-48f6-a3ea-974cfd0fc6a7',2592000,'\0',900),('master',60,300,60,NULL,NULL,NULL,'','\0',0,NULL,'master',0,NULL,'MIIEpQIBAAKCAQEAz34hDCWV2i2IBAjJ6RtUhhdAtoztaiv9AnT63rHQsBdciL2Eb8HNRtjKz2bCKDQCBRfakkCU15wuLefWErGtTFV0xi5GpOqTW2lTvRcI/nwFwlk4ScSiw31f0BI/VDOtEhZ4jD4dilm2puAE/xUjX+JFUfgMiE97kgZT2hDD4f5hYX8pvCYf6/tX9iH7L4HM09fQTcHnLoCa62vfP25/i7t5zCvnNcF397ZTMtl9eIihfGjUvrpbjgOxiUIOQfOW2d6nQGAlRvlQj8Rt74ntZ2bklZ+0La4b/YQ1Z3F/sN2874YT1kBDqC5DSsIZTu0bRnpOIv97KQ5kJSTfEsnkBwIDAQABAoIBAQCSN5jEPYw/JozOAv9+JINIxwQUYHVBt2PhIlxTKE0eeif8OEkmlBS7UzSAOTKjMBsoSan+HEKHOgkU0mX54Hl17FaQ/bVMq/1RkoSvIJd29iD81vCik037otMtBl7YUF4q++jRM0iP4S6kpAMBWn0GKaad38W9HP3AZnManWvcSaiJJ9Mk5uc5SyXhmGsVvQiwEp+ojMUKkrBuzXtrvizO2uKN3KLsOpcV2zbWLQXiM8qe4FU73Cl2X7lVev5IkWZ+6MO1jRV37mg40wUwMjSkrNL/kXbuP9dW5jehpOq+jL6adHW8KnBBbHJGaX1ulfUOiQsoD4ZcKfg+86B3sgvxAoGBAO3/wAuDyIilG1RMbsr85wWHun+ZgiNlWOmlF+Pg0cgtOm3PAwUNLlRL27JCzC4Vb/Ww9ArENI4NYoHJDHa+aQBNT/x9c9uVibVXmPfC26/9+dGRx/yTY30SLsbflqyCbV9UgrMezgZzGfnkreOAP/UNIV/gd/UO1Ei2Sb4oWju/AoGBAN8vs2uZRse01ptJWNS2YEYJIRHIXOQOYSzRbFTwugldDbD4tojgH2yM5M6/8v2m4Ud59I7uhmqPPYnl7y8Saw7mib3EZgyGMcV+8CIPtE4UrfhM4eLaILpSEVHoE1dEU4BksJhZkPT8d/Lug6DwjdUY2OV5L8/fY9bhko4dRQm5AoGBAODT1sGJ7mhXQGf0BD2xhzPMMjvT8gIp/UJKeTUF7mbhgu60vi+JchijyJivTV7DVY6NaRy6mMMQldvw5ttNqLdmUYc9o7LtorcyVwjGhO3OSK7Wvks1mKhQAuxPz3CLjXKezREUqp+hIArXIgVl5AVEMCD4VZmkNpmxyhve1s7VAoGBAMIfsFR3dkv/6+YXbu9dTfG8wQnBl6I5K6aa5TogRAAe8uip+8KkBlEZX27BIC4l965+0gt8Rmfq/SCzYU41G+9S8B2h9Q0Rr7rTRTSrKi376LGe1Z7GEU9eUHhIfoIaCPMVIVDyHpYn/oDLmqvib8sZGJbHyKFq8WEWxK1dog3pAoGALoxJOVPpJKoTmQL5Ko/8LJ/qhCohBaY/TsR8Czy1UlMZQfE0OVMdy8Mf1A5FCN2/zM5SB+NtXLwg+0nP/XTP7N9oTvT++Rnt59gN7XJGGEbGSBiBOgkpaeIbH5R2kAvGhX/sDq6cdn4+Dd1GB0q6mJAiPT60ksWjzN9/l5bA5Io=','MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAz34hDCWV2i2IBAjJ6RtUhhdAtoztaiv9AnT63rHQsBdciL2Eb8HNRtjKz2bCKDQCBRfakkCU15wuLefWErGtTFV0xi5GpOqTW2lTvRcI/nwFwlk4ScSiw31f0BI/VDOtEhZ4jD4dilm2puAE/xUjX+JFUfgMiE97kgZT2hDD4f5hYX8pvCYf6/tX9iH7L4HM09fQTcHnLoCa62vfP25/i7t5zCvnNcF397ZTMtl9eIihfGjUvrpbjgOxiUIOQfOW2d6nQGAlRvlQj8Rt74ntZ2bklZ+0La4b/YQ1Z3F/sN2874YT1kBDqC5DSsIZTu0bRnpOIv97KQ5kJSTfEsnkBwIDAQAB','\0','\0','\0','\0','EXTERNAL',1800,36000,'\0','\0','2165c3e8-c375-4bb6-bc7a-072bdb04de07','MIICmzCCAYMCBgFRgiW5CDANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZtYXN0ZXIwHhcNMTUxMjA4MTUwOTQ5WhcNMjUxMjA4MTUxMTI5WjARMQ8wDQYDVQQDDAZtYXN0ZXIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQDPfiEMJZXaLYgECMnpG1SGF0C2jO1qK/0CdPresdCwF1yIvYRvwc1G2MrPZsIoNAIFF9qSQJTXnC4t59YSsa1MVXTGLkak6pNbaVO9Fwj+fAXCWThJxKLDfV/QEj9UM60SFniMPh2KWbam4AT/FSNf4kVR+AyIT3uSBlPaEMPh/mFhfym8Jh/r+1f2IfsvgczT19BNwecugJrra98/bn+Lu3nMK+c1wXf3tlMy2X14iKF8aNS+uluOA7GJQg5B85bZ3qdAYCVG+VCPxG3vie1nZuSVn7Qtrhv9hDVncX+w3bzvhhPWQEOoLkNKwhlO7RtGek4i/3spDmQlJN8SyeQHAgMBAAEwDQYJKoZIhvcNAQELBQADggEBAFm9Ev9By/tliuxZdF+CwNx1/veZocQd6wkHv32k94ZRvOJ3aP43Z4XQ0v7Vsg/gmc+9KnGoJst+WTBS2Gk0I6kudp8I2CPaEsHhDCDgbeqOTc+4DRfmkwnYOrUwNCmUsydxU29L9RpSQI+o2jF9GkGzlfMt0b4FfGKG58gGvJjYHBq0fb2r84wYdxC3tr61HxZN0a2IAB1GcMV2ssHjvQujyQlacPZN7AYWp4grYl3eq9uqXAZTmtFmSrrbMhMwEzwIqKmOQ+b7STM6iOWkV2+faFAW7mpHhDurv22fLN4xxLen3xUSa2ztbbBG8gGA+QQiZj06UWCyoyjm4Wn72Fo=','2d221f76-37ba-4711-a8b9-a685e116138e',1800,'\0',NULL,'\0','\0','\0','\0',0,1,30,6,'HmacSHA1','totp','57aded64-6ea4-4e65-9f89-abc3ba0d29f9','ca4412a2-6a27-4f67-a069-33c9a8a04573','050195c4-b012-4f7f-8d70-511e09923be2','5c5083e3-eae8-4b69-a484-2cf93e12387b','16c590c7-a83e-4f97-b7d0-e35884bc412b',2592000,'\0',900);
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
INSERT INTO `REALM_CLIENT` VALUES ('master','2165c3e8-c375-4bb6-bc7a-072bdb04de07'),('master','8d3218d6-f904-4d28-845b-ef57eeef0c48'),('master','ad5c7379-f4b8-4cbf-841e-deaeb6ddc267'),('master','bd7e0a02-230a-4e98-bdad-820a26f315a2'),('master','d49bf1e6-ec47-4abb-b78e-aac9d7fb4717'),('master','84978901-d2c6-4a38-bbbb-f9cd54e5fe10'),('itesoft','59af5029-c076-40f8-9ba8-cc4a0bd09bd2'),('itesoft','a32a134d-158b-4eda-af8e-3a2765e408e1'),('itesoft','571d349e-f297-423c-85a8-02043a6dced6'),('itesoft','6a710a53-ee93-418c-9542-29318c681535'),('itesoft','4032f5ce-a5dd-45a1-91fc-6a7041a685f2');
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
INSERT INTO `REALM_DEFAULT_ROLES` VALUES ('itesoft','3faed298-1a70-4eaf-9b81-c1eb435e2093'),('master','3f28ba6b-8766-4a33-be52-a6ad9782c2b3');
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
INSERT INTO `REDIRECT_URIS` VALUES ('bd7e0a02-230a-4e98-bdad-820a26f315a2','/auth/realms/master/account/*'),('8d3218d6-f904-4d28-845b-ef57eeef0c48','/auth/admin/master/console/*'),('a32a134d-158b-4eda-af8e-3a2765e408e1','/auth/realms/itesoft/account/*'),('6a710a53-ee93-418c-9542-29318c681535','/auth/admin/itesoft/console/*');
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
INSERT INTO `REQUIRED_ACTION_PROVIDER` VALUES ('0fcb0654-9551-4a04-8462-8277c5135958','CONFIGURE_TOTP','Configure Totp','master','','\0','CONFIGURE_TOTP'),('184e4ebe-85c2-4ec4-a374-2030ddbfe1ee','terms_and_conditions','Terms and Conditions','master','\0','\0','terms_and_conditions'),('1e927ba5-b802-408a-b959-9b2fb294aea0','VERIFY_EMAIL','Verify Email','itesoft','','\0','VERIFY_EMAIL'),('6e4bcffa-5976-4cd2-a12f-4e0bfb11251e','UPDATE_PASSWORD','Update Password','itesoft','','\0','UPDATE_PASSWORD'),('8eabeef2-8bab-40bf-80dc-ba42e94066b9','UPDATE_PROFILE','Update Profile','itesoft','','\0','UPDATE_PROFILE'),('9d1f3d47-0297-43c5-8e07-0cba05754ee7','CONFIGURE_TOTP','Configure Totp','itesoft','','\0','CONFIGURE_TOTP'),('edc099b0-937a-4af4-bf43-b1769e541d0a','UPDATE_PASSWORD','Update Password','master','','\0','UPDATE_PASSWORD'),('ee9d40ec-ca42-4c58-94f0-259b74db66fe','VERIFY_EMAIL','Verify Email','master','','\0','VERIFY_EMAIL'),('f850543f-2596-4ef3-bd05-0dcf56f68cfc','UPDATE_PROFILE','Update Profile','master','','\0','UPDATE_PROFILE'),('fb8105e2-cabb-4098-a405-6feb7964108e','terms_and_conditions','Terms and Conditions','itesoft','\0','\0','terms_and_conditions');
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
INSERT INTO `SCOPE_MAPPING` VALUES ('8d3218d6-f904-4d28-845b-ef57eeef0c48','2be679ad-d56d-4e93-8344-936f14519f8d'),('ad5c7379-f4b8-4cbf-841e-deaeb6ddc267','2be679ad-d56d-4e93-8344-936f14519f8d'),('4032f5ce-a5dd-45a1-91fc-6a7041a685f2','700ef8f7-dfc9-4a50-9a53-9453ea0a9fcc'),('6a710a53-ee93-418c-9542-29318c681535','700ef8f7-dfc9-4a50-9a53-9453ea0a9fcc');
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
INSERT INTO `USER_ENTITY` VALUES ('0cd778e8-4334-4ec4-b5fc-d6a3c81b7d36',NULL,'84033b59-e3ec-4034-a668-a1dc77ad241b','\0','',NULL,NULL,NULL,'master','\0','admin',1449587489889,NULL);
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
INSERT INTO `USER_ROLE_MAPPING` VALUES ('2be679ad-d56d-4e93-8344-936f14519f8d','0cd778e8-4334-4ec4-b5fc-d6a3c81b7d36'),('3f28ba6b-8766-4a33-be52-a6ad9782c2b3','0cd778e8-4334-4ec4-b5fc-d6a3c81b7d36'),('7124b56f-32c9-4711-98c5-64d512bcbe6c','0cd778e8-4334-4ec4-b5fc-d6a3c81b7d36'),('99c92156-1bff-4748-8084-e8c053762f6a','0cd778e8-4334-4ec4-b5fc-d6a3c81b7d36');
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

-- Dump completed on 2015-12-08 15:13:35

