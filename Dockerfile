FROM tomcat:9-jdk17

WORKDIR /app

COPY target/twig-0.0.4.jar /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080

CMD ["catalina.sh", "run"]
