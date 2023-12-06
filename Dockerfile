FROM php-apache

ENV WP_USER wordpress
ENV WP_DB wordpress
ENV APP_ROOT /var/www/html

ADD http://wordpress.org/latest.tar.gz wordpress.tar

RUN \
  tar xzf wordpress.tar.gz -C ${APP_ROOT}  && \
  rm wordpress.tar.gz

COPY start.sh start.sh

VOLUME ["$APP_ROOT"]

RUN rm /usr/sbin/policy-rc.d
CMD ["/start.sh"]

EXPOSE 80