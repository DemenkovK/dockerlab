FROM ubuntu:16.04
MAINTAINER Konstantin Demenkov <demenkovk@gmail.com
RUN apt-get update
RUN apt-get install -y git maven tomcat8 wget
ADD jre-8u211-linux-x64.tar.gz /usr/lib/jvm/
RUN ls /usr/lib/jvm/ -la
RUN export JAVA_HOME=/usr/lib/jvm/jre1.8.0_211/ && mkdir hello && cd hello && git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git . && \
tar -xvzf /usr/lib/jvm/jre-8u211-linux-x64.tar.gz && mvn package && cp target/hello-1.0.war
EXPOSE 8080


