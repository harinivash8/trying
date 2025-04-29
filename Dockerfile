FROM amazoncorretto:21

RUN yum install -y unzip curl tar && \
    curl -O https://downloads.apache.org/tomcat/tomcat-9/v9.0.85/bin/apache-tomcat-9.0.85.tar.gz && \
    tar -xzf apache-tomcat-9.0.85.tar.gz && \
    mv apache-tomcat-9.0.85 /opt/tomcat && \
    rm -rf /opt/tomcat/webapps/*

COPY target/*.war /opt/tomcat/webapps/ROOT.war

EXPOSE 8080

CMD ["/opt/tomcat/bin/catalina.sh", "run"]
