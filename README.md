## mysqlsyn.sh 是一个维护sql语句的shell脚本.


### 文件说明:
    * update.sql 保存新增sql语句的文件, 执行mysqlsyn.sh后该文件中sql将被执行, 执行后其sql语句被写入到cyc_update.sql文件中, 同时清空update.sql.

    * cyc_update.sql 在一次开发迭代周期中, 增量保存update.sql文件中sql语句. 并在本期开发迭代完毕, 需要同步该文件中sql语句到生产数据库. 同步后执行mysqlsyn.sh allin 使上线sql写入project.sql中及清空cys_update.sql文件.

    * project.sql 项目sql文件, 该文件保存项目完整sql语句. allin 后记录最终sql版本.


### 工作流程
    1 修改mysqlsyn.sh文件中数据库用户与密码配置

    2 新增sql语句, 写入到update.sql文件

    3 执行./mysqlsyn.sh 脚本, 执行update.sql文件中sql. 原则上讲sql语句执行不可逆, 如需回退, 请在增加sql.

    4 完整功能开发完毕, 需要all in到project.sql文件, 执行 ./mysqlsyn.sh allin




