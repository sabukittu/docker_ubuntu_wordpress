



##########     Docker Build File For Creating A UBUNTU_LAMP_WORDPRESS Container     ##########

FROM ubuntu
MAINTAINER esskay





####  Configuring Time Zone for tzdata   ####
ENV TZ=Asia/Kolkata
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone





####  Installing Required Packages  ####
USER root

RUN apt-get -y update && apt-get -y upgrade
RUN apt-get -y install apt-utils \
	software-properties-common \
	devscripts \
	equivs \
	apache2 \
	libapache2-mod-php php \
	php-mysql \
	php-bcmath \
	php-mbstring \
	php-common \
	php-gettext \
	php-xml \
	php-xmlrpc \
	php-curl \
	php-gd

RUN apt-key adv --recv-key --keyserver hkp://keyserver.ubuntu.com:80 0xF1656F24C74CD1D8 \
	&& add-apt-repository --update --yes --enable-source 'deb [arch=amd64] http://nyc2.mirrors.digitalocean.com/mariadb/repo/10.3/ubuntu '$(lsb_release -sc)' main' \
	&& apt-get -y build-dep mariadb-10.3





#### COPYING ALL NECESSARY ITEMS  ####
ADD wordpress /var/www/html
ADD phpMyAdmin-4.8.4 /usr/local/phpMyAdmin
ADD mariadb-10.3.12 /tmp/mariadb 
ADD phpMyAdmin-4.8.4/phpmyadmin.conf /etc/apache2/conf-enabled/phpmyadmin.conf
ADD mariadb-10.3.12/my.cnf /etc/my.cnf
ADD scripts/mariadb.sh /tmp/db.sh
ADD scripts/wp_db.sh /tmp/wp_db.sh
ADD scripts/command.sh /bin/cmd
ADD scripts/perm.sh /tmp/perm.sh





#### EXECUTING SOURCE INSTALLATION SCRIPT ####
#RUN chmod +x /tmp/mariadb.sh \
RUN /tmp/db.sh \
	&& /tmp/perm.sh \
	&& /tmp/wp_db.sh \
	&& rm -rf /tmp/wp_db.sh \
		/tmp/mariadb \
		/tmp/db.sh




#### Final Command To Run ####
EXPOSE 80 3306
CMD ["/bin/cmd"]






##########################            END                 ############################
