* [Table of Contents](#table-of-contents)
	- [The "at" Command](#first)
	- [Using Cron Schedul and automate bash script](#second)
	- [cruntab guru](#third)
	- [Using cron command ( simple project )](#four)
	- [Anacron](#five)

<a name="first"></a>

## The "at" Command

```bash

# install at command
sudo apt install at


service atd status

===
# it should be green
● atd.service - Deferred execution scheduler
     Loaded: loaded (/lib/systemd/system/atd.service; enabled; vendor preset: enabled)
     Active: active (running) since Fri 2022-07-01 08:01:18 EDT; 10s ago
       Docs: man:atd(8)
   Main PID: 2549 (atd)
      Tasks: 1 (limit: 2245)
     Memory: 584.0K
        CPU: 3ms
     CGroup: /system.slice/atd.service
             └─2549 /usr/sbin/atd -f

Jul 01 08:01:18 kali systemd[1]: Starting Deferred execution scheduler...
Jul 01 08:01:18 kali systemd[1]: Started Deferred execution scheduler.
===

# if not start use:
sudo service atd start

# if you want stop it use:
sudo service atd stop

# if you want restart server use:
sudo service atd restart


```


```bash


# creating script in current time using at
at 8:07am

===
# after enter it you show you this dialog to type this script you want to run in this time
warning: commands will be executed using /bin/sh
at Sat Jul  2 08:07:00 2022
# enter this script you want to run in 8:07am
at> echo "hello world"
# if you want stop this process just type CTRL + D
at> <EOT>
# this is tell you that job id 2 is created
job 2 at Sat Jul  2 08:07:00 2022
===



at -l

===
2       Sat Jul  2 08:07:00 2022 a kali
===




at -r 2

at -l

===
# nothing in the list for now after deleted job id 2
===

```

```bash

nano script.sh

---

#!/bin/bash

mkdir at_dir
touch at_dir/file{1..100}.txt

---

date

===
Fri Jul  1 08:27:30 AM EDT 2022
===

# -f use to specific this file you want to run it
at 8:28am -f script.sh

===
warning: commands will be executed using /bin/sh
job 5 at Sat Jul  2 08:28:00 2022
===


# at 08:28:00 you will see this that at_dir is created and all file is created also
ls at_dir

===
file1.txt...file100.txt
====

```


```bash

# using time also this day you want run the script
at 9am Monday -f script.sh

===
warning: commands will be executed using /bin/sh
job 6 at Mon Jul  4 09:00:00 2022
===


# using time with current day and month and year you want to run the script
# month / day the month / year
at 9am 12/23/2022 -f script.sh

===
warning: commands will be executed using /bin/sh
job 7 at Fri Dec 23 09:00:00 2022
===

# if you want use dot (.) enstaid of slash (/) then you should used like this
# day the month . month . year
at 9am 23.12.2022 -f script.sh

===
warning: commands will be executed using /bin/sh
job 8 at Fri Dec 23 09:00:00 2022
===

ls -l

===
5       Sat Jul  2 08:24:00 2022 a kali
6       Mon Jul  4 09:00:00 2022 a kali
# you will see this script in id 7 and 8 run in same time 
7       Fri Dec 23 09:00:00 2022 a kali
8       Fri Dec 23 09:00:00 2022 a kali
===


# using simple word
at 9am tomorrow -f script.sh

===
warning: commands will be executed using /bin/sh
job 9 at Sat Jul  2 09:00:00 2022
===

# using simple word
at 9am next day -f script.sh

===
warning: commands will be executed using /bin/sh
job 11 at Sat Jul  2 09:00:00 2022
===

# using simple word
at 9am next week -f script.sh

===
warning: commands will be executed using /bin/sh
job 10 at Fri Jul  8 09:00:00 2022
===

at 9am next month -f script.sh

===
warning: commands will be executed using /bin/sh
job 12 at Mon Aug  1 09:00:00 2022
===


at -l

===
5       Sat Jul  2 08:24:00 2022 a kali
7       Fri Dec 23 09:00:00 2022 a kali
9       Sat Jul  2 09:00:00 2022 a kali
6       Mon Jul  4 09:00:00 2022 a kali
11      Sat Jul  2 09:00:00 2022 a kali
8       Fri Dec 23 09:00:00 2022 a kali
12      Mon Aug  1 09:00:00 2022 a kali
10      Fri Jul  8 09:00:00 2022 a kali
===


# using now with +
at now + 5 minutes -f script.sh

===
warning: commands will be executed using /bin/sh
job 14 at Fri Jul  1 09:03:00 2022
===


# using now with +
at now + 2 day -f script.sh

===
warning: commands will be executed using /bin/sh
job 13 at Sun Jul  3 08:58:00 2022
===


```

--------------

<a name="second"></a>

# Using Cron Schedul and automate bash script

```bash

service cron status

===
● cron.service - Regular background program processing daemon
===


# if you want edit crontab use this command
crontab -e

===
no crontab for kali - using an empty one

Select an editor.  To change later, run 'select-editor'.
  1. /bin/nano        <---- easiest
  2. /usr/bin/vim.basic
  3. /usr/bin/vim.tiny

# pick this editor that you want edit crontab for now i choose 1
# after that it will open crontab configuration you can edit it if you want
Choose 1-3 [1]: 
===


nano script_cron.sh 

---
#!/bin/bash

date >> cron_output.txt
---

chmod 744 script_cron.sh

crontab -e

---
# add this line in the end
# start (*) means every minute or month or ....
# you can use coma (,) use for to represent this week or day the month or month.. like MON,SAT means Monday & Satday
# if you use minize (-) use for to represent this week or day the month or month.. like MON-SAT means every day between Monday & Satday

# first column is minute it can be between 1 to 60 
# second column about hour it can be between 0 to 23
# third column about day the month it can be between 1 to 31
# four column is month number it can be between 1 to 12 you can also say JAN or MAR but it should be upper case
# five column is day of the week it can be between 0 to 6 you can also say MON or SAT but in upper case
# six column for this detecte this script that you wnat run it

# this script run every minute 
# this script run every minute between 2am to 3am if you choose 2 if you choose * run every hour
# this script run every day in the month
# this script run every month
# this script run every week
# final type this place that you want run the script
* * * * * /home/kali/script_cron.sh

---

# now script run every minutes
ls 

===
at_dir  cron_output.txt  Desktop  Documents  Downloads  Music  Pictures  Public  script_cron.sh  Templates  Videos
===

cat ~/cron_output.txt

===
Fri Jul  1 09:36:01 AM EDT 2022
===

cat ~/cron_output.txt

===
Fri Jul  1 09:36:01 AM EDT 2022
Fri Jul  1 09:37:01 AM EDT 2022
Fri Jul  1 09:38:01 AM EDT 2022
Fri Jul  1 09:39:01 AM EDT 2022
Fri Jul  1 09:40:01 AM EDT 2022
===


```


* if you want run specific script for specific user then use follow

```bash

sudo nono /etc/crontab

# in the buttom you should see this now you can specify wich user can run this script mean which user can done this jop

====
# *  *  *  *  * user-name command to be executed
17 *    * * *   root    cd / && run-parts --report /etc/cron.hourly
25 6    * * *   root    test -x /usr/sbin/anacron || ( cd / && run-parts --report /etc/cron.daily )
47 6    * * 7   root    test -x /usr/sbin/anacron || ( cd / && run-parts --report /etc/cron.weekly )
52 6    1 * *   root    test -x /usr/sbin/anacron || ( cd / && run-parts --report /etc/cron.monthly )
#
====

* Example

====
# *  *  *  *  * user-name command to be executed
17 *    * * *   root    cd / && run-parts --report /etc/cron.hourly
25 6    * * *   root    test -x /usr/sbin/anacron || ( cd / && run-parts --report /etc/cron.daily )
47 6    * * 7   root    test -x /usr/sbin/anacron || ( cd / && run-parts --report /etc/cron.weekly )
52 6    1 * *   root    test -x /usr/sbin/anacron || ( cd / && run-parts --report /etc/cron.monthly )
*  *    * * *   root    /home/kali/script_cron.sh

#

====


# after that restart the service cron

sudo service cron restart

```

* some other example crontab

```bash

crontab -e						# to edit (then 'i': insert, ':wq!': save and quit)

===
10 * * * * /bin/sh backup.sh    # every hour at 10"
0 */4 * * * /bin/sh backup.sh   # every 4 hours at 0"
0 9-17 * * * /bin/sh backup.sh  # every hour at 0" between 9 and 17
0 2 * * * /bin/sh backup.sh     # daily at 2am
0 0 * * MON /bin/sh backup.sh   # every Monday at 0am
0 0 * * 1-5 /bin/sh backup.sh   # daily from Monday to Friday at 0am
0 0 * * 0 /bin/sh backup.sh     # weekly on Sunday
0 0 1 * * /bin/sh backup.sh     # monthly (1rst day at 0am)
0 0 1 */3 * /bin/sh backup.sh   # every quarter (1rst day at 0am)
0 0 1 1 * /bin/sh backup.sh     # yearly (01/01)
===



sudo nano /etc/crontab

===
# Example of job definition:
# .---------------- minute (0 - 59)
# |  .------------- hour (0 - 23)
# |  |  .---------- day of month (1 - 31)
# |  |  |  .------- month (1 - 12) OR jan,feb,mar,apr ...
# |  |  |  |  .---- weekday (0 - 6) (Sunday=0 or 7) OR sun,mon,tue,wed,thu,fri,sat
# |  |  |  |  |
# *  *  *  *  *  user command to be executed
10 * * * * /bin/sh backup.sh    # every hour at 10"
===

```

----------------- 

<a name="third"></a>

## cruntab guru

* link in the website

	- https://crontab.guru/

	- https://crontab.guru/examples.html


```

* * * * *

every minute




5 4 * * *
	
At 04:05



At 00:05 in August

5 0 * 8 *



At 14:15 on day-of-month 1

15 14 1 * *



At 22:00 on every day-of-week from Monday through Friday

0 22 * * 1-5



At minute 23 past every 2nd hour from 0 through 20

23 0-20/2 * * *



At 04:05 on Sunday

5 4 * * sun



At minute 0 past hour 0 and 12 on day-of-month 1 in every 2nd month

0 0,12 1 */2 *


At 04:00 on every day-of-month from 8 through 14

0 4 8-14 * *




*/5 4 * * *

At every 5th minute past hour 4




At minute 5 past every 4th hour

5 */4 * * *




whereas * * */2 * 1 runs on every second day of the month only if it's also a Monday (intersection).




if you need to run X every 90 minutes, create one crontab entry that runs X every 3 hours on the hour (0 */3 * * *), and a second crontab entry that runs X every 3 hours with an offset (30 1/3 * * *).

```

* some command cron you should now if you wnat use if for complex work

```

*	any value

,	value list separator

-	range of values

/	step values

@yearly	(non-standard)

@annually	(non-standard)

@monthly	(non-standard)

@weekly	(non-standard)

@daily	(non-standard)

@hourly	(non-standard)

@reboot	(non-standard)

```

---------------- 

<a name="four"></a>

## Using cron command ( simple project )

```bash

ls /etc | grep cron

===
# all this is directory except crontab you can put any script in this directory and run it this daily or hourly or monthly or weekly
# Note: this is directory
cron.d
cron.daily
cron.hourly
cron.monthly
crontab
cron.weekly
===

# Example

===
# this script that i put it in cron.weekly will run every week
sudo cp ~/Documents/test/script.sh /etc/cron.weekly/
===

ls /etc/cron.weekly

===
man-db  script.sh
===




nano /etc/crontab 

===

# Example of job definition:
# .---------------- minute (0 - 59)
# |  .------------- hour (0 - 23)
# |  |  .---------- day of month (1 - 31)
# |  |  |  .------- month (1 - 12) OR jan,feb,mar,apr ...
# |  |  |  |  .---- day of week (0 - 6) (Sunday=0 or 7) OR sun,mon,tue,wed,thu,fri,sat
# |  |  |  |  |
# *  *  *  *  * user-name command to be executed

===



# how you can you create a custome directory like other directory cron and be able to put any script and run it in that time let's do that


mkdir cron.daily.2am


crontab -e

=== 
# add this line in the buttom
00 2 * * * run-parts ~/Documents/test/cron.daily.2am --reports
=== 

* done now every script that you want run every day in 2AM just put it in this directory 
* this is possible by using (after_you_set_the_time run-part /path/you/want --reports ) 




nano update_script.sh

=== 
#!/bin/bash

apt -y update
apt -y upgrade

# this file reboot-required in /var/run/reboot-required is in ubuntu is exits 
# this file will reboot the system if reboot required to fully update the package
if [ -f /var/run/reboot-required ]; then
        reboot
fi
=== 

chmod 744 update_script.sh

sudo nano /etc/crontab

===
# this script now run in root priviledge because we use ( sudo nano /etc/crontab ) for editing the file
00 00 * * * /home/kali/Documents/test/update_script.sh  
===


sudo service cron restart

* Note: this script run if your system is turn on

```

------------------ 

<a name="five"></a>

## Anacron

```bash

sudo nano /etc/anacrontab                                           


# /etc/anacrontab: configuration file for anacron
# See anacron(8) and anacrontab(5) for details.

# in this place you can change the language for the shell you change from sh="shell" to bash
# SHELL=/bin/sh
SHELL=/bin/bash
# in this place you can add this place that you want add it for anacrontab like crontab that any script in this directory will run in this time that you are specify for it
# example of adding path
# PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/home/soyansoon/Documents/test/bash/first_lesson
HOME=/root
LOGNAME=root
# first column means day in the week ( day the week start in 1 to 7 )
# second column means this dealay that you want run in this day in the week dealy is in minute in here
# third column specify definer script like title is work
# four column specify direction if you specify the direction in the PATH then you just need specify the name of the script you want run it

# in this place you can add this configuration that you want run with anacron
# These replace cron's entries
1       5       cron.daily      run-parts --report /etc/cron.daily
7       10      cron.weekly     run-parts --report /etc/cron.weekly
@monthly        15      cron.monthly    run-parts --report /etc/cron.monthly
# 7 means every day in the week 
# 30 means 30 menute after this script that run for example first is run 5 minute after turn on computer second is 10 minute after turn one computer third ... 
# third is definer in this case is for_loop
# four once you should specify the script if script has extension you should type the extension also
7 		30   	for_loop 		for_loop






* after restarting computer you should see this

ls /var/spool/anacron

===
cron.daily  cron.monthly  cron.weekly for_loop
===

```

