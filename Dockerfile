# Use OpenJDK base image
FROM openjdk:17

# Install xvfb for headless GUI rendering (necessary for AWT/Swing)
RUN apt-get update && \
    apt-get install -y xvfb && \
    apt-get clean

# Create app directory
WORKDIR /app

# Copy the JAR
COPY target/twig-0.0.4-core.jar app.jar

# Run in headless X11 virtual framebuffer
CMD ["xvfb-run", "java", "-jar", "app.jar"]
