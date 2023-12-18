
FROM tomcat:8.5-jre8-alpine

RUN mkdir /usr/local/tomcat/external_data

COPY target/SpringRestIntegrationApp-0.0.1-SNAPSHOT.war /usr/local/tomcat/webapps/app.war

VOLUME /usr/local/tomcat/external_data

CMD ["catalina.sh", "run"]
