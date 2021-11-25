FROM opensuse/leap:15.3

RUN zypper --non-interactive install php-composer php7 php7-fpm php7-curl php7-pgsql php7-gd php7-json php7-openssl php7-zip \
    php7-iconv php7-imagick php7-mbstring php7-intl php7-dom php7-redis php7-tokenizer php7-fileinfo php7-ctype php7-gettext \
    php7-mysql npm14 unzip

RUN mkdir /app
WORKDIR /app

COPY files/php-fpm.conf /etc/php7/fpm/php-fpm.conf
COPY files/www.conf /etc/php7/fpm/php-fpm.d/www.conf

COPY . /app/
RUN chown -R wwwrun:www /app

STOPSIGNAL SIGQUIT

EXPOSE 9000

CMD ["php-fpm"]
