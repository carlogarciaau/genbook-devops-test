FROM tomcat:latest
ENV JAVA_OPTS="-Xmx512m -Xms256m"
# War file replacement
RUN rm -rf /usr/local/tomcat/webapps/*
COPY target/hello-world.war /usr/local/tomcat/webapps/ROOT.war
EXPOSE 8080
ENTRYPOINT ["/usr/local/tomcat/bin/catalina.sh", "run"]