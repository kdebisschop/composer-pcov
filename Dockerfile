###############################################################################
#
# Install development tools and build the PCOV extension.
#
###############################################################################
FROM composer:2.5 as build

RUN apk --update upgrade\
 && apk add autoconf automake make gcc g++ libtool pkgconfig re2c

RUN pecl install pcov

###############################################################################
#
# Copy PCOV extension from previous stage.
#
###############################################################################
FROM composer:2.5

COPY --from=build /usr/local/lib/php/extensions/no-debug-non-zts-20220829/pcov.so /usr/local/lib/php/extensions/no-debug-non-zts-20220829/
RUN docker-php-ext-enable pcov\
 && echo "pcov.exclude='~vendor~'" >> /usr/local/etc/php/conf.d/docker-php-ext-pcov.ini
