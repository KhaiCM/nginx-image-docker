FROM nginx:latest

MAINTAINER Chu Minh Khai <minhkhai97dbp.com>


COPY nginx.conf /etc/nginx/nginx.conf
COPY default.conf /etc/nginx/conf.d/default.conf
COPY upstream.conf /etc/nginx/conf.d/upstream.conf
#add user
RUN usermod -u 1000 www-data

RUN mkdir -p /var/www/laravel/public/ \
    && touch /var/www/laravel/public/index.php


# workdir
WORKDIR /etc/nginx/

# cleanup
RUN /tmp/scripts/cleanup.sh

CMD ["nginx"]

EXPOSE 80 443