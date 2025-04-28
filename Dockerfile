# Use Tomcat official image
FROM tomcat:9-jdk11

# Copy your WAR file into webapps
COPY target/*.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080

CMD ["catalina.sh", "run"]
