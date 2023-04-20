#!/bin/bash

# 启动MySQL服务器
/usr/sbin/mysqld --user=mysql --console --skip-grant-tables --skip-networking > /dev/null 2>&1 &

# 等待MySQL服务器启动
RET=1
while [[ RET -ne 0 ]]; do
    mysql -uroot -e "status" > /dev/null 2>&1
    RET=$?
    sleep 1
done

# 初始化MySQL服务器
mysql -uroot <<EOF
  SET @@SESSION.SQL_LOG_BIN=0;
  DELETE FROM mysql.user WHERE user='';
  DELETE FROM mysql.user WHERE user='root' AND host NOT IN ('localhost', '127.0.0.1');
  FLUSH PRIVILEGES;
EOF

# 停止MySQL服务器
mysqladmin -uroot --password= shutdown

# 启动MySQL服务器
exec /usr/sbin/mysqld --user=mysql --console