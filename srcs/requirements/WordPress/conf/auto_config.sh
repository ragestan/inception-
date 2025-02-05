#!/bin/bash

echo "listen = wordpress:9000" >> /etc/php/7.3/fpm/pool.d/www.conf
sleep 10
wp config create --allow-root --dbname=$DBNAME --dbuser=$DBUSER --dbpass=$DBPASS --dbhost=mariadb:3306 --path='/var/www/html'
wp core install --url=$URL --title=$TITLE --admin_user=$ADMIN --admin_password=$ADMINPASS --admin_email=$ADMINEMAIL --allow-root
wp user create $USER $USEREMAIL --role=subscriber --user_pass=$USERPASS --allow-root
wp theme install twentytwentytwo --activate --allow-root
exec php-fpm7.3 -F