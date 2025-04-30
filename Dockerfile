FROM tomcat:9-jdk21

WORKDIR /app

COPY target/twig-0.0.4-core.jar /usr/local/tomcat/webapps/ROOT.jar

EXPOSE 8080

CMD ["catalina.sh", "run"]
