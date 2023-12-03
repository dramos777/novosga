FROM novosga/novosga:1.x

LABEL MANTAINER=emanuel.dramos2@gmail.com

ENV NOVOSGA_VERSION=1.5.1 \
    TZ="UTC" \
    DATABASE_HOST=192.168.0.91 \
    DATABASE_NAME="novosga" \
    DATABASE_USER="novosga" \
    DATABASE_PASSWORD="novosga" \
    DATABASE_SGDB="mysql" \
    DATABASE_PORT="3306" \
    NOVOSGA_ADMIN_USERNAME="admin" \
    NOVOSGA_ADMIN_FIRSTNAME="Administrator" \
    NOVOSGA_ADMIN_LASTNAME="Global" \
    NOVOSGA_ADMIN_PASSWORD="123456"

WORKDIR /var/www/html

RUN apt-get update \
    && apt-get install -y --force-yes --no-install-recommends \
	ldap-utils \
	libldb-dev \
	libldap2-dev \
	libldap-2.4-2 \
    && ln -s /usr/lib/x86_64-linux-gnu/libldap.so /usr/lib/libldap.so \
    && docker-php-ext-install ldap \
    && docker-php-ext-configure ldap \
    && chown -R www-data:www-data /var/www/html
