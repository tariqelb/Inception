#!/bin/sh

#ROOT_PASSWORD="wpRoot1234"
#USER_PASSWORD="wpUser1234"
#DATABASE="wpDatabase"
#USER="wpUser"
HOST="%"


commands1="ALTER USER 'root'@'localhost' IDENTIFIED BY '${ROOT_PASSWORD}'; FLUSH PRIVILEGES;"

commands2="CREATE DATABASE IF NOT EXISTS ${DATABASE} DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ; CREATE USER IF NOT EXISTS '${USER}'@'${HOST}' IDENTIFIED BY '${USER_PASSWORD}'; FLUSH PRIVILEGES ;"

commands3="GRANT ALL PRIVILEGES ON *.* TO '${USER}'@'${HOST}' IDENTIFIED BY '${USER_PASSWORD}' ; FLUSH PRIVILEGES ;"



echo "----------------lanch mariadb--------------------"
openrc default
/etc/init.d/mariadb setup
rc-service mariadb start

RESULT=`/usr/bin/mariadb -u root --password=${ROOT_PASSWORD} --skip-column-names -e "SHOW DATABASES LIKE '${DATABASE}'"`

if [ $RESULT == $DATABASE ]; then
	echo database exist
else
	echo "-----------------set root password----------------------"
	echo "${commands1}" | /usr/bin/mariadb -u root --password=${ROOT_PASSWORD}
	echo "---------------------------------------"



	echo "---------------remove anynomous user------------------------"
	echo  "DROP USER ' '@'buildkitsandbox'" | /usr/bin/mariadb -u root  --password=${ROOT_PASSWORD}
	echo "FLUSH PRIVILEGES" | /usr/bin/mariadb -u root  --password=${ROOT_PASSWORD}
	echo "---- done ---------------------------------"

	echo "${commands2}" | /usr/bin/mariadb -u root --password=${ROOT_PASSWORD}
	echo "${commands3}" | /usr/bin/mariadb -u root  --password=${ROOT_PASSWORD}

	echo "---------------------------------------"

	/usr/bin/mariadb -u root --password="${ROOT_PASSWORD}" ${DATABASE} < /wplogindb.sql

fi
rc-service mariadb stop
mariadbd -u root
