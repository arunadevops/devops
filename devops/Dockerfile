FROM centos:latest
MAINTAINER phanikishorelanka@gmail.com
RUN mkdir -p /u01 && yum -y install java-1.8.0-openjdk unzip 
ADD  http://mirrors.estointernet.in/apache/tomcat/tomcat-8/v8.5.38/bin/apache-tomcat-8.5.38.zip /u01/
RUN cd /u01 && unzip apache-tomcat-8.5.38.zip 
COPY sampleweb.zip /u01/apache-tomcat-8.5.38/webapps/
RUN cd /u01/apache-tomcat-8.5.38/webapps/ && unzip sampleweb.zip 

ENV CATALINA_HOME /u01/apache-tomcat-8.5.38
ENV PATH $CATALINA_HOME/bin:$PATH

RUN useradd -m app_user && chown -R app_user:app_user /u01 && chmod -R a+x /u01/apache-tomcat-8.5.38/bin/
USER app_user 
RUN sed -i s/8080/8081/g /u01/apache-tomcat-8.5.38/conf/server.xml 
CMD ["catalina.sh", "run"]
EXPOSE 8081
WORKDIR $CATALINA_HOME
VOLUME ["/u01"]
