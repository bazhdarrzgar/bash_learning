* [Table of Contents](#table-of-contents)
	- [SSH](#first)
	- [SCP](#second)

<a name="first"></a>

## SSH

* Syntax for connecting via ssh:

```bash

ssh user@ip

```

-----------------------

<a name="second"></a>

## SCP

* Note : If you are having difficulty connecting, you may have issues with your workplace’s firewall or security policies.


* Syntax for scp:

```bash

scp source target

```



* Syntax to transfer from remote system to local system

```bash

cp user@ip : /path/to/file /path/to/destination

```


* Syntax to transfer file from local system to remote system

```bash

scp /path/to/file user@ip : /path/to/destination

```
