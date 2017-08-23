#!/bin/bash
hostname='10.20.70.215'
username='root'
password=''
port='3306'

if [ "$1" == "allin" ]
then
    cyc_update_sql=$(cat cyc_update.sql)
    echo ${cyc_update_sql} >> project.sql
    echo > cyc_update.sql
    echo 'all in project.sql 成功!'
    exit
fi

update_sql=$(cat update.sql)
if [ ! ${update_sql} ]
then
    echo 'update sql 为空!'
    exit
fi

#数据库列表, 可以维护多个数据库
db_list=('dqcenter' 'dqcenter_test1')

for dbname in ${db_list[@]};
do
    mysql -h${hostname}  -P${port}  -u${username} ${dbname} -e "${update_sql}"
    echo "$dbname数据库, 新增数据表结构成功!"
done

echo ${update_sql} >> cyc_update.sql
echo > update.sql