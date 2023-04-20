FROM tmp:latest

ENV MYSQL_MAJOR=5.7
ENV MYSQL_VERSION=5.7.42
# 安装MySQL 5.7
RUN yum -y install https://dev.mysql.com/get/mysql57-community-release-el7-11.noarch.rpm \
    && yum -y install mysql-community-server --nogpgcheck \
    && yum clean all \
    && rm -rf /var/cache/yum/* \
    && mkdir -p /var/log/mysql && \
    mkdir -p /var/run/mysqld && \
    chown -R mysql:mysql /var/log/mysql && \
    chown -R mysql:mysql /var/run/mysqld && \
    echo '[mysqld]' > /etc/my.cnf && \
    echo 'user=mysql' >> /etc/my.cnf && \
    echo 'datadir=/var/lib/mysql' >> /etc/my.cnf && \
    echo 'socket=/var/run/mysqld/mysqld.sock' >> /etc/my.cnf && \
    echo 'log_error=/var/log/mysql/mysql_error.log' >> /etc/my.cnf && \
    echo 'pid_file=/var/run/mysqld/mysqld.pid' >> /etc/my.cnf && \
    echo 'skip-host-cache' >> /etc/my.cnf && \
    echo 'skip-name-resolve' >> /etc/my.cnf && \
    echo '!includedir /etc/my.cnf.d' >> /etc/my.cnf
    
# 暴露MySQL端口
EXPOSE 3306 33060
COPY start.sh /usr/local/bin/
RUN chmod 755 /usr/local/bin/start.sh
# 容器启动时自动启动MySQL服务
CMD ["start.sh"]