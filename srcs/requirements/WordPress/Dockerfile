FROM debian:buster
RUN apt update -y
RUN apt upgrade -y
RUN apt-get -y install wget sendmail
RUN apt-get -y install  php7.3
RUN apt-get -y install	php7.3-fpm
RUN apt-get -y install	php7.3-mysql
RUN apt-get -y install	mariadb-client
COPY ./conf/auto_config.sh /bin/auto_config.sh
RUN chmod +x /bin/auto_config.sh
WORKDIR /var/www/html
RUN		chown -R root:root /var/www/html
RUN		mkdir /run/php/
RUN		chmod +x /run/php/
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp
RUN wp core download --allow-root
CMD ["sh","/bin/auto_config.sh"]