# Build stage
FROM maven:3.9-eclipse-temurin-21 AS build
WORKDIR /app
COPY pom.xml .
# Download all dependencies
RUN mvn dependency:go-offline -B
# Copy source code
COPY src ./src
# Package the application
RUN mvn clean package

# Deployment stage
FROM tomcat:9-jdk21
COPY --from=build /app/target/*.war /usr/local/tomcat/webapps/ROOT.war
EXPOSE 8080
CMD ["catalina.sh", "run"]
