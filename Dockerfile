FROM alpine:3.3
MAINTAINER Amrit G.C. <music.demand01@gmail.com>

RUN echo "http://dl-4.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories && \
    apk --update add \
	nginx \
	curl \
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
  	supervisor \
    --update-cache \
    --allow-untrusted

RUN rm -rf /var/cache/apk/*
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer 

RUN rm /etc/nginx/nginx.conf
ADD conf/nginx.conf /etc/nginx/nginx.conf
ADD conf/default.conf /etc/nginx/default.d/default.conf

VOLUME ["/var/www", "/etc/nginx/sites-enabled"]

ADD conf/nginx-supervisor.ini /etc/supervisor.d/nginx-supervisor.ini

RUN rm -rf /var/cache/apk/*

EXPOSE 80 9000

VOLUME /var/www

CMD ["/usr/bin/supervisord", "-c"]

ENTRYPOINT ["/bin/sh", "-c"]
