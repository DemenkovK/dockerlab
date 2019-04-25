FROM dockerhub/ubuntu:16.04
MAINTEINER Konstantin Demenkov <demenkovk@gmail.com
RUN apt-get update
RUN apt-get install -y git maven tomcat8 wget openjdk-9-jre
RUN export JAVA_HOME=/usr/lib/jvm/java-9-openjdk-amd64/
RUN mkdir calculator && cd calculator && git clone https://github.com/DenisErmolovich/calculator.git .  && mvn package && cp target/calculator.war

