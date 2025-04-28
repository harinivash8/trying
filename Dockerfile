# Use a base image that has a Linux distribution (e.g., Ubuntu, CentOS, Alpine)
FROM linux:latest

# Update package lists
RUN apt-get update && apt-get install -y --no-install-recommends \
    software-properties-common \
    wget \
    openjdk-11-jdk \
    && rm -rf /var/lib/apt/lists/*

# Download and install Maven
RUN wget https://dlcdn.apache.org/maven/maven-3/3.9.6/binaries/apache-maven-3.9.6-bin.tar.gz
RUN tar -xvf apache-maven-3.9.6-bin.tar.gz -C /opt
RUN ln -s /opt/apache-maven-3.9.6 /opt/maven

# Set environment variables
ENV JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64
ENV MAVEN_HOME=/opt/maven
ENV PATH="$PATH:$JAVA_HOME/bin:$MAVEN_HOME/bin"

# Set the working directory for your application code
WORKDIR /app

# Copy your project files into the container
COPY pom.xml .
COPY src ./src

# Define the command to run your Maven build
CMD ["mvn", "clean", "package"]
