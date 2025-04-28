# Use the official Amazon Linux 2 base image
FROM amazonlinux:2

# Install necessary tools
RUN yum update -y && \
    yum install -y wget tar java-11-openjdk-devel # Or a different JDK version (e.g., java-17-openjdk-devel)

# Set JAVA_HOME environment variable
ENV JAVA_HOME=/usr/lib/jvm/java-11-openjdk.x86_64 # Adjust path based on the installed JDK

# Download and install Maven
ARG MAVEN_VERSION=3.9.6
ARG MAVEN_HOME=/opt/maven
RUN wget https://dlcdn.apache.org/maven/maven-${MAVEN_VERSION}/binaries/apache-maven-${MAVEN_VERSION}-bin.tar.gz -P /tmp && \
    tar xf /tmp/apache-maven-${MAVEN_VERSION}-bin.tar.gz -C /opt && \
    ln -s /opt/apache-maven-${MAVEN_VERSION} ${MAVEN_HOME} && \
    rm /tmp/apache-maven-${MAVEN_VERSION}-bin.tar.gz

# Set Maven environment variable and update PATH
ENV MAVEN_HOME=${MAVEN_HOME}
ENV PATH="${MAVEN_HOME}/bin:${PATH}:${JAVA_HOME}/bin"

# Set the working directory for your application code
WORKDIR /app

# Copy your project files into the container
COPY pom.xml .
COPY src ./src

# Clean and package the application using Maven
RUN mvn clean package

# Specify the command to run when the container starts (adjust the JAR name if needed)
ENTRYPOINT ["java", "-jar", "target/trying-0.0.1-SNAPSHOT.jar"]

# Expose any necessary ports (e.g., for a web application)
# EXPOSE 8080
