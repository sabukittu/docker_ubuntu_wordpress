#!/bin/bash


mysql.server start
mysqladmin -u root password 'redhat'
mysql -u root -predhat -e "create database wordpress"
mysql -u root -predhat -e "create user admin@localhost identified by 'admin@123'"
mysql -u root -predhat -e "grant all on wordpress.* to admin@localhost"
mysql -u root -predhat -e "flush privileges"

