FROM nginx:nginx-laravel

MAINTAINER Chu Minh Khai <minhkhai97dbp.com>


COPY nginx.conf /etc/nginx/nginx.conf
COPY sites-availble/default.conf /etc/nginx/sites-available/default.conf \
COPY upstream.conf /etc/nginx/conf.d/upstream.conf
RUN mkdir -p /var/www/laravel/public/ \
    && touch /var/www/laravel/public/index.php

# add users
RUN usermod -u 1000 www-data


# workdir
WORKDIR /etc/nginx/

# cleanup
RUN /tmp/scripts/cleanup.sh

CMD ["nginx"]

EXPOSE 80 443