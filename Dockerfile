FROM tomcat:9-jdk21

WORKDIR /app



EXPOSE 8080

CMD ["catalina.sh", "run"]
