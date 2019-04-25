FROM ubuntu:16.04
MAINTAINER Konstantin Demenkov <demenkovk@gmail.com
RUN apt-get update
RUN apt-get install -y git maven tomcat8 wget openjdk-9-jre
ADD jdk-8u212-linux-x64.tar.gz /usr/lib/jvm/
ENV JAVA_HOME=/usr/lib/jvm/jdk1.8.0_212/
RUN mkdir hello && cd hello && git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git . && \
mvn package && cp target/hello-1.0.war
EXPOSE 8080


