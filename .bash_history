sudo apt update
sudo apt install build-essential gdb nano
mkdir buffer_lab
cd buffer_lab
nano vidu1.c
ls
gcc vidu1.c -o vidu1
./vidu1
nano vidu2.c
ls
gcc vidu2 -o vidu2
gcc vidu2.c -o vidu2
./vidu2
nano vidu3.c
ls
gcc vidu3.c -o vidu3
gcc -fno-pie -no-pie -ggdb vidu3.c -o vidu3
./vidu3
./vidu3.c
main
disas main
gdb ./vidu3
nano vidu4.c
ls
gcc -fno-pie -no-pie -mpreferred-stack-boundary=4 -fno-stack-protector -ggdb vidu4.c -o vidu4
./vidu4
gdb ./vidu4
gcc -m32 -fno-stack-protector -z execstack -no-pie vidu4.c -o vidu4
sudo sysctl -w kernel.randomize_va_space=0
cat /proc/sys/kernel/randomize_va_space
gdb vidu4
./vidu4
gcc -fno-pie -no-pie -mpreferred-stack-boundary=4 -fno-stack-protector -ggdb vidu4.c -o vidu4
./vidu4
gdb ./vidu4
rm vidu4.c
ls
rm vidu4
ls
nano vidu4.c
gcc -fno-pie -no-pie -mpreferred-stack-boundary=4 -fno-stack-protector -ggdb vidu4.c -o vidu4
./vidu4
gdb ./vidu4
ls
mr buffer_lab
sudo apt
rm -rf buffer_lab
ls
/E
/home
tree
mkdir buffer_lab
rm -rf buffer_lab
mkdir buffer_lab
cd buffer_lab
nano vidu1.c
gcc vidu1.c -o vidu1
./vidu1
nano vidu2.c
gcc vidu2.c -o vidu2
./ vidu2
./vidu2
gcc vidu2.c -o vidu2
./vidu2
nano vidu3.c
gcc -fno-pie -no-pie -ggdb vidu3.c -o vidu3
./vidu3
gdb ./vidu3
nano vidu4.c
gcc -fno-pie -no-pie -mpreferred-stack-boundary=4 -fno-sta
ck-protector -ggdb vidu4.c -o vidu4
./vidu4
gcc -fno-pie -no-pie -mpreferred-stack-boundary=4 -fno-stack-protector -ggdb vidu4.c -o vidu4
./vidu4
gdb ./vidu4
history
nano private.pem
openssl rsa -in private.pem -noout -modulus
nano private.pem
rm private.pem
ls
nano private.pem
openssl rsa -in private.pem -noout -modulus
ls
rm private.pem
ls
sudo groupadd sales
ls
getent group sales
sudo useradd -m -d /home/mimi -s /bin/bash -G sales mimi
sudo useradd -m -d /home/mrgray -s /bin/bash -G sales mrgray
sudo useradd -m -d /home/mommy -s /bin/bash -G sales mommy
sudo passwd mimi
sudo passwd mrgray
sudo passwd mommy
sudo mkdir /sales
sudo chown nobody:sales /sales
sudo chmod 3770 /sales
su - mimi
sudo apt update
sudo apt install acl
which setfacl
su - mimi
exit
ls
getent group sales
ls -ld /sales
sudo userdel -r mimi
id mimi
sudo userdel -r mrgray
sudo userdel -r mommy
sudo rm -rf /sales
sudo groupdel sales
getent group sales
sudo groupadd sales
getent group sales
sudo useradd -G sales mimi
sudo useradd -G sales mrgray
sudo useradd -G sales mommy
sudo userdel -r mimi
sudo userdel -r mrgray
sudo userdel -r mommy
sudo rm -rf /sales
sudo groupdel sales
getent group sales
sudo groupadd sales
sudo useradd -m -d /home/mimi -s /bin/bash -G sales mimi
sudo useradd -m -d /home/mrgray -s/bin/bash -G sales mrgray
sudo useradd -m -d /home/mommy -s/bin/bash -G sales mommy
sudo passwd mimi
sudo passwd mrgray
sudo passwd mommy
sudo mkdir/sales
sudo mkdir /sales
sudo chown nobody:sales /sales
sudo chmod 3770 /sales
ls -ld /sales
su - mimi
su - mrgray
su - mmommy
su - mommy
su - mrgray
su - mommy
setent group sales
getent group sales
sudo apt update
sudo apt install apache2 policycoreutils selinux-utils setools
sudo systemctl enable --now apache2
cd /var/www/html
sudo nano index.html
cat /var/www/html/index.html
ls -Z index.html
getent group sales
sudo userdel -r mimi
sudo userdel -r mrgray
sudo userdel -r mommy
getent group sales
sudo rm -rf /sales/
sudo groupdel sales
getent group sales
sudo groupadd sales
sudo useradd -m -d /home/mimi -s /bin/bash -G sales mimi
sudo useradd -m -d /home/mrgray -s/bin/bash -G sales mrgray
sudo useradd -m -d /home/mommy -s/bin/bash -G sales mommy
sudo passwd mimi
sudo passwd mrgray
sudo passwd mommy
sudo mkdir /sales
sudo chown nobody:sales/sales
sudo chown nobody:sales /sales
sudo chmod 3770 /sales
ls -ld /sales
su - mimi
su - mrgray
su - mommy 
sudo userdel -r mimi
sudo userdel -r mrgray
sudo userdel -r mommy
sudo rm -rf /sales/
sudo groupdel sales
getent group sale
getent group sales
sudo groupadd sales
sudo useradd -m -d /home/mimi -s /bin/bash -G sales mimi
sudo useradd -m -d /home/mrgray -s/bin/bash -G sales mrgray
sudo useradd -m -d /home/mommy -s/bin/bash -G sales mommy
sudo passwd mimi
sudo passwd mrgray
sudo passwd mommy
sudo mkdir /sales
sudo chown nobody:sales/sales
sudo chown nobody:sales /sales
sudo chmod 3770 /sales
ls -ld /sales
su - mimi
su - mrgray
su - mommy 
su -
yum install -y httpd setroubleshoot setools policycoreutils policycoreutils-python\
yum install -y httpd setroubleshoot setools policycoreutils policycoreutils-python
sudo yum install -y httpd setroubleshoot setools policycoreutils policycoreutils-python
sudo apt update
sudo apt install git build-essential -y
git clone https://github.com/zhijieshi/md5collgen.git
cd md5collgen
make
echo "Hello MD5 Lab" > prefix.txt
cat prefix.txt
./md5collgen -p prefix.txt -o out1.bin out2.bin
md5sum out1.bin
md5sum out2.bin
cmp -l out1.bin out2.bin
echo "Day la du lieu them vao" > suffix.txt
cat out1.bin suffix.txt > file1_new.bin
cat out2.bin suffix.txt > file2_new.bin
md5sum file1_new.bin
md5sum file2_new.bin
cmp -l file1_new.bin file2_new.bin
pwd
cd ~
rm -rf md5collgen
ls
sudo apt update
sudo apt install libssl-dev build-essential -y
nano rsa_task4.c
gcc rsa_task4.c -lcrypto -o rsa_task4
./rsa_task4
python3 -c 'print("I owe you $3000.".encode().hex())'
nano rsa_task4.c
gcc rsa_task4.c -lcrypto -o rsa_task4
./rsa_task4
ls
pwd
rm rsa_task4.c rsa_task4
ls
mkdir ~/pki-lab
cd ~/pki-lab
cp /usr/lib/ssl/openssl.cnf .
mkdir -p demoCA/certs demoCA/crl demoCA/newcerts
touch demoCA/index.txt
echo 1000 > demoCA/serial
openssl req -new -x509 -keyout ca.key -out ca.crt -config openssl.cnf
ls
openssl genrsa -aes128 -out server.key 1024
openssl req -new -key server.key -out server.csr -config openssl.cnf
openssl ca -in server.csr -out server.crt -cert ca.crt -keyfile ca.key -config openssl.cnf
ls
sudo apt update
sudo apt install apache2 openssl -y
sudo mkdir -p /var/www/ptit.com
echo "<h1>Welcome to ptit.com</h1>" | sudo tee /var/www/ptit.com/index.html
sudo nano /etc/hosts
sudo nano /etc/apache2/sites-available/default-ssl.conf
whoami
sudo nano /etc/apache2/sites-available/default-ssl.conf
sudo apachectl configtest
sudo a2enmod ssl
sudo a2ensite default-ssl
sudo service apache2 restart
cat /etc/hosts
firefox
sudo apt install firefox -y
firefox
sudo service apache2 status
sudo service apache2 start
ls
rm -r pki-lab
ls
rm - r snap
rm -r snap
ls
cd ~
sudo service apache2 stop
sudo rm -rf /var/www/ptit.com
rm -rf ~/pki-lab
sudo a2dissite default-ssl
sudo a2dismod ssl
sudo service apache2 restart
mkdir ~/pki-lab
cd ~/pki-lab
cp /usr/lib/ssl/openssl.cnf .
mkdir -p demoCA/newcerts
touch demoCA/index.txt
echo 1000 > demoCA/serial
openssl req -new -x509 -nodes -keyout ca.key -out ca.crt -config openssl.cnf
openssl genrsa -out server.key 1024
openssl req -new -key server.key -out server.csr -config openssl.cnf
openssl ca -batch -in server.csr -out server.crt -cert ca.crt -keyfile ca.key -config openssl.cnf
ls
sudo mkdir -p /var/www/ptit.com
echo "<h1>Welcome to ptit.com</h1>" | sudo tee /var/www/ptit.com/index.html
sudo nano /etc/hosts
ping ptit.com
sudo a2enmod ssl
sudo a2ensite default-ssl
sudo nano /etc/apache2/sites-available/default-ssl.conf
sudo apachectl configtest
sudo systemctl daemon-reload
sudo service apache2 restart
curl -k https://localhost
firefox
ls
rm -rf pki-lab
ls
rm -rf snap
rm -rf index.html
ls
sudo apt-get install --reinstall apache2
sudo nano /etc/apache2/sites-available/default-ssl.conf
sudo apt-get install --reinstall apache2
sudo nano /etc/apache2/sites-available/default-ssl.conf
ls
mkdir -p ~/pki-lab
cd ~/pki-lab
cp /usr/lib/ssl/openssl.cnf .
mkdir -p demoCA/certs demoCA/crl demoCA/newcerts
touch demoCA/index.txt
echo 1000 > demoCA/serial
openssl req -new -x509 -keyout ca.key -out ca.crt -config openssl.cnf
ls
openssl genrsa -aes128 -out server.key 1024
openssl req -new -key server.key -out server.csr -config openssl.cnf
openssl ca -in server.csr -out server.crt -cert ca.crt -keyfile ca.key -config openssl.cnf
ls
sudo mkdir -p /var/www/ptit.com
echo "<h1>Welcome to ptit.com</h1>" | sudo tee /var/www/ptit.com/index.html
sudo nano /etc/apache2/sites-available/default-ssl.conf
ls -l /home/acer/pki-lab/server.crt
ls -l /home/acer/pki-lab/
ls /home/acer/pki-lab/
sudo apachectl configtest
sudo a2enmod ssl
sudo a2ensite default-ssl
sudo service apache2 restart
sudo systemctl status apache2.service
journalctl -xeu apache2.service
sudo apachectl configtest
ls ~/pki-lab
openssl rsa -in ~/pki-lab/server.key -out ~/pki-lab/server.key
sudo service apache2 restart
sudo tail -n 20 /var/log/apache2/error.log
chmod 644 ~/pki-lab/server.crt
chmod 600 ~/pki-lab/server.key
openssl genrsa -out server.key 2048
openssl req -new -key server.key -out server.csr -config openssl.cnf
openssl ca -in server.csr -out server.crt -cert ca.crt -keyfile ca.key -config openssl.cnf
sudo service apache2 restart
rm -rf demoCA
mkdir -p demoCA/certs demoCA/crl demoCA/newcerts
touch demoCA/index.txt
echo 1000 > demoCA/serial
openssl ca -in server.csr -out server.crt -cert ca.crt -keyfile ca.key -config openssl.cnf
sudo service apache2 restart
firefox
openssl x509 -in ~/pki-lab/server.crt -issuer -subject
rm server.crt
openssl ca -in server.csr -out server.crt -cert ca.crt -keyfile ca.key -config openssl.cnf
openssl x509 -in server.crt -issuer -subject
rm -rf demoCA
mkdir -p demoCA/certs demoCA/crl demoCA/newcerts
touch demoCA/index.txt
echo 1000 > demoCA/serial
openssl ca -in server.csr -out server.crt -cert ca.crt -keyfile ca.key -config openssl.cnf
openssl x509 -in server.crt -issuer -subject
sudo service apache2 restart
firefox
ls
rm -rf pki-lab
rm -rf snap
ls
sudo apt update
sudo apt install git build-essential -y
git clone https://github.com/zhijieshi/md5collgen.git
cd md5collgen
make
echo "Hello MD5 Lab" > prefix.txt
cat prefix.txt
./md5collgen -p prefix.txt -o out1.bin out2.bin
md5sum out1.bin
md5sum out2.bin
cmp -l out1.bin out2.bin
echo "Day la du lieu them vao" > suffix.txt
cat out1.bin suffix.txt > file1_new.bin
cat out2.bin suffix.txt > file2_new.bin
md5sum file1_new.bin
md5sum file2_new.bin
cmp -l file1_new.bin file2_new.bin
sudo apt update
sudo apt install libssl-dev build-essential -y
nano rsa_task4.c
gcc rsa_task4.c -lcrypto -o rsa_task4
./rsa_task4
python3 -c 'print("I owe you $3000.".encode().hex())'
nano rsa_task4.c
gcc rsa_task4.c -lcrypto -o rsa_task4
./rsa_task4
~/
cd ~
ls
cd md5collgen/
ls
CD ~
cd ~
mkdir -p ~/pki-lab
cd ~/pki-lab
cp /usr/lib/ssl/openssl.cnf .
mkdir -p demoCA/certs demoCA/crl demoCA/newcerts
touch demoCA/index.txt
echo 1000 > demoCA/serial
openssl req -new -x509 -keyout ca.key -out ca.crt -config openssl.cnf
openssl genrsa -out server.key 2048
openssl req -new -key server.key -out server.csr -config openssl.cnf
openssl ca -in server.csr -out server.crt -cert ca.crt -keyfile ca.key -config openssl.cnf
openssl x509 -in server.crt -issuer -subject
sudo mkdir -p /var/www/ptit.com
echo "<h1>Welcome to ptit.com</h1>" | sudo tee /var/www/ptit.com/index.html
sudo nano /etc/apache2/sites-available/default-ssl.conf
sudo a2enmod ssl
sudo a2ensite default-ssl
sudo apachectl configtest
sudo service apache2 restart
sudo nano /etc/hosts
firefox
ls
cd ~
ls
rm -rf md5collgen/
rm -rf pki-lab/
rm -rf snap/
ls
sudo apt update
sudo apt install build-essential -y
git clone https://github.com/zhijieshi/md5collgen.git
cd md5collgen/
make
echo "Hello MD5 Lab" > prefix.txt
cat prefix.txt 
./md5collgen -p prefix.txt -o out1.bin out2.bin
md5sum out1.bin
md5sum out2.bin
cmp -l out1.bin out2.bin
echo "Day la du lieu da them vao" > suffix.txt
cat out1.bin suffix.txt > file1_new.bin
cat out2.bin suffix.txt > file2_new.bin
md5sum file1_new.bin
md5sum file2_new.bin
cmp -l file1_new.bin file2_new.bin 
cd ~
sudo apt update
sudo apt install libssl-dev build-essential -y
nano rsa_task4.c
gcc rsa_task4.c -lcrypto -o rsa_task4
./rsa_task4
python3 -c 'print("I owe you $3000.".encode().hex())'
nano rsa_task4.c
gcc rsa_task4.c -lcrypto -o rsa_task4
./rsa_task4
ls
mkdir -p ~/pki-lab
cd ~/pki-lab/
cp /usr/lib/ssl/openssl.cnf .
mkdir -p demoCA/cert demoCA/crl demoCA/newcerts
touch demoCA/index.txt
echo 1000 > demoCA/serial
openssl req -new -x509 -keyout ca.key -out ca.crt -config openssl.cnf
openssl genrsa -out server.key 2048
openssl req -new -key server.key -out server.csr -config openssl.cnf
openssl ca -in server.csr -out server.crt -cert ca.crt -keyfile ca.key -config openssl.cnf
openssl x509 -in server.crt -issuer -subject
ls
sudo mkdir -p /var/www/ptit.com
echo "<h1>Welcome to ptit.com</h1>" | sudo tee /var/www/ptit.com/index.html
sudo nano /etc/apache2/sites-available/default-ssl.conf
sudo a2enmod ssl
sudo a2ensite default-ssl
sudo apachectl configtest
sudo service apache2 restart
sudo nano /etc/hosts
firefox
cd ~
la
ls
