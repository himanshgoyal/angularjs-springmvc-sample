FROM localhost:5000/tomcatbaseimage:1.0

RUN cd /usr/local/tomcat/builds && wget http://104.154.53.190:8081/content/repositories/releases/com/hantsylabs/restexample/springmvc/demoapp/APPVER/demoapp-APPVER.war

RUN cd /usr/local/tomcat/webapps && rm demoapp.war && ln -s /usr/local/tomcat/builds/demoapp-APPVER.war demoapp.war


CMD /usr/local/tomcat/bin/catalina.sh start && tail -f /usr/local/tomcat/logs/catalina.out

