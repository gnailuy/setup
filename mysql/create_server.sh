#!/bin/bash

# Set a root password when creating MySQL server for the first time (when ./data is empty)
# docker run --name mysqldb --network ${NETWORK} -d -p 3306:3306 -v /home/${USER}/mysqldb/conf.d:/etc/mysql/conf.d -v /home/${USER}/mysqldb/mysql.conf.d:/etc/mysql/mysql.conf.d -v /home/${USER}/mysqldb/log:/var/log/mysql -v /home/${USER}/mysqldb/data:/var/lib/mysql -e MYSQL_ROOT_PASSWORD="${PASS}" mysql

docker run --name mysqldb --network ${NETWORK} -d -p 3306:3306 -v /home/${USER}/mysqldb/conf.d:/etc/mysql/conf.d -v /home/${USER}/mysqldb/mysql.conf.d:/etc/mysql/mysql.conf.d -v /home/${USER}/mysqldb/log:/var/log/mysql -v /home/${USER}/mysqldb/data:/var/lib/mysql mysql

