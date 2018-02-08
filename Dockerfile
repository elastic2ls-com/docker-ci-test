FROM java:8
MAINTAINER Alex Wiechert <awiechert@elastic2ls.com>
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update
RUN apt-get install --no-install-recommends -y supervisor curl net-tools mlocate nano vim less apach$
ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
EXPOSE 80

ENV TOMCAT_RUN_USER tomcat7
RUN ln -s /etc/tomcat7/ /usr/share/tomcat7/conf
CMD ["/usr/share/tomcat7/bin/catalina.sh", "run"]
EXPOSE 80
EXPOSE 8080
