#!/bin/sh
# Mysql db scripts automation

#unzip db_scripts.zip
#cd db_scripts
servername=$1
password=$2

for i in `ls -l *.sql | awk {'print $9'} | sort -k9 -n`
do
echo $i
db_name=`echo $i | cut -d'-' -f2`
echo "executing mysql db for db $db_name and executing sql file $i"
echo "mysql -h $servername -u root $password $db_name < $i.sql"
#sqlplus
done
