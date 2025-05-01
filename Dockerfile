# Build stage
FROM eclipse-temurin:17-jdk AS builder
WORKDIR /app
COPY . .
RUN mvn clean package

# Run stage
FROM eclipse-temurin:17-jre
WORKDIR /app
COPY --from=builder /app/target/twig-*-core.jar /app/twig.jar

# Install X11 dependencies (for GUI)
RUN apt-get update && apt-get install -y xauth libxrender1 libxtst6

# Run in headless mode by default (comment out if GUI is needed)
CMD ["java", "-Djava.awt.headless=true", "-jar", "twig.jar"]

# Uncomment for GUI support (requires X11 server on host)
# ENV DISPLAY=:0
# CMD ["java", "-jar", "twig.jar"]
