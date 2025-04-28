# Example for an Ubuntu-based image
FROM ubuntu:latest
RUN apt-get update && apt-get install -y maven openjdk-11-jdk
ENV JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64
ENV PATH="$PATH:$JAVA_HOME/bin:/opt/maven/bin"
WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN mvn clean package
