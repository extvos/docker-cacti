FROM extvos/php5

MAINTAINER  "Mingcai SHEN <archsh@gmail.com>"

COPY start-httpd.sh /
RUN yum install -y httpd mod_ssl \
	&& chmod +x /start-httpd.sh


EXPOSE 80

VOLUME ["/var/www/cgi-bin", "/var/www/error",  "/var/www/html",  "/var/www/icons"]

CMD ["/start-httpd.sh"]