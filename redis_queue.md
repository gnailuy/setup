# Redis Queue onn Ubuntu Node

* Container: redis\_queue
* Port on host: 6379
* Supporting Scripts: /home/<username>/redis\_queue/

## Create Redis Server

``` bash
# Prepare configure files like in /home/<username>/redis_queue/conf/
# Prepare data dir
mkdir data
docker run --name redis_queue --network <network> -p 6379:6379 -v /home/<username>/redis_queue/conf/:/usr/local/etc/redis/ -v /home/<username>/redis_queue/data/:/data/ -d redis redis-server
```

## Login to redis shell

``` bash
docker run -it --network <network> --rm redis redis-cli -h redis_queue -p 6379
```

