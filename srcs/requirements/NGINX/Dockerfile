FROM debian:buster
RUN apt update
RUN apt install nginx -y
RUN apt install vim -y
RUN mkdir -p /etc/nginx/ssl
RUN apt install openssl -y
RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=MA/ST=Marrakech-Safi/L=benguerir/O=1337/OU=1337/CN=zbentalh.1337.ma/UID=zbentalh"
COPY   conf/nginx.conf /etc/nginx/sites-enabled/default

RUN chmod 777 /var/www/html

RUN chown -R root:root /var/www/html

CMD [ "nginx","-g","daemon off;"]