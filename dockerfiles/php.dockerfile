FROM php:fpm

ENV PHPUSER=khoa
ENV PHPGROUP=docker

RUN mkdir -p /var/www/html/public

RUN getent passwd ${PHPUSER} > /dev/null || \
  groupadd -g 1000 -f  ${PHPGROUP} && \
  useradd -u 1000 -s /bin/sh ${PHPUSER}

RUN sed -i "s/user www-data/user ${PHPUSER}/g" /usr/local/etc/php-fpm.d/www.conf && \
  sed -i "s/group www-data/group ${PHPGROUP}/g" /usr/local/etc/php-fpm.d/www.conf
RUN docker-php-ext-install pdo pdo_mysql

CMD ["php-fpm", "-y", "/usr/local/etc/php-fpm.conf", "-R"]


