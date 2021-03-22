#!/bin/bash
# Запуск сервисов
service nginx start
service mysql start

# Инициализация database
db_name='wp_base'
username='admin'
password='admin'
hostname='localhost'

# wordpress database
mysql -e "CREATE DATABASE $db_name;"
mysql -e "CREATE USER '$username'@'localhost' IDENTIFIED BY '$password';"
mysql -e "GRANT ALL PRIVILEGES ON $db_name.* TO '$username'@'$hostname' WITH GRANT OPTION;"
mysql -e "FLUSH PRIVILEGES;"

service php7.3-fpm start

bash
