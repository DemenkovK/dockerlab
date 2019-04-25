FROM ubuntu:16.04
MAINTAINER Konstantin Demenkov <demenkovk@gmail.com
RUN apt-get update
RUN apt-get install -y git maven tomcat8 wget openjdk-9-jre
ADD https://github.com/frekele/oracle-java/releases/download/8u212-b10/jdk-8u212-linux-x64.tar.gz /usr/lib/jvm/
ENV JRE_HOME /usrlib/jvm/jdk1.8.0_212/jre
RUN mkdir hello && cd hello && git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git . && \
export JAVA_HOME=/usr/lib/jvm/jdk1.8.0_212 && export PATH="$JRE_HOME/bin:$JAVA_HOME/bin:$PATH" && mvn package && cp target/hello-1.0.war
EXPOSE 8080
