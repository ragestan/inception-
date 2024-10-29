#!/bin/bash

sleep 10
wp config create	--allow-root --dbhost=$DBHOST --dbname=$DBNAME --dbuser=$DBUSER --dbpass=$DBPASS --dbhost=mariadb:3306 --path='/var/www/wordpress'
/usr/sbin/php-fpm7.3 -F