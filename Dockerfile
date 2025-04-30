FROM tomcat:9-jdk21

WORKDIR /app

COPY app.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080

CMD ["catalina.sh", "run"]
