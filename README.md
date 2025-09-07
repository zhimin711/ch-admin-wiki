# CH-Cloud 企业级微服务架构平台

[![License](https://img.shields.io/badge/license-Apache%202.0-blue.svg)](LICENSE)
[![Java](https://img.shields.io/badge/Java-1.8+-orange.svg)](https://www.oracle.com/java/)
[![Spring Boot](https://img.shields.io/badge/Spring%20Boot-2.6.x-green.svg)](https://spring.io/projects/spring-boot)
[![Spring Cloud](https://img.shields.io/badge/Spring%20Cloud-2021.0.1+-green.svg)](https://spring.io/projects/spring-cloud)

## 📖 项目简介

CH-Cloud是一个基于Spring Boot + Spring Cloud Alibaba构建的企业级微服务架构平台，采用前后端分离模式，为企业提供完整的微服务解决方案。平台集成了用户权限管理、单点登录、API网关、中间件管理等核心功能，支持高并发、高可用的分布式系统架构。

### ✨ 核心特性

- 🏗️ **微服务架构** - 基于Spring Cloud Alibaba生态，服务灵活扩展
- 🔐 **统一认证** - 基于JWT的单点登录系统，支持多因子认证
- 🛡️ **权限管理** - 完整的RBAC权限体系，支持多租户架构
- 🚪 **智能网关** - 基于Spring Cloud Gateway的API网关，支持动态路由
- 🔧 **中间件管理** - 统一的Kafka、RocketMQ、Nacos、Redis管理平台
- 📊 **监控运维** - 集成Prometheus、Grafana监控体系
- 🐳 **容器化部署** - 支持Docker、Kubernetes部署
- 📚 **API文档** - 集成Swagger/OpenAPI文档

### 🛠️ 技术栈

| 技术 | 版本 | 说明 |
|------|------|------|
| Spring Boot | 2.6.x | 基础框架 |
| Spring Cloud | 2021.0.1+ | 微服务框架 |
| Spring Cloud Alibaba | 2021.0.1.0 | 阿里云组件 |
| Nacos | 2.0+ | 注册中心/配置中心 |
| Redis | 6.0+ | 缓存中间件 |
| MySQL | 8.0+ | 主数据库 |
| RocketMQ | 4.9+ | 消息队列 |
| Kafka | 2.8+ | 消息队列 |
| Sentinel | 1.8+ | 流量控制 |
| MyBatis Plus | 3.5.x | ORM框架 |
### 软件架构
<img src="https://gitee.com/ch-cloud/wiki/raw/master/images/ch-cloud.jpg" alt="软件架构"/>

>服务注册与调用
基于Nacos来实现的服务注册与调用，在Spring Cloud中使用Feign, 我们可以做到使用HTTP请求远程服务时能与调用本地方法一样的编码体验，开发者完全感知不到这是远程方法，更感知不到这是个HTTP请求。

>服务鉴权  
通过JWT的方式来加强服务之间调度的权限验证，保证内部服务的安全性。

>负载均衡  
将服务保留的rest进行代理和网关控制，除了平常经常使用的node.js、nginx外，Spring Cloud系列的gateway和ribbon，可以帮我们进行正常的网关管控和负载均衡。  
其中扩展和借鉴国内Alibaba Sentinel组件，方面进行限流。

>熔断机制  
因为采取了服务的分布，为了避免服务之间的调用“雪崩”，采用了Hystrix的作为熔断器，避免了服务之间的“雪崩”。

## 🏛️ 系统架构

### 整体架构图

```
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│   前端应用      │    │   网关服务      │    │   认证服务      │
│   (Vue.js)      │◄──►│   (Gateway)     │◄──►│   (SSO)         │
└─────────────────┘    └─────────────────┘    └─────────────────┘
                                │
                                ▼
                       ┌─────────────────┐
                       │   UPMS服务      │
                       │  (权限管理)     │
                       └─────────────────┘
                                │
                ┌───────────────┼───────────────┐
                ▼               ▼               ▼
        ┌─────────────┐ ┌─────────────┐ ┌─────────────┐
        │   MySQL     │ │    Redis    │ │  RocketMQ   │
        │  (主数据库)  │ │   (缓存)    │ │  (消息队列)  │
        └─────────────┘ └─────────────┘ └─────────────┘
```

### 核心服务说明

#### 1. CH-Admin3 前端管理界面
- **技术栈**: Vue.js 3.x + Element Plus
- **功能**: 系统管理、日志管理、中间件管理
- **特色**: 响应式设计、组件化开发

#### 2. CH-SSO 单点登录服务
- **技术栈**: Spring Boot + Spring Security + JWT
- **功能**: 用户认证、令牌管理、多因子认证
- **特色**: 支持图形验证码、滑动拼图、点选文字验证码

#### 3. CH-UPMS 用户权限管理服务
- **技术栈**: Spring Boot + MyBatis Plus + ShardingSphere
- **功能**: 用户管理、角色管理、权限管理、组织架构
- **特色**: 多租户支持、项目权限管理、数据字典

#### 4. CH-Gateway API网关服务
- **技术栈**: Spring Cloud Gateway + Sentinel
- **功能**: 路由转发、权限验证、流量控制、请求日志
- **特色**: 动态路由、Cookie自动刷新、多层权限过滤

#### 5. CH-DevOps 中间件管理平台
- **技术栈**: Spring Boot + Spring Cloud
- **功能**: Kafka管理、RocketMQ管理、Nacos管理、Redis管理
- **特色**: 统一管理、实时监控、配置管理

## 🚀 快速开始

### 环境要求

- **JDK**: 1.8+
- **Maven**: 3.6+
- **MySQL**: 8.0+
- **Redis**: 6.0+
- **Nacos**: 2.0+
- **RocketMQ**: 4.9+ (可选)
- **Docker**: 20.10+ (可选)

### 安装部署

#### 方式一：Docker一键部署（推荐）

**基础服务部署**
```bash
# 1. 克隆项目
git clone https://gitee.com/ch-cloud/ch-cloud.git
cd ch-cloud

# 2. 启动基础服务（MySQL、Redis、Nacos）
cd docker/base
docker-compose -f docker-compose.yml up -d
```

**中间件服务部署**
```bash
# 启动RocketMQ
cd docker/RocketMQ
docker-compose -f docker-compose.yml up -d
```

**应用服务部署**
```bash
# 1. 启动SSO认证服务
cd ch-sso
mvn spring-boot:run -pl web

# 2. 启动UPMS权限管理服务
cd ch-upms
mvn spring-boot:run -pl web

# 3. 启动Gateway网关服务
cd ch-gateway
mvn spring-boot:run -pl web

# 4. 启动DevOps中间件管理服务
cd ch-devops
mvn spring-boot:run -pl web
```

#### 方式二：手动部署

**1. 数据库初始化**
```sql
-- 创建数据库
CREATE DATABASE ch_devops CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
CREATE DATABASE ch_upms CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- 执行各服务的SQL脚本
-- SSO服务脚本
source ch-sso/xxx/db/1.0.0/oauth_client_details.sql
source ch-sso/xxx/db/2.0.0/01_bt_api_project.sql

-- UPMS服务脚本
source ch-upms/xxx/db/1.0.0/01_st_user.sql
source ch-upms/xxx/db/1.0.0/02_st_role.sql
```

**2. 配置修改**
- 修改各服务的数据库连接配置
- 修改Redis连接配置
- 修改Nacos配置中心地址

**3. 启动服务**
```bash
# 按顺序启动服务
# 1. SSO认证服务 (端口: 7000)
# 2. UPMS权限服务 (端口: 7002)
# 3. Gateway网关服务 (端口: 7001)
# 4. DevOps中间件服务 (端口: 7003)
```

### 服务访问地址

| 服务 | 地址 | 说明 |
|------|------|------|
| 前端管理界面 | http://localhost:3000 | Vue.js前端应用 |
| SSO认证服务 | http://localhost:7000 | 单点登录服务 |
| UPMS权限服务 | http://localhost:7002 | 用户权限管理 |
| Gateway网关 | http://localhost:7001 | API网关服务 |
| DevOps中间件 | http://localhost:7003 | 中间件管理平台 |
| Nacos控制台 | http://localhost:8848 | 注册中心/配置中心 |

### 默认账号

- **管理员账号**: admin
- **默认密码**: admin123

## 📋 功能特性

### 🔐 认证授权
- **单点登录**: 基于JWT的统一身份认证
- **多因子认证**: 支持用户名密码+验证码双重认证
- **令牌管理**: 自动刷新、过期处理、安全注销
- **权限控制**: 基于RBAC的精细化权限管理

### 🏢 组织管理
- **用户管理**: 用户增删改查、角色分配、状态管理
- **角色管理**: 角色权限分配、角色类型管理
- **组织架构**: 部门层级管理、职位管理
- **多租户**: 支持多租户架构，数据隔离

### 🚪 网关服务
- **动态路由**: 基于Nacos的动态路由管理
- **权限验证**: 多层权限过滤器链
- **流量控制**: 基于Sentinel的限流熔断
- **请求日志**: 完整的请求响应日志记录

### 🔧 中间件管理
- **Kafka管理**: 集群管理、主题管理、消息监控
- **RocketMQ管理**: 集群管理、主题管理、消息发送
- **Nacos管理**: 配置管理、服务发现、命名空间管理
- **Redis管理**: 数据库管理、键值操作、集群监控

## 📚 API文档

各服务均提供完整的API文档：

| 服务 | API文档地址 | 说明 |
|------|-------------|------|
| SSO认证服务 | http://localhost:7000/swagger-ui/index.html | 认证相关接口 |
| UPMS权限服务 | http://localhost:7002/swagger-ui/index.html | 权限管理接口 |
| Gateway网关 | http://localhost:7001/swagger-ui.html | 网关管理接口 |
| DevOps中间件 | http://localhost:7003/swagger-ui.html | 中间件管理接口 |

## 🐳 容器化部署

### Docker Compose部署

```yaml
version: '3.8'
services:
  mysql:
    image: mysql:8.0
    environment:
      MYSQL_ROOT_PASSWORD: root123
      MYSQL_DATABASE: ch_devops
    volumes:
      - mysql_data:/var/lib/mysql
    ports:
      - "3306:3306"

  redis:
    image: redis:6.2-alpine
    ports:
      - "6379:6379"

  nacos:
    image: nacos/nacos-server:v2.0.3
    environment:
      MODE: standalone
      MYSQL_SERVICE_HOST: mysql
    ports:
      - "8848:8848"
    depends_on:
      - mysql

  ch-sso:
    build: ./ch-sso
    ports:
      - "7000:7000"
    depends_on:
      - mysql
      - redis
      - nacos

  ch-upms:
    build: ./ch-upms
    ports:
      - "7002:7002"
    depends_on:
      - mysql
      - redis
      - nacos

  ch-gateway:
    build: ./ch-gateway
    ports:
      - "7001:7001"
    depends_on:
      - ch-sso
      - ch-upms

volumes:
  mysql_data:
```

### Kubernetes部署

```bash
# 应用K8s配置
kubectl apply -f k8s/

# 查看部署状态
kubectl get pods -l app=ch-cloud
```

## 🔍 监控运维

### 健康检查

各服务均提供健康检查端点：

- **SSO服务**: http://localhost:7000/actuator/health
- **UPMS服务**: http://localhost:7002/actuator/health
- **Gateway服务**: http://localhost:7001/actuator/health
- **DevOps服务**: http://localhost:7003/actuator/health

### 监控指标

- **JVM指标**: 内存使用、GC情况、线程状态
- **业务指标**: API调用次数、错误率、响应时间
- **中间件指标**: 连接数、消息积压、响应时间

## 🤝 贡献指南

我们欢迎所有形式的贡献！

### 贡献步骤

1. **Fork 本仓库**
2. **创建特性分支** (`git checkout -b feature/AmazingFeature`)
3. **提交更改** (`git commit -m 'Add some AmazingFeature'`)
4. **推送分支** (`git push origin feature/AmazingFeature`)
5. **创建 Pull Request**

### 代码规范

- 遵循阿里巴巴Java开发手册
- 使用统一的代码格式化配置
- 添加必要的注释和文档
- 编写单元测试

## 📄 许可证

本项目采用 [Apache License 2.0](LICENSE) 开源协议。

## 📞 联系我们

- **项目地址**: https://gitee.com/ch-cloud/ch-cloud
- **问题反馈**: https://gitee.com/ch-cloud/ch-cloud/issues
- **QQ群**: 27754177

## 🙏 致谢

感谢以下开源项目的支持：

- [Spring Boot](https://spring.io/projects/spring-boot)
- [Spring Cloud Alibaba](https://github.com/alibaba/spring-cloud-alibaba)
- [Nacos](https://nacos.io/)
- [Redis](https://redis.io/)
- [MyBatis Plus](https://baomidou.com/)

---

## 📱 使用说明
<table>
    <tr>
        <td>登录</td>
        <td>首页</td>
    </tr>
    <tr>
        <td><img src="https://gitee.com/ch-cloud/wiki/raw/master/images/login.png"/></td>
        <td><img src="https://gitee.com/ch-cloud/wiki/raw/master/images/home.png"/></td>
    </tr>
    <tr>
        <td>用户管理</td>
        <td>角色管理</td>
    </tr>
    <tr>
        <td><img src="https://gitee.com/ch-cloud/wiki/raw/master/images/user.png"/></td>
        <td><img src="https://gitee.com/ch-cloud/wiki/raw/master/images/role.png"/></td>
    </tr>
    <tr>
        <td>权限管理</td>
        <td>组织管理</td>
    </tr>
    <tr>
        <td><img src="https://gitee.com/ch-cloud/wiki/raw/master/images/permission.png"/></td>
        <td><img src="https://gitee.com/ch-cloud/wiki/raw/master/images/dept.png"/></td>
    </tr>
    <tr>
        <td>职位管理</td>
        <td>数据字典</td>
    </tr>
	<tr>
        <td><img src="https://gitee.com/ch-cloud/wiki/raw/master/images/post.png"/></td>
        <td><img src="https://gitee.com/ch-cloud/wiki/raw/master/images/dict.png"/></td>
    </tr>	
    <tr>
        <td>登录日志</td>
        <td>操作日志</td>
    </tr> 
    <tr>
        <td><img src="https://gitee.com/ch-cloud/wiki/raw/master/images/login_logs.png"/></td>
        <td><img src="https://gitee.com/ch-cloud/wiki/raw/master/images/operate_logs.png"/></td>
    </tr>
</table>

---

<div align="center">

**如果这个项目对您有帮助，请给我们一个 ⭐️ Star**

Made with ❤️ by CH-Cloud Team

</div>

