FROM extvos/php5

MAINTAINER  "Mingcai SHEN <archsh@gmail.com>"

CACTI_VERSION 0.8.8f

ADD http://www.cacti.net/downloads/cacti-${CACTI_VERSION}.tar.gz /opt

COPY start-httpd.sh /
RUN yum install -y httpd mod_ssl \
	&& chmod +x /start-httpd.sh \
	&& cd /opt \
	&& wget http://www.cacti.net/downloads/cacti-${CACTI_VERSION}.tar.gz \
	&& tar zxf cacti-${CACTI_VERSION}.tar.gz \
	&& rm -f cacti-${CACTI_VERSION}.tar.gz \ 
	&& ln -s /opt/cacti-${CACTI_VERSION} /opt/cacti


EXPOSE 80

VOLUME ["/var/www/cgi-bin", "/var/www/error",  "/var/www/html",  "/var/www/icons"]

CMD ["/start-service.sh"]