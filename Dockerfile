FROM alpine:latest
MAINTAINER Amrit G.C. <music.demand01@gmail.com>

RUN apk --update add \
	nginx \
	php-fpm \
	php-pdo \
	php-json \
	php-openssl \
	php-mysql \
	php-pdo_mysql \
	php-mcrypt \
	php-sqlite3 \
	php-pdo_sqlite \
	php-ctype \
	php-zlib \
	php-curl \
	php-gd \
	php-xml \
	php-dom \
	php-xdebug \
	php-memcached \
  	supervisor

RUN mkdir -p /etc/nginx
RUN mkdir -p /var/run/php-fpm
RUN mkdir -p /var/log/supervisor

RUN rm /etc/nginx/nginx.conf
ADD conf/nginx.conf /etc/nginx/nginx.conf

VOLUME ["/var/www", "/etc/nginx/sites-enabled"]

ADD conf/nginx-supervisor.ini /etc/supervisor.d/nginx-supervisor.ini

RUN rm -rf /var/cache/apk/*

EXPOSE 80 9000

CMD ["/usr/bin/supervisord"]
