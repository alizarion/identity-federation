
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
INSERT INTO `AUTHENTICATION_EXECUTION` VALUES ('14cf3fc5-c5d3-4914-acbb-08ce9db20430',NULL,'auth-cookie','master','aafe268d-8459-44a5-9cbf-698f784f3a18',2,10,0x00,NULL,NULL),('15a70af2-1532-4b88-8164-ea91908a4aef',NULL,'direct-grant-validate-password','master','c14e3ef5-10f3-4349-9ae5-f55e063f03af',0,20,0x00,NULL,NULL),('1acd6b7c-dafe-4b65-a2cd-3422c50c8aea',NULL,'registration-user-creation','itesoft','4e136559-c26d-4124-aa33-db8baf23d153',0,20,0x00,NULL,NULL),('1ad8367c-9613-4b7e-880b-7126870ee9fa',NULL,'idp-review-profile','itesoft','21f7fa75-8e2f-4dfc-83bb-769e071f91d9',0,10,0x00,NULL,'afc25a68-68a1-482c-97fd-45442242392a'),('20477c82-d1f5-4c6c-b15a-74e4d2a55159',NULL,'idp-username-password-form','itesoft','291103b5-1fb6-4af2-9aa5-69240bb20660',0,10,0x00,NULL,NULL),('233a376b-2288-427f-ab7e-d98cefc9048d',NULL,'registration-profile-action','master','30fcbf99-fc3f-4213-aa90-4ed7e89de443',0,40,0x00,NULL,NULL),('43ee1014-cd15-4309-bf3d-6842481c02e6',NULL,'reset-password','master','601ade5c-a825-4d25-af51-ee8d6512f99b',0,30,0x00,NULL,NULL),('49f9c219-653a-492f-a5f7-6797dd7074cf',NULL,'direct-grant-validate-password','itesoft','df5b0b89-ef35-4add-a582-e4396367c727',0,20,0x00,NULL,NULL),('4c3c19a1-1e01-434b-95a9-7fbe8dd09858',NULL,'reset-credentials-choose-user','itesoft','2f33ba7d-c975-44c9-a906-e66cfe82cba8',0,10,0x00,NULL,NULL),('50464f69-abdb-4dbf-9906-5b765a520779',NULL,'idp-confirm-link','itesoft','45cf3363-8fe1-4525-83db-3645e20be5cf',0,10,0x00,NULL,NULL),('51d498e0-9561-456b-9ef7-22df03021ea4',NULL,'direct-grant-validate-username','itesoft','df5b0b89-ef35-4add-a582-e4396367c727',0,10,0x00,NULL,NULL),('547bb514-832e-47ad-aef1-3fcb5e3b97d3',NULL,'registration-recaptcha-action','itesoft','4e136559-c26d-4124-aa33-db8baf23d153',3,60,0x00,NULL,NULL),('555d5482-59d4-4e9d-9fcc-b75c4dd9e5c6',NULL,'reset-credentials-choose-user','master','601ade5c-a825-4d25-af51-ee8d6512f99b',0,10,0x00,NULL,NULL),('5a1e7651-908f-4aea-ae61-149f7a70cdad',NULL,'auth-spnego','itesoft','0c848c98-7122-48a5-8476-c5050be4184c',3,20,0x00,NULL,NULL),('5b094973-470f-484c-859f-1fc12019e737',NULL,'reset-credential-email','itesoft','2f33ba7d-c975-44c9-a906-e66cfe82cba8',0,20,0x00,NULL,NULL),('5d436084-6439-42bc-b5d6-dcb86aab1cb3',NULL,'direct-grant-validate-otp','itesoft','df5b0b89-ef35-4add-a582-e4396367c727',1,30,0x00,NULL,NULL),('64513e26-4fe3-477d-a64b-c4871398c85d',NULL,'direct-grant-validate-otp','master','c14e3ef5-10f3-4349-9ae5-f55e063f03af',1,30,0x00,NULL,NULL),('68ff5b4c-564f-4c2d-a871-6363433ed7c2',NULL,'reset-otp','itesoft','2f33ba7d-c975-44c9-a906-e66cfe82cba8',1,40,0x00,NULL,NULL),('6db04b0d-c842-4df5-bfad-fcf9efdf504c',NULL,NULL,'master','0ab3e77c-3289-43c5-accf-9bcafd6efe58',2,30,0x01,'69690a5d-3b96-4529-9b69-a00676af0929',NULL),('6f2a1a92-2333-4bc8-87dd-d0b82b51d032',NULL,'client-secret','itesoft','fa40e705-3b90-4ba0-a3ca-52c55db40b1d',2,10,0x00,NULL,NULL),('77751bd8-912f-4171-aa59-099854442b1a',NULL,'registration-page-form','itesoft','ab010efb-ff97-4c54-b2cf-8cbdf829d095',0,10,0x01,'4e136559-c26d-4124-aa33-db8baf23d153',NULL),('78a419a6-f7e6-4b86-9d84-943a23300964',NULL,'idp-create-user-if-unique','itesoft','21f7fa75-8e2f-4dfc-83bb-769e071f91d9',2,20,0x00,NULL,'f28dde30-7849-4a85-85be-835023d15e5f'),('7aaa0591-c81a-4564-bc56-e6ada17b73e9',NULL,'auth-otp-form','master','69690a5d-3b96-4529-9b69-a00676af0929',1,20,0x00,NULL,NULL),('7aad4560-e3c8-4644-a9ae-4fb9f6a12da2',NULL,'auth-spnego','master','aafe268d-8459-44a5-9cbf-698f784f3a18',3,20,0x00,NULL,NULL),('7c2498d1-2210-4691-8969-c315fb15afa8',NULL,NULL,'itesoft','45cf3363-8fe1-4525-83db-3645e20be5cf',2,30,0x01,'291103b5-1fb6-4af2-9aa5-69240bb20660',NULL),('7ce7b37f-a452-4c74-85a7-ee7badf93b92',NULL,'reset-credential-email','master','601ade5c-a825-4d25-af51-ee8d6512f99b',0,20,0x00,NULL,NULL),('7ce9d095-810e-4412-89dc-844c45e6c97a',NULL,'direct-grant-validate-username','master','c14e3ef5-10f3-4349-9ae5-f55e063f03af',0,10,0x00,NULL,NULL),('83c4fe92-343a-4416-987d-2ae7a48c4da2',NULL,NULL,'master','7266142e-49a6-45e1-8a0b-5075185df8da',2,30,0x01,'0ab3e77c-3289-43c5-accf-9bcafd6efe58',NULL),('923435a2-2107-4f69-b268-b0a7474ea1ee',NULL,'registration-password-action','itesoft','4e136559-c26d-4124-aa33-db8baf23d153',0,50,0x00,NULL,NULL),('9ab0d75a-efa0-43c3-a916-4e8ba2cd9723',NULL,'registration-password-action','master','30fcbf99-fc3f-4213-aa90-4ed7e89de443',0,50,0x00,NULL,NULL),('9cd1ca2c-a89e-4503-96c9-8e7577d6837e',NULL,'auth-otp-form','itesoft','291103b5-1fb6-4af2-9aa5-69240bb20660',1,20,0x00,NULL,NULL),('a619c9b0-0471-41fa-b198-300b257e58c2',NULL,'auth-otp-form','master','52857e6f-8180-416f-8b32-867dbc08a855',1,20,0x00,NULL,NULL),('a7c22f68-7822-4d48-9e19-b3e618f2296e',NULL,'idp-email-verification','itesoft','45cf3363-8fe1-4525-83db-3645e20be5cf',2,20,0x00,NULL,NULL),('a9431dcb-f042-4e41-8212-8a1710b6bad0',NULL,'client-secret','master','b2fbfb56-93a6-4cc9-baea-892543f9b5be',2,10,0x00,NULL,NULL),('aac304e2-3fe5-4df0-b783-7657989b9d18',NULL,'auth-otp-form','itesoft','0912df7e-4002-4232-8313-9ee3eede3123',1,20,0x00,NULL,NULL),('ad591008-2037-4d66-a681-2f3f222edda5',NULL,'registration-page-form','master','72bff78c-419f-4d46-8849-f6890d28e308',0,10,0x01,'30fcbf99-fc3f-4213-aa90-4ed7e89de443',NULL),('b24f74fe-b35c-4aef-b0ea-deb0bd4167dc',NULL,'idp-review-profile','master','7266142e-49a6-45e1-8a0b-5075185df8da',0,10,0x00,NULL,'66aa4795-4803-40b2-b039-432d8efb9972'),('b31156fc-41b1-4e2f-bda4-193c65ea0a64',NULL,NULL,'master','aafe268d-8459-44a5-9cbf-698f784f3a18',2,30,0x01,'52857e6f-8180-416f-8b32-867dbc08a855',NULL),('b5a64468-86f1-46a7-8f76-849bc0d2190d',NULL,NULL,'itesoft','0c848c98-7122-48a5-8476-c5050be4184c',2,30,0x01,'0912df7e-4002-4232-8313-9ee3eede3123',NULL),('bda92220-2873-4734-b630-a7ce2c1b1dac',NULL,'client-jwt','master','b2fbfb56-93a6-4cc9-baea-892543f9b5be',2,20,0x00,NULL,NULL),('c177dd4f-9c9d-4976-856e-65b7c1e30be2',NULL,'client-jwt','itesoft','fa40e705-3b90-4ba0-a3ca-52c55db40b1d',2,20,0x00,NULL,NULL),('c35f321c-5067-4991-810b-9057fd13ac63',NULL,'idp-confirm-link','master','0ab3e77c-3289-43c5-accf-9bcafd6efe58',0,10,0x00,NULL,NULL),('c73c73b5-b07d-4889-9b67-b1f1fb5a73df',NULL,'registration-profile-action','itesoft','4e136559-c26d-4124-aa33-db8baf23d153',0,40,0x00,NULL,NULL),('c8313347-d0cc-4498-9f5a-e297e6b75ea4',NULL,'auth-cookie','itesoft','0c848c98-7122-48a5-8476-c5050be4184c',2,10,0x00,NULL,NULL),('cf300b66-2ff3-4df0-9904-bdff5844f9ec',NULL,'registration-user-creation','master','30fcbf99-fc3f-4213-aa90-4ed7e89de443',0,20,0x00,NULL,NULL),('cfd33bfd-97cf-49bd-a94c-db842245af95',NULL,NULL,'itesoft','21f7fa75-8e2f-4dfc-83bb-769e071f91d9',2,30,0x01,'45cf3363-8fe1-4525-83db-3645e20be5cf',NULL),('d31a4dae-0d4a-4818-a477-d3ff1fa8cecf',NULL,'auth-username-password-form','itesoft','0912df7e-4002-4232-8313-9ee3eede3123',0,10,0x00,NULL,NULL),('d6f979d6-002a-47c5-bb51-47bb9a2cc825',NULL,'reset-otp','master','601ade5c-a825-4d25-af51-ee8d6512f99b',1,40,0x00,NULL,NULL),('db184715-c630-4a61-849d-acedb3ed8c48',NULL,'auth-username-password-form','master','52857e6f-8180-416f-8b32-867dbc08a855',0,10,0x00,NULL,NULL),('e00e7dc6-47ff-4004-9af1-9d3bb9c40b11',NULL,'idp-username-password-form','master','69690a5d-3b96-4529-9b69-a00676af0929',0,10,0x00,NULL,NULL),('e663086f-e0e8-4029-9b4b-1dd4e82df181',NULL,'idp-create-user-if-unique','master','7266142e-49a6-45e1-8a0b-5075185df8da',2,20,0x00,NULL,'308ab108-f5d1-4fd6-98e4-7fb894103a45'),('e91a8a03-61f6-449f-9097-92a31ac312be',NULL,'registration-recaptcha-action','master','30fcbf99-fc3f-4213-aa90-4ed7e89de443',3,60,0x00,NULL,NULL),('ff131d14-27e0-4413-8dfc-b81959777761',NULL,'idp-email-verification','master','0ab3e77c-3289-43c5-accf-9bcafd6efe58',2,20,0x00,NULL,NULL),('ff3d9a84-8f09-4521-a2ee-12d00c34d121',NULL,'reset-password','itesoft','2f33ba7d-c975-44c9-a906-e66cfe82cba8',0,30,0x00,NULL,NULL);
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
INSERT INTO `AUTHENTICATION_FLOW` VALUES ('0912df7e-4002-4232-8313-9ee3eede3123','forms','Username, password, otp and other auth forms.','itesoft','basic-flow',0x00,0x01),('0ab3e77c-3289-43c5-accf-9bcafd6efe58','Handle Existing Account','Handle what to do if there is existing account with same email/username like authenticated identity provider','master','basic-flow',0x00,0x01),('0c848c98-7122-48a5-8476-c5050be4184c','browser','browser based authentication','itesoft','basic-flow',0x01,0x01),('21f7fa75-8e2f-4dfc-83bb-769e071f91d9','first broker login','Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account','itesoft','basic-flow',0x01,0x01),('291103b5-1fb6-4af2-9aa5-69240bb20660','Verify Existing Account by Re-authentication','Reauthentication of existing account','itesoft','basic-flow',0x00,0x01),('2f33ba7d-c975-44c9-a906-e66cfe82cba8','reset credentials','Reset credentials for a user if they forgot their password or something','itesoft','basic-flow',0x01,0x01),('30fcbf99-fc3f-4213-aa90-4ed7e89de443','registration form','registration form','master','form-flow',0x00,0x01),('45cf3363-8fe1-4525-83db-3645e20be5cf','Handle Existing Account','Handle what to do if there is existing account with same email/username like authenticated identity provider','itesoft','basic-flow',0x00,0x01),('4e136559-c26d-4124-aa33-db8baf23d153','registration form','registration form','itesoft','form-flow',0x00,0x01),('52857e6f-8180-416f-8b32-867dbc08a855','forms','Username, password, otp and other auth forms.','master','basic-flow',0x00,0x01),('601ade5c-a825-4d25-af51-ee8d6512f99b','reset credentials','Reset credentials for a user if they forgot their password or something','master','basic-flow',0x01,0x01),('69690a5d-3b96-4529-9b69-a00676af0929','Verify Existing Account by Re-authentication','Reauthentication of existing account','master','basic-flow',0x00,0x01),('7266142e-49a6-45e1-8a0b-5075185df8da','first broker login','Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account','master','basic-flow',0x01,0x01),('72bff78c-419f-4d46-8849-f6890d28e308','registration','registration flow','master','basic-flow',0x01,0x01),('aafe268d-8459-44a5-9cbf-698f784f3a18','browser','browser based authentication','master','basic-flow',0x01,0x01),('ab010efb-ff97-4c54-b2cf-8cbdf829d095','registration','registration flow','itesoft','basic-flow',0x01,0x01),('b2fbfb56-93a6-4cc9-baea-892543f9b5be','clients','Base authentication for clients','master','client-flow',0x01,0x01),('c14e3ef5-10f3-4349-9ae5-f55e063f03af','direct grant','OpenID Connect Resource Owner Grant','master','basic-flow',0x01,0x01),('df5b0b89-ef35-4add-a582-e4396367c727','direct grant','OpenID Connect Resource Owner Grant','itesoft','basic-flow',0x01,0x01),('fa40e705-3b90-4ba0-a3ca-52c55db40b1d','clients','Base authentication for clients','itesoft','client-flow',0x01,0x01);
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
INSERT INTO `AUTHENTICATOR_CONFIG` VALUES ('308ab108-f5d1-4fd6-98e4-7fb894103a45','create unique user config','master'),('66aa4795-4803-40b2-b039-432d8efb9972','review profile config','master'),('afc25a68-68a1-482c-97fd-45442242392a','review profile config','itesoft'),('f28dde30-7849-4a85-85be-835023d15e5f','create unique user config','itesoft');
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
INSERT INTO `AUTHENTICATOR_CONFIG_ENTRY` VALUES ('308ab108-f5d1-4fd6-98e4-7fb894103a45','false','require.password.update.after.registration'),('66aa4795-4803-40b2-b039-432d8efb9972','missing','update.profile.on.first.login'),('afc25a68-68a1-482c-97fd-45442242392a','missing','update.profile.on.first.login'),('f28dde30-7849-4a85-85be-835023d15e5f','false','require.password.update.after.registration');
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
INSERT INTO `CLIENT` VALUES ('1679f52c-b0f9-446f-833f-cf29b92941b6',0x01,0x01,'master-realm',0,0x00,'be777382-43d8-4f94-a118-15f1ddfdf9fb',NULL,0x01,NULL,0x00,'master',NULL,0,0x00,0x00,'master Realm',0x00,'client-secret',NULL,NULL,NULL,0x01,0x00,0x00),('24f36aa3-368e-4798-bb63-4c8e4a28e015',0x01,0x00,'account',0,0x00,'9d6f5387-069a-4c01-bd31-1d71ba327af7','/auth/realms/master/account',0x00,NULL,0x00,'master',NULL,0,0x00,0x00,'${client_account}',0x00,'client-secret',NULL,NULL,NULL,0x01,0x00,0x00),('3f7eac20-6200-481c-ba58-2665fb0239a7',0x01,0x00,'admin-cli',0,0x01,'c04f4fe4-15ca-49dc-8f6e-f25be34cf9c4',NULL,0x00,NULL,0x00,'master',NULL,0,0x00,0x00,'${client_admin-cli}',0x00,'client-secret',NULL,NULL,NULL,0x00,0x00,0x01),('5888916a-43cd-449d-87ad-34a9b5d79270',0x01,0x00,'admin-cli',0,0x01,'4f3ead01-bb85-4eec-af28-1bdf6d05e2b2',NULL,0x00,NULL,0x00,'itesoft',NULL,0,0x00,0x00,'${client_admin-cli}',0x00,'client-secret',NULL,NULL,NULL,0x00,0x00,0x01),('5c5d42d9-6959-4ccf-ba6a-668163a90002',0x01,0x00,'security-admin-console',0,0x01,'b90fcae5-5066-4d27-835a-8b96ac7a38c0','/auth/admin/master/console/index.html',0x00,NULL,0x00,'master',NULL,0,0x00,0x00,'${client_security-admin-console}',0x00,'client-secret',NULL,NULL,NULL,0x01,0x00,0x00),('aa496eb9-dd57-4407-a562-bd67f95f3f85',0x01,0x01,'demo-openidc-client',0,0x00,'9a56d22b-d725-4c63-b38d-a4b71ecc6fb5','auth/realms/itesoft/account',0x00,NULL,0x00,'itesoft','openid-connect',-1,0x00,0x00,NULL,0x00,'client-secret',NULL,NULL,NULL,0x01,0x00,0x00),('ac210415-1a5f-463c-ad82-2c941ce4acf0',0x01,0x00,'broker',0,0x00,'dfaea1b9-d45f-4e1d-b5c6-3ecdf2753a2f',NULL,0x00,NULL,0x00,'itesoft',NULL,0,0x00,0x00,'${client_broker}',0x00,'client-secret',NULL,NULL,NULL,0x01,0x00,0x00),('babc14c6-07a2-454d-a5fe-484ba629cb46',0x01,0x01,'itesoft-realm',0,0x00,'49522a6a-2033-4bd0-9f9e-d0739118306c',NULL,0x01,NULL,0x00,'master',NULL,0,0x00,0x00,'itesoft Realm',0x00,'client-secret',NULL,NULL,NULL,0x01,0x00,0x00),('bdb90d22-b6db-4bcf-9afd-8c2d4461c4f5',0x01,0x00,'broker',0,0x00,'57079250-849a-48ab-9803-3cb465cc0486',NULL,0x00,NULL,0x00,'master',NULL,0,0x00,0x00,'${client_broker}',0x00,'client-secret',NULL,NULL,NULL,0x01,0x00,0x00),('d202ef5d-64e0-442f-8026-12763a234ae7',0x01,0x00,'account',0,0x00,'24011570-241b-4d77-8fd6-c3e4b30c0b8e','/auth/realms/itesoft/account',0x00,NULL,0x00,'itesoft',NULL,0,0x00,0x00,'${client_account}',0x00,'client-secret',NULL,NULL,NULL,0x01,0x00,0x00),('d4650907-4ad5-4cfc-8e0a-42936ab4c128',0x01,0x00,'security-admin-console',0,0x01,'9a9cc47e-1fe3-4e1c-9825-b47d39189bf7','/auth/admin/itesoft/console/index.html',0x00,NULL,0x00,'itesoft',NULL,0,0x00,0x00,'${client_security-admin-console}',0x00,'client-secret',NULL,NULL,NULL,0x01,0x00,0x00),('f4395757-55a2-4804-b6ac-e3a356588cc0',0x01,0x00,'realm-management',0,0x00,'77459fc9-0bdf-42d5-82ea-2812a15af52c',NULL,0x01,NULL,0x00,'itesoft',NULL,0,0x00,0x00,'${client_realm-management}',0x00,'client-secret',NULL,NULL,NULL,0x01,0x00,0x00);
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
INSERT INTO `CLIENT_ATTRIBUTES` VALUES ('aa496eb9-dd57-4407-a562-bd67f95f3f85','false','saml.assertion.signature'),('aa496eb9-dd57-4407-a562-bd67f95f3f85','true','saml.authnstatement'),('aa496eb9-dd57-4407-a562-bd67f95f3f85','false','saml.client.signature'),('aa496eb9-dd57-4407-a562-bd67f95f3f85','false','saml.encrypt'),('aa496eb9-dd57-4407-a562-bd67f95f3f85','false','saml.force.post.binding'),('aa496eb9-dd57-4407-a562-bd67f95f3f85','false','saml.multivalued.roles'),('aa496eb9-dd57-4407-a562-bd67f95f3f85','false','saml.server.signature'),('aa496eb9-dd57-4407-a562-bd67f95f3f85','RSA_SHA256','saml.signature.algorithm'),('aa496eb9-dd57-4407-a562-bd67f95f3f85','false','saml_force_name_id_format'),('aa496eb9-dd57-4407-a562-bd67f95f3f85','username','saml_name_id_format'),('aa496eb9-dd57-4407-a562-bd67f95f3f85','http://www.w3.org/2001/10/xml-exc-c14n#','saml_signature_canonicalization_method');
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
INSERT INTO `CLIENT_DEFAULT_ROLES` VALUES ('24f36aa3-368e-4798-bb63-4c8e4a28e015','7f08b9ff-efed-4751-a018-1db622ac85f1'),('24f36aa3-368e-4798-bb63-4c8e4a28e015','b2f5e2c6-8bae-45f8-b419-f9aa9396ee41'),('d202ef5d-64e0-442f-8026-12763a234ae7','1ec3fe02-8711-4b5f-b71b-2af1840b7f89'),('d202ef5d-64e0-442f-8026-12763a234ae7','d9928f39-28a3-43a0-b46a-a785f93a8d1c');
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
INSERT INTO `COMPOSITE_ROLE` VALUES ('c01b2515-3626-4960-91d7-96c87b433727','bd333654-b4d2-4f53-8db5-c1c662c8ae4b'),('c01b2515-3626-4960-91d7-96c87b433727','044f5712-6ae6-45aa-ae3c-f5e76347650c'),('c01b2515-3626-4960-91d7-96c87b433727','a12a67ee-d5b1-4ad2-8c72-6635bff46190'),('c01b2515-3626-4960-91d7-96c87b433727','02b642f9-85b8-4dae-8a20-489d3ef51bc5'),('c01b2515-3626-4960-91d7-96c87b433727','10758c83-e97b-41b0-aace-bc034fb715e0'),('c01b2515-3626-4960-91d7-96c87b433727','14ca6d40-d459-43c1-900c-0051417f4c9f'),('c01b2515-3626-4960-91d7-96c87b433727','298ad5c3-f991-4d32-94be-65f3392f369c'),('c01b2515-3626-4960-91d7-96c87b433727','78ab8669-20da-4ffc-b270-fbceb667be43'),('c01b2515-3626-4960-91d7-96c87b433727','0dfaa079-347b-4fe3-a696-e864f8b4b2a8'),('c01b2515-3626-4960-91d7-96c87b433727','f629e94b-d894-4391-8421-383d2292ee04'),('c01b2515-3626-4960-91d7-96c87b433727','c825399f-ca15-428c-863a-510ad9231306'),('c01b2515-3626-4960-91d7-96c87b433727','912eda26-7e7b-49de-8559-2a6797e1cdb6'),('c01b2515-3626-4960-91d7-96c87b433727','8998514d-c04f-4d46-b224-edec360504c6'),('c01b2515-3626-4960-91d7-96c87b433727','2f78af14-d82c-4b39-9f7b-fb3cd4dc939e'),('c01b2515-3626-4960-91d7-96c87b433727','4cfb4b05-63a3-4cc1-978a-6011c13df5b9'),('c01b2515-3626-4960-91d7-96c87b433727','2d6c6178-b166-4c9f-a2db-7989f3cf1930'),('c01b2515-3626-4960-91d7-96c87b433727','a644852a-2c1e-41c6-ad6d-5a375fce1821'),('c01b2515-3626-4960-91d7-96c87b433727','e60d01ee-7c22-408f-adc1-fe17b62379b2'),('c01b2515-3626-4960-91d7-96c87b433727','97eb804d-dc8d-44f6-bedb-221b0cfc4af3'),('c01b2515-3626-4960-91d7-96c87b433727','6874eb3e-1aa6-4b3f-9ab7-3f6b6a2fd172'),('c01b2515-3626-4960-91d7-96c87b433727','37976bb8-98d5-4c1a-9d71-09cd49bc5198'),('c01b2515-3626-4960-91d7-96c87b433727','b21283cb-9921-4302-9065-a775feeab0bd'),('c01b2515-3626-4960-91d7-96c87b433727','8232674e-c461-4d17-a121-cd240f5d9fc7'),('c01b2515-3626-4960-91d7-96c87b433727','3e9b509c-83cc-481b-897a-6ebf4c0f3ea1'),('c01b2515-3626-4960-91d7-96c87b433727','62ec3bbc-5378-4c0e-9e19-cc7bb2790203'),('da3d24c0-f20b-446b-951d-ef8945ed0e9c','6ca3772c-df77-43bc-8654-15ebbb692a98'),('da3d24c0-f20b-446b-951d-ef8945ed0e9c','2bb9d3b2-078f-401d-a205-3b25107a43b3'),('da3d24c0-f20b-446b-951d-ef8945ed0e9c','31b5ce95-5b8b-46d7-8344-a45c359c6cc6'),('da3d24c0-f20b-446b-951d-ef8945ed0e9c','978a8ca3-f033-4542-82c7-dbfedfd966bd'),('da3d24c0-f20b-446b-951d-ef8945ed0e9c','77a6ab3a-24a8-457a-83ad-416897ce3fcc'),('da3d24c0-f20b-446b-951d-ef8945ed0e9c','5f51467c-8070-4042-b70c-b5eed243b2e3'),('da3d24c0-f20b-446b-951d-ef8945ed0e9c','83ad77a6-bf2d-4114-9c96-0a5cd1b7f151'),('da3d24c0-f20b-446b-951d-ef8945ed0e9c','86cd4a85-af7a-483f-86e5-93adf319f6cb'),('da3d24c0-f20b-446b-951d-ef8945ed0e9c','65f45dab-4df5-4e73-8060-604ce4ca81a2'),('da3d24c0-f20b-446b-951d-ef8945ed0e9c','5add3647-9b6a-4897-b1ee-3d064a85a8c4'),('da3d24c0-f20b-446b-951d-ef8945ed0e9c','f36d6151-2cfc-40f1-8ca6-9143cb699c72'),('da3d24c0-f20b-446b-951d-ef8945ed0e9c','263cc710-2e5f-4d72-8055-d3d0aeb96287');
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
INSERT INTO `CREDENTIAL` VALUES ('2b1a5b43-36a9-4a05-aae9-5035d6b39dab',NULL,1,0xA5BF1F3E1503CF7BAC4453CAD8C3F8F6,'password','Bt5wdcbhXKzgSdS6qjVXNmnChRB4iiypIWJXDf9WKhhSV+CbT2OE0X+RZfw4Rt8ivA1F4OeQGhURlGKNkQXbqA==','43db004a-e814-438e-bf12-a6b415545bbe',1449598450000,0,0,0,NULL),('40d699b4-827c-4414-9df9-14897d78f853',NULL,1,0xCBABCD71A00667518CE4C2777C0948FA,'password','5vvQqskEiMdAE4jRVpLw2avs6EIb6mCqElFXwkZ4IyxGdFr40AFy6NqagCiKbYRs07X4wS3a/YZr5ZNXFTqOFA==','02a2b2db-85b8-4d86-9c7a-2c97999d440d',1449596420000,0,0,0,NULL);
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
INSERT INTO `DATABASECHANGELOG` VALUES ('1.0.0.Final','sthorger@redhat.com','META-INF/jpa-changelog-1.0.0.Final.xml','2015-12-08 17:39:36',1,'EXECUTED','7:00a57f7a6fb456639b34e62972e0ec02','createTable (x29), addPrimaryKey (x21), addUniqueConstraint (x9), addForeignKeyConstraint (x32)','',NULL,'3.4.1',NULL,NULL),('1.1.0.Beta1','sthorger@redhat.com','META-INF/jpa-changelog-1.1.0.Beta1.xml','2015-12-08 17:39:37',2,'EXECUTED','7:0310eb8ba07cec616460794d42ade0fa','delete (x3), createTable (x3), addColumn (x5), addPrimaryKey (x3), addForeignKeyConstraint (x3), customChange','',NULL,'3.4.1',NULL,NULL),('1.1.0.Final','sthorger@redhat.com','META-INF/jpa-changelog-1.1.0.Final.xml','2015-12-08 17:39:37',3,'EXECUTED','7:5d25857e708c3233ef4439df1f93f012','renameColumn','',NULL,'3.4.1',NULL,NULL),('1.2.0.Beta1','psilva@redhat.com','META-INF/jpa-changelog-1.2.0.Beta1.xml','2015-12-08 17:39:39',4,'EXECUTED','7:c7a54a1041d58eb3817a4a883b4d4e84','delete (x4), createTable (x8), addColumn (x2), addPrimaryKey (x6), addForeignKeyConstraint (x9), addUniqueConstraint (x2), addColumn, dropForeignKeyConstraint (x2), dropUniqueConstraint, renameColumn (x3), addUniqueConstraint, addForeignKeyConstra...','',NULL,'3.4.1',NULL,NULL),('1.2.0.RC1','bburke@redhat.com','META-INF/jpa-changelog-1.2.0.CR1.xml','2015-12-08 17:39:41',5,'EXECUTED','7:0f08df48468428e0f30ee59a8ec01a41','delete (x5), createTable (x3), addColumn, createTable (x4), addPrimaryKey (x7), addForeignKeyConstraint (x6), renameColumn, addColumn (x2), update, dropColumn, dropForeignKeyConstraint, renameColumn, addForeignKeyConstraint, dropForeignKeyConstrai...','',NULL,'3.4.1',NULL,NULL),('1.2.0.Final','keycloak','META-INF/jpa-changelog-1.2.0.Final.xml','2015-12-08 17:39:41',6,'EXECUTED','7:a3377a2059aefbf3b90ebb4c4cc8e2ab','update (x3)','',NULL,'3.4.1',NULL,NULL),('1.3.0','bburke@redhat.com','META-INF/jpa-changelog-1.3.0.xml','2015-12-08 17:39:43',7,'EXECUTED','7:04c1dbedc2aa3e9756d1a1668e003451','delete (x6), createTable (x7), addColumn, createTable, addColumn (x2), update, dropDefaultValue, dropColumn, addColumn, update (x4), addPrimaryKey (x4), dropPrimaryKey, dropColumn, addPrimaryKey (x4), addForeignKeyConstraint (x8), dropDefaultValue...','',NULL,'3.4.1',NULL,NULL),('1.4.0','bburke@redhat.com','META-INF/jpa-changelog-1.4.0.xml','2015-12-08 17:39:44',8,'EXECUTED','7:36ef39ed560ad07062d956db861042ba','delete (x7), addColumn (x5), dropColumn, renameTable (x2), update (x10), createTable (x3), customChange, dropPrimaryKey, addPrimaryKey (x4), addForeignKeyConstraint (x2), dropColumn, addColumn','',NULL,'3.4.1',NULL,NULL),('1.5.0','bburke@redhat.com','META-INF/jpa-changelog-1.5.0.xml','2015-12-08 17:39:44',9,'EXECUTED','7:cf12b04b79bea5152f165eb41f3955f6','delete (x7), dropDefaultValue, dropColumn, addColumn (x3)','',NULL,'3.4.1',NULL,NULL),('1.6.1_from15','mposolda@redhat.com','META-INF/jpa-changelog-1.6.1.xml','2015-12-08 17:39:44',10,'EXECUTED','7:7e32c8f05c755e8675764e7d5f514509','addColumn (x3), createTable (x2), addPrimaryKey (x2)','',NULL,'3.4.1',NULL,NULL),('1.6.1_from16','mposolda@redhat.com','META-INF/jpa-changelog-1.6.1.xml','2015-12-08 17:39:44',11,'MARK_RAN','7:2fa220758991285312eb84f3b4ff5336','dropPrimaryKey (x2), addColumn, update, dropColumn, addColumn, update, dropColumn, addPrimaryKey (x2)','',NULL,'3.4.1',NULL,NULL),('1.6.1','mposolda@redhat.com','META-INF/jpa-changelog-1.6.1.xml','2015-12-08 17:39:44',12,'EXECUTED','7:d41d8cd98f00b204e9800998ecf8427e','Empty','',NULL,'3.4.1',NULL,NULL),('1.7.0','bburke@redhat.com','META-INF/jpa-changelog-1.7.0.xml','2015-12-08 17:39:46',13,'EXECUTED','7:91ace540896df890cc00a0490ee52bbc','createTable (x5), addColumn (x2), dropDefaultValue, dropColumn, addPrimaryKey, addForeignKeyConstraint, addPrimaryKey, addForeignKeyConstraint, addPrimaryKey, addForeignKeyConstraint, addPrimaryKey, addForeignKeyConstraint (x2), addUniqueConstrain...','',NULL,'3.4.1',NULL,NULL);
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
INSERT INTO `DATABASECHANGELOGLOCK` VALUES (1,0x00,NULL,NULL);
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
INSERT INTO `KEYCLOAK_ROLE` VALUES ('02b642f9-85b8-4dae-8a20-489d3ef51bc5','1679f52c-b0f9-446f-833f-cf29b92941b6',0x01,'${role_view-users}','view-users','master','1679f52c-b0f9-446f-833f-cf29b92941b6',NULL,0x00),('044f5712-6ae6-45aa-ae3c-f5e76347650c','1679f52c-b0f9-446f-833f-cf29b92941b6',0x01,'${role_create-client}','create-client','master','1679f52c-b0f9-446f-833f-cf29b92941b6',NULL,0x00),('0d47bd53-9cc6-4d20-94c6-46eacebb4550','itesoft',0x00,'${role_offline-access}','offline_access','itesoft',NULL,'itesoft',0x01),('0dfaa079-347b-4fe3-a696-e864f8b4b2a8','1679f52c-b0f9-446f-833f-cf29b92941b6',0x01,'${role_manage-users}','manage-users','master','1679f52c-b0f9-446f-833f-cf29b92941b6',NULL,0x00),('10758c83-e97b-41b0-aace-bc034fb715e0','1679f52c-b0f9-446f-833f-cf29b92941b6',0x01,'${role_view-clients}','view-clients','master','1679f52c-b0f9-446f-833f-cf29b92941b6',NULL,0x00),('14ca6d40-d459-43c1-900c-0051417f4c9f','1679f52c-b0f9-446f-833f-cf29b92941b6',0x01,'${role_view-events}','view-events','master','1679f52c-b0f9-446f-833f-cf29b92941b6',NULL,0x00),('198b8b13-7645-403f-a6fc-dac0c9bbf5ba','master',0x00,'${role_offline-access}','offline_access','master',NULL,'master',0x01),('1ec3fe02-8711-4b5f-b71b-2af1840b7f89','d202ef5d-64e0-442f-8026-12763a234ae7',0x01,'${role_manage-account}','manage-account','itesoft','d202ef5d-64e0-442f-8026-12763a234ae7',NULL,0x00),('263cc710-2e5f-4d72-8055-d3d0aeb96287','f4395757-55a2-4804-b6ac-e3a356588cc0',0x01,'${role_impersonation}','impersonation','itesoft','f4395757-55a2-4804-b6ac-e3a356588cc0',NULL,0x00),('298ad5c3-f991-4d32-94be-65f3392f369c','1679f52c-b0f9-446f-833f-cf29b92941b6',0x01,'${role_view-identity-providers}','view-identity-providers','master','1679f52c-b0f9-446f-833f-cf29b92941b6',NULL,0x00),('2bb9d3b2-078f-401d-a205-3b25107a43b3','f4395757-55a2-4804-b6ac-e3a356588cc0',0x01,'${role_view-realm}','view-realm','itesoft','f4395757-55a2-4804-b6ac-e3a356588cc0',NULL,0x00),('2d6c6178-b166-4c9f-a2db-7989f3cf1930','babc14c6-07a2-454d-a5fe-484ba629cb46',0x01,'${role_view-users}','view-users','master','babc14c6-07a2-454d-a5fe-484ba629cb46',NULL,0x00),('2f78af14-d82c-4b39-9f7b-fb3cd4dc939e','babc14c6-07a2-454d-a5fe-484ba629cb46',0x01,'${role_create-client}','create-client','master','babc14c6-07a2-454d-a5fe-484ba629cb46',NULL,0x00),('31b5ce95-5b8b-46d7-8344-a45c359c6cc6','f4395757-55a2-4804-b6ac-e3a356588cc0',0x01,'${role_view-users}','view-users','itesoft','f4395757-55a2-4804-b6ac-e3a356588cc0',NULL,0x00),('37976bb8-98d5-4c1a-9d71-09cd49bc5198','babc14c6-07a2-454d-a5fe-484ba629cb46',0x01,'${role_manage-users}','manage-users','master','babc14c6-07a2-454d-a5fe-484ba629cb46',NULL,0x00),('3e9b509c-83cc-481b-897a-6ebf4c0f3ea1','babc14c6-07a2-454d-a5fe-484ba629cb46',0x01,'${role_manage-identity-providers}','manage-identity-providers','master','babc14c6-07a2-454d-a5fe-484ba629cb46',NULL,0x00),('4cfb4b05-63a3-4cc1-978a-6011c13df5b9','babc14c6-07a2-454d-a5fe-484ba629cb46',0x01,'${role_view-realm}','view-realm','master','babc14c6-07a2-454d-a5fe-484ba629cb46',NULL,0x00),('5add3647-9b6a-4897-b1ee-3d064a85a8c4','f4395757-55a2-4804-b6ac-e3a356588cc0',0x01,'${role_manage-events}','manage-events','itesoft','f4395757-55a2-4804-b6ac-e3a356588cc0',NULL,0x00),('5b759706-54c0-4616-b0f1-823aab69e39d','ac210415-1a5f-463c-ad82-2c941ce4acf0',0x01,'${role_read-token}','read-token','itesoft','ac210415-1a5f-463c-ad82-2c941ce4acf0',NULL,0x00),('5f51467c-8070-4042-b70c-b5eed243b2e3','f4395757-55a2-4804-b6ac-e3a356588cc0',0x01,'${role_view-identity-providers}','view-identity-providers','itesoft','f4395757-55a2-4804-b6ac-e3a356588cc0',NULL,0x00),('62ec3bbc-5378-4c0e-9e19-cc7bb2790203','babc14c6-07a2-454d-a5fe-484ba629cb46',0x01,'${role_impersonation}','impersonation','master','babc14c6-07a2-454d-a5fe-484ba629cb46',NULL,0x00),('65f45dab-4df5-4e73-8060-604ce4ca81a2','f4395757-55a2-4804-b6ac-e3a356588cc0',0x01,'${role_manage-clients}','manage-clients','itesoft','f4395757-55a2-4804-b6ac-e3a356588cc0',NULL,0x00),('6874eb3e-1aa6-4b3f-9ab7-3f6b6a2fd172','babc14c6-07a2-454d-a5fe-484ba629cb46',0x01,'${role_manage-realm}','manage-realm','master','babc14c6-07a2-454d-a5fe-484ba629cb46',NULL,0x00),('6a25b528-d952-4a63-8287-16bc950ce5fe','bdb90d22-b6db-4bcf-9afd-8c2d4461c4f5',0x01,'${role_read-token}','read-token','master','bdb90d22-b6db-4bcf-9afd-8c2d4461c4f5',NULL,0x00),('6ca3772c-df77-43bc-8654-15ebbb692a98','f4395757-55a2-4804-b6ac-e3a356588cc0',0x01,'${role_create-client}','create-client','itesoft','f4395757-55a2-4804-b6ac-e3a356588cc0',NULL,0x00),('77a6ab3a-24a8-457a-83ad-416897ce3fcc','f4395757-55a2-4804-b6ac-e3a356588cc0',0x01,'${role_view-events}','view-events','itesoft','f4395757-55a2-4804-b6ac-e3a356588cc0',NULL,0x00),('78ab8669-20da-4ffc-b270-fbceb667be43','1679f52c-b0f9-446f-833f-cf29b92941b6',0x01,'${role_manage-realm}','manage-realm','master','1679f52c-b0f9-446f-833f-cf29b92941b6',NULL,0x00),('7f08b9ff-efed-4751-a018-1db622ac85f1','24f36aa3-368e-4798-bb63-4c8e4a28e015',0x01,'${role_manage-account}','manage-account','master','24f36aa3-368e-4798-bb63-4c8e4a28e015',NULL,0x00),('8232674e-c461-4d17-a121-cd240f5d9fc7','babc14c6-07a2-454d-a5fe-484ba629cb46',0x01,'${role_manage-events}','manage-events','master','babc14c6-07a2-454d-a5fe-484ba629cb46',NULL,0x00),('83ad77a6-bf2d-4114-9c96-0a5cd1b7f151','f4395757-55a2-4804-b6ac-e3a356588cc0',0x01,'${role_manage-realm}','manage-realm','itesoft','f4395757-55a2-4804-b6ac-e3a356588cc0',NULL,0x00),('86cd4a85-af7a-483f-86e5-93adf319f6cb','f4395757-55a2-4804-b6ac-e3a356588cc0',0x01,'${role_manage-users}','manage-users','itesoft','f4395757-55a2-4804-b6ac-e3a356588cc0',NULL,0x00),('8998514d-c04f-4d46-b224-edec360504c6','1679f52c-b0f9-446f-833f-cf29b92941b6',0x01,'${role_impersonation}','impersonation','master','1679f52c-b0f9-446f-833f-cf29b92941b6',NULL,0x00),('912eda26-7e7b-49de-8559-2a6797e1cdb6','1679f52c-b0f9-446f-833f-cf29b92941b6',0x01,'${role_manage-identity-providers}','manage-identity-providers','master','1679f52c-b0f9-446f-833f-cf29b92941b6',NULL,0x00),('978a8ca3-f033-4542-82c7-dbfedfd966bd','f4395757-55a2-4804-b6ac-e3a356588cc0',0x01,'${role_view-clients}','view-clients','itesoft','f4395757-55a2-4804-b6ac-e3a356588cc0',NULL,0x00),('97eb804d-dc8d-44f6-bedb-221b0cfc4af3','babc14c6-07a2-454d-a5fe-484ba629cb46',0x01,'${role_view-identity-providers}','view-identity-providers','master','babc14c6-07a2-454d-a5fe-484ba629cb46',NULL,0x00),('a12a67ee-d5b1-4ad2-8c72-6635bff46190','1679f52c-b0f9-446f-833f-cf29b92941b6',0x01,'${role_view-realm}','view-realm','master','1679f52c-b0f9-446f-833f-cf29b92941b6',NULL,0x00),('a644852a-2c1e-41c6-ad6d-5a375fce1821','babc14c6-07a2-454d-a5fe-484ba629cb46',0x01,'${role_view-clients}','view-clients','master','babc14c6-07a2-454d-a5fe-484ba629cb46',NULL,0x00),('a65c53d7-f052-4e40-bcb3-7d86030a1b4c','itesoft',0x00,NULL,'user','itesoft',NULL,'itesoft',0x00),('b21283cb-9921-4302-9065-a775feeab0bd','babc14c6-07a2-454d-a5fe-484ba629cb46',0x01,'${role_manage-clients}','manage-clients','master','babc14c6-07a2-454d-a5fe-484ba629cb46',NULL,0x00),('b2f5e2c6-8bae-45f8-b419-f9aa9396ee41','24f36aa3-368e-4798-bb63-4c8e4a28e015',0x01,'${role_view-profile}','view-profile','master','24f36aa3-368e-4798-bb63-4c8e4a28e015',NULL,0x00),('bd333654-b4d2-4f53-8db5-c1c662c8ae4b','master',0x00,'${role_create-realm}','create-realm','master',NULL,'master',0x00),('c01b2515-3626-4960-91d7-96c87b433727','master',0x00,'${role_admin}','admin','master',NULL,'master',0x00),('c825399f-ca15-428c-863a-510ad9231306','1679f52c-b0f9-446f-833f-cf29b92941b6',0x01,'${role_manage-events}','manage-events','master','1679f52c-b0f9-446f-833f-cf29b92941b6',NULL,0x00),('d9928f39-28a3-43a0-b46a-a785f93a8d1c','d202ef5d-64e0-442f-8026-12763a234ae7',0x01,'${role_view-profile}','view-profile','itesoft','d202ef5d-64e0-442f-8026-12763a234ae7',NULL,0x00),('da3d24c0-f20b-446b-951d-ef8945ed0e9c','f4395757-55a2-4804-b6ac-e3a356588cc0',0x01,'${role_realm-admin}','realm-admin','itesoft','f4395757-55a2-4804-b6ac-e3a356588cc0',NULL,0x00),('e60d01ee-7c22-408f-adc1-fe17b62379b2','babc14c6-07a2-454d-a5fe-484ba629cb46',0x01,'${role_view-events}','view-events','master','babc14c6-07a2-454d-a5fe-484ba629cb46',NULL,0x00),('f36d6151-2cfc-40f1-8ca6-9143cb699c72','f4395757-55a2-4804-b6ac-e3a356588cc0',0x01,'${role_manage-identity-providers}','manage-identity-providers','itesoft','f4395757-55a2-4804-b6ac-e3a356588cc0',NULL,0x00),('f629e94b-d894-4391-8421-383d2292ee04','1679f52c-b0f9-446f-833f-cf29b92941b6',0x01,'${role_manage-clients}','manage-clients','master','1679f52c-b0f9-446f-833f-cf29b92941b6',NULL,0x00),('f9764274-ef5d-4f90-a959-ab8b4e0a15f7','itesoft',0x00,NULL,'admin','itesoft',NULL,'itesoft',0x00);
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
INSERT INTO `PROTOCOL_MAPPER` VALUES ('04a54d32-255f-4cf7-ab0d-6ec15bd4e440','locale','openid-connect','oidc-usermodel-attribute-mapper',0x00,'${locale}','5c5d42d9-6959-4ccf-ba6a-668163a90002'),('084f1ed1-3e6b-4b8a-a6c6-1c82065a4afe','email','openid-connect','oidc-usermodel-property-mapper',0x01,'${email}','24f36aa3-368e-4798-bb63-4c8e4a28e015'),('0b709709-1c9f-4795-b211-6c31ba804dd5','supplier-id','openid-connect','oidc-hardcoded-claim-mapper',0x01,NULL,'aa496eb9-dd57-4407-a562-bd67f95f3f85'),('1241ce06-1b93-4a53-a811-f44fc7b59f5c','family name','openid-connect','oidc-usermodel-property-mapper',0x01,'${familyName}','babc14c6-07a2-454d-a5fe-484ba629cb46'),('1288aa3f-e1ab-410f-9f22-cef50fd209f9','family name','openid-connect','oidc-usermodel-property-mapper',0x01,'${familyName}','5c5d42d9-6959-4ccf-ba6a-668163a90002'),('131fff7e-bf97-40af-9d5d-f1daed3ad897','role list','saml','saml-role-list-mapper',0x00,NULL,'d4650907-4ad5-4cfc-8e0a-42936ab4c128'),('1828b516-2c45-4423-8759-46edd906e9ba','role list','saml','saml-role-list-mapper',0x00,NULL,'3f7eac20-6200-481c-ba58-2665fb0239a7'),('22d3fef2-04fc-48ef-8117-ca625097edee','email','openid-connect','oidc-usermodel-property-mapper',0x01,'${email}','ac210415-1a5f-463c-ad82-2c941ce4acf0'),('2544b15e-9891-49bd-8b21-012b966b4071','given name','openid-connect','oidc-usermodel-property-mapper',0x01,'${givenName}','f4395757-55a2-4804-b6ac-e3a356588cc0'),('25d2f480-c171-4a37-a2b9-9ffd0624839f','family name','openid-connect','oidc-usermodel-property-mapper',0x01,'${familyName}','1679f52c-b0f9-446f-833f-cf29b92941b6'),('2f4a75b3-e702-417b-aacd-e45121e6107b','email','openid-connect','oidc-usermodel-property-mapper',0x01,'${email}','d202ef5d-64e0-442f-8026-12763a234ae7'),('2fdd4766-9dee-4337-9102-4d47424e86f3','full name','openid-connect','oidc-full-name-mapper',0x01,'${fullName}','5c5d42d9-6959-4ccf-ba6a-668163a90002'),('31c7615c-80fb-4378-af8a-3cd5f99cc34f','full name','openid-connect','oidc-full-name-mapper',0x01,'${fullName}','1679f52c-b0f9-446f-833f-cf29b92941b6'),('320eca18-2b81-444b-9bcc-6896e65c7498','given name','openid-connect','oidc-usermodel-property-mapper',0x01,'${givenName}','24f36aa3-368e-4798-bb63-4c8e4a28e015'),('321afd9e-a985-473d-9588-aae8821a8e95','role list','saml','saml-role-list-mapper',0x00,NULL,'babc14c6-07a2-454d-a5fe-484ba629cb46'),('3299a06d-b743-4e3a-883e-0791efb581b3','role list','saml','saml-role-list-mapper',0x00,NULL,'f4395757-55a2-4804-b6ac-e3a356588cc0'),('38031f83-b6fd-4b9f-814b-29457731f69e','given name','openid-connect','oidc-usermodel-property-mapper',0x01,'${givenName}','ac210415-1a5f-463c-ad82-2c941ce4acf0'),('404d05ff-47a9-4efa-8029-9aaf3e9708a4','family name','openid-connect','oidc-usermodel-property-mapper',0x01,'${familyName}','f4395757-55a2-4804-b6ac-e3a356588cc0'),('41c1843c-5321-4e3d-9e95-d8cbe7a4b033','family name','openid-connect','oidc-usermodel-property-mapper',0x01,'${familyName}','3f7eac20-6200-481c-ba58-2665fb0239a7'),('42cb3433-3062-497b-9f52-39415cc1a68d','username','openid-connect','oidc-usermodel-property-mapper',0x01,'${username}','5c5d42d9-6959-4ccf-ba6a-668163a90002'),('4750771d-e266-4959-b930-e4750fedc564','email','openid-connect','oidc-usermodel-property-mapper',0x01,'${email}','1679f52c-b0f9-446f-833f-cf29b92941b6'),('4a59d344-632d-4c22-870d-b86b4c5b3f20','username','openid-connect','oidc-usermodel-property-mapper',0x01,'${username}','3f7eac20-6200-481c-ba58-2665fb0239a7'),('4b186483-f3f3-43e9-822a-1eb045d9de9e','full name','openid-connect','oidc-full-name-mapper',0x01,'${fullName}','f4395757-55a2-4804-b6ac-e3a356588cc0'),('4e466ffd-197a-4779-a954-58bc9b09a40c','family name','openid-connect','oidc-usermodel-property-mapper',0x01,'${familyName}','d202ef5d-64e0-442f-8026-12763a234ae7'),('55b5e1e4-6768-4edd-976a-828151fa4685','full name','openid-connect','oidc-full-name-mapper',0x01,'${fullName}','bdb90d22-b6db-4bcf-9afd-8c2d4461c4f5'),('5b210817-8859-456c-a6da-a03afb8e6c9b','username','openid-connect','oidc-usermodel-property-mapper',0x01,'${username}','1679f52c-b0f9-446f-833f-cf29b92941b6'),('614337f8-de41-41d5-8931-7e0dd8ca70e6','email','openid-connect','oidc-usermodel-property-mapper',0x01,'${email}','f4395757-55a2-4804-b6ac-e3a356588cc0'),('61a964ee-fb47-4950-96dc-678fbf1513f4','family name','openid-connect','oidc-usermodel-property-mapper',0x01,'${familyName}','ac210415-1a5f-463c-ad82-2c941ce4acf0'),('65a3c280-c427-46a3-bd95-7224485e5ff3','family name','openid-connect','oidc-usermodel-property-mapper',0x01,'${familyName}','bdb90d22-b6db-4bcf-9afd-8c2d4461c4f5'),('663fca42-7a29-4cd2-91fb-e3e1371fe095','family name','openid-connect','oidc-usermodel-property-mapper',0x01,'${familyName}','aa496eb9-dd57-4407-a562-bd67f95f3f85'),('66994ab9-37d7-49ec-8d51-275094dd87bb','full name','openid-connect','oidc-full-name-mapper',0x01,'${fullName}','babc14c6-07a2-454d-a5fe-484ba629cb46'),('69aae57d-9aa9-493b-b429-f20cdc7d4010','given name','openid-connect','oidc-usermodel-property-mapper',0x01,'${givenName}','d4650907-4ad5-4cfc-8e0a-42936ab4c128'),('6b0ba602-e53f-4526-a9f9-2083ddb2411a','username','openid-connect','oidc-usermodel-property-mapper',0x01,'${username}','5888916a-43cd-449d-87ad-34a9b5d79270'),('740b2b19-7c82-4ba5-aad9-246ee803b3c7','email','openid-connect','oidc-usermodel-property-mapper',0x01,'${email}','babc14c6-07a2-454d-a5fe-484ba629cb46'),('75e4f0eb-d625-4345-ba04-e1c3208b9774','family name','openid-connect','oidc-usermodel-property-mapper',0x01,'${familyName}','d4650907-4ad5-4cfc-8e0a-42936ab4c128'),('781e4dfb-c763-4f70-8771-3bc75fecf880','role list','saml','saml-role-list-mapper',0x00,NULL,'5c5d42d9-6959-4ccf-ba6a-668163a90002'),('7a5c7bc1-6a75-4326-b51d-76af3ba061bd','username','openid-connect','oidc-usermodel-property-mapper',0x01,'${username}','d4650907-4ad5-4cfc-8e0a-42936ab4c128'),('802aaf75-5dc2-4702-a877-65deacd3c105','username','openid-connect','oidc-usermodel-property-mapper',0x01,'${username}','ac210415-1a5f-463c-ad82-2c941ce4acf0'),('82e445f3-93c9-4c5b-86cf-85661ed4369c','role list','saml','saml-role-list-mapper',0x00,NULL,'d202ef5d-64e0-442f-8026-12763a234ae7'),('8551e0f2-e5b8-4fdf-b673-f8cc5633d9b5','family name','openid-connect','oidc-usermodel-property-mapper',0x01,'${familyName}','5888916a-43cd-449d-87ad-34a9b5d79270'),('861a4c49-16bb-4543-816a-4385aa50ab9f','given name','openid-connect','oidc-usermodel-property-mapper',0x01,'${givenName}','aa496eb9-dd57-4407-a562-bd67f95f3f85'),('87a088de-3728-4e81-93c4-db5963bb2e7b','role list','saml','saml-role-list-mapper',0x00,NULL,'1679f52c-b0f9-446f-833f-cf29b92941b6'),('93d43852-9392-43a1-9de9-38637819737e','given name','openid-connect','oidc-usermodel-property-mapper',0x01,'${givenName}','d202ef5d-64e0-442f-8026-12763a234ae7'),('969e4ee0-2e2c-4797-830f-1e2e9535caf1','username','openid-connect','oidc-usermodel-property-mapper',0x01,'${username}','d202ef5d-64e0-442f-8026-12763a234ae7'),('9b4eebd1-875d-41e6-9a2b-197c7b6fb276','email','openid-connect','oidc-usermodel-property-mapper',0x01,'${email}','5888916a-43cd-449d-87ad-34a9b5d79270'),('9f875669-a508-4e44-9394-298a26a84013','role list','saml','saml-role-list-mapper',0x00,NULL,'24f36aa3-368e-4798-bb63-4c8e4a28e015'),('a1a12ebe-2c94-4d01-953d-7f55e5003519','given name','openid-connect','oidc-usermodel-property-mapper',0x01,'${givenName}','3f7eac20-6200-481c-ba58-2665fb0239a7'),('a50d0bc9-63ae-4409-8572-eb224b7222ba','email','openid-connect','oidc-usermodel-property-mapper',0x01,'${email}','d4650907-4ad5-4cfc-8e0a-42936ab4c128'),('a55235eb-d8b2-4529-aa62-6667667e1c56','email','openid-connect','oidc-usermodel-property-mapper',0x01,'${email}','aa496eb9-dd57-4407-a562-bd67f95f3f85'),('a6536a33-9f16-40d2-b0dc-65604824bbe9','role list','saml','saml-role-list-mapper',0x00,NULL,'ac210415-1a5f-463c-ad82-2c941ce4acf0'),('a6fdb2e0-19c1-438f-89fd-cc1d60447e0a','username','openid-connect','oidc-usermodel-property-mapper',0x01,'${username}','24f36aa3-368e-4798-bb63-4c8e4a28e015'),('aaa637fb-9006-47c2-9d3f-0970de5ded2d','username','openid-connect','oidc-usermodel-property-mapper',0x01,'${username}','bdb90d22-b6db-4bcf-9afd-8c2d4461c4f5'),('aacd9850-cf32-4d27-bb4e-742265832986','full name','openid-connect','oidc-full-name-mapper',0x01,'${fullName}','24f36aa3-368e-4798-bb63-4c8e4a28e015'),('acd1125b-3a3b-4cef-8247-470cb170c412','role list','saml','saml-role-list-mapper',0x00,NULL,'bdb90d22-b6db-4bcf-9afd-8c2d4461c4f5'),('b1be284a-c5ff-479e-8249-e6133c150654','given name','openid-connect','oidc-usermodel-property-mapper',0x01,'${givenName}','5c5d42d9-6959-4ccf-ba6a-668163a90002'),('bc752884-2ef6-4f7a-b69a-72f10adfdff4','full name','openid-connect','oidc-full-name-mapper',0x01,'${fullName}','ac210415-1a5f-463c-ad82-2c941ce4acf0'),('c16edc10-f7e6-4c80-82ab-1a04f644d428','full name','openid-connect','oidc-full-name-mapper',0x01,'${fullName}','d4650907-4ad5-4cfc-8e0a-42936ab4c128'),('cb9ab011-2de5-42be-8b3c-caa41b5321cf','full name','openid-connect','oidc-full-name-mapper',0x01,'${fullName}','5888916a-43cd-449d-87ad-34a9b5d79270'),('d1696cd5-02d9-48d9-96ab-c02cab30842e','full name','openid-connect','oidc-full-name-mapper',0x01,'${fullName}','aa496eb9-dd57-4407-a562-bd67f95f3f85'),('d357d290-0e29-4020-b204-81c70572066f','username','openid-connect','oidc-usermodel-property-mapper',0x01,'${username}','babc14c6-07a2-454d-a5fe-484ba629cb46'),('d43c1f74-0604-42f7-a6fc-ab1c6d1fceaa','email','openid-connect','oidc-usermodel-property-mapper',0x01,'${email}','3f7eac20-6200-481c-ba58-2665fb0239a7'),('d7beade9-0be3-43f9-8222-95980f5f8e6d','username','openid-connect','oidc-usermodel-property-mapper',0x01,'${username}','aa496eb9-dd57-4407-a562-bd67f95f3f85'),('d8f20b19-90d6-436f-b650-ee55ee1fedb2','given name','openid-connect','oidc-usermodel-property-mapper',0x01,'${givenName}','bdb90d22-b6db-4bcf-9afd-8c2d4461c4f5'),('d8f5463a-86d5-4f44-b94b-6251573e8bae','family name','openid-connect','oidc-usermodel-property-mapper',0x01,'${familyName}','24f36aa3-368e-4798-bb63-4c8e4a28e015'),('dc46decf-0ed9-458b-8b8f-1fae752b8935','given name','openid-connect','oidc-usermodel-property-mapper',0x01,'${givenName}','5888916a-43cd-449d-87ad-34a9b5d79270'),('dda24bb3-a2ee-4c2f-ad0f-0816675b42cd','email','openid-connect','oidc-usermodel-property-mapper',0x01,'${email}','bdb90d22-b6db-4bcf-9afd-8c2d4461c4f5'),('df8c5a01-1572-4e92-8af0-d9c5271f3f0e','locale','openid-connect','oidc-usermodel-attribute-mapper',0x00,'${locale}','d4650907-4ad5-4cfc-8e0a-42936ab4c128'),('e5347a47-0824-4f8d-b49c-349c16f143ef','role list','saml','saml-role-list-mapper',0x00,NULL,'5888916a-43cd-449d-87ad-34a9b5d79270'),('e6af673f-2d66-46aa-a2c0-daa81ef02d60','username','openid-connect','oidc-usermodel-property-mapper',0x01,'${username}','f4395757-55a2-4804-b6ac-e3a356588cc0'),('e7a92699-1bd9-4fd0-b91a-81a6b168fe99','given name','openid-connect','oidc-usermodel-property-mapper',0x01,'${givenName}','babc14c6-07a2-454d-a5fe-484ba629cb46'),('e94ecc93-7737-4c0e-a157-ca246426acfe','full name','openid-connect','oidc-full-name-mapper',0x01,'${fullName}','3f7eac20-6200-481c-ba58-2665fb0239a7'),('ea3a6935-cc81-41ba-9c89-7d2d237af8e1','full name','openid-connect','oidc-full-name-mapper',0x01,'${fullName}','d202ef5d-64e0-442f-8026-12763a234ae7'),('ed72f354-8fdd-43fc-af02-85b7f1b526b1','given name','openid-connect','oidc-usermodel-property-mapper',0x01,'${givenName}','1679f52c-b0f9-446f-833f-cf29b92941b6'),('f789fee5-5a78-4094-88d9-9b46ea151a10','role list','saml','saml-role-list-mapper',0x00,NULL,'aa496eb9-dd57-4407-a562-bd67f95f3f85'),('fcef320f-6528-49c2-8033-4bfb21e086b2','email','openid-connect','oidc-usermodel-property-mapper',0x01,'${email}','5c5d42d9-6959-4ccf-ba6a-668163a90002');
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
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('04a54d32-255f-4cf7-ab0d-6ec15bd4e440','true','access.token.claim'),('04a54d32-255f-4cf7-ab0d-6ec15bd4e440','locale','claim.name'),('04a54d32-255f-4cf7-ab0d-6ec15bd4e440','true','id.token.claim'),('04a54d32-255f-4cf7-ab0d-6ec15bd4e440','String','jsonType.label'),('04a54d32-255f-4cf7-ab0d-6ec15bd4e440','locale','user.attribute'),('084f1ed1-3e6b-4b8a-a6c6-1c82065a4afe','true','access.token.claim'),('084f1ed1-3e6b-4b8a-a6c6-1c82065a4afe','email','claim.name'),('084f1ed1-3e6b-4b8a-a6c6-1c82065a4afe','true','id.token.claim'),('084f1ed1-3e6b-4b8a-a6c6-1c82065a4afe','String','jsonType.label'),('084f1ed1-3e6b-4b8a-a6c6-1c82065a4afe','email','user.attribute'),('0b709709-1c9f-4795-b211-6c31ba804dd5','true','access.token.claim'),('0b709709-1c9f-4795-b211-6c31ba804dd5','supplier-id','claim.name'),('0b709709-1c9f-4795-b211-6c31ba804dd5','56','claim.value'),('0b709709-1c9f-4795-b211-6c31ba804dd5','true','id.token.claim'),('0b709709-1c9f-4795-b211-6c31ba804dd5','int','jsonType.label'),('1241ce06-1b93-4a53-a811-f44fc7b59f5c','true','access.token.claim'),('1241ce06-1b93-4a53-a811-f44fc7b59f5c','family_name','claim.name'),('1241ce06-1b93-4a53-a811-f44fc7b59f5c','true','id.token.claim'),('1241ce06-1b93-4a53-a811-f44fc7b59f5c','String','jsonType.label'),('1241ce06-1b93-4a53-a811-f44fc7b59f5c','lastName','user.attribute'),('1288aa3f-e1ab-410f-9f22-cef50fd209f9','true','access.token.claim'),('1288aa3f-e1ab-410f-9f22-cef50fd209f9','family_name','claim.name'),('1288aa3f-e1ab-410f-9f22-cef50fd209f9','true','id.token.claim'),('1288aa3f-e1ab-410f-9f22-cef50fd209f9','String','jsonType.label'),('1288aa3f-e1ab-410f-9f22-cef50fd209f9','lastName','user.attribute'),('131fff7e-bf97-40af-9d5d-f1daed3ad897','Role','attribute.name'),('131fff7e-bf97-40af-9d5d-f1daed3ad897','Basic','attribute.nameformat'),('131fff7e-bf97-40af-9d5d-f1daed3ad897','false','single'),('1828b516-2c45-4423-8759-46edd906e9ba','Role','attribute.name'),('1828b516-2c45-4423-8759-46edd906e9ba','Basic','attribute.nameformat'),('1828b516-2c45-4423-8759-46edd906e9ba','false','single'),('22d3fef2-04fc-48ef-8117-ca625097edee','true','access.token.claim'),('22d3fef2-04fc-48ef-8117-ca625097edee','email','claim.name'),('22d3fef2-04fc-48ef-8117-ca625097edee','true','id.token.claim'),('22d3fef2-04fc-48ef-8117-ca625097edee','String','jsonType.label'),('22d3fef2-04fc-48ef-8117-ca625097edee','email','user.attribute'),('2544b15e-9891-49bd-8b21-012b966b4071','true','access.token.claim'),('2544b15e-9891-49bd-8b21-012b966b4071','given_name','claim.name'),('2544b15e-9891-49bd-8b21-012b966b4071','true','id.token.claim'),('2544b15e-9891-49bd-8b21-012b966b4071','String','jsonType.label'),('2544b15e-9891-49bd-8b21-012b966b4071','firstName','user.attribute'),('25d2f480-c171-4a37-a2b9-9ffd0624839f','true','access.token.claim'),('25d2f480-c171-4a37-a2b9-9ffd0624839f','family_name','claim.name'),('25d2f480-c171-4a37-a2b9-9ffd0624839f','true','id.token.claim'),('25d2f480-c171-4a37-a2b9-9ffd0624839f','String','jsonType.label'),('25d2f480-c171-4a37-a2b9-9ffd0624839f','lastName','user.attribute'),('2f4a75b3-e702-417b-aacd-e45121e6107b','true','access.token.claim'),('2f4a75b3-e702-417b-aacd-e45121e6107b','email','claim.name'),('2f4a75b3-e702-417b-aacd-e45121e6107b','true','id.token.claim'),('2f4a75b3-e702-417b-aacd-e45121e6107b','String','jsonType.label'),('2f4a75b3-e702-417b-aacd-e45121e6107b','email','user.attribute'),('2fdd4766-9dee-4337-9102-4d47424e86f3','true','access.token.claim'),('2fdd4766-9dee-4337-9102-4d47424e86f3','true','id.token.claim'),('31c7615c-80fb-4378-af8a-3cd5f99cc34f','true','access.token.claim'),('31c7615c-80fb-4378-af8a-3cd5f99cc34f','true','id.token.claim'),('320eca18-2b81-444b-9bcc-6896e65c7498','true','access.token.claim'),('320eca18-2b81-444b-9bcc-6896e65c7498','given_name','claim.name'),('320eca18-2b81-444b-9bcc-6896e65c7498','true','id.token.claim'),('320eca18-2b81-444b-9bcc-6896e65c7498','String','jsonType.label'),('320eca18-2b81-444b-9bcc-6896e65c7498','firstName','user.attribute'),('321afd9e-a985-473d-9588-aae8821a8e95','Role','attribute.name'),('321afd9e-a985-473d-9588-aae8821a8e95','Basic','attribute.nameformat'),('321afd9e-a985-473d-9588-aae8821a8e95','false','single'),('3299a06d-b743-4e3a-883e-0791efb581b3','Role','attribute.name'),('3299a06d-b743-4e3a-883e-0791efb581b3','Basic','attribute.nameformat'),('3299a06d-b743-4e3a-883e-0791efb581b3','false','single'),('38031f83-b6fd-4b9f-814b-29457731f69e','true','access.token.claim'),('38031f83-b6fd-4b9f-814b-29457731f69e','given_name','claim.name'),('38031f83-b6fd-4b9f-814b-29457731f69e','true','id.token.claim'),('38031f83-b6fd-4b9f-814b-29457731f69e','String','jsonType.label'),('38031f83-b6fd-4b9f-814b-29457731f69e','firstName','user.attribute'),('404d05ff-47a9-4efa-8029-9aaf3e9708a4','true','access.token.claim'),('404d05ff-47a9-4efa-8029-9aaf3e9708a4','family_name','claim.name'),('404d05ff-47a9-4efa-8029-9aaf3e9708a4','true','id.token.claim'),('404d05ff-47a9-4efa-8029-9aaf3e9708a4','String','jsonType.label'),('404d05ff-47a9-4efa-8029-9aaf3e9708a4','lastName','user.attribute'),('41c1843c-5321-4e3d-9e95-d8cbe7a4b033','true','access.token.claim'),('41c1843c-5321-4e3d-9e95-d8cbe7a4b033','family_name','claim.name'),('41c1843c-5321-4e3d-9e95-d8cbe7a4b033','true','id.token.claim'),('41c1843c-5321-4e3d-9e95-d8cbe7a4b033','String','jsonType.label'),('41c1843c-5321-4e3d-9e95-d8cbe7a4b033','lastName','user.attribute'),('42cb3433-3062-497b-9f52-39415cc1a68d','true','access.token.claim'),('42cb3433-3062-497b-9f52-39415cc1a68d','preferred_username','claim.name'),('42cb3433-3062-497b-9f52-39415cc1a68d','true','id.token.claim'),('42cb3433-3062-497b-9f52-39415cc1a68d','String','jsonType.label'),('42cb3433-3062-497b-9f52-39415cc1a68d','username','user.attribute'),('4750771d-e266-4959-b930-e4750fedc564','true','access.token.claim'),('4750771d-e266-4959-b930-e4750fedc564','email','claim.name'),('4750771d-e266-4959-b930-e4750fedc564','true','id.token.claim'),('4750771d-e266-4959-b930-e4750fedc564','String','jsonType.label'),('4750771d-e266-4959-b930-e4750fedc564','email','user.attribute'),('4a59d344-632d-4c22-870d-b86b4c5b3f20','true','access.token.claim'),('4a59d344-632d-4c22-870d-b86b4c5b3f20','preferred_username','claim.name'),('4a59d344-632d-4c22-870d-b86b4c5b3f20','true','id.token.claim'),('4a59d344-632d-4c22-870d-b86b4c5b3f20','String','jsonType.label'),('4a59d344-632d-4c22-870d-b86b4c5b3f20','username','user.attribute'),('4b186483-f3f3-43e9-822a-1eb045d9de9e','true','access.token.claim'),('4b186483-f3f3-43e9-822a-1eb045d9de9e','true','id.token.claim'),('4e466ffd-197a-4779-a954-58bc9b09a40c','true','access.token.claim'),('4e466ffd-197a-4779-a954-58bc9b09a40c','family_name','claim.name'),('4e466ffd-197a-4779-a954-58bc9b09a40c','true','id.token.claim'),('4e466ffd-197a-4779-a954-58bc9b09a40c','String','jsonType.label'),('4e466ffd-197a-4779-a954-58bc9b09a40c','lastName','user.attribute'),('55b5e1e4-6768-4edd-976a-828151fa4685','true','access.token.claim'),('55b5e1e4-6768-4edd-976a-828151fa4685','true','id.token.claim'),('5b210817-8859-456c-a6da-a03afb8e6c9b','true','access.token.claim'),('5b210817-8859-456c-a6da-a03afb8e6c9b','preferred_username','claim.name'),('5b210817-8859-456c-a6da-a03afb8e6c9b','true','id.token.claim'),('5b210817-8859-456c-a6da-a03afb8e6c9b','String','jsonType.label'),('5b210817-8859-456c-a6da-a03afb8e6c9b','username','user.attribute'),('614337f8-de41-41d5-8931-7e0dd8ca70e6','true','access.token.claim'),('614337f8-de41-41d5-8931-7e0dd8ca70e6','email','claim.name'),('614337f8-de41-41d5-8931-7e0dd8ca70e6','true','id.token.claim'),('614337f8-de41-41d5-8931-7e0dd8ca70e6','String','jsonType.label'),('614337f8-de41-41d5-8931-7e0dd8ca70e6','email','user.attribute'),('61a964ee-fb47-4950-96dc-678fbf1513f4','true','access.token.claim'),('61a964ee-fb47-4950-96dc-678fbf1513f4','family_name','claim.name'),('61a964ee-fb47-4950-96dc-678fbf1513f4','true','id.token.claim'),('61a964ee-fb47-4950-96dc-678fbf1513f4','String','jsonType.label'),('61a964ee-fb47-4950-96dc-678fbf1513f4','lastName','user.attribute'),('65a3c280-c427-46a3-bd95-7224485e5ff3','true','access.token.claim'),('65a3c280-c427-46a3-bd95-7224485e5ff3','family_name','claim.name'),('65a3c280-c427-46a3-bd95-7224485e5ff3','true','id.token.claim'),('65a3c280-c427-46a3-bd95-7224485e5ff3','String','jsonType.label'),('65a3c280-c427-46a3-bd95-7224485e5ff3','lastName','user.attribute'),('663fca42-7a29-4cd2-91fb-e3e1371fe095','true','access.token.claim'),('663fca42-7a29-4cd2-91fb-e3e1371fe095','family_name','claim.name'),('663fca42-7a29-4cd2-91fb-e3e1371fe095','true','id.token.claim'),('663fca42-7a29-4cd2-91fb-e3e1371fe095','String','jsonType.label'),('663fca42-7a29-4cd2-91fb-e3e1371fe095','lastName','user.attribute'),('66994ab9-37d7-49ec-8d51-275094dd87bb','true','access.token.claim'),('66994ab9-37d7-49ec-8d51-275094dd87bb','true','id.token.claim'),('69aae57d-9aa9-493b-b429-f20cdc7d4010','true','access.token.claim'),('69aae57d-9aa9-493b-b429-f20cdc7d4010','given_name','claim.name'),('69aae57d-9aa9-493b-b429-f20cdc7d4010','true','id.token.claim'),('69aae57d-9aa9-493b-b429-f20cdc7d4010','String','jsonType.label'),('69aae57d-9aa9-493b-b429-f20cdc7d4010','firstName','user.attribute'),('6b0ba602-e53f-4526-a9f9-2083ddb2411a','true','access.token.claim'),('6b0ba602-e53f-4526-a9f9-2083ddb2411a','preferred_username','claim.name'),('6b0ba602-e53f-4526-a9f9-2083ddb2411a','true','id.token.claim'),('6b0ba602-e53f-4526-a9f9-2083ddb2411a','String','jsonType.label'),('6b0ba602-e53f-4526-a9f9-2083ddb2411a','username','user.attribute'),('740b2b19-7c82-4ba5-aad9-246ee803b3c7','true','access.token.claim'),('740b2b19-7c82-4ba5-aad9-246ee803b3c7','email','claim.name'),('740b2b19-7c82-4ba5-aad9-246ee803b3c7','true','id.token.claim'),('740b2b19-7c82-4ba5-aad9-246ee803b3c7','String','jsonType.label'),('740b2b19-7c82-4ba5-aad9-246ee803b3c7','email','user.attribute'),('75e4f0eb-d625-4345-ba04-e1c3208b9774','true','access.token.claim'),('75e4f0eb-d625-4345-ba04-e1c3208b9774','family_name','claim.name'),('75e4f0eb-d625-4345-ba04-e1c3208b9774','true','id.token.claim'),('75e4f0eb-d625-4345-ba04-e1c3208b9774','String','jsonType.label'),('75e4f0eb-d625-4345-ba04-e1c3208b9774','lastName','user.attribute'),('781e4dfb-c763-4f70-8771-3bc75fecf880','Role','attribute.name'),('781e4dfb-c763-4f70-8771-3bc75fecf880','Basic','attribute.nameformat'),('781e4dfb-c763-4f70-8771-3bc75fecf880','false','single'),('7a5c7bc1-6a75-4326-b51d-76af3ba061bd','true','access.token.claim'),('7a5c7bc1-6a75-4326-b51d-76af3ba061bd','preferred_username','claim.name'),('7a5c7bc1-6a75-4326-b51d-76af3ba061bd','true','id.token.claim'),('7a5c7bc1-6a75-4326-b51d-76af3ba061bd','String','jsonType.label'),('7a5c7bc1-6a75-4326-b51d-76af3ba061bd','username','user.attribute'),('802aaf75-5dc2-4702-a877-65deacd3c105','true','access.token.claim'),('802aaf75-5dc2-4702-a877-65deacd3c105','preferred_username','claim.name'),('802aaf75-5dc2-4702-a877-65deacd3c105','true','id.token.claim'),('802aaf75-5dc2-4702-a877-65deacd3c105','String','jsonType.label'),('802aaf75-5dc2-4702-a877-65deacd3c105','username','user.attribute'),('82e445f3-93c9-4c5b-86cf-85661ed4369c','Role','attribute.name'),('82e445f3-93c9-4c5b-86cf-85661ed4369c','Basic','attribute.nameformat'),('82e445f3-93c9-4c5b-86cf-85661ed4369c','false','single'),('8551e0f2-e5b8-4fdf-b673-f8cc5633d9b5','true','access.token.claim'),('8551e0f2-e5b8-4fdf-b673-f8cc5633d9b5','family_name','claim.name'),('8551e0f2-e5b8-4fdf-b673-f8cc5633d9b5','true','id.token.claim'),('8551e0f2-e5b8-4fdf-b673-f8cc5633d9b5','String','jsonType.label'),('8551e0f2-e5b8-4fdf-b673-f8cc5633d9b5','lastName','user.attribute'),('861a4c49-16bb-4543-816a-4385aa50ab9f','true','access.token.claim'),('861a4c49-16bb-4543-816a-4385aa50ab9f','given_name','claim.name'),('861a4c49-16bb-4543-816a-4385aa50ab9f','true','id.token.claim'),('861a4c49-16bb-4543-816a-4385aa50ab9f','String','jsonType.label'),('861a4c49-16bb-4543-816a-4385aa50ab9f','firstName','user.attribute'),('87a088de-3728-4e81-93c4-db5963bb2e7b','Role','attribute.name'),('87a088de-3728-4e81-93c4-db5963bb2e7b','Basic','attribute.nameformat'),('87a088de-3728-4e81-93c4-db5963bb2e7b','false','single'),('93d43852-9392-43a1-9de9-38637819737e','true','access.token.claim'),('93d43852-9392-43a1-9de9-38637819737e','given_name','claim.name'),('93d43852-9392-43a1-9de9-38637819737e','true','id.token.claim'),('93d43852-9392-43a1-9de9-38637819737e','String','jsonType.label'),('93d43852-9392-43a1-9de9-38637819737e','firstName','user.attribute'),('969e4ee0-2e2c-4797-830f-1e2e9535caf1','true','access.token.claim'),('969e4ee0-2e2c-4797-830f-1e2e9535caf1','preferred_username','claim.name'),('969e4ee0-2e2c-4797-830f-1e2e9535caf1','true','id.token.claim'),('969e4ee0-2e2c-4797-830f-1e2e9535caf1','String','jsonType.label'),('969e4ee0-2e2c-4797-830f-1e2e9535caf1','username','user.attribute'),('9b4eebd1-875d-41e6-9a2b-197c7b6fb276','true','access.token.claim'),('9b4eebd1-875d-41e6-9a2b-197c7b6fb276','email','claim.name'),('9b4eebd1-875d-41e6-9a2b-197c7b6fb276','true','id.token.claim'),('9b4eebd1-875d-41e6-9a2b-197c7b6fb276','String','jsonType.label'),('9b4eebd1-875d-41e6-9a2b-197c7b6fb276','email','user.attribute'),('9f875669-a508-4e44-9394-298a26a84013','Role','attribute.name'),('9f875669-a508-4e44-9394-298a26a84013','Basic','attribute.nameformat'),('9f875669-a508-4e44-9394-298a26a84013','false','single'),('a1a12ebe-2c94-4d01-953d-7f55e5003519','true','access.token.claim'),('a1a12ebe-2c94-4d01-953d-7f55e5003519','given_name','claim.name'),('a1a12ebe-2c94-4d01-953d-7f55e5003519','true','id.token.claim'),('a1a12ebe-2c94-4d01-953d-7f55e5003519','String','jsonType.label'),('a1a12ebe-2c94-4d01-953d-7f55e5003519','firstName','user.attribute'),('a50d0bc9-63ae-4409-8572-eb224b7222ba','true','access.token.claim'),('a50d0bc9-63ae-4409-8572-eb224b7222ba','email','claim.name'),('a50d0bc9-63ae-4409-8572-eb224b7222ba','true','id.token.claim'),('a50d0bc9-63ae-4409-8572-eb224b7222ba','String','jsonType.label'),('a50d0bc9-63ae-4409-8572-eb224b7222ba','email','user.attribute'),('a55235eb-d8b2-4529-aa62-6667667e1c56','true','access.token.claim'),('a55235eb-d8b2-4529-aa62-6667667e1c56','email','claim.name'),('a55235eb-d8b2-4529-aa62-6667667e1c56','true','id.token.claim'),('a55235eb-d8b2-4529-aa62-6667667e1c56','String','jsonType.label'),('a55235eb-d8b2-4529-aa62-6667667e1c56','email','user.attribute'),('a6536a33-9f16-40d2-b0dc-65604824bbe9','Role','attribute.name'),('a6536a33-9f16-40d2-b0dc-65604824bbe9','Basic','attribute.nameformat'),('a6536a33-9f16-40d2-b0dc-65604824bbe9','false','single'),('a6fdb2e0-19c1-438f-89fd-cc1d60447e0a','true','access.token.claim'),('a6fdb2e0-19c1-438f-89fd-cc1d60447e0a','preferred_username','claim.name'),('a6fdb2e0-19c1-438f-89fd-cc1d60447e0a','true','id.token.claim'),('a6fdb2e0-19c1-438f-89fd-cc1d60447e0a','String','jsonType.label'),('a6fdb2e0-19c1-438f-89fd-cc1d60447e0a','username','user.attribute'),('aaa637fb-9006-47c2-9d3f-0970de5ded2d','true','access.token.claim'),('aaa637fb-9006-47c2-9d3f-0970de5ded2d','preferred_username','claim.name'),('aaa637fb-9006-47c2-9d3f-0970de5ded2d','true','id.token.claim'),('aaa637fb-9006-47c2-9d3f-0970de5ded2d','String','jsonType.label'),('aaa637fb-9006-47c2-9d3f-0970de5ded2d','username','user.attribute'),('aacd9850-cf32-4d27-bb4e-742265832986','true','access.token.claim'),('aacd9850-cf32-4d27-bb4e-742265832986','true','id.token.claim'),('acd1125b-3a3b-4cef-8247-470cb170c412','Role','attribute.name'),('acd1125b-3a3b-4cef-8247-470cb170c412','Basic','attribute.nameformat'),('acd1125b-3a3b-4cef-8247-470cb170c412','false','single'),('b1be284a-c5ff-479e-8249-e6133c150654','true','access.token.claim'),('b1be284a-c5ff-479e-8249-e6133c150654','given_name','claim.name'),('b1be284a-c5ff-479e-8249-e6133c150654','true','id.token.claim'),('b1be284a-c5ff-479e-8249-e6133c150654','String','jsonType.label'),('b1be284a-c5ff-479e-8249-e6133c150654','firstName','user.attribute'),('bc752884-2ef6-4f7a-b69a-72f10adfdff4','true','access.token.claim'),('bc752884-2ef6-4f7a-b69a-72f10adfdff4','true','id.token.claim'),('c16edc10-f7e6-4c80-82ab-1a04f644d428','true','access.token.claim'),('c16edc10-f7e6-4c80-82ab-1a04f644d428','true','id.token.claim'),('cb9ab011-2de5-42be-8b3c-caa41b5321cf','true','access.token.claim'),('cb9ab011-2de5-42be-8b3c-caa41b5321cf','true','id.token.claim'),('d1696cd5-02d9-48d9-96ab-c02cab30842e','true','access.token.claim'),('d1696cd5-02d9-48d9-96ab-c02cab30842e','true','id.token.claim'),('d357d290-0e29-4020-b204-81c70572066f','true','access.token.claim'),('d357d290-0e29-4020-b204-81c70572066f','preferred_username','claim.name'),('d357d290-0e29-4020-b204-81c70572066f','true','id.token.claim'),('d357d290-0e29-4020-b204-81c70572066f','String','jsonType.label'),('d357d290-0e29-4020-b204-81c70572066f','username','user.attribute'),('d43c1f74-0604-42f7-a6fc-ab1c6d1fceaa','true','access.token.claim'),('d43c1f74-0604-42f7-a6fc-ab1c6d1fceaa','email','claim.name'),('d43c1f74-0604-42f7-a6fc-ab1c6d1fceaa','true','id.token.claim'),('d43c1f74-0604-42f7-a6fc-ab1c6d1fceaa','String','jsonType.label'),('d43c1f74-0604-42f7-a6fc-ab1c6d1fceaa','email','user.attribute'),('d7beade9-0be3-43f9-8222-95980f5f8e6d','true','access.token.claim'),('d7beade9-0be3-43f9-8222-95980f5f8e6d','preferred_username','claim.name'),('d7beade9-0be3-43f9-8222-95980f5f8e6d','true','id.token.claim'),('d7beade9-0be3-43f9-8222-95980f5f8e6d','String','jsonType.label'),('d7beade9-0be3-43f9-8222-95980f5f8e6d','username','user.attribute'),('d8f20b19-90d6-436f-b650-ee55ee1fedb2','true','access.token.claim'),('d8f20b19-90d6-436f-b650-ee55ee1fedb2','given_name','claim.name'),('d8f20b19-90d6-436f-b650-ee55ee1fedb2','true','id.token.claim'),('d8f20b19-90d6-436f-b650-ee55ee1fedb2','String','jsonType.label'),('d8f20b19-90d6-436f-b650-ee55ee1fedb2','firstName','user.attribute'),('d8f5463a-86d5-4f44-b94b-6251573e8bae','true','access.token.claim'),('d8f5463a-86d5-4f44-b94b-6251573e8bae','family_name','claim.name'),('d8f5463a-86d5-4f44-b94b-6251573e8bae','true','id.token.claim'),('d8f5463a-86d5-4f44-b94b-6251573e8bae','String','jsonType.label'),('d8f5463a-86d5-4f44-b94b-6251573e8bae','lastName','user.attribute'),('dc46decf-0ed9-458b-8b8f-1fae752b8935','true','access.token.claim'),('dc46decf-0ed9-458b-8b8f-1fae752b8935','given_name','claim.name'),('dc46decf-0ed9-458b-8b8f-1fae752b8935','true','id.token.claim'),('dc46decf-0ed9-458b-8b8f-1fae752b8935','String','jsonType.label'),('dc46decf-0ed9-458b-8b8f-1fae752b8935','firstName','user.attribute'),('dda24bb3-a2ee-4c2f-ad0f-0816675b42cd','true','access.token.claim'),('dda24bb3-a2ee-4c2f-ad0f-0816675b42cd','email','claim.name'),('dda24bb3-a2ee-4c2f-ad0f-0816675b42cd','true','id.token.claim'),('dda24bb3-a2ee-4c2f-ad0f-0816675b42cd','String','jsonType.label'),('dda24bb3-a2ee-4c2f-ad0f-0816675b42cd','email','user.attribute'),('df8c5a01-1572-4e92-8af0-d9c5271f3f0e','true','access.token.claim'),('df8c5a01-1572-4e92-8af0-d9c5271f3f0e','locale','claim.name'),('df8c5a01-1572-4e92-8af0-d9c5271f3f0e','true','id.token.claim'),('df8c5a01-1572-4e92-8af0-d9c5271f3f0e','String','jsonType.label'),('df8c5a01-1572-4e92-8af0-d9c5271f3f0e','locale','user.attribute'),('e5347a47-0824-4f8d-b49c-349c16f143ef','Role','attribute.name'),('e5347a47-0824-4f8d-b49c-349c16f143ef','Basic','attribute.nameformat'),('e5347a47-0824-4f8d-b49c-349c16f143ef','false','single'),('e6af673f-2d66-46aa-a2c0-daa81ef02d60','true','access.token.claim'),('e6af673f-2d66-46aa-a2c0-daa81ef02d60','preferred_username','claim.name'),('e6af673f-2d66-46aa-a2c0-daa81ef02d60','true','id.token.claim'),('e6af673f-2d66-46aa-a2c0-daa81ef02d60','String','jsonType.label'),('e6af673f-2d66-46aa-a2c0-daa81ef02d60','username','user.attribute'),('e7a92699-1bd9-4fd0-b91a-81a6b168fe99','true','access.token.claim'),('e7a92699-1bd9-4fd0-b91a-81a6b168fe99','given_name','claim.name'),('e7a92699-1bd9-4fd0-b91a-81a6b168fe99','true','id.token.claim'),('e7a92699-1bd9-4fd0-b91a-81a6b168fe99','String','jsonType.label'),('e7a92699-1bd9-4fd0-b91a-81a6b168fe99','firstName','user.attribute'),('e94ecc93-7737-4c0e-a157-ca246426acfe','true','access.token.claim'),('e94ecc93-7737-4c0e-a157-ca246426acfe','true','id.token.claim'),('ea3a6935-cc81-41ba-9c89-7d2d237af8e1','true','access.token.claim'),('ea3a6935-cc81-41ba-9c89-7d2d237af8e1','true','id.token.claim'),('ed72f354-8fdd-43fc-af02-85b7f1b526b1','true','access.token.claim'),('ed72f354-8fdd-43fc-af02-85b7f1b526b1','given_name','claim.name'),('ed72f354-8fdd-43fc-af02-85b7f1b526b1','true','id.token.claim'),('ed72f354-8fdd-43fc-af02-85b7f1b526b1','String','jsonType.label'),('ed72f354-8fdd-43fc-af02-85b7f1b526b1','firstName','user.attribute'),('f789fee5-5a78-4094-88d9-9b46ea151a10','Role','attribute.name'),('f789fee5-5a78-4094-88d9-9b46ea151a10','Basic','attribute.nameformat'),('f789fee5-5a78-4094-88d9-9b46ea151a10','false','single'),('fcef320f-6528-49c2-8033-4bfb21e086b2','true','access.token.claim'),('fcef320f-6528-49c2-8033-4bfb21e086b2','email','claim.name'),('fcef320f-6528-49c2-8033-4bfb21e086b2','true','id.token.claim'),('fcef320f-6528-49c2-8033-4bfb21e086b2','String','jsonType.label'),('fcef320f-6528-49c2-8033-4bfb21e086b2','email','user.attribute');
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
INSERT INTO `REALM` VALUES ('itesoft',60,300,300,NULL,NULL,NULL,0x01,0x00,0,NULL,'itesoft',0,NULL,'MIIEpAIBAAKCAQEAtcNIDZUaEhOGbPOwNC28h2qgRYqfWNZkuZg/BGpFxN2TXCcdLVYUXcAgGUuEAADZYP4WtgoEissQThmUCVV4zBOIX0WZPv5IWSWqu7MEMwQLNv8BmNMYx/bZevRh4woZ0/HApqbHVHTHOowpprytxh0OYo8L1iIXOSMxrVBbQ6d1HMstu+E2yQCG4l2Wh3dgr32MmOWYHfD2ne9Ss92eErsFolVUTmencfiTCoK79T8VN7z15L2SNhmIJ1YktvaFH6tPrWJhWwBQ0dd6Yv5EnMUf8f9eEDM0QAkGiz+VUX8XpAsT3tBtMGjVj7iNbY3FWsvE07R531udkypRSLUnyQIDAQABAoIBAHkr6Fr1rV2jmpgDlNIUM3zrPlFd6oDk3F1F+6zL1Bs7w8NJaBATNJyTOlLinusJpeEdQrK01vZYDVSjhKb8Tf1ugBlTYqg2CLE1hS6AVypTZc6SDdR91iVokO+A/8jFsRY0MkRnJrdM6oxDaHj5i7dpI2/dAP0N2QGETtfFnDHqz23G8Xn60lHTBrQE5O1gDqwIXY26Yg9ZLtL/Up4tMNHWqJw3F9SSslufqskN2YzNos4lSrp+dLCAevN5hLbNXIvr77I9wugffNU6kbjI5w6p80Ct9eJEjTs7HMq7powMDW63n3+P+L4rp3fgTlvH5ldAOGEHhHNuLHqrDX8l6kkCgYEA2ftGHm869eO5EL3rnip5bUi15O6fR68OuiijxUf/LA+merbXsqG3rSzCMDn5JHWLNuU+Aj9C1X2kDIZ3q3Tj2/rpsdrJUqU2oZIDzLZlZC9sg3hZRn2vM7jccb2URpyyjj2ksOsHUkCeWYB63paV62cKHoAtFUm3YMeQ435mmJcCgYEA1Xbd1cQKRdZUYmbM1UxzaMoafJv3WnFTYaQrg9+VLztGi3EumUwnz1eQa419YIuCIrcXMu4MPoOHhYT5qRTHXtOKky5KOq4iECkhfI1f0XDwHTE0/UkSD9WPXyew/s7wvVJyua1YoAoY/ehz3rMGUtOArqCv2YWtPPdWTUfg7p8CgYEA1lU0BQjpuI1JkySrYMHy03oDIC9hfmKq4HDFV14LkY9x6oeOX56TtDumVTUrvKW3VSrjZeI+HR2FCKvPT0+IHO0CjFbMTe8VYJjqE4fk+jWHRV44qg87DmhemZgHC8dX6nTCUxNGB6JyER87sVHv559RW9w8eAobvZV86bOHvdECgYAaZjXvHuyKUIRlGwOQCYFoXz5BVOSVWdiPBcef6oG/spv52MiDiuiNeu3Qb1InI3m3o18KHGiFPqz+9UAPChPSBWVo6FujwC9UQlHy3mUQOOBpK9G61VOXg7jUcssv6BXbxBuOHQMN39HRbPMPgqJwkdmjPxogU6jmFkylCBOoTwKBgQCAsW99hmI9X6+XgyLDrzMA/zfcz/9voSoOcyC+Oaq8kh3xN06MdVLNVt4F0+6qr8iJxHI09MmIS9kTcqszYW0o//v17UzyuwSE7oC5OuDAyhH68uPIZaUoNdMlXlnAMbuNigzicZKnuPos1iRZ8Erkp4Mbu1P/HYop82cCC42EVA==','MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAtcNIDZUaEhOGbPOwNC28h2qgRYqfWNZkuZg/BGpFxN2TXCcdLVYUXcAgGUuEAADZYP4WtgoEissQThmUCVV4zBOIX0WZPv5IWSWqu7MEMwQLNv8BmNMYx/bZevRh4woZ0/HApqbHVHTHOowpprytxh0OYo8L1iIXOSMxrVBbQ6d1HMstu+E2yQCG4l2Wh3dgr32MmOWYHfD2ne9Ss92eErsFolVUTmencfiTCoK79T8VN7z15L2SNhmIJ1YktvaFH6tPrWJhWwBQ0dd6Yv5EnMUf8f9eEDM0QAkGiz+VUX8XpAsT3tBtMGjVj7iNbY3FWsvE07R531udkypRSLUnyQIDAQAB',0x00,0x00,0x00,0x00,'EXTERNAL',1800,36000,0x00,0x00,'babc14c6-07a2-454d-a5fe-484ba629cb46','MIICnTCCAYUCBgFRgq4pHDANBgkqhkiG9w0BAQsFADASMRAwDgYDVQQDDAdpdGVzb2Z0MB4XDTE1MTIwODE3Mzg1MFoXDTI1MTIwODE3NDAzMFowEjEQMA4GA1UEAwwHaXRlc29mdDCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBALXDSA2VGhIThmzzsDQtvIdqoEWKn1jWZLmYPwRqRcTdk1wnHS1WFF3AIBlLhAAA2WD+FrYKBIrLEE4ZlAlVeMwTiF9FmT7+SFklqruzBDMECzb/AZjTGMf22Xr0YeMKGdPxwKamx1R0xzqMKaa8rcYdDmKPC9YiFzkjMa1QW0OndRzLLbvhNskAhuJdlod3YK99jJjlmB3w9p3vUrPdnhK7BaJVVE5np3H4kwqCu/U/FTe89eS9kjYZiCdWJLb2hR+rT61iYVsAUNHXemL+RJzFH/H/XhAzNEAJBos/lVF/F6QLE97QbTBo1Y+4jW2NxVrLxNO0ed9bnZMqUUi1J8kCAwEAATANBgkqhkiG9w0BAQsFAAOCAQEAV3KBUVfc6xaonHMUVegFx9rGwSTOqOn0YU2B5WEyPG27bU1IVtCTP7zOUfktOC7t1M4FsuMrxT/QMhRItC9CLa7uhv9MucrTlVMPLX7BuSDswRxpZhUqfq7pAKBmP3f3aTyIuBKuqoKhH4r+ZmOuYJFJoPbZRkGYFVo3Jbogw+jZzghrazVYYRfX54mXh4+X/qqymWnqcarGVzUaaJWPQ9ouLRYtNJxcMVRhfdt+zfaiFnSFf68hykorjX4JzvpMMuC3efWpvPJpxSeFgmLe4NV8ynhq9j6JNTFjhw7zIZRZKrj0/UQHUFPtOsqr3DAgJiWEG4iSB3IWsEYZJVJJgA==','ca14bcf2-21f0-4389-ad55-c1f503daa5ad',1800,0x00,NULL,0x00,0x00,0x00,0x00,0,1,30,6,'HmacSHA1','totp','0c848c98-7122-48a5-8476-c5050be4184c','ab010efb-ff97-4c54-b2cf-8cbdf829d095','df5b0b89-ef35-4add-a582-e4396367c727','2f33ba7d-c975-44c9-a906-e66cfe82cba8','fa40e705-3b90-4ba0-a3ca-52c55db40b1d',2592000,0x00,900),('master',60,300,60,NULL,NULL,NULL,0x01,0x00,0,NULL,'master',0,NULL,'MIIEpAIBAAKCAQEAqzaF78xOE22+yicDAjM3M4/10qu5uP2vif84xNi/Wdr/8njNDb0Z7pSeKlWuvMgddSx0EsbKJVpdSYx8jiWWD1cw5zoVPjGBsRFQul/yLXVx99X/Slb7mUa5tT2eNdnUAQnsZzYmJm2/eRucDygP0l4M/3wmqg4lZRsoM2RAX8xzCBrLxuuhJLTGY7NbFLFqJssOnna5mgjpS++f/eZ1jFole2KHA7g414WKCYZ5qwS/In/ukEr6sHDIGh8L49utsJmKEWqwuOjd7hEXiE6R/23kn7fGuHxXiGTAkBiq9chkhPAUO1suRJeMVDXhMtxLlTJ6mQjh36CiwdzNniMzwwIDAQABAoIBAQCiouJLzbkEv6UShkhXWKtBMakDe9iqH2EWJviYFISAKIYkoBe4yz7M4SP1dvrLnRROb/G6vFbdcJ9Y9DiFFrMa02pC22u+bmyR9K7Iu8di40Nld0RQK5xIF2TlAyk8YjT+35xO1qMasfnGYzG1PAr7fBfAwQBBXbqr9kYTu1FjLVZBHrbEWcSUioO8l+FWK9ougDUou+ma6ynGug1gfR3aAB7jZmA8fi5AauMwYPN6DRQOnbcL8nLzX2ayue+6R2/N5fpi9tnpKBIc6ppYHq0WkktxcEKDxX/4MoNOuaxUtTcy2atCpJrIeM8n3WEES4LrBTG/c1P8SbVLXT3bRGFhAoGBAN6dJ3Z1FtHCxZlxEzNE0xRywbgYWJ1CDLhn/vmuZnJPaDsffg1aamp6gA1w0+HSS/EoBXj6a7fl+UIV8kk4sgUz55jFKk8w2wawmOZoaxvE5g/E/i6Tq26iUCs1vI9jq/3hLKMW95nhSu1WFUrBuNfInWHb9OoeTk4bmu1LlGXJAoGBAMTj7VJc26QFvA0/GO5B87uvG8Urs+Q96SP2TkaE4eXQnRoi5HO6XicxPQklUT3qy/mkk2OGrwvDKYX1TXVqjBqBGJTgcPvBPPpHtLW5Hu1i7ErGylKn7c2UIXsz3Z7pkh3i+wnLHS5vJOHnRQKA2EjqQ4H5mMLEYeBeboNcPsMrAoGAcXSU3TmVtLhYrvhDOdj03zIRavr1hshX5VATUjtBOTchPyiwvKt9GuFuC+uaATiFvdWQ3HR8m9AYdkbrIchEaoRmn6S1CIE0z7cHZj6HgDKcsiLLDP/z2kHdK/iKLmY1DQJLFp+o94MsBcPevCf5RfiXxX0t2HgznnlRP2lKq4kCgYEAjfaiKZ7Wp7+SxiJWwYRAT3WFGnfWb53MOqff7KznjKMMg8ng2yjntm6kSbHkkDZ5+HiX5U05bcu8ZuBmh2DZwEqRBNeH356HbxbAz7649AU9xvTq8QowRuil84WEKI7VUkNVKsyPL+nnuBLfCV0JlhmDr3XelaCvye2M1Z5vip0CgYBV/xCjPW2LTmUy6KOE+L8zJQavmIGSgXE+tRZQwQtoMQVT233Yr8dkv/fuxGbVyL8IOYJIyF5DrpmN4wVmcqnAaA3y/aVCSxT0HFo9itfnSpjyGaC/H7ysY8PSBkTyk9pwzDYMjXAXeZZGzWVF/9+0rpaqmkWIgIBTAJa2v2STsQ==','MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAqzaF78xOE22+yicDAjM3M4/10qu5uP2vif84xNi/Wdr/8njNDb0Z7pSeKlWuvMgddSx0EsbKJVpdSYx8jiWWD1cw5zoVPjGBsRFQul/yLXVx99X/Slb7mUa5tT2eNdnUAQnsZzYmJm2/eRucDygP0l4M/3wmqg4lZRsoM2RAX8xzCBrLxuuhJLTGY7NbFLFqJssOnna5mgjpS++f/eZ1jFole2KHA7g414WKCYZ5qwS/In/ukEr6sHDIGh8L49utsJmKEWqwuOjd7hEXiE6R/23kn7fGuHxXiGTAkBiq9chkhPAUO1suRJeMVDXhMtxLlTJ6mQjh36CiwdzNniMzwwIDAQAB',0x00,0x00,0x00,0x00,'EXTERNAL',1800,36000,0x00,0x00,'1679f52c-b0f9-446f-833f-cf29b92941b6','MIICmzCCAYMCBgFRgq2XQDANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZtYXN0ZXIwHhcNMTUxMjA4MTczODEzWhcNMjUxMjA4MTczOTUzWjARMQ8wDQYDVQQDDAZtYXN0ZXIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCrNoXvzE4Tbb7KJwMCMzczj/XSq7m4/a+J/zjE2L9Z2v/yeM0NvRnulJ4qVa68yB11LHQSxsolWl1JjHyOJZYPVzDnOhU+MYGxEVC6X/ItdXH31f9KVvuZRrm1PZ412dQBCexnNiYmbb95G5wPKA/SXgz/fCaqDiVlGygzZEBfzHMIGsvG66EktMZjs1sUsWomyw6edrmaCOlL75/95nWMWiV7YocDuDjXhYoJhnmrBL8if+6QSvqwcMgaHwvj262wmYoRarC46N3uEReITpH/beSft8a4fFeIZMCQGKr1yGSE8BQ7Wy5El4xUNeEy3EuVMnqZCOHfoKLB3M2eIzPDAgMBAAEwDQYJKoZIhvcNAQELBQADggEBAHsacOxSTntzCYZ/yNc57+saXnZs7s9aWsEk2UvDu+KTX6JNV+Fw8a2wjVVNZiTQqtIsNT6nH0xZe78U07XEsoLbRinAB8IjLL5krb5l12dFU7krnUG41qE/282VPITSnQLaVfGBgz2RdX1vmfun5j6ISw60mubR0zbVViWZII+oteJVfOfIQBFvkCYQhzGFusAgSvK0knEZEXAJP5c2zhzXbC2t/Do4wnCRxIlDQFpwwqhd37RSbH0YvYQGn8nOwruVtrJZSU5llAMR65r1nkCmADoSWj4bt36V6JweXG8xgCBb+87arkqWqHLEHczbgABhdvvBWrob2xi7CXikrkk=','728c9a03-a8d4-4483-b65c-0f8ee29774ca',1800,0x00,NULL,0x00,0x00,0x00,0x00,0,1,30,6,'HmacSHA1','totp','aafe268d-8459-44a5-9cbf-698f784f3a18','72bff78c-419f-4d46-8849-f6890d28e308','c14e3ef5-10f3-4349-9ae5-f55e063f03af','601ade5c-a825-4d25-af51-ee8d6512f99b','b2fbfb56-93a6-4cc9-baea-892543f9b5be',2592000,0x00,900);
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
INSERT INTO `REALM_CLIENT` VALUES ('master','1679f52c-b0f9-446f-833f-cf29b92941b6'),('master','24f36aa3-368e-4798-bb63-4c8e4a28e015'),('master','3f7eac20-6200-481c-ba58-2665fb0239a7'),('master','5c5d42d9-6959-4ccf-ba6a-668163a90002'),('master','bdb90d22-b6db-4bcf-9afd-8c2d4461c4f5'),('master','babc14c6-07a2-454d-a5fe-484ba629cb46'),('itesoft','f4395757-55a2-4804-b6ac-e3a356588cc0'),('itesoft','d202ef5d-64e0-442f-8026-12763a234ae7'),('itesoft','ac210415-1a5f-463c-ad82-2c941ce4acf0'),('itesoft','d4650907-4ad5-4cfc-8e0a-42936ab4c128'),('itesoft','5888916a-43cd-449d-87ad-34a9b5d79270'),('itesoft','aa496eb9-dd57-4407-a562-bd67f95f3f85');
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
INSERT INTO `REALM_DEFAULT_ROLES` VALUES ('itesoft','0d47bd53-9cc6-4d20-94c6-46eacebb4550'),('master','198b8b13-7645-403f-a6fc-dac0c9bbf5ba');
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
INSERT INTO `REALM_REQUIRED_CREDENTIAL` VALUES ('password','password',0x01,0x01,'itesoft'),('password','password',0x01,0x01,'master');
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
INSERT INTO `REDIRECT_URIS` VALUES ('24f36aa3-368e-4798-bb63-4c8e4a28e015','/auth/realms/master/account/*'),('5c5d42d9-6959-4ccf-ba6a-668163a90002','/auth/admin/master/console/*'),('d202ef5d-64e0-442f-8026-12763a234ae7','/auth/realms/itesoft/account/*'),('d4650907-4ad5-4cfc-8e0a-42936ab4c128','/auth/admin/itesoft/console/*'),('aa496eb9-dd57-4407-a562-bd67f95f3f85','http://localhost/*');
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
INSERT INTO `REQUIRED_ACTION_PROVIDER` VALUES ('0a70dba4-7fc5-4ec4-b57b-73d7b2764796','CONFIGURE_TOTP','Configure Totp','master',0x01,0x00,'CONFIGURE_TOTP'),('3a5872a1-136d-4c9a-ab80-edac24a4e32c','VERIFY_EMAIL','Verify Email','itesoft',0x01,0x00,'VERIFY_EMAIL'),('6955fcdf-846f-4c4a-8e89-12de9d3296bf','VERIFY_EMAIL','Verify Email','master',0x01,0x00,'VERIFY_EMAIL'),('69c59d74-dab1-4823-bdee-7470829e1e20','UPDATE_PASSWORD','Update Password','master',0x01,0x00,'UPDATE_PASSWORD'),('6e58a6ee-9906-4dfe-a280-954beb97bfad','UPDATE_PASSWORD','Update Password','itesoft',0x01,0x00,'UPDATE_PASSWORD'),('93bccbf0-3476-44ef-8793-02da3243e119','CONFIGURE_TOTP','Configure Totp','itesoft',0x01,0x00,'CONFIGURE_TOTP'),('9f384752-8b41-4c1b-99c1-663ed6653bc3','terms_and_conditions','Terms and Conditions','itesoft',0x00,0x00,'terms_and_conditions'),('b3c38ba7-9737-4f5e-8e3b-600d6d88eeb3','UPDATE_PROFILE','Update Profile','master',0x01,0x00,'UPDATE_PROFILE'),('bdf51788-d289-46a5-b067-68ab28e76794','UPDATE_PROFILE','Update Profile','itesoft',0x01,0x00,'UPDATE_PROFILE'),('ca7a1503-e343-45f6-8c75-1069ececb50d','terms_and_conditions','Terms and Conditions','master',0x00,0x00,'terms_and_conditions');
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
INSERT INTO `SCOPE_MAPPING` VALUES ('3f7eac20-6200-481c-ba58-2665fb0239a7','c01b2515-3626-4960-91d7-96c87b433727'),('5c5d42d9-6959-4ccf-ba6a-668163a90002','c01b2515-3626-4960-91d7-96c87b433727'),('5888916a-43cd-449d-87ad-34a9b5d79270','da3d24c0-f20b-446b-951d-ef8945ed0e9c'),('d4650907-4ad5-4cfc-8e0a-42936ab4c128','da3d24c0-f20b-446b-951d-ef8945ed0e9c');
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
INSERT INTO `USER_ENTITY` VALUES ('02a2b2db-85b8-4d86-9c7a-2c97999d440d',NULL,'d0ce5270-43d4-4dbe-9f48-cc5e71fb4a6b',0x00,0x01,NULL,NULL,NULL,'master',0x00,'admin',1449596394150,NULL),('43db004a-e814-438e-bf12-a6b415545bbe','john.doe@itesoft.com','john.doe@itesoft.com',0x01,0x01,NULL,'john','doe','itesoft',0x00,'john',1449598387181,NULL);
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
INSERT INTO `USER_ROLE_MAPPING` VALUES ('198b8b13-7645-403f-a6fc-dac0c9bbf5ba','02a2b2db-85b8-4d86-9c7a-2c97999d440d'),('7f08b9ff-efed-4751-a018-1db622ac85f1','02a2b2db-85b8-4d86-9c7a-2c97999d440d'),('b2f5e2c6-8bae-45f8-b419-f9aa9396ee41','02a2b2db-85b8-4d86-9c7a-2c97999d440d'),('c01b2515-3626-4960-91d7-96c87b433727','02a2b2db-85b8-4d86-9c7a-2c97999d440d'),('0d47bd53-9cc6-4d20-94c6-46eacebb4550','43db004a-e814-438e-bf12-a6b415545bbe'),('1ec3fe02-8711-4b5f-b71b-2af1840b7f89','43db004a-e814-438e-bf12-a6b415545bbe'),('a65c53d7-f052-4e40-bcb3-7d86030a1b4c','43db004a-e814-438e-bf12-a6b415545bbe'),('d9928f39-28a3-43a0-b46a-a785f93a8d1c','43db004a-e814-438e-bf12-a6b415545bbe'),('f9764274-ef5d-4f90-a959-ab8b4e0a15f7','43db004a-e814-438e-bf12-a6b415545bbe');
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
INSERT INTO `WEB_ORIGINS` VALUES ('aa496eb9-dd57-4407-a562-bd67f95f3f85','http://localhost');
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

-- Dump completed on 2015-12-08 18:16:42
