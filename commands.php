sudo -u postgres psql -c 'grant all privileges on database jetcrew360 to jetcrew360;'

Databse connect command
==================================================
sudo su
su - postgres
psql -p 5433

\c jetcrew360




Test account 
=============================================

the airlines are lufthansa@icarative.com

password 123456

justin@icarative.com

password 123456

then users are:

test@test.com

password 123456

test3@test.com

password 123456
==========================================
stop service

sudo service gluu-server-3.1.1 stop
==========================================

database access

$ cd /home/ourdesignz/Desktop/
$ ./pgweb_linux_amd64

open browser 
http://localhost:8081/
host : localhost
port : 5433
user : postgres
DB : jetcrew360

==========================================
$ rvm list
$ /bin/bash --login (if need)
$ rvm use ruby-1.9.3-p551