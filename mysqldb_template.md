# MySQL on Ubuntu Node

* Container: mysqldb
* Port on host: 3306
* Admin:
* Admin Pass:
* Supporting Scripts: /home/<username>/mysqldb/

## Create MySQL Server

``` bash
# Prepare configure files like in /home/<username>/mysqldb/{conf.d,mysql.conf.d}
# Prepare data dir and log dir
mkdir data log
chown 999:docker data log  # 999 is the uid of user `mysql` in the docker image
# Create MySQL instance the first time (setting root password as an environment variable)
docker run --name mysqldb --network <network> -d -p 3306:3306 -v /home/<username>/mysqldb/conf.d:/etc/mysql/conf.d -v /home/<username>/mysqldb/mysql.conf.d:/etc/mysql/mysql.conf.d -v /home/<username>/mysqldb/log:/var/log/mysql -v /home/<username>/mysqldb/data:/var/lib/mysql -e MYSQL_ROOT_PASSWORD="<password>" mysql
# Optional: If you destory and recreate the MySQL server instance (password is unnecessary)
docker run --name mysqldb --network <network> -d -p 3306:3306 -v /home/<username>/mysqldb/conf.d:/etc/mysql/conf.d -v /home/<username>/mysqldb/mysql.conf.d:/etc/mysql/mysql.conf.d -v /home/<username>/mysqldb/log:/var/log/mysql -v /home/<username>/mysqldb/data:/var/lib/mysql mysql
```

## Login as root

``` bash
docker run -it --network <network> --rm -v /home/<username>/mysqldb/conf.d:/etc/mysql/conf.d -v /home/<username>/mysqldb/mysql.conf.d:/etc/mysql/mysql.conf.d mysql sh -c 'exec mysql -hmysqldb -p3306 -uroot -p"<password>"'
```

## Create user

``` sql
-- CREATE USER '<username>'@'localhost' IDENTIFIED BY '<user_password>';
-- CREATE USER '<username>'@'%' IDENTIFIED BY '<user_password>';
-- GRANT ALL PRIVILEGES ON <db_name>.* To '<username>'@'localhost' WITH GRANT OPTION;
-- GRANT DELETE, INSERT, LOCK TABLES, SELECT, UPDATE ON <db_name>.* To '<username>'@'%';
CREATE USER '<username>'@'%' IDENTIFIED BY '<user_password>';
GRANT ALL PRIVILEGES ON <db_name>.* To '<username>'@'%' WITH GRANT OPTION;
FLUSH PRIVILEGES;
-- Check grants
-- SHOW GRANTS FOR <username>@'localhost';
SHOW GRANTS FOR <username>@'%';
```

## Login

``` bash
# '<username>'@'localhost'
docker exec -it mysqldb mysql -u<username> -p"<user_password>"
# '<username>'@'%'
docker run -it --network <network> --rm -v /home/<username>/mysqldb/conf.d:/etc/mysql/conf.d -v /home/<username>/mysqldb/mysql.conf.d:/etc/mysql/mysql.conf.d mysql sh -c 'exec mysql -hmysqldb -p3306 -u<username> -p"<user_password>"'
```

## Create DB and tables

``` sql
CREATE DATABASE <db_name>;
USE <db_name>;
SOURCE /path/to/init.sql;
```

