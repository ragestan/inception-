FROM debian:buster

# Update the image and install required packages
RUN apt update -y && apt upgrade -y
RUN apt-get install mariadb-server -y

# Copy configuration file
COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

# Start MariaDB and run database setup
CMD service mysql start && \
    mysql -e "CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;" && \
    mysql -e "CREATE USER IF NOT EXISTS \`${SQL_USER}\`@'localhost' IDENTIFIED BY '${SQL_PASSWORD}';" && \
    mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';" && \
    mysql -e "FLUSH PRIVILEGES;" && \
    mysqladmin -u root -p$SQL_ROOT_PASSWORD shutdown && \
    mysqld_safe