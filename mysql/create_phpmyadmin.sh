#!/bin/bash

docker run --name myadmin --network ${NETWORK} -d -p 8088:80 -e PMA_HOST=mysqldb phpmyadmin/phpmyadmin

