FROM postgres:12
RUN sed -i 's/deb.debian.org/mirrors.ustc.edu.cn/g' /etc/apt/sources.list \
&& apt update && apt install -y openssh-server lsof curl unzip iputils* nfs* net-tools vim wget iproute2 \
&& mkdir /var/run/sshd\ && echo 'root:Huawei@12az' | chpasswd\
&& sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config 

COPY start_ssh.sh /root/start_ssh.sh

RUN sed -i '$a\if [ -f /root/start_ssh.sh ]; then ' /root/.bashrc \
&& sed -i '$a\     . /root/start_ssh.sh' /root/.bashrc \
&& sed -i '$a\fi' /root/.bashrc
