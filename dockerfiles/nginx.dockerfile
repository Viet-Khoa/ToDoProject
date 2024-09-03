FROM nginx:latest

ENV NGINXUSER=khoa
ENV NGINXGROUP=docker

RUN mkdir -p /var/www/html/

ADD nginx/default.conf /etc/nginx/conf.d/default.conf

RUN sed -i "s/user www-data/user ${NGINXUSER}/g" /etc/nginx/nginx.conf


RUN groupadd -g 1000 -f ${NGINXGROUP}

RUN getent passwd ${NGINXUSER} > /dev/null || \
  useradd -u 1000 -s /bin/sh -g ${NGINXGROUP} ${NGINXUSER}

USER root

