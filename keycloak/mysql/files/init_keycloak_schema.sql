
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
INSERT INTO `AUTHENTICATION_EXECUTION` VALUES ('012f1f6b-f375-498d-93d0-e1fcd8ff44dd',NULL,'reset-password','itesoft','c9ad5741-59e7-46b2-a7a7-652381a8ff45',0,30,'\0',NULL,NULL),('0af53454-99d8-4caa-a618-b2f711b18730',NULL,'reset-credential-email','itesoft','c9ad5741-59e7-46b2-a7a7-652381a8ff45',0,20,'\0',NULL,NULL),('0fbf3142-9de1-4147-a65d-643b130e160c',NULL,'registration-user-creation','master','0bee674c-ec80-44ee-aeb3-1139af144dab',0,20,'\0',NULL,NULL),('1e7de4ac-6c11-4954-ad4c-5d53bff250ee',NULL,'client-jwt','itesoft','7b05f837-d99e-4299-a073-918f2c29274f',2,20,'\0',NULL,NULL),('1ed94f7b-0d51-46bb-969e-f05e0dbc4212',NULL,'client-secret','itesoft','7b05f837-d99e-4299-a073-918f2c29274f',2,10,'\0',NULL,NULL),('1f14deb0-c375-470c-aaf7-079c46a5e6a3',NULL,'auth-otp-form','master','98b489ed-0a1a-41f7-897d-6acaa557be52',1,20,'\0',NULL,NULL),('223136a4-c683-4580-b0f0-015b990bd29e',NULL,'direct-grant-validate-username','master','cd767cb8-e454-4241-9c2a-9de4b99e0cf1',0,10,'\0',NULL,NULL),('22c5c764-b75d-4135-b3e8-2c8d8a29e87c',NULL,'direct-grant-validate-otp','master','cd767cb8-e454-4241-9c2a-9de4b99e0cf1',1,30,'\0',NULL,NULL),('25bcc44b-2cd4-42a7-a079-992d901aea2b',NULL,'idp-email-verification','itesoft','f61769d7-a0a4-4ee5-92db-79fa8377f4d5',2,20,'\0',NULL,NULL),('2652b810-db75-4d54-befc-41dab631dacf',NULL,'registration-password-action','master','0bee674c-ec80-44ee-aeb3-1139af144dab',0,50,'\0',NULL,NULL),('2cc466f8-d09b-4f35-ba00-a99138229178',NULL,NULL,'itesoft','20967446-c56e-4085-8abd-08c959dcbde5',2,30,'\0','63ded3a8-2137-46f1-b1de-28ab95fcaed8',NULL),('2dbbe424-bccb-4495-bc61-ae9a42fac379',NULL,'idp-username-password-form','master','98b489ed-0a1a-41f7-897d-6acaa557be52',0,10,'\0',NULL,NULL),('33b9b059-10b6-4a08-8f3b-4eb7a0890bc9',NULL,'direct-grant-validate-otp','itesoft','61c44348-d7d5-42ce-90f6-0135d0e38823',1,30,'\0',NULL,NULL),('3793771c-e950-4d7e-9ed8-b449d2a34a29',NULL,'registration-user-creation','itesoft','ce63909b-4845-4446-8c4d-7b9654670f1c',0,20,'\0',NULL,NULL),('4333d9c2-07d1-452f-a636-d8c31ce40da8',NULL,'idp-email-verification','master','8e2586d0-05e2-49dc-b348-7cf7b858f0b3',2,20,'\0',NULL,NULL),('4bbfacd8-9d1a-4351-9abc-ac8bfdbc5931',NULL,'registration-recaptcha-action','itesoft','ce63909b-4845-4446-8c4d-7b9654670f1c',3,60,'\0',NULL,NULL),('51e09b37-5e5b-4c08-93e4-ecd308259d57',NULL,'registration-recaptcha-action','master','0bee674c-ec80-44ee-aeb3-1139af144dab',3,60,'\0',NULL,NULL),('5211ba51-1935-49bf-8269-0ed89314124f',NULL,'auth-spnego','master','8af13ec0-0dbc-472b-a615-681498d797f2',3,20,'\0',NULL,NULL),('55c0e955-66a7-4a51-96b1-69beb60b55f8',NULL,'registration-profile-action','master','0bee674c-ec80-44ee-aeb3-1139af144dab',0,40,'\0',NULL,NULL),('58e73352-f483-4b25-8a6e-78868394aa9f',NULL,'reset-credentials-choose-user','master','12cab55e-11f7-404e-85fb-de3c1a6b25a4',0,10,'\0',NULL,NULL),('5c64861c-60f9-4ace-83a9-2a5b6417ee3e',NULL,'direct-grant-validate-password','itesoft','61c44348-d7d5-42ce-90f6-0135d0e38823',0,20,'\0',NULL,NULL),('72b5225b-343d-4044-b552-4471f4837dee',NULL,'idp-create-user-if-unique','master','b2285d42-9484-4ceb-a1c9-9535a0520f9e',2,20,'\0',NULL,'b5f7cfdc-9ca1-4d17-82d9-5ffeea9c52ba'),('7896bb0b-8e40-4343-9f49-2453f951374d',NULL,'auth-cookie','master','8af13ec0-0dbc-472b-a615-681498d797f2',2,10,'\0',NULL,NULL),('802aa046-41bf-4c7d-8380-e01757122860',NULL,'auth-cookie','itesoft','20967446-c56e-4085-8abd-08c959dcbde5',2,10,'\0',NULL,NULL),('8b8fdc90-bed0-439b-96fc-1e86f653ed38',NULL,'registration-password-action','itesoft','ce63909b-4845-4446-8c4d-7b9654670f1c',0,50,'\0',NULL,NULL),('9681ba03-ec74-4b3a-b07d-8a0e7eff1f45',NULL,'reset-otp','itesoft','c9ad5741-59e7-46b2-a7a7-652381a8ff45',1,40,'\0',NULL,NULL),('9a2a457c-8186-4389-b755-8ca5b97654f6',NULL,'client-secret','master','6373b333-8520-41e9-93f4-ffc5ef12a483',2,10,'\0',NULL,NULL),('9bfebcad-90db-49bf-9fc0-9baa2256402e',NULL,'reset-otp','master','12cab55e-11f7-404e-85fb-de3c1a6b25a4',1,40,'\0',NULL,NULL),('9f2e2d7d-c916-4b60-8f56-f5117852cb9b',NULL,'reset-credentials-choose-user','itesoft','c9ad5741-59e7-46b2-a7a7-652381a8ff45',0,10,'\0',NULL,NULL),('a296c26a-f694-4398-a24c-9df495cbb13a',NULL,NULL,'master','b2285d42-9484-4ceb-a1c9-9535a0520f9e',2,30,'\0','8e2586d0-05e2-49dc-b348-7cf7b858f0b3',NULL),('a4f21f05-d125-4ccc-8957-3054703e45b0',NULL,'idp-create-user-if-unique','itesoft','9378ac9b-02fd-40e3-a95a-6303fb65a56a',2,20,'\0',NULL,'73575054-3a1e-4ad4-951f-f5e409526dff'),('af1b9141-4c37-492a-9811-2b1392e20b4d',NULL,'idp-review-profile','master','b2285d42-9484-4ceb-a1c9-9535a0520f9e',0,10,'\0',NULL,'2c01108c-dc44-47d1-92c7-150785f1c2bd'),('b3bd0d9a-736f-40ce-b8d2-82c43247bd5c',NULL,'direct-grant-validate-password','master','cd767cb8-e454-4241-9c2a-9de4b99e0cf1',0,20,'\0',NULL,NULL),('b78e60d7-048b-4601-8c62-48596f1343f6',NULL,NULL,'itesoft','9378ac9b-02fd-40e3-a95a-6303fb65a56a',2,30,'\0','f61769d7-a0a4-4ee5-92db-79fa8377f4d5',NULL),('b935214a-e263-43b9-a42c-cbb138e3119d',NULL,'idp-confirm-link','master','8e2586d0-05e2-49dc-b348-7cf7b858f0b3',0,10,'\0',NULL,NULL),('ba99b044-6334-422c-84b7-f7b7ab17ebfe',NULL,'auth-spnego','itesoft','20967446-c56e-4085-8abd-08c959dcbde5',3,20,'\0',NULL,NULL),('be3a3509-b1a9-43b0-a32c-1010d69d9ec3',NULL,'registration-page-form','master','702087e3-122c-4256-abfa-8a06599dc89a',0,10,'\0','0bee674c-ec80-44ee-aeb3-1139af144dab',NULL),('c18d0bae-c8d8-4e04-8f41-2a3d9ab8e20f',NULL,'direct-grant-validate-username','itesoft','61c44348-d7d5-42ce-90f6-0135d0e38823',0,10,'\0',NULL,NULL),('c1b9ddb5-0db0-4d86-bc4a-2466d73154b7',NULL,'reset-password','master','12cab55e-11f7-404e-85fb-de3c1a6b25a4',0,30,'\0',NULL,NULL),('c234163b-be80-4fbf-9fdf-f73b1fe87a07',NULL,'auth-username-password-form','master','7d3afdfd-cd0a-41ef-83db-f6603c4be3fb',0,10,'\0',NULL,NULL),('c24f533e-4378-459d-9923-8fb40e3fc46d',NULL,'idp-username-password-form','itesoft','076660bd-ecfe-48f9-b5f1-b845535f9204',0,10,'\0',NULL,NULL),('c2b72115-28a6-4e58-b378-686876dab597',NULL,'registration-profile-action','itesoft','ce63909b-4845-4446-8c4d-7b9654670f1c',0,40,'\0',NULL,NULL),('c7e63352-300a-4a77-8517-90b8bb94985e',NULL,'idp-review-profile','itesoft','9378ac9b-02fd-40e3-a95a-6303fb65a56a',0,10,'\0',NULL,'0072e2b0-94cf-4503-84de-850da87041f9'),('ca48f597-3eb0-4189-b304-637fc8899938',NULL,NULL,'master','8e2586d0-05e2-49dc-b348-7cf7b858f0b3',2,30,'\0','98b489ed-0a1a-41f7-897d-6acaa557be52',NULL),('cb852045-8668-471b-b79b-efc84fdc4f16',NULL,NULL,'master','8af13ec0-0dbc-472b-a615-681498d797f2',2,30,'\0','7d3afdfd-cd0a-41ef-83db-f6603c4be3fb',NULL),('cd5c2199-a06e-4aee-9a4c-47791f96b363',NULL,'registration-page-form','itesoft','28dc16a5-33b1-40f9-b05d-b3524d3b7810',0,10,'\0','ce63909b-4845-4446-8c4d-7b9654670f1c',NULL),('cf970c6b-d168-49fd-abba-fd6e0bd66d13',NULL,'auth-username-password-form','itesoft','63ded3a8-2137-46f1-b1de-28ab95fcaed8',0,10,'\0',NULL,NULL),('d093db59-b1f3-441f-a6e6-c309eecc36e0',NULL,'idp-confirm-link','itesoft','f61769d7-a0a4-4ee5-92db-79fa8377f4d5',0,10,'\0',NULL,NULL),('d3b7f474-a7cb-44b3-97fe-a12f7ea3466f',NULL,NULL,'itesoft','f61769d7-a0a4-4ee5-92db-79fa8377f4d5',2,30,'\0','076660bd-ecfe-48f9-b5f1-b845535f9204',NULL),('e5475650-5aea-48a6-bf56-f2e756783447',NULL,'auth-otp-form','itesoft','076660bd-ecfe-48f9-b5f1-b845535f9204',1,20,'\0',NULL,NULL),('eba03cda-b212-4ac8-a6e4-6fb38c3233e6',NULL,'auth-otp-form','itesoft','63ded3a8-2137-46f1-b1de-28ab95fcaed8',1,20,'\0',NULL,NULL),('ecb66b59-9908-4174-a206-ce39dcd28e6c',NULL,'client-jwt','master','6373b333-8520-41e9-93f4-ffc5ef12a483',2,20,'\0',NULL,NULL),('f4e1964f-c0b1-493a-8a1b-a188a2c27842',NULL,'reset-credential-email','master','12cab55e-11f7-404e-85fb-de3c1a6b25a4',0,20,'\0',NULL,NULL),('fe573251-2459-4925-9ee3-0570e2d41c5f',NULL,'auth-otp-form','master','7d3afdfd-cd0a-41ef-83db-f6603c4be3fb',1,20,'\0',NULL,NULL);
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
INSERT INTO `AUTHENTICATION_FLOW` VALUES ('076660bd-ecfe-48f9-b5f1-b845535f9204','Verify Existing Account by Re-authentication','Reauthentication of existing account','itesoft','basic-flow','\0','\0'),('0bee674c-ec80-44ee-aeb3-1139af144dab','registration form','registration form','master','form-flow','\0','\0'),('12cab55e-11f7-404e-85fb-de3c1a6b25a4','reset credentials','Reset credentials for a user if they forgot their password or something','master','basic-flow','\0','\0'),('20967446-c56e-4085-8abd-08c959dcbde5','browser','browser based authentication','itesoft','basic-flow','\0','\0'),('28dc16a5-33b1-40f9-b05d-b3524d3b7810','registration','registration flow','itesoft','basic-flow','\0','\0'),('61c44348-d7d5-42ce-90f6-0135d0e38823','direct grant','OpenID Connect Resource Owner Grant','itesoft','basic-flow','\0','\0'),('6373b333-8520-41e9-93f4-ffc5ef12a483','clients','Base authentication for clients','master','client-flow','\0','\0'),('63ded3a8-2137-46f1-b1de-28ab95fcaed8','forms','Username, password, otp and other auth forms.','itesoft','basic-flow','\0','\0'),('702087e3-122c-4256-abfa-8a06599dc89a','registration','registration flow','master','basic-flow','\0','\0'),('7b05f837-d99e-4299-a073-918f2c29274f','clients','Base authentication for clients','itesoft','client-flow','\0','\0'),('7d3afdfd-cd0a-41ef-83db-f6603c4be3fb','forms','Username, password, otp and other auth forms.','master','basic-flow','\0','\0'),('8af13ec0-0dbc-472b-a615-681498d797f2','browser','browser based authentication','master','basic-flow','\0','\0'),('8e2586d0-05e2-49dc-b348-7cf7b858f0b3','Handle Existing Account','Handle what to do if there is existing account with same email/username like authenticated identity provider','master','basic-flow','\0','\0'),('9378ac9b-02fd-40e3-a95a-6303fb65a56a','first broker login','Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account','itesoft','basic-flow','\0','\0'),('98b489ed-0a1a-41f7-897d-6acaa557be52','Verify Existing Account by Re-authentication','Reauthentication of existing account','master','basic-flow','\0','\0'),('b2285d42-9484-4ceb-a1c9-9535a0520f9e','first broker login','Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account','master','basic-flow','\0','\0'),('c9ad5741-59e7-46b2-a7a7-652381a8ff45','reset credentials','Reset credentials for a user if they forgot their password or something','itesoft','basic-flow','\0','\0'),('cd767cb8-e454-4241-9c2a-9de4b99e0cf1','direct grant','OpenID Connect Resource Owner Grant','master','basic-flow','\0','\0'),('ce63909b-4845-4446-8c4d-7b9654670f1c','registration form','registration form','itesoft','form-flow','\0','\0'),('f61769d7-a0a4-4ee5-92db-79fa8377f4d5','Handle Existing Account','Handle what to do if there is existing account with same email/username like authenticated identity provider','itesoft','basic-flow','\0','\0');
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
INSERT INTO `AUTHENTICATOR_CONFIG` VALUES ('0072e2b0-94cf-4503-84de-850da87041f9','review profile config','itesoft'),('2c01108c-dc44-47d1-92c7-150785f1c2bd','review profile config','master'),('73575054-3a1e-4ad4-951f-f5e409526dff','create unique user config','itesoft'),('b5f7cfdc-9ca1-4d17-82d9-5ffeea9c52ba','create unique user config','master');
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
INSERT INTO `AUTHENTICATOR_CONFIG_ENTRY` VALUES ('0072e2b0-94cf-4503-84de-850da87041f9','missing','update.profile.on.first.login'),('2c01108c-dc44-47d1-92c7-150785f1c2bd','missing','update.profile.on.first.login'),('73575054-3a1e-4ad4-951f-f5e409526dff','false','require.password.update.after.registration'),('b5f7cfdc-9ca1-4d17-82d9-5ffeea9c52ba','false','require.password.update.after.registration');
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
INSERT INTO `CLIENT` VALUES ('158b5f51-dd0f-4cdb-87ba-70374510314f','\0','\0','realm-management',0,'\0','f44a0b2f-b952-442f-a732-fc1481e3dc64',NULL,'\0',NULL,'\0','itesoft',NULL,0,'\0','\0','${client_realm-management}','\0','client-secret',NULL,NULL,NULL,'\0','\0','\0'),('284f40a5-e7cf-47e9-be88-7055f5786efa','\0','\0','broker',0,'\0','73b1d11f-c3b5-4696-95e4-a1c01a35c229',NULL,'\0',NULL,'\0','master',NULL,0,'\0','\0','${client_broker}','\0','client-secret',NULL,NULL,NULL,'\0','\0','\0'),('50368b55-4585-4da0-896f-8026ea9a311a','\0','\0','admin-cli',0,'\0','5cbcd962-15f9-4653-8d03-746c524c0777',NULL,'\0',NULL,'\0','master',NULL,0,'\0','\0','${client_admin-cli}','\0','client-secret',NULL,NULL,NULL,'\0','\0','\0'),('55505b70-9163-42e9-a0e2-7d3e6a7c4ad7','\0','\0','account',0,'\0','5f851134-2ab0-4239-9536-14b6882144ce','/auth/realms/master/account','\0',NULL,'\0','master',NULL,0,'\0','\0','${client_account}','\0','client-secret',NULL,NULL,NULL,'\0','\0','\0'),('62203531-01d5-47ef-8c27-a8555cd91c30','\0','\0','admin-cli',0,'\0','d317238d-1e5f-4618-95d5-5d0390a73ac5',NULL,'\0',NULL,'\0','itesoft',NULL,0,'\0','\0','${client_admin-cli}','\0','client-secret',NULL,NULL,NULL,'\0','\0','\0'),('750a0c5d-bc3d-4d31-b3a8-987a0ae84878','\0','\0','account',0,'\0','edbd5a96-18a8-441d-accf-3465dbaa1935','/auth/realms/itesoft/account','\0',NULL,'\0','itesoft',NULL,0,'\0','\0','${client_account}','\0','client-secret',NULL,NULL,NULL,'\0','\0','\0'),('8f292a09-153a-42c5-adab-dec5a553db65','\0','\0','broker',0,'\0','8c415341-7448-46e7-a8da-87a56f98f74a',NULL,'\0',NULL,'\0','itesoft',NULL,0,'\0','\0','${client_broker}','\0','client-secret',NULL,NULL,NULL,'\0','\0','\0'),('bd4095d4-6c29-4aa3-9baa-0978157aedc6','\0','\0','security-admin-console',0,'\0','4ba16d6a-f4ee-4126-888d-251c0556b777','/auth/admin/itesoft/console/index.html','\0',NULL,'\0','itesoft',NULL,0,'\0','\0','${client_security-admin-console}','\0','client-secret',NULL,NULL,NULL,'\0','\0','\0'),('c6cb72b7-ddf0-4246-8208-b82cc5cb21c1','\0','\0','security-admin-console',0,'\0','7b1342c8-88fc-45e7-8978-742add08fe8e','/auth/admin/master/console/index.html','\0',NULL,'\0','master',NULL,0,'\0','\0','${client_security-admin-console}','\0','client-secret',NULL,NULL,NULL,'\0','\0','\0'),('f6d06cce-b911-47b3-b08e-06340679586a','\0','\0','master-realm',0,'\0','45832989-32c8-403f-89e6-030602670da3',NULL,'\0',NULL,'\0','master',NULL,0,'\0','\0','master Realm','\0','client-secret',NULL,NULL,NULL,'\0','\0','\0'),('f9bfbcc1-a943-41a8-b968-5fcf730edd2f','\0','\0','itesoft-realm',0,'\0','689e0156-bd37-406e-9733-df72887aff07',NULL,'\0',NULL,'\0','master',NULL,0,'\0','\0','itesoft Realm','\0','client-secret',NULL,NULL,NULL,'\0','\0','\0'),('fd634189-7f7c-428a-a728-e74bd369cb0f','','','demo-client',0,'\0','208a5679-4cbe-40d1-b556-b44d1b385164','/auth/realms/itesoft/demo-client','\0',NULL,'\0','itesoft','openid-connect',-1,'\0','\0','Simple openidc RP for demo usage','\0','client-secret',NULL,NULL,NULL,'','\0','\0');
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
INSERT INTO `CLIENT_ATTRIBUTES` VALUES ('fd634189-7f7c-428a-a728-e74bd369cb0f','false','saml.assertion.signature'),('fd634189-7f7c-428a-a728-e74bd369cb0f','true','saml.authnstatement'),('fd634189-7f7c-428a-a728-e74bd369cb0f','false','saml.client.signature'),('fd634189-7f7c-428a-a728-e74bd369cb0f','false','saml.encrypt'),('fd634189-7f7c-428a-a728-e74bd369cb0f','false','saml.force.post.binding'),('fd634189-7f7c-428a-a728-e74bd369cb0f','false','saml.multivalued.roles'),('fd634189-7f7c-428a-a728-e74bd369cb0f','false','saml.server.signature'),('fd634189-7f7c-428a-a728-e74bd369cb0f','RSA_SHA256','saml.signature.algorithm'),('fd634189-7f7c-428a-a728-e74bd369cb0f','false','saml_force_name_id_format'),('fd634189-7f7c-428a-a728-e74bd369cb0f','username','saml_name_id_format'),('fd634189-7f7c-428a-a728-e74bd369cb0f','http://www.w3.org/2001/10/xml-exc-c14n#','saml_signature_canonicalization_method');
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
INSERT INTO `CLIENT_DEFAULT_ROLES` VALUES ('55505b70-9163-42e9-a0e2-7d3e6a7c4ad7','3417d97d-aeee-47ad-8473-0c52d5ff2c07'),('55505b70-9163-42e9-a0e2-7d3e6a7c4ad7','f4e03955-3678-4451-9738-8672541b4076'),('750a0c5d-bc3d-4d31-b3a8-987a0ae84878','be0b9f0f-8bee-4238-b06f-ce2b592d25ba'),('750a0c5d-bc3d-4d31-b3a8-987a0ae84878','c730c08d-389a-44da-96b6-7a6d7d01f8dd');
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
INSERT INTO `COMPOSITE_ROLE` VALUES ('bf88c4eb-5037-431c-8193-53e5f9282c2a','cfaff2a8-d519-4b8a-9c6a-6306034f9895'),('bf88c4eb-5037-431c-8193-53e5f9282c2a','98e0d15c-e252-48e4-9fa4-1644bdf0a6c6'),('bf88c4eb-5037-431c-8193-53e5f9282c2a','3a650e95-aff9-4313-ac95-ff20621c74be'),('bf88c4eb-5037-431c-8193-53e5f9282c2a','c9f54572-de17-4cfe-96ea-211bc648871c'),('bf88c4eb-5037-431c-8193-53e5f9282c2a','3cfe7861-e2bb-4055-8ac3-f1e5a43eed2b'),('bf88c4eb-5037-431c-8193-53e5f9282c2a','bc3379ba-b511-45c5-ad3f-154fed311043'),('bf88c4eb-5037-431c-8193-53e5f9282c2a','3c22a92e-ac72-437d-a1a6-da9147515da4'),('bf88c4eb-5037-431c-8193-53e5f9282c2a','b78eef9b-76df-49b9-af29-4eeb5bb1fcc1'),('bf88c4eb-5037-431c-8193-53e5f9282c2a','30816107-06f6-4014-9051-4006b6486869'),('bf88c4eb-5037-431c-8193-53e5f9282c2a','a579b4c6-3ccc-4332-8981-60132d06e479'),('bf88c4eb-5037-431c-8193-53e5f9282c2a','69f2f36a-b629-4349-b4d6-b173ce861e8a'),('bf88c4eb-5037-431c-8193-53e5f9282c2a','1cd3c2ff-27cd-4cf2-9d10-803f9a915188'),('bf88c4eb-5037-431c-8193-53e5f9282c2a','c0d0038e-6cd7-498f-8e6e-2b40c36769dd'),('bf88c4eb-5037-431c-8193-53e5f9282c2a','bcba7b0d-b760-446b-86dd-371961945b78'),('bf88c4eb-5037-431c-8193-53e5f9282c2a','a78cf71d-004c-4161-8610-5b0f8cb87094'),('bf88c4eb-5037-431c-8193-53e5f9282c2a','9b50d922-29ef-4142-bf11-8734ce1e02bd'),('bf88c4eb-5037-431c-8193-53e5f9282c2a','da395e3f-d11e-4277-88ca-3284110f1916'),('bf88c4eb-5037-431c-8193-53e5f9282c2a','893354c6-abe8-4ec3-b1b4-74aafd0a28a1'),('bf88c4eb-5037-431c-8193-53e5f9282c2a','b0ca92ea-aaa6-4219-b4cb-99dc91886b10'),('bf88c4eb-5037-431c-8193-53e5f9282c2a','5f7178e1-e456-4dbd-8c65-6ca09d2af5aa'),('bf88c4eb-5037-431c-8193-53e5f9282c2a','3e316004-4b30-4a92-9fa9-2a4886a28402'),('bf88c4eb-5037-431c-8193-53e5f9282c2a','c8ff143c-ab47-4a0a-8f11-02b672917c63'),('bf88c4eb-5037-431c-8193-53e5f9282c2a','198215a1-a598-4ff1-b3b7-55b927c849a1'),('bf88c4eb-5037-431c-8193-53e5f9282c2a','a73ae123-2696-4706-94fb-b8449a35a0ec'),('bf88c4eb-5037-431c-8193-53e5f9282c2a','cd6ef739-3a11-4609-b8ab-71bb746420d1'),('e45423d6-af2a-4b9e-a906-c99207932548','aa7f2f4b-bfc5-474f-8d17-e61bb346cc36'),('e45423d6-af2a-4b9e-a906-c99207932548','1484b598-16df-4d74-9693-fc7a03adcf73'),('e45423d6-af2a-4b9e-a906-c99207932548','337e3245-ee58-4bf2-9693-15b324336acd'),('e45423d6-af2a-4b9e-a906-c99207932548','430e36d9-ea20-4960-bfe1-a469510eb05b'),('e45423d6-af2a-4b9e-a906-c99207932548','41d7b0e3-f12e-4389-bb63-09d73522627a'),('e45423d6-af2a-4b9e-a906-c99207932548','3d7fe705-fe77-40d6-92b2-1663068ea6ca'),('e45423d6-af2a-4b9e-a906-c99207932548','15ae2afb-c1d5-4ed1-a71c-b2bddb5f785d'),('e45423d6-af2a-4b9e-a906-c99207932548','0279e290-9c7a-43d9-aba9-8b178644252b'),('e45423d6-af2a-4b9e-a906-c99207932548','dc688bff-c692-44e3-9371-4581f8802d7d'),('e45423d6-af2a-4b9e-a906-c99207932548','87b1be87-43ec-4c20-9aaf-aa26ec2ea489'),('e45423d6-af2a-4b9e-a906-c99207932548','61caf119-ef9b-41fc-a0bd-28ea955157af'),('e45423d6-af2a-4b9e-a906-c99207932548','204c0bcd-bad0-4410-ab58-c72d331f4234');
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
INSERT INTO `CREDENTIAL` VALUES ('40fbfb63-1535-427c-857f-33310f1f20ac',NULL,1,'�c�\"�X���w\0L���','password','Qe+SVYhyrlqjmR1z/e79vBIGEleOVLFrvzXSPy/XKVy0JQ+WMBD4q/fbAe8Qj22WEA3CJYjhZ6gjjNxHg2oYfQ==','0e8bf973-f753-41a7-af6c-ea36da5489c2',1449584649000,0,0,0,NULL),('bc6d47d4-3c6f-4122-b867-c47288fba1d6',NULL,1,'��9��\r<*NN����\"','password','Qjvxbj0uKV3u5+yyHThc0fpRBLyKIn4kGa/Ai0SeEUNGUtExF2F1mXGdhXO9tb3JsSMYFOkRWh1hw9h6oZt7Rw==','1a7e786d-4a19-47ff-86e2-1237b9ed2e20',1449585691000,0,0,0,NULL);
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
INSERT INTO `DATABASECHANGELOG` VALUES ('1.0.0.Final','sthorger@redhat.com','META-INF/jpa-changelog-1.0.0.Final.xml','2015-12-08 14:23:10',1,'EXECUTED','7:00a57f7a6fb456639b34e62972e0ec02','createTable (x29), addPrimaryKey (x21), addUniqueConstraint (x9), addForeignKeyConstraint (x32)','',NULL,'3.4.1',NULL,NULL),('1.1.0.Beta1','sthorger@redhat.com','META-INF/jpa-changelog-1.1.0.Beta1.xml','2015-12-08 14:23:10',2,'EXECUTED','7:0310eb8ba07cec616460794d42ade0fa','delete (x3), createTable (x3), addColumn (x5), addPrimaryKey (x3), addForeignKeyConstraint (x3), customChange','',NULL,'3.4.1',NULL,NULL),('1.1.0.Final','sthorger@redhat.com','META-INF/jpa-changelog-1.1.0.Final.xml','2015-12-08 14:23:10',3,'EXECUTED','7:5d25857e708c3233ef4439df1f93f012','renameColumn','',NULL,'3.4.1',NULL,NULL),('1.2.0.Beta1','psilva@redhat.com','META-INF/jpa-changelog-1.2.0.Beta1.xml','2015-12-08 14:23:12',4,'EXECUTED','7:c7a54a1041d58eb3817a4a883b4d4e84','delete (x4), createTable (x8), addColumn (x2), addPrimaryKey (x6), addForeignKeyConstraint (x9), addUniqueConstraint (x2), addColumn, dropForeignKeyConstraint (x2), dropUniqueConstraint, renameColumn (x3), addUniqueConstraint, addForeignKeyConstra...','',NULL,'3.4.1',NULL,NULL),('1.2.0.RC1','bburke@redhat.com','META-INF/jpa-changelog-1.2.0.CR1.xml','2015-12-08 14:23:13',5,'EXECUTED','7:0f08df48468428e0f30ee59a8ec01a41','delete (x5), createTable (x3), addColumn, createTable (x4), addPrimaryKey (x7), addForeignKeyConstraint (x6), renameColumn, addColumn (x2), update, dropColumn, dropForeignKeyConstraint, renameColumn, addForeignKeyConstraint, dropForeignKeyConstrai...','',NULL,'3.4.1',NULL,NULL),('1.2.0.Final','keycloak','META-INF/jpa-changelog-1.2.0.Final.xml','2015-12-08 14:23:13',6,'EXECUTED','7:a3377a2059aefbf3b90ebb4c4cc8e2ab','update (x3)','',NULL,'3.4.1',NULL,NULL),('1.3.0','bburke@redhat.com','META-INF/jpa-changelog-1.3.0.xml','2015-12-08 14:23:15',7,'EXECUTED','7:04c1dbedc2aa3e9756d1a1668e003451','delete (x6), createTable (x7), addColumn, createTable, addColumn (x2), update, dropDefaultValue, dropColumn, addColumn, update (x4), addPrimaryKey (x4), dropPrimaryKey, dropColumn, addPrimaryKey (x4), addForeignKeyConstraint (x8), dropDefaultValue...','',NULL,'3.4.1',NULL,NULL),('1.4.0','bburke@redhat.com','META-INF/jpa-changelog-1.4.0.xml','2015-12-08 14:23:16',8,'EXECUTED','7:36ef39ed560ad07062d956db861042ba','delete (x7), addColumn (x5), dropColumn, renameTable (x2), update (x10), createTable (x3), customChange, dropPrimaryKey, addPrimaryKey (x4), addForeignKeyConstraint (x2), dropColumn, addColumn','',NULL,'3.4.1',NULL,NULL),('1.5.0','bburke@redhat.com','META-INF/jpa-changelog-1.5.0.xml','2015-12-08 14:23:16',9,'EXECUTED','7:cf12b04b79bea5152f165eb41f3955f6','delete (x7), dropDefaultValue, dropColumn, addColumn (x3)','',NULL,'3.4.1',NULL,NULL),('1.6.1_from15','mposolda@redhat.com','META-INF/jpa-changelog-1.6.1.xml','2015-12-08 14:23:17',10,'EXECUTED','7:7e32c8f05c755e8675764e7d5f514509','addColumn (x3), createTable (x2), addPrimaryKey (x2)','',NULL,'3.4.1',NULL,NULL),('1.6.1_from16','mposolda@redhat.com','META-INF/jpa-changelog-1.6.1.xml','2015-12-08 14:23:17',11,'MARK_RAN','7:2fa220758991285312eb84f3b4ff5336','dropPrimaryKey (x2), addColumn, update, dropColumn, addColumn, update, dropColumn, addPrimaryKey (x2)','',NULL,'3.4.1',NULL,NULL),('1.6.1','mposolda@redhat.com','META-INF/jpa-changelog-1.6.1.xml','2015-12-08 14:23:17',12,'EXECUTED','7:d41d8cd98f00b204e9800998ecf8427e','Empty','',NULL,'3.4.1',NULL,NULL),('1.7.0','bburke@redhat.com','META-INF/jpa-changelog-1.7.0.xml','2015-12-08 14:23:19',13,'EXECUTED','7:91ace540896df890cc00a0490ee52bbc','createTable (x5), addColumn (x2), dropDefaultValue, dropColumn, addPrimaryKey, addForeignKeyConstraint, addPrimaryKey, addForeignKeyConstraint, addPrimaryKey, addForeignKeyConstraint, addPrimaryKey, addForeignKeyConstraint (x2), addUniqueConstrain...','',NULL,'3.4.1',NULL,NULL);
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
INSERT INTO `KEYCLOAK_ROLE` VALUES ('0279e290-9c7a-43d9-aba9-8b178644252b','158b5f51-dd0f-4cdb-87ba-70374510314f','\0','${role_manage-users}','manage-users','itesoft','158b5f51-dd0f-4cdb-87ba-70374510314f',NULL,'\0'),('1484b598-16df-4d74-9693-fc7a03adcf73','158b5f51-dd0f-4cdb-87ba-70374510314f','\0','${role_view-realm}','view-realm','itesoft','158b5f51-dd0f-4cdb-87ba-70374510314f',NULL,'\0'),('15ae2afb-c1d5-4ed1-a71c-b2bddb5f785d','158b5f51-dd0f-4cdb-87ba-70374510314f','\0','${role_manage-realm}','manage-realm','itesoft','158b5f51-dd0f-4cdb-87ba-70374510314f',NULL,'\0'),('198215a1-a598-4ff1-b3b7-55b927c849a1','f9bfbcc1-a943-41a8-b968-5fcf730edd2f','\0','${role_manage-events}','manage-events','master','f9bfbcc1-a943-41a8-b968-5fcf730edd2f',NULL,'\0'),('1cd3c2ff-27cd-4cf2-9d10-803f9a915188','f6d06cce-b911-47b3-b08e-06340679586a','\0','${role_manage-identity-providers}','manage-identity-providers','master','f6d06cce-b911-47b3-b08e-06340679586a',NULL,'\0'),('204c0bcd-bad0-4410-ab58-c72d331f4234','158b5f51-dd0f-4cdb-87ba-70374510314f','\0','${role_impersonation}','impersonation','itesoft','158b5f51-dd0f-4cdb-87ba-70374510314f',NULL,'\0'),('30816107-06f6-4014-9051-4006b6486869','f6d06cce-b911-47b3-b08e-06340679586a','\0','${role_manage-users}','manage-users','master','f6d06cce-b911-47b3-b08e-06340679586a',NULL,'\0'),('337e3245-ee58-4bf2-9693-15b324336acd','158b5f51-dd0f-4cdb-87ba-70374510314f','\0','${role_view-users}','view-users','itesoft','158b5f51-dd0f-4cdb-87ba-70374510314f',NULL,'\0'),('3417d97d-aeee-47ad-8473-0c52d5ff2c07','55505b70-9163-42e9-a0e2-7d3e6a7c4ad7','\0','${role_view-profile}','view-profile','master','55505b70-9163-42e9-a0e2-7d3e6a7c4ad7',NULL,'\0'),('3a650e95-aff9-4313-ac95-ff20621c74be','f6d06cce-b911-47b3-b08e-06340679586a','\0','${role_view-realm}','view-realm','master','f6d06cce-b911-47b3-b08e-06340679586a',NULL,'\0'),('3c22a92e-ac72-437d-a1a6-da9147515da4','f6d06cce-b911-47b3-b08e-06340679586a','\0','${role_view-identity-providers}','view-identity-providers','master','f6d06cce-b911-47b3-b08e-06340679586a',NULL,'\0'),('3cfe7861-e2bb-4055-8ac3-f1e5a43eed2b','f6d06cce-b911-47b3-b08e-06340679586a','\0','${role_view-clients}','view-clients','master','f6d06cce-b911-47b3-b08e-06340679586a',NULL,'\0'),('3d7fe705-fe77-40d6-92b2-1663068ea6ca','158b5f51-dd0f-4cdb-87ba-70374510314f','\0','${role_view-identity-providers}','view-identity-providers','itesoft','158b5f51-dd0f-4cdb-87ba-70374510314f',NULL,'\0'),('3e316004-4b30-4a92-9fa9-2a4886a28402','f9bfbcc1-a943-41a8-b968-5fcf730edd2f','\0','${role_manage-users}','manage-users','master','f9bfbcc1-a943-41a8-b968-5fcf730edd2f',NULL,'\0'),('41d7b0e3-f12e-4389-bb63-09d73522627a','158b5f51-dd0f-4cdb-87ba-70374510314f','\0','${role_view-events}','view-events','itesoft','158b5f51-dd0f-4cdb-87ba-70374510314f',NULL,'\0'),('430e36d9-ea20-4960-bfe1-a469510eb05b','158b5f51-dd0f-4cdb-87ba-70374510314f','\0','${role_view-clients}','view-clients','itesoft','158b5f51-dd0f-4cdb-87ba-70374510314f',NULL,'\0'),('5f7178e1-e456-4dbd-8c65-6ca09d2af5aa','f9bfbcc1-a943-41a8-b968-5fcf730edd2f','\0','${role_manage-realm}','manage-realm','master','f9bfbcc1-a943-41a8-b968-5fcf730edd2f',NULL,'\0'),('61caf119-ef9b-41fc-a0bd-28ea955157af','158b5f51-dd0f-4cdb-87ba-70374510314f','\0','${role_manage-identity-providers}','manage-identity-providers','itesoft','158b5f51-dd0f-4cdb-87ba-70374510314f',NULL,'\0'),('69f2f36a-b629-4349-b4d6-b173ce861e8a','f6d06cce-b911-47b3-b08e-06340679586a','\0','${role_manage-events}','manage-events','master','f6d06cce-b911-47b3-b08e-06340679586a',NULL,'\0'),('74a5cad1-d305-452d-aaa2-ae848dcba23f','itesoft','\0','${role_offline-access}','offline_access','itesoft',NULL,'itesoft','\0'),('87b1be87-43ec-4c20-9aaf-aa26ec2ea489','158b5f51-dd0f-4cdb-87ba-70374510314f','\0','${role_manage-events}','manage-events','itesoft','158b5f51-dd0f-4cdb-87ba-70374510314f',NULL,'\0'),('893354c6-abe8-4ec3-b1b4-74aafd0a28a1','f9bfbcc1-a943-41a8-b968-5fcf730edd2f','\0','${role_view-events}','view-events','master','f9bfbcc1-a943-41a8-b968-5fcf730edd2f',NULL,'\0'),('8c0d0ab7-b09b-4f3f-b59d-3e6e3d8325f5','8f292a09-153a-42c5-adab-dec5a553db65','\0','${role_read-token}','read-token','itesoft','8f292a09-153a-42c5-adab-dec5a553db65',NULL,'\0'),('98e0d15c-e252-48e4-9fa4-1644bdf0a6c6','f6d06cce-b911-47b3-b08e-06340679586a','\0','${role_create-client}','create-client','master','f6d06cce-b911-47b3-b08e-06340679586a',NULL,'\0'),('9b50d922-29ef-4142-bf11-8734ce1e02bd','f9bfbcc1-a943-41a8-b968-5fcf730edd2f','\0','${role_view-users}','view-users','master','f9bfbcc1-a943-41a8-b968-5fcf730edd2f',NULL,'\0'),('a579b4c6-3ccc-4332-8981-60132d06e479','f6d06cce-b911-47b3-b08e-06340679586a','\0','${role_manage-clients}','manage-clients','master','f6d06cce-b911-47b3-b08e-06340679586a',NULL,'\0'),('a73ae123-2696-4706-94fb-b8449a35a0ec','f9bfbcc1-a943-41a8-b968-5fcf730edd2f','\0','${role_manage-identity-providers}','manage-identity-providers','master','f9bfbcc1-a943-41a8-b968-5fcf730edd2f',NULL,'\0'),('a78cf71d-004c-4161-8610-5b0f8cb87094','f9bfbcc1-a943-41a8-b968-5fcf730edd2f','\0','${role_view-realm}','view-realm','master','f9bfbcc1-a943-41a8-b968-5fcf730edd2f',NULL,'\0'),('aa7f2f4b-bfc5-474f-8d17-e61bb346cc36','158b5f51-dd0f-4cdb-87ba-70374510314f','\0','${role_create-client}','create-client','itesoft','158b5f51-dd0f-4cdb-87ba-70374510314f',NULL,'\0'),('b0ca92ea-aaa6-4219-b4cb-99dc91886b10','f9bfbcc1-a943-41a8-b968-5fcf730edd2f','\0','${role_view-identity-providers}','view-identity-providers','master','f9bfbcc1-a943-41a8-b968-5fcf730edd2f',NULL,'\0'),('b78eef9b-76df-49b9-af29-4eeb5bb1fcc1','f6d06cce-b911-47b3-b08e-06340679586a','\0','${role_manage-realm}','manage-realm','master','f6d06cce-b911-47b3-b08e-06340679586a',NULL,'\0'),('bc3379ba-b511-45c5-ad3f-154fed311043','f6d06cce-b911-47b3-b08e-06340679586a','\0','${role_view-events}','view-events','master','f6d06cce-b911-47b3-b08e-06340679586a',NULL,'\0'),('bcba7b0d-b760-446b-86dd-371961945b78','f9bfbcc1-a943-41a8-b968-5fcf730edd2f','\0','${role_create-client}','create-client','master','f9bfbcc1-a943-41a8-b968-5fcf730edd2f',NULL,'\0'),('be0b9f0f-8bee-4238-b06f-ce2b592d25ba','750a0c5d-bc3d-4d31-b3a8-987a0ae84878','\0','${role_view-profile}','view-profile','itesoft','750a0c5d-bc3d-4d31-b3a8-987a0ae84878',NULL,'\0'),('bf88c4eb-5037-431c-8193-53e5f9282c2a','master','\0','${role_admin}','admin','master',NULL,'master','\0'),('c0d0038e-6cd7-498f-8e6e-2b40c36769dd','f6d06cce-b911-47b3-b08e-06340679586a','\0','${role_impersonation}','impersonation','master','f6d06cce-b911-47b3-b08e-06340679586a',NULL,'\0'),('c730c08d-389a-44da-96b6-7a6d7d01f8dd','750a0c5d-bc3d-4d31-b3a8-987a0ae84878','\0','${role_manage-account}','manage-account','itesoft','750a0c5d-bc3d-4d31-b3a8-987a0ae84878',NULL,'\0'),('c8013eab-8ffe-4040-897c-01e2d323a4c3','284f40a5-e7cf-47e9-be88-7055f5786efa','\0','${role_read-token}','read-token','master','284f40a5-e7cf-47e9-be88-7055f5786efa',NULL,'\0'),('c8ff143c-ab47-4a0a-8f11-02b672917c63','f9bfbcc1-a943-41a8-b968-5fcf730edd2f','\0','${role_manage-clients}','manage-clients','master','f9bfbcc1-a943-41a8-b968-5fcf730edd2f',NULL,'\0'),('c9f54572-de17-4cfe-96ea-211bc648871c','f6d06cce-b911-47b3-b08e-06340679586a','\0','${role_view-users}','view-users','master','f6d06cce-b911-47b3-b08e-06340679586a',NULL,'\0'),('cd6ef739-3a11-4609-b8ab-71bb746420d1','f9bfbcc1-a943-41a8-b968-5fcf730edd2f','\0','${role_impersonation}','impersonation','master','f9bfbcc1-a943-41a8-b968-5fcf730edd2f',NULL,'\0'),('cfaff2a8-d519-4b8a-9c6a-6306034f9895','master','\0','${role_create-realm}','create-realm','master',NULL,'master','\0'),('d7df54d1-1498-4b63-ad51-cb32c9a450c3','master','\0','${role_offline-access}','offline_access','master',NULL,'master','\0'),('da395e3f-d11e-4277-88ca-3284110f1916','f9bfbcc1-a943-41a8-b968-5fcf730edd2f','\0','${role_view-clients}','view-clients','master','f9bfbcc1-a943-41a8-b968-5fcf730edd2f',NULL,'\0'),('dc688bff-c692-44e3-9371-4581f8802d7d','158b5f51-dd0f-4cdb-87ba-70374510314f','\0','${role_manage-clients}','manage-clients','itesoft','158b5f51-dd0f-4cdb-87ba-70374510314f',NULL,'\0'),('e45423d6-af2a-4b9e-a906-c99207932548','158b5f51-dd0f-4cdb-87ba-70374510314f','\0','${role_realm-admin}','realm-admin','itesoft','158b5f51-dd0f-4cdb-87ba-70374510314f',NULL,'\0'),('f4e03955-3678-4451-9738-8672541b4076','55505b70-9163-42e9-a0e2-7d3e6a7c4ad7','\0','${role_manage-account}','manage-account','master','55505b70-9163-42e9-a0e2-7d3e6a7c4ad7',NULL,'\0');
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
INSERT INTO `PROTOCOL_MAPPER` VALUES ('02aa7106-3ba7-4e01-81ee-9077f34e3e12','locale','openid-connect','oidc-usermodel-attribute-mapper','\0','${locale}','c6cb72b7-ddf0-4246-8208-b82cc5cb21c1'),('10186514-fd58-4349-b3d3-9e69a343c700','role list','saml','saml-role-list-mapper','\0',NULL,'55505b70-9163-42e9-a0e2-7d3e6a7c4ad7'),('186103fe-d6fc-4c19-9c7e-c24e13d6a929','email','openid-connect','oidc-usermodel-property-mapper','\0','${email}','bd4095d4-6c29-4aa3-9baa-0978157aedc6'),('1a9062cc-dadb-43e6-b7bf-ccbb71e8f39b','role list','saml','saml-role-list-mapper','\0',NULL,'750a0c5d-bc3d-4d31-b3a8-987a0ae84878'),('1d9efb49-2e9e-49d2-863d-a655d1163205','full name','openid-connect','oidc-full-name-mapper','\0','${fullName}','c6cb72b7-ddf0-4246-8208-b82cc5cb21c1'),('1f88b013-3943-46ec-bdea-66251c1ff6c6','role list','saml','saml-role-list-mapper','\0',NULL,'158b5f51-dd0f-4cdb-87ba-70374510314f'),('2026408d-6157-4dd0-a0e2-4e5d243745c4','username','openid-connect','oidc-usermodel-property-mapper','\0','${username}','62203531-01d5-47ef-8c27-a8555cd91c30'),('20447d78-393b-41dd-a9c5-6100feeb4b08','role list','saml','saml-role-list-mapper','\0',NULL,'c6cb72b7-ddf0-4246-8208-b82cc5cb21c1'),('21c9c14a-9443-4ceb-96aa-8d90736f2571','given name','openid-connect','oidc-usermodel-property-mapper','\0','${givenName}','bd4095d4-6c29-4aa3-9baa-0978157aedc6'),('22b0c692-289d-4e29-b424-faa47edd1ada','family name','openid-connect','oidc-usermodel-property-mapper','\0','${familyName}','c6cb72b7-ddf0-4246-8208-b82cc5cb21c1'),('2314fe5a-14bb-4bda-a6a3-54f782bbded5','family name','openid-connect','oidc-usermodel-property-mapper','\0','${familyName}','158b5f51-dd0f-4cdb-87ba-70374510314f'),('2c164f20-5bbc-4bce-9811-e2f848be9610','email','openid-connect','oidc-usermodel-property-mapper','\0','${email}','50368b55-4585-4da0-896f-8026ea9a311a'),('2e0354ff-6b2c-4996-8bae-7ad9f20ea8df','email','openid-connect','oidc-usermodel-property-mapper','\0','${email}','55505b70-9163-42e9-a0e2-7d3e6a7c4ad7'),('3043ecbb-396f-4a9b-afd1-ceec2a5b5371','full name','openid-connect','oidc-full-name-mapper','\0','${fullName}','50368b55-4585-4da0-896f-8026ea9a311a'),('39081a88-879e-43d8-9bb6-2daae2a75dd9','given name','openid-connect','oidc-usermodel-property-mapper','\0','${givenName}','55505b70-9163-42e9-a0e2-7d3e6a7c4ad7'),('397d2f18-8fc5-4a9e-a1d1-67c336b4021a','email','openid-connect','oidc-usermodel-property-mapper','\0','${email}','c6cb72b7-ddf0-4246-8208-b82cc5cb21c1'),('3e12cf61-3ce7-4fd2-ad75-4843074d77ef','role list','saml','saml-role-list-mapper','\0',NULL,'bd4095d4-6c29-4aa3-9baa-0978157aedc6'),('3fe1c6e4-c6b0-489e-b359-43f1aec1d115','email','openid-connect','oidc-usermodel-property-mapper','\0','${email}','8f292a09-153a-42c5-adab-dec5a553db65'),('427e0f44-d92e-4903-b21c-f71f46109d11','family name','openid-connect','oidc-usermodel-property-mapper','\0','${familyName}','bd4095d4-6c29-4aa3-9baa-0978157aedc6'),('437879f9-f7e8-4d7d-baff-c873f1a3b4c0','email','openid-connect','oidc-usermodel-property-mapper','\0','${email}','750a0c5d-bc3d-4d31-b3a8-987a0ae84878'),('47b6a723-82d5-4a0f-9b1a-7a50d996f0db','given name','openid-connect','oidc-usermodel-property-mapper','\0','${givenName}','750a0c5d-bc3d-4d31-b3a8-987a0ae84878'),('508a64e6-9ab6-4243-aa75-b096cab5dcd8','username','openid-connect','oidc-usermodel-property-mapper','\0','${username}','50368b55-4585-4da0-896f-8026ea9a311a'),('51e7dcc6-94bc-4e60-bb35-0008455f9222','full name','openid-connect','oidc-full-name-mapper','\0','${fullName}','284f40a5-e7cf-47e9-be88-7055f5786efa'),('52f8d096-cbb6-4b6c-8c67-63a9c3f92f05','full name','openid-connect','oidc-full-name-mapper','\0','${fullName}','750a0c5d-bc3d-4d31-b3a8-987a0ae84878'),('56f07dcd-f2e2-4008-b1a7-90e90135f37a','role list','saml','saml-role-list-mapper','\0',NULL,'50368b55-4585-4da0-896f-8026ea9a311a'),('5c3e745a-1f58-436a-bb09-66d0c1b15362','username','openid-connect','oidc-usermodel-property-mapper','\0','${username}','c6cb72b7-ddf0-4246-8208-b82cc5cb21c1'),('61f92c23-70cf-4362-a0f7-6ef6eecdffe5','full name','openid-connect','oidc-full-name-mapper','\0','${fullName}','8f292a09-153a-42c5-adab-dec5a553db65'),('652597d2-b720-4990-8be3-187108678b22','given name','openid-connect','oidc-usermodel-property-mapper','','${givenName}','fd634189-7f7c-428a-a728-e74bd369cb0f'),('6618b4f8-f2a8-4b38-b192-7e6f2dbb5c67','given name','openid-connect','oidc-usermodel-property-mapper','\0','${givenName}','c6cb72b7-ddf0-4246-8208-b82cc5cb21c1'),('6aa184b5-aa9e-48f3-81e5-c24664cddc81','family name','openid-connect','oidc-usermodel-property-mapper','\0','${familyName}','284f40a5-e7cf-47e9-be88-7055f5786efa'),('6b946d20-ecf5-4993-a6e6-756f3e04af07','given name','openid-connect','oidc-usermodel-property-mapper','\0','${givenName}','8f292a09-153a-42c5-adab-dec5a553db65'),('733e4fa4-fc42-46c8-922d-312b9df13d47','full name','openid-connect','oidc-full-name-mapper','\0','${fullName}','f6d06cce-b911-47b3-b08e-06340679586a'),('742e8d4c-13f5-4c22-b010-9e12542df910','full name','openid-connect','oidc-full-name-mapper','','${fullName}','fd634189-7f7c-428a-a728-e74bd369cb0f'),('7693e627-ef74-4051-8519-7c713855ad0a','email','openid-connect','oidc-usermodel-property-mapper','\0','${email}','f6d06cce-b911-47b3-b08e-06340679586a'),('7803bbc5-f5b6-42c7-af4b-f4458e31c89c','given name','openid-connect','oidc-usermodel-property-mapper','\0','${givenName}','f6d06cce-b911-47b3-b08e-06340679586a'),('78bbfe86-1c98-4ece-a375-4a21ea7a736d','role list','saml','saml-role-list-mapper','\0',NULL,'fd634189-7f7c-428a-a728-e74bd369cb0f'),('7954735a-26c7-4eeb-9f5c-e47e3d24c123','full name','openid-connect','oidc-full-name-mapper','\0','${fullName}','f9bfbcc1-a943-41a8-b968-5fcf730edd2f'),('79dd651f-d949-4fc8-9f3b-da51b9e9d79e','given name','openid-connect','oidc-usermodel-property-mapper','\0','${givenName}','50368b55-4585-4da0-896f-8026ea9a311a'),('7a6e2c68-ff1e-4d9f-b0ea-a8c449826b04','family name','openid-connect','oidc-usermodel-property-mapper','\0','${familyName}','f6d06cce-b911-47b3-b08e-06340679586a'),('7ec77c3e-80de-4d81-a03c-658da676d7c2','family name','openid-connect','oidc-usermodel-property-mapper','\0','${familyName}','8f292a09-153a-42c5-adab-dec5a553db65'),('85531d64-bf4b-4208-a72f-ddccd5adf7ed','given name','openid-connect','oidc-usermodel-property-mapper','\0','${givenName}','f9bfbcc1-a943-41a8-b968-5fcf730edd2f'),('870f7841-bc3b-4667-9292-54f3cdc7c153','username','openid-connect','oidc-usermodel-property-mapper','\0','${username}','158b5f51-dd0f-4cdb-87ba-70374510314f'),('89ee3485-f6da-48f9-84f4-3bf35d510216','given name','openid-connect','oidc-usermodel-property-mapper','\0','${givenName}','284f40a5-e7cf-47e9-be88-7055f5786efa'),('922a439f-c140-4ec3-94b7-b5bee768a401','email','openid-connect','oidc-usermodel-property-mapper','\0','${email}','f9bfbcc1-a943-41a8-b968-5fcf730edd2f'),('9420dd0b-ac32-4b1b-8ab0-feb899378463','role list','saml','saml-role-list-mapper','\0',NULL,'f6d06cce-b911-47b3-b08e-06340679586a'),('9452c904-b5ae-4dd7-8a35-5ff04b426ec1','email','openid-connect','oidc-usermodel-property-mapper','\0','${email}','284f40a5-e7cf-47e9-be88-7055f5786efa'),('991e6136-53de-44f6-bc3a-62af00d27c2f','given name','openid-connect','oidc-usermodel-property-mapper','\0','${givenName}','158b5f51-dd0f-4cdb-87ba-70374510314f'),('9b0c8b19-e682-4491-baf9-9edc987fd02c','full name','openid-connect','oidc-full-name-mapper','\0','${fullName}','55505b70-9163-42e9-a0e2-7d3e6a7c4ad7'),('9b30f6c3-fbc5-4c6f-9e61-a1c59526b7ff','full name','openid-connect','oidc-full-name-mapper','\0','${fullName}','62203531-01d5-47ef-8c27-a8555cd91c30'),('a2e1eb72-3bc4-4ecc-8be6-9c3e9643c28a','supplier-id','openid-connect','oidc-hardcoded-claim-mapper','\0',NULL,'fd634189-7f7c-428a-a728-e74bd369cb0f'),('a5db520c-01f3-4c91-880f-5c0130e7baef','email','openid-connect','oidc-usermodel-property-mapper','\0','${email}','158b5f51-dd0f-4cdb-87ba-70374510314f'),('a6622474-1a8b-4ef3-a149-9f398897eb83','username','openid-connect','oidc-usermodel-property-mapper','\0','${username}','f9bfbcc1-a943-41a8-b968-5fcf730edd2f'),('a94f0f36-64eb-4691-b4ac-f0526db10c1c','username','openid-connect','oidc-usermodel-property-mapper','\0','${username}','f6d06cce-b911-47b3-b08e-06340679586a'),('b464b6f3-ec8e-40b3-a744-c03871f9e2b3','locale','openid-connect','oidc-usermodel-attribute-mapper','\0','${locale}','bd4095d4-6c29-4aa3-9baa-0978157aedc6'),('b6a685d1-49ac-41ea-b80e-82cdf00f0f07','username','openid-connect','oidc-usermodel-property-mapper','','${username}','fd634189-7f7c-428a-a728-e74bd369cb0f'),('b9a088be-812a-4e54-a320-e7060c131583','username','openid-connect','oidc-usermodel-property-mapper','\0','${username}','284f40a5-e7cf-47e9-be88-7055f5786efa'),('bdedd755-fbd1-45d5-abe7-22cd0840dee6','given name','openid-connect','oidc-usermodel-property-mapper','\0','${givenName}','62203531-01d5-47ef-8c27-a8555cd91c30'),('be9eebda-bde6-4a2d-bcda-457d8ca3a3c6','full name','openid-connect','oidc-full-name-mapper','\0','${fullName}','bd4095d4-6c29-4aa3-9baa-0978157aedc6'),('c0c00836-fe9e-401e-aa29-4e2734287ce0','family name','openid-connect','oidc-usermodel-property-mapper','\0','${familyName}','f9bfbcc1-a943-41a8-b968-5fcf730edd2f'),('c2931be4-30f4-491c-8165-0fcb869f0d8c','family name','openid-connect','oidc-usermodel-property-mapper','\0','${familyName}','750a0c5d-bc3d-4d31-b3a8-987a0ae84878'),('c519ee08-1704-49a4-8dd3-638fea1e34b3','role list','saml','saml-role-list-mapper','\0',NULL,'284f40a5-e7cf-47e9-be88-7055f5786efa'),('c79a9131-03e0-4646-ab52-92e00804d4cf','email','openid-connect','oidc-usermodel-property-mapper','\0','${email}','62203531-01d5-47ef-8c27-a8555cd91c30'),('ca0d6a41-a0a0-43df-8b50-11ed6dbdcbfc','role list','saml','saml-role-list-mapper','\0',NULL,'62203531-01d5-47ef-8c27-a8555cd91c30'),('ca9bd227-aa17-4395-9e35-8ffd481992cc','email','openid-connect','oidc-usermodel-property-mapper','','${email}','fd634189-7f7c-428a-a728-e74bd369cb0f'),('cb2255f9-f774-4d39-83d9-a773b4b61b64','family name','openid-connect','oidc-usermodel-property-mapper','\0','${familyName}','55505b70-9163-42e9-a0e2-7d3e6a7c4ad7'),('da35e1c2-594c-4f5c-8668-685e4ba1bff5','username','openid-connect','oidc-usermodel-property-mapper','\0','${username}','bd4095d4-6c29-4aa3-9baa-0978157aedc6'),('dfe6a378-9ec5-4935-aac7-d4be81e74dac','username','openid-connect','oidc-usermodel-property-mapper','\0','${username}','8f292a09-153a-42c5-adab-dec5a553db65'),('e197517e-5d41-46ad-a289-aa9b06d9320a','family name','openid-connect','oidc-usermodel-property-mapper','\0','${familyName}','50368b55-4585-4da0-896f-8026ea9a311a'),('e37ee242-4482-409a-b46b-86e6da378a22','role list','saml','saml-role-list-mapper','\0',NULL,'f9bfbcc1-a943-41a8-b968-5fcf730edd2f'),('e3f4f194-9ece-4663-918c-f48f326b7a96','family name','openid-connect','oidc-usermodel-property-mapper','\0','${familyName}','62203531-01d5-47ef-8c27-a8555cd91c30'),('e57671dd-7546-4ced-85eb-b47a8079bab4','role list','saml','saml-role-list-mapper','\0',NULL,'8f292a09-153a-42c5-adab-dec5a553db65'),('ee42acc1-87d8-4673-b1ae-8f8d317af0d3','username','openid-connect','oidc-usermodel-property-mapper','\0','${username}','55505b70-9163-42e9-a0e2-7d3e6a7c4ad7'),('eeedea9e-2ea0-4d55-81a5-0b4aaebeb05a','full name','openid-connect','oidc-full-name-mapper','\0','${fullName}','158b5f51-dd0f-4cdb-87ba-70374510314f'),('f09720dc-1509-4a91-a450-16c8764334c8','username','openid-connect','oidc-usermodel-property-mapper','\0','${username}','750a0c5d-bc3d-4d31-b3a8-987a0ae84878'),('f7827958-9825-4e84-b9c5-874e780b4fb3','family name','openid-connect','oidc-usermodel-property-mapper','','${familyName}','fd634189-7f7c-428a-a728-e74bd369cb0f');
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
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('02aa7106-3ba7-4e01-81ee-9077f34e3e12','true','access.token.claim'),('02aa7106-3ba7-4e01-81ee-9077f34e3e12','locale','claim.name'),('02aa7106-3ba7-4e01-81ee-9077f34e3e12','true','id.token.claim'),('02aa7106-3ba7-4e01-81ee-9077f34e3e12','String','jsonType.label'),('02aa7106-3ba7-4e01-81ee-9077f34e3e12','locale','user.attribute'),('10186514-fd58-4349-b3d3-9e69a343c700','Role','attribute.name'),('10186514-fd58-4349-b3d3-9e69a343c700','Basic','attribute.nameformat'),('10186514-fd58-4349-b3d3-9e69a343c700','false','single'),('186103fe-d6fc-4c19-9c7e-c24e13d6a929','true','access.token.claim'),('186103fe-d6fc-4c19-9c7e-c24e13d6a929','email','claim.name'),('186103fe-d6fc-4c19-9c7e-c24e13d6a929','true','id.token.claim'),('186103fe-d6fc-4c19-9c7e-c24e13d6a929','String','jsonType.label'),('186103fe-d6fc-4c19-9c7e-c24e13d6a929','email','user.attribute'),('1a9062cc-dadb-43e6-b7bf-ccbb71e8f39b','Role','attribute.name'),('1a9062cc-dadb-43e6-b7bf-ccbb71e8f39b','Basic','attribute.nameformat'),('1a9062cc-dadb-43e6-b7bf-ccbb71e8f39b','false','single'),('1d9efb49-2e9e-49d2-863d-a655d1163205','true','access.token.claim'),('1d9efb49-2e9e-49d2-863d-a655d1163205','true','id.token.claim'),('1f88b013-3943-46ec-bdea-66251c1ff6c6','Role','attribute.name'),('1f88b013-3943-46ec-bdea-66251c1ff6c6','Basic','attribute.nameformat'),('1f88b013-3943-46ec-bdea-66251c1ff6c6','false','single'),('2026408d-6157-4dd0-a0e2-4e5d243745c4','true','access.token.claim'),('2026408d-6157-4dd0-a0e2-4e5d243745c4','preferred_username','claim.name'),('2026408d-6157-4dd0-a0e2-4e5d243745c4','true','id.token.claim'),('2026408d-6157-4dd0-a0e2-4e5d243745c4','String','jsonType.label'),('2026408d-6157-4dd0-a0e2-4e5d243745c4','username','user.attribute'),('20447d78-393b-41dd-a9c5-6100feeb4b08','Role','attribute.name'),('20447d78-393b-41dd-a9c5-6100feeb4b08','Basic','attribute.nameformat'),('20447d78-393b-41dd-a9c5-6100feeb4b08','false','single'),('21c9c14a-9443-4ceb-96aa-8d90736f2571','true','access.token.claim'),('21c9c14a-9443-4ceb-96aa-8d90736f2571','given_name','claim.name'),('21c9c14a-9443-4ceb-96aa-8d90736f2571','true','id.token.claim'),('21c9c14a-9443-4ceb-96aa-8d90736f2571','String','jsonType.label'),('21c9c14a-9443-4ceb-96aa-8d90736f2571','firstName','user.attribute'),('22b0c692-289d-4e29-b424-faa47edd1ada','true','access.token.claim'),('22b0c692-289d-4e29-b424-faa47edd1ada','family_name','claim.name'),('22b0c692-289d-4e29-b424-faa47edd1ada','true','id.token.claim'),('22b0c692-289d-4e29-b424-faa47edd1ada','String','jsonType.label'),('22b0c692-289d-4e29-b424-faa47edd1ada','lastName','user.attribute'),('2314fe5a-14bb-4bda-a6a3-54f782bbded5','true','access.token.claim'),('2314fe5a-14bb-4bda-a6a3-54f782bbded5','family_name','claim.name'),('2314fe5a-14bb-4bda-a6a3-54f782bbded5','true','id.token.claim'),('2314fe5a-14bb-4bda-a6a3-54f782bbded5','String','jsonType.label'),('2314fe5a-14bb-4bda-a6a3-54f782bbded5','lastName','user.attribute'),('2c164f20-5bbc-4bce-9811-e2f848be9610','true','access.token.claim'),('2c164f20-5bbc-4bce-9811-e2f848be9610','email','claim.name'),('2c164f20-5bbc-4bce-9811-e2f848be9610','true','id.token.claim'),('2c164f20-5bbc-4bce-9811-e2f848be9610','String','jsonType.label'),('2c164f20-5bbc-4bce-9811-e2f848be9610','email','user.attribute'),('2e0354ff-6b2c-4996-8bae-7ad9f20ea8df','true','access.token.claim'),('2e0354ff-6b2c-4996-8bae-7ad9f20ea8df','email','claim.name'),('2e0354ff-6b2c-4996-8bae-7ad9f20ea8df','true','id.token.claim'),('2e0354ff-6b2c-4996-8bae-7ad9f20ea8df','String','jsonType.label'),('2e0354ff-6b2c-4996-8bae-7ad9f20ea8df','email','user.attribute'),('3043ecbb-396f-4a9b-afd1-ceec2a5b5371','true','access.token.claim'),('3043ecbb-396f-4a9b-afd1-ceec2a5b5371','true','id.token.claim'),('39081a88-879e-43d8-9bb6-2daae2a75dd9','true','access.token.claim'),('39081a88-879e-43d8-9bb6-2daae2a75dd9','given_name','claim.name'),('39081a88-879e-43d8-9bb6-2daae2a75dd9','true','id.token.claim'),('39081a88-879e-43d8-9bb6-2daae2a75dd9','String','jsonType.label'),('39081a88-879e-43d8-9bb6-2daae2a75dd9','firstName','user.attribute'),('397d2f18-8fc5-4a9e-a1d1-67c336b4021a','true','access.token.claim'),('397d2f18-8fc5-4a9e-a1d1-67c336b4021a','email','claim.name'),('397d2f18-8fc5-4a9e-a1d1-67c336b4021a','true','id.token.claim'),('397d2f18-8fc5-4a9e-a1d1-67c336b4021a','String','jsonType.label'),('397d2f18-8fc5-4a9e-a1d1-67c336b4021a','email','user.attribute'),('3e12cf61-3ce7-4fd2-ad75-4843074d77ef','Role','attribute.name'),('3e12cf61-3ce7-4fd2-ad75-4843074d77ef','Basic','attribute.nameformat'),('3e12cf61-3ce7-4fd2-ad75-4843074d77ef','false','single'),('3fe1c6e4-c6b0-489e-b359-43f1aec1d115','true','access.token.claim'),('3fe1c6e4-c6b0-489e-b359-43f1aec1d115','email','claim.name'),('3fe1c6e4-c6b0-489e-b359-43f1aec1d115','true','id.token.claim'),('3fe1c6e4-c6b0-489e-b359-43f1aec1d115','String','jsonType.label'),('3fe1c6e4-c6b0-489e-b359-43f1aec1d115','email','user.attribute'),('427e0f44-d92e-4903-b21c-f71f46109d11','true','access.token.claim'),('427e0f44-d92e-4903-b21c-f71f46109d11','family_name','claim.name'),('427e0f44-d92e-4903-b21c-f71f46109d11','true','id.token.claim'),('427e0f44-d92e-4903-b21c-f71f46109d11','String','jsonType.label'),('427e0f44-d92e-4903-b21c-f71f46109d11','lastName','user.attribute'),('437879f9-f7e8-4d7d-baff-c873f1a3b4c0','true','access.token.claim'),('437879f9-f7e8-4d7d-baff-c873f1a3b4c0','email','claim.name'),('437879f9-f7e8-4d7d-baff-c873f1a3b4c0','true','id.token.claim'),('437879f9-f7e8-4d7d-baff-c873f1a3b4c0','String','jsonType.label'),('437879f9-f7e8-4d7d-baff-c873f1a3b4c0','email','user.attribute'),('47b6a723-82d5-4a0f-9b1a-7a50d996f0db','true','access.token.claim'),('47b6a723-82d5-4a0f-9b1a-7a50d996f0db','given_name','claim.name'),('47b6a723-82d5-4a0f-9b1a-7a50d996f0db','true','id.token.claim'),('47b6a723-82d5-4a0f-9b1a-7a50d996f0db','String','jsonType.label'),('47b6a723-82d5-4a0f-9b1a-7a50d996f0db','firstName','user.attribute'),('508a64e6-9ab6-4243-aa75-b096cab5dcd8','true','access.token.claim'),('508a64e6-9ab6-4243-aa75-b096cab5dcd8','preferred_username','claim.name'),('508a64e6-9ab6-4243-aa75-b096cab5dcd8','true','id.token.claim'),('508a64e6-9ab6-4243-aa75-b096cab5dcd8','String','jsonType.label'),('508a64e6-9ab6-4243-aa75-b096cab5dcd8','username','user.attribute'),('51e7dcc6-94bc-4e60-bb35-0008455f9222','true','access.token.claim'),('51e7dcc6-94bc-4e60-bb35-0008455f9222','true','id.token.claim'),('52f8d096-cbb6-4b6c-8c67-63a9c3f92f05','true','access.token.claim'),('52f8d096-cbb6-4b6c-8c67-63a9c3f92f05','true','id.token.claim'),('56f07dcd-f2e2-4008-b1a7-90e90135f37a','Role','attribute.name'),('56f07dcd-f2e2-4008-b1a7-90e90135f37a','Basic','attribute.nameformat'),('56f07dcd-f2e2-4008-b1a7-90e90135f37a','false','single'),('5c3e745a-1f58-436a-bb09-66d0c1b15362','true','access.token.claim'),('5c3e745a-1f58-436a-bb09-66d0c1b15362','preferred_username','claim.name'),('5c3e745a-1f58-436a-bb09-66d0c1b15362','true','id.token.claim'),('5c3e745a-1f58-436a-bb09-66d0c1b15362','String','jsonType.label'),('5c3e745a-1f58-436a-bb09-66d0c1b15362','username','user.attribute'),('61f92c23-70cf-4362-a0f7-6ef6eecdffe5','true','access.token.claim'),('61f92c23-70cf-4362-a0f7-6ef6eecdffe5','true','id.token.claim'),('652597d2-b720-4990-8be3-187108678b22','true','access.token.claim'),('652597d2-b720-4990-8be3-187108678b22','given_name','claim.name'),('652597d2-b720-4990-8be3-187108678b22','true','id.token.claim'),('652597d2-b720-4990-8be3-187108678b22','String','jsonType.label'),('652597d2-b720-4990-8be3-187108678b22','firstName','user.attribute'),('6618b4f8-f2a8-4b38-b192-7e6f2dbb5c67','true','access.token.claim'),('6618b4f8-f2a8-4b38-b192-7e6f2dbb5c67','given_name','claim.name'),('6618b4f8-f2a8-4b38-b192-7e6f2dbb5c67','true','id.token.claim'),('6618b4f8-f2a8-4b38-b192-7e6f2dbb5c67','String','jsonType.label'),('6618b4f8-f2a8-4b38-b192-7e6f2dbb5c67','firstName','user.attribute'),('6aa184b5-aa9e-48f3-81e5-c24664cddc81','true','access.token.claim'),('6aa184b5-aa9e-48f3-81e5-c24664cddc81','family_name','claim.name'),('6aa184b5-aa9e-48f3-81e5-c24664cddc81','true','id.token.claim'),('6aa184b5-aa9e-48f3-81e5-c24664cddc81','String','jsonType.label'),('6aa184b5-aa9e-48f3-81e5-c24664cddc81','lastName','user.attribute'),('6b946d20-ecf5-4993-a6e6-756f3e04af07','true','access.token.claim'),('6b946d20-ecf5-4993-a6e6-756f3e04af07','given_name','claim.name'),('6b946d20-ecf5-4993-a6e6-756f3e04af07','true','id.token.claim'),('6b946d20-ecf5-4993-a6e6-756f3e04af07','String','jsonType.label'),('6b946d20-ecf5-4993-a6e6-756f3e04af07','firstName','user.attribute'),('733e4fa4-fc42-46c8-922d-312b9df13d47','true','access.token.claim'),('733e4fa4-fc42-46c8-922d-312b9df13d47','true','id.token.claim'),('742e8d4c-13f5-4c22-b010-9e12542df910','true','access.token.claim'),('742e8d4c-13f5-4c22-b010-9e12542df910','true','id.token.claim'),('7693e627-ef74-4051-8519-7c713855ad0a','true','access.token.claim'),('7693e627-ef74-4051-8519-7c713855ad0a','email','claim.name'),('7693e627-ef74-4051-8519-7c713855ad0a','true','id.token.claim'),('7693e627-ef74-4051-8519-7c713855ad0a','String','jsonType.label'),('7693e627-ef74-4051-8519-7c713855ad0a','email','user.attribute'),('7803bbc5-f5b6-42c7-af4b-f4458e31c89c','true','access.token.claim'),('7803bbc5-f5b6-42c7-af4b-f4458e31c89c','given_name','claim.name'),('7803bbc5-f5b6-42c7-af4b-f4458e31c89c','true','id.token.claim'),('7803bbc5-f5b6-42c7-af4b-f4458e31c89c','String','jsonType.label'),('7803bbc5-f5b6-42c7-af4b-f4458e31c89c','firstName','user.attribute'),('78bbfe86-1c98-4ece-a375-4a21ea7a736d','Role','attribute.name'),('78bbfe86-1c98-4ece-a375-4a21ea7a736d','Basic','attribute.nameformat'),('78bbfe86-1c98-4ece-a375-4a21ea7a736d','false','single'),('7954735a-26c7-4eeb-9f5c-e47e3d24c123','true','access.token.claim'),('7954735a-26c7-4eeb-9f5c-e47e3d24c123','true','id.token.claim'),('79dd651f-d949-4fc8-9f3b-da51b9e9d79e','true','access.token.claim'),('79dd651f-d949-4fc8-9f3b-da51b9e9d79e','given_name','claim.name'),('79dd651f-d949-4fc8-9f3b-da51b9e9d79e','true','id.token.claim'),('79dd651f-d949-4fc8-9f3b-da51b9e9d79e','String','jsonType.label'),('79dd651f-d949-4fc8-9f3b-da51b9e9d79e','firstName','user.attribute'),('7a6e2c68-ff1e-4d9f-b0ea-a8c449826b04','true','access.token.claim'),('7a6e2c68-ff1e-4d9f-b0ea-a8c449826b04','family_name','claim.name'),('7a6e2c68-ff1e-4d9f-b0ea-a8c449826b04','true','id.token.claim'),('7a6e2c68-ff1e-4d9f-b0ea-a8c449826b04','String','jsonType.label'),('7a6e2c68-ff1e-4d9f-b0ea-a8c449826b04','lastName','user.attribute'),('7ec77c3e-80de-4d81-a03c-658da676d7c2','true','access.token.claim'),('7ec77c3e-80de-4d81-a03c-658da676d7c2','family_name','claim.name'),('7ec77c3e-80de-4d81-a03c-658da676d7c2','true','id.token.claim'),('7ec77c3e-80de-4d81-a03c-658da676d7c2','String','jsonType.label'),('7ec77c3e-80de-4d81-a03c-658da676d7c2','lastName','user.attribute'),('85531d64-bf4b-4208-a72f-ddccd5adf7ed','true','access.token.claim'),('85531d64-bf4b-4208-a72f-ddccd5adf7ed','given_name','claim.name'),('85531d64-bf4b-4208-a72f-ddccd5adf7ed','true','id.token.claim'),('85531d64-bf4b-4208-a72f-ddccd5adf7ed','String','jsonType.label'),('85531d64-bf4b-4208-a72f-ddccd5adf7ed','firstName','user.attribute'),('870f7841-bc3b-4667-9292-54f3cdc7c153','true','access.token.claim'),('870f7841-bc3b-4667-9292-54f3cdc7c153','preferred_username','claim.name'),('870f7841-bc3b-4667-9292-54f3cdc7c153','true','id.token.claim'),('870f7841-bc3b-4667-9292-54f3cdc7c153','String','jsonType.label'),('870f7841-bc3b-4667-9292-54f3cdc7c153','username','user.attribute'),('89ee3485-f6da-48f9-84f4-3bf35d510216','true','access.token.claim'),('89ee3485-f6da-48f9-84f4-3bf35d510216','given_name','claim.name'),('89ee3485-f6da-48f9-84f4-3bf35d510216','true','id.token.claim'),('89ee3485-f6da-48f9-84f4-3bf35d510216','String','jsonType.label'),('89ee3485-f6da-48f9-84f4-3bf35d510216','firstName','user.attribute'),('922a439f-c140-4ec3-94b7-b5bee768a401','true','access.token.claim'),('922a439f-c140-4ec3-94b7-b5bee768a401','email','claim.name'),('922a439f-c140-4ec3-94b7-b5bee768a401','true','id.token.claim'),('922a439f-c140-4ec3-94b7-b5bee768a401','String','jsonType.label'),('922a439f-c140-4ec3-94b7-b5bee768a401','email','user.attribute'),('9420dd0b-ac32-4b1b-8ab0-feb899378463','Role','attribute.name'),('9420dd0b-ac32-4b1b-8ab0-feb899378463','Basic','attribute.nameformat'),('9420dd0b-ac32-4b1b-8ab0-feb899378463','false','single'),('9452c904-b5ae-4dd7-8a35-5ff04b426ec1','true','access.token.claim'),('9452c904-b5ae-4dd7-8a35-5ff04b426ec1','email','claim.name'),('9452c904-b5ae-4dd7-8a35-5ff04b426ec1','true','id.token.claim'),('9452c904-b5ae-4dd7-8a35-5ff04b426ec1','String','jsonType.label'),('9452c904-b5ae-4dd7-8a35-5ff04b426ec1','email','user.attribute'),('991e6136-53de-44f6-bc3a-62af00d27c2f','true','access.token.claim'),('991e6136-53de-44f6-bc3a-62af00d27c2f','given_name','claim.name'),('991e6136-53de-44f6-bc3a-62af00d27c2f','true','id.token.claim'),('991e6136-53de-44f6-bc3a-62af00d27c2f','String','jsonType.label'),('991e6136-53de-44f6-bc3a-62af00d27c2f','firstName','user.attribute'),('9b0c8b19-e682-4491-baf9-9edc987fd02c','true','access.token.claim'),('9b0c8b19-e682-4491-baf9-9edc987fd02c','true','id.token.claim'),('9b30f6c3-fbc5-4c6f-9e61-a1c59526b7ff','true','access.token.claim'),('9b30f6c3-fbc5-4c6f-9e61-a1c59526b7ff','true','id.token.claim'),('a2e1eb72-3bc4-4ecc-8be6-9c3e9643c28a','true','access.token.claim'),('a2e1eb72-3bc4-4ecc-8be6-9c3e9643c28a','supplier-id','claim.name'),('a2e1eb72-3bc4-4ecc-8be6-9c3e9643c28a','56','claim.value'),('a2e1eb72-3bc4-4ecc-8be6-9c3e9643c28a','true','id.token.claim'),('a5db520c-01f3-4c91-880f-5c0130e7baef','true','access.token.claim'),('a5db520c-01f3-4c91-880f-5c0130e7baef','email','claim.name'),('a5db520c-01f3-4c91-880f-5c0130e7baef','true','id.token.claim'),('a5db520c-01f3-4c91-880f-5c0130e7baef','String','jsonType.label'),('a5db520c-01f3-4c91-880f-5c0130e7baef','email','user.attribute'),('a6622474-1a8b-4ef3-a149-9f398897eb83','true','access.token.claim'),('a6622474-1a8b-4ef3-a149-9f398897eb83','preferred_username','claim.name'),('a6622474-1a8b-4ef3-a149-9f398897eb83','true','id.token.claim'),('a6622474-1a8b-4ef3-a149-9f398897eb83','String','jsonType.label'),('a6622474-1a8b-4ef3-a149-9f398897eb83','username','user.attribute'),('a94f0f36-64eb-4691-b4ac-f0526db10c1c','true','access.token.claim'),('a94f0f36-64eb-4691-b4ac-f0526db10c1c','preferred_username','claim.name'),('a94f0f36-64eb-4691-b4ac-f0526db10c1c','true','id.token.claim'),('a94f0f36-64eb-4691-b4ac-f0526db10c1c','String','jsonType.label'),('a94f0f36-64eb-4691-b4ac-f0526db10c1c','username','user.attribute'),('b464b6f3-ec8e-40b3-a744-c03871f9e2b3','true','access.token.claim'),('b464b6f3-ec8e-40b3-a744-c03871f9e2b3','locale','claim.name'),('b464b6f3-ec8e-40b3-a744-c03871f9e2b3','true','id.token.claim'),('b464b6f3-ec8e-40b3-a744-c03871f9e2b3','String','jsonType.label'),('b464b6f3-ec8e-40b3-a744-c03871f9e2b3','locale','user.attribute'),('b6a685d1-49ac-41ea-b80e-82cdf00f0f07','true','access.token.claim'),('b6a685d1-49ac-41ea-b80e-82cdf00f0f07','preferred_username','claim.name'),('b6a685d1-49ac-41ea-b80e-82cdf00f0f07','true','id.token.claim'),('b6a685d1-49ac-41ea-b80e-82cdf00f0f07','String','jsonType.label'),('b6a685d1-49ac-41ea-b80e-82cdf00f0f07','username','user.attribute'),('b9a088be-812a-4e54-a320-e7060c131583','true','access.token.claim'),('b9a088be-812a-4e54-a320-e7060c131583','preferred_username','claim.name'),('b9a088be-812a-4e54-a320-e7060c131583','true','id.token.claim'),('b9a088be-812a-4e54-a320-e7060c131583','String','jsonType.label'),('b9a088be-812a-4e54-a320-e7060c131583','username','user.attribute'),('bdedd755-fbd1-45d5-abe7-22cd0840dee6','true','access.token.claim'),('bdedd755-fbd1-45d5-abe7-22cd0840dee6','given_name','claim.name'),('bdedd755-fbd1-45d5-abe7-22cd0840dee6','true','id.token.claim'),('bdedd755-fbd1-45d5-abe7-22cd0840dee6','String','jsonType.label'),('bdedd755-fbd1-45d5-abe7-22cd0840dee6','firstName','user.attribute'),('be9eebda-bde6-4a2d-bcda-457d8ca3a3c6','true','access.token.claim'),('be9eebda-bde6-4a2d-bcda-457d8ca3a3c6','true','id.token.claim'),('c0c00836-fe9e-401e-aa29-4e2734287ce0','true','access.token.claim'),('c0c00836-fe9e-401e-aa29-4e2734287ce0','family_name','claim.name'),('c0c00836-fe9e-401e-aa29-4e2734287ce0','true','id.token.claim'),('c0c00836-fe9e-401e-aa29-4e2734287ce0','String','jsonType.label'),('c0c00836-fe9e-401e-aa29-4e2734287ce0','lastName','user.attribute'),('c2931be4-30f4-491c-8165-0fcb869f0d8c','true','access.token.claim'),('c2931be4-30f4-491c-8165-0fcb869f0d8c','family_name','claim.name'),('c2931be4-30f4-491c-8165-0fcb869f0d8c','true','id.token.claim'),('c2931be4-30f4-491c-8165-0fcb869f0d8c','String','jsonType.label'),('c2931be4-30f4-491c-8165-0fcb869f0d8c','lastName','user.attribute'),('c519ee08-1704-49a4-8dd3-638fea1e34b3','Role','attribute.name'),('c519ee08-1704-49a4-8dd3-638fea1e34b3','Basic','attribute.nameformat'),('c519ee08-1704-49a4-8dd3-638fea1e34b3','false','single'),('c79a9131-03e0-4646-ab52-92e00804d4cf','true','access.token.claim'),('c79a9131-03e0-4646-ab52-92e00804d4cf','email','claim.name'),('c79a9131-03e0-4646-ab52-92e00804d4cf','true','id.token.claim'),('c79a9131-03e0-4646-ab52-92e00804d4cf','String','jsonType.label'),('c79a9131-03e0-4646-ab52-92e00804d4cf','email','user.attribute'),('ca0d6a41-a0a0-43df-8b50-11ed6dbdcbfc','Role','attribute.name'),('ca0d6a41-a0a0-43df-8b50-11ed6dbdcbfc','Basic','attribute.nameformat'),('ca0d6a41-a0a0-43df-8b50-11ed6dbdcbfc','false','single'),('ca9bd227-aa17-4395-9e35-8ffd481992cc','true','access.token.claim'),('ca9bd227-aa17-4395-9e35-8ffd481992cc','email','claim.name'),('ca9bd227-aa17-4395-9e35-8ffd481992cc','true','id.token.claim'),('ca9bd227-aa17-4395-9e35-8ffd481992cc','String','jsonType.label'),('ca9bd227-aa17-4395-9e35-8ffd481992cc','email','user.attribute'),('cb2255f9-f774-4d39-83d9-a773b4b61b64','true','access.token.claim'),('cb2255f9-f774-4d39-83d9-a773b4b61b64','family_name','claim.name'),('cb2255f9-f774-4d39-83d9-a773b4b61b64','true','id.token.claim'),('cb2255f9-f774-4d39-83d9-a773b4b61b64','String','jsonType.label'),('cb2255f9-f774-4d39-83d9-a773b4b61b64','lastName','user.attribute'),('da35e1c2-594c-4f5c-8668-685e4ba1bff5','true','access.token.claim'),('da35e1c2-594c-4f5c-8668-685e4ba1bff5','preferred_username','claim.name'),('da35e1c2-594c-4f5c-8668-685e4ba1bff5','true','id.token.claim'),('da35e1c2-594c-4f5c-8668-685e4ba1bff5','String','jsonType.label'),('da35e1c2-594c-4f5c-8668-685e4ba1bff5','username','user.attribute'),('dfe6a378-9ec5-4935-aac7-d4be81e74dac','true','access.token.claim'),('dfe6a378-9ec5-4935-aac7-d4be81e74dac','preferred_username','claim.name'),('dfe6a378-9ec5-4935-aac7-d4be81e74dac','true','id.token.claim'),('dfe6a378-9ec5-4935-aac7-d4be81e74dac','String','jsonType.label'),('dfe6a378-9ec5-4935-aac7-d4be81e74dac','username','user.attribute'),('e197517e-5d41-46ad-a289-aa9b06d9320a','true','access.token.claim'),('e197517e-5d41-46ad-a289-aa9b06d9320a','family_name','claim.name'),('e197517e-5d41-46ad-a289-aa9b06d9320a','true','id.token.claim'),('e197517e-5d41-46ad-a289-aa9b06d9320a','String','jsonType.label'),('e197517e-5d41-46ad-a289-aa9b06d9320a','lastName','user.attribute'),('e37ee242-4482-409a-b46b-86e6da378a22','Role','attribute.name'),('e37ee242-4482-409a-b46b-86e6da378a22','Basic','attribute.nameformat'),('e37ee242-4482-409a-b46b-86e6da378a22','false','single'),('e3f4f194-9ece-4663-918c-f48f326b7a96','true','access.token.claim'),('e3f4f194-9ece-4663-918c-f48f326b7a96','family_name','claim.name'),('e3f4f194-9ece-4663-918c-f48f326b7a96','true','id.token.claim'),('e3f4f194-9ece-4663-918c-f48f326b7a96','String','jsonType.label'),('e3f4f194-9ece-4663-918c-f48f326b7a96','lastName','user.attribute'),('e57671dd-7546-4ced-85eb-b47a8079bab4','Role','attribute.name'),('e57671dd-7546-4ced-85eb-b47a8079bab4','Basic','attribute.nameformat'),('e57671dd-7546-4ced-85eb-b47a8079bab4','false','single'),('ee42acc1-87d8-4673-b1ae-8f8d317af0d3','true','access.token.claim'),('ee42acc1-87d8-4673-b1ae-8f8d317af0d3','preferred_username','claim.name'),('ee42acc1-87d8-4673-b1ae-8f8d317af0d3','true','id.token.claim'),('ee42acc1-87d8-4673-b1ae-8f8d317af0d3','String','jsonType.label'),('ee42acc1-87d8-4673-b1ae-8f8d317af0d3','username','user.attribute'),('eeedea9e-2ea0-4d55-81a5-0b4aaebeb05a','true','access.token.claim'),('eeedea9e-2ea0-4d55-81a5-0b4aaebeb05a','true','id.token.claim'),('f09720dc-1509-4a91-a450-16c8764334c8','true','access.token.claim'),('f09720dc-1509-4a91-a450-16c8764334c8','preferred_username','claim.name'),('f09720dc-1509-4a91-a450-16c8764334c8','true','id.token.claim'),('f09720dc-1509-4a91-a450-16c8764334c8','String','jsonType.label'),('f09720dc-1509-4a91-a450-16c8764334c8','username','user.attribute'),('f7827958-9825-4e84-b9c5-874e780b4fb3','true','access.token.claim'),('f7827958-9825-4e84-b9c5-874e780b4fb3','family_name','claim.name'),('f7827958-9825-4e84-b9c5-874e780b4fb3','true','id.token.claim'),('f7827958-9825-4e84-b9c5-874e780b4fb3','String','jsonType.label'),('f7827958-9825-4e84-b9c5-874e780b4fb3','lastName','user.attribute');
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
INSERT INTO `REALM` VALUES ('itesoft',60,300,300,NULL,NULL,NULL,'','\0',0,NULL,'itesoft',0,NULL,'MIIEowIBAAKCAQEAgYt22cpoztI7uvS+jtAX2qPtp/kk0GvsOgs00CKfH4nb7m08+5OJqnEdB1bquR8XYS0Q2kx/R8WKOMYqjJrx85NLnxVRRMIcATsjxg7sBCM6g4Kt10eJmI2ITCnFARGNljpkAyL1u2Hqv7xSGDnq6RstgeGhmNkrN3OoFW7PsDOjns7seYJPt7ESLRoDnLrSKiZPwGAp11ljfgQ7x536das+wyOkpBCw7y9t2cMT0PCa47mb9OU0eC33+yv1zeMu2DzXyj6Ghpy3UF/TwiYi7ingZ12w34KnuDxjmytgoWwOZ5WJMVxLFYJ+fZE3u4ljsNsARwaqdRiWIeQjdFTjTwIDAQABAoIBADKvBxQU3ka0+EugQAIOJpcTdgM3NhEZeHYJNmOMeCdVv6ecM7TWN5Fo6guaFQHSyUnq4OIX9eB1yCuIVNNoN+utoHOgWoiFTYGpyshNxEemJNmZQjytL4dxMHdkDEDrxjKVq9WSUwQ6PidAHfp+hosnZ/md9qSfqwnqBURFc5qjOriyvdvgfPDCWdz/7scA2QiLWhQbOFXW7LPvgog910gZBEEHQngl50jkbRg1g/79QelROlAF6vYybm5k0Gb8r9aBHbsNE8UC7Oxpf7rrOt00IsJBICLRAsOsZxn/xWPGXbtCgw3jFzbYKryK8ki7pGojaz3ObWnkhezPNgTs+ykCgYEAwtaPjc9mxUNTa8g/G0KVYmzqNJ9IdgDFl0ENg6Oq9P3AYKZCOztFvq7YbZ2L61aum3FWmqax6APJh9clg499jBb+/cGBEnRd0rowbQzzP77wIkVfOOrrT8LhTy0HWoaAiIilCJItmxwb5iGPYdU29pUbsVvuELpA4j8uPPenNJMCgYEAqjXY7aOqGCe3Ndc5Vq+iEQbnJ+Jeu/wLc2RPANOVk2bXgU+dN0un27CDWZsRREm5Fo3XZHREYaZJ2rY39YFopxYEK/YU9H6lJlkULGMUqHRGZI/1hN2G0wEnu/pWY6jszkniwFX1TF1Jd0uWLgB1+lB+lo+0raedMC7lrPAVZ9UCgYEAk/p/1zXRmTr0LeVNwLeGW9Xa35KmZzFY4PMAf52b5yyeowlDPldbNmL3b/F7ZodUYCzpmNXIQy41Lx3BmTUvJmoEytff3xNQew78Xqa6TQ0Itw63LrSFefPKSecqMZ/8GTanGWZkiu0DZ3rPun9Emm1PNhpbKos7YlqYFKgHb08CgYAlKa6cbCCGN52r1rsBL0W+W/h6X9V5S9WgMyWAs7Gzxj+FT0GvQgh7UfXLyayicUpFH2EI4M3RWEJFy4U6SC/2UztD8e2vWDtsvQRHkLaA9SotaLUddlSqm1T2mPjlt4tEmyM0BVCShMe2kT1P++/GYG7TJrs3MyKB06t3789spQKBgCtvGTok0/ZWOZtyqso0TUJWzkEz+RkpI0ai3gL7WjyG2e2OdTDdqIOb/KeeZfYyUP8TAnv9o5nOqFbSsDMpT67ifLyOtc8FPVjhB1sB0az0+jyFy2CDZcY0aF52wW0B+Kbtg5xIeHiiH+YnHlD+40XFybu17+0y7RNLHKfg3SZz','MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAgYt22cpoztI7uvS+jtAX2qPtp/kk0GvsOgs00CKfH4nb7m08+5OJqnEdB1bquR8XYS0Q2kx/R8WKOMYqjJrx85NLnxVRRMIcATsjxg7sBCM6g4Kt10eJmI2ITCnFARGNljpkAyL1u2Hqv7xSGDnq6RstgeGhmNkrN3OoFW7PsDOjns7seYJPt7ESLRoDnLrSKiZPwGAp11ljfgQ7x536das+wyOkpBCw7y9t2cMT0PCa47mb9OU0eC33+yv1zeMu2DzXyj6Ghpy3UF/TwiYi7ingZ12w34KnuDxjmytgoWwOZ5WJMVxLFYJ+fZE3u4ljsNsARwaqdRiWIeQjdFTjTwIDAQAB','\0','\0','\0','\0','EXTERNAL',1800,36000,'\0','\0','f9bfbcc1-a943-41a8-b968-5fcf730edd2f','MIICnTCCAYUCBgFRgfqQrjANBgkqhkiG9w0BAQsFADASMRAwDgYDVQQDDAdpdGVzb2Z0MB4XDTE1MTIwODE0MjI0MFoXDTI1MTIwODE0MjQyMFowEjEQMA4GA1UEAwwHaXRlc29mdDCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAIGLdtnKaM7SO7r0vo7QF9qj7af5JNBr7DoLNNAinx+J2+5tPPuTiapxHQdW6rkfF2EtENpMf0fFijjGKoya8fOTS58VUUTCHAE7I8YO7AQjOoOCrddHiZiNiEwpxQERjZY6ZAMi9bth6r+8Uhg56ukbLYHhoZjZKzdzqBVuz7Azo57O7HmCT7exEi0aA5y60iomT8BgKddZY34EO8ed+nWrPsMjpKQQsO8vbdnDE9DwmuO5m/TlNHgt9/sr9c3jLtg818o+hoact1Bf08ImIu4p4GddsN+Cp7g8Y5srYKFsDmeViTFcSxWCfn2RN7uJY7DbAEcGqnUYliHkI3RU408CAwEAATANBgkqhkiG9w0BAQsFAAOCAQEAfcnvQ/pp5t8JbzFHV/ZibZ5o00A0OPx776yMf6mdnRrr/yGfkGeeFKhvroJRubuOTHsMhlac0/dV7pjZZ7ykIYeQmRJDqh1WXGuJlqjBsLIzvVtrdV8UL9q3vPAjn9obbVMxNPlnAnpc6bj2SMaeM3L8ighFXlC0kNLCnzKfO+Ug4ypKCaYMHyoYBhmbSvxZexMx96couM9mqedOUXuw17RqBa/l/wSprmdU600cVDZOv5GtrT5SAmAsuaMLd2wScC9b0pVSAVstbTTyUWimoQckQ7SO0tNvk+yxpvhLrVevzjp+zFWZC0Yeos0XjPPLZKMqu1JJvkH6dgnw/7jrcw==','1b72ed7c-a4e3-4003-9571-f3fd65acbc50',1800,'\0',NULL,'\0','\0','\0','\0',0,1,30,6,'HmacSHA1','totp','20967446-c56e-4085-8abd-08c959dcbde5','28dc16a5-33b1-40f9-b05d-b3524d3b7810','61c44348-d7d5-42ce-90f6-0135d0e38823','c9ad5741-59e7-46b2-a7a7-652381a8ff45','7b05f837-d99e-4299-a073-918f2c29274f',2592000,'\0',900),('master',60,300,60,NULL,NULL,NULL,'\0','\0',0,NULL,'master',0,NULL,'MIIEowIBAAKCAQEAk1AaK+iE/rpQj18x1QSApt0Ard5YXslQ3gq/r49jCQFPCR/AWHOgVxM/hLoDib+lT5Kf7ur6hK7M40z6lc/hpHlfkpaqZ7uxYb/y97dXeCbBs+kl2VgfgHk18Twcbk2s+ZTbc8+1Ygz/V00uPoAeO9DEnXKyLGCatS8xj8HJdPyZSrjdGVWaJG8MNNEOt7rhLvhTFdPkzrSQLPRfHVQMc2Vh81nLA8SveolM7PTBy7WU/fQQ4b8EBVDCPvtB7j/976rgP9dSmobaj9VvjyjWOUm64grtj2vBW87gaaBEt+3dUV1rewa8sKdkrwhk8BlsstAik2OAf/RzDhunsrzuUwIDAQABAoIBAHzRLSuw+yb95I5mQUnVY9B+hznKoCPH/a31e48cNfSGWFpJveb0KZI9697g4WiQqlfuy3ZbQOK1XULmkZfoKK78bB8/a6kzHkvNoOeFQCa85/kxffFXOnHXwf3hSdGoHPznxL2u62flzWBCNAGe+n8CF+W0LgVt4QfNsfe1YaWtqKsOgwAoNkAVcEyoGCv8vrS0FKLMEOhlrYx3j8cO4EubuHcqFnB+67HLzMPTHEQeiT+ULwtXmqioJKk4ZBaUHBoOa3TJQANDTs2fiREsIlX71ymDlvvSRD95911gr6gsiTJH32GwmXQJbUtpOTfL5NpnsjmqbYDCZBNznlnzEwkCgYEA4hXf5p/+cXZTvMEIOqDOcekfkk8MI4NY2XxrY5/htqWeC6Yx1zOiuPaDN8WtqRW2suV9Gc6KZVJ6FzpOZHssC/0pBOGtM3n8kIH1aq7Rg747UMbxrKXhOaHwUlj5UejeNFBM1gQELPRONz7JEg8FCsdzgy0hYjaClTGAjEy8m/0CgYEAps39CZD9ZXgI+B27tDphi2JASsKsiauNVDJP0u5jlLUzm38Yiaay+K8Ox401u+zGZbPYUz1iy7PC8bIUH3octxaK9a6SjFmFVT+C9qjpZOcLftv+zXKkkE1eAmW4Ka4cdNYAJAvyhG23nt+O7zhpAk6W3EaITtFRNEDJejRkvI8CgYB74Gp3DjE3cBM/uDDPFu8nAQoYe5F2H/Dd8ctRofflwOdRELX8aUF+wStysrCNleUuLooWStIP5FobQgpUCh0/UG5aS2FAdFWLxHl5A+KuodwUTX18EMPQdUedhzzMwaCG33zKQxcanp4ArTk02N/1YQWM2XySOLXiE2aQ+Tba7QKBgBFt9MLLI682m7lRYguzDf5ChfVJ4j2Ab4QcvbqMrlsblAjrfuTjRlA1+pVfa/32/8Qgxrnr8CbY4cXflbq0R8vZzytc0nNX51bBDC45+ClS+yCGXFmbYRay/t/BQT0ZtF+A/QLHPNAZptYzBfx5KH/VNm5N8HBL7vBG1MawMtaBAoGBAJA66K4UKSw+J3J34bKRZyS/2vXrHmIIAGcHx234CYgvDP6IfJHMPSMLZsXGP2l0bH+vEtGa9V2mLjyLFqhBRlRWmeVjzYDVHtxstLJfeSW/e0/Hhn9KVpt16ahX2FI2/knMJ6uruoLLhKlnd+ZJtsZQEf7exnL6uSQ1jZa1QNJk','MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAk1AaK+iE/rpQj18x1QSApt0Ard5YXslQ3gq/r49jCQFPCR/AWHOgVxM/hLoDib+lT5Kf7ur6hK7M40z6lc/hpHlfkpaqZ7uxYb/y97dXeCbBs+kl2VgfgHk18Twcbk2s+ZTbc8+1Ygz/V00uPoAeO9DEnXKyLGCatS8xj8HJdPyZSrjdGVWaJG8MNNEOt7rhLvhTFdPkzrSQLPRfHVQMc2Vh81nLA8SveolM7PTBy7WU/fQQ4b8EBVDCPvtB7j/976rgP9dSmobaj9VvjyjWOUm64grtj2vBW87gaaBEt+3dUV1rewa8sKdkrwhk8BlsstAik2OAf/RzDhunsrzuUwIDAQAB','\0','\0','\0','\0','EXTERNAL',1800,36000,'\0','\0','f6d06cce-b911-47b3-b08e-06340679586a','MIICmzCCAYMCBgFRgfm7jjANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZtYXN0ZXIwHhcNMTUxMjA4MTQyMTQ2WhcNMjUxMjA4MTQyMzI2WjARMQ8wDQYDVQQDDAZtYXN0ZXIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCTUBor6IT+ulCPXzHVBICm3QCt3lheyVDeCr+vj2MJAU8JH8BYc6BXEz+EugOJv6VPkp/u6vqErszjTPqVz+GkeV+Slqpnu7Fhv/L3t1d4JsGz6SXZWB+AeTXxPBxuTaz5lNtzz7ViDP9XTS4+gB470MSdcrIsYJq1LzGPwcl0/JlKuN0ZVZokbww00Q63uuEu+FMV0+TOtJAs9F8dVAxzZWHzWcsDxK96iUzs9MHLtZT99BDhvwQFUMI++0HuP/3vquA/11KahtqP1W+PKNY5SbriCu2Pa8FbzuBpoES37d1RXWt7Brywp2SvCGTwGWyy0CKTY4B/9HMOG6eyvO5TAgMBAAEwDQYJKoZIhvcNAQELBQADggEBAHXIJFZJpT/NbaudWsByqpxf1xqjU665lREw2p0Q6+qEpnwbqEpOKOyHexdDoR0vIx2BzANH1iH+limBoDwA9sT/2imcEj6dYzhQcI6jLRtU2U0QV+GmB5SfgHR6uDltmJzdzd69/Wrm+eYtDRuzQIGeuAzZY3c3MxgI2ywoBrhtYdHROJumeXtOrgY4cNJTb9HWDk7yETmDoajRAehkjLiU0gfKz7KnS7eTZyE2O+7FOKSWknjv+rj2CXWYdOk6a9motEDVIHrym0vnaw/LqSyXktJUvQ62zWPQ/6fkWccrvieq2fQ3FPQLWNsUE0yIsgRb2o23vuNOGSv9hYJs2+U=','01791c77-5324-47c2-8fa8-428381b85500',1800,'\0',NULL,'\0','\0','\0','\0',0,1,30,6,'HmacSHA1','totp','8af13ec0-0dbc-472b-a615-681498d797f2','702087e3-122c-4256-abfa-8a06599dc89a','cd767cb8-e454-4241-9c2a-9de4b99e0cf1','12cab55e-11f7-404e-85fb-de3c1a6b25a4','6373b333-8520-41e9-93f4-ffc5ef12a483',2592000,'\0',900);
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
INSERT INTO `REALM_CLIENT` VALUES ('master','284f40a5-e7cf-47e9-be88-7055f5786efa'),('master','50368b55-4585-4da0-896f-8026ea9a311a'),('master','55505b70-9163-42e9-a0e2-7d3e6a7c4ad7'),('master','c6cb72b7-ddf0-4246-8208-b82cc5cb21c1'),('master','f6d06cce-b911-47b3-b08e-06340679586a'),('master','f9bfbcc1-a943-41a8-b968-5fcf730edd2f'),('itesoft','158b5f51-dd0f-4cdb-87ba-70374510314f'),('itesoft','750a0c5d-bc3d-4d31-b3a8-987a0ae84878'),('itesoft','8f292a09-153a-42c5-adab-dec5a553db65'),('itesoft','bd4095d4-6c29-4aa3-9baa-0978157aedc6'),('itesoft','62203531-01d5-47ef-8c27-a8555cd91c30'),('itesoft','fd634189-7f7c-428a-a728-e74bd369cb0f');
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
INSERT INTO `REALM_DEFAULT_ROLES` VALUES ('itesoft','74a5cad1-d305-452d-aaa2-ae848dcba23f'),('master','d7df54d1-1498-4b63-ad51-cb32c9a450c3');
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
INSERT INTO `REALM_REQUIRED_CREDENTIAL` VALUES ('password','password','\0','\0','itesoft'),('password','password','\0','\0','master');
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
INSERT INTO `REDIRECT_URIS` VALUES ('55505b70-9163-42e9-a0e2-7d3e6a7c4ad7','/auth/realms/master/account/*'),('c6cb72b7-ddf0-4246-8208-b82cc5cb21c1','/auth/admin/master/console/*'),('750a0c5d-bc3d-4d31-b3a8-987a0ae84878','/auth/realms/itesoft/account/*'),('bd4095d4-6c29-4aa3-9baa-0978157aedc6','/auth/admin/itesoft/console/*'),('fd634189-7f7c-428a-a728-e74bd369cb0f','http://localhost/*');
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
INSERT INTO `REQUIRED_ACTION_PROVIDER` VALUES ('3139b253-b85a-43b5-bc60-4c7d06732fdd','CONFIGURE_TOTP','Configure Totp','master','\0','\0','CONFIGURE_TOTP'),('56e77ead-1534-4a98-8e5b-735674f3e84b','UPDATE_PROFILE','Update Profile','master','\0','\0','UPDATE_PROFILE'),('75d63b70-bc7e-413e-a4ea-124b4254ac4d','CONFIGURE_TOTP','Configure Totp','itesoft','\0','\0','CONFIGURE_TOTP'),('91257754-18e4-4449-bdb8-cd5c43926bf0','VERIFY_EMAIL','Verify Email','master','\0','\0','VERIFY_EMAIL'),('99561fe0-1b95-46fe-a5b7-c6223dd0956d','UPDATE_PASSWORD','Update Password','master','\0','\0','UPDATE_PASSWORD'),('ad734443-a324-4d62-8f27-683eb8ba10a0','UPDATE_PROFILE','Update Profile','itesoft','\0','\0','UPDATE_PROFILE'),('b30dc036-aee1-43a4-ba8f-770049362699','VERIFY_EMAIL','Verify Email','itesoft','\0','\0','VERIFY_EMAIL'),('d9104d0a-28db-4a46-8c44-b0686f1fdb75','terms_and_conditions','Terms and Conditions','itesoft','\0','\0','terms_and_conditions'),('f34c4244-a174-44eb-98c3-9c727872e4c3','UPDATE_PASSWORD','Update Password','itesoft','\0','\0','UPDATE_PASSWORD'),('f4301837-f2e4-461c-9e06-d6cad85ba40e','terms_and_conditions','Terms and Conditions','master','\0','\0','terms_and_conditions');
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
INSERT INTO `SCOPE_MAPPING` VALUES ('50368b55-4585-4da0-896f-8026ea9a311a','bf88c4eb-5037-431c-8193-53e5f9282c2a'),('c6cb72b7-ddf0-4246-8208-b82cc5cb21c1','bf88c4eb-5037-431c-8193-53e5f9282c2a'),('62203531-01d5-47ef-8c27-a8555cd91c30','e45423d6-af2a-4b9e-a906-c99207932548'),('bd4095d4-6c29-4aa3-9baa-0978157aedc6','e45423d6-af2a-4b9e-a906-c99207932548');
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
INSERT INTO `USER_ENTITY` VALUES ('0e8bf973-f753-41a7-af6c-ea36da5489c2',NULL,'3edee0aa-d38c-4577-a041-0d4f8d44a1a9','\0','\0',NULL,NULL,NULL,'master','\0','admin',1449584606971,NULL),('1a7e786d-4a19-47ff-86e2-1237b9ed2e20','john.doe@itesoft.com','john.doe@itesoft.com','','',NULL,'John','Doe','itesoft','\0','john',1449585679093,NULL);
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
INSERT INTO `USER_ROLE_MAPPING` VALUES ('3417d97d-aeee-47ad-8473-0c52d5ff2c07','0e8bf973-f753-41a7-af6c-ea36da5489c2'),('bf88c4eb-5037-431c-8193-53e5f9282c2a','0e8bf973-f753-41a7-af6c-ea36da5489c2'),('d7df54d1-1498-4b63-ad51-cb32c9a450c3','0e8bf973-f753-41a7-af6c-ea36da5489c2'),('f4e03955-3678-4451-9738-8672541b4076','0e8bf973-f753-41a7-af6c-ea36da5489c2'),('74a5cad1-d305-452d-aaa2-ae848dcba23f','1a7e786d-4a19-47ff-86e2-1237b9ed2e20'),('be0b9f0f-8bee-4238-b06f-ce2b592d25ba','1a7e786d-4a19-47ff-86e2-1237b9ed2e20'),('c730c08d-389a-44da-96b6-7a6d7d01f8dd','1a7e786d-4a19-47ff-86e2-1237b9ed2e20');
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
INSERT INTO `WEB_ORIGINS` VALUES ('fd634189-7f7c-428a-a728-e74bd369cb0f','http://localhost/*');
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

-- Dump completed on 2015-12-08 14:43:21

