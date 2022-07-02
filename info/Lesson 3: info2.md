* [Table of Contents](#table-of-contents)
	- [STEP 1 : TOKENISATION](#first)
	- [STEP 2 : COMMAND IDENTIFICATION](#second)
	- [Pattern](#third)
		+ [Example](#sub_third)
		+ [Some other example](#sub_third_1)

<a name="first"></a>

## STEP 1 : TOKENISATION

* LIST OF METACHARACTERS

```bash 

Space
Tab
Newline
|
&
;
(
)
<

```

<a name="second"></a>

----------------------

## STEP 2 : COMMAND IDENTIFICATION


* LIST OF CONTROL OPERATORS

```bash 

Newline 
I 
II 
& 
&& 
; 
;;
;&
;;&
|&
(
)

```

* LIST OF REDIRECTION OPERATORS

```bash 
<
>
<<
>>
<&
>&
>|
<<-
< >
```

<a name="third"></a>

----------------------

## Pattern

* Note: When used in a pattern, character classes must themselves be placed inside square brackets

* [:alpha:]      wrong

* [[:alpha:]]    right

------------------

[:alpha:]

* Includes all the letters of the alphabet, in both upper and lowercase

[:alnum:]

* Includes the numbers 0–9, and all upper and lowercase letters

[:lower:]

* Includes just lowercase 

[:upper:]

* Includes just uppercase

[:digit:]

* Includes just number and between 0–9

[:punct:]

* Includes all forms of punctuation

[:space:]

* Includes all forms of whitespace, such as tab and space characters

[:word:]

* Includes all uppercase and lowercase letters, as well as “_”

<a name="sub_third"></a>

### Example

```bash 

# Will match all files with exactly one lowercase letter character between “file” and “.txt”
ls file[[:lower:]].txt

===
filea.txt fileb.txt filec.txt
===

# Will match all files with exactly one character between “file” and “.txt” that is either an uppercase letter, a lowercase letter, or a number from 0-9
ls file[[:alnum:]].txt

===
filea.txt fileb.txt filec.txt file1.txt file2.txt file3.txt
===

# only digit
# Will match all files with exactly one character between “file” and “.txt” that is a number from 0-9.
ls file[[:digit:]].txt

===
file1.txt file2.txt file3.txt
===

# not digit
# Will match all files with exactly one character between “file” and “.txt” that is not a number from 0-9.
ls file[![:digit:]].txt

===
filea.txt fileb.txt filec.txt
===

```

* Note: or pattern

```bash
S(pattern1 | pattern2 | ... | patternN)
```

* happen when S is one this symbol

```bash

@ Happy if the pattern list matches once

+ Happy if the pattern list matches 1 or more times.

? Happy if the pattern list matches 0 or one time.

* Happy if the pattern list matches 0 or more times.

! Happy if something except the pattern list matches.

```

* for test this practic do this

```bash

touch london_july_2001_{001..100}.jpeg,

touch london_march_2004_{001..100}.png

touch paris_sept_2007_{001..100}.jpg

touch newyork_dec_2012_{001..100}.jpeg

```

```bash

# This will list each file that has one of the given file extensions (jpeg, png & jpg)
ls *.@(jpeg|png|jpg)

# This will list each file that has one of the given file extensions (jpeg, png & jpg) and that were taken in london and paris.
ls @(london|paris)*.@(jpeg|png|jpg)

# wrong patter !!!!!

# This will list each file that has one of the given file extensions (jpeg, png & jpg) and that do not start with the word london or paris
ls !(london|paris)*.@(jpeg|png|jpg)

# wright pattern

ls !(paris_sept_2007_[[:digit:]][[:digit:]][[:digit:]].jpg|paris_sept_2007_[[:digit:]][[:digit:]][[:digit:]].png|paris_sept_2007_[[:digit:]][[:digit:]][[:digit:]].jpeg|london_march_2004_[[:digit:]][[:digit:]][[:digit:]].jpg|london_march_2004_[[:digit:]][[:digit:]][[:digit:]].png|london_march_2004_[[:digit:]][[:digit:]][[:digit:]].jpeg|london_july_2001_[[:digit:]][[:digit:]][[:digit:]].jpeg)

* using pre method

ls !(paris_sept_2007_[[:digit:]][[:digit:]][[:digit:]].jpg|
	paris_sept_2007_[[:digit:]][[:digit:]][[:digit:]].png|
	paris_sept_2007_[[:digit:]][[:digit:]][[:digit:]].jpeg|
	london_march_2004_[[:digit:]][[:digit:]][[:digit:]].jpg|
	london_march_2004_[[:digit:]][[:digit:]][[:digit:]].png|
	london_march_2004_[[:digit:]][[:digit:]][[:digit:]].jpeg|
	london_july_2001[[:digit:]][[:digit:]][[:digit:]].jpeg)

# This will list each file that starts with the word “paris”, then is followed by a series of characters containing only word, letters, and finally ends with a file extension of .jpeg, .png or .jpg
ls paris+([[:word:]]).@(jpeg|png|jpg)

```
------------------

<a name="sub_third_1"></a>

### Some other example

```bash

echo "hello"

===
hello
===

echo '"hello"' 

===
"hello"
===

echo \"hello\"

===
"hello"
===

path="C:\Users\Karen\Documents"

echo $path

===
C:\Users\Karen\Documents
===

```

```bash

# Redirects the contents of file to the standard input of command.
command < file

# Truncates file and then redirects standard output of command to it
command > file

# Appends standard output of command to file.
command >> file

# Truncates file and then redirects standard error of command to it
command 2> file

# Appends standard error of command to file
command 2>> file

# Truncates file, and then redirects both standard output and standard error of command to it.
command &> file

# Appends both standard output and standard error of command to file.
command &>> file

```