FROM ubuntu:19.04

RUN apt-get update && apt-get install -my \
  curl \
  wget

RUN apt-get update && apt-get install -my \
  php-curl \
  php-fpm \
  php-gd \
  php-xsl \
  php-mysqlnd \
  php-cli \
  php-intl \
  php-bz2 \
  php-zip \
  php-mbstring

RUN apt-get update && apt-get install -my \
  git \
  zip

RUN apt-get update && apt-get install -my \
  apt-utils \
  libterm-readline-gnu-perl

RUN apt-get update && apt-get install -my \
  nodejs \
  npm

RUN mkdir /run/php
RUN mkdir -p /var/www

ADD www.conf /etc/php/7.2/fpm/pool.d/www.conf
ADD php-fpm.conf /etc/php/7.2/fpm/php-fpm.conf

RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
RUN php composer-setup.php
RUN php -r "unlink('composer-setup.php');"
RUN mv composer.phar /usr/local/bin/composer
RUN chmod +x /usr/local/bin/composer
RUN ln -snf /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime

WORKDIR /var/www/
