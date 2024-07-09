FROM ubuntu:20.04

MAINTAINER DevLabs <devlabs@clever-touch.com>

ARG DEBIAN_FRONTEND=noninteractive

RUN set -xe
RUN apt-get update -yqq
RUN apt-get install git software-properties-common language-pack-en-base curl locales -yqq
RUN add-apt-repository ppa:ondrej/php
RUN apt-get update -yqq

RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8

RUN apt-get install php8.2-cli php8.2-fpm php8.2-cgi php8.2-common php8.2-curl libxml2-dev php8.2-soap php8.2-mbstring php8.2-ldap php8.2-tidy php8.2-xml php8.2-zip php8.2-gd php8.2-mysql php8.2-sqlite3 php8.2-bcmath php8.2-xdebug -yqq

RUN curl -sS https://getcomposer.org/installer | php
RUN mv composer.phar /usr/local/bin/composer