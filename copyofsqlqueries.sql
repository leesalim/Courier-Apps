

DROP TABLE IF EXISTS `gm_gen_currency`;

CREATE TABLE `gm_gen_currency` (
  `currencyid` int(11) NOT NULL AUTO_INCREMENT,
  `currencycode` varchar(10) DEFAULT NULL,
  `currencydesc` varchar(100) DEFAULT NULL,
  `currencyicon` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`currencyid`),
  KEY `idx_currencycode` (`currencycode`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;


LOCK TABLES `gm_gen_currency` WRITE;
/*!40000 ALTER TABLE `gm_gen_currency` DISABLE KEYS */;
INSERT INTO `gm_gen_currency` VALUES (1,'PHP','Philippine Peso',NULL);
/*!40000 ALTER TABLE `gm_gen_currency` ENABLE KEYS */;
UNLOCK TABLES;



DROP TABLE IF EXISTS `gm_gen_documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gm_gen_documents` (
  `documentid` int(11) NOT NULL AUTO_INCREMENT,
  `documentdesc` varchar(100) DEFAULT NULL,
  `points` int(100) DEFAULT NULL,
  `docimagelink` text,
  PRIMARY KEY (`documentid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;



LOCK TABLES `gm_gen_documents` WRITE;
/*!40000 ALTER TABLE `gm_gen_documents` DISABLE KEYS */;
/*!40000 ALTER TABLE `gm_gen_documents` ENABLE KEYS */;
UNLOCK TABLES;



DROP TABLE IF EXISTS `gm_gen_packagetype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gm_gen_packagetype` (
  `packagetypeid` int(11) NOT NULL AUTO_INCREMENT,
  `packagetypecode` varchar(10) DEFAULT NULL,
  `packagetypedesc` varchar(100) DEFAULT NULL,
  `packagetypeicon` text,
  PRIMARY KEY (`packagetypeid`),
  KEY `idx_packagecode` (`packagetypecode`),
  KEY `idx_packagedesc` (`packagetypedesc`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;



LOCK TABLES `gm_gen_packagetype` WRITE;
/*!40000 ALTER TABLE `gm_gen_packagetype` DISABLE KEYS */;
INSERT INTO `gm_gen_packagetype` VALUES (1,'FP','Full Package',NULL);
/*!40000 ALTER TABLE `gm_gen_packagetype` ENABLE KEYS */;
UNLOCK TABLES;



DROP TABLE IF EXISTS `gm_gen_portaluser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gm_gen_portaluser` (
  `portaluserid` int(11) NOT NULL AUTO_INCREMENT,
  `accounttype` enum('COMPANY','PERSONAL') DEFAULT NULL,
  `companyname` varchar(100) DEFAULT NULL,
  `firstname` varchar(100) DEFAULT NULL,
  `lastname` varchar(100) DEFAULT NULL,
  `emailaddress` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `defaultaddress` text,
  `mobileno` varchar(20) DEFAULT NULL,
  `currencyid` int(11) DEFAULT NULL,
  `defaultpayment` enum('CASH','CARD') DEFAULT NULL,
  `dateadded` datetime DEFAULT NULL,
  `datemodified` datetime DEFAULT NULL,
  `lastlogin` datetime DEFAULT NULL,
  `accountactive` enum('Y','N') DEFAULT NULL,
  `linkedaccount` varchar(100) DEFAULT NULL,
  `isemailverified` enum('Y','N') DEFAULT NULL,
  `addresslat` varchar(45) DEFAULT NULL,
  `addresslong` varchar(45) DEFAULT NULL,
  `avatarlink` text,
  `userrating` int(11) DEFAULT NULL,
  `isonline` int(1) DEFAULT NULL,
  `loginattemptcnt` int(1) DEFAULT NULL,
  PRIMARY KEY (`portaluserid`),
  KEY `idx_companyname` (`companyname`),
  KEY `idx_emailaddress` (`emailaddress`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`devuser`@`%`*/ /*!50003 TRIGGER `INS_trg_portaluser` AFTER INSERT ON `gm_gen_portaluser` FOR EACH ROW BEGIN
	INSERT INTO `gm_sys_translog`(transid,tablename,columnname,olddata,newdata,portaluserid)
	VALUES (NEW.portaluserid,'gm_gen_portaluser','','[NEW DATA]',NEW.portaluserid,NEW.portaluserid);
    END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`devuser`@`%`*/ /*!50003 TRIGGER `UPD_trg_portaluser` AFTER UPDATE ON `gm_gen_portaluser` FOR EACH ROW BEGIN
	
	DECLARE xtablename VARCHAR(100); 
	
	SET xtablename = "gm_gen_portaluser"; 	
	
	IF NEW.accounttype <> OLD.accounttype THEN
		INSERT INTO `gm_sys_translog`(transid,tablename,columnname,olddata,newdata,portaluserid)
		VALUES (OLD.portaluserid,xtablename,'accounttype',OLD.accounttype,NEW.accounttype,OLD.portaluserid);
	END IF;
	
	IF NEW.companyname <> OLD.companyname THEN
		INSERT INTO `gm_sys_translog`(transid,tablename,columnname,olddata,newdata,portaluserid)
		VALUES (OLD.portaluserid,xtablename,'companyname',OLD.companyname,NEW.companyname,OLD.portaluserid);
	END IF;
	
	IF NEW.firstname <> OLD.firstname THEN
		INSERT INTO `gm_sys_translog`(transid,tablename,columnname,olddata,newdata,portaluserid)
		VALUES (OLD.portaluserid,xtablename,'firstname',OLD.firstname,NEW.firstname,OLD.portaluserid);
	END IF;	
	
	IF NEW.lastname <> OLD.lastname THEN
		INSERT INTO `gm_sys_translog`(transid,tablename,columnname,olddata,newdata,portaluserid)
		VALUES (OLD.portaluserid,xtablename,'lastname',OLD.lastname,NEW.lastname,OLD.portaluserid);
	END IF;	
	
	IF NEW.emailaddress <> OLD.emailaddress THEN
		INSERT INTO `gm_sys_translog`(transid,tablename,columnname,olddata,newdata,portaluserid)
		VALUES (OLD.portaluserid,xtablename,'emailaddress',OLD.emailaddress,NEW.emailaddress,OLD.portaluserid);
	END IF;
	
	IF NEW.password <> OLD.password THEN
		INSERT INTO `gm_sys_translog`(transid,tablename,columnname,olddata,newdata,portaluserid)
		VALUES (OLD.portaluserid,xtablename,'password',OLD.password,NEW.password,OLD.portaluserid);
	END IF;	
	
	IF NEW.defaultaddress <> OLD.defaultaddress THEN
		INSERT INTO `gm_sys_translog`(transid,tablename,columnname,olddata,newdata,portaluserid)
		VALUES (OLD.portaluserid,xtablename,'defaultaddress',OLD.defaultaddress,NEW.defaultaddress,OLD.portaluserid);
	END IF;	
	
	IF NEW.mobileno <> OLD.mobileno THEN
		INSERT INTO `gm_sys_translog`(transid,tablename,columnname,olddata,newdata,portaluserid)
		VALUES (OLD.portaluserid,xtablename,'mobileno',OLD.mobileno,NEW.mobileno,OLD.portaluserid);
	END IF;
	IF NEW.currencyid <> OLD.currencyid THEN
		INSERT INTO `gm_sys_translog`(transid,tablename,columnname,olddata,newdata,portaluserid)
		VALUES (OLD.portaluserid,xtablename,'currencyid',OLD.currencyid,NEW.currencyid,OLD.portaluserid);
	END IF;
	
	IF NEW.defaultpayment <> OLD.defaultpayment THEN
		INSERT INTO `gm_sys_translog`(transid,tablename,columnname,olddata,newdata,portaluserid)
		VALUES (OLD.portaluserid,xtablename,'defaultpayment',OLD.defaultpayment,NEW.defaultpayment,OLD.portaluserid);
	END IF;
	
	IF NEW.lastlogin <> OLD.lastlogin THEN
		INSERT INTO `gm_sys_translog`(transid,tablename,columnname,olddata,newdata,portaluserid)
		VALUES (OLD.portaluserid,xtablename,'lastlogin',OLD.lastlogin,NEW.lastlogin,OLD.portaluserid);
	END IF;
	
	IF NEW.accountactive <> OLD.accountactive THEN
		INSERT INTO `gm_sys_translog`(transid,tablename,columnname,olddata,newdata,portaluserid)
		VALUES (OLD.portaluserid,xtablename,'accountactive',OLD.accountactive,NEW.accountactive,OLD.portaluserid);
	END IF;
	
	IF NEW.linkedaccount <> OLD.linkedaccount THEN
		INSERT INTO `gm_sys_translog`(transid,tablename,columnname,olddata,newdata,portaluserid)
		VALUES (OLD.portaluserid,xtablename,'linkedaccount',OLD.linkedaccount,NEW.linkedaccount,OLD.portaluserid);
	END IF;	
	IF NEW.isemailverified <> OLD.isemailverified THEN
		INSERT INTO `gm_sys_translog`(transid,tablename,columnname,olddata,newdata,portaluserid)
		VALUES (OLD.portaluserid,xtablename,'isemailverified',OLD.isemailverified,NEW.isemailverified,OLD.portaluserid);
	END IF;	
	IF NEW.avatarlink <> OLD.avatarlink THEN
		INSERT INTO `gm_sys_translog`(transid,tablename,columnname,olddata,newdata,portaluserid)
		VALUES (OLD.portaluserid,xtablename,'avatarlink',OLD.avatarlink,NEW.avatarlink,OLD.portaluserid);
	END IF;			
    END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;


DROP TABLE IF EXISTS `gm_gen_vehicletype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gm_gen_vehicletype` (
  `vehicletypeid` int(11) NOT NULL AUTO_INCREMENT,
  `vehicletypecode` varchar(10) DEFAULT NULL,
  `vehicletypedesc` varchar(100) DEFAULT NULL,
  `capacity` decimal(10,2) DEFAULT NULL,
  `capacityuom` enum('KG','LB') DEFAULT NULL,
  `vehicleicon` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`vehicletypeid`),
  KEY `vehicletypecode` (`vehicletypecode`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `gm_gen_vehicletype` WRITE;
/*!40000 ALTER TABLE `gm_gen_vehicletype` DISABLE KEYS */;
INSERT INTO `gm_gen_vehicletype` VALUES (1,'ABC','ABC CAR',100.00,'KG',NULL);
/*!40000 ALTER TABLE `gm_gen_vehicletype` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `gm_opc_credshared`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gm_opc_credshared` (
  `portaluserid` int(11) DEFAULT NULL,
  `sharedtoid` int(11) DEFAULT NULL,
  `datetimeshared` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `gm_opc_credshared` WRITE;
/*!40000 ALTER TABLE `gm_opc_credshared` DISABLE KEYS */;
/*!40000 ALTER TABLE `gm_opc_credshared` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`devuser`@`%`*/ /*!50003 TRIGGER `INS_trg_credshared` AFTER INSERT ON `gm_opc_credshared` FOR EACH ROW BEGIN
	INSERT INTO `gm_sys_translog`(transid,tablename,columnname,olddata,newdata,portaluserid)
	VALUES (NEW.portaluserid,'gm_opc_credshared','','[NEW DATA]',NEW.sharedtoid,NEW.portaluserid);
    END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`devuser`@`%`*/ /*!50003 TRIGGER `DEL_trg_credshared` AFTER DELETE ON `gm_opc_credshared` FOR EACH ROW BEGIN
	INSERT INTO `gm_sys_translog`(transid,tablename,columnname,olddata,newdata,portaluserid)
	VALUES (OLD.portaluserid,'gm_opc_credshared','','[DEL DATA]',OLD.sharedtoid,OLD.portaluserid);
 
    END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

DROP TABLE IF EXISTS `gm_opc_pucredibility`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gm_opc_pucredibility` (
  `creditid` int(11) NOT NULL AUTO_INCREMENT,
  `portaluserid` int(11) DEFAULT NULL,
  `documentid` int(11) DEFAULT NULL,
  `filename` varchar(100) DEFAULT NULL,
  `expirydate` date DEFAULT NULL,
  `nextreminder` date DEFAULT NULL,
  `dateverified` datetime DEFAULT NULL COMMENT 'If not null, then not yet verified',
  `verifiedby` int(11) DEFAULT NULL,
  PRIMARY KEY (`creditid`),
  KEY `idx_portaluserid` (`portaluserid`),
  KEY `idx_documentid` (`documentid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `gm_opc_pucredibility` WRITE;
/*!40000 ALTER TABLE `gm_opc_pucredibility` DISABLE KEYS */;
/*!40000 ALTER TABLE `gm_opc_pucredibility` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`devuser`@`%`*/ /*!50003 TRIGGER `INS_trg_purcredibility` AFTER INSERT ON `gm_opc_pucredibility` FOR EACH ROW BEGIN
	INSERT INTO `gm_sys_translog`(transid,tablename,columnname,olddata,newdata,portaluserid)
	VALUES (NEW.portaluserid,'gm_opc_pucredibility','','[NEW DATA]',NEW.documentid,NEW.portaluserid);
    END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`devuser`@`%`*/ /*!50003 TRIGGER `DEL_trg_purcredibility` AFTER DELETE ON `gm_opc_pucredibility` FOR EACH ROW BEGIN
	
	INSERT INTO `gm_sys_translog`(transid,tablename,columnname,olddata,newdata,portaluserid)
	VALUES (OLD.portaluserid,'gm_opc_pucredibility','','[DEL DATA]',OLD.documentid,OLD.portaluserid);
 
    END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

DROP TABLE IF EXISTS `gm_opc_puvehicles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gm_opc_puvehicles` (
  `puvehiclesid` int(11) NOT NULL AUTO_INCREMENT,
  `portaluserid` int(11) DEFAULT NULL,
  `vehicletypeid` int(11) DEFAULT NULL,
  `vehiclemake` varchar(100) DEFAULT NULL,
  `vehiclemodel` varchar(100) DEFAULT NULL,
  `platenumber` varchar(10) DEFAULT NULL,
  `dateverified` datetime DEFAULT NULL,
  PRIMARY KEY (`puvehiclesid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `gm_opc_puvehicles` WRITE;
/*!40000 ALTER TABLE `gm_opc_puvehicles` DISABLE KEYS */;
/*!40000 ALTER TABLE `gm_opc_puvehicles` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`devuser`@`%`*/ /*!50003 TRIGGER `INS_trg_purvehicles` AFTER INSERT ON `gm_opc_puvehicles` FOR EACH ROW BEGIN
	INSERT INTO `gm_sys_translog`(transid,tablename,columnname,olddata,newdata,portaluserid)
	VALUES (NEW.portaluserid,'gm_opc_puvehicles','','[NEW DATA]',NEW.vehicletypeid,NEW.portaluserid);
    END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`devuser`@`%`*/ /*!50003 TRIGGER `DEL_trg_puvehicles` AFTER DELETE ON `gm_opc_puvehicles` FOR EACH ROW BEGIN
	INSERT INTO `gm_sys_translog`(transid,tablename,columnname,olddata,newdata,portaluserid)
	VALUES (OLD.portaluserid,'gm_opc_puvehicles','','[DEL DATA]',OLD.vehicletypeid,OLD.portaluserid);
    END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

DROP TABLE IF EXISTS `gm_opc_socialaccounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gm_opc_socialaccounts` (
  `soid` int(11) NOT NULL AUTO_INCREMENT,
  `portaluserid` int(11) DEFAULT NULL,
  `socialacoount` enum('FACEBOOK','TWITTER','LINKEDIN','GOOGLE+') DEFAULT NULL,
  `socialemailid` varchar(200) DEFAULT NULL,
  `dateverified` datetime DEFAULT NULL,
  `verifiedby` int(11) DEFAULT NULL,
  PRIMARY KEY (`soid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `gm_opc_socialaccounts` WRITE;
/*!40000 ALTER TABLE `gm_opc_socialaccounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `gm_opc_socialaccounts` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `gm_sys_tips`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gm_sys_tips` (
  `tipid` int(11) NOT NULL AUTO_INCREMENT,
  `tipcategory` enum('REQUEST','OFFER','PROPOSAL') DEFAULT NULL,
  `tipmessage` text,
  `tstamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`tipid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gm_sys_tips`
--

LOCK TABLES `gm_sys_tips` WRITE;
/*!40000 ALTER TABLE `gm_sys_tips` DISABLE KEYS */;
/*!40000 ALTER TABLE `gm_sys_tips` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gm_sys_translog`
--

DROP TABLE IF EXISTS `gm_sys_translog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gm_sys_translog` (
  `txnid` int(11) NOT NULL AUTO_INCREMENT,
  `transid` int(11) DEFAULT NULL,
  `tablename` varchar(100) DEFAULT NULL,
  `columnname` varchar(100) DEFAULT NULL,
  `olddata` text,
  `newdata` text,
  `tstamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `portaluserid` int(11) DEFAULT NULL,
  PRIMARY KEY (`txnid`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gm_sys_translog`
--

LOCK TABLES `gm_sys_translog` WRITE;
/*!40000 ALTER TABLE `gm_sys_translog` DISABLE KEYS */;
INSERT INTO `gm_sys_translog` VALUES (5,2,'gm_gen_portaluser','','[NEW DATA]','2','2017-11-26 13:16:19',2),(6,2,'gm_gen_portaluser','isemailverified','N','Y','2017-11-26 13:16:35',2),(7,2,'opc_gm_bookingtrans','','[NEW DATA]','2','2017-11-26 13:38:32',2),(8,3,'opc_gm_bookingtrans','','[NEW DATA]','3','2017-11-26 15:48:41',2),(9,3,'opc_gm_bookingtrans','transtype','OFFER','REQUEST','2017-11-26 15:49:34',2),(10,3,'gm_gen_portaluser','','[NEW DATA]','3','2017-12-04 04:08:42',3),(11,4,'opc_gm_bookingtrans','','[NEW DATA]','4','2017-12-04 04:16:54',3),(12,5,'opc_gm_bookingtrans','','[NEW DATA]','5','2017-12-23 03:41:09',2),(13,6,'opc_gm_bookingtrans','','[NEW DATA]','6','2017-12-23 03:42:41',2),(14,7,'opc_gm_bookingtrans','','[NEW DATA]','7','2017-12-23 03:43:48',2),(15,8,'opc_gm_bookingtrans','','[NEW DATA]','8','2017-12-23 03:47:32',2),(16,9,'opc_gm_bookingtrans','','[NEW DATA]','9','2017-12-23 03:49:36',2),(17,10,'opc_gm_bookingtrans','','[NEW DATA]','10','2017-12-23 03:52:02',2),(18,11,'opc_gm_bookingtrans','','[NEW DATA]','11','2017-12-23 03:54:17',2),(19,12,'opc_gm_bookingtrans','','[NEW DATA]','12','2017-12-23 03:54:43',2),(20,13,'opc_gm_bookingtrans','','[NEW DATA]','13','2017-12-23 03:54:58',2),(21,14,'opc_gm_bookingtrans','','[NEW DATA]','14','2017-12-23 03:56:53',2),(22,15,'opc_gm_bookingtrans','','[NEW DATA]','15','2017-12-23 04:02:14',2),(23,16,'opc_gm_bookingtrans','','[NEW DATA]','16','2017-12-23 04:06:00',2),(24,17,'opc_gm_bookingtrans','','[NEW DATA]','17','2017-12-23 04:07:16',2),(25,18,'opc_gm_bookingtrans','','[NEW DATA]','18','2017-12-23 04:08:08',2),(26,19,'opc_gm_bookingtrans','','[NEW DATA]','19','2017-12-23 04:08:57',2),(27,20,'opc_gm_bookingtrans','','[NEW DATA]','20','2017-12-23 04:09:31',2),(28,21,'opc_gm_bookingtrans','','[NEW DATA]','21','2017-12-23 04:42:37',2),(29,22,'opc_gm_bookingtrans','','[NEW DATA]','22','2017-12-23 04:43:32',2),(30,23,'opc_gm_bookingtrans','','[NEW DATA]','23','2017-12-23 04:45:43',2),(31,2,'gm_gen_portaluser','lastlogin','2017-12-23 04:55:22','2017-12-23 05:54:41','2017-12-23 05:54:41',2);
/*!40000 ALTER TABLE `gm_sys_translog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opc_gm_bookingpics`
--

DROP TABLE IF EXISTS `opc_gm_bookingpics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `opc_gm_bookingpics` (
  `bookingid` int(11) DEFAULT NULL,
  `picurl` text,
  `picdefault` enum('Y','N') DEFAULT NULL,
  KEY `idx_bookingid` (`bookingid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opc_gm_bookingpics`
--

LOCK TABLES `opc_gm_bookingpics` WRITE;
/*!40000 ALTER TABLE `opc_gm_bookingpics` DISABLE KEYS */;
/*!40000 ALTER TABLE `opc_gm_bookingpics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opc_gm_bookingproposal`
--

DROP TABLE IF EXISTS `opc_gm_bookingproposal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `opc_gm_bookingproposal` (
  `bookingid` int(11) DEFAULT NULL,
  `portaluserid` int(11) DEFAULT NULL,
  `deliverycharge` decimal(20,4) DEFAULT NULL,
  `vehicletypeid` int(11) DEFAULT NULL,
  `targetdeldatetime` datetime DEFAULT NULL,
  `pickupdatetime` datetime DEFAULT NULL,
  `drivername` varchar(100) DEFAULT NULL,
  `drivercontact` varchar(100) DEFAULT NULL,
  `additionalnotes` text,
  `isreturntopickup` enum('Y','N') DEFAULT NULL,
  `datecancelled` datetime DEFAULT NULL,
  KEY `idx_bookingid` (`bookingid`),
  KEY `idx_portaluserid` (`portaluserid`),
  KEY `idx_vehicletypeid` (`vehicletypeid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opc_gm_bookingproposal`
--

LOCK TABLES `opc_gm_bookingproposal` WRITE;
/*!40000 ALTER TABLE `opc_gm_bookingproposal` DISABLE KEYS */;
/*!40000 ALTER TABLE `opc_gm_bookingproposal` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`devuser`@`%`*/ /*!50003 TRIGGER `INS_trg_bookingproposal` AFTER INSERT ON `opc_gm_bookingproposal` FOR EACH ROW BEGIN
	INSERT INTO `gm_sys_translog`(transid,tablename,columnname,olddata,newdata,portaluserid)
	VALUES (NEW.bookingid,'opc_gm_bookingproposal','','[NEW DATA]',NEW.vehicletypeid,NEW.portaluserid);	
    END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`devuser`@`%`*/ /*!50003 TRIGGER `UPD_trg_bookingproposal` AFTER UPDATE ON `opc_gm_bookingproposal` FOR EACH ROW BEGIN
	DECLARE xtablename VARCHAR(100); 
	DECLARE xtransid INT(11);
	
	SET xtablename = "opc_gm_bookingproposal";
	SET xtransid = OLD.bookingid;  	
	
	IF NEW.deliverycharge <> OLD.deliverycharge THEN
		INSERT INTO `gm_sys_translog`(transid,tablename,columnname,olddata,newdata,portaluserid)
		VALUES (xtransid,xtablename,'deliverycharge',OLD.deliverycharge,NEW.deliverycharge,OLD.portaluserid);
	END IF;
	IF NEW.vehicletypeid <> OLD.vehicletypeid THEN
		INSERT INTO `gm_sys_translog`(transid,tablename,columnname,olddata,newdata,portaluserid)
		VALUES (xtransid,xtablename,'vehicletypeid',OLD.vehicletypeid,NEW.vehicletypeid,OLD.portaluserid);
	END IF;
	
	IF NEW.targetdeldatetime <> OLD.targetdeldatetime THEN
		INSERT INTO `gm_sys_translog`(transid,tablename,columnname,olddata,newdata,portaluserid)
		VALUES (xtransid,xtablename,'targetdeldatetime',OLD.targetdeldatetime,NEW.targetdeldatetime,OLD.portaluserid);
	END IF;
	IF NEW.pickupdatetime <> OLD.pickupdatetime THEN
		INSERT INTO `gm_sys_translog`(transid,tablename,columnname,olddata,newdata,portaluserid)
		VALUES (xtransid,xtablename,'pickupdatetime',OLD.pickupdatetime,NEW.pickupdatetime,OLD.portaluserid);
	END IF;
	IF NEW.drivername <> OLD.drivername THEN
		INSERT INTO `gm_sys_translog`(transid,tablename,columnname,olddata,newdata,portaluserid)
		VALUES (xtransid,xtablename,'drivername',OLD.drivername,NEW.drivername,OLD.portaluserid);
	END IF;
	IF NEW.drivercontact <> OLD.drivercontact THEN
		INSERT INTO `gm_sys_translog`(transid,tablename,columnname,olddata,newdata,portaluserid)
		VALUES (xtransid,xtablename,'drivercontact',OLD.drivercontact,NEW.drivercontact,OLD.portaluserid);
	END IF;
	IF NEW.additionalnotes <> OLD.additionalnotes THEN
		INSERT INTO `gm_sys_translog`(transid,tablename,columnname,olddata,newdata,portaluserid)
		VALUES (xtransid,xtablename,'additionalnotes',OLD.additionalnotes,NEW.additionalnotes,OLD.portaluserid);
	END IF;
	
	IF NEW.isreturntopickup <> OLD.isreturntopickup THEN
		INSERT INTO `gm_sys_translog`(transid,tablename,columnname,olddata,newdata,portaluserid)
		VALUES (xtransid,xtablename,'isreturntopickup',OLD.isreturntopickup,NEW.isreturntopickup,OLD.portaluserid);
	END IF;
	
    END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `opc_gm_bookingtrans`
--

DROP TABLE IF EXISTS `opc_gm_bookingtrans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `opc_gm_bookingtrans` (
  `bookingid` int(11) NOT NULL AUTO_INCREMENT,
  `portaluserid` int(11) DEFAULT NULL,
  `transtype` enum('REQUEST','OFFER') DEFAULT NULL,
  `vehicletypeid` int(11) DEFAULT NULL,
  `pickuppoint` text,
  `destinationpoint` text,
  `packagetypeid` int(11) DEFAULT NULL,
  `packagedescription` text,
  `targetdeldatetime` datetime DEFAULT NULL,
  `additionalnotes` text,
  `pickupdatetime` datetime DEFAULT NULL,
  `deliverycharge` decimal(20,4) DEFAULT NULL,
  `contactpersondes` varchar(100) DEFAULT NULL,
  `contactnodes` varchar(100) DEFAULT NULL,
  `isreturntopickup` enum('Y','N') DEFAULT 'N',
  `paymentterms` enum('COD','CREDIT CARD') DEFAULT 'COD',
  `bookingstatus` enum('OPEN','ACCEPTED','IN-PROGRESS','DELIVERED','CANCELLED') DEFAULT NULL,
  `israted` enum('Y','N') DEFAULT 'N',
  `isfeedbackinvited` enum('Y','N') DEFAULT 'N',
  `isfragile` enum('Y','N') DEFAULT NULL,
  `isbelowroomtemp` enum('Y','N') DEFAULT NULL,
  `ismaintainroomtemp` enum('Y','N') DEFAULT NULL,
  `isperishable` enum('Y','N') DEFAULT NULL,
  `pickuppointlat` varchar(100) DEFAULT NULL,
  `pickuppointlong` varchar(100) DEFAULT NULL,
  `destinationlat` varchar(100) DEFAULT NULL,
  `destinationlong` varchar(100) DEFAULT NULL,
  `dateadded` datetime DEFAULT NULL,
  `pickupcity` varchar(100) DEFAULT NULL,
  `pickupregion` varchar(100) DEFAULT NULL,
  `pickupcountry` varchar(100) DEFAULT NULL,
  `destcity` varchar(100) DEFAULT NULL,
  `destregion` varchar(100) DEFAULT NULL,
  `destcountry` varchar(100) DEFAULT NULL,
  `totaldistancekm` float DEFAULT NULL,
  `totalproposalcnt` int(11) DEFAULT NULL,
  `deliverytypeid` int(1) DEFAULT NULL COMMENT '0-Door To Door; 1-Meet UP',
  PRIMARY KEY (`bookingid`),
  KEY `idx_portaluserid` (`portaluserid`),
  KEY `idx_packagetypeid` (`packagetypeid`),
  KEY `idx_transtype` (`transtype`),
  KEY `idx_vehicletypeid` (`vehicletypeid`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opc_gm_bookingtrans`
--

LOCK TABLES `opc_gm_bookingtrans` WRITE;
/*!40000 ALTER TABLE `opc_gm_bookingtrans` DISABLE KEYS */;
INSERT INTO `opc_gm_bookingtrans` VALUES (17,2,'OFFER',1,'Test','Test',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N','COD','OPEN','N','N','Y','Y','Y','Y',NULL,NULL,NULL,NULL,'2017-12-23 04:07:16',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(18,2,'OFFER',1,'Test','Test',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N','COD','OPEN','N','N','Y','N','Y','N',NULL,NULL,NULL,NULL,'2017-12-23 04:08:08',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(19,2,'OFFER',1,'Test','test',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N','COD','OPEN','N','N','N','N','N','N',NULL,NULL,NULL,NULL,'2017-12-23 04:08:57','test',NULL,NULL,'test',NULL,NULL,NULL,NULL,NULL),(20,2,'OFFER',1,'Test 2','Test 2',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N','COD','OPEN','N','N','Y','N','Y','N',NULL,NULL,NULL,NULL,'2017-12-23 04:09:31','Test 2',NULL,NULL,'Test 2',NULL,NULL,NULL,NULL,NULL),(21,2,'OFFER',1,'teST','TEST',1,NULL,NULL,NULL,NULL,155.0000,NULL,NULL,'N','COD','OPEN','N','N','N','N','N','N',NULL,NULL,NULL,NULL,'2017-12-23 04:42:37','teST',NULL,NULL,'TEST',NULL,NULL,NULL,NULL,NULL),(22,2,'REQUEST',1,'Test','Test',1,NULL,NULL,NULL,NULL,266.0000,NULL,NULL,'N','COD','OPEN','N','N','N','N','N','N',NULL,NULL,NULL,NULL,'2017-12-23 04:43:32','Test',NULL,NULL,'Test',NULL,NULL,NULL,NULL,NULL),(23,2,'REQUEST',1,'Test 3','Test 4',1,NULL,NULL,NULL,'2017-12-23 00:00:00',155.0000,NULL,NULL,'N','COD','OPEN','N','N','N','N','N','N',NULL,NULL,NULL,NULL,'2017-12-23 04:45:43','Test 3',NULL,NULL,'Test 4',NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `opc_gm_bookingtrans` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`devuser`@`%`*/ /*!50003 TRIGGER `INS_trg_bookingtrans` AFTER INSERT ON `opc_gm_bookingtrans` FOR EACH ROW BEGIN
	INSERT INTO `gm_sys_translog`(transid,tablename,columnname,olddata,newdata,portaluserid)
	VALUES (NEW.bookingid,'opc_gm_bookingtrans','','[NEW DATA]',NEW.bookingid,NEW.portaluserid);
    END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`devuser`@`%`*/ /*!50003 TRIGGER `UPD_trg_bookingtrans` AFTER UPDATE ON `opc_gm_bookingtrans` FOR EACH ROW BEGIN
	DECLARE xtablename VARCHAR(100); 
	declare xtransid INT(11);
	
	SET xtablename = "opc_gm_bookingtrans";
	set xtransid = OLD.bookingid;  	
	
	IF NEW.transtype <> OLD.transtype THEN
		INSERT INTO `gm_sys_translog`(transid,tablename,columnname,olddata,newdata,portaluserid)
		VALUES (xtransid,xtablename,'transtype',OLD.transtype,NEW.transtype,OLD.portaluserid);
	END IF;
	IF NEW.vehicletypeid <> OLD.vehicletypeid THEN
		INSERT INTO `gm_sys_translog`(transid,tablename,columnname,olddata,newdata,portaluserid)
		VALUES (xtransid,xtablename,'vehicletypeid',OLD.vehicletypeid,NEW.vehicletypeid,OLD.portaluserid);
	END IF;
	IF NEW.pickuppoint <> OLD.pickuppoint THEN
		INSERT INTO `gm_sys_translog`(transid,tablename,columnname,olddata,newdata,portaluserid)
		VALUES (xtransid,xtablename,'pickuppoint',OLD.pickuppoint,NEW.pickuppoint,OLD.portaluserid);
	END IF;	
	IF NEW.destinationpoint <> OLD.destinationpoint THEN
		INSERT INTO `gm_sys_translog`(transid,tablename,columnname,olddata,newdata,portaluserid)
		VALUES (xtransid,xtablename,'destinationpoint',OLD.destinationpoint,NEW.destinationpoint,OLD.portaluserid);
	END IF;	
	IF NEW.packagetypeid <> OLD.packagetypeid THEN
		INSERT INTO `gm_sys_translog`(transid,tablename,columnname,olddata,newdata,portaluserid)
		VALUES (xtransid,xtablename,'packagetypeid',OLD.packagetypeid,NEW.packagetypeid,OLD.portaluserid);
	END IF;
	
	IF NEW.packagedescription <> OLD.packagedescription THEN
		INSERT INTO `gm_sys_translog`(transid,tablename,columnname,olddata,newdata,portaluserid)
		VALUES (xtransid,xtablename,'packagedescription',OLD.packagedescription,NEW.packagedescription,OLD.portaluserid);
	END IF;	
	
	IF NEW.targetdeldatetime <> OLD.targetdeldatetime THEN
		INSERT INTO `gm_sys_translog`(transid,tablename,columnname,olddata,newdata,portaluserid)
		VALUES (xtransid,xtablename,'targetdeldatetime',OLD.targetdeldatetime,NEW.targetdeldatetime,OLD.portaluserid);
	END IF;
	IF NEW.additionalnotes <> OLD.additionalnotes THEN
		INSERT INTO `gm_sys_translog`(transid,tablename,columnname,olddata,newdata,portaluserid)
		VALUES (xtransid,xtablename,'additionalnotes',OLD.additionalnotes,NEW.additionalnotes,OLD.portaluserid);
	END IF;
	IF NEW.pickupdatetime <> OLD.pickupdatetime THEN
		INSERT INTO `gm_sys_translog`(transid,tablename,columnname,olddata,newdata,portaluserid)
		VALUES (xtransid,xtablename,'pickupdatetime',OLD.pickupdatetime,NEW.pickupdatetime,OLD.portaluserid);
	END IF;
	IF NEW.deliverycharge <> OLD.deliverycharge THEN
		INSERT INTO `gm_sys_translog`(transid,tablename,columnname,olddata,newdata,portaluserid)
		VALUES (xtransid,xtablename,'deliverycharge',OLD.deliverycharge,NEW.deliverycharge,OLD.portaluserid);
	END IF;	
	IF NEW.contactpersondes <> OLD.contactpersondes THEN
		INSERT INTO `gm_sys_translog`(transid,tablename,columnname,olddata,newdata,portaluserid)
		VALUES (xtransid,xtablename,'contactpersondes',OLD.contactpersondes,NEW.contactpersondes,OLD.portaluserid);
	END IF;
	IF NEW.contactnodes <> OLD.contactnodes THEN
		INSERT INTO `gm_sys_translog`(transid,tablename,columnname,olddata,newdata,portaluserid)
		VALUES (xtransid,xtablename,'contactnodes',OLD.contactnodes,NEW.contactnodes,OLD.portaluserid);
	END IF;
	IF NEW.isreturntopickup <> OLD.isreturntopickup THEN
		INSERT INTO `gm_sys_translog`(transid,tablename,columnname,olddata,newdata,portaluserid)
		VALUES (xtransid,xtablename,'isreturntopickup',OLD.isreturntopickup,NEW.isreturntopickup,OLD.portaluserid);
	END IF;
	IF NEW.paymentterms <> OLD.paymentterms THEN
		INSERT INTO `gm_sys_translog`(transid,tablename,columnname,olddata,newdata,portaluserid)
		VALUES (xtransid,xtablename,'paymentterms',OLD.paymentterms,NEW.paymentterms,OLD.portaluserid);
	END IF;	
	IF NEW.israted <> OLD.israted THEN
		INSERT INTO `gm_sys_translog`(transid,tablename,columnname,olddata,newdata,portaluserid)
		VALUES (xtransid,xtablename,'israted',OLD.israted,NEW.israted,OLD.portaluserid);
	END IF;	
	IF NEW.isfeedbackinvited <> OLD.isfeedbackinvited THEN
		INSERT INTO `gm_sys_translog`(transid,tablename,columnname,olddata,newdata,portaluserid)
		VALUES (xtransid,xtablename,'isfeedbackinvited',OLD.isfeedbackinvited,NEW.isfeedbackinvited,OLD.portaluserid);
	END IF;	
	IF NEW.isfragile <> OLD.isfragile THEN
		INSERT INTO `gm_sys_translog`(transid,tablename,columnname,olddata,newdata,portaluserid)
		VALUES (xtransid,xtablename,'isfragile',OLD.isfragile,NEW.isfragile,OLD.portaluserid);
	END IF;	
	IF NEW.isbelowroomtemp <> OLD.isbelowroomtemp THEN
		INSERT INTO `gm_sys_translog`(transid,tablename,columnname,olddata,newdata,portaluserid)
		VALUES (xtransid,xtablename,'isbelowroomtemp',OLD.isbelowroomtemp,NEW.isbelowroomtemp,OLD.portaluserid);
	END IF;
	IF NEW.ismaintainroomtemp <> OLD.ismaintainroomtemp THEN
		INSERT INTO `gm_sys_translog`(transid,tablename,columnname,olddata,newdata,portaluserid)
		VALUES (xtransid,xtablename,'ismaintainroomtemp',OLD.ismaintainroomtemp,NEW.ismaintainroomtemp,OLD.portaluserid);
	END IF;
	IF NEW.isperishable <> OLD.isperishable THEN
		INSERT INTO `gm_sys_translog`(transid,tablename,columnname,olddata,newdata,portaluserid)
		VALUES (xtransid,xtablename,'isperishable',OLD.isperishable,NEW.isperishable,OLD.portaluserid);
	END IF;
	IF NEW.deliverytypeid <> OLD.deliverytypeid THEN
		INSERT INTO `gm_sys_translog`(transid,tablename,columnname,olddata,newdata,portaluserid)
		VALUES (xtransid,xtablename,'deliverytypeid',OLD.deliverytypeid,NEW.deliverytypeid,OLD.portaluserid);
	END IF;
	IF NEW.bookingstatus = "CANCELLED" THEN
		INSERT INTO `gm_sys_translog`(transid,tablename,columnname,olddata,newdata,portaluserid)
		VALUES (xtransid,xtablename,'bookingstatus',OLD.bookingstatus,NEW.bookingstatus,OLD.portaluserid);
		
		INSERT INTO opc_gm_bookingtrans_cancelled select * from opc_gm_bookingtrans where bookingid = xtransid; 
		
		delete from opc_gm_bookingtrans where bookingid = xtransid; 
		
		CALL OPC_UpdProposalCount(xtransid); 
	END IF;
			
    END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `opc_gm_bookingtrans_cancelled`
--

DROP TABLE IF EXISTS `opc_gm_bookingtrans_cancelled`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `opc_gm_bookingtrans_cancelled` (
  `bookingid` int(11) NOT NULL AUTO_INCREMENT,
  `portaluserid` int(11) DEFAULT NULL,
  `transtype` enum('REQUEST','OFFER') DEFAULT NULL,
  `vehicletypeid` int(11) DEFAULT NULL,
  `pickuppoint` text,
  `destinationpoint` text,
  `packagetypeid` int(11) DEFAULT NULL,
  `packagedescription` text,
  `targetdeldatetime` datetime DEFAULT NULL,
  `additionalnotes` text,
  `pickupdatetime` datetime DEFAULT NULL,
  `deliverycharge` decimal(20,4) DEFAULT NULL,
  `contactpersondes` varchar(100) DEFAULT NULL,
  `contactnodes` varchar(100) DEFAULT NULL,
  `isreturntopickup` enum('Y','N') DEFAULT 'N',
  `paymentterms` enum('COD','CREDIT CARD') DEFAULT 'COD',
  `bookingstatus` enum('OPEN','ACCEPTED','IN-PROGRESS','DELIVERED','CANCELLED') DEFAULT NULL,
  `israted` enum('Y','N') DEFAULT 'N',
  `isfeedbackinvited` enum('Y','N') DEFAULT 'N',
  `isfragile` enum('Y','N') DEFAULT NULL,
  `isbelowroomtemp` enum('Y','N') DEFAULT NULL,
  `ismaintainroomtemp` enum('Y','N') DEFAULT NULL,
  `isperishable` enum('Y','N') DEFAULT NULL,
  `pickuppointlat` varchar(100) DEFAULT NULL,
  `pickuppointlong` varchar(100) DEFAULT NULL,
  `destinationlat` varchar(100) DEFAULT NULL,
  `destinationlong` varchar(100) DEFAULT NULL,
  `dateadded` datetime DEFAULT NULL,
  `pickupcity` varchar(100) DEFAULT NULL,
  `pickupregion` varchar(100) DEFAULT NULL,
  `pickupcountry` varchar(100) DEFAULT NULL,
  `destcity` varchar(100) DEFAULT NULL,
  `destregion` varchar(100) DEFAULT NULL,
  `destcountry` varchar(100) DEFAULT NULL,
  `totaldistancekm` float DEFAULT NULL,
  `totalproposalcnt` int(11) DEFAULT NULL,
  `deliverytypeid` int(1) DEFAULT NULL,
  PRIMARY KEY (`bookingid`),
  KEY `idx_portaluserid` (`portaluserid`),
  KEY `idx_packagetypeid` (`packagetypeid`),
  KEY `idx_transtype` (`transtype`),
  KEY `idx_vehicletypeid` (`vehicletypeid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opc_gm_bookingtrans_cancelled`
--

LOCK TABLES `opc_gm_bookingtrans_cancelled` WRITE;
/*!40000 ALTER TABLE `opc_gm_bookingtrans_cancelled` DISABLE KEYS */;
/*!40000 ALTER TABLE `opc_gm_bookingtrans_cancelled` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opc_gm_directmessage`
--

DROP TABLE IF EXISTS `opc_gm_directmessage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `opc_gm_directmessage` (
  `dmid` int(11) NOT NULL AUTO_INCREMENT,
  `senderid` int(11) DEFAULT NULL,
  `receipientid` int(11) DEFAULT NULL,
  `bookingid` int(11) DEFAULT NULL,
  `isread` enum('Y','N') DEFAULT NULL,
  `message` text,
  `tstamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`dmid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opc_gm_directmessage`
--

LOCK TABLES `opc_gm_directmessage` WRITE;
/*!40000 ALTER TABLE `opc_gm_directmessage` DISABLE KEYS */;
/*!40000 ALTER TABLE `opc_gm_directmessage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opc_gm_portalusersearch`
--

DROP TABLE IF EXISTS `opc_gm_portalusersearch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `opc_gm_portalusersearch` (
  `portaluserid` int(11) NOT NULL AUTO_INCREMENT,
  `transactiontype` varchar(100) DEFAULT NULL,
  `fromcity` varchar(100) DEFAULT NULL,
  `fromto` varchar(100) DEFAULT NULL,
  `preferredvehicle` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`portaluserid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opc_gm_portalusersearch`
--

LOCK TABLES `opc_gm_portalusersearch` WRITE;
/*!40000 ALTER TABLE `opc_gm_portalusersearch` DISABLE KEYS */;
/*!40000 ALTER TABLE `opc_gm_portalusersearch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opc_gm_ratings`
--

DROP TABLE IF EXISTS `opc_gm_ratings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `opc_gm_ratings` (
  `ratingid` int(11) NOT NULL AUTO_INCREMENT,
  `raterid` int(11) DEFAULT NULL COMMENT 'rater portal user id',
  `rateeid` int(11) DEFAULT NULL COMMENT 'ratee portal user id',
  `bookingid` int(11) DEFAULT NULL COMMENT 'reference transaction',
  `daterated` datetime DEFAULT NULL,
  `raterfbtitle` varchar(100) DEFAULT NULL COMMENT 'rater feedback title',
  `raterfbdesc` text COMMENT 'rater feedback desc',
  `rating` int(5) DEFAULT NULL,
  PRIMARY KEY (`ratingid`),
  KEY `idx_raterid` (`raterid`),
  KEY `idx_rateeid` (`rateeid`),
  KEY `idx_bookingid` (`bookingid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opc_gm_ratings`
--

LOCK TABLES `opc_gm_ratings` WRITE;
/*!40000 ALTER TABLE `opc_gm_ratings` DISABLE KEYS */;
/*!40000 ALTER TABLE `opc_gm_ratings` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`devuser`@`%`*/ /*!50003 TRIGGER `INS_trg_ratings` AFTER INSERT ON `opc_gm_ratings` FOR EACH ROW BEGIN
	
	declare xrating INT(5); 
    
	INSERT INTO `gm_sys_translog`(transid,tablename,columnname,olddata,newdata,portaluserid)
	VALUES (NEW.bookingid,'opc_gm_ratings','','[NEW DATA]',NEW.rateeid,NEW.raterid);
	
	SELECT AVG(rating) AS userrating
	FROM opc_gm_ratings 
	where rateeid = NEW.rateeid
	GROUP BY rateeid into xrating; 
	
	update gm_gen_portaluser set userrating = xrating where portaluserid = NEW.rateeid;  
		
    END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping events for database 'courierdb'
--

--
-- Dumping routines for database 'courierdb'
--
/*!50003 DROP FUNCTION IF EXISTS `opc_fn_computedistancekm` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`devuser`@`%` FUNCTION `opc_fn_computedistancekm`(
		xlatitude1 FLOAT, 
		xlongtitude1 FLOAT, 
		xlatitude2 FLOAT, 
		xlongtitude2 FLOAT
	) RETURNS float
BEGIN
        RETURN 6371 * 2 * ASIN(SQRT(
            POWER(SIN((xlatitude1 - ABS(xlatitude2)) * PI()/180 / 2),
            2) + COS(xlatitude1 * PI()/180 ) * COS(ABS(xlatitude2) *
            PI()/180) * POWER(SIN((xlongtitude1 - xlongtitude2) *
            PI()/180 / 2), 2) ));
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `opc_fn_setproposalcount` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`devuser`@`%` FUNCTION `opc_fn_setproposalcount`(
	xbookingid int(11)
    ) RETURNS int(11)
BEGIN
     
     	DECLARE xproposalcount INT(11); 
     	
	SELECT COUNT(bookingid) AS proposalcnt
	FROM opc_gm_bookingproposal 
	WHERE bookingid = xbookingid AND bookingstatus <> "CANCELLED" 
	GROUP BY bookingid INTO xproposalcount;	
	
	UPDATE opc_gm_bookingtrans SET totalproposalcnt = xproposalcount WHERE bookingid = xbookingid; 
	
	return 0; 
	
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `OPC_DelBookingPics` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`devuser`@`%` PROCEDURE `OPC_DelBookingPics`(
		xbookingid INT(11),
		xpicurl text
	)
BEGIN
	delete from `courierdb`.`opc_gm_bookingpics` 
	where bookingid = xbookingid and picurl = xpicurl; 
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `OPC_DelCredShared` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`devuser`@`%` PROCEDURE `OPC_DelCredShared`(
		xportaluserid INT(11),
		xsharedtoid INT(11)
	)
BEGIN
	delete from `courierdb`.`gm_opc_credshared` 
	where portaluserid = xportaluserid and sharedtoid = xsharedtoid; 
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `OPC_DelPurCredibility` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`devuser`@`%` PROCEDURE `OPC_DelPurCredibility`(
		xportaluserid INT(11),
		xdocumentid INT(11)
	)
BEGIN
	delete from `courierdb`.`gm_opc_pucredibility` 
	where portaluserid = xportaluserid and documentid = xdocumentid; 
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `OPC_DelPurVehicles` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`devuser`@`%` PROCEDURE `OPC_DelPurVehicles`(
		xportaluserid INT(11),
		xplatenumber varchar(10)
	)
BEGIN
	delete from `courierdb`.`gm_opc_puvehicles` 
	where portaluserid = xportaluserid and platenumber = xplatenumber; 
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `OPC_DelPuSocialCredibility` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`devuser`@`%` PROCEDURE `OPC_DelPuSocialCredibility`(
		xportaluserid INT(11),
		xsocialaccount VARCHAR(100)
	)
BEGIN
	delete from `courierdb`.`gm_opc_pusocialaccounts` 
	where portaluserid = xportaluserid and socialaccount = xsocialaccount; 
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `OPC_InsBookingPics` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`devuser`@`%` PROCEDURE `OPC_InsBookingPics`(
	xbookingid INT(11),
	xpicurl text,
	xpicdefault VARCHAR(2)
    )
BEGIN
	
	INSERT INTO `courierdb`.`opc_gm_bookingpics` (
		bookingid,
		picurl,
		picdefault
	) VALUES (
		xbookingid,
		xpicurl,
		xpicdefault 
	);
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `OPC_InsBookingProposal` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`devuser`@`%` PROCEDURE `OPC_InsBookingProposal`(
	xbookingid INT(11),
	xportaluserid int(11),
	xdeliverycharge DECIMAL(20,4),
	xvehicletypeid int(11),
	xtargetdeldatetime datetime,
	xpickupdatetime datetime,
	xdrivername varchar(100),
	xdrivercontact varchar(100),
	xadditionalnotes text,
	xisreturntopickup varchar(2)
    )
BEGIN
	
	INSERT INTO `courierdb`.`opc_gm_bookingproposal` (
		bookingid,
		portaluserid,
		deliverycharge,
		vehicletypeid,
		targetdeldatetime,
		pickupdatetime,
		drivername,
		drivercontact,
		additionalnotes,
		isreturntopickup
	) VALUES (
		xbookingid,
		xportaluserid,
		xdeliverycharge,
		xvehicletypeid,
		xtargetdeldatetime,
		xpickupdatetime, 
		xdrivername,
		xdrivercontact,
		xadditionalnotes,
		xisreturntopickup
	);
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `OPC_InsBookingTrans` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`devuser`@`%` PROCEDURE `OPC_InsBookingTrans`(
		xportaluserid INT(11), 
		xtranstype VARCHAR(20), 
		xvehicletypeid INT(11), 
		xpickuppoint TEXT, 
		xdestinationpoint TEXT, 
		xpackagetypeid INT(11), 
		xpackagedescription TEXT, 
		xtargetdeldatetime DATETIME, 
		xadditionalnotes TEXT, 
		xpickupdatetime DATETIME, 
		xdeliverycharge DECIMAL(20,4), 
		xcontactpersondes VARCHAR(100), 
		xcontactnodes VARCHAR(100), 
		xisreturntopickup VARCHAR(2), 
		xpaymentterms VARCHAR(20), 
		xisfragile VARCHAR(2), 
		xisbelowroomtemp VARCHAR(2), 
		xismaintainroomtemp VARCHAR(2), 
		xisperishable VARCHAR(2), 
		xpickuppointlat VARCHAR(50), 
		xpickuppointlong VARCHAR(50), 
		xdestinationlat VARCHAR(50), 
		xdestinationlong VARCHAR(50),
		xpickupcity varchar(100),
		xpickupregion varchar(100),
		xpickupcountry varchar(100),
		xdestcity varchar(100),
		xdestregion varchar(100),
		xdestcountry varchar(100),
		xdeliverytypeid INT(11)  
    )
BEGIN
	INSERT INTO `courierdb`.`opc_gm_bookingtrans` (
		`portaluserid`, 
		`transtype`, 
		`vehicletypeid`, 
		`pickuppoint`, 
		`destinationpoint`, 
		`packagetypeid`, 
		`packagedescription`, 
		`targetdeldatetime`, 
		`additionalnotes`, 
		`pickupdatetime`, 
		`deliverycharge`, 
		`contactpersondes`, 
		`contactnodes`, 
		`isreturntopickup`, 
		`paymentterms`, 
		`bookingstatus`, 
		`israted`, 
		`isfeedbackinvited`, 
		`isfragile`, 
		`isbelowroomtemp`, 
		`ismaintainroomtemp`, 
		`isperishable`, 
		`pickuppointlat`, 
		`pickuppointlong`, 
		`destinationlat`, 
		`destinationlong`, 
		`dateadded`,
		`pickupcity`,
		`pickupregion`,
		`pickupcountry`,
		`destcity`,
		`destregion`,
		`destcountry`,
		`deliverytypeid` 
	) VALUES (
		xportaluserid, 
		xtranstype, 
		vehicletypeid, 
		xpickuppoint, 
		xdestinationpoint, 
		xpackagetypeid, 
		xpackagedescription, 
		xtargetdeldatetime, 
		xadditionalnotes, 
		xpickupdatetime, 
		xdeliverycharge, 
		xcontactpersondes, 
		xcontactnodes, 
		xisreturntopickup, 
		xpaymentterms, 
		'OPEN', 
		'N', 
		'N', 
		xisfragile, 
		xisbelowroomtemp, 
		xismaintainroomtemp, 
		xisperishable, 
		xpickuppointlat, 
		xpickuppointlong, 
		xdestinationlat, 
		xdestinationlong, 
		NOW(),
		xpickupcity,
		xpickupregion, 
		xpickupcountry,
		xdestcity,
		xdestregion, 
		xdestcountry,
		xdeliverytypeid 
	);
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `OPC_InsCredShared` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`devuser`@`%` PROCEDURE `OPC_InsCredShared`(
	xportaluserid INT(11),
	xsharedtoid INT(11)
    )
BEGIN
    
	INSERT INTO `courierdb`.`gm_opc_credshared` (
		portaluserid,
		sharedtoid,
		datetimeshared
	) VALUES (
		xportaluserid,
		xsharedtoid,
		NOW()
	);
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `OPC_InsDirectMessage` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`devuser`@`%` PROCEDURE `OPC_InsDirectMessage`(
		xsenderid int(11),
		xreceipientid int(11),
		xbookingid INT(11),
		xisread VARCHAR(2),
		xmessage text
	)
BEGIN
	INSERT INTO `courierdb`.`opc_gm_directmessage` (
		senderid,
		receipientid,
		bookingid,
		isread,
		message,
		tstamp
	) values (
		xsenderid,
		xreceipientid,
		xbookingid, 
		'N',
		xmessage,
		NOW()
	);
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `OPC_InsPortalUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`devuser`@`%` PROCEDURE `OPC_InsPortalUser`(
	xaccounttype VARCHAR(20), 
	xcompanyname VARCHAR(100),
	xfirstname varchar(100),
	xlastname varchar(100),
	xemailaddress varchar(100),
	xpassword text,
	xdefaultaddress varchar(20),
	xmobileno varchar(20),
	xcurrencyid int(11),
	xdefaultpayment varchar(100),
	xlinkedaccount varchar(100),
	xaddresslat varchar(45),
	xaddresslong varchar(45),
	xavatarlink TEXT
    )
BEGIN
	INSERT INTO `courierdb`.`gm_gen_portaluser` (
		`accounttype`, 
		`companyname`, 
		`firstname`, 
		`lastname`, 
		`emailaddress`, 
		`password`, 
		`defaultaddress`, 
		`mobileno`, 
		`currencyid`, 
		`defaultpayment`, 
		`dateadded`, 
		`datemodified`, 
		`lastlogin`, 
		`accountactive`, 
		`linkedaccount`, 
		`isemailverified`, 
		`addresslat`, 
		`addresslong`, 
		`avatarlink`
	) VALUES (
		xaccounttype, 
		xcompanyname, 
		xfirstname, 
		xlastname, 
		xemailaddress, 
		xpassword, 
		defaultaddress, 
		mobileno, 
		currencyid, 
		defaultpayment, 
		NOW(), 
		xaccountactive, 
		xlinkedaccount, 
		xaddresslat, 
		xaddresslong, 
		xavatarlink
	); 
	
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `OPC_InsPuCredibility` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`devuser`@`%` PROCEDURE `OPC_InsPuCredibility`(
	xportaluserid INT(11),
	xdocumentid INT(11),
	xfilename VARCHAR(100),
	xexpirydate DATE
    )
BEGIN
    
	INSERT INTO `courierdb`.`gm_opc_pucredibility` (
		portaluserid,
		documentidid,
		filename,
		expirydate,
		nextreminder
	) VALUES (
		xportaluserid,
		xdocumentid,
		xfilename,
		xexpirydate,
		DATE_SUB(xexpirydate, INTERVAL 30 DAY) 
	);
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `OPC_InsPurVehicles` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`devuser`@`%` PROCEDURE `OPC_InsPurVehicles`(
	xportaluserid INT(11),
	xvehicletypeid INT(11),
	xvehiclemake Varchar(100),
	xvehiclemodel VARCHAR(100),
	xplatenumber varchar(10),
	xfilename VARCHAR(100)
    )
BEGIN
    
	INSERT INTO `courierdb`.`gm_opc_purvehicles` (
		portaluserid,
		documentidid,
		filename,
		expirydate,
		nextreminder
	) VALUES (
		xportaluserid,
		xdocumentid,
		xfilename,
		xexpirydate,
		DATE_SUB(xexpirydate, INTERVAL 30 DAY) 
	);
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `OPC_InsPuSocialCredibility` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`devuser`@`%` PROCEDURE `OPC_InsPuSocialCredibility`(
	xportaluserid INT(11),
	xsocialaccount VARCHAR(100),
	xsocialemailid VARCHAR(200)
    )
BEGIN
    
	INSERT INTO `courierdb`.`gm_opc_socialaccounts` (
		portaluserid,
		socialaccount,
		socialemailid
	) VALUES (
		xportaluserid,
		xsocialaccount,
		xsocialemailid 
	);
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `OPC_InsRatings` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`devuser`@`%` PROCEDURE `OPC_InsRatings`(
		xraterid int(11),
		xrateeid int(11),
		xbookingid INT(11),
		xraterfbtitle VARCHAR(100),
		xraterfbdesc text,
		xrating int(5)
	)
BEGIN
	INSERT INTO `courierdb`.`opc_gm_ratings` (
		raterid,
		rateeid,
		bookingid,
		daterated,
		raterfbtitle,
		raterfbdesc,
		rating
	) values (
		xraterid,
		xrateeid,
		xbookingid, 
		NOW(),
		xraterfbtitle,
		xraterfbdesc,
		xrating 
	);
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `OPC_SelAllBookingTrans` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`devuser`@`%` PROCEDURE `OPC_SelAllBookingTrans`(
		xtranstype int(1), 
		xfromcity VARCHAR(255),
		xtocity VARCHAR(255),
		xvehicletype INT(11), 
		xsortid INT(1)
	)
BEGIN
	
	declare xselectstmt text; 
	declare xwherestmt text;
	declare xorderbystmt text; 
	
	set xselectstmt = 
	"SELECT a.bookingid, a.pickupdatetime, a.transtype, a.pickupcity, a.destcity, a.pickupregion, a.destregion,  
		a.totalproposalcnt, a.targetdeldatetime, a.deliverycharge, a.paymentterms, a.isfragile, 
		a.isbelowroomtemp, a.ismaintainroomtemp, a.isperishable, a.totaldistancekm,
		a.dateadded, b.vehicletypedesc, b.vehicleicon, c.accounttype, c.companyname, 
		c.firstname, c.lastname, c.userrating, d.packagetypeicon, d.packagetypedesc, 
		c.isonline  
	FROM ((opc_gm_bookingtrans a LEFT JOIN gm_gen_vehicletype b on a.vehicletypeid = b.vehicletypeid)
		LEFT JOIN gm_gen_portaluser c on a.portaluserid = c.portaluserid)
		LEFT JOIN gm_gen_packagetype d on a.packagetypeid = d.packagetypeid";
				
	if xtranstype = 0 THEN -- OFFER=1 REQUEST=0
		set xwherestmt = " WHERE a.transtype = 'REQUEST' ";
	else
		set xwherestmt = " WHERE a.transtype = 'OFFER' "; 
	END IF;
	
	IF xfromcity <> "" THEN
		set xwherestmt = concat(xwherestmt, 
			"AND CONCAT(TRIM(a.pickupcity),'/',TRIM(a.pickupregion),'/',TRIM(a.pickupcountry)) = xfromcity ");
	END IF; 
	
	IF xtocity <> "" THEN
		SET xwherestmt = CONCAT(xwherestmt, 
			"AND CONCAT(TRIM(a.destcity),'/',TRIM(a.destregion),'/',TRIM(a.destcountry)) = b.tocity ");
	END IF; 
	
	IF xvehicletype <> "" THEN
		SET xwherestmt = CONCAT(xwherestmt, 
			"AND b.vehicletypedesc = xvehicletype ");
	END IF; 
	case xsortid
	
		when 0 then
			SET xorderbystmt = "ORDER BY a.targetdeldatetime ASC"; 
		when 1 then 
			SET xorderbystmt = "ORDER BY a.totaldistancekm ASC";
 		WHEN 2 THEN 
			SET xorderbystmt = "ORDER BY c.userrating DESC";
	end case; 
	SET @basesql:=CONCAT(xselectstmt, xwherestmt, xorderbystmt);
	PREPARE stmt FROM @basesql;
	EXECUTE stmt ;
	DEALLOCATE PREPARE stmt;	
	
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `OPC_SelAllCredibilityPerUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`devuser`@`%` PROCEDURE `OPC_SelAllCredibilityPerUser`(
	xportaluserid int(11)
    )
BEGIN
	select a.creditid, a.filename, a.expirydate, a.nextreminder, a.dateverified, a.verifiedby,
		b.documentdesc, b.points, b.docimagelink
	from gm_opc_pucredibility a right join gm_gen_documents b on a.documentid = b.documentid 
	where portaluserid = xportaluserid OR isnull(portaluserid); 
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `OPC_SelAllCredSharedPerUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`devuser`@`%` PROCEDURE `OPC_SelAllCredSharedPerUser`(
	xportaluserid INT(11)
    )
BEGIN
	
	select portaluserid, sharedtoid, datetimeshared 
	from gm_opc_credshared
	where portaluserid = xportaluserid; 
	
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `OPC_SelAllCurrency` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`devuser`@`%` PROCEDURE `OPC_SelAllCurrency`(xopt INT(1))
BEGIN
	Select currencyid, currencycode, currencydesc, currencyicon
	from gm_gen_currency;  
	
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `OPC_SelAllDocuments` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`devuser`@`%` PROCEDURE `OPC_SelAllDocuments`(xopt INT(1))
BEGIN
    
	Select documentid, documentdesc, points
	from gm_gen_documents;  
	
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `OPC_SelAllPackageType` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`devuser`@`%` PROCEDURE `OPC_SelAllPackageType`(xopt INT(1))
BEGIN
	Select packagetypeid, packagetypecode, packagetypedesc 
	from gm_gen_packagetype;  
	
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `OPC_SelAllVehiclesPerUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`devuser`@`%` PROCEDURE `OPC_SelAllVehiclesPerUser`(
	xportaluserid int(11)
    )
BEGIN
	select a.purvehicletypeid, a.vehicletypeid, a.vehiclemake,
		a.vehiclemodel, a.platenumber, a.dateverified, b.vehicletypecode,
		b.vehicletypedesc, b.capacity, b.capacityuom, b.vehicleicon
	from gm_opc_purvehicles a left join gm_gen_vehicletype b on a.vehicletypeid = b.vehicletypeid
	where a.portaluserid = xportaluserid; 
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `OPC_SelBookingPics` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`devuser`@`%` PROCEDURE `OPC_SelBookingPics`(
	xbookingid int(11)
    )
BEGIN
	select bookingid, picurl, picdefault
	from opc_gm_bookingpics where bookingid = xbookingid; 
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `OPC_SelBookingProposal` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`devuser`@`%` PROCEDURE `OPC_SelBookingProposal`(
	xbookingid int(11)
    )
BEGIN
	select a.bookingid, a.portaluserid, a.deliverycharge, a.vehicletypeid,
		a.targetdeldatetime, a.pickupdatetime, a.drivername, a.drivercontact, 
		a.additionalnotes, a.isreturnpickup, a.datecancelled, b.vehicleicon, 
		b.vehicletypedesc, b.capacity, b.capacityuom
	from opc_gm_bookingproposal a left join gm_gen_vehicletype b on a.vehicletypeid = b.vehicletypeid 
	where bookingid = xbookingid; 
	
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `OPC_SelBookingTrans` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`devuser`@`%` PROCEDURE `OPC_SelBookingTrans`(xbookingid INT(11))
BEGIN
	SELECT a.bookingid, a.portaluserid, a.transtype, a.pickuppoint, a.destinationpoint, 
		a.packagedescription, a.targetdeldatetime, a.additionalnotes, a.pickupdatetime, 
		a.deliverycharge, a.contactpersondes, a.contactnodes, a.isreturntopickup, a.paymentterms,
		a.bookingstatus, a.israted, a.isfeedbackinvited, a.isfragile, a.isbelowroomtemp, 
		a.ismaintainroomtemp, a.isperishable, a.pickuppointlat, a.pickuppointlong, a.destinationlat,
		a.destinationlong,  a.dateadded, b.vehicletypedesc, b.vehicleicon, 
		c.packagetypedesc, d.accounttype, d.companyname, concat(d.firstname, " ", d.lastname) as portalusername, 
		a.totaldistancekm, a.totalproposalcnt, a.pickupcity, a.pickupregion, a.pickupcountry, a.destcity, 
		a.destregion, a.destcountry
	FROM (((opc_gm_bookingtrans a LEFT JOIN gm_gen_vehicletype b ON a.`vehicletypeid` = b.`vehicletypeid`)
		LEFT JOIN gm_gen_packagetype c ON a.`packagetypeid` = c.`packagetypeid`))
		left join gm_gen_portaluser d on a.portaluserid = d.portaluserid 
	WHERE bookingid = xbookingid; 
	
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `OPC_SelBookingTransByPortalUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`devuser`@`%` PROCEDURE `OPC_SelBookingTransByPortalUser`(xportaluserid INT(11), xtranstype varchar(255))
BEGIN
	SELECT a.bookingid, a.portaluserid, a.transtype, a.pickuppoint, a.destinationpoint, 
		a.packagedescription, a.targetdeldatetime, a.additionalnotes, a.pickupdatetime, 
		a.deliverycharge, a.contactpersondes, a.contactnodes, a.isreturntopickup, a.paymentterms,
		a.bookingstatus, a.israted, a.isfeedbackinvited, a.isfragile, a.isbelowroomtemp, 
		a.ismaintainroomtemp, a.isperishable, a.pickuppointlat, a.pickuppointlong, a.destinationlat,
		a.destinationlong, a.dateadded, b.vehicletypedesc, b.vehicleicon, 
		c.packagetypedesc, d.accounttype, d.companyname, concat(d.firstname, " ", d.lastname) as portalusername, 
		a.totaldistancekm, a.totalproposalcnt, a.pickupcity, a.pickupregion, a.pickupcountry, a.destcity, 
		a.destregion, a.destcountry
	FROM (((opc_gm_bookingtrans a LEFT JOIN gm_gen_vehicletype b ON a.`vehicletypeid` = b.`vehicletypeid`)
		LEFT JOIN gm_gen_packagetype c ON a.`packagetypeid` = c.`packagetypeid`))
		left join gm_gen_portaluser d on a.portaluserid = d.portaluserid 
	WHERE a.portaluserid = xportaluserid 
    AND a.transtype = xtranstype; 
    
	
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `OPC_SelPortalUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`devuser`@`%` PROCEDURE `OPC_SelPortalUser`(
	xportaluserid int(11)
    )
BEGIN
	select a.accounttype, a.companyname, a.firstname, a.lastname, a.emailaddress, 
		a.password, a.defaultaddress, a.mobileno, a.defaultpayment, a.lastlogin,
		a.accountactive, a.linkedaccount, a.isemailverified, a.addresslat,
		a.addresslong, a.avatarlink, b.currencydesc, a.dateadded, a.datemodifed, 
		a.isonline 
	from gm_gen_portaluser a left join gm_gen_currency b on a.currencyid = b.currencyid
	where portaluserid = xportaluserid; 
	
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `OPC_SelPortalUserFeedbacks` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`devuser`@`%` PROCEDURE `OPC_SelPortalUserFeedbacks`(
		xportaluserid INT(11)
	)
BEGIN
	
	SELECT b.ratingid, concat(c.firstname, " ", c.lastname) as ratername, concat(d.firstname, " ", d.lastname) as rateename,
		b.raterfbtitle, b.raterfbdesc, b.rating
	FROM (opc_gm_ratings b left join gm_gen_portaluser c on b.raterid = c.portaluserid) 
		left join gm_gen_portaluser d on b.rateeid = d.portaluserid 
 	WHERE b.rateeid = xportaluserid
	ORDER BY `cntrating` DESC;
	
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `OPC_SelPortalUserPassword` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`devuser`@`%` PROCEDURE `OPC_SelPortalUserPassword`(
	xemailaddress varchar(100)
    )
BEGIN
	
	select `password` 
	from gm_gen_portaluser 
	where emailaddress = xemailaddress; 
	
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `OPC_SelPortalUserRating` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`devuser`@`%` PROCEDURE `OPC_SelPortalUserRating`(
		xportaluserid INT(11)
	)
BEGIN
	SELECT b.portaluserid, COUNT(b.rating) AS cntrating
	FROM opc_gm_ratings b
	WHERE b.rateeid = xportaluserid
	GROUP BY `cntrating`
	ORDER BY `cntrating` DESC;
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `OPC_SelPortalUserWithRating` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`devuser`@`%` PROCEDURE `OPC_SelPortalUserWithRating`(
    	xportaluserid INT(11)
	)
BEGIN
    
	SELECT a.accounttype, a.companyname, a.firstname, a.lastname, a.defaultaddress, 
		a.mobileno, a.isonline, COUNT(b.rating) as cntrating
	FROM (gm_gen_portaluser a LEFT JOIN opc_gm_ratings b ON a.portaluserid = b.rateeid)
	WHERE a.portaluserid = xportaluserid
	GROUP BY `cntrating`
	order by `cntrating` desc; 
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `OPC_SelTip` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`devuser`@`%` PROCEDURE `OPC_SelTip`(
	xtipcategory varchar(20)
    )
BEGIN
	declare xmax int(11);
	declare xrnum int(11); 
	
	select max(tipid) from gm_sys_tips 
	WHERE tipcategory = xtipcategory into xmax;
	
	set xrnum = FLOOR( 1 + RAND( ) * xmax );
	
	select tipcategory 
	from gm_sys_tips
	where tipcategory = xtipcategory and tipid = xrnum; 
	
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `OPC_SelVehicleType` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`devuser`@`%` PROCEDURE `OPC_SelVehicleType`(
	xvehicletypeid INT(11)
    )
BEGIN
	select vehicletypecode, vehicletypedesc, capacity, capacityuom,
		vehicleicon 
	from gm_gen_vehicletype
	where vehicletypeid = xvehicletypeid;  
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `OPC_UpdActivateAccount` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`devuser`@`%` PROCEDURE `OPC_UpdActivateAccount`(
		xportaluserid int(11)
	)
BEGIN
	update courierdb.`gm_gen_portaluser` set
		isemailverified = "Y",
		acountactive = "Y"
	where portaluserid = xportaluserid; 
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `OPC_UpdBookingProposal` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`devuser`@`%` PROCEDURE `OPC_UpdBookingProposal`(
    	xbookingid INT(11),
	xportaluserid INT(11),
	xdeliverycharge DECIMAL(20,4),
	xvehicletypeid INT(11),
	xtargetdeldatetime DATETIME,
	xpickupdatetime DATETIME,
	xdrivername VARCHAR(100),
	xdrivercontact VARCHAR(100),
	xadditionalnotes TEXT,
	xisreturntopickup VARCHAR(2)
	)
BEGIN
	
	UPDATE `courierdb`.`opc_gm_bookingproposal` SET
		deliverycharge = xdeliverycharge,
		vehicletypeid = xvehicletypeid,
		targetdeldatetime = xpickdatetime,
		drivername = xdrivername, 
		drivercontact = xdrivercontact,
		additionalnotes = xadditionalnotes,
		isreturntopickup = xisreturntopickup
	where bookingid = xbookingid and portaluserid = xportaluserid; 
	
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `OPC_UpdBookingProposalCancel` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`devuser`@`%` PROCEDURE `OPC_UpdBookingProposalCancel`(
		xbookingid INT(11),
		xportaluserid INT(11)
	)
BEGIN
	UPDATE `courierdb`.`opc_gm_bookingproposal` 
	set datecancelled = now() 
	where bookingid = xbookingid and portaluserid = xportaluserid; 
	
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `OPC_UpdBookingTrans` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`devuser`@`%` PROCEDURE `OPC_UpdBookingTrans`(
		xbookingid int(11),
		xtranstype VARCHAR(20), 
		xvehicletypeid INT(11), 
		xpickuppoint TEXT, 
		xdestinationpoint TEXT, 
		xpackagetypeid INT(11), 
		xpackagedescription TEXT, 
		xtargetdeldatetime DATETIME, 
		xadditionalnotes TEXT, 
		xpickupdatetime DATETIME, 
		xdeliverycharge DECIMAL(20,4), 
		xcontactpersondes VARCHAR(100), 
		xcontactnodes VARCHAR(100), 
		xisreturntopickup VARCHAR(2), 
		xpaymentterms VARCHAR(20), 
		xisfragile VARCHAR(2), 
		xisbelowroomtemp VARCHAR(2), 
		xismaintainroomtemp VARCHAR(2), 
		xisperishable VARCHAR(2), 
		xpickuppointlat VARCHAR(50), 
		xpickuppointlong VARCHAR(50), 
		xdestinationlat VARCHAR(50), 
		xdestinationlong VARCHAR(50),
		xdeliverytypeid INT(11) 	
	)
BEGIN
	UPDATE `courierdb`.`opc_gm_bookingtrans` SET
		transtype = xtranstype, 
		vehicletypeid = xvehicletypeid, 
		pickuppoint = xpickuppoint, 
		destinationpoint = xdestinationpoint, 
		packagetypeid = xpackagetypeid, 
		packagedescription = xpackagedescription, 
		targetdeldatetime = xtargetdeldatetime, 
		additionalnotes = xadditionalnotes, 
		pickupdatetime = xpickupdatetime, 
		deliverycharge = xdeliverycharge, 
		contactpersondes = xcontactpersondes, 
		contactnodes = xcontactnodes, 
		isreturntopickup = xisreturntopickup, 
		paymentterms = xpaymentterms, 
		isfragile = xisfragile, 
		belowroomtemp = xisbelowroomtemp, 
		maintainroomtemp = xismaintainroomtemp, 
		isperishable = xisperishable, 
		pickuppointlat = xpickuppointlat, 
		pickuppointlong = xpickuppointlong, 
		destinationlat = xdestinationlat, 
		destinationlong = xdestinationlong,
		deliverytypeid = xdeliverytypeid 
	where bookingid = xbookingid;  
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `OPC_UpdChangePassword` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`devuser`@`%` PROCEDURE `OPC_UpdChangePassword`(
		xportaluserid int(11),
		xpassword varchar(100)
	)
BEGIN
	update courierdb.`gm_gen_portaluser` set
		`password` = xpassword
	where portaluserid = xportaluserid; 
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `OPC_UpdDeactivateAccount` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`devuser`@`%` PROCEDURE `OPC_UpdDeactivateAccount`(
		xportaluserid int(11)
	)
BEGIN
	update courierdb.`gm_gen_portaluser` set
		acountactive = "N"
	where portaluserid = xportaluserid; 
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `OPC_UpdLastLogin` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`devuser`@`%` PROCEDURE `OPC_UpdLastLogin`(
	xportaluserid int(11)
    )
BEGIN
	
	update gm_gen_portaluser set lastlogin = NOW()
	where portaluserid = xportaluserid; 
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `OPC_UpdPortalUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`devuser`@`%` PROCEDURE `OPC_UpdPortalUser`(
	xportaluserid INT(11),
	xaccounttype VARCHAR(20), 
	xcompanyname VARCHAR(100),
	xfirstname VARCHAR(100),
	xlastname VARCHAR(100),
	xemailaddress VARCHAR(100),
	xpassword TEXT,
	xdefaultaddress VARCHAR(20),
	xmobileno VARCHAR(20),
	xcurrencyid INT(11),
	xdefaultpayment VARCHAR(100),
	xlinkedaccount VARCHAR(100),
	xaddresslat VARCHAR(45),
	xaddresslong VARCHAR(45),
	xavatarlink TEXT
    )
BEGIN
	UPDATE `courierdb`.`gm_gen_portaluser` SET
		accounttype = xaccounttype,
		companyname = xcompanyname,
		firstname = xfirstname,
		lastname = xlastname,
		emailaddress = xemailaddress,
		`password` = xpassword,
		defaultaddress = xdefaultaddress,
		mobileno = xmobileno,
		currencyid = xcurrencyid,
		defaultpayment = xdefaultpayment,
		linkedaccount = xlinkedaccount,
		addresslat = xaddresslat,
		addresslong = xaddresslong, 
		avatarlink = xavatarlink,
		datemodified = NOW()
	WHERE portaluserid = xportaluserid;  
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `OPC_UpdProposalCount` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`devuser`@`%` PROCEDURE `OPC_UpdProposalCount`(
	xbookingid INT(11)
    )
BEGIN
     	DECLARE xproposalcount INT(11); 
     	
	SELECT COUNT(bookingid) AS proposalcnt
	FROM opc_gm_bookingproposal 
	WHERE bookingid = xbookingid AND bookingstatus <> "CANCELLED" 
	GROUP BY bookingid INTO xproposalcount;	
	
	UPDATE opc_gm_bookingtrans SET totalproposalcnt = xproposalcount WHERE bookingid = xbookingid; 
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `OPC_UpdRatings` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`devuser`@`%` PROCEDURE `OPC_UpdRatings`(
	xratingid INT(11),
	xraterfbtitle varchar(100),
	xraterfbdesc TExt,
	xrating int(5)
    )
BEGIN
	
	declare xrateeid int(11); 
	
	select rateeid from courierdb.`opc_gm_ratings` where ratingid = xratingid INTO xrateeid;   
	
	UPDATE courierdb.`opc_gm_ratings` set
		raterfbtitle = xraterfbtitle,
		raterfbdesc = xraterfbdesc,
		rating = xrating
	where ratingid = xratingid; 
	
	SELECT AVG(rating) AS userrating
	FROM opc_gm_ratings 
	WHERE rateeid = xrateeid 
	GROUP BY rateeid INTO xrating; 
	
	UPDATE gm_gen_portaluser SET userrating = xrating WHERE portaluserid = xrateeid;  
	
	
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

