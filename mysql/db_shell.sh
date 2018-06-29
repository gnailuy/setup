#!/bin/bash

# From localhost
# docker exec -it mysqldb mysql -u<usernname> -p"<password>"

docker run -it --network ${NETWORK} --rm -v /home/${USER}/mysqldb/conf.d:/etc/mysql/conf.d -v /home/${USER}/mysqldb/mysql.conf.d:/etc/mysql/mysql.conf.d mysql sh -c 'exec mysql -hmysqldb -p3306 -u${USER} -p"${PASS}"'

