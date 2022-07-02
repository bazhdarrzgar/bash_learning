* [Table of Contents](#table-of-contents)
	- [THE “AT” COMMAND](#first)
	- [SCHEDULING JOBS WITH “AT”](#second)
	- [THE “CRON” COMMAND](#third)
	- [EDITING CRONTABS](#four)
		+ [Crontab Column Title](#sub_four)
	- [Cron Directories](#five)
	- [ANACRO](#six)

<a name="first"></a>

## THE “AT” COMMAND

* Starting the at service:

* Command to install the at command on Ubuntu:

```bash

sudo apt install at

```

To check if the at service running:

```bash

service atd status

```

To start the at service

```bash

service atd start

```

To stop the at service

```bash

service atd stop

```
To restart the at service

```bash

service atd restart

```


------------------------

<a name="second"></a>

## SCHEDULING JOBS WITH “AT”

* Syntax to schedule one or more commands:

```bash

at <time> <date>

```


* Syntax to schedule a script:

```bash

at <time> <date> -f /path/to/script

```


* Some Useful Options:

```bash


-l  :  List all jobs scheduled that we have

-r <id>   :  Remove the job with id “id” from the schedule


```


* Expressing dates and times

```bash

HH:MM    :   Run at HH:MM in 24-hour format

10pm  :   Run at the upcoming 10 pm timeslot (either today if its curren

```


* Some Sample Date Formats

```bash


7/12/2021     Date in month/day/year. This represents 12th July 2021

7.12.2021     Date in day/month/year format.

next week     Exactly 7 days from now

+ 3 days      3 days from now

```


* More Info

```bash

man at

```




* Limitations of the “at” command:

	- The at command will only execute jobs at the scheduled time if your PC is turned on and the at daemon is running at that time.

	- There is no way to set up recurring jobs. Jobs scheduled by the at command only run once.


------------------------

<a name="third"></a>

## THE “CRON” COMMAND

* To check if cron is running:


```bash

service crond status

```

* To start cron:

```bash

service crond start

```

* To stop cron:


```bash

service crond stop

```

* To restart cron:

```bash

service crond restart

```





* Limitations of Cron:

Cron will only execute jobs if your PC is turned on and the cron daemon is running at the scheduled time.


------------------------

<a name="four"></a>

## EDITING CRONTABS


* To edit the current user’s crontab:

```bash

crontab -e

```

* Important : Always use crontab -e to edit your user’s
crontab. This will ensure that the cron service is restarted
and that your changes take effect.


<a name="sub_four"></a>

### Crontab Column Title

```bash
minutes 	hours  		days of the month 		month 		days of the week 		command	

0 - 59  	0 - 23  		  1 - 31 			1 - 31 		0 - 6 or MON-SUN  		"Your command or PATH to your script"

```

* Important : You must ensure that the scripts referred to
in the “command” section have been given execution
permissions!




* Some handy shortcuts

```

- Character 		- Example  		- Meaning


- *

- n/a

- Putting * in the hour column is the same as entering the numbers 0-23
Putting * in the minute column is the  same as entering the numbers 0-59 
Putting a * in the days of the week is the same as entering the numbers 0-6


- ,

- 1,5,8 

- Enter the values 1, 5, and 8 into the current column


- - 

- 1-8     MON-WED

- Enter the values 1,2,3,4,5,6,7,8 into the current column. Enters the values MON,TUE,WED into the current column.

```


-----------------------

<a name="five"></a>

## Cron Directories

* Preconfigured directories:

```bash

/etc/cron.hourly    Scripts in this folder will run once per hour

/etc/cron.daily     Scripts in this folder will run once per day

/etc/cron.weekly    Scripts in this folder will run once per week

/etc/cron.monthly   Scripts in this folder will run once per month

```


* Creating your own cron directories

```bash

run-parts --report /path/to/directory

```


* Important Note 1 : Any script placed within these folders will be run by the root user

* Important Note 2 : Scripts placed within these folders must not contain “ . ” characters in the filenames (e.g. . sh)

* Important Note 3 : Like all cron scripts, you must ensure that scripts you place in these folders have execution permissions! Otherwise, they won’t run!

-----------------------

<a name="six"></a>

## ANACRO

* to modify anacontab run this

```bash

sudo nano /etc/anacrontab

```


* Anacrontab syntax

```
period

How many days between each time your command is run. E.g putting a “1” here would make the command run every day




delay

The delay in minutes from when anacron starts to when this command is run




job-identifier 

The name given to the command in the anacron logs. The job identifier can contain any characters except blanks and slashes.




command

The command you want to run, or path to your script.

```
--------------

* Limitations of Anacron : Unlike cron, you cannot run anacron jobs any more
frequently than daily. Anacron will only recover 1 missed job

