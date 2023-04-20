FROM openeuler-20.03-lts
RUN echo "[os]" >> /etc/yum.repos.d/openEuler_x86_64.repo \
    && echo "name=os" >> /etc/yum.repos.d/openEuler_x86_64.repo \
    && echo "baseurl=https://mirrors.aliyun.com/openeuler/openEuler-20.03-LTS/OS/x86_64/" >> /etc/yum.repos.d/openEuler_x86_64.repo \
    && echo "enabled=1" >> /etc/yum.repos.d/openEuler_x86_64.repo \
    && echo "gpgcheck=1" >> /etc/yum.repos.d/openEuler_x86_64.repo \
    && echo "gpgkey=http://mirrors.aliyun.com/openeuler/openEuler-20.03-LTS/OS/x86_64/RPM-GPG-KEY-openEuler" >> /etc/yum.repos.d/openEuler_x86_64.repo \
    && echo "[everything]" >> /etc/yum.repos.d/openEuler_x86_64.repo \
    && echo "name=everything" >> /etc/yum.repos.d/openEuler_x86_64.repo \
    && echo "baseurl=https://mirrors.aliyun.com/openeuler/openEuler-20.03-LTS/everything/x86_64/" >> /etc/yum.repos.d/openEuler_x86_64.repo \
    && echo "enabled=1" >> /etc/yum.repos.d/openEuler_x86_64.repo \
    && echo "gpgcheck=1" >> /etc/yum.repos.d/openEuler_x86_64.repo \
    && echo "gpgkey=https://mirrors.aliyun.com/openeuler/openEuler-20.03-LTS/everything/x86_64/RPM-GPG-KEY-openEuler" >> /etc/yum.repos.d/openEuler_x86_64.repo \
    && echo "[EPOL]" >> /etc/yum.repos.d/openEuler_x86_64.repo \
    && echo "name=EPOL" >> /etc/yum.repos.d/openEuler_x86_64.repo \
    && echo "baseurl=http://mirrors.aliyun.com/openeuler/openEuler-20.03-LTS-SP2/EPOL/main/x86_64/" >> /etc/yum.repos.d/openEuler_x86_64.repo \
    && echo "enabled=1" >> /etc/yum.repos.d/openEuler_x86_64.repo \
    && echo "gpgcheck=1" >> /etc/yum.repos.d/openEuler_x86_64.repo \
    && echo "gpgkey=http://mirrors.aliyun.com/openeuler/openEuler-20.03-LTS-SP2/EPOL/main/x86_64/RPM-GPG-KEY-openEuler" >> /etc/yum.repos.d/openEuler_x86_64.repo \
    && yum clean all \
    && yum makecache \
    && yum install -y systemd \
    && yum install -y openssh-server vi vim hostname lsof tar curl unzip iputils* nfs* net-tools  rpcbind wget iproute \
    && yum clean all \
    && mkdir /var/run/sshd\ && echo 'root:Huawei@12az' | chpasswd\
    && sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config 

COPY start_ssh.sh /root/start_ssh.sh

RUN sed -i '$a\if [ -f /root/start_ssh.sh ]; then ' /root/.bashrc \
&& sed -i '$a\     . /root/start_ssh.sh' /root/.bashrc \
&& sed -i '$a\fi' /root/.bashrc
COPY start.sh /root/start.sh

ENTRYPOINT ["/usr/sbin/init"]
CMD ["sh","start.sh"]
