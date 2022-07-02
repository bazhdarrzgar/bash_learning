* [Table of Contents](#table-of-contents)
	- [DEBUGGING USING SHELLCHECK](#first)
	- [COMMON ERRORS](#second)
	- [HOW TO FIND HELP](#third)
	- [THE HELP COMMAND](#four)
	- [THE MAN COMMAND](#five)
	- [THE INFO COMMAND](#six)

<a name="first"></a>

## DEBUGGING USING SHELLCHECK

```bash

# Install shellcheck on Ubuntu:
sudo apt install shellcheck

# Command to run shellcheck:
shellcheck <script>

```


--------------------

<a name="second"></a>

## COMMON ERRORS

```bash

No Such File or Directory # this file or folder you want find it or detect it is not file or directory may be something else

File Exists # ( file is exists in this directory )

Permission Denied # ( use sudo or permission it with chmod )

Operation Not Permitted # this error come if you are not root user or user that not allow you to do this operation use ( sudo or chmod ) for fixing this error

Command not found # not command for internal or external command in your system sometimes this happen because this command is for another system or you should install it like locate

```


--------------------

<a name="third"></a>

## HOW TO FIND HELP


* If the type command says that the command is a “built-in”, then it is an internal command.

* However, if the type command gives you a path to the executable (e.g. “ls is /bin/ls”), then it is an external command.

```bash

type -a <command>

```

----------------------

<a name="four"></a>

## THE HELP COMMAND

* Structure
	
	- Synopsis
	
	- Description
	
	- Options and details of what each option does

* -d Prints only the description of the command

* -s Prints only

```bash

help <command>

help -d <command>

help -s <command>

```

----------------------

<a name="five"></a>

## THE MAN COMMAND

```bash

man <command>

# using keyword
man -k “<keyword/phrase>”

---
man -k ls
---

```

* **However, they do tend to follow a similar format**:

- Name Section: The name of the command and a very short description of what it does.

- Synopsis Section: How to type out the command. See here for a detailed explanation of how to read the synopsis within the man pages.

- Description Section: Detailed information about how the command works and what it can do 

- General Info: Exit statuses, author contact details, and how to report bugs

----------------------

<a name="six"></a>

## THE INFO COMMAND

* Note : Not every command has an entry for the info man is handle more command

* Hint : Press ] to see the next page. Press [ to see the previous page. Press “enter” on a link to follow it.

```bash

info <command>

```
