# Use Amazon Corretto Java 21 as base image
FROM amazoncorretto:21

# Install Maven
RUN yum install -y wget tar gzip \
    && wget https://dlcdn.apache.org/maven/maven-3/3.9.6/binaries/apache-maven-3.9.6-bin.tar.gz -P /tmp \
    && tar xf /tmp/apache-maven-3.9.6-bin.tar.gz -C /opt \
    && ln -s /opt/apache-maven-3.9.6 /opt/maven \
    && ln -s /opt/maven/bin/mvn /usr/local/bin \
    && rm /tmp/apache-maven-3.9.6-bin.tar.gz

# Set Maven home
ENV MAVEN_HOME /opt/maven

# Verify installations
RUN java -version && mvn -v

# Set working directory
WORKDIR /app

# Copy your project files
COPY . .

# Build the project
RUN mvn clean package

# Set the default command
CMD ["java", "-jar", "target/twig-0.0.4-core.jar"]
