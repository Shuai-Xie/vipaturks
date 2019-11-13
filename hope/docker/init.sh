#!/bin/bash
/usr/bin/mysqld_safe  &
sleep 5

mysql -u root -e "CREATE DATABASE hope"
mysql -u root -e "CREATE USER dataturks@'127.0.0.1' IDENTIFIED BY '12345';"
mysql -u root -e "GRANT SELECT, INSERT, UPDATE, DELETE ON hope.* TO dataturks@127.0.0.1;FLUSH PRIVILEGES;"
mysql -u root hope < /home/dataturks/mysqlInit.sql

# 创建新的 dataturks@% 用户，使其他 IP 也可访问数据库
#CREATE USER dataturks@'%' IDENTIFIED BY '12345';
#GRANT SELECT, INSERT, UPDATE, DELETE ON hope.* TO dataturks@'%';FLUSH PRIVILEGES;