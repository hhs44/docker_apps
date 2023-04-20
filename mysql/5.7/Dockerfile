FROM openeuler:20.03-lts
# 安装MySQL 5.7
RUN yum install -y mysql-server-5.7

# 启动MySQL服务并设置密码
RUN systemctl start mysqld && \
    mysqladmin -u root password 'your_password'

# 创建新的账户
RUN mysql -u root -pyour_password -e "CREATE USER 'new_user'@'localhost' IDENTIFIED BY 'new_password';" && \
    mysql -u root -pyour_password -e "GRANT ALL PRIVILEGES ON *.* TO 'new_user'@'localhost';"

# 设置MySQL服务自动启动
RUN systemctl enable mysqld

# 暴露MySQL端口
EXPOSE 3306

# 容器启动时自动启动MySQL服务
CMD ["/usr/sbin/init"]