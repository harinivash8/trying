# Use an official Tomcat base image
FROM tomcat:9-jdk17

# Set the maintainer label
LABEL maintainer="you@example.com"

# Copy your .war file into the Tomcat webapps directory
COPY target/twig-0.0.4.war /usr/local/tomcat/webapps/ROOT.war

# Expose the Tomcat port
EXPOSE 8080

# Start Tomcat when the container runs
CMD ["catalina.sh", "run"]
