create database keycloak;
use keycloak;

CREATE USER 'keycloak'@'%' IDENTIFIED BY 'keycloak';
GRANT ALL PRIVILEGES ON *.* TO 'keycloak'@'%' WITH GRANT OPTION;

CREATE USER 'keycloak'@'localhost' IDENTIFIED BY 'keycloak';
GRANT ALL PRIVILEGES ON keycloak.* TO 'keycloak'@'localhost' WITH GRANT OPTION;
FLUSH PRIVILEGES;

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
-- Current Database: `keycloak`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `keycloak` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `keycloak`;

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
INSERT INTO `AUTHENTICATION_EXECUTION` VALUES ('0661fb3f-4cbb-48b6-9290-84044b54ad55',NULL,'idp-create-user-if-unique','itesoft','654f15bc-5585-453b-98db-a13c3dfca3f3',2,20,'\0',NULL,'27604ba7-fa67-4462-8b02-c2c5a3734ad3'),('07293a60-bdf0-4ed4-b573-614c75175b09',NULL,'idp-email-verification','master','0dc21c5f-1c78-4e01-a1d8-f8358579adc2',2,20,'\0',NULL,NULL),('1005c68b-6157-479c-99d3-8770e648fa92',NULL,'direct-grant-validate-username','master','9d9c283d-c94e-42be-92a3-08649138fade',0,10,'\0',NULL,NULL),('1391e8fb-52b6-415c-86da-2ddd2dc83779',NULL,'registration-recaptcha-action','itesoft','dd91ceaa-78f4-426e-8b74-e8e0ad2b96cc',3,60,'\0',NULL,NULL),('185364ac-3c51-4e98-8ec1-72e9f17cc8ed',NULL,NULL,'master','d211e471-d55b-4e0d-8d24-580fc9e4d66d',2,30,'','3526ff49-11e8-4d11-8939-09341ae81f75',NULL),('190649f7-9a57-4433-9caa-8ed0f30e3f2c',NULL,'direct-grant-validate-password','master','9d9c283d-c94e-42be-92a3-08649138fade',0,20,'\0',NULL,NULL),('2ad8849f-c7c8-4bd6-980d-9f6dc11833fa',NULL,NULL,'itesoft','c02270f5-99a0-4139-acfa-9f34d1da362d',2,30,'','b6afc6f2-0bf4-4b08-9c96-2265bff9c9a3',NULL),('2d635200-e8c9-481d-b627-f6bb787e5ab0',NULL,'idp-email-verification','itesoft','c02270f5-99a0-4139-acfa-9f34d1da362d',2,20,'\0',NULL,NULL),('33e7b344-5ebb-41f7-9c84-168ba47acb4a',NULL,'reset-credential-email','master','ccdcec55-63ec-4592-b0a5-64b377f4ac5f',0,20,'\0',NULL,NULL),('38aa0374-76b6-4573-94da-b182aa61fb48',NULL,'idp-confirm-link','itesoft','c02270f5-99a0-4139-acfa-9f34d1da362d',0,10,'\0',NULL,NULL),('391d1f88-3f8a-421a-beb4-07403a574a90',NULL,'client-secret','itesoft','62c4ba0a-185d-42f3-aa3b-15a2d1afe924',2,10,'\0',NULL,NULL),('3d1dec20-b587-48b6-b8a8-aab22c4a2701',NULL,'auth-otp-form','master','1ec6ccdc-cf10-49ae-8e53-867bd75f4d33',1,20,'\0',NULL,NULL),('496b8fda-f9b8-4015-9075-ce6eaef090a1',NULL,'client-jwt','master','85333aa4-5386-457e-8507-4bf4a5db4949',2,20,'\0',NULL,NULL),('4bb62525-8c9f-4250-85b8-6f78b7840c1b',NULL,'registration-profile-action','itesoft','dd91ceaa-78f4-426e-8b74-e8e0ad2b96cc',0,40,'\0',NULL,NULL),('52aa66db-f01c-452b-9092-a82d07658ec7',NULL,'registration-password-action','itesoft','dd91ceaa-78f4-426e-8b74-e8e0ad2b96cc',0,50,'\0',NULL,NULL),('53d3737f-75ed-4973-be0c-2d6e854cd526',NULL,'idp-username-password-form','master','1ec6ccdc-cf10-49ae-8e53-867bd75f4d33',0,10,'\0',NULL,NULL),('55f64b1f-857f-4ac0-9b49-a859b9d984eb',NULL,'reset-otp','master','ccdcec55-63ec-4592-b0a5-64b377f4ac5f',1,40,'\0',NULL,NULL),('5862f623-422a-40a2-bcc9-a88207afad2a',NULL,'reset-otp','itesoft','55a04cb3-5c4f-4629-938e-e91153876409',1,40,'\0',NULL,NULL),('612d4796-d034-4e49-906c-842672dc1169',NULL,'auth-cookie','master','d211e471-d55b-4e0d-8d24-580fc9e4d66d',2,10,'\0',NULL,NULL),('6561da59-58c7-4640-887f-b6889d13b884',NULL,'direct-grant-validate-otp','itesoft','0c989114-37b7-4375-96dd-d834692cee13',1,30,'\0',NULL,NULL),('66654570-76a0-47d7-82cf-2f9d6d1206cd',NULL,'registration-user-creation','itesoft','dd91ceaa-78f4-426e-8b74-e8e0ad2b96cc',0,20,'\0',NULL,NULL),('68142f73-5aa4-47a8-b72a-2b9380633123',NULL,NULL,'master','0dc21c5f-1c78-4e01-a1d8-f8358579adc2',2,30,'','1ec6ccdc-cf10-49ae-8e53-867bd75f4d33',NULL),('71c9b33f-9074-48e9-82bc-7526986da32c',NULL,'idp-review-profile','master','3b992b61-7394-4d3a-9b56-96fcc36a74ab',0,10,'\0',NULL,'93ec53d3-f0f4-4785-8996-19f0b7d941f4'),('7379cb61-24bc-4a76-af36-ed34bc289ec6',NULL,'client-jwt','itesoft','62c4ba0a-185d-42f3-aa3b-15a2d1afe924',2,20,'\0',NULL,NULL),('75fa551e-881e-4d93-ad2c-94bf496d314e',NULL,'direct-grant-validate-otp','master','9d9c283d-c94e-42be-92a3-08649138fade',1,30,'\0',NULL,NULL),('83bf8e5d-190c-4145-bf80-ce80f99c79a6',NULL,NULL,'master','3b992b61-7394-4d3a-9b56-96fcc36a74ab',2,30,'','0dc21c5f-1c78-4e01-a1d8-f8358579adc2',NULL),('8c9b1dc8-8d2b-4c53-bad9-3c7d53fa13ec',NULL,'registration-password-action','master','e691b6d0-c21c-45ae-8ff9-4194dc4dfc9c',0,50,'\0',NULL,NULL),('9222edaa-5f8b-4cac-b83c-57b389768218',NULL,'auth-otp-form','master','3526ff49-11e8-4d11-8939-09341ae81f75',1,20,'\0',NULL,NULL),('9634513f-68ec-4c81-9e11-c759830381ea',NULL,'idp-confirm-link','master','0dc21c5f-1c78-4e01-a1d8-f8358579adc2',0,10,'\0',NULL,NULL),('a8a9eb61-d50e-48b3-ad41-35e22d109233',NULL,NULL,'itesoft','b381c1c2-8e16-41c5-af4c-98cd17d0991b',2,30,'','e9154ede-a724-4726-80cc-4aeaa80e805e',NULL),('aaa54f16-06f2-43c4-b48d-023f90e94cf4',NULL,'reset-credential-email','itesoft','55a04cb3-5c4f-4629-938e-e91153876409',0,20,'\0',NULL,NULL),('b1561346-cda2-45b8-8d1b-f00f7df6b599',NULL,'auth-cookie','itesoft','b381c1c2-8e16-41c5-af4c-98cd17d0991b',2,10,'\0',NULL,NULL),('b65a7d5a-6dac-4c8c-b048-9be3e22c9e73',NULL,'reset-credentials-choose-user','master','ccdcec55-63ec-4592-b0a5-64b377f4ac5f',0,10,'\0',NULL,NULL),('baba84a9-f764-4dae-923f-0017c3f20502',NULL,'auth-otp-form','itesoft','b6afc6f2-0bf4-4b08-9c96-2265bff9c9a3',1,20,'\0',NULL,NULL),('bdfb6f10-3c21-446a-a25c-2ff6177f1bb5',NULL,'client-secret','master','85333aa4-5386-457e-8507-4bf4a5db4949',2,10,'\0',NULL,NULL),('cf5b967e-dc6d-4a17-95bc-e4d6e328166b',NULL,'idp-review-profile','itesoft','654f15bc-5585-453b-98db-a13c3dfca3f3',0,10,'\0',NULL,'68499258-8b17-4f9f-b25a-9cad239e9a91'),('cf878274-1524-4aad-9f50-fad19e6afe62',NULL,'direct-grant-validate-password','itesoft','0c989114-37b7-4375-96dd-d834692cee13',0,20,'\0',NULL,NULL),('d0bb4e2d-3fc3-43f6-b931-7851f1d48c6f',NULL,'auth-username-password-form','master','3526ff49-11e8-4d11-8939-09341ae81f75',0,10,'\0',NULL,NULL),('d1cfdbf6-aba7-4bb5-9157-70170c5d7052',NULL,'auth-otp-form','itesoft','e9154ede-a724-4726-80cc-4aeaa80e805e',1,20,'\0',NULL,NULL),('d222c55d-576f-46ed-826a-1e6020e18dfe',NULL,'registration-recaptcha-action','master','e691b6d0-c21c-45ae-8ff9-4194dc4dfc9c',3,60,'\0',NULL,NULL),('d541efe0-23a5-4cb0-abc5-27a56fc5fadf',NULL,'registration-user-creation','master','e691b6d0-c21c-45ae-8ff9-4194dc4dfc9c',0,20,'\0',NULL,NULL),('d6ec2e39-fd22-43b2-bfd4-8e074bbb9b7d',NULL,'idp-username-password-form','itesoft','b6afc6f2-0bf4-4b08-9c96-2265bff9c9a3',0,10,'\0',NULL,NULL),('d7c5f9f0-b928-431c-86d7-60ad964aa5f9',NULL,'auth-username-password-form','itesoft','e9154ede-a724-4726-80cc-4aeaa80e805e',0,10,'\0',NULL,NULL),('e18994b3-e73c-4d19-a8f7-5da55919656a',NULL,'registration-page-form','itesoft','69f5a49d-217f-48cd-9295-1baac23af6df',0,10,'','dd91ceaa-78f4-426e-8b74-e8e0ad2b96cc',NULL),('e2e988de-7856-4c97-be9d-b43e8a12e8ab',NULL,'reset-credentials-choose-user','itesoft','55a04cb3-5c4f-4629-938e-e91153876409',0,10,'\0',NULL,NULL),('e42be3b0-1e51-4499-9f04-68ab3c79b992',NULL,'direct-grant-validate-username','itesoft','0c989114-37b7-4375-96dd-d834692cee13',0,10,'\0',NULL,NULL),('e7f3ba89-74e1-4ccc-9d0e-ca0bc1d214da',NULL,'auth-spnego','master','d211e471-d55b-4e0d-8d24-580fc9e4d66d',3,20,'\0',NULL,NULL),('e8b6c0b6-a417-4568-87e3-78ebdcfb1064',NULL,'registration-page-form','master','002f48f0-fed1-445c-b465-5962114555f3',0,10,'','e691b6d0-c21c-45ae-8ff9-4194dc4dfc9c',NULL),('ec21ff57-44ed-4edd-8ba4-05bd72bea342',NULL,'registration-profile-action','master','e691b6d0-c21c-45ae-8ff9-4194dc4dfc9c',0,40,'\0',NULL,NULL),('ee93d485-00c8-443b-9a78-b66215dadef2',NULL,'auth-spnego','itesoft','b381c1c2-8e16-41c5-af4c-98cd17d0991b',3,20,'\0',NULL,NULL),('f13e0b1a-f9a8-4c81-bedd-3a375327c859',NULL,'reset-password','itesoft','55a04cb3-5c4f-4629-938e-e91153876409',0,30,'\0',NULL,NULL),('f3a144cf-65c8-44e5-b7ea-d09b1a51cf69',NULL,NULL,'itesoft','654f15bc-5585-453b-98db-a13c3dfca3f3',2,30,'','c02270f5-99a0-4139-acfa-9f34d1da362d',NULL),('faf9d694-b905-4937-a1f2-617050904d82',NULL,'reset-password','master','ccdcec55-63ec-4592-b0a5-64b377f4ac5f',0,30,'\0',NULL,NULL),('ff705497-5e0f-42be-a36c-b61b0fe74efb',NULL,'idp-create-user-if-unique','master','3b992b61-7394-4d3a-9b56-96fcc36a74ab',2,20,'\0',NULL,'f5fa8eef-8557-4f37-876e-55c0fb1ea3a4');
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
INSERT INTO `AUTHENTICATION_FLOW` VALUES ('002f48f0-fed1-445c-b465-5962114555f3','registration','registration flow','master','basic-flow','',''),('0c989114-37b7-4375-96dd-d834692cee13','direct grant','OpenID Connect Resource Owner Grant','itesoft','basic-flow','',''),('0dc21c5f-1c78-4e01-a1d8-f8358579adc2','Handle Existing Account','Handle what to do if there is existing account with same email/username like authenticated identity provider','master','basic-flow','\0',''),('1ec6ccdc-cf10-49ae-8e53-867bd75f4d33','Verify Existing Account by Re-authentication','Reauthentication of existing account','master','basic-flow','\0',''),('3526ff49-11e8-4d11-8939-09341ae81f75','forms','Username, password, otp and other auth forms.','master','basic-flow','\0',''),('3b992b61-7394-4d3a-9b56-96fcc36a74ab','first broker login','Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account','master','basic-flow','',''),('55a04cb3-5c4f-4629-938e-e91153876409','reset credentials','Reset credentials for a user if they forgot their password or something','itesoft','basic-flow','',''),('62c4ba0a-185d-42f3-aa3b-15a2d1afe924','clients','Base authentication for clients','itesoft','client-flow','',''),('654f15bc-5585-453b-98db-a13c3dfca3f3','first broker login','Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account','itesoft','basic-flow','',''),('69f5a49d-217f-48cd-9295-1baac23af6df','registration','registration flow','itesoft','basic-flow','',''),('85333aa4-5386-457e-8507-4bf4a5db4949','clients','Base authentication for clients','master','client-flow','',''),('9d9c283d-c94e-42be-92a3-08649138fade','direct grant','OpenID Connect Resource Owner Grant','master','basic-flow','',''),('b381c1c2-8e16-41c5-af4c-98cd17d0991b','browser','browser based authentication','itesoft','basic-flow','',''),('b6afc6f2-0bf4-4b08-9c96-2265bff9c9a3','Verify Existing Account by Re-authentication','Reauthentication of existing account','itesoft','basic-flow','\0',''),('c02270f5-99a0-4139-acfa-9f34d1da362d','Handle Existing Account','Handle what to do if there is existing account with same email/username like authenticated identity provider','itesoft','basic-flow','\0',''),('ccdcec55-63ec-4592-b0a5-64b377f4ac5f','reset credentials','Reset credentials for a user if they forgot their password or something','master','basic-flow','',''),('d211e471-d55b-4e0d-8d24-580fc9e4d66d','browser','browser based authentication','master','basic-flow','',''),('dd91ceaa-78f4-426e-8b74-e8e0ad2b96cc','registration form','registration form','itesoft','form-flow','\0',''),('e691b6d0-c21c-45ae-8ff9-4194dc4dfc9c','registration form','registration form','master','form-flow','\0',''),('e9154ede-a724-4726-80cc-4aeaa80e805e','forms','Username, password, otp and other auth forms.','itesoft','basic-flow','\0','');
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
INSERT INTO `AUTHENTICATOR_CONFIG` VALUES ('27604ba7-fa67-4462-8b02-c2c5a3734ad3','create unique user config','itesoft'),('68499258-8b17-4f9f-b25a-9cad239e9a91','review profile config','itesoft'),('93ec53d3-f0f4-4785-8996-19f0b7d941f4','review profile config','master'),('f5fa8eef-8557-4f37-876e-55c0fb1ea3a4','create unique user config','master');
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
INSERT INTO `AUTHENTICATOR_CONFIG_ENTRY` VALUES ('27604ba7-fa67-4462-8b02-c2c5a3734ad3','false','require.password.update.after.registration'),('68499258-8b17-4f9f-b25a-9cad239e9a91','missing','update.profile.on.first.login'),('93ec53d3-f0f4-4785-8996-19f0b7d941f4','missing','update.profile.on.first.login'),('f5fa8eef-8557-4f37-876e-55c0fb1ea3a4','false','require.password.update.after.registration');
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
INSERT INTO `CLIENT` VALUES ('0597168b-0a86-444e-b2e8-3d2606220a8d','','\0','account',0,'\0','f4881721-3b70-4e92-97eb-2e3a21d0c600','/auth/realms/master/account','\0',NULL,'\0','master',NULL,0,'\0','\0','${client_account}','\0','client-secret',NULL,NULL,NULL,'','\0','\0'),('21a5f930-582b-47f2-af00-5fb44ab71203','','\0','admin-cli',0,'','1ee916b2-1a69-4049-be6e-57818f0f2147',NULL,'\0',NULL,'\0','master',NULL,0,'\0','\0','${client_admin-cli}','\0','client-secret',NULL,NULL,NULL,'\0','\0',''),('2d8808b6-c49c-4470-aff9-a9ac160199a8','','\0','security-admin-console',0,'','5e186aa7-837e-4186-a7cc-ca79a852c0fe','/auth/admin/master/console/index.html','\0',NULL,'\0','master',NULL,0,'\0','\0','${client_security-admin-console}','\0','client-secret',NULL,NULL,NULL,'','\0','\0'),('3cfbbcd7-04c1-4f7b-a47f-e1f0650a376d','','\0','account',0,'\0','dc3a6102-7a5c-4767-9b3a-549083890d7e','/auth/realms/itesoft/account','\0',NULL,'\0','itesoft',NULL,0,'\0','\0','${client_account}','\0','client-secret',NULL,NULL,NULL,'','\0','\0'),('3f3d428d-00c8-4f2c-82c1-200507448c16','','','demo-client',0,'\0','81df8b42-4051-4b15-80db-6a3f9b2e9dde','/auth/realms/itesoft/demo','\0',NULL,'\0','itesoft','openid-connect',-1,'\0','\0',NULL,'\0','client-secret',NULL,NULL,NULL,'','\0','\0'),('445d67a2-850e-4e89-9a98-5ade588abba0','','','master-realm',0,'\0','028b56d1-c384-42eb-a6f6-7982fd0c4222',NULL,'',NULL,'\0','master',NULL,0,'\0','\0','master Realm','\0','client-secret',NULL,NULL,NULL,'','\0','\0'),('671d6609-8765-4980-8691-a3682a3a8618','','\0','broker',0,'\0','cc510b0c-750c-4df1-b434-3037d44034a0',NULL,'\0',NULL,'\0','master',NULL,0,'\0','\0','${client_broker}','\0','client-secret',NULL,NULL,NULL,'','\0','\0'),('81f8ee23-e869-4042-bb97-9bbe0d38a70e','','\0','broker',0,'\0','26ae049e-9cc6-4b2b-950a-499009ab96c3',NULL,'\0',NULL,'\0','itesoft',NULL,0,'\0','\0','${client_broker}','\0','client-secret',NULL,NULL,NULL,'','\0','\0'),('c25cee7f-8df5-489f-b9ed-b975cbface22','','\0','security-admin-console',0,'','eb8e067d-d5d6-447d-8f70-72b1543f3b1d','/auth/admin/itesoft/console/index.html','\0',NULL,'\0','itesoft',NULL,0,'\0','\0','${client_security-admin-console}','\0','client-secret',NULL,NULL,NULL,'','\0','\0'),('d588228f-3d61-4e9e-87e7-581162ee0d2b','','\0','admin-cli',0,'','bdfaceaf-514c-4990-9023-ae57ef647a5c',NULL,'\0',NULL,'\0','itesoft',NULL,0,'\0','\0','${client_admin-cli}','\0','client-secret',NULL,NULL,NULL,'\0','\0',''),('da8bce91-af3e-4587-97fc-da09848d6a36','','\0','realm-management',0,'\0','a052b7c9-8abe-4bf6-8da8-da5735ade1f3',NULL,'',NULL,'\0','itesoft',NULL,0,'\0','\0','${client_realm-management}','\0','client-secret',NULL,NULL,NULL,'','\0','\0'),('e92d5e5c-27e7-4e3e-9b90-ab48beb68d94','','','itesoft-realm',0,'\0','cb58d327-1d20-4b9c-bf11-00552528680f',NULL,'',NULL,'\0','master',NULL,0,'\0','\0','itesoft Realm','\0','client-secret',NULL,NULL,NULL,'','\0','\0');
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
INSERT INTO `CLIENT_ATTRIBUTES` VALUES ('3f3d428d-00c8-4f2c-82c1-200507448c16','false','saml.assertion.signature'),('3f3d428d-00c8-4f2c-82c1-200507448c16','true','saml.authnstatement'),('3f3d428d-00c8-4f2c-82c1-200507448c16','false','saml.client.signature'),('3f3d428d-00c8-4f2c-82c1-200507448c16','false','saml.encrypt'),('3f3d428d-00c8-4f2c-82c1-200507448c16','false','saml.force.post.binding'),('3f3d428d-00c8-4f2c-82c1-200507448c16','false','saml.multivalued.roles'),('3f3d428d-00c8-4f2c-82c1-200507448c16','false','saml.server.signature'),('3f3d428d-00c8-4f2c-82c1-200507448c16','RSA_SHA256','saml.signature.algorithm'),('3f3d428d-00c8-4f2c-82c1-200507448c16','false','saml_force_name_id_format'),('3f3d428d-00c8-4f2c-82c1-200507448c16','username','saml_name_id_format'),('3f3d428d-00c8-4f2c-82c1-200507448c16','http://www.w3.org/2001/10/xml-exc-c14n#','saml_signature_canonicalization_method');
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
INSERT INTO `CLIENT_DEFAULT_ROLES` VALUES ('0597168b-0a86-444e-b2e8-3d2606220a8d','1c30ac40-8804-49bb-8152-e0e805b97818'),('0597168b-0a86-444e-b2e8-3d2606220a8d','e599c208-ad50-41b5-9bb6-b20f575f832c'),('3cfbbcd7-04c1-4f7b-a47f-e1f0650a376d','890d663a-eed6-4a17-8c75-0df9527f2e72'),('3cfbbcd7-04c1-4f7b-a47f-e1f0650a376d','cddfa7e4-05f2-4ce9-a889-694dd2bd5954');
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
INSERT INTO `COMPOSITE_ROLE` VALUES ('18aeb7d6-96c6-4148-88d9-cb2c95367172','65d453e7-a796-4f85-a088-591c9106443f'),('18aeb7d6-96c6-4148-88d9-cb2c95367172','8b72f270-5f92-4766-9a07-e080227d12b0'),('18aeb7d6-96c6-4148-88d9-cb2c95367172','47268216-e87d-43c3-b50d-3a525734db60'),('18aeb7d6-96c6-4148-88d9-cb2c95367172','244beb5e-57a2-4347-98ac-024c52508428'),('18aeb7d6-96c6-4148-88d9-cb2c95367172','cae1f620-9774-4a29-a098-e20fd5ef3579'),('18aeb7d6-96c6-4148-88d9-cb2c95367172','134fedbf-e344-4f71-ac1c-4714c36eb94c'),('18aeb7d6-96c6-4148-88d9-cb2c95367172','ae4cf978-6995-4db0-9314-9909e645b5c4'),('18aeb7d6-96c6-4148-88d9-cb2c95367172','e9326ce3-b62c-4d0d-a17d-e697c4b1aa55'),('18aeb7d6-96c6-4148-88d9-cb2c95367172','94317041-78ea-4263-b138-49dc64c0f843'),('18aeb7d6-96c6-4148-88d9-cb2c95367172','d2d38c2d-7b13-4a11-ac77-8778d19a7100'),('18aeb7d6-96c6-4148-88d9-cb2c95367172','4934bccb-a253-4a5a-b53b-5f1fc0f666cf'),('18aeb7d6-96c6-4148-88d9-cb2c95367172','b225f030-3029-4203-9d0e-1aedb93b6cd1'),('18aeb7d6-96c6-4148-88d9-cb2c95367172','91f8f1dc-72d8-4488-a3c0-936bf925499c'),('18aeb7d6-96c6-4148-88d9-cb2c95367172','c0a0474e-5f03-479d-8da0-6fdca4635ec9'),('18aeb7d6-96c6-4148-88d9-cb2c95367172','92bced92-e8d0-4ff3-8ec7-b220d8d8de87'),('18aeb7d6-96c6-4148-88d9-cb2c95367172','e5a71255-7631-42b9-b67e-9185c7802b51'),('18aeb7d6-96c6-4148-88d9-cb2c95367172','0f77566e-12ca-4fe3-97fe-bc655f2fdcba'),('18aeb7d6-96c6-4148-88d9-cb2c95367172','727a09b0-0bbd-4575-aa79-79079c89eee1'),('18aeb7d6-96c6-4148-88d9-cb2c95367172','2d25b2a3-b81b-456d-b012-f996e0dae68d'),('18aeb7d6-96c6-4148-88d9-cb2c95367172','2d378e50-3d27-4eaa-9e43-3fb72059d899'),('18aeb7d6-96c6-4148-88d9-cb2c95367172','3b7942fd-c9f5-4c1d-a4ce-02aabe74f262'),('18aeb7d6-96c6-4148-88d9-cb2c95367172','70f5afe4-3f47-4fb3-b399-14d0b2d0f936'),('18aeb7d6-96c6-4148-88d9-cb2c95367172','fcff196a-acce-445c-b129-0340afab0f21'),('18aeb7d6-96c6-4148-88d9-cb2c95367172','5c0af3ac-b25c-4ef1-91a7-b00c5be7f6dd'),('18aeb7d6-96c6-4148-88d9-cb2c95367172','7c626a5d-f06b-431d-acbb-cfe78972b7fd'),('f57beeda-fd7a-4049-9d86-45c61c69608f','3bb79081-15fb-4dc9-bc42-a7ca8cb330bd'),('f57beeda-fd7a-4049-9d86-45c61c69608f','a91d88f7-5c2a-404a-86a9-6232e668f1cc'),('f57beeda-fd7a-4049-9d86-45c61c69608f','fd3c3486-d9c1-4f0e-9276-40f59312a2d2'),('f57beeda-fd7a-4049-9d86-45c61c69608f','d546f05a-041b-45b5-9f01-77cdc57e9fe6'),('f57beeda-fd7a-4049-9d86-45c61c69608f','32cb07f1-c683-4982-a4b9-3a2cb849d1de'),('f57beeda-fd7a-4049-9d86-45c61c69608f','e5422e4c-e1ea-4b21-ab56-ef97d435e530'),('f57beeda-fd7a-4049-9d86-45c61c69608f','22d26dc5-3492-4e76-a7fa-5c208a2fd33f'),('f57beeda-fd7a-4049-9d86-45c61c69608f','315c7e63-2ee5-456b-adc3-2c2c50bb917f'),('f57beeda-fd7a-4049-9d86-45c61c69608f','71b7a6b0-dd4a-4d1b-abb1-423d76a81ef9'),('f57beeda-fd7a-4049-9d86-45c61c69608f','e584c52a-3703-4e87-8637-7c3ca7a0c9e9'),('f57beeda-fd7a-4049-9d86-45c61c69608f','56e53562-7add-4b9c-9214-2b5498da4029'),('f57beeda-fd7a-4049-9d86-45c61c69608f','021786ba-83f1-44d7-ab7a-484788c3bb5c');
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
INSERT INTO `CREDENTIAL` VALUES ('d337265e-47c2-4c77-9cb1-aa0f6419d221',NULL,1,'l\CD]f^\BE\B3c\0\9BW\F3;\8E','password','+WKQGGo1VXmSwOhU9LyYga4z07zo6Wfi9WbQui9tiVycNeV2fArRQfeS8v9+n1Do4GXWgP+PEizQye8INJEFcQ==','6ed83869-d0ad-4731-ab63-626f7e0088f9',1449572338000,0,0,0,NULL),('dd6b4a74-206c-49c5-82b0-73b16e2133e9',NULL,1,'uj\91\83\E6\EFCC\DA\A5\9C\FAh<\0','password','ESC3S6GaxsYn75YyEsbEc0DAxIutBsgOSVOPC9NmGJhxZaFgnMwcDJup2E1Mx5ot+OL4xJiT+4uunU2tzLcjDg==','b9f01f0a-ad60-4c48-8f66-0697721d7d44',1449572728000,0,0,0,NULL);
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
INSERT INTO `DATABASECHANGELOG` VALUES ('1.0.0.Final','sthorger@redhat.com','META-INF/jpa-changelog-1.0.0.Final.xml','2015-12-08 10:47:38',1,'EXECUTED','7:00a57f7a6fb456639b34e62972e0ec02','createTable (x29), addPrimaryKey (x21), addUniqueConstraint (x9), addForeignKeyConstraint (x32)','',NULL,'3.4.1',NULL,NULL),('1.1.0.Beta1','sthorger@redhat.com','META-INF/jpa-changelog-1.1.0.Beta1.xml','2015-12-08 10:47:39',2,'EXECUTED','7:0310eb8ba07cec616460794d42ade0fa','delete (x3), createTable (x3), addColumn (x5), addPrimaryKey (x3), addForeignKeyConstraint (x3), customChange','',NULL,'3.4.1',NULL,NULL),('1.1.0.Final','sthorger@redhat.com','META-INF/jpa-changelog-1.1.0.Final.xml','2015-12-08 10:47:39',3,'EXECUTED','7:5d25857e708c3233ef4439df1f93f012','renameColumn','',NULL,'3.4.1',NULL,NULL),('1.2.0.Beta1','psilva@redhat.com','META-INF/jpa-changelog-1.2.0.Beta1.xml','2015-12-08 10:47:41',4,'EXECUTED','7:c7a54a1041d58eb3817a4a883b4d4e84','delete (x4), createTable (x8), addColumn (x2), addPrimaryKey (x6), addForeignKeyConstraint (x9), addUniqueConstraint (x2), addColumn, dropForeignKeyConstraint (x2), dropUniqueConstraint, renameColumn (x3), addUniqueConstraint, addForeignKeyConstra...','',NULL,'3.4.1',NULL,NULL),('1.2.0.RC1','bburke@redhat.com','META-INF/jpa-changelog-1.2.0.CR1.xml','2015-12-08 10:47:43',5,'EXECUTED','7:0f08df48468428e0f30ee59a8ec01a41','delete (x5), createTable (x3), addColumn, createTable (x4), addPrimaryKey (x7), addForeignKeyConstraint (x6), renameColumn, addColumn (x2), update, dropColumn, dropForeignKeyConstraint, renameColumn, addForeignKeyConstraint, dropForeignKeyConstrai...','',NULL,'3.4.1',NULL,NULL),('1.2.0.Final','keycloak','META-INF/jpa-changelog-1.2.0.Final.xml','2015-12-08 10:47:43',6,'EXECUTED','7:a3377a2059aefbf3b90ebb4c4cc8e2ab','update (x3)','',NULL,'3.4.1',NULL,NULL),('1.3.0','bburke@redhat.com','META-INF/jpa-changelog-1.3.0.xml','2015-12-08 10:47:45',7,'EXECUTED','7:04c1dbedc2aa3e9756d1a1668e003451','delete (x6), createTable (x7), addColumn, createTable, addColumn (x2), update, dropDefaultValue, dropColumn, addColumn, update (x4), addPrimaryKey (x4), dropPrimaryKey, dropColumn, addPrimaryKey (x4), addForeignKeyConstraint (x8), dropDefaultValue...','',NULL,'3.4.1',NULL,NULL),('1.4.0','bburke@redhat.com','META-INF/jpa-changelog-1.4.0.xml','2015-12-08 10:47:46',8,'EXECUTED','7:36ef39ed560ad07062d956db861042ba','delete (x7), addColumn (x5), dropColumn, renameTable (x2), update (x10), createTable (x3), customChange, dropPrimaryKey, addPrimaryKey (x4), addForeignKeyConstraint (x2), dropColumn, addColumn','',NULL,'3.4.1',NULL,NULL),('1.5.0','bburke@redhat.com','META-INF/jpa-changelog-1.5.0.xml','2015-12-08 10:47:46',9,'EXECUTED','7:cf12b04b79bea5152f165eb41f3955f6','delete (x7), dropDefaultValue, dropColumn, addColumn (x3)','',NULL,'3.4.1',NULL,NULL),('1.6.1_from15','mposolda@redhat.com','META-INF/jpa-changelog-1.6.1.xml','2015-12-08 10:47:47',10,'EXECUTED','7:7e32c8f05c755e8675764e7d5f514509','addColumn (x3), createTable (x2), addPrimaryKey (x2)','',NULL,'3.4.1',NULL,NULL),('1.6.1_from16','mposolda@redhat.com','META-INF/jpa-changelog-1.6.1.xml','2015-12-08 10:47:47',11,'MARK_RAN','7:2fa220758991285312eb84f3b4ff5336','dropPrimaryKey (x2), addColumn, update, dropColumn, addColumn, update, dropColumn, addPrimaryKey (x2)','',NULL,'3.4.1',NULL,NULL),('1.6.1','mposolda@redhat.com','META-INF/jpa-changelog-1.6.1.xml','2015-12-08 10:47:47',12,'EXECUTED','7:d41d8cd98f00b204e9800998ecf8427e','Empty','',NULL,'3.4.1',NULL,NULL),('1.7.0','bburke@redhat.com','META-INF/jpa-changelog-1.7.0.xml','2015-12-08 10:47:48',13,'EXECUTED','7:91ace540896df890cc00a0490ee52bbc','createTable (x5), addColumn (x2), dropDefaultValue, dropColumn, addPrimaryKey, addForeignKeyConstraint, addPrimaryKey, addForeignKeyConstraint, addPrimaryKey, addForeignKeyConstraint, addPrimaryKey, addForeignKeyConstraint (x2), addUniqueConstrain...','',NULL,'3.4.1',NULL,NULL);
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
INSERT INTO `KEYCLOAK_ROLE` VALUES ('021786ba-83f1-44d7-ab7a-484788c3bb5c','da8bce91-af3e-4587-97fc-da09848d6a36','','${role_impersonation}','impersonation','itesoft','da8bce91-af3e-4587-97fc-da09848d6a36',NULL,'\0'),('0f77566e-12ca-4fe3-97fe-bc655f2fdcba','e92d5e5c-27e7-4e3e-9b90-ab48beb68d94','','${role_view-clients}','view-clients','master','e92d5e5c-27e7-4e3e-9b90-ab48beb68d94',NULL,'\0'),('134fedbf-e344-4f71-ac1c-4714c36eb94c','445d67a2-850e-4e89-9a98-5ade588abba0','','${role_view-events}','view-events','master','445d67a2-850e-4e89-9a98-5ade588abba0',NULL,'\0'),('18aeb7d6-96c6-4148-88d9-cb2c95367172','master','\0','${role_admin}','admin','master',NULL,'master','\0'),('1c30ac40-8804-49bb-8152-e0e805b97818','0597168b-0a86-444e-b2e8-3d2606220a8d','','${role_view-profile}','view-profile','master','0597168b-0a86-444e-b2e8-3d2606220a8d',NULL,'\0'),('22d26dc5-3492-4e76-a7fa-5c208a2fd33f','da8bce91-af3e-4587-97fc-da09848d6a36','','${role_manage-realm}','manage-realm','itesoft','da8bce91-af3e-4587-97fc-da09848d6a36',NULL,'\0'),('244beb5e-57a2-4347-98ac-024c52508428','445d67a2-850e-4e89-9a98-5ade588abba0','','${role_view-users}','view-users','master','445d67a2-850e-4e89-9a98-5ade588abba0',NULL,'\0'),('2ad1bb3c-68f3-4bdc-a61a-0227ea932224','itesoft','\0','${role_offline-access}','offline_access','itesoft',NULL,'itesoft',''),('2d25b2a3-b81b-456d-b012-f996e0dae68d','e92d5e5c-27e7-4e3e-9b90-ab48beb68d94','','${role_view-identity-providers}','view-identity-providers','master','e92d5e5c-27e7-4e3e-9b90-ab48beb68d94',NULL,'\0'),('2d378e50-3d27-4eaa-9e43-3fb72059d899','e92d5e5c-27e7-4e3e-9b90-ab48beb68d94','','${role_manage-realm}','manage-realm','master','e92d5e5c-27e7-4e3e-9b90-ab48beb68d94',NULL,'\0'),('2de987f4-ab05-4cfa-ae85-6b2880b0a9dd','81f8ee23-e869-4042-bb97-9bbe0d38a70e','','${role_read-token}','read-token','itesoft','81f8ee23-e869-4042-bb97-9bbe0d38a70e',NULL,'\0'),('315c7e63-2ee5-456b-adc3-2c2c50bb917f','da8bce91-af3e-4587-97fc-da09848d6a36','','${role_manage-users}','manage-users','itesoft','da8bce91-af3e-4587-97fc-da09848d6a36',NULL,'\0'),('32cb07f1-c683-4982-a4b9-3a2cb849d1de','da8bce91-af3e-4587-97fc-da09848d6a36','','${role_view-events}','view-events','itesoft','da8bce91-af3e-4587-97fc-da09848d6a36',NULL,'\0'),('3b7942fd-c9f5-4c1d-a4ce-02aabe74f262','e92d5e5c-27e7-4e3e-9b90-ab48beb68d94','','${role_manage-users}','manage-users','master','e92d5e5c-27e7-4e3e-9b90-ab48beb68d94',NULL,'\0'),('3bb79081-15fb-4dc9-bc42-a7ca8cb330bd','da8bce91-af3e-4587-97fc-da09848d6a36','','${role_create-client}','create-client','itesoft','da8bce91-af3e-4587-97fc-da09848d6a36',NULL,'\0'),('47268216-e87d-43c3-b50d-3a525734db60','445d67a2-850e-4e89-9a98-5ade588abba0','','${role_view-realm}','view-realm','master','445d67a2-850e-4e89-9a98-5ade588abba0',NULL,'\0'),('4934bccb-a253-4a5a-b53b-5f1fc0f666cf','445d67a2-850e-4e89-9a98-5ade588abba0','','${role_manage-events}','manage-events','master','445d67a2-850e-4e89-9a98-5ade588abba0',NULL,'\0'),('56e53562-7add-4b9c-9214-2b5498da4029','da8bce91-af3e-4587-97fc-da09848d6a36','','${role_manage-identity-providers}','manage-identity-providers','itesoft','da8bce91-af3e-4587-97fc-da09848d6a36',NULL,'\0'),('5c0af3ac-b25c-4ef1-91a7-b00c5be7f6dd','e92d5e5c-27e7-4e3e-9b90-ab48beb68d94','','${role_manage-identity-providers}','manage-identity-providers','master','e92d5e5c-27e7-4e3e-9b90-ab48beb68d94',NULL,'\0'),('65d453e7-a796-4f85-a088-591c9106443f','master','\0','${role_create-realm}','create-realm','master',NULL,'master','\0'),('70f5afe4-3f47-4fb3-b399-14d0b2d0f936','e92d5e5c-27e7-4e3e-9b90-ab48beb68d94','','${role_manage-clients}','manage-clients','master','e92d5e5c-27e7-4e3e-9b90-ab48beb68d94',NULL,'\0'),('71b7a6b0-dd4a-4d1b-abb1-423d76a81ef9','da8bce91-af3e-4587-97fc-da09848d6a36','','${role_manage-clients}','manage-clients','itesoft','da8bce91-af3e-4587-97fc-da09848d6a36',NULL,'\0'),('727a09b0-0bbd-4575-aa79-79079c89eee1','e92d5e5c-27e7-4e3e-9b90-ab48beb68d94','','${role_view-events}','view-events','master','e92d5e5c-27e7-4e3e-9b90-ab48beb68d94',NULL,'\0'),('7c626a5d-f06b-431d-acbb-cfe78972b7fd','e92d5e5c-27e7-4e3e-9b90-ab48beb68d94','','${role_impersonation}','impersonation','master','e92d5e5c-27e7-4e3e-9b90-ab48beb68d94',NULL,'\0'),('85d234e5-3e4d-4e11-8c60-601b203d540a','master','\0','${role_offline-access}','offline_access','master',NULL,'master',''),('890d663a-eed6-4a17-8c75-0df9527f2e72','3cfbbcd7-04c1-4f7b-a47f-e1f0650a376d','','${role_manage-account}','manage-account','itesoft','3cfbbcd7-04c1-4f7b-a47f-e1f0650a376d',NULL,'\0'),('8b72f270-5f92-4766-9a07-e080227d12b0','445d67a2-850e-4e89-9a98-5ade588abba0','','${role_create-client}','create-client','master','445d67a2-850e-4e89-9a98-5ade588abba0',NULL,'\0'),('91f8f1dc-72d8-4488-a3c0-936bf925499c','445d67a2-850e-4e89-9a98-5ade588abba0','','${role_impersonation}','impersonation','master','445d67a2-850e-4e89-9a98-5ade588abba0',NULL,'\0'),('92bced92-e8d0-4ff3-8ec7-b220d8d8de87','e92d5e5c-27e7-4e3e-9b90-ab48beb68d94','','${role_view-realm}','view-realm','master','e92d5e5c-27e7-4e3e-9b90-ab48beb68d94',NULL,'\0'),('94317041-78ea-4263-b138-49dc64c0f843','445d67a2-850e-4e89-9a98-5ade588abba0','','${role_manage-users}','manage-users','master','445d67a2-850e-4e89-9a98-5ade588abba0',NULL,'\0'),('a91d88f7-5c2a-404a-86a9-6232e668f1cc','da8bce91-af3e-4587-97fc-da09848d6a36','','${role_view-realm}','view-realm','itesoft','da8bce91-af3e-4587-97fc-da09848d6a36',NULL,'\0'),('ae4cf978-6995-4db0-9314-9909e645b5c4','445d67a2-850e-4e89-9a98-5ade588abba0','','${role_view-identity-providers}','view-identity-providers','master','445d67a2-850e-4e89-9a98-5ade588abba0',NULL,'\0'),('b225f030-3029-4203-9d0e-1aedb93b6cd1','445d67a2-850e-4e89-9a98-5ade588abba0','','${role_manage-identity-providers}','manage-identity-providers','master','445d67a2-850e-4e89-9a98-5ade588abba0',NULL,'\0'),('c0a0474e-5f03-479d-8da0-6fdca4635ec9','e92d5e5c-27e7-4e3e-9b90-ab48beb68d94','','${role_create-client}','create-client','master','e92d5e5c-27e7-4e3e-9b90-ab48beb68d94',NULL,'\0'),('cae1f620-9774-4a29-a098-e20fd5ef3579','445d67a2-850e-4e89-9a98-5ade588abba0','','${role_view-clients}','view-clients','master','445d67a2-850e-4e89-9a98-5ade588abba0',NULL,'\0'),('cddfa7e4-05f2-4ce9-a889-694dd2bd5954','3cfbbcd7-04c1-4f7b-a47f-e1f0650a376d','','${role_view-profile}','view-profile','itesoft','3cfbbcd7-04c1-4f7b-a47f-e1f0650a376d',NULL,'\0'),('d2d38c2d-7b13-4a11-ac77-8778d19a7100','445d67a2-850e-4e89-9a98-5ade588abba0','','${role_manage-clients}','manage-clients','master','445d67a2-850e-4e89-9a98-5ade588abba0',NULL,'\0'),('d546f05a-041b-45b5-9f01-77cdc57e9fe6','da8bce91-af3e-4587-97fc-da09848d6a36','','${role_view-clients}','view-clients','itesoft','da8bce91-af3e-4587-97fc-da09848d6a36',NULL,'\0'),('e5422e4c-e1ea-4b21-ab56-ef97d435e530','da8bce91-af3e-4587-97fc-da09848d6a36','','${role_view-identity-providers}','view-identity-providers','itesoft','da8bce91-af3e-4587-97fc-da09848d6a36',NULL,'\0'),('e584c52a-3703-4e87-8637-7c3ca7a0c9e9','da8bce91-af3e-4587-97fc-da09848d6a36','','${role_manage-events}','manage-events','itesoft','da8bce91-af3e-4587-97fc-da09848d6a36',NULL,'\0'),('e599c208-ad50-41b5-9bb6-b20f575f832c','0597168b-0a86-444e-b2e8-3d2606220a8d','','${role_manage-account}','manage-account','master','0597168b-0a86-444e-b2e8-3d2606220a8d',NULL,'\0'),('e5a71255-7631-42b9-b67e-9185c7802b51','e92d5e5c-27e7-4e3e-9b90-ab48beb68d94','','${role_view-users}','view-users','master','e92d5e5c-27e7-4e3e-9b90-ab48beb68d94',NULL,'\0'),('e9326ce3-b62c-4d0d-a17d-e697c4b1aa55','445d67a2-850e-4e89-9a98-5ade588abba0','','${role_manage-realm}','manage-realm','master','445d67a2-850e-4e89-9a98-5ade588abba0',NULL,'\0'),('f57beeda-fd7a-4049-9d86-45c61c69608f','da8bce91-af3e-4587-97fc-da09848d6a36','','${role_realm-admin}','realm-admin','itesoft','da8bce91-af3e-4587-97fc-da09848d6a36',NULL,'\0'),('facc9786-f4f4-4cac-b8f5-90622155d912','671d6609-8765-4980-8691-a3682a3a8618','','${role_read-token}','read-token','master','671d6609-8765-4980-8691-a3682a3a8618',NULL,'\0'),('fcff196a-acce-445c-b129-0340afab0f21','e92d5e5c-27e7-4e3e-9b90-ab48beb68d94','','${role_manage-events}','manage-events','master','e92d5e5c-27e7-4e3e-9b90-ab48beb68d94',NULL,'\0'),('fd3c3486-d9c1-4f0e-9276-40f59312a2d2','da8bce91-af3e-4587-97fc-da09848d6a36','','${role_view-users}','view-users','itesoft','da8bce91-af3e-4587-97fc-da09848d6a36',NULL,'\0');
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
INSERT INTO `PROTOCOL_MAPPER` VALUES ('040c26ab-b795-4eae-83d0-94f72a0f013c','full name','openid-connect','oidc-full-name-mapper','','${fullName}','da8bce91-af3e-4587-97fc-da09848d6a36'),('06a0b1be-96e3-46e2-803c-aaf0c4f75a91','family name','openid-connect','oidc-usermodel-property-mapper','','${familyName}','21a5f930-582b-47f2-af00-5fb44ab71203'),('0759f701-304c-439b-80b5-d5990c713ab8','username','openid-connect','oidc-usermodel-property-mapper','','${username}','da8bce91-af3e-4587-97fc-da09848d6a36'),('097c9dc0-7648-4d26-a988-4818640d5c95','email','openid-connect','oidc-usermodel-property-mapper','','${email}','671d6609-8765-4980-8691-a3682a3a8618'),('09ec6850-b5bd-472e-bcf4-407dca214de7','given name','openid-connect','oidc-usermodel-property-mapper','','${givenName}','21a5f930-582b-47f2-af00-5fb44ab71203'),('0e2bf804-4b50-486d-91fa-95879b254f17','email','openid-connect','oidc-usermodel-property-mapper','','${email}','0597168b-0a86-444e-b2e8-3d2606220a8d'),('0e4ee310-f1b6-4417-82e2-42eede62d29a','family name','openid-connect','oidc-usermodel-property-mapper','','${familyName}','3f3d428d-00c8-4f2c-82c1-200507448c16'),('1817c668-285f-4d6c-956a-7bcaa443172c','username','openid-connect','oidc-usermodel-property-mapper','','${username}','3f3d428d-00c8-4f2c-82c1-200507448c16'),('1a237113-e747-47fd-8710-3ec85218d299','family name','openid-connect','oidc-usermodel-property-mapper','','${familyName}','3cfbbcd7-04c1-4f7b-a47f-e1f0650a376d'),('1b39912e-03e7-4cd3-8245-5ec9aaa12430','username','openid-connect','oidc-usermodel-property-mapper','','${username}','2d8808b6-c49c-4470-aff9-a9ac160199a8'),('1becb5b7-7eff-4fd3-a5c6-7c0a177176e2','email','openid-connect','oidc-usermodel-property-mapper','','${email}','d588228f-3d61-4e9e-87e7-581162ee0d2b'),('1d5d3a86-32b0-4b08-894f-455e9b8f8dae','family name','openid-connect','oidc-usermodel-property-mapper','','${familyName}','0597168b-0a86-444e-b2e8-3d2606220a8d'),('20133e7e-bb46-4bea-b213-0cff36130815','given name','openid-connect','oidc-usermodel-property-mapper','','${givenName}','81f8ee23-e869-4042-bb97-9bbe0d38a70e'),('2a45b872-0bbc-476d-bd93-986cdbd0056f','role list','saml','saml-role-list-mapper','\0',NULL,'c25cee7f-8df5-489f-b9ed-b975cbface22'),('2a6a25b1-56e1-4314-9a89-5515077d34ff','given name','openid-connect','oidc-usermodel-property-mapper','','${givenName}','3cfbbcd7-04c1-4f7b-a47f-e1f0650a376d'),('32f23cb1-4904-4021-8717-4e9c5f9ac430','full name','openid-connect','oidc-full-name-mapper','','${fullName}','21a5f930-582b-47f2-af00-5fb44ab71203'),('34e0fc24-110a-4a59-a6e0-62016a298a3e','full name','openid-connect','oidc-full-name-mapper','','${fullName}','2d8808b6-c49c-4470-aff9-a9ac160199a8'),('3bd10b79-5d0f-443f-b274-ef1f4a61e85d','username','openid-connect','oidc-usermodel-property-mapper','','${username}','21a5f930-582b-47f2-af00-5fb44ab71203'),('40850ce6-6909-4245-b0a1-713e255f563a','full name','openid-connect','oidc-full-name-mapper','','${fullName}','3f3d428d-00c8-4f2c-82c1-200507448c16'),('49541fc1-1973-4f3c-ad30-b8da5cfbf2f9','full name','openid-connect','oidc-full-name-mapper','','${fullName}','3cfbbcd7-04c1-4f7b-a47f-e1f0650a376d'),('4b0b82b1-80c0-4b44-b7c0-1b483a992c9f','given name','openid-connect','oidc-usermodel-property-mapper','','${givenName}','3f3d428d-00c8-4f2c-82c1-200507448c16'),('4f457441-8b96-4ea5-a689-ea95f25862fc','given name','openid-connect','oidc-usermodel-property-mapper','','${givenName}','2d8808b6-c49c-4470-aff9-a9ac160199a8'),('58b3ceaa-3f5a-463c-a32b-60b5da9542c3','role list','saml','saml-role-list-mapper','\0',NULL,'d588228f-3d61-4e9e-87e7-581162ee0d2b'),('5c2c835a-88a9-4b92-a86b-a2a0cc0470b4','full name','openid-connect','oidc-full-name-mapper','','${fullName}','d588228f-3d61-4e9e-87e7-581162ee0d2b'),('69ef2c59-302e-4618-9928-5d9ff8797f66','family name','openid-connect','oidc-usermodel-property-mapper','','${familyName}','81f8ee23-e869-4042-bb97-9bbe0d38a70e'),('713df9b6-9020-43c0-9cd7-aacf1f8e8d44','full name','openid-connect','oidc-full-name-mapper','','${fullName}','0597168b-0a86-444e-b2e8-3d2606220a8d'),('726a8b1f-c119-49e8-9279-2e684545e0e0','email','openid-connect','oidc-usermodel-property-mapper','','${email}','445d67a2-850e-4e89-9a98-5ade588abba0'),('738b1f83-9f60-4467-99d7-05169000c350','role list','saml','saml-role-list-mapper','\0',NULL,'81f8ee23-e869-4042-bb97-9bbe0d38a70e'),('770b2b45-fcd4-4d5a-9057-539230ecabfc','username','openid-connect','oidc-usermodel-property-mapper','','${username}','d588228f-3d61-4e9e-87e7-581162ee0d2b'),('77c82e3f-2286-439e-b10d-cea024265a45','full name','openid-connect','oidc-full-name-mapper','','${fullName}','81f8ee23-e869-4042-bb97-9bbe0d38a70e'),('78b5463a-fe5b-4bf3-b2c8-eeacc446ccf4','email','openid-connect','oidc-usermodel-property-mapper','','${email}','81f8ee23-e869-4042-bb97-9bbe0d38a70e'),('7b38c7b0-be8e-4aa6-b5bc-00d6d4134292','role list','saml','saml-role-list-mapper','\0',NULL,'2d8808b6-c49c-4470-aff9-a9ac160199a8'),('7fdad45d-c2d5-47f2-9df7-7ff7187db951','family name','openid-connect','oidc-usermodel-property-mapper','','${familyName}','445d67a2-850e-4e89-9a98-5ade588abba0'),('85ed9c2b-c080-469d-a414-a7af9f55e778','given name','openid-connect','oidc-usermodel-property-mapper','','${givenName}','c25cee7f-8df5-489f-b9ed-b975cbface22'),('8d8fbac2-99b2-40b2-9124-f3374270019c','given name','openid-connect','oidc-usermodel-property-mapper','','${givenName}','0597168b-0a86-444e-b2e8-3d2606220a8d'),('8d916ecc-ba26-417e-9b5f-fce96a595c4b','full name','openid-connect','oidc-full-name-mapper','','${fullName}','c25cee7f-8df5-489f-b9ed-b975cbface22'),('92acd276-8be7-4a10-b985-08b7aaeb42a4','username','openid-connect','oidc-usermodel-property-mapper','','${username}','81f8ee23-e869-4042-bb97-9bbe0d38a70e'),('95918b5a-5f86-40aa-84c5-9389894b3a53','username','openid-connect','oidc-usermodel-property-mapper','','${username}','3cfbbcd7-04c1-4f7b-a47f-e1f0650a376d'),('99762252-de14-4b0a-b067-3d59d67e60f5','role list','saml','saml-role-list-mapper','\0',NULL,'da8bce91-af3e-4587-97fc-da09848d6a36'),('9aacf9c7-9e56-4874-9128-05329fe2808e','given name','openid-connect','oidc-usermodel-property-mapper','','${givenName}','d588228f-3d61-4e9e-87e7-581162ee0d2b'),('9bcd6688-ccd3-4c4d-9632-06d6426891d7','family name','openid-connect','oidc-usermodel-property-mapper','','${familyName}','671d6609-8765-4980-8691-a3682a3a8618'),('9e0ec59c-1b59-4580-b874-3945829875c6','username','openid-connect','oidc-usermodel-property-mapper','','${username}','c25cee7f-8df5-489f-b9ed-b975cbface22'),('9f007202-1ca1-4e24-998c-62082c256bd9','role list','saml','saml-role-list-mapper','\0',NULL,'21a5f930-582b-47f2-af00-5fb44ab71203'),('a0ece8b4-28d0-4378-bd66-f2b87b1192aa','locale','openid-connect','oidc-usermodel-attribute-mapper','\0','${locale}','2d8808b6-c49c-4470-aff9-a9ac160199a8'),('a658f442-0419-47b4-b1c2-a2535896d34c','role list','saml','saml-role-list-mapper','\0',NULL,'671d6609-8765-4980-8691-a3682a3a8618'),('a8ed8b6f-c045-4b57-8d34-6685496e9508','role list','saml','saml-role-list-mapper','\0',NULL,'3f3d428d-00c8-4f2c-82c1-200507448c16'),('ab664110-4e77-4be5-b029-c2b532e36319','family name','openid-connect','oidc-usermodel-property-mapper','','${familyName}','2d8808b6-c49c-4470-aff9-a9ac160199a8'),('ac5ce846-92dc-465d-9e07-ed91b3614d73','email','openid-connect','oidc-usermodel-property-mapper','','${email}','21a5f930-582b-47f2-af00-5fb44ab71203'),('ae1f7e7e-33ca-431a-b28e-02ec1fd1e39d','email','openid-connect','oidc-usermodel-property-mapper','','${email}','3f3d428d-00c8-4f2c-82c1-200507448c16'),('aed47b20-a0b3-4037-b47e-2da53f022029','email','openid-connect','oidc-usermodel-property-mapper','','${email}','3cfbbcd7-04c1-4f7b-a47f-e1f0650a376d'),('af7caac0-54ab-4cf7-9360-a400d47b725f','username','openid-connect','oidc-usermodel-property-mapper','','${username}','445d67a2-850e-4e89-9a98-5ade588abba0'),('b38ac1a7-778b-4eba-bc63-b9a983791ef3','username','openid-connect','oidc-usermodel-property-mapper','','${username}','671d6609-8765-4980-8691-a3682a3a8618'),('b6b9fdf6-263e-4746-95b1-655d524d93d1','role list','saml','saml-role-list-mapper','\0',NULL,'445d67a2-850e-4e89-9a98-5ade588abba0'),('b7c32179-e396-468e-a3f1-1b219fec61a3','given name','openid-connect','oidc-usermodel-property-mapper','','${givenName}','e92d5e5c-27e7-4e3e-9b90-ab48beb68d94'),('b85e9181-43b7-4d14-b680-bbffd3be5dbf','given name','openid-connect','oidc-usermodel-property-mapper','','${givenName}','445d67a2-850e-4e89-9a98-5ade588abba0'),('bf934af0-3339-44d3-b202-099ba90a98b7','role list','saml','saml-role-list-mapper','\0',NULL,'0597168b-0a86-444e-b2e8-3d2606220a8d'),('c476888a-3b87-4b35-badb-284507380f95','family name','openid-connect','oidc-usermodel-property-mapper','','${familyName}','c25cee7f-8df5-489f-b9ed-b975cbface22'),('c4f88321-02f1-4792-b81d-79b9d1617b8a','role list','saml','saml-role-list-mapper','\0',NULL,'e92d5e5c-27e7-4e3e-9b90-ab48beb68d94'),('ce3f5a8d-2ff6-405a-828c-fd127b70370e','family name','openid-connect','oidc-usermodel-property-mapper','','${familyName}','e92d5e5c-27e7-4e3e-9b90-ab48beb68d94'),('d04b3d86-5967-4aba-9936-5413db415ccc','family name','openid-connect','oidc-usermodel-property-mapper','','${familyName}','da8bce91-af3e-4587-97fc-da09848d6a36'),('d21a59b8-a627-4518-b6f0-31922607ddca','full name','openid-connect','oidc-full-name-mapper','','${fullName}','671d6609-8765-4980-8691-a3682a3a8618'),('d6c43115-ebce-45a1-8a11-2fb08010dbb3','family name','openid-connect','oidc-usermodel-property-mapper','','${familyName}','d588228f-3d61-4e9e-87e7-581162ee0d2b'),('d7a8ac94-0d81-4afd-b330-32ae21394795','username','openid-connect','oidc-usermodel-property-mapper','','${username}','e92d5e5c-27e7-4e3e-9b90-ab48beb68d94'),('dfcb4a51-a4fb-43b7-942d-59ea86595b3b','full name','openid-connect','oidc-full-name-mapper','','${fullName}','445d67a2-850e-4e89-9a98-5ade588abba0'),('dff3c477-3ebc-41e1-8cdb-6da614ab3f55','email','openid-connect','oidc-usermodel-property-mapper','','${email}','c25cee7f-8df5-489f-b9ed-b975cbface22'),('e15a7b6d-18da-42a9-8dae-883927088c11','username','openid-connect','oidc-usermodel-property-mapper','','${username}','0597168b-0a86-444e-b2e8-3d2606220a8d'),('e18a9fc2-4ebe-4335-9f9c-f5e4b7527902','given name','openid-connect','oidc-usermodel-property-mapper','','${givenName}','671d6609-8765-4980-8691-a3682a3a8618'),('e2b587ce-0f7c-4dfe-93f9-aa2b168020c3','full name','openid-connect','oidc-full-name-mapper','','${fullName}','e92d5e5c-27e7-4e3e-9b90-ab48beb68d94'),('e50ad93e-0cff-4fd6-ae75-2674e6412ab4','role list','saml','saml-role-list-mapper','\0',NULL,'3cfbbcd7-04c1-4f7b-a47f-e1f0650a376d'),('ea2d992d-19b2-4030-908a-fbacf3373b32','email','openid-connect','oidc-usermodel-property-mapper','','${email}','e92d5e5c-27e7-4e3e-9b90-ab48beb68d94'),('f0398816-6110-49b5-a890-6684dcb7871b','given name','openid-connect','oidc-usermodel-property-mapper','','${givenName}','da8bce91-af3e-4587-97fc-da09848d6a36'),('f3253d07-8ac5-4ff7-8969-6849cb1564a3','email','openid-connect','oidc-usermodel-property-mapper','','${email}','2d8808b6-c49c-4470-aff9-a9ac160199a8'),('f97d34d3-71e9-4b60-a12b-b1a24d34d90f','locale','openid-connect','oidc-usermodel-attribute-mapper','\0','${locale}','c25cee7f-8df5-489f-b9ed-b975cbface22'),('ff62e95f-97c3-46fa-ba2f-de0e5d569dad','email','openid-connect','oidc-usermodel-property-mapper','','${email}','da8bce91-af3e-4587-97fc-da09848d6a36');
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
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('040c26ab-b795-4eae-83d0-94f72a0f013c','true','access.token.claim'),('040c26ab-b795-4eae-83d0-94f72a0f013c','true','id.token.claim'),('06a0b1be-96e3-46e2-803c-aaf0c4f75a91','true','access.token.claim'),('06a0b1be-96e3-46e2-803c-aaf0c4f75a91','family_name','claim.name'),('06a0b1be-96e3-46e2-803c-aaf0c4f75a91','true','id.token.claim'),('06a0b1be-96e3-46e2-803c-aaf0c4f75a91','String','jsonType.label'),('06a0b1be-96e3-46e2-803c-aaf0c4f75a91','lastName','user.attribute'),('0759f701-304c-439b-80b5-d5990c713ab8','true','access.token.claim'),('0759f701-304c-439b-80b5-d5990c713ab8','preferred_username','claim.name'),('0759f701-304c-439b-80b5-d5990c713ab8','true','id.token.claim'),('0759f701-304c-439b-80b5-d5990c713ab8','String','jsonType.label'),('0759f701-304c-439b-80b5-d5990c713ab8','username','user.attribute'),('097c9dc0-7648-4d26-a988-4818640d5c95','true','access.token.claim'),('097c9dc0-7648-4d26-a988-4818640d5c95','email','claim.name'),('097c9dc0-7648-4d26-a988-4818640d5c95','true','id.token.claim'),('097c9dc0-7648-4d26-a988-4818640d5c95','String','jsonType.label'),('097c9dc0-7648-4d26-a988-4818640d5c95','email','user.attribute'),('09ec6850-b5bd-472e-bcf4-407dca214de7','true','access.token.claim'),('09ec6850-b5bd-472e-bcf4-407dca214de7','given_name','claim.name'),('09ec6850-b5bd-472e-bcf4-407dca214de7','true','id.token.claim'),('09ec6850-b5bd-472e-bcf4-407dca214de7','String','jsonType.label'),('09ec6850-b5bd-472e-bcf4-407dca214de7','firstName','user.attribute'),('0e2bf804-4b50-486d-91fa-95879b254f17','true','access.token.claim'),('0e2bf804-4b50-486d-91fa-95879b254f17','email','claim.name'),('0e2bf804-4b50-486d-91fa-95879b254f17','true','id.token.claim'),('0e2bf804-4b50-486d-91fa-95879b254f17','String','jsonType.label'),('0e2bf804-4b50-486d-91fa-95879b254f17','email','user.attribute'),('0e4ee310-f1b6-4417-82e2-42eede62d29a','true','access.token.claim'),('0e4ee310-f1b6-4417-82e2-42eede62d29a','family_name','claim.name'),('0e4ee310-f1b6-4417-82e2-42eede62d29a','true','id.token.claim'),('0e4ee310-f1b6-4417-82e2-42eede62d29a','String','jsonType.label'),('0e4ee310-f1b6-4417-82e2-42eede62d29a','lastName','user.attribute'),('1817c668-285f-4d6c-956a-7bcaa443172c','true','access.token.claim'),('1817c668-285f-4d6c-956a-7bcaa443172c','preferred_username','claim.name'),('1817c668-285f-4d6c-956a-7bcaa443172c','true','id.token.claim'),('1817c668-285f-4d6c-956a-7bcaa443172c','String','jsonType.label'),('1817c668-285f-4d6c-956a-7bcaa443172c','username','user.attribute'),('1a237113-e747-47fd-8710-3ec85218d299','true','access.token.claim'),('1a237113-e747-47fd-8710-3ec85218d299','family_name','claim.name'),('1a237113-e747-47fd-8710-3ec85218d299','true','id.token.claim'),('1a237113-e747-47fd-8710-3ec85218d299','String','jsonType.label'),('1a237113-e747-47fd-8710-3ec85218d299','lastName','user.attribute'),('1b39912e-03e7-4cd3-8245-5ec9aaa12430','true','access.token.claim'),('1b39912e-03e7-4cd3-8245-5ec9aaa12430','preferred_username','claim.name'),('1b39912e-03e7-4cd3-8245-5ec9aaa12430','true','id.token.claim'),('1b39912e-03e7-4cd3-8245-5ec9aaa12430','String','jsonType.label'),('1b39912e-03e7-4cd3-8245-5ec9aaa12430','username','user.attribute'),('1becb5b7-7eff-4fd3-a5c6-7c0a177176e2','true','access.token.claim'),('1becb5b7-7eff-4fd3-a5c6-7c0a177176e2','email','claim.name'),('1becb5b7-7eff-4fd3-a5c6-7c0a177176e2','true','id.token.claim'),('1becb5b7-7eff-4fd3-a5c6-7c0a177176e2','String','jsonType.label'),('1becb5b7-7eff-4fd3-a5c6-7c0a177176e2','email','user.attribute'),('1d5d3a86-32b0-4b08-894f-455e9b8f8dae','true','access.token.claim'),('1d5d3a86-32b0-4b08-894f-455e9b8f8dae','family_name','claim.name'),('1d5d3a86-32b0-4b08-894f-455e9b8f8dae','true','id.token.claim'),('1d5d3a86-32b0-4b08-894f-455e9b8f8dae','String','jsonType.label'),('1d5d3a86-32b0-4b08-894f-455e9b8f8dae','lastName','user.attribute'),('20133e7e-bb46-4bea-b213-0cff36130815','true','access.token.claim'),('20133e7e-bb46-4bea-b213-0cff36130815','given_name','claim.name'),('20133e7e-bb46-4bea-b213-0cff36130815','true','id.token.claim'),('20133e7e-bb46-4bea-b213-0cff36130815','String','jsonType.label'),('20133e7e-bb46-4bea-b213-0cff36130815','firstName','user.attribute'),('2a45b872-0bbc-476d-bd93-986cdbd0056f','Role','attribute.name'),('2a45b872-0bbc-476d-bd93-986cdbd0056f','Basic','attribute.nameformat'),('2a45b872-0bbc-476d-bd93-986cdbd0056f','false','single'),('2a6a25b1-56e1-4314-9a89-5515077d34ff','true','access.token.claim'),('2a6a25b1-56e1-4314-9a89-5515077d34ff','given_name','claim.name'),('2a6a25b1-56e1-4314-9a89-5515077d34ff','true','id.token.claim'),('2a6a25b1-56e1-4314-9a89-5515077d34ff','String','jsonType.label'),('2a6a25b1-56e1-4314-9a89-5515077d34ff','firstName','user.attribute'),('32f23cb1-4904-4021-8717-4e9c5f9ac430','true','access.token.claim'),('32f23cb1-4904-4021-8717-4e9c5f9ac430','true','id.token.claim'),('34e0fc24-110a-4a59-a6e0-62016a298a3e','true','access.token.claim'),('34e0fc24-110a-4a59-a6e0-62016a298a3e','true','id.token.claim'),('3bd10b79-5d0f-443f-b274-ef1f4a61e85d','true','access.token.claim'),('3bd10b79-5d0f-443f-b274-ef1f4a61e85d','preferred_username','claim.name'),('3bd10b79-5d0f-443f-b274-ef1f4a61e85d','true','id.token.claim'),('3bd10b79-5d0f-443f-b274-ef1f4a61e85d','String','jsonType.label'),('3bd10b79-5d0f-443f-b274-ef1f4a61e85d','username','user.attribute'),('40850ce6-6909-4245-b0a1-713e255f563a','true','access.token.claim'),('40850ce6-6909-4245-b0a1-713e255f563a','true','id.token.claim'),('49541fc1-1973-4f3c-ad30-b8da5cfbf2f9','true','access.token.claim'),('49541fc1-1973-4f3c-ad30-b8da5cfbf2f9','true','id.token.claim'),('4b0b82b1-80c0-4b44-b7c0-1b483a992c9f','true','access.token.claim'),('4b0b82b1-80c0-4b44-b7c0-1b483a992c9f','given_name','claim.name'),('4b0b82b1-80c0-4b44-b7c0-1b483a992c9f','true','id.token.claim'),('4b0b82b1-80c0-4b44-b7c0-1b483a992c9f','String','jsonType.label'),('4b0b82b1-80c0-4b44-b7c0-1b483a992c9f','firstName','user.attribute'),('4f457441-8b96-4ea5-a689-ea95f25862fc','true','access.token.claim'),('4f457441-8b96-4ea5-a689-ea95f25862fc','given_name','claim.name'),('4f457441-8b96-4ea5-a689-ea95f25862fc','true','id.token.claim'),('4f457441-8b96-4ea5-a689-ea95f25862fc','String','jsonType.label'),('4f457441-8b96-4ea5-a689-ea95f25862fc','firstName','user.attribute'),('58b3ceaa-3f5a-463c-a32b-60b5da9542c3','Role','attribute.name'),('58b3ceaa-3f5a-463c-a32b-60b5da9542c3','Basic','attribute.nameformat'),('58b3ceaa-3f5a-463c-a32b-60b5da9542c3','false','single'),('5c2c835a-88a9-4b92-a86b-a2a0cc0470b4','true','access.token.claim'),('5c2c835a-88a9-4b92-a86b-a2a0cc0470b4','true','id.token.claim'),('69ef2c59-302e-4618-9928-5d9ff8797f66','true','access.token.claim'),('69ef2c59-302e-4618-9928-5d9ff8797f66','family_name','claim.name'),('69ef2c59-302e-4618-9928-5d9ff8797f66','true','id.token.claim'),('69ef2c59-302e-4618-9928-5d9ff8797f66','String','jsonType.label'),('69ef2c59-302e-4618-9928-5d9ff8797f66','lastName','user.attribute'),('713df9b6-9020-43c0-9cd7-aacf1f8e8d44','true','access.token.claim'),('713df9b6-9020-43c0-9cd7-aacf1f8e8d44','true','id.token.claim'),('726a8b1f-c119-49e8-9279-2e684545e0e0','true','access.token.claim'),('726a8b1f-c119-49e8-9279-2e684545e0e0','email','claim.name'),('726a8b1f-c119-49e8-9279-2e684545e0e0','true','id.token.claim'),('726a8b1f-c119-49e8-9279-2e684545e0e0','String','jsonType.label'),('726a8b1f-c119-49e8-9279-2e684545e0e0','email','user.attribute'),('738b1f83-9f60-4467-99d7-05169000c350','Role','attribute.name'),('738b1f83-9f60-4467-99d7-05169000c350','Basic','attribute.nameformat'),('738b1f83-9f60-4467-99d7-05169000c350','false','single'),('770b2b45-fcd4-4d5a-9057-539230ecabfc','true','access.token.claim'),('770b2b45-fcd4-4d5a-9057-539230ecabfc','preferred_username','claim.name'),('770b2b45-fcd4-4d5a-9057-539230ecabfc','true','id.token.claim'),('770b2b45-fcd4-4d5a-9057-539230ecabfc','String','jsonType.label'),('770b2b45-fcd4-4d5a-9057-539230ecabfc','username','user.attribute'),('77c82e3f-2286-439e-b10d-cea024265a45','true','access.token.claim'),('77c82e3f-2286-439e-b10d-cea024265a45','true','id.token.claim'),('78b5463a-fe5b-4bf3-b2c8-eeacc446ccf4','true','access.token.claim'),('78b5463a-fe5b-4bf3-b2c8-eeacc446ccf4','email','claim.name'),('78b5463a-fe5b-4bf3-b2c8-eeacc446ccf4','true','id.token.claim'),('78b5463a-fe5b-4bf3-b2c8-eeacc446ccf4','String','jsonType.label'),('78b5463a-fe5b-4bf3-b2c8-eeacc446ccf4','email','user.attribute'),('7b38c7b0-be8e-4aa6-b5bc-00d6d4134292','Role','attribute.name'),('7b38c7b0-be8e-4aa6-b5bc-00d6d4134292','Basic','attribute.nameformat'),('7b38c7b0-be8e-4aa6-b5bc-00d6d4134292','false','single'),('7fdad45d-c2d5-47f2-9df7-7ff7187db951','true','access.token.claim'),('7fdad45d-c2d5-47f2-9df7-7ff7187db951','family_name','claim.name'),('7fdad45d-c2d5-47f2-9df7-7ff7187db951','true','id.token.claim'),('7fdad45d-c2d5-47f2-9df7-7ff7187db951','String','jsonType.label'),('7fdad45d-c2d5-47f2-9df7-7ff7187db951','lastName','user.attribute'),('85ed9c2b-c080-469d-a414-a7af9f55e778','true','access.token.claim'),('85ed9c2b-c080-469d-a414-a7af9f55e778','given_name','claim.name'),('85ed9c2b-c080-469d-a414-a7af9f55e778','true','id.token.claim'),('85ed9c2b-c080-469d-a414-a7af9f55e778','String','jsonType.label'),('85ed9c2b-c080-469d-a414-a7af9f55e778','firstName','user.attribute'),('8d8fbac2-99b2-40b2-9124-f3374270019c','true','access.token.claim'),('8d8fbac2-99b2-40b2-9124-f3374270019c','given_name','claim.name'),('8d8fbac2-99b2-40b2-9124-f3374270019c','true','id.token.claim'),('8d8fbac2-99b2-40b2-9124-f3374270019c','String','jsonType.label'),('8d8fbac2-99b2-40b2-9124-f3374270019c','firstName','user.attribute'),('8d916ecc-ba26-417e-9b5f-fce96a595c4b','true','access.token.claim'),('8d916ecc-ba26-417e-9b5f-fce96a595c4b','true','id.token.claim'),('92acd276-8be7-4a10-b985-08b7aaeb42a4','true','access.token.claim'),('92acd276-8be7-4a10-b985-08b7aaeb42a4','preferred_username','claim.name'),('92acd276-8be7-4a10-b985-08b7aaeb42a4','true','id.token.claim'),('92acd276-8be7-4a10-b985-08b7aaeb42a4','String','jsonType.label'),('92acd276-8be7-4a10-b985-08b7aaeb42a4','username','user.attribute'),('95918b5a-5f86-40aa-84c5-9389894b3a53','true','access.token.claim'),('95918b5a-5f86-40aa-84c5-9389894b3a53','preferred_username','claim.name'),('95918b5a-5f86-40aa-84c5-9389894b3a53','true','id.token.claim'),('95918b5a-5f86-40aa-84c5-9389894b3a53','String','jsonType.label'),('95918b5a-5f86-40aa-84c5-9389894b3a53','username','user.attribute'),('99762252-de14-4b0a-b067-3d59d67e60f5','Role','attribute.name'),('99762252-de14-4b0a-b067-3d59d67e60f5','Basic','attribute.nameformat'),('99762252-de14-4b0a-b067-3d59d67e60f5','false','single'),('9aacf9c7-9e56-4874-9128-05329fe2808e','true','access.token.claim'),('9aacf9c7-9e56-4874-9128-05329fe2808e','given_name','claim.name'),('9aacf9c7-9e56-4874-9128-05329fe2808e','true','id.token.claim'),('9aacf9c7-9e56-4874-9128-05329fe2808e','String','jsonType.label'),('9aacf9c7-9e56-4874-9128-05329fe2808e','firstName','user.attribute'),('9bcd6688-ccd3-4c4d-9632-06d6426891d7','true','access.token.claim'),('9bcd6688-ccd3-4c4d-9632-06d6426891d7','family_name','claim.name'),('9bcd6688-ccd3-4c4d-9632-06d6426891d7','true','id.token.claim'),('9bcd6688-ccd3-4c4d-9632-06d6426891d7','String','jsonType.label'),('9bcd6688-ccd3-4c4d-9632-06d6426891d7','lastName','user.attribute'),('9e0ec59c-1b59-4580-b874-3945829875c6','true','access.token.claim'),('9e0ec59c-1b59-4580-b874-3945829875c6','preferred_username','claim.name'),('9e0ec59c-1b59-4580-b874-3945829875c6','true','id.token.claim'),('9e0ec59c-1b59-4580-b874-3945829875c6','String','jsonType.label'),('9e0ec59c-1b59-4580-b874-3945829875c6','username','user.attribute'),('9f007202-1ca1-4e24-998c-62082c256bd9','Role','attribute.name'),('9f007202-1ca1-4e24-998c-62082c256bd9','Basic','attribute.nameformat'),('9f007202-1ca1-4e24-998c-62082c256bd9','false','single'),('a0ece8b4-28d0-4378-bd66-f2b87b1192aa','true','access.token.claim'),('a0ece8b4-28d0-4378-bd66-f2b87b1192aa','locale','claim.name'),('a0ece8b4-28d0-4378-bd66-f2b87b1192aa','true','id.token.claim'),('a0ece8b4-28d0-4378-bd66-f2b87b1192aa','String','jsonType.label'),('a0ece8b4-28d0-4378-bd66-f2b87b1192aa','locale','user.attribute'),('a658f442-0419-47b4-b1c2-a2535896d34c','Role','attribute.name'),('a658f442-0419-47b4-b1c2-a2535896d34c','Basic','attribute.nameformat'),('a658f442-0419-47b4-b1c2-a2535896d34c','false','single'),('a8ed8b6f-c045-4b57-8d34-6685496e9508','Role','attribute.name'),('a8ed8b6f-c045-4b57-8d34-6685496e9508','Basic','attribute.nameformat'),('a8ed8b6f-c045-4b57-8d34-6685496e9508','false','single'),('ab664110-4e77-4be5-b029-c2b532e36319','true','access.token.claim'),('ab664110-4e77-4be5-b029-c2b532e36319','family_name','claim.name'),('ab664110-4e77-4be5-b029-c2b532e36319','true','id.token.claim'),('ab664110-4e77-4be5-b029-c2b532e36319','String','jsonType.label'),('ab664110-4e77-4be5-b029-c2b532e36319','lastName','user.attribute'),('ac5ce846-92dc-465d-9e07-ed91b3614d73','true','access.token.claim'),('ac5ce846-92dc-465d-9e07-ed91b3614d73','email','claim.name'),('ac5ce846-92dc-465d-9e07-ed91b3614d73','true','id.token.claim'),('ac5ce846-92dc-465d-9e07-ed91b3614d73','String','jsonType.label'),('ac5ce846-92dc-465d-9e07-ed91b3614d73','email','user.attribute'),('ae1f7e7e-33ca-431a-b28e-02ec1fd1e39d','true','access.token.claim'),('ae1f7e7e-33ca-431a-b28e-02ec1fd1e39d','email','claim.name'),('ae1f7e7e-33ca-431a-b28e-02ec1fd1e39d','true','id.token.claim'),('ae1f7e7e-33ca-431a-b28e-02ec1fd1e39d','String','jsonType.label'),('ae1f7e7e-33ca-431a-b28e-02ec1fd1e39d','email','user.attribute'),('aed47b20-a0b3-4037-b47e-2da53f022029','true','access.token.claim'),('aed47b20-a0b3-4037-b47e-2da53f022029','email','claim.name'),('aed47b20-a0b3-4037-b47e-2da53f022029','true','id.token.claim'),('aed47b20-a0b3-4037-b47e-2da53f022029','String','jsonType.label'),('aed47b20-a0b3-4037-b47e-2da53f022029','email','user.attribute'),('af7caac0-54ab-4cf7-9360-a400d47b725f','true','access.token.claim'),('af7caac0-54ab-4cf7-9360-a400d47b725f','preferred_username','claim.name'),('af7caac0-54ab-4cf7-9360-a400d47b725f','true','id.token.claim'),('af7caac0-54ab-4cf7-9360-a400d47b725f','String','jsonType.label'),('af7caac0-54ab-4cf7-9360-a400d47b725f','username','user.attribute'),('b38ac1a7-778b-4eba-bc63-b9a983791ef3','true','access.token.claim'),('b38ac1a7-778b-4eba-bc63-b9a983791ef3','preferred_username','claim.name'),('b38ac1a7-778b-4eba-bc63-b9a983791ef3','true','id.token.claim'),('b38ac1a7-778b-4eba-bc63-b9a983791ef3','String','jsonType.label'),('b38ac1a7-778b-4eba-bc63-b9a983791ef3','username','user.attribute'),('b6b9fdf6-263e-4746-95b1-655d524d93d1','Role','attribute.name'),('b6b9fdf6-263e-4746-95b1-655d524d93d1','Basic','attribute.nameformat'),('b6b9fdf6-263e-4746-95b1-655d524d93d1','false','single'),('b7c32179-e396-468e-a3f1-1b219fec61a3','true','access.token.claim'),('b7c32179-e396-468e-a3f1-1b219fec61a3','given_name','claim.name'),('b7c32179-e396-468e-a3f1-1b219fec61a3','true','id.token.claim'),('b7c32179-e396-468e-a3f1-1b219fec61a3','String','jsonType.label'),('b7c32179-e396-468e-a3f1-1b219fec61a3','firstName','user.attribute'),('b85e9181-43b7-4d14-b680-bbffd3be5dbf','true','access.token.claim'),('b85e9181-43b7-4d14-b680-bbffd3be5dbf','given_name','claim.name'),('b85e9181-43b7-4d14-b680-bbffd3be5dbf','true','id.token.claim'),('b85e9181-43b7-4d14-b680-bbffd3be5dbf','String','jsonType.label'),('b85e9181-43b7-4d14-b680-bbffd3be5dbf','firstName','user.attribute'),('bf934af0-3339-44d3-b202-099ba90a98b7','Role','attribute.name'),('bf934af0-3339-44d3-b202-099ba90a98b7','Basic','attribute.nameformat'),('bf934af0-3339-44d3-b202-099ba90a98b7','false','single'),('c476888a-3b87-4b35-badb-284507380f95','true','access.token.claim'),('c476888a-3b87-4b35-badb-284507380f95','family_name','claim.name'),('c476888a-3b87-4b35-badb-284507380f95','true','id.token.claim'),('c476888a-3b87-4b35-badb-284507380f95','String','jsonType.label'),('c476888a-3b87-4b35-badb-284507380f95','lastName','user.attribute'),('c4f88321-02f1-4792-b81d-79b9d1617b8a','Role','attribute.name'),('c4f88321-02f1-4792-b81d-79b9d1617b8a','Basic','attribute.nameformat'),('c4f88321-02f1-4792-b81d-79b9d1617b8a','false','single'),('ce3f5a8d-2ff6-405a-828c-fd127b70370e','true','access.token.claim'),('ce3f5a8d-2ff6-405a-828c-fd127b70370e','family_name','claim.name'),('ce3f5a8d-2ff6-405a-828c-fd127b70370e','true','id.token.claim'),('ce3f5a8d-2ff6-405a-828c-fd127b70370e','String','jsonType.label'),('ce3f5a8d-2ff6-405a-828c-fd127b70370e','lastName','user.attribute'),('d04b3d86-5967-4aba-9936-5413db415ccc','true','access.token.claim'),('d04b3d86-5967-4aba-9936-5413db415ccc','family_name','claim.name'),('d04b3d86-5967-4aba-9936-5413db415ccc','true','id.token.claim'),('d04b3d86-5967-4aba-9936-5413db415ccc','String','jsonType.label'),('d04b3d86-5967-4aba-9936-5413db415ccc','lastName','user.attribute'),('d21a59b8-a627-4518-b6f0-31922607ddca','true','access.token.claim'),('d21a59b8-a627-4518-b6f0-31922607ddca','true','id.token.claim'),('d6c43115-ebce-45a1-8a11-2fb08010dbb3','true','access.token.claim'),('d6c43115-ebce-45a1-8a11-2fb08010dbb3','family_name','claim.name'),('d6c43115-ebce-45a1-8a11-2fb08010dbb3','true','id.token.claim'),('d6c43115-ebce-45a1-8a11-2fb08010dbb3','String','jsonType.label'),('d6c43115-ebce-45a1-8a11-2fb08010dbb3','lastName','user.attribute'),('d7a8ac94-0d81-4afd-b330-32ae21394795','true','access.token.claim'),('d7a8ac94-0d81-4afd-b330-32ae21394795','preferred_username','claim.name'),('d7a8ac94-0d81-4afd-b330-32ae21394795','true','id.token.claim'),('d7a8ac94-0d81-4afd-b330-32ae21394795','String','jsonType.label'),('d7a8ac94-0d81-4afd-b330-32ae21394795','username','user.attribute'),('dfcb4a51-a4fb-43b7-942d-59ea86595b3b','true','access.token.claim'),('dfcb4a51-a4fb-43b7-942d-59ea86595b3b','true','id.token.claim'),('dff3c477-3ebc-41e1-8cdb-6da614ab3f55','true','access.token.claim'),('dff3c477-3ebc-41e1-8cdb-6da614ab3f55','email','claim.name'),('dff3c477-3ebc-41e1-8cdb-6da614ab3f55','true','id.token.claim'),('dff3c477-3ebc-41e1-8cdb-6da614ab3f55','String','jsonType.label'),('dff3c477-3ebc-41e1-8cdb-6da614ab3f55','email','user.attribute'),('e15a7b6d-18da-42a9-8dae-883927088c11','true','access.token.claim'),('e15a7b6d-18da-42a9-8dae-883927088c11','preferred_username','claim.name'),('e15a7b6d-18da-42a9-8dae-883927088c11','true','id.token.claim'),('e15a7b6d-18da-42a9-8dae-883927088c11','String','jsonType.label'),('e15a7b6d-18da-42a9-8dae-883927088c11','username','user.attribute'),('e18a9fc2-4ebe-4335-9f9c-f5e4b7527902','true','access.token.claim'),('e18a9fc2-4ebe-4335-9f9c-f5e4b7527902','given_name','claim.name'),('e18a9fc2-4ebe-4335-9f9c-f5e4b7527902','true','id.token.claim'),('e18a9fc2-4ebe-4335-9f9c-f5e4b7527902','String','jsonType.label'),('e18a9fc2-4ebe-4335-9f9c-f5e4b7527902','firstName','user.attribute'),('e2b587ce-0f7c-4dfe-93f9-aa2b168020c3','true','access.token.claim'),('e2b587ce-0f7c-4dfe-93f9-aa2b168020c3','true','id.token.claim'),('e50ad93e-0cff-4fd6-ae75-2674e6412ab4','Role','attribute.name'),('e50ad93e-0cff-4fd6-ae75-2674e6412ab4','Basic','attribute.nameformat'),('e50ad93e-0cff-4fd6-ae75-2674e6412ab4','false','single'),('ea2d992d-19b2-4030-908a-fbacf3373b32','true','access.token.claim'),('ea2d992d-19b2-4030-908a-fbacf3373b32','email','claim.name'),('ea2d992d-19b2-4030-908a-fbacf3373b32','true','id.token.claim'),('ea2d992d-19b2-4030-908a-fbacf3373b32','String','jsonType.label'),('ea2d992d-19b2-4030-908a-fbacf3373b32','email','user.attribute'),('f0398816-6110-49b5-a890-6684dcb7871b','true','access.token.claim'),('f0398816-6110-49b5-a890-6684dcb7871b','given_name','claim.name'),('f0398816-6110-49b5-a890-6684dcb7871b','true','id.token.claim'),('f0398816-6110-49b5-a890-6684dcb7871b','String','jsonType.label'),('f0398816-6110-49b5-a890-6684dcb7871b','firstName','user.attribute'),('f3253d07-8ac5-4ff7-8969-6849cb1564a3','true','access.token.claim'),('f3253d07-8ac5-4ff7-8969-6849cb1564a3','email','claim.name'),('f3253d07-8ac5-4ff7-8969-6849cb1564a3','true','id.token.claim'),('f3253d07-8ac5-4ff7-8969-6849cb1564a3','String','jsonType.label'),('f3253d07-8ac5-4ff7-8969-6849cb1564a3','email','user.attribute'),('f97d34d3-71e9-4b60-a12b-b1a24d34d90f','true','access.token.claim'),('f97d34d3-71e9-4b60-a12b-b1a24d34d90f','locale','claim.name'),('f97d34d3-71e9-4b60-a12b-b1a24d34d90f','true','id.token.claim'),('f97d34d3-71e9-4b60-a12b-b1a24d34d90f','String','jsonType.label'),('f97d34d3-71e9-4b60-a12b-b1a24d34d90f','locale','user.attribute'),('ff62e95f-97c3-46fa-ba2f-de0e5d569dad','true','access.token.claim'),('ff62e95f-97c3-46fa-ba2f-de0e5d569dad','email','claim.name'),('ff62e95f-97c3-46fa-ba2f-de0e5d569dad','true','id.token.claim'),('ff62e95f-97c3-46fa-ba2f-de0e5d569dad','String','jsonType.label'),('ff62e95f-97c3-46fa-ba2f-de0e5d569dad','email','user.attribute');
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
INSERT INTO `REALM` VALUES ('itesoft',60,300,300,NULL,NULL,NULL,'','\0',0,NULL,'itesoft',0,NULL,'MIIEpAIBAAKCAQEAmlnPWINc7JNlQ60TyiifUPQHThvz+aExOvLrQnF+F0g1h1oco8TzI4/6p216nzy+nMUxeDXH7ky0cws29y3uUMwC9UrzJgz7sbDcwVI41nAXD8nhnWy7a2D88jNRm6FB0abzSXqTF1wGnbIUHOhDf9e/NDD4L14u8PLm6lucuI7/MYC33CXMw02thi2OwvbOXcM68WF+DLNouHgT3EwqJ/H0nQRQhPYxQKQv0sTcoVtXyXyGjiCkFuC+3VfvLFHpbXZFsiuSfxC7Sq9CEc7wdTCupsdanA0Kr11leEqCj0XEUg3EE1LIHHQGTHLcnXpiDrSdXQDO9cTlhIcXhHSm3QIDAQABAoIBAQCJ0n3RpGKaIDcAyg/sqH8xkuTe+xjMIwHJiFVHm/2iHmkltfHyzg7pB0wiqiAfBeeSJoY4t5URlM5gF3h6GDo/TRurGcSpilhIXwuPV7LGz4nYIETkA84KYK0cO3S4SbJy2OdOCjRDXHnP384TzdVP1z61BLDn4up5XfuQ8kKrjCfpCAiHcNPyrJHf8biNP3Pi4kVIJJC+Bary5/KyC10EZWovelxlHCChbbvI0pd1pwUgTNCpNisGMfV2RtgBPAj6mvDgT+7UO6iUxKbRVZF97eVvvCzozTRpBlBkRJ4L2icIRHTrJKB9QdiPImsnibxWNT2vXjpCjKLihWnI5n4BAoGBANegrbC8Ohhn7F3V/5sOjDQeMyeCLmCa4YnHgeNtfXyMIIQAnGP0rJl4vXSTDsDouDi5816X8lQLqOljoG4B1/wXdwZX3f6AS92uY2BnHcqUuNCx+zwXcIBZdduBQEog/4Ns7rSousvDpRI5z+KESv6YfzCVlpq/rtNB4jeKiO1dAoGBALdADROzIWN0U5OtPdNNR5rR5OHR1wL+L/Tfi/GhZCEEbVvIorhLFAkEJJnk5XroewmTTOd867miEtJNhLayuXjoAFNuZ8b6AvpML9VE4izmfG2czrBNoWL1VvWZxJ0xwBRFkkiC+/3lYuDoVXl0DAmccejFdJUNx1bCA9WD3YeBAoGBAIMAU4X0VTdOrAO2Z7xEclmXn2x5YsO+VRfn5bnOY1avq3GHDXyMwe/bsv6H+Yap3IJaNslZdxgonU5uAKHU7OtzNhTcfTqJp43ezPFctHTHNiFUgFZZxzezIi9hrzVaJuIp5DxN5m61Rix0gyATT5yt+VgDCaSqoAQpGs6zk8zhAoGAO6OD3gJxfl2wiaJbObav9CoVdI0HjfjOAML0V6pv3PME6Fcu5g3BMoH/q3o8WTjqOh6Pa9NTIHIn7/u8kn0uMbRHzt9itPZPG8jJ1H37oiNNIZtkBSruuDcimwH1ZDd5zN8rkZ/XhTUvbgUPNFzZQhOBWwFQROZcFtdDyiyFX4ECgYAD1j5DheFzvi/wPjVa3Ogg8z9cXJiUlg4yWujcGKHJSIIvyGAzCBBWBoPM/QhNOVLftHil9D9tdG0ABxKFjj++fWlhr1oKOFufCXQHlgyuGup8brkWjQEARC4/dFnjkJo73Nq6YYFOl7/7i67wf61X3V9EaRvutlNo32lZEahKQg==','MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAmlnPWINc7JNlQ60TyiifUPQHThvz+aExOvLrQnF+F0g1h1oco8TzI4/6p216nzy+nMUxeDXH7ky0cws29y3uUMwC9UrzJgz7sbDcwVI41nAXD8nhnWy7a2D88jNRm6FB0abzSXqTF1wGnbIUHOhDf9e/NDD4L14u8PLm6lucuI7/MYC33CXMw02thi2OwvbOXcM68WF+DLNouHgT3EwqJ/H0nQRQhPYxQKQv0sTcoVtXyXyGjiCkFuC+3VfvLFHpbXZFsiuSfxC7Sq9CEc7wdTCupsdanA0Kr11leEqCj0XEUg3EE1LIHHQGTHLcnXpiDrSdXQDO9cTlhIcXhHSm3QIDAQAB','\0','\0','\0','\0','EXTERNAL',1800,36000,'\0','\0','e92d5e5c-27e7-4e3e-9b90-ab48beb68d94','MIICnTCCAYUCBgFRgT8lODANBgkqhkiG9w0BAQsFADASMRAwDgYDVQQDDAdpdGVzb2Z0MB4XDTE1MTIwODEwNTc1N1oXDTI1MTIwODEwNTkzN1owEjEQMA4GA1UEAwwHaXRlc29mdDCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAJpZz1iDXOyTZUOtE8oon1D0B04b8/mhMTry60JxfhdINYdaHKPE8yOP+qdtep88vpzFMXg1x+5MtHMLNvct7lDMAvVK8yYM+7Gw3MFSONZwFw/J4Z1su2tg/PIzUZuhQdGm80l6kxdcBp2yFBzoQ3/XvzQw+C9eLvDy5upbnLiO/zGAt9wlzMNNrYYtjsL2zl3DOvFhfgyzaLh4E9xMKifx9J0EUIT2MUCkL9LE3KFbV8l8ho4gpBbgvt1X7yxR6W12RbIrkn8Qu0qvQhHO8HUwrqbHWpwNCq9dZXhKgo9FxFINxBNSyBx0Bkxy3J16Yg60nV0AzvXE5YSHF4R0pt0CAwEAATANBgkqhkiG9w0BAQsFAAOCAQEAdFtHwkAZSISlxCwHUAQnTJGEI6+7f1Xhvwv5ceNCR5ZO730GmY14V/0izOg3kqpq+3grUCzKLXsFcvzEY8ChvwBkIDMfQ/LBQqPhl5pI4+qypyd6YrChiImnCv95acczSx+BjeFHjxMq++jWddqi2bZoYuI7uoGYDAnuBfoLP++4Ai6FVZ7VK+gA4opOfQlC+T06ayACO/RcKKbo7K6R8/BzlOkhTtMrhDeyoMs3GQ4o1vwY7Q9Qagfu4o+cVB2yK/FRWfDtALKYUoasilvD9XVIDlBUaWDuG+GEVUKTKI7D2pm9plsLdu12x/YkuS706h4zRijaZ/kBQ26tuGNS3g==','e6c4f413-c250-47d5-8054-0385d00b1bce',1800,'\0',NULL,'\0','\0','\0','\0',0,1,30,6,'HmacSHA1','totp','b381c1c2-8e16-41c5-af4c-98cd17d0991b','69f5a49d-217f-48cd-9295-1baac23af6df','0c989114-37b7-4375-96dd-d834692cee13','55a04cb3-5c4f-4629-938e-e91153876409','62c4ba0a-185d-42f3-aa3b-15a2d1afe924',2592000,'\0',900),('master',60,300,60,NULL,NULL,NULL,'','\0',0,NULL,'master',0,NULL,'MIIEpAIBAAKCAQEAhsf4Wu4prUqd7ajHGZOpuekmFZtZecWB0Sny5txAciuOIUyR/nnW3lE0D367MufCNs9LbpsGCsIWKsx2fVrRdeR749sSPAIRS9TGtAOySFtEQanZRAKp7rvW1f63llyPBRPRxuUszr544v8mdSI7637GTkMVUkkXZvlKbogsY+gNNgb+RdPakLzvKnJLhSjX6iXS4igvfS9U34dsPs8n7tM0wFE3FngizPbwd2j8gGzke/+U2MS6oMdbJU1fTJ5em+FjgCpcTt241wLMckrErs5bgCJpr+lojWdrZ/cegDNIcHZDGj1KrKb7e7YCcJIc07IoFyANedoxvZeJAmshSQIDAQABAoIBAHQ8sWt6SmcxGtKD5HGib5XuBPJNb/Uc6MBCtUF0YgAUoBcHukEFQtGopoVWfouAZHZwgFV7TNKqYAO5IdcqI8rQqifwHuGxxsjnUBafuXm9fDhFCyMkSPmi9bzIV/xNBusSFLC7pNEIY6kg80HBrHuEcfG82P6GGrCr/g0lU2M01Os2m0nR6dB7bzekcWlGpLWdJFD/KIM/94KdktNu7P4fBe4iJtq2UCWc7eHNRO1SHFHLcREmoiOaL9ooqW4uJZanr6fwSs7qWU2NO9IWnQ1xBNsRWI0tzrjuEBB+tlI3P13kQ5cdBMCaIykvRKoQE/ybHmFjBvxEjyyrKqH9fIECgYEAvvaZ0Po6Dg5apdhKGVCHvO9zSu0V22ADypJBIQ+G3Qwidy1GXUIq9UAgmHkW0ZD0oF5y5kjO7TIQvWMQ7aRg9QnqE21fetDlJ3clftLneiaLZ1Lrq6y7Em03kw97kOr86hL70FBXgM5czmmhYVfmtfqp+aVvO9gPprJTd9Bfmg0CgYEAtK8M6E1RBckzEtiJMTzRc7MNb5RhiAcZzxBpvjnkLGOYoDyoagW9IYnhFvUaXyNmGtzDM9mXSWsbQuXjlGAiXTE7JvwSy3b9kTrgDQTMaaPFybDTze0fEFfJL9wOrB/uSkSIP0iSgMsN0+rmS2UIBvLoY8w8SRoTQEklBFhPAS0CgYEAn5lQYsTPAnJitlr3SwLv/ysM66EMdGVhpcroXe4xI8uBfqM7PLQRXRm0ZFpHhOymVuW5F9fgAYOnU/FY85Q/aGxZ0tTFSMsPyhUdJEq2JXPTbI5z4u4hBzx6hxEYj7yllig5hxeumjteezDzLH0fmBYgO0JVnels40AE3I0taX0CgYACboCr965pd4W6cTOXeAwRlI1PvR166S2NvdjOeJT7i/OX5HkXxDABbYub9Xx/X0iWf/YYkosYr9pUEif37TtJKcp0Adx25IkRFUvCoRfnLA8TYc/X66MJY0UP4dRIuL1KPpXe1Ck0lob/HSAwT5HGFirOfQcqrLEpolJfNpkJmQKBgQCXRDgNRAWe3z7Xe24ZxKOs8V+Ap5KcRImiumrKWnO/IOm6nmneF2mCdIkO0s+nnoa3oMLkID5bfCPClq3mS1zUkUpirxRUfxkqhZhevmFcFcYC8cjWCv9aTMAdbGBdApTJ08hQU1SUn0IrSXdcpBkIYiZvlcrI7kGXG3spUI1cOA==','MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAhsf4Wu4prUqd7ajHGZOpuekmFZtZecWB0Sny5txAciuOIUyR/nnW3lE0D367MufCNs9LbpsGCsIWKsx2fVrRdeR749sSPAIRS9TGtAOySFtEQanZRAKp7rvW1f63llyPBRPRxuUszr544v8mdSI7637GTkMVUkkXZvlKbogsY+gNNgb+RdPakLzvKnJLhSjX6iXS4igvfS9U34dsPs8n7tM0wFE3FngizPbwd2j8gGzke/+U2MS6oMdbJU1fTJ5em+FjgCpcTt241wLMckrErs5bgCJpr+lojWdrZ/cegDNIcHZDGj1KrKb7e7YCcJIc07IoFyANedoxvZeJAmshSQIDAQAB','\0','\0','\0','\0','EXTERNAL',1800,36000,'\0','\0','445d67a2-850e-4e89-9a98-5ade588abba0','MIICmzCCAYMCBgFRgTRx2zANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZtYXN0ZXIwHhcNMTUxMjA4MTA0NjE2WhcNMjUxMjA4MTA0NzU2WjARMQ8wDQYDVQQDDAZtYXN0ZXIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCGx/ha7imtSp3tqMcZk6m56SYVm1l5xYHRKfLm3EByK44hTJH+edbeUTQPfrsy58I2z0tumwYKwhYqzHZ9WtF15Hvj2xI8AhFL1Ma0A7JIW0RBqdlEAqnuu9bV/reWXI8FE9HG5SzOvnji/yZ1IjvrfsZOQxVSSRdm+UpuiCxj6A02Bv5F09qQvO8qckuFKNfqJdLiKC99L1Tfh2w+zyfu0zTAUTcWeCLM9vB3aPyAbOR7/5TYxLqgx1slTV9Mnl6b4WOAKlxO3bjXAsxySsSuzluAImmv6WiNZ2tn9x6AM0hwdkMaPUqspvt7tgJwkhzTsigXIA152jG9l4kCayFJAgMBAAEwDQYJKoZIhvcNAQELBQADggEBAE89flZeiNEEerkJQ+X9y9kHsyTUurKSIWcUjzKKTs3Pvnqd4pDjsippDpTiWjtuC7aIYTxCpVao0vpX8CkWmKmO9e6razoKJqLxlc2oQEc4YsRlAB1jQ14sR2u25K3O23ACD4z9UYEA942agvXI7f0p/QZiEgLTTYdgrH4jcDC3tnyS/t2cGraWyucZTW/exnqU1Qud52mh6H9onkzZEQ9QjeGk6W3JceR5fovqQQvSsNlrhpBEC0E7hX1sRf9v0PBuCfYiaxgroW0NTuSc83TVN0cuU2C2TXftxBDhy8Dd6wF5A7F0eCKlgjYmFl2+NQX4A1ShaADdJP6ZoUFlnsk=','d667aa8b-040f-408a-9a50-56e8ffa431ad',1800,'\0',NULL,'\0','\0','\0','\0',0,1,30,6,'HmacSHA1','totp','d211e471-d55b-4e0d-8d24-580fc9e4d66d','002f48f0-fed1-445c-b465-5962114555f3','9d9c283d-c94e-42be-92a3-08649138fade','ccdcec55-63ec-4592-b0a5-64b377f4ac5f','85333aa4-5386-457e-8507-4bf4a5db4949',2592000,'\0',900);
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
INSERT INTO `REALM_CLIENT` VALUES ('master','0597168b-0a86-444e-b2e8-3d2606220a8d'),('master','21a5f930-582b-47f2-af00-5fb44ab71203'),('master','2d8808b6-c49c-4470-aff9-a9ac160199a8'),('master','445d67a2-850e-4e89-9a98-5ade588abba0'),('master','671d6609-8765-4980-8691-a3682a3a8618'),('master','e92d5e5c-27e7-4e3e-9b90-ab48beb68d94'),('itesoft','da8bce91-af3e-4587-97fc-da09848d6a36'),('itesoft','3cfbbcd7-04c1-4f7b-a47f-e1f0650a376d'),('itesoft','81f8ee23-e869-4042-bb97-9bbe0d38a70e'),('itesoft','c25cee7f-8df5-489f-b9ed-b975cbface22'),('itesoft','d588228f-3d61-4e9e-87e7-581162ee0d2b'),('itesoft','3f3d428d-00c8-4f2c-82c1-200507448c16');
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
INSERT INTO `REALM_DEFAULT_ROLES` VALUES ('itesoft','2ad1bb3c-68f3-4bdc-a61a-0227ea932224'),('master','85d234e5-3e4d-4e11-8c60-601b203d540a');
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
INSERT INTO `REDIRECT_URIS` VALUES ('0597168b-0a86-444e-b2e8-3d2606220a8d','/auth/realms/master/account/*'),('2d8808b6-c49c-4470-aff9-a9ac160199a8','/auth/admin/master/console/*'),('3cfbbcd7-04c1-4f7b-a47f-e1f0650a376d','/auth/realms/itesoft/account/*'),('c25cee7f-8df5-489f-b9ed-b975cbface22','/auth/admin/itesoft/console/*'),('3f3d428d-00c8-4f2c-82c1-200507448c16','http://localhost/*');
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
INSERT INTO `REQUIRED_ACTION_PROVIDER` VALUES ('3834b19d-e67b-4984-a463-45888789c146','VERIFY_EMAIL','Verify Email','master','','\0','VERIFY_EMAIL'),('5c0d7868-5399-484d-9230-6944f48c86b8','VERIFY_EMAIL','Verify Email','itesoft','','\0','VERIFY_EMAIL'),('5dfe2850-b748-4eeb-bbe1-0326751db402','CONFIGURE_TOTP','Configure Totp','itesoft','','\0','CONFIGURE_TOTP'),('659575f0-096c-4f36-a9ad-093ba0565c8a','terms_and_conditions','Terms and Conditions','master','\0','\0','terms_and_conditions'),('6a139690-b6e7-485d-be10-759c4f136524','CONFIGURE_TOTP','Configure Totp','master','','\0','CONFIGURE_TOTP'),('aa6b9fdc-feab-4a27-92c1-99b87cac69d1','terms_and_conditions','Terms and Conditions','itesoft','\0','\0','terms_and_conditions'),('ba16d5a6-1c23-4093-9e0e-06fabe9e7868','UPDATE_PASSWORD','Update Password','master','','\0','UPDATE_PASSWORD'),('c237f58c-9360-4547-8a70-b014fd69818b','UPDATE_PASSWORD','Update Password','itesoft','','\0','UPDATE_PASSWORD'),('e8d7bc61-0ea9-4a2b-828f-c97e01fab2c1','UPDATE_PROFILE','Update Profile','itesoft','','\0','UPDATE_PROFILE'),('fd95d01a-7516-45f0-a4e8-1edbdaefb2a6','UPDATE_PROFILE','Update Profile','master','','\0','UPDATE_PROFILE');
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
INSERT INTO `SCOPE_MAPPING` VALUES ('21a5f930-582b-47f2-af00-5fb44ab71203','18aeb7d6-96c6-4148-88d9-cb2c95367172'),('2d8808b6-c49c-4470-aff9-a9ac160199a8','18aeb7d6-96c6-4148-88d9-cb2c95367172'),('c25cee7f-8df5-489f-b9ed-b975cbface22','f57beeda-fd7a-4049-9d86-45c61c69608f'),('d588228f-3d61-4e9e-87e7-581162ee0d2b','f57beeda-fd7a-4049-9d86-45c61c69608f');
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
INSERT INTO `USER_ENTITY` VALUES ('6ed83869-d0ad-4731-ab63-626f7e0088f9',NULL,'0610a91f-2e51-4d73-b440-039aa4ac0e1e','\0','',NULL,NULL,NULL,'master','\0','admin',1449571677647,NULL),('b9f01f0a-ad60-4c48-8f66-0697721d7d44','john.doe@itesoft.com','john.doe@itesoft.com','','',NULL,'John','Doe','itesoft','\0','john',1449572697655,NULL);
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
INSERT INTO `USER_ROLE_MAPPING` VALUES ('18aeb7d6-96c6-4148-88d9-cb2c95367172','6ed83869-d0ad-4731-ab63-626f7e0088f9'),('1c30ac40-8804-49bb-8152-e0e805b97818','6ed83869-d0ad-4731-ab63-626f7e0088f9'),('85d234e5-3e4d-4e11-8c60-601b203d540a','6ed83869-d0ad-4731-ab63-626f7e0088f9'),('e599c208-ad50-41b5-9bb6-b20f575f832c','6ed83869-d0ad-4731-ab63-626f7e0088f9'),('2ad1bb3c-68f3-4bdc-a61a-0227ea932224','b9f01f0a-ad60-4c48-8f66-0697721d7d44'),('890d663a-eed6-4a17-8c75-0df9527f2e72','b9f01f0a-ad60-4c48-8f66-0697721d7d44'),('cddfa7e4-05f2-4ce9-a889-694dd2bd5954','b9f01f0a-ad60-4c48-8f66-0697721d7d44');
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
INSERT INTO `WEB_ORIGINS` VALUES ('3f3d428d-00c8-4f2c-82c1-200507448c16','http://localhost');
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

-- Dump completed on 2015-12-08 11:08:51
commit;
