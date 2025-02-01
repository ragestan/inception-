#!/bin/bash

sleep 10
wp config create	--allow-root --dbname=$DBNAME --dbuser=$DBUSER --dbpass=$DBPASS --dbhost=mariadb:3306 --path='/var/www/wordpress'
sed -i -e 's/.*listen = .*/listen = 9000/' /etc/php/7.3/fpm/pool.d/www.conf


/usr/sbin/php-fpm7.3 -F