#!/bin/bash

docker run --name redis_queue --network ${NETWORK} -p 6379:6379 -v /home/${USER}/redis_queue/conf/:/usr/local/etc/redis/ -v /home/${USER}/redis_queue/data/:/data/ -d redis redis-server

