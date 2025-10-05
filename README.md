# EasyUI-Demo

## 项目简介
jQuery EasyUI框架的企业级Web应用示例项目集合。本项目包含两个完整的后台管理系统示例，展示了如何使用jQuery EasyUI构建现代化的企业级Web应用。项目采用主流的Java Web技术栈，包括Spring MVC、MyBatis等框架，是学习和实践企业级Web开发的优秀范例。

## 技术栈
- **前端框架**: jQuery EasyUI
- **JavaScript库**: jQuery
- **页面装饰**: SiteMesh
- **后端框架**: Spring MVC 3.1.0
- **持久层框架**: MyBatis 3.0.6
- **权限框架**: Apache Shiro 1.1.0
- **数据库**: MySQL / Oracle
- **连接池**: BoneCP 0.7.1
- **构建工具**: Maven
- **Java版本**: JDK 1.6+

## 子项目说明

### 1. sitemesh-easyui-demo
SiteMesh与jQuery EasyUI的集成应用示例，展示了页面装饰器模式在Web开发中的应用。

#### 功能特性
- SiteMesh页面装饰器集成
- jQuery EasyUI组件应用
- 图书管理示例 (增删改查)
- DataGrid数据表格
- 表单验证
- AJAX异步交互

#### 项目结构
```
sitemesh-easyui-demo/
├── src/
│   └── com/easyui/
│       ├── entity/           # 实体类
│       │   └── Book.java
│       ├── dao/              # 数据访问层
│       │   └── BookDao.java
│       ├── service/          # 业务逻辑层
│       │   └── BookService.java
│       └── servlet/          # Servlet控制器
│           ├── BookServlet.java
│           ├── AddBookServlet.java
│           ├── UpdateBookServlet.java
│           └── DeleteBookServlet.java
└── WebRoot/
    ├── booklist.jsp          # 图书列表页
    ├── index.jsp             # 首页
    ├── main.jsp              # 主页面
    ├── easyui/               # EasyUI资源
    ├── decorators/           # SiteMesh装饰器
    ├── css/                  # 样式文件
    ├── js/                   # JavaScript文件
    └── WEB-INF/
        └── web.xml           # Web配置
```

#### 截图
![后台管理](https://raw.github.com/luowei/myopen-projects/master/sitemesh-easyui-demo/doc/img/background.png)

---

### 2. authority-demo
完整的用户、角色、资源权限管理系统，基于RBAC (基于角色的访问控制) 模型实现。

#### 功能特性
- 用户管理 (增删改查)
- 角色管理 (角色定义、权限分配)
- 资源管理 (模块/菜单/按钮权限)
- 用户-角色关联
- 角色-资源关联
- 权限验证 (基于Apache Shiro)
- 登录认证
- 验证码功能
- 文件上传
- 字段级权限控制

#### 技术特点
- **SpringMVC**: RESTful风格的控制器设计
- **MyBatis**: SQL映射和分页查询
- **Apache Shiro**: 认证和授权
- **Jackson**: JSON数据处理
- **BoneCP**: 高性能数据库连接池
- **SLF4J + Logback**: 日志管理

#### 项目结构
```
authority-demo/
├── src/
│   ├── main/
│   │   ├── java/com/rootls/authority/
│   │   │   ├── web/
│   │   │   │   ├── controller/      # 控制器层
│   │   │   │   │   ├── UserController.java
│   │   │   │   │   ├── RoleController.java
│   │   │   │   │   ├── ModuleController.java
│   │   │   │   │   ├── FieldController.java
│   │   │   │   │   ├── LoginController.java
│   │   │   │   │   └── ...
│   │   │   │   ├── interseptor/     # 拦截器
│   │   │   │   │   └── LoginInterceptor.java
│   │   │   │   └── listener/        # 监听器
│   │   │   │       └── SystemInitListener.java
│   │   │   ├── service/              # 服务层
│   │   │   ├── dao/                  # 数据访问层 (MyBatis Mapper)
│   │   │   │   ├── BaseUsersMapper.java
│   │   │   │   ├── BaseRolesMapper.java
│   │   │   │   ├── BaseModulesMapper.java
│   │   │   │   └── ...
│   │   │   ├── entity/               # 实体类
│   │   │   └── common/               # 公共组件
│   │   │       └── mybatis/          # MyBatis扩展
│   │   │           └── dialect/      # 数据库方言
│   │   ├── resources/
│   │   │   └── config/
│   │   │       ├── spring/           # Spring配置
│   │   │       │   ├── springmvc-servlet.xml
│   │   │       │   ├── spring-common.xml
│   │   │       │   ├── spring-pool.xml
│   │   │       │   └── spring-securitycode.xml
│   │   │       └── ibatis/           # MyBatis配置
│   │   │           └── mybatis-config.xml
│   │   └── webapp/
│   │       ├── WEB-INF/
│   │       │   └── web.xml
│   │       └── ...
│   └── test/                         # 测试代码
│       └── java/
│           └── com/rootls/authority/
│               ├── controller/       # 控制器测试
│               └── service/          # 服务测试
└── pom.xml                           # Maven配置
```

#### 核心依赖
```xml
<properties>
    <spring.version>3.1.0.RELEASE</spring.version>
    <mybatis.version>3.0.6</mybatis.version>
    <shiro.version>1.1.0</shiro.version>
    <jackson.version>1.9.3</jackson.version>
    <bonecp.version>0.7.1.RELEASE</bonecp.version>
</properties>
```

#### 截图
![管理后台](https://raw.github.com/luowei/myopen-projects/master/authority-demo/doc/img/background.png)

---

## 依赖要求
- **JDK**: 1.6 或更高版本
- **Maven**: 3.0+ (用于构建项目)
- **Web容器**: Tomcat 6.0+ / Jetty 7.0+
- **数据库**: MySQL 5.0+ 或 Oracle 10g+

## 安装和运行方法

### 1. 克隆项目
```bash
git clone <repository-url>
cd easyui-demo
```

### 2. 数据库配置
修改数据库连接配置文件：
- **authority-demo**: `src/main/resources/config/spring/spring-pool.xml`
```xml
<property name="jdbcUrl" value="jdbc:mysql://localhost:3306/authority_db?useUnicode=true&characterEncoding=utf-8"/>
<property name="username" value="root"/>
<property name="password" value="password"/>
```

### 3. 导入数据库
执行项目中的SQL脚本创建数据库表和初始数据

### 4. Maven构建

#### 构建 sitemesh-easyui-demo
```bash
cd sitemesh-easyui-demo
mvn clean package
```

#### 构建 authority-demo
```bash
cd authority-demo
mvn clean package
```

### 5. 部署运行

#### 方式1: Maven Tomcat插件
```bash
mvn tomcat:run
# 或
mvn tomcat7:run
```

#### 方式2: 部署到独立Tomcat
1. 将生成的 `.war` 文件复制到 Tomcat 的 `webapps` 目录
2. 启动 Tomcat
3. 访问应用

### 6. 访问应用

#### sitemesh-easyui-demo
```
http://localhost:8080/sitemesh-easyui-demo
```

#### authority-demo
```
http://localhost:8080/authority-demo
```

## jQuery EasyUI组件应用

### DataGrid (数据表格)
```javascript
$('#dg').datagrid({
    url: 'getUsers',
    columns: [[
        {field:'username',title:'用户名',width:100},
        {field:'email',title:'邮箱',width:100}
    ]],
    pagination: true
});
```

### Dialog (对话框)
```javascript
$('#dlg').dialog({
    title: '用户编辑',
    width: 400,
    height: 200,
    closed: true,
    modal: true
});
```

### Tree (树形菜单)
用于展示模块/菜单的层级结构

## 权限管理说明 (authority-demo)

### RBAC模型
- **用户 (User)**: 系统使用者
- **角色 (Role)**: 权限的集合
- **资源 (Module)**: 可访问的功能模块
- **字段 (Field)**: 字段级权限控制

### 权限验证流程
1. 用户登录 → 验证用户名密码
2. 加载用户角色 → 查询用户关联的角色
3. 加载角色权限 → 查询角色关联的资源
4. 权限验证 → Shiro拦截器验证访问权限

## 学习要点
- jQuery EasyUI组件的使用
- SiteMesh页面装饰器模式
- Spring MVC的配置和使用
- MyBatis的配置和SQL映射
- Apache Shiro权限框架
- RBAC权限模型设计
- RESTful API设计
- AJAX异步交互
- 前后端数据交互
- Maven项目管理

## 注意事项
1. 确保JDK和Maven环境配置正确
2. 数据库连接信息需要根据实际环境修改
3. 项目使用的是较早版本的框架，主要用于学习参考
4. 生产环境建议使用更新的框架版本

## 适用场景
- 企业级Web应用开发学习
- 后台管理系统开发参考
- 权限管理系统设计参考
- jQuery EasyUI框架学习
- Spring MVC + MyBatis技术栈实践

## 作者
luowei

## 相关资源
- jQuery EasyUI官网: http://www.jeasyui.com/
- Apache Shiro官网: http://shiro.apache.org/
- Spring Framework: http://spring.io/
