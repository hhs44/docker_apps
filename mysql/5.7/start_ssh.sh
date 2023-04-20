#!/bin/bash
set -e

echo "Read environment variables"
MYSQL_USER=${MYSQL_USER:-"root"}
MYSQL_PASSWORD=${MYSQL_PASSWORD:-""}
MYSQL_DATABASE=${MYSQL_DATABASE:-"mydb"}
MYSQL_ALLOW_EMPTY_PASSWORD=${MYSQL_ALLOW_EMPTY_PASSWORD:-"yes"}

echo "Start MySQL"
/usr/bin/mysqld_safe --skip-syslog --skip-networking --nowatch

--basedir=/usr --datadir=/var/lib/mysql

--plugin-dir=/usr/lib64/mysql/plugin

--log-error=/var/log/mysql/error.log

--pid-file=/var/run/mysqld/mysqld.pid

--user=mysql &
pid="$!"

echo "Wait for MySQL to start"
timeout=30
while ! mysqladmin ping --silent &> /dev/null; do
timeout=$(expr $timeout - 1)
if [[ $timeout -eq 0 ]]; then
echo "Unable to connect to MySQL server."
exit 1
fi
sleep 1
done

echo "Create default database and user"
if [[ -n "$MYSQL_PASSWORD" || "$MYSQL_ALLOW_EMPTY_PASSWORD" = "yes" ]]; then
mysql -u root -e "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;"
if [[ -n "$MYSQL_USER" ]]; then
mysql -u root -e "GRANT ALL ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';"
fi
fi

echo "Stop MySQL gracefully"
if ! kill -s TERM "$pid" || ! wait "$pid"; then
echo >&2 'MySQL init process failed.'
exit 1
fi

echo "Start MySQL in normal mode"
/usr/sbin/mysqld