# <div align="center">Purest Admin</div>

### 项目介绍

* PurestAdmin 是一款前后端分离的基于rbac权限管理的后台管理系统。旨在打造一款适合大、中、小型项目快速二次开发的模板，本项目不做任何业务型的功能，尽量做到下载即用，方便广大的开发者进行快速业务开发，无需再为搭建项目框架而烦恼！
* 本项目打破传统rbac构思，不再使用后端配置前端的各种菜单路径，真正做到 **前后端分离** （详见下文“设计思路”），重新设计了token的刷新机制，实现 **单token无感刷新**

### 项目结构

*  **Api** 后端接口项目，使用.Net8开发，在abp框架的设计上进行了精简和改良，只保留了核心功能，重写了部分abp的功能。使用SqlSugar替代了传统的EFCore，效率更高，使用更方便
*  **client-vue** vue客户端项目，采用了高质量前端项目vue-pure-admin的精简版pure-admin-thin。并额外使用了功能非常强大的vxe-table及其内置的其他组件
*  **client-wpf** wfp客户端项目，使用wpf界mvvm模式下用户基数非常庞大的框架prism,引入Rubyer-WPF主题和控件包，让界面显示更友好。http请求方面，重新封装了restful格式的Flurl，让请求更方便
* **relationship-model** 关系模型，数据库关系模型图，基于Powerdesigner设计的Pdm图形，以及对应的表结构初始化SQL
* **screenshot** 项目截图

### 设计思路

*  **服务端** 不再关心前端的任何实现，只针对功能，开放接口，同时通过“功能管理”，控制用户调用接口的的权限
*  **客户端** 无需再和服务端约定路由等相关内容，直接根据接口，获取功能编码，通过唯一的“功能编码”挂载路由以及控制界面功能

### 演示地址

- [http://www.purestadmin.com](http://www.purestadmin.com)
- 应用服务器在国外，数据库服务器在国内，可能查询数据会有略微延迟。并非项目本身的问题

### 文档地址

- [http://docs.purestadmin.com](http://docs.purestadmin.com)

### 完成功能

- 1、登陆验证
- 2、用户管理
- 3、角色管理
- 4、功能管理
- 5、组织机构
- 6、字典管理
- 7、配置管理
- 8、在线用户
- 9、请求日志
- 10、个人信息
- 11、通知公告

* wpf版本仅完成了框架的构造以及登录等基本功能，后续会持续进行开发，如果您有兴趣合作，请联系我！

### 后续内容

- 1、快速开发模板（基于单表的代码快速生成）
- 2、工作流


### 项目截图

| ![系统首页](screenshot/welcome.png)|![个人信息](screenshot/userinfo.png)|![项目配置](screenshot/projectsetting.png) |
|---|---|---|
| ![用户管理](screenshot/userlist.png) | ![角色管理](screenshot/rolelist.png)  | ![功能管理](screenshot/functionlist.png) |
| ![组织机构](screenshot/organizationlist.png) | ![字典管理](screenshot/dictionarylist.png) |![配置管理](screenshot/systemconfiglist.png) |


### 其他

* **开源之路充满挑战，但每一步都凝结着作者的汗水与智慧。 如果您觉得这个项目对您有帮助，不妨给它点个Star，给予一点小小的支持。您的每一个鼓励，都是我继续前行的动力， 项目持续更新中，如果您有任何问题，可通过文档中的联系方式，提出宝贵意见。 让我有更多的热情和信心去完善和优化这个项目。感谢您的支持与关注！** 

### 特别鸣谢
- 👉 ABP：  [https://docs.abp.io/zh-Hans/abp/latest](https://docs.abp.io/zh-Hans/abp/latest)
- 👉 SqlSugar：[https://gitee.com/dotnetchina/SqlSugar](https://gitee.com/dotnetchina/SqlSugar)
- 👉 IdGenerator：[https://github.com/yitter/idgenerator](https://github.com/yitter/idgenerator)
- 👉 Ip2region：[https://github.com/lionsoul2014/ip2region](https://github.com/lionsoul2014/ip2region)
- 👉 vue-pure-admin：[https://gitee.com/yiming_chang/vue-pure-admin](https://gitee.com/yiming_chang/vue-pure-admin)
- 👉 Prism：[https://github.com/PrismLibrary/Prism](https://github.com/PrismLibrary/Prism)
- 👉 rubyer-wpf：[https://gitee.com/wuyanxin1028/rubyer-wpf](https://gitee.com/wuyanxin1028/rubyer-wpf)
- 👉 Flurl：[https://github.com/tmenier/Flurl](https://github.com/tmenier/Flurl)
- 👉 以上排名不分先后，还包括有幸使用、未能一一在此列举的框架以及好朋友们


