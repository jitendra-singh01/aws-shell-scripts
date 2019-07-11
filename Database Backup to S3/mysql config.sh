# script 1
#setup my.cnf file for running script with user parametere (i.e- username , password) 

echo "[client]" >> /etc/my.cnf
echo "user=mysqluser" >> /etc/my.cnf
echo "password=mysqlpass" >> /etc/my.cnf