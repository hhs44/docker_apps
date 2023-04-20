FROM mysql:8.0.20
RUN sed -i 's/deb.debian.org/mirrors.ustc.edu.cn/g' /etc/apt/sources.list \
&& rm -rf /etc/apt/sources.list.d/* \
&& apt update \
&& apt install -y init \
&& apt install -y openssh-server nano lsof curl unzip iputils* nfs* net-tools vim wget iproute2 \
&& apt clean all \
&& mkdir /var/run/sshd\ && echo 'root:Huawei@12az' | chpasswd\
&& sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config 

COPY start_ssh.sh /root/start_ssh.sh

RUN sed -i '$a\if [ -f /root/start_ssh.sh ]; then ' /root/.bashrc \
&& sed -i '$a\     . /root/start_ssh.sh' /root/.bashrc \
&& sed -i '$a\fi' /root/.bashrc
