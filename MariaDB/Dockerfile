FROM debian:buster
RUN apt update -y
RUN apt upgrade -y
RUN apt-get install mariadb-server -y
COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
CMD service mysql start;
CMD mysql -e "CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;"
CMD mysql -e "CREATE USER IF NOT EXISTS \`${SQL_USER}\`@'localhost' IDENTIFIED BY '${SQL_PASSWORD}';"
CMD mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';"
CMD mysql -e "FLUSH PRIVILEGES;"
CMD mysqladmin -u root -p$SQL_ROOT_PASSWORD shutdown
CMD mysqld_safe
#CMD ["sleep", "infinity"]