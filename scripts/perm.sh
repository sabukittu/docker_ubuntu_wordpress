#!/bin/bash




#### CONFIGURATION EDITING ####
sed -i '9 s/#ServerName www.example.com/ServerName 127.0.0.1/gi' /etc/apache2/sites-enabled/000-default.conf
sed -i '2 s/index.html/index.php/gi' /etc/apache2/mods-enabled/dir.conf 
sed -i '2 s/index.php/index.html/2gi' /etc/apache2/mods-enabled/dir.conf 
sed -i '672 s/8M/1000M/gi' /etc/php/7.2/apache2/php.ini 
sed -i '825 s/2M/1000M/gi' /etc/php/7.2/apache2/php.ini 
sed -i '840 s/Off/On/gi' /etc/php/7.2/apache2/php.ini 
sed -i '404 s/128M/512M/gi' /etc/php/7.2/apache2/php.ini 
mkdir /var/log/mariadb  /var/run/mariadb  
touch /var/log/mariadb/mariadb.log /var/run/mariadb/mariadb.pid




#### DATABASE PERMISSION ####
useradd -u 27 -s /sbin/nologin -M mysql
chown -R mysql.mysql /var/lib/mysql
chown -R mysql.mysql /var/run/mariadb
chown -R mysql.mysql /var/log/mariadb
chown -R mysql.mysql /usr/local/mysql




#### APACHE DIR PERMISSION ####
useradd -u 2000 ubuntu 
chown -R ubuntu.www-data /usr/local/phpMyAdmin 
chown ubuntu.www-data -R /var/www/html 
find /var/www/html -type d -exec chmod g+s {} \; 
chmod g+w /var/www/html/wp-content 
chmod -R g+w /var/www/html/wp-content/themes 
chmod -R g+w /var/www/html/wp-content/plugins 


#### EXTRA PERMISSIONS ####

ln -s /usr/local/mysql/bin/mysqladmin /usr/bin/mysqladmin
ln -s /usr/local/mysql/bin/mysql /usr/bin/mysql
ln -s /usr/local/mysql/support-files/mysql.server /usr/bin/mysql.server
ln -s /usr/local/mysql/bin/mysql_secure_installation /usr/bin/mysql_secure_installation


