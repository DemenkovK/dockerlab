FROM ubuntu:16.04
MAINTAINER Konstantin Demenkov <demenkovk@gmail.com
RUN apt-get update
RUN apt-get install -y git maven tomcat8 wget openjdk-9-jre
ADD jre-8u211-linux-x64.tar.gz /usr/lib/jvm/
ENV JAVA_HOME=/usr/lib/jvm/jre1.8.0_211/
RUN mkdir hello && cd hello && git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git . && \
export JAVA_HOME=/usr/lib/jvm/jre1.8.0_211/ && echo "$JAVA_HOME" && mvn package && cp target/hello-1.0.war
EXPOSE 8080


