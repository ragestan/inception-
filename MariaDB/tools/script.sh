#!/bin/bash

# Start MySQL service
service mysql start

# Create the database if it doesn't already exist
mysql -u root -e "CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;"

# Create the user if it doesn't already exist
mysql -u root -e "CREATE USER IF NOT EXISTS '${SQL_USER}'@'%' IDENTIFIED BY '${SQL_PASSWORD}';"

# Grant all privileges on the database to the user
mysql -u root -e "GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO '${SQL_USER}'@'%';"

# Flush privileges to apply changes
mysql -u root -e "FLUSH PRIVILEGES;"

# Shutdown MySQL safely
mysqladmin -u root -p"${SQL_ROOT_PASSWORD}" shutdown

# Start the MySQL server safely
exec mysqld_safe