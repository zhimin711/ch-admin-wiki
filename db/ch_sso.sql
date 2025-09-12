-- MySQL dump 10.13  Distrib 8.4.6, for Linux (x86_64)
--
-- Host: localhost    Database: ch_sso
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
-- Table structure for table `api_operation_log`
--

DROP TABLE IF EXISTS `api_operation_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_operation_log` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `user_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '用户ID',
  `username` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '用户名',
  `operation_type` varchar(55) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '操作类型',
  `operation_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci COMMENT '操作内容',
  `ip` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'IP地址',
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `module` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '模块',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='API操作日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_operation_log`
--

LOCK TABLES `api_operation_log` WRITE;
/*!40000 ALTER TABLE `api_operation_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `api_operation_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_share_code`
--

DROP TABLE IF EXISTS `api_share_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_share_code` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `project_id` bigint DEFAULT NULL COMMENT '项目ID',
  `share_code` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '分享码',
  `user_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '用户ID',
  `resources` json DEFAULT NULL COMMENT '资源信息JSON',
  `expire_time` datetime DEFAULT NULL COMMENT '过期时间',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_project_id` (`project_id`) USING BTREE,
  KEY `idx_share_code` (`share_code`) USING BTREE,
  KEY `idx_user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='API分享码表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_share_code`
--

LOCK TABLES `api_share_code` WRITE;
/*!40000 ALTER TABLE `api_share_code` DISABLE KEYS */;
/*!40000 ALTER TABLE `api_share_code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bt_api_group`
--

DROP TABLE IF EXISTS `bt_api_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bt_api_group` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `parent_id` bigint DEFAULT NULL COMMENT '上级Id: 0为1级',
  `project_id` bigint DEFAULT NULL COMMENT '项目ID',
  `code` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '代码',
  `name` varchar(150) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '名称',
  `description` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '描述',
  `sort` int NOT NULL DEFAULT '0' COMMENT '排序',
  `type` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '0' COMMENT '类型：0.未分组 1.接口分组 2.标签分组 3.自定义分组',
  `is_import` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否为导入',
  `import_at` datetime DEFAULT NULL COMMENT '导入时间',
  `create_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '创建人',
  `update_at` datetime DEFAULT NULL COMMENT '更新时间',
  `update_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`id`),
  KEY `idx_ag_create_by` (`create_by`) USING BTREE,
  KEY `idx_ag_parent_id` (`parent_id`) USING BTREE,
  KEY `idx_ag_project_id` (`project_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='接口分组表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bt_api_group`
--

LOCK TABLES `bt_api_group` WRITE;
/*!40000 ALTER TABLE `bt_api_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `bt_api_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bt_api_path`
--

DROP TABLE IF EXISTS `bt_api_path`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bt_api_path` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `project_id` bigint DEFAULT NULL COMMENT 'projectId',
  `name` varchar(150) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '接口名称',
  `path` varchar(150) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '接口地址',
  `method` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '请求方法',
  `is_wrap` tinyint(1) DEFAULT NULL COMMENT '是否封装',
  `consumes` tinytext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci COMMENT '请求头中 Content-Type 值',
  `produces` tinytext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci COMMENT '请求头中 Accept 值',
  `parameters` json DEFAULT NULL COMMENT '请求参数:json',
  `body` json DEFAULT NULL COMMENT '请求内容:json',
  `responses` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci COMMENT '返回参数:json',
  `description` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '描述',
  `status` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '0' COMMENT '状态：0. 1. 2.',
  `is_import` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否为导入',
  `import_content` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci COMMENT '导入内容:json',
  `import_at` datetime DEFAULT NULL COMMENT '导入时间',
  `create_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '创建人',
  `update_at` datetime DEFAULT NULL COMMENT '更新时间',
  `update_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`id`),
  KEY `idx_ap_project_id` (`project_id`) USING BTREE,
  KEY `idx_ap_status` (`status`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='接口分组表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bt_api_path`
--

LOCK TABLES `bt_api_path` WRITE;
/*!40000 ALTER TABLE `bt_api_path` DISABLE KEYS */;
/*!40000 ALTER TABLE `bt_api_path` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bt_api_permission`
--

DROP TABLE IF EXISTS `bt_api_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bt_api_permission` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `parent_id` bigint DEFAULT NULL COMMENT '上级ID',
  `code` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '代码',
  `name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '名称',
  `desc` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '描述',
  `type` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '0' COMMENT '状态：0. 1.菜单 2.按钮',
  `create_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '创建人',
  `update_at` datetime DEFAULT NULL COMMENT '更新时间',
  `update_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '更新人',
  `roles` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '角色',
  PRIMARY KEY (`id`),
  KEY `idx_ap_status` (`type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb3 COMMENT='接口权限表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bt_api_permission`
--

LOCK TABLES `bt_api_permission` WRITE;
/*!40000 ALTER TABLE `bt_api_permission` DISABLE KEYS */;
INSERT INTO `bt_api_permission` VALUES (1,0,'workbench','工作台',NULL,'1','2025-06-20 00:11:47',NULL,NULL,NULL,'MGR'),(2,0,'settings','项目配置',NULL,'1','2025-06-20 00:12:19',NULL,NULL,NULL,'MGR,TEST'),(3,0,'api','项目接口',NULL,'1','2025-06-20 00:12:37',NULL,NULL,NULL,'MGR,VISITOR,TEST'),(4,0,'model','接口模型',NULL,'1','2025-06-20 00:13:41',NULL,NULL,NULL,'MGR'),(5,0,'visitor','访客管理',NULL,'1','2025-06-20 00:14:08',NULL,NULL,NULL,'MGR'),(6,1,'workbench:statistics','统计-工作台数据',NULL,'2','2025-06-20 00:40:40',NULL,NULL,NULL,'MGR'),(7,1,'workbench:activities','查询-项目动态',NULL,'2','2025-06-20 00:41:19',NULL,NULL,NULL,'MGR'),(8,1,'workbench:recent-apis','查询-最近更新接口',NULL,'2','2025-06-20 00:41:45',NULL,NULL,NULL,'MGR'),(9,2,'project:info','查询-项目信息',NULL,'2','2025-06-20 00:42:32',NULL,NULL,NULL,'MGR,TEST'),(10,1,'workbench:members','查询-项目成员',NULL,'2','2025-06-20 00:43:31',NULL,NULL,NULL,'MGR'),(11,2,'project:settings:query','查询-项目配置',NULL,'2','2025-06-20 01:20:40',NULL,NULL,NULL,'MGR'),(12,2,'project:settings:save','保存-项目配置',NULL,'2','2025-06-20 01:20:40',NULL,NULL,NULL,'MGR'),(13,3,'group:tree','查询-接口分组树',NULL,'2','2025-06-20 01:24:48',NULL,NULL,NULL,'MGR,VISITOR,TEST'),(14,3,'group:add','添加-接口分组',NULL,'2','2025-06-20 01:24:48',NULL,NULL,NULL,'MGR'),(15,3,'group:edit','编辑-接口分组',NULL,'2','2025-06-20 01:24:48',NULL,NULL,NULL,'MGR'),(16,3,'group:del','删除-接口分组',NULL,'2','2025-06-20 01:24:48',NULL,NULL,NULL,'MGR'),(17,3,'path:add','添加-接口信息',NULL,'2','2025-06-20 01:24:48',NULL,NULL,NULL,'MGR'),(18,3,'path:edit','编辑-接口信息',NULL,'2','2025-06-20 01:24:48',NULL,NULL,NULL,'MGR'),(19,3,'path:del','删除-接口信息',NULL,'2','2025-06-20 01:24:48',NULL,NULL,NULL,'MGR'),(20,3,'path-copy','复制-接口信息',NULL,'2','2025-06-20 01:24:48',NULL,NULL,NULL,'MGR'),(21,3,'path:detail','查询-接口信息',NULL,'2','2025-06-20 01:24:48',NULL,NULL,NULL,'MGR,VISITOR,TEST'),(22,2,'project:import','导入-项目接口',NULL,'2','2025-06-20 01:20:40',NULL,NULL,NULL,'MGR'),(23,5,'visitor:add','添加-访客',NULL,'2','2025-06-20 01:24:48',NULL,NULL,NULL,'MGR'),(24,5,'visitor:list','查询-访客',NULL,'2','2025-06-20 01:24:48',NULL,NULL,NULL,'MGR'),(25,5,'visitor:del','删除-访客',NULL,'2','2025-06-20 01:24:48',NULL,NULL,NULL,'MGR'),(26,5,'visitor:members','查询-可添加访客列表',NULL,'2','2025-06-20 01:24:48',NULL,NULL,NULL,'MGR'),(27,0,'api-add','新增接口',NULL,'1','2025-06-20 00:14:08',NULL,NULL,NULL,'MGR'),(28,3,'share:generate','分享-接口分组',NULL,'2','2025-06-20 01:24:48',NULL,NULL,NULL,'MGR'),(29,3,'tenant:env:list','查询-租户环境配置',NULL,'2','2025-06-20 01:24:48',NULL,NULL,NULL,'MGR'),(30,3,'tenant:config:save','保存-租户配置',NULL,'2','2025-06-20 01:24:48',NULL,NULL,NULL,'MGR'),(31,0,'share-code','分享管理',NULL,'1','2025-06-20 00:14:08',NULL,NULL,NULL,'MGR'),(32,31,'share:page','分页查询-分享码管理',NULL,'2','2025-06-20 01:24:48',NULL,NULL,NULL,'MGR');
/*!40000 ALTER TABLE `bt_api_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bt_api_project`
--

DROP TABLE IF EXISTS `bt_api_project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bt_api_project` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `project_id` bigint DEFAULT NULL COMMENT '项目ID',
  `workspace_id` bigint DEFAULT NULL COMMENT '空间ID',
  `name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '别名',
  `api_doc_url` varchar(150) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT 'api doc url',
  `api_doc_type` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT 'api doc type',
  `base_path` varchar(150) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '请求前缀',
  `icon` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '图标',
  `is_open` tinyint(1) DEFAULT NULL COMMENT '是否开放',
  `description` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '描述',
  `env` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci COMMENT '环境配置JSON格式',
  `global_config` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci COMMENT '环境配置JSON格式',
  `STATUS` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '0' COMMENT '状态：0.失效 1.生效',
  `deleted` tinyint(1) DEFAULT NULL COMMENT '是否删除',
  `CREATE_AT` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_BY` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '创建人',
  `UPDATE_AT` datetime DEFAULT NULL COMMENT '更新时间',
  `UPDATE_BY` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '更新人',
  `result_wrap` json DEFAULT NULL COMMENT '封装结果',
  PRIMARY KEY (`id`),
  KEY `idx_ap_project_id` (`project_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='业务表-接口项目配置';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bt_api_project`
--

LOCK TABLES `bt_api_project` WRITE;
/*!40000 ALTER TABLE `bt_api_project` DISABLE KEYS */;
/*!40000 ALTER TABLE `bt_api_project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bt_api_schema`
--

DROP TABLE IF EXISTS `bt_api_schema`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bt_api_schema` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `project_id` bigint DEFAULT NULL COMMENT 'projectId',
  `type` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '类型',
  `def_key` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '标识',
  `title` varchar(150) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '名称',
  `properties` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci COMMENT '参数',
  `required` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci COMMENT '必传参数',
  `description` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '描述',
  `create_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '创建人',
  `update_at` datetime DEFAULT NULL COMMENT '更新时间',
  `update_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_as_pid_key` (`project_id`,`def_key`),
  KEY `idx_as_project_id` (`project_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='接口对象定义信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bt_api_schema`
--

LOCK TABLES `bt_api_schema` WRITE;
/*!40000 ALTER TABLE `bt_api_schema` DISABLE KEYS */;
/*!40000 ALTER TABLE `bt_api_schema` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bt_api_tenant`
--

DROP TABLE IF EXISTS `bt_api_tenant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bt_api_tenant` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` bigint NOT NULL COMMENT '租户空间ID',
  `env` json DEFAULT NULL COMMENT '环境配置JSON格式',
  `deleted` tinyint(1) DEFAULT '0' COMMENT '是否删除',
  `create_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '创建人',
  `update_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_tenant_id` (`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='租户环境配置表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bt_api_tenant`
--

LOCK TABLES `bt_api_tenant` WRITE;
/*!40000 ALTER TABLE `bt_api_tenant` DISABLE KEYS */;
/*!40000 ALTER TABLE `bt_api_tenant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rt_api_group_path`
--

DROP TABLE IF EXISTS `rt_api_group_path`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rt_api_group_path` (
  `group_id` bigint NOT NULL COMMENT '分组ID',
  `path_id` bigint NOT NULL COMMENT '接口ID',
  `sort` int NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`group_id`,`path_id`),
  KEY `idx_rt_ag_path_id` (`path_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='关系表-接口分组';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rt_api_group_path`
--

LOCK TABLES `rt_api_group_path` WRITE;
/*!40000 ALTER TABLE `rt_api_group_path` DISABLE KEYS */;
/*!40000 ALTER TABLE `rt_api_group_path` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rt_api_project_user`
--

DROP TABLE IF EXISTS `rt_api_project_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rt_api_project_user` (
  `project_id` bigint NOT NULL COMMENT 'projectId',
  `user_id` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'userId',
  `role` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'role',
  PRIMARY KEY (`project_id`,`user_id`),
  KEY `idx_rt_av_api_id` (`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='关系表-用户项目角色表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rt_api_project_user`
--

LOCK TABLES `rt_api_project_user` WRITE;
/*!40000 ALTER TABLE `rt_api_project_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `rt_api_project_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'ch_sso'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-09-08  9:13:20
