FROM tomcat:8.5-jre8-alpine

# Copier le -f ichier WAR dans le répertoire webapps de Tomcat
COPY target/SpringRestIntegrationApp-0.0.1-SNAPSHOT.war /usr/local/tomcat/webapps/app.war
