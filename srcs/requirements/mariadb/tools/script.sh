#!/bin/bash

service mariadb start
mariadb -e "CREATE DATABASE IF NOT EXISTS ${SQL_DATABASE};"
mariadb -e "CREATE USER IF NOT EXISTS '${SQL_DATABASE}'@'%' IDENTIFIED BY '${SQL_PASSWORD}';"
mariadb -e "GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO '${SQL_USER}'@'%' WITH GRANT OPTION;"
mariadb -e "FLUSH PRIVILEGES;"
sleep 1
service mariadb stop
exec "$@"