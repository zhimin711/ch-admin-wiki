-- MySQL dump 10.13  Distrib 8.4.6, for Linux (x86_64)
--
-- Host: localhost    Database: ch_devops
-- ------------------------------------------------------
-- Server version	8.4.6

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `bt_cluster`
--

DROP TABLE IF EXISTS `bt_cluster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bt_cluster` (
  `ID` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `CLUSTER_NAME` varchar(50) DEFAULT NULL COMMENT '集群名称',
  `ZOOKEEPER` varchar(250) DEFAULT NULL COMMENT 'ZOOKEEPER',
  `BROKERS` varchar(250) DEFAULT NULL COMMENT 'BROKERS',
  `DESCRIPTION` varchar(255) DEFAULT NULL COMMENT '描述',
  `STATUS` char(1) NOT NULL DEFAULT '0' COMMENT '状态：0. 1. 2.',
  `CREATE_AT` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_BY` varchar(64) DEFAULT NULL COMMENT '创建人',
  `UPDATE_AT` datetime DEFAULT NULL COMMENT '更新时间',
  `UPDATE_BY` varchar(64) DEFAULT NULL COMMENT '更新人',
  `tenant_id` varchar(50) DEFAULT NULL COMMENT '租户ID',
  `SECURITY_PROTOCOL` varchar(200) DEFAULT NULL COMMENT '安全协议',
  `SASL_MECHANISM` varchar(200) DEFAULT NULL COMMENT '授权协议',
  `AUTH_USERNAME` varchar(200) DEFAULT NULL COMMENT '授权用户名',
  `AUTH_PASSWORD` varchar(200) DEFAULT NULL COMMENT '授权密码',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_BT_TE_CN_TN` (`CLUSTER_NAME`),
  KEY `IDX_BT_TE_STATUS` (`STATUS`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COMMENT='业务表-集群配置信息';
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table `bt_content_record`
--

DROP TABLE IF EXISTS `bt_content_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bt_content_record` (
  `ID` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `SID` bigint NOT NULL COMMENT '搜索记录主键',
  `PARTITION_ID` int NOT NULL COMMENT '分区ID',
  `MESSAGE_OFFSET` bigint NOT NULL COMMENT '分区索引',
  `CONTENT` text COMMENT '描述',
  PRIMARY KEY (`ID`),
  KEY `IDX_BT_CR_SID` (`SID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='搜索记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bt_content_record`
--

LOCK TABLES `bt_content_record` WRITE;
/*!40000 ALTER TABLE `bt_content_record` DISABLE KEYS */;
/*!40000 ALTER TABLE `bt_content_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bt_content_search`
--

DROP TABLE IF EXISTS `bt_content_search`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bt_content_search` (
  `ID` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `CLUSTER` varchar(50) DEFAULT NULL COMMENT '集群',
  `TOPIC` varchar(255) DEFAULT NULL COMMENT '主题',
  `TYPE` varchar(50) NOT NULL DEFAULT '0' COMMENT '状态：0.全量 1.最新 2.最早',
  `SIZE` int NOT NULL DEFAULT '0' COMMENT '搜索量',
  `CONTENT` varchar(255) DEFAULT NULL COMMENT '描述',
  `STATUS` char(1) NOT NULL DEFAULT '0' COMMENT '状态：0.待搜索 1.开始 2.完成 3. 4.超时 5.中断（结果太多）',
  `CREATE_AT` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_BY` varchar(64) DEFAULT NULL COMMENT '创建人',
  `UPDATE_AT` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`ID`),
  KEY `IDX_BT_CS_STATUS` (`STATUS`),
  KEY `IDX_BT_CS_TOPIC` (`TOPIC`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Kafka搜索记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bt_content_search`
--

LOCK TABLES `bt_content_search` WRITE;
/*!40000 ALTER TABLE `bt_content_search` DISABLE KEYS */;
/*!40000 ALTER TABLE `bt_content_search` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bt_kafka_cluster`
--

DROP TABLE IF EXISTS `bt_kafka_cluster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bt_kafka_cluster` (
  `ID` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `CLUSTER_NAME` varchar(50) DEFAULT NULL COMMENT '集群名称',
  `ZOOKEEPER` varchar(250) DEFAULT NULL COMMENT 'ZOOKEEPER',
  `BROKERS` varchar(250) DEFAULT NULL COMMENT 'BROKERS',
  `DESCRIPTION` varchar(255) DEFAULT NULL COMMENT '描述',
  `STATUS` char(1) NOT NULL DEFAULT '0' COMMENT '状态：0. 1. 2.',
  `CREATE_AT` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_BY` varchar(64) DEFAULT NULL COMMENT '创建人',
  `UPDATE_AT` datetime DEFAULT NULL COMMENT '更新时间',
  `UPDATE_BY` varchar(64) DEFAULT NULL COMMENT '更新人',
  `tenant_id` varchar(50) DEFAULT NULL COMMENT '租户ID',
  `SECURITY_PROTOCOL` varchar(200) DEFAULT NULL COMMENT '安全协议',
  `SASL_MECHANISM` varchar(200) DEFAULT NULL COMMENT '授权协议',
  `AUTH_USERNAME` varchar(200) DEFAULT NULL COMMENT '授权用户名',
  `AUTH_PASSWORD` varchar(200) DEFAULT NULL COMMENT '授权密码',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_BT_TE_CN_TN` (`CLUSTER_NAME`),
  KEY `IDX_BT_TE_STATUS` (`STATUS`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COMMENT='业务表-集群配置信息';
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table `bt_kafka_topic`
--

DROP TABLE IF EXISTS `bt_kafka_topic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bt_kafka_topic` (
  `ID` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `CLUSTER_ID` bigint DEFAULT NULL COMMENT '集群ID',
  `TOPIC_NAME` varchar(150) DEFAULT NULL COMMENT '主题名称',
  `TYPE` varchar(20) NOT NULL COMMENT '存储类型：STRING, JSON, PROTO_STUFF',
  `CLASS_FILE` varchar(50) DEFAULT NULL COMMENT '类文件',
  `CLASS_NAME` varchar(150) DEFAULT NULL COMMENT '类名称',
  `PARTITION_SIZE` int DEFAULT NULL COMMENT '分区数',
  `REPLICA_SIZE` int DEFAULT NULL COMMENT '复制数（备份）',
  `DESCRIPTION` varchar(255) DEFAULT NULL COMMENT '描述',
  `STATUS` char(1) NOT NULL DEFAULT '0' COMMENT '状态：0.禁用 1.启用 2. 3.删除',
  `CREATE_AT` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_BY` varchar(64) DEFAULT NULL COMMENT '创建人',
  `UPDATE_AT` datetime DEFAULT NULL COMMENT '更新时间',
  `UPDATE_BY` varchar(64) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_BT_TE_CN_TN` (`CLUSTER_ID`,`TOPIC_NAME`),
  KEY `IDX_BT_TE_STATUS` (`STATUS`)
) ENGINE=InnoDB AUTO_INCREMENT=4489 DEFAULT CHARSET=utf8mb3 COMMENT='业务表-主题信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bt_nacos_cluster`
--

DROP TABLE IF EXISTS `bt_nacos_cluster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bt_nacos_cluster` (
  `ID` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `URL` varchar(64) NOT NULL COMMENT '集群API',
  `NAME` varchar(150) DEFAULT NULL COMMENT '空间名称',
  `DESCRIPTION` varchar(255) DEFAULT NULL COMMENT '描述',
  `DELETED` tinyint(1) NOT NULL DEFAULT '0' COMMENT '逻辑删除：0.否 1.是',
  `CREATE_AT` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_BY` varchar(64) DEFAULT NULL COMMENT '创建人',
  `UPDATE_AT` datetime DEFAULT NULL COMMENT '更新时间',
  `UPDATE_BY` varchar(64) DEFAULT NULL COMMENT '更新人',
  `SORT` int NOT NULL DEFAULT '0' COMMENT '序号',
  `username` varchar(100) DEFAULT NULL COMMENT '用户名',
  `password` varchar(100) DEFAULT NULL COMMENT 'password',
  `version` varchar(10) NOT NULL DEFAULT 'v1' COMMENT '版本',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_BT_NC_URL` (`URL`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COMMENT='业务-nacos集群表';
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table `bt_namespace`
--

DROP TABLE IF EXISTS `bt_namespace`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bt_namespace` (
  `ID` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `cluster_id` bigint NOT NULL DEFAULT '0',
  `UID` varchar(64) NOT NULL COMMENT '命名空间唯一标识',
  `TYPE` varchar(64) NOT NULL COMMENT '命名空间类型：NACOS rocketMQ Kafka',
  `NAME` varchar(150) DEFAULT NULL COMMENT '空间名称',
  `DESCRIPTION` varchar(255) DEFAULT NULL COMMENT '描述',
  `DELETED` tinyint(1) NOT NULL DEFAULT '0' COMMENT '逻辑删除：0.否 1.是',
  `CREATE_AT` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_BY` varchar(64) DEFAULT NULL COMMENT '创建人',
  `UPDATE_AT` datetime DEFAULT NULL COMMENT '更新时间',
  `UPDATE_BY` varchar(64) DEFAULT NULL COMMENT '更新人',
  `roles` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '其他非项目角色',
  `sort` int NOT NULL DEFAULT '1' COMMENT '排序序号',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_BT_N_UID` (`UID`,`cluster_id`)
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8mb3 COMMENT='业务-命名空间表';
/*!40101 SET character_set_client = @saved_cs_client */;


-- Table structure for table `bt_namespace_apply_record`
--

DROP TABLE IF EXISTS `bt_namespace_apply_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bt_namespace_apply_record` (
  `ID` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `TYPE` varchar(64) NOT NULL COMMENT '类型：1:project-namespace 2: 3:',
  `DATA_KEY` varchar(64) NOT NULL COMMENT '申请KEY:可以是数据ID',
  `CONTENT` text COMMENT '申请内容',
  `STATUS` char(1) NOT NULL DEFAULT '0' COMMENT '状态：0.待审核 1.已通过 2.拒绝',
  `APPROVE_BY` varchar(64) DEFAULT NULL COMMENT '审核人',
  `APPROVE_AT` datetime DEFAULT NULL COMMENT '审核时间',
  `CREATE_AT` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '申请时间',
  `CREATE_BY` varchar(64) DEFAULT NULL COMMENT '创建人',
  `UPDATE_AT` datetime DEFAULT NULL COMMENT '更新时间',
  `UPDATE_BY` varchar(64) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`ID`),
  KEY `IDX_BT_AR_TYPE_STATUS` (`TYPE`,`STATUS`),
  KEY `IDX_BT_AR_DK_TYPE` (`DATA_KEY`,`TYPE`)
) ENGINE=InnoDB AUTO_INCREMENT=244 DEFAULT CHARSET=utf8mb3 COMMENT='业务-申请记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bt_table_column_remark`
--

DROP TABLE IF EXISTS `bt_table_column_remark`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bt_table_column_remark` (
  `ID` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `SYS_CODE` varchar(150) DEFAULT NULL COMMENT '系统代码',
  `DS_ID` bigint DEFAULT NULL COMMENT '上级ID',
  `TABLE_NAME` varchar(100) DEFAULT NULL COMMENT '表名称',
  `COLUMN_NAME` varchar(100) DEFAULT NULL COMMENT '字段名称',
  `TYPE` varchar(20) DEFAULT NULL COMMENT '类型',
  `REMARK` varchar(255) DEFAULT NULL COMMENT '备注',
  `ORIGIN_REMARK` varchar(255) DEFAULT NULL COMMENT '备注',
  `STATUS` char(1) NOT NULL DEFAULT '0' COMMENT '状态：0.失效 1.生效 2.删除',
  `CREATE_AT` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_BY` varchar(64) DEFAULT NULL COMMENT '创建人',
  `UPDATE_AT` datetime DEFAULT NULL COMMENT '更新时间',
  `UPDATE_BY` varchar(64) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_BT_TCR_SC_DI_TN_TC` (`SYS_CODE`,`DS_ID`,`TABLE_NAME`,`COLUMN_NAME`),
  KEY `UK_BT_TCR_SYS_CODE` (`SYS_CODE`),
  KEY `IDX_BT_TCR_DS_ID` (`DS_ID`),
  KEY `IDX_BT_TCR_TABLE_NAME` (`TABLE_NAME`),
  KEY `IDX_BT_TCR_STATUS` (`STATUS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='业务表-数据库表列备注';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bt_table_column_remark`
--

LOCK TABLES `bt_table_column_remark` WRITE;
/*!40000 ALTER TABLE `bt_table_column_remark` DISABLE KEYS */;
/*!40000 ALTER TABLE `bt_table_column_remark` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bt_topic`
--

DROP TABLE IF EXISTS `bt_topic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bt_topic` (
  `ID` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `CLUSTER_NAME` varchar(50) DEFAULT NULL COMMENT '集群名称',
  `TOPIC_NAME` varchar(150) DEFAULT NULL COMMENT '主题名称',
  `TYPE` varchar(20) NOT NULL COMMENT '存储类型：STRING, JSON, PROTO_STUFF',
  `CLASS_FILE` varchar(50) DEFAULT NULL COMMENT '类文件',
  `CLASS_NAME` varchar(150) DEFAULT NULL COMMENT '类名称',
  `PARTITION_SIZE` int DEFAULT NULL COMMENT '分区数',
  `REPLICA_SIZE` int DEFAULT NULL COMMENT '复制数（备份）',
  `DESCRIPTION` varchar(255) DEFAULT NULL COMMENT '描述',
  `STATUS` char(1) NOT NULL DEFAULT '0' COMMENT '状态：0.禁用 1.启用 2. 3.删除',
  `CREATE_AT` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_BY` varchar(64) DEFAULT NULL COMMENT '创建人',
  `UPDATE_AT` datetime DEFAULT NULL COMMENT '更新时间',
  `UPDATE_BY` varchar(64) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_BT_TE_CN_TN` (`CLUSTER_NAME`,`TOPIC_NAME`),
  KEY `IDX_BT_TE_STATUS` (`STATUS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='业务表-主题信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bt_topic`
--

LOCK TABLES `bt_topic` WRITE;
/*!40000 ALTER TABLE `bt_topic` DISABLE KEYS */;
/*!40000 ALTER TABLE `bt_topic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bt_topic_ext_prop`
--

DROP TABLE IF EXISTS `bt_topic_ext_prop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bt_topic_ext_prop` (
  `ID` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `MID` bigint DEFAULT NULL COMMENT '主信息ID',
  `PID` bigint DEFAULT NULL COMMENT '上级ID',
  `UID` varchar(64) NOT NULL COMMENT 'MOCK key',
  `CODE` varchar(50) NOT NULL COMMENT '属性代码',
  `NAME` varchar(150) DEFAULT NULL COMMENT '属性名称',
  `TYPE` varchar(20) NOT NULL COMMENT '属性类型',
  `SORT` int DEFAULT NULL COMMENT '序号',
  `VAL_REGEX` varchar(250) DEFAULT NULL COMMENT '值或正则（多个","拼接）',
  `VAL_EDIT` varchar(50) DEFAULT NULL COMMENT '调整值',
  `VAL_DEL` varchar(50) DEFAULT NULL COMMENT '删除值',
  `STATUS` char(1) NOT NULL DEFAULT '0' COMMENT '状态：0.禁用 1.启用 3.删除',
  PRIMARY KEY (`ID`),
  KEY `IDX_BT_TEP_PID` (`PID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='业务表-主题内容属性信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bt_topic_ext_prop`
--

LOCK TABLES `bt_topic_ext_prop` WRITE;
/*!40000 ALTER TABLE `bt_topic_ext_prop` DISABLE KEYS */;
/*!40000 ALTER TABLE `bt_topic_ext_prop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rt_project_namespace`
--

DROP TABLE IF EXISTS `rt_project_namespace`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rt_project_namespace` (
  `project_id` bigint NOT NULL COMMENT '项目ID',
  `NAMESPACE_ID` bigint NOT NULL COMMENT '命名空间ID',
  `GROUP_ID` varchar(155) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '分组',
  PRIMARY KEY (`project_id`,`NAMESPACE_ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='关系-项目与命名空间表';
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table `rt_user_namespace`
--

DROP TABLE IF EXISTS `rt_user_namespace`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rt_user_namespace` (
  `USER_ID` varchar(64) NOT NULL COMMENT '用户ID',
  `PROJECT_ID` bigint NOT NULL COMMENT '项目ID',
  `NAMESPACE_ID` bigint NOT NULL COMMENT '命名空间ID',
  `permission` char(2) DEFAULT NULL COMMENT '空间权限：r读，rw读写',
  PRIMARY KEY (`USER_ID`,`PROJECT_ID`,`NAMESPACE_ID`),
  KEY `IDX_RT_PU_PROJECT_ID` (`PROJECT_ID`),
  KEY `IDX_RT_PU_NAMESPACE_ID` (`NAMESPACE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='关系-用户与命名空间表';
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Dumping routines for database 'ch_devops'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-09-08  9:13:13
