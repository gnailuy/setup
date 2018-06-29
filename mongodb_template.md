# MongoDB on Ubuntu Node

* Container: mongodb
* Port on host: 27018
* Admin:
* Admin Pass:
* Supporting Scripts: /home/<username>/mongodb/

## User and Index

``` mongodb
use <db_name>
db.runCommand({createUser: "<username>", pwd: "<password>", roles: [{role: "readWrite", db: "<db_name>"}]})
db.<db_name>.createIndex({<index_map>}, {"background": true, "unique": false, "name": "<index_name>"})
```

