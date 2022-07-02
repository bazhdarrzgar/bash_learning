* [Table of Contents](#table-of-contents)
	- [[[Optional]] Getting going on digital ocean](#first)
	- [How to execute scripts on a remote server](#second)
	- [How to send and receive files from a remote server](#third)
	- [Remote Server Monitory - Project Solution](#four)
	
<a name="first"></a>

## [[Optional]] Getting going on digital ocean

* creating ssh key

```bash


ls ~/.ssh

===
# nothing is here
===


ssh-keygen

===
Generating public/private rsa key pair.
# press enter if your file is in ( /home/soyansoon/.ssh/id_rsa ) means id_rsa for my self is true
Enter file in which to save the key (/home/soyansoon/.ssh/id_rsa): 
# type the name of the ssh_key for my self is alex it is hidden when you type
Enter passphrase (empty for no passphrase): 
# retype the name
Enter same passphrase again: 
Your identification has been saved in /home/soyansoon/.ssh/id_rsa
Your public key has been saved in /home/soyansoon/.ssh/id_rsa.pub
The key fingerprint is:
SHA256:T+/Psw4oE+FVaOolS31yxBXGaRfsI3ue9yQftgUTMrk soyansoon@soyansoon-Blade
The keys randomart image is:
+---[RSA 3072]----+
|           o.o=+.|
|          o.oo+..|
|        .+..+.o. |
|       .+o+ o= + |
|       oS+.+E = .|
|        o+ o . + |
|        o o o +o+|
|         o . oo*=|
|            .o=+=|
+----[SHA256]-----+
===

# copy the public key for ssh something like this ( id_rsa.pub ) and copy the key in this file and past it in the ssh key content in the server and type the password for ssh remember that password be carefull

```


---------------------- 

<a name="second"></a>

## How to execute scripts on a remote server

```bash

# syntax
ssh [name the server]@[ip the server]

# Example
ssh root@138.68.137.214

===
# it take you some question answear it right for take you into your server
.
.
ECDSA key fingerprint is SH...:Y
.
.
Etern passphrase for key'/home/soyansoon/.ssh/id_rsa':# type this password that you are created for ssh key
===


# check the os detail
cat /etc/os-release

===
NAME="Ubuntu"
VERSION="20.04.4 LTS (Focal Fossa)"
ID=ubuntu
ID_LIKE=debian
PRETTY_NAME="Ubuntu 20.04.4 LTS"
VERSION_ID="20.04"
HOME_URL="https://www.ubuntu.com/"
SUPPORT_URL="https://help.ubuntu.com/"
BUG_REPORT_URL="https://bugs.launchpad.net/ubuntu/"
PRIVACY_POLICY_URL="https://www.ubuntu.com/legal/terms-and-policies/privacy-policy"
VERSION_CODENAME=focal
UBUNTU_CODENAME=focal
===

# test it if the server can execure the script for example

nano remote.sh 

---

#!/bin/bash

echo "I am very far away" >> remote.txt

---

chmod 744 script.sh 

./script.sh 

===
# it should be created the folder
===

ls 

===
script.sh remote.txt
===

cat remote.txt

===
I am very far away
===


# some service is not work here for example cron just start it and test it if you logout the cron still work

service crontab start

crontab -e

===
# type option 1
# after that add this line in the buttom
* * * * * $HOME/script.sh
===

# after that logout by typing
exit

# wait a few minute after that log into the server
ssh root@138.68.137.214

cat remote.txt

===
# it should be you have serveral output to know if you are stell logout you server is working
I am very far away
I am very far away
I am very far away
I am very far away
===

```


----------------------- 

<a name="third"></a>

## How to send and receive files from a remote server

```bash

# send file to remote server

nano ip_script.sh

----
#!/bin/bash

# get ip
curl ifconfig.co > ~/ip.txt
----

./ip_script.sh

===
# ip my machine
185.166.27.100
===



# syntax
scp source target

# Example
# Sending this file in this directory to server and home directory
scp ~/ip_script.sh root@138.68.137.214:~/



# if you login to the server you now see that is actually in the server 
ssh root@138.68.137.214

ls ~/

===
ip_script remote.sh remote.sh.save remote.txt snap
===




./ip_script

cat ip.txt

===
# ip remote server
138.68.137.214
===



# if logout and try to copy this file to your local server but not using ssh do this in the local machien

exit 

# this will copy this file in the home directory remote server to the local machine home directory
scp root@138.68.137.214:~/ip.txt ~/

ls ~/

===
... ... ip.txt ... ... ...
===

cat ip.txt

===
# ip local server 
138.68.137.214
===


```


----------------------- 

<a name="four"></a>

# Remote Server Monitory - Project Solution

```bash

ssh root@138.68.137.214

nano performance_checker.sh 



----
#!/bin/bash

date >> ~/performance.log

ping -c 1 google.com &> /dev/null

if [ "$?" -eq 0 ]; then
	echo "Internet: Connected" >> performance.log
else 
	echo "Internet: Disconnected" >> performance.log
fi

echo "RAM Usages : " >> performance.log
free -h | grep "Mem" >> performance.log

echo "Swap Usages : " >> performance.log
free -h | grep "Swap" >> performance.log

echo "Disk Usages : " >> performance.log
df -h >> performance.log

echo ""

----


chmod 744 performance_script

./performance_script

===
Internet: Connected
RAM Usages : 
Mem:           15Gi       2.7Gi       5.0Gi       562Mi       7.9Gi        11Gi
Swap Usages : 
Swap:         2.0Gi          0B       2.0Gi
Disk Usages : 
Filesystem      Size  Used Avail Use% Mounted on
udev            7.8G     0  7.8G   0% /dev
tmpfs           1.6G  2.4M  1.6G   1% /run
/dev/nvme0n1p2  234G  112G  111G  51% /
tmpfs           7.8G   33M  7.8G   1% /dev/shm
tmpfs           5.0M  4.0K  5.0M   1% /run/lock
tmpfs           7.8G     0  7.8G   0% /sys/fs/cgroup
/dev/loop0      199M  199M     0 100% /snap/arduino/61
/dev/loop1      196M  196M     0 100% /snap/arduino/70
.
.
.
/dev/loop40     566M  566M     0 100% /snap/pycharm-community/281
tmpfs           1.6G   60K  1.6G   1% /run/user/1000
/dev/sda5       488G  471G   17G  97% /media/soyansoon/524E74424E7420C1
===


# if you want run this script in the server every hour do this

crontab -e

===
# add this line in the end
0 * * * * ~/performance_script
===


# if you want output this file in local machien every hour but 15 minute after this hour then do this

exit 

crontab -e

===
# this will copy the file every 15 minute in every hour
15 * * * * scp root@138.68.137.214:~/performance.log ~/Desktop
=== 


```

