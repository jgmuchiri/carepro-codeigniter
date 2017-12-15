-- MySQL dump 10.13  Distrib 5.7.18, for Win64 (x86_64)
--
-- Host: localhost    Database: demo_daycarepro
-- ------------------------------------------------------
-- Server version	5.7.18-log

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
-- Table structure for table `accnt_invoice_items`
--

DROP TABLE IF EXISTS `accnt_invoice_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accnt_invoice_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `invoice_id` int(11) NOT NULL,
  `item_name` varchar(50) NOT NULL,
  `item_description` text NOT NULL,
  `item_price` int(11) NOT NULL,
  `item_quantity` int(11) NOT NULL,
  `item_discount` int(11) NOT NULL,
  `staff_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accnt_invoice_items`
--

LOCK TABLES `accnt_invoice_items` WRITE;
/*!40000 ALTER TABLE `accnt_invoice_items` DISABLE KEYS */;
INSERT INTO `accnt_invoice_items` VALUES (1,1,'Test','asdf',11,1,1,2),(4,3,'Test','This is desc',23,1,3,2),(3,2,'asfdasdf','23',22,3,1,2),(5,3,'44','dfsfg',1,1,1,1);
/*!40000 ALTER TABLE `accnt_invoice_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accnt_invoice_payments`
--

DROP TABLE IF EXISTS `accnt_invoice_payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accnt_invoice_payments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `invoice_id` int(11) NOT NULL,
  `amount_paid` int(11) NOT NULL,
  `date_paid` varchar(20) NOT NULL,
  `method` varchar(50) NOT NULL,
  `remarks` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accnt_invoice_payments`
--

LOCK TABLES `accnt_invoice_payments` WRITE;
/*!40000 ALTER TABLE `accnt_invoice_payments` DISABLE KEYS */;
INSERT INTO `accnt_invoice_payments` VALUES (1,3,12,'10/21/2016','2','t'),(2,2,13,'10/28/2016','5','');
/*!40000 ALTER TABLE `accnt_invoice_payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accnt_invoices`
--

DROP TABLE IF EXISTS `accnt_invoices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accnt_invoices` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `child_id` int(11) NOT NULL,
  `invoice_date` varchar(20) NOT NULL,
  `invoice_due_date` varchar(20) NOT NULL,
  `invoice_terms` text NOT NULL,
  `invoice_status` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accnt_invoices`
--

LOCK TABLES `accnt_invoices` WRITE;
/*!40000 ALTER TABLE `accnt_invoices` DISABLE KEYS */;
INSERT INTO `accnt_invoices` VALUES (1,1,'12/04/2014','12/11/2014','asdfas',1),(2,1,'12/10/2014','12/10/2014','asdf',2),(3,1,'12/03/2014','12/04/2014','Tersms',3);
/*!40000 ALTER TABLE `accnt_invoices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accnt_pay_bank`
--

DROP TABLE IF EXISTS `accnt_pay_bank`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accnt_pay_bank` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `child_id` int(11) NOT NULL,
  `bank_name` varchar(50) NOT NULL,
  `account_no` blob NOT NULL,
  `routing` int(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accnt_pay_bank`
--

LOCK TABLES `accnt_pay_bank` WRITE;
/*!40000 ALTER TABLE `accnt_pay_bank` DISABLE KEYS */;
INSERT INTO `accnt_pay_bank` VALUES (1,1,'4122','tEQU+rIGy9GvPokiXoEtcj15WMf+W7kIYSvqu0PQ0xQTGfKSTpwFB6oapMSNeq26A/oqWmuXRsxlecGYC9aQ/g==',222);
/*!40000 ALTER TABLE `accnt_pay_bank` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accnt_pay_cards`
--

DROP TABLE IF EXISTS `accnt_pay_cards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accnt_pay_cards` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `child_id` int(11) NOT NULL,
  `name_on_card` varchar(50) NOT NULL,
  `card_no` blob NOT NULL,
  `expiry` varchar(10) NOT NULL,
  `ccv` blob NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accnt_pay_cards`
--

LOCK TABLES `accnt_pay_cards` WRITE;
/*!40000 ALTER TABLE `accnt_pay_cards` DISABLE KEYS */;
/*!40000 ALTER TABLE `accnt_pay_cards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accnt_pay_methods`
--

DROP TABLE IF EXISTS `accnt_pay_methods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accnt_pay_methods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accnt_pay_methods`
--

LOCK TABLES `accnt_pay_methods` WRITE;
/*!40000 ALTER TABLE `accnt_pay_methods` DISABLE KEYS */;
INSERT INTO `accnt_pay_methods` VALUES (1,'check'),(2,'wire'),(3,'paypal'),(4,'credit'),(5,'cash');
/*!40000 ALTER TABLE `accnt_pay_methods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `backup_csv`
--

DROP TABLE IF EXISTS `backup_csv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `backup_csv` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `backup_path` varchar(255) NOT NULL,
  `backup_date` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `backup_csv`
--

LOCK TABLES `backup_csv` WRITE;
/*!40000 ALTER TABLE `backup_csv` DISABLE KEYS */;
/*!40000 ALTER TABLE `backup_csv` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `backup_sql`
--

DROP TABLE IF EXISTS `backup_sql`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `backup_sql` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `backup_path` varchar(255) NOT NULL,
  `backup_date` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `backup_sql`
--

LOCK TABLES `backup_sql` WRITE;
/*!40000 ALTER TABLE `backup_sql` DISABLE KEYS */;
/*!40000 ALTER TABLE `backup_sql` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `broadcast`
--

DROP TABLE IF EXISTS `broadcast`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `broadcast` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` varchar(60) NOT NULL,
  `message` varchar(100) NOT NULL,
  `date_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ip_address` varchar(40) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `broadcast`
--

LOCK TABLES `broadcast` WRITE;
/*!40000 ALTER TABLE `broadcast` DISABLE KEYS */;
INSERT INTO `broadcast` VALUES (1,'1','hello','2014-12-24 22:13:30','127.0.0.1'),(2,'1','s','2016-08-25 18:13:17','::1'),(3,'1','j','2016-10-15 02:52:58','::1');
/*!40000 ALTER TABLE `broadcast` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `calendar`
--

DROP TABLE IF EXISTS `calendar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `calendar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_bin NOT NULL,
  `start` date NOT NULL,
  `start_t` time NOT NULL,
  `end` date DEFAULT NULL,
  `end_t` time NOT NULL,
  `description` text COLLATE utf8_bin NOT NULL,
  `allDay` varchar(10) COLLATE utf8_bin NOT NULL DEFAULT 'false',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calendar`
--

LOCK TABLES `calendar` WRITE;
/*!40000 ALTER TABLE `calendar` DISABLE KEYS */;
INSERT INTO `calendar` VALUES (1,1,'Launching test','0000-00-00','00:00:00','0000-00-00','01:22:00','Hello there. fired','false');
/*!40000 ALTER TABLE `calendar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `child_allergy`
--

DROP TABLE IF EXISTS `child_allergy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `child_allergy` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `child_id` int(10) NOT NULL,
  `allergy` varchar(20) NOT NULL,
  `reaction` varchar(50) NOT NULL,
  `notes` varchar(250) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `child_allergy`
--

LOCK TABLES `child_allergy` WRITE;
/*!40000 ALTER TABLE `child_allergy` DISABLE KEYS */;
/*!40000 ALTER TABLE `child_allergy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `child_checkin`
--

DROP TABLE IF EXISTS `child_checkin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `child_checkin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `child_id` int(11) NOT NULL,
  `in_parent_id` int(11) NOT NULL,
  `time_in` int(11) DEFAULT NULL,
  `in_staff_id` int(11) NOT NULL,
  `out_parent_id` int(11) NOT NULL,
  `time_out` int(11) DEFAULT NULL,
  `out_staff_id` int(11) NOT NULL,
  `checkin_status` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `child_checkin`
--

LOCK TABLES `child_checkin` WRITE;
/*!40000 ALTER TABLE `child_checkin` DISABLE KEYS */;
INSERT INTO `child_checkin` VALUES (1,1,2,1418266724,1,1,1477662375,1,2),(2,2,1,1476790179,1,1,1476790186,1,2),(3,2,1,1476790624,1,0,NULL,0,1),(4,1,1,1477662383,1,1,1477662954,1,2),(5,1,1,1477662985,1,1,1477662996,1,2),(6,1,1,1477663028,1,1,1477663163,1,2),(7,1,1,1477663185,1,1,1477668643,1,2);
/*!40000 ALTER TABLE `child_checkin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `child_emergency`
--

DROP TABLE IF EXISTS `child_emergency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `child_emergency` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `child_id` int(10) NOT NULL,
  `fname` varchar(20) NOT NULL,
  `lname` varchar(20) NOT NULL,
  `cell` varchar(12) NOT NULL,
  `other_phone` varchar(12) NOT NULL,
  `address` text NOT NULL,
  `relation` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `child_emergency`
--

LOCK TABLES `child_emergency` WRITE;
/*!40000 ALTER TABLE `child_emergency` DISABLE KEYS */;
INSERT INTO `child_emergency` VALUES (2,1,'Jamie','adf','23','33','14714 Marie Ln','ad'),(3,1,'Jamie','Mary','23','','','dd'),(4,1,'ad','d','33','','','d');
/*!40000 ALTER TABLE `child_emergency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `child_foodpref`
--

DROP TABLE IF EXISTS `child_foodpref`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `child_foodpref` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `child_id` int(11) NOT NULL,
  `food` varchar(50) NOT NULL,
  `food_time` varchar(20) NOT NULL,
  `comment` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `child_foodpref`
--

LOCK TABLES `child_foodpref` WRITE;
/*!40000 ALTER TABLE `child_foodpref` DISABLE KEYS */;
INSERT INTO `child_foodpref` VALUES (1,1,'Cereal','breakfast','With milk');
/*!40000 ALTER TABLE `child_foodpref` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `child_insurance`
--

DROP TABLE IF EXISTS `child_insurance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `child_insurance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `child_id` int(11) NOT NULL,
  `p_name` varchar(20) NOT NULL,
  `p_num` int(20) NOT NULL,
  `g_num` int(20) NOT NULL,
  `expiry` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `child_insurance`
--

LOCK TABLES `child_insurance` WRITE;
/*!40000 ALTER TABLE `child_insurance` DISABLE KEYS */;
INSERT INTO `child_insurance` VALUES (6,1,'asdfas',222,222,'2014-12-31'),(7,1,'asdfas',222,222,'2014-12-08'),(8,1,'asdfas',222,222,'2014-12-08');
/*!40000 ALTER TABLE `child_insurance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `child_meds`
--

DROP TABLE IF EXISTS `child_meds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `child_meds` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `child_id` int(10) NOT NULL,
  `med_name` varchar(30) NOT NULL,
  `med_notes` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `child_meds`
--

LOCK TABLES `child_meds` WRITE;
/*!40000 ALTER TABLE `child_meds` DISABLE KEYS */;
INSERT INTO `child_meds` VALUES (1,1,'Tylenol','650mg by mouth at lunch');
/*!40000 ALTER TABLE `child_meds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `child_notes`
--

DROP TABLE IF EXISTS `child_notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `child_notes` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `child_id` int(10) NOT NULL,
  `content` text NOT NULL,
  `user_id` int(10) NOT NULL,
  `date` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `child_notes`
--

LOCK TABLES `child_notes` WRITE;
/*!40000 ALTER TABLE `child_notes` DISABLE KEYS */;
/*!40000 ALTER TABLE `child_notes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `child_pickup`
--

DROP TABLE IF EXISTS `child_pickup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `child_pickup` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `child_id` int(10) NOT NULL,
  `fname` varchar(20) NOT NULL,
  `lname` varchar(20) NOT NULL,
  `cell` varchar(12) NOT NULL,
  `other_phone` varchar(12) NOT NULL,
  `address` text NOT NULL,
  `pin` int(6) NOT NULL,
  `relation` varchar(20) NOT NULL,
  `photo` varchar(100) NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `child_pickup`
--

LOCK TABLES `child_pickup` WRITE;
/*!40000 ALTER TABLE `child_pickup` DISABLE KEYS */;
INSERT INTO `child_pickup` VALUES (1,1,'Philip','Doe','2333333','2333232','123 Test st',2222,'PCP','4b6fda34b3584090bdad637aa68fa7b4.png',0);
/*!40000 ALTER TABLE `child_pickup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `child_status`
--

DROP TABLE IF EXISTS `child_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `child_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status_name` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `child_status`
--

LOCK TABLES `child_status` WRITE;
/*!40000 ALTER TABLE `child_status` DISABLE KEYS */;
INSERT INTO `child_status` VALUES (1,'active'),(2,'inactive'),(3,'graduated'),(4,'transferred');
/*!40000 ALTER TABLE `child_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `child_users`
--

DROP TABLE IF EXISTS `child_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `child_users` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `child_id` int(5) NOT NULL,
  `user_id` int(5) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `child_users`
--

LOCK TABLES `child_users` WRITE;
/*!40000 ALTER TABLE `child_users` DISABLE KEYS */;
INSERT INTO `child_users` VALUES (1,1,0),(7,1,1),(5,2,0),(8,2,1);
/*!40000 ALTER TABLE `child_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `children`
--

DROP TABLE IF EXISTS `children`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `children` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `company` int(11) NOT NULL,
  `fname` varchar(20) NOT NULL,
  `lname` varchar(20) NOT NULL,
  `ssn` blob NOT NULL,
  `bday` varchar(12) NOT NULL,
  `gender` int(2) NOT NULL,
  `blood_type` varchar(20) NOT NULL,
  `enroll_date` varchar(20) NOT NULL,
  `last_update` varchar(20) NOT NULL,
  `photo` varchar(100) NOT NULL,
  `status` int(2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `children`
--

LOCK TABLES `children` WRITE;
/*!40000 ALTER TABLE `children` DISABLE KEYS */;
INSERT INTO `children` VALUES (1,1,'Alice','Debby','7j4HQvlAahRr9UnvkxQndZFoQc+5QeYDZ8hRuBoAC0DnOImS0LExlaNnyLedvSeCbfCCT/FZPhaIfgd5mo0aGg==','2000-02-22',2,'O-','1418000806','1418612495','2a7c05f586c02c396b0abeea5e02db3e.jpg',1),(2,1,'Ann','Corr','YofeUBkf2wO8SOztPNkw0Fi8h/UDZN6DOhcSPx75S5wSuJ4qOZJwjrB7J4OZP69HSZbT59xmW7SoZCOpQycQHg==','2010-02-22',2,'unknown','1419396068','1477668797','78202dbdf8549209d757c78e508a471f.jpg',1);
/*!40000 ALTER TABLE `children` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ci_sessions`
--

DROP TABLE IF EXISTS `ci_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ci_sessions` (
  `session_id` varchar(40) COLLATE utf8_bin NOT NULL DEFAULT '0',
  `ip_address` varchar(16) COLLATE utf8_bin NOT NULL DEFAULT '0',
  `user_agent` varchar(150) COLLATE utf8_bin NOT NULL,
  `last_activity` int(10) unsigned NOT NULL DEFAULT '0',
  `user_data` text COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ci_sessions`
--

LOCK TABLES `ci_sessions` WRITE;
/*!40000 ALTER TABLE `ci_sessions` DISABLE KEYS */;
INSERT INTO `ci_sessions` VALUES ('4018f36725f6ff557352e64278cce725','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36',1503651703,'a:8:{s:9:\"user_data\";s:0:\"\";s:9:\"last_page\";s:29:\"http://localhost:8080/manager\";s:10:\"company_id\";s:1:\"1\";s:8:\"identity\";s:15:\"admin@admin.com\";s:8:\"username\";s:5:\"admin\";s:5:\"email\";s:15:\"admin@admin.com\";s:7:\"user_id\";s:1:\"1\";s:14:\"old_last_login\";s:10:\"1503651703\";}'),('63b99498c76113dfe9ef5c96db7a37a7','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36',1503651506,'a:8:{s:9:\"user_data\";s:0:\"\";s:9:\"last_page\";s:29:\"http://localhost:8080/manager\";s:10:\"company_id\";s:1:\"1\";s:8:\"identity\";s:15:\"admin@admin.com\";s:8:\"username\";s:5:\"admin\";s:5:\"email\";s:15:\"admin@admin.com\";s:7:\"user_id\";s:1:\"1\";s:14:\"old_last_login\";s:10:\"1490956186\";}'),('93d7779ed9078aeb5c06659e147251bd','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36',1503651678,'a:8:{s:9:\"user_data\";s:0:\"\";s:9:\"last_page\";s:27:\"http://localhost:8080/login\";s:10:\"company_id\";s:1:\"1\";s:8:\"identity\";s:15:\"admin@admin.com\";s:8:\"username\";s:5:\"admin\";s:5:\"email\";s:15:\"admin@admin.com\";s:7:\"user_id\";s:1:\"1\";s:14:\"old_last_login\";s:10:\"1503651588\";}'),('bbf6ae9b9437ddbf399648e254d21cb5','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36',1503661037,'a:2:{s:9:\"user_data\";s:0:\"\";s:9:\"last_page\";s:43:\"http://localhost:8080/child/index/1/billing\";}'),('f4bbbf51fe6a14ae49d0e5218947a597','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36',1503651720,'a:9:{s:9:\"user_data\";s:0:\"\";s:9:\"last_page\";s:43:\"http://localhost:8080/child/index/1/billing\";s:10:\"company_id\";s:1:\"1\";s:8:\"identity\";s:15:\"admin@admin.com\";s:8:\"username\";s:5:\"admin\";s:5:\"email\";s:15:\"admin@admin.com\";s:7:\"user_id\";s:1:\"1\";s:14:\"old_last_login\";s:10:\"1503651709\";s:6:\"filter\";s:10:\"all-fields\";}');
/*!40000 ALTER TABLE `ci_sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `classrooms`
--

DROP TABLE IF EXISTS `classrooms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `classrooms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `desc` varchar(255) NOT NULL,
  `status` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classrooms`
--

LOCK TABLES `classrooms` WRITE;
/*!40000 ALTER TABLE `classrooms` DISABLE KEYS */;
/*!40000 ALTER TABLE `classrooms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `companies`
--

DROP TABLE IF EXISTS `companies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `companies` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) NOT NULL,
  `name` varchar(20) NOT NULL,
  `slogan` varchar(50) NOT NULL,
  `logo` varchar(50) NOT NULL,
  `allow_reg` int(2) NOT NULL,
  `captcha` int(2) NOT NULL,
  `maintenance` int(2) NOT NULL,
  `demo_mode` int(11) NOT NULL,
  `encrypt_key` varchar(100) NOT NULL,
  `paypal_email` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `fax` varchar(20) NOT NULL,
  `website` varchar(100) NOT NULL,
  `street` varchar(50) NOT NULL,
  `city` varchar(20) NOT NULL,
  `state` varchar(20) NOT NULL,
  `zip` int(5) NOT NULL,
  `country` varchar(20) NOT NULL,
  `time_zone` varchar(20) NOT NULL,
  `currency` varchar(10) NOT NULL,
  `curr_symbol` varchar(5) NOT NULL,
  `date_format` varchar(20) NOT NULL,
  `google_analytics` varchar(50) NOT NULL,
  `reg_date` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `companies`
--

LOCK TABLES `companies` WRITE;
/*!40000 ALTER TABLE `companies` DISABLE KEYS */;
INSERT INTO `companies` VALUES (1,'9174986712','DayCarePRO','Daycare Management system','',1,0,0,0,'12345678','jgatem@gmail.com','info@icoolpix.com','3019098359','123456','http://google.com','123 Street','NYC','NY',1234,'US','US/Eastern','USD','$','m-d-y','','');
/*!40000 ALTER TABLE `companies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_log`
--

DROP TABLE IF EXISTS `event_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `date` varchar(20) NOT NULL,
  `event` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_log`
--

LOCK TABLES `event_log` WRITE;
/*!40000 ALTER TABLE `event_log` DISABLE KEYS */;
INSERT INTO `event_log` VALUES (1,1,1,'1418612491','Updated child Alice Debby'),(2,1,1,'1418612495','Updated child Alice Debby'),(3,1,1,'1418613685','Added insurance for  -Debby'),(4,1,1,'1418613693','Added insurance for  -Debby'),(5,1,1,'1418613712','Added insurance for  -Debby'),(6,1,1,'1418613726','Added insurance for  -Debby'),(7,1,1,'1418613741','Added insurance for  -Debby'),(8,1,1,'1418613830','Added insurance for  -Debby'),(9,1,1,'1418614078','Delete insurance for  -Debby'),(10,1,1,'1418614092','Delete insurance for  -Debby'),(11,1,1,'1418614109','Delete insurance for  -'),(12,1,1,'1418614186','Delete insurance for  -Debby'),(13,1,1,'1418614315','Added allergy for  -Debby'),(14,1,1,'1418614379','Added insurance for 1 -Debby'),(15,1,1,'1418614389','Added insurance for 1 -Debby'),(16,1,1,'1418614482','Delete insurance for  -Debby'),(17,1,1,'1419202905','Deactivated membership to upgrade'),(18,1,1,'1419202905','Updated membereship to enterprise for 1'),(19,1,1,'1419203878','deactivated membership'),(20,1,1,'1419203878','Updated membereship to enterprise for 1'),(21,1,1,'1419396068','Add child James Corr'),(22,1,1,'1419396226','Updated child Ann Corr'),(23,1,1,'1419459210','Sent broadcast {hello}'),(24,1,1,'1420293524','Added allergy for 1 -Debby'),(25,1,1,'1420293613','Added med for 1 -Debby'),(26,1,1,'1426817385','updated test1'),(27,1,1,'1427158881','updated jgmuchiri@gmail.com'),(28,1,1,'1472148797','Sent broadcast {s}'),(29,1,1,'1474504289','Added calendar event dedf'),(30,1,1,'1474504307','Added calendar event '),(31,1,1,'1476499978','Sent broadcast {j}'),(32,1,1,'1476500024','Added emergency contact for 1 -Debby'),(33,1,1,'1476500070','Added emergency contact for 1 -Debby'),(34,1,1,'1476500083','Added emergency contact for 1 -Debby'),(35,1,1,'1476500114','Added emergency contact for 1 -Debby'),(36,1,1,'1476790180','Added checked in 2 -Corr'),(37,1,1,'1476790187','Added checked out 2 -Corr'),(38,1,1,'1476790625','Added checked in 2 -Corr'),(39,1,1,'1477662376','Added checked out 1 -Debby'),(40,1,1,'1477662384','Added checked in 1 -Debby'),(41,1,1,'1477662955','Added checked out 1 -Debby'),(42,1,1,'1477668644','Added checked out 1 -Debby'),(43,1,1,'1477668770','Updated child Ann Corr'),(44,1,1,'1477668773','Updated child Ann Corr'),(45,1,1,'1477668793','Updated child Ann Corr'),(46,1,1,'1477668796','Updated child Ann Corr'),(47,1,1,'1477668797','Updated child Ann Corr');
/*!40000 ALTER TABLE `event_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groups`
--

DROP TABLE IF EXISTS `groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `groups` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `company` varchar(5) NOT NULL,
  `name` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groups`
--

LOCK TABLES `groups` WRITE;
/*!40000 ALTER TABLE `groups` DISABLE KEYS */;
INSERT INTO `groups` VALUES (1,'','admin','Super admins'),(2,'','manager','Managers'),(3,'','staff','Staff members'),(4,'','parent','Parents'),(9,'','super','Super user');
/*!40000 ALTER TABLE `groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `help_articles`
--

DROP TABLE IF EXISTS `help_articles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `help_articles` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `order` int(5) NOT NULL,
  `article_name` varchar(50) NOT NULL,
  `article_body` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `help_articles`
--

LOCK TABLES `help_articles` WRITE;
/*!40000 ALTER TABLE `help_articles` DISABLE KEYS */;
/*!40000 ALTER TABLE `help_articles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inbox`
--

DROP TABLE IF EXISTS `inbox`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inbox` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `msg_id` varchar(50) NOT NULL,
  `sender` int(10) NOT NULL,
  `receiver` int(11) NOT NULL,
  `subject` varchar(100) NOT NULL,
  `message` text NOT NULL,
  `date_sent` varchar(20) NOT NULL,
  `receiver_read` int(10) NOT NULL,
  `sender_read` int(11) NOT NULL,
  `sender_loc` varchar(20) NOT NULL,
  `receiver_loc` varchar(20) NOT NULL,
  `location` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inbox`
--

LOCK TABLES `inbox` WRITE;
/*!40000 ALTER TABLE `inbox` DISABLE KEYS */;
INSERT INTO `inbox` VALUES (1,'64238281418006714',2,1,'hi admn','hi admi','1418006714',1,0,'','','important');
/*!40000 ALTER TABLE `inbox` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inbox_reply`
--

DROP TABLE IF EXISTS `inbox_reply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inbox_reply` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sender` varchar(10) NOT NULL,
  `parent` varchar(20) NOT NULL,
  `message` text NOT NULL,
  `date_sent` varchar(20) NOT NULL,
  `is_read` int(5) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inbox_reply`
--

LOCK TABLES `inbox_reply` WRITE;
/*!40000 ALTER TABLE `inbox_reply` DISABLE KEYS */;
INSERT INTO `inbox_reply` VALUES (1,'1','64238281418006714','Hi','1418220733',0),(2,'1','64238281418006714','test','1477078229',0),(3,'1','64238281418006714','asdf','1477078232',0);
/*!40000 ALTER TABLE `inbox_reply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login_attempts`
--

DROP TABLE IF EXISTS `login_attempts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `login_attempts` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(15) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login_attempts`
--

LOCK TABLES `login_attempts` WRITE;
/*!40000 ALTER TABLE `login_attempts` DISABLE KEYS */;
/*!40000 ALTER TABLE `login_attempts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `memberships`
--

DROP TABLE IF EXISTS `memberships`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `memberships` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company` int(11) NOT NULL,
  `member_type` varchar(20) NOT NULL,
  `pay_method` varchar(20) NOT NULL,
  `start_date` int(20) NOT NULL,
  `end_date` int(20) NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `memberships`
--

LOCK TABLES `memberships` WRITE;
/*!40000 ALTER TABLE `memberships` DISABLE KEYS */;
INSERT INTO `memberships` VALUES (1,1,'enterprise','PayPal',1419199022,1419199034,0),(2,1,'ultimate','PayPal',1419199034,1419199067,0),(3,2,'enterprise','PayPal',1419199067,0,1),(4,1,'enterprise','PayPal',1419199088,1419202905,0),(5,1,'enterprise','PayPal',1419202905,1419203878,0),(6,1,'enterprise','PayPal',1419203878,0,1);
/*!40000 ALTER TABLE `memberships` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `news`
--

DROP TABLE IF EXISTS `news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `news` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `company` int(11) NOT NULL,
  `user_id` int(10) NOT NULL,
  `order` int(5) NOT NULL,
  `article_name` varchar(50) NOT NULL,
  `article_body` text NOT NULL,
  `publish_date` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news`
--

LOCK TABLES `news` WRITE;
/*!40000 ALTER TABLE `news` DISABLE KEYS */;
INSERT INTO `news` VALUES (1,1,1,0,'This is a test article','<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p><p><br></p><img  data-filename=\"paypal.png\" ><p><br></p><p>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.<br></p>','1419210480'),(3,1,1,0,'This is a test article','<p>asdfs</p>','1419215918'),(4,1,1,0,'This is a test article','<p>&nbsp; is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.<span>&nbsp; is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</span><span>&nbsp; is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</span><span>&nbsp; is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</span><span>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</span><br></p>','1419215947');
/*!40000 ALTER TABLE `news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `settings` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `code` int(20) NOT NULL,
  `name` varchar(20) NOT NULL,
  `slogan` varchar(50) NOT NULL,
  `logo` varchar(50) NOT NULL,
  `allow_reg` int(2) NOT NULL,
  `captcha` int(2) NOT NULL,
  `maintenance` int(2) NOT NULL,
  `demo_mode` int(11) NOT NULL,
  `encrypt_key` varchar(100) NOT NULL,
  `paypal_email` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `fax` varchar(20) NOT NULL,
  `website` varchar(100) NOT NULL,
  `street` varchar(50) NOT NULL,
  `city` varchar(20) NOT NULL,
  `state` varchar(20) NOT NULL,
  `zip` int(5) NOT NULL,
  `country` varchar(20) NOT NULL,
  `time_zone` varchar(20) NOT NULL,
  `currency` varchar(10) NOT NULL,
  `curr_symbol` varchar(5) NOT NULL,
  `date_format` varchar(20) NOT NULL,
  `google_analytics` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES (1,1,'CarePRO','Childcare Management','paypal3.png',1,0,0,0,'12333','info@icoolpix.com','info@icoolpix.com','+1 (301) 909-8359','+1 (301) 909-8359','http://icoolpix.com','123 Street St','New York','NY',13601,'USA','US/Eastern','USD','$','m-d-y','UA-54280486-1');
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `todo`
--

DROP TABLE IF EXISTS `todo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `todo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `list_name` varchar(50) NOT NULL,
  `last_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `todo`
--

LOCK TABLES `todo` WRITE;
/*!40000 ALTER TABLE `todo` DISABLE KEYS */;
INSERT INTO `todo` VALUES (1,2,'My list','2014-12-08 02:46:09','active'),(2,1,'Test task','2014-12-24 03:59:34','active');
/*!40000 ALTER TABLE `todo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `todo_items`
--

DROP TABLE IF EXISTS `todo_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `todo_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `todo_id` int(11) NOT NULL,
  `item_name` varchar(100) NOT NULL,
  `last_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `item_status` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `todo_items`
--

LOCK TABLES `todo_items` WRITE;
/*!40000 ALTER TABLE `todo_items` DISABLE KEYS */;
INSERT INTO `todo_items` VALUES (1,1,'test list','2014-12-08 02:46:13','active'),(8,2,'kk','2016-10-26 23:10:33','active');
/*!40000 ALTER TABLE `todo_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_data`
--

DROP TABLE IF EXISTS `user_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_data` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `user_id` int(5) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `phone2` varchar(20) NOT NULL,
  `street` varchar(50) NOT NULL,
  `street2` varchar(20) NOT NULL,
  `city` varchar(20) NOT NULL,
  `state` varchar(20) NOT NULL,
  `zip` int(5) NOT NULL,
  `country` varchar(20) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `pin` int(10) NOT NULL,
  `photo` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_data`
--

LOCK TABLES `user_data` WRITE;
/*!40000 ALTER TABLE `user_data` DISABLE KEYS */;
INSERT INTO `user_data` VALUES (1,1,'888','0','14714 Marie Ln','','Watertown','New York',0,'United States','',13601,'1d05d1b45fd1271b5045c27bdb49285e.png'),(2,2,'888','123','','','','',0,'','',0,'e194ca1f804a283cfbf74fc8691de226.png'),(3,3,'8','5566','14714 Marie Ln','','Watertown','New York',0,'USA','',13601,'a6f02f47cf065e02e2dea6b5b9609f17.png'),(9,4,'','','','','','',0,'','',0,'');
/*!40000 ALTER TABLE `user_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `company` int(10) NOT NULL,
  `username` varchar(100) NOT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `active` tinyint(1) unsigned DEFAULT NULL,
  `forgotten_password_code` varchar(40) DEFAULT NULL,
  `forgotten_password_time` int(11) unsigned DEFAULT NULL,
  `activation_code` varchar(40) DEFAULT NULL,
  `remember_code` varchar(40) DEFAULT NULL,
  `salt` varchar(255) DEFAULT NULL,
  `created_on` int(11) unsigned NOT NULL,
  `last_login` int(11) unsigned DEFAULT NULL,
  `ip_address` varchar(15) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,1,'admin','Demo','Admin','admin@admin.com','$2y$08$3tKDZ.t7m5Y6DYGWjJ5cOODDGMYrOUHHSCNVEulNJcSdXXYQRBgY6',1,'L9Dm0Gg7DZe2RK8AbkuS3.d2f787584de0c70f3d',1477661368,NULL,NULL,NULL,1417992678,1503651735,'::1'),(2,1,'manager','Demo','Manager','manager@demo.com','$2y$08$KbjOBTx9U10UPcxq8Eiuv.g6VI7BHVQK14Lw.b3BT7MvK3FVtL/2u',1,NULL,NULL,NULL,NULL,NULL,1418000273,1418575357,'::1'),(3,1,'staff','Demo','Staff','staff@demo.com','$2y$08$mF52MtIXXrWzJNZTwqbJmemp0BT0XRFiTWCU.KhK8N//9dXOvcaBu',1,NULL,NULL,NULL,NULL,NULL,1418006359,1418580454,'::1'),(4,1,'parent','Demo','Parent','parent@demo.com','$2y$08$13fYdNfWGX0KuEKFFbusD.O2k3t.sqsHpkz7H7Z1TfJaxte5tw1dm',1,NULL,NULL,NULL,NULL,NULL,1418083168,1474470383,'::1');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_groups`
--

DROP TABLE IF EXISTS `users_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_groups` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  `group_id` mediumint(8) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uc_users_groups` (`user_id`,`group_id`),
  KEY `fk_users_groups_users1_idx` (`user_id`),
  KEY `fk_users_groups_groups1_idx` (`group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=276 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_groups`
--

LOCK TABLES `users_groups` WRITE;
/*!40000 ALTER TABLE `users_groups` DISABLE KEYS */;
INSERT INTO `users_groups` VALUES (219,1,1),(220,1,2),(221,1,3),(222,1,4),(223,1,9),(272,2,1),(273,2,2),(274,2,3),(275,2,4),(238,3,1),(239,3,4),(271,4,4),(242,5,4),(209,6,4);
/*!40000 ALTER TABLE `users_groups` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-08-25 13:48:17
