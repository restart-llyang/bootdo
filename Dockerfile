#选择ubuntu最小镜像
FROM ubuntu

#制作者
MAINTAINER by lilong

#创建jdk路径
RUN mkdir -p /opt/jdk

#创建工程路径
RUN mkdir -p /opt/bootdo

#拷贝jdk到容器
COPY jdk-8u77-linux-x64.tar.gz /opt/jdk

#软件包到容器
COPY target/bootdo-docker-1.6.9.jar /opt/bootdo

#拷贝启动脚本
COPY run.sh /opt/bootdo

#设置启动脚本可执行权限
RUN chmod 700 /opt/bootdo/run.sh

#安装jdk
RUN tar xzf /opt/jdk/jdk-8u77-linux-x64.tar.gz -C /opt/jdk && rm -rf /opt/jdk/jdk-8u77-linux-x64.tar.gz

#设置环境变量
ENV JAVA_HOME /opt/jdk/jdk1.8.0_77
ENV PATH $PATH:$JAVA_HOME/bin

#开放8080端口
EXPOSE 8080

#设置容器启动时执行
CMD ["/opt/bootdo/run.sh"]
