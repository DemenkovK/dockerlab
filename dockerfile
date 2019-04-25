FROM dockerhub/ubuntu:16.04
MAINTEINER Konstantin Demenkov <demenkovk@gmail.com
RUN apt-get update
RUN apt-get install -y git maven tomcat8 wget
ADD jre-8u211-linux-x64.tar.gz /usr/lib/jvm/
RUN export JAVA_HOME=/usr/lib/jvm/jre1.8.0_211/ && mkdir calculator && cd calculator && git clone https://github.com/DenisErmolovich/calculator.git .  && mvn package && cp target/hello-1.0.war
EXPOSE 8080


