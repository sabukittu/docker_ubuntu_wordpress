#!/bin/bash


#### DATABASE COMPILING AND INSTALLATION #####


cd /tmp/mariadb/

bash -c "BUILD/autorun.sh"
bash -c "./configure"
sleep 5s

make 
sleep 5s
make install

cd /usr/local/mysql

bash -c "scripts/mysql_install_db --datadir=/var/lib/mysql"
