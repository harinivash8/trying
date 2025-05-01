FROM amazoncorretto:21

RUN yum install -y wget tar gzip \
    && wget https://dlcdn.apache.org/maven/maven-3/3.9.6/binaries/apache-maven-3.9.6-bin.tar.gz -P /tmp \
    && tar xf /tmp/apache-maven-3.9.6-bin.tar.gz -C /opt \
    && ln -s /opt/apache-maven-3.9.6 /opt/maven \
    && ln -s /opt/maven/bin/mvn /usr/local/bin \
    && rm /tmp/apache-maven-3.9.6-bin.tar.gz

ENV MAVEN_HOME /opt/maven

RUN java -version && mvn -v

WORKDIR /app

COPY . .

RUN mvn clean package

CMD ["java", "-jar", "target/twig-0.0.4-core.jar"]
