#!/bin/bash
service mysql start
sleep 5
mysql -u root -e "CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;"
mysql -u root -e "CREATE USER IF NOT EXISTS '${SQL_USER}'@'%' IDENTIFIED BY '${SQL_PASSWORD}';"
mysql -u root -e "GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO '${SQL_USER}'@'%';"
mysql -u root -e "FLUSH PRIVILEGES;"
mysqladmin -u root -p"${SQL_ROOT_PASSWORD}" shutdown
exec mysqld_safe