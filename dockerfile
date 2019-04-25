FROM ubuntu:16.04
MAINTAINER Konstantin Demenkov <demenkovk@gmail.com
RUN apt-get update
RUN apt-get install -y git maven tomcat8 wget
ADD https://github.com/frekele/oracle-java/releases/download/8u212-b10/jdk-8u212-linux-x64.tar.gz /usr/lib/jvm/
RUN cd /usr/lib/jvm/ && tar -xvzf /usr/lib/jvm/jdk-8u212-linux-x64.tar.gz
ENV JRE_HOME /usr/lib/jvm/jdk1.8.0_212/jre
ENV JAVA_HOME /usr/lib/jvm/jdk1.8.0_212
RUN mvn -v
RUN mkdir hello && cd hello && git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git . && \
mvn package && cp /hello/target/hello-1.0.war /var/lib/tomcat8/webapps/
RUN chkconfig tomcat8 on && service tomcat8 start
EXPOSE 8080
