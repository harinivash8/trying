FROM tomcat:9-jdk17

WORKDIR /app

COPY target/twig-0.0.4-core.jar app.jar

EXPOSE 8080

CMD ["catalina.sh", "run"]
