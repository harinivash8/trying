FROM openjdk:17-jdk-slim

# Install necessary tools
RUN apt-get update && apt-get install -y wget tar --no-install-recommends && rm -rf /var/lib/apt/lists/*

# Download and install Maven
ARG MAVEN_VERSION=3.9.6
ARG MAVEN_HOME=/opt/maven
RUN wget https://dlcdn.apache.org/maven/maven-${MAVEN_VERSION}/binaries/apache-maven-${MAVEN_VERSION}-bin.tar.gz -P /tmp \
    && tar xf /tmp/apache-maven-${MAVEN_VERSION}-bin.tar.gz -C /opt \
    && ln -s /opt/apache-maven-${MAVEN_VERSION} ${MAVEN_HOME} \
    && rm /tmp/apache-maven-${MAVEN_VERSION}-bin.tar.gz

# Set environment variables
ENV JAVA_HOME=/usr/lib/jvm/default-java
ENV MAVEN_HOME=${MAVEN_HOME}
ENV PATH="${MAVEN_HOME}/bin:${PATH}"

WORKDIR /app
COPY . .
RUN mvn clean -DskipTests

ENTRYPOINT ["java", "-jar", "target/trying-0.0.1-SNAPSHOT.jar"]
