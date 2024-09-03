FROM php:8.3.7-apache

ENV APACHEUSER=khoa
ENV APACHEGROUP=docker

RUN mkdir -p /var/www/html

ADD apache/default.conf /etc/apache/conf.d/default.conf

RUN sed -i "s/user www-data/user ${APACHEUSER}/g" /etc/apache/apache.conf

RUN groupsadd -g 1000 ${APACHEGROUP}

RUN useradd -u 1000 -s /bin/sh -g ${APACHEGROUP} ${APACHEUSER}
