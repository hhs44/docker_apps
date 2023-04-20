FROM percona/percona-xtradb-cluster:8.0.20
RUN  rm -rf /etc/yum.repo.d/* 
COPY repo.repo /etc/yum.repo.d/

RUN yum clean all\
&& yum install -y openssh-server lsof curl unzip iputils* nfs-utils net-tools vim wget iproute \
&& yum clean all\
&& mkdir /var/run/sshd\ && echo 'root:Huawei@12az' | chpasswd\
&& sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config 

COPY start_ssh.sh /root/start_ssh.sh

RUN sed -i '$a\if [ -f /root/start_ssh.sh ]; then ' /root/.bashrc \
&& sed -i '$a\     . /root/start_ssh.sh' /root/.bashrc \
&& sed -i '$a\fi' /root/.bashrc 
