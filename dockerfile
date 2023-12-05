FROM tomcat:8.5-jre8-alpine

COPY target/SpringRestIntegrationApp-0.0.1-SNAPSHOT.war /usr/local/tomcat/webapps/
