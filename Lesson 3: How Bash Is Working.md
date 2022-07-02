* [Table of Contents](#table-of-contents)
	- [Three Types of Quoting](#first)
	- [Tokenisation](#second)
	- [Command Identification](#third)
	- [Expansions](#four)
	- [Word Splitting](#five)
	- [Using Expression Calling File or Folder](#six)
	- [Step 4 Quote Removal](#seven)
	- [Redirection](#eight)
	- [Worked Example](#nine)

<a name="first"></a>

## Three Types of Quoting

1. Backslash(\)

 	- Removes special meaning from next character

2. Single Quotes ('')

	- Removes special meaning from all character inside.

3. Double Quotes ("")

	- Removes special meaning from all except dollar sings ($) and backticks (`)


```bash 

echo john & jane

===

[1] 7088
john

Command 'jane' not found, did you mean:

  command 'jake' from deb node-jake (0.7.9-1)
  command 'jaxe' from deb jaxe (3.5-11)

Try: sudo apt install <deb name>

[1]+  Done                    echo john

===

echo john \& jane

===
john & jane
===

filepath=C:\Users\Alex\Documents

echo $filepath

===
C:UsersAlexDocuments
===

filepath=C:\\Users\\Alex\\Documents

echo $filepath

===
C:\Users\Alex\Documents
===

filepath='C:\Users\Alex\Documents'

echo $filepath

===
C:\Users\Alex\Documents
===

# double Quotes removes meaning of environment variable and other thing that have meaning for bash to not happen this you should use double Backslashes if you want use backslashes with it otherwise not use backslash it will take you output
filepath="C:\Users\\$USER\Documents"

echo $filepath

===
C:\Users\soyansoon\Documents
===

filepath="$USER"

echo $filepath

===
soyansoon
===

```

------------------------ 

<a name="second"></a>

## Tokenisation

```bash 

name=alexandra

echo $name > out.txt

echo $name > out

```

------------------------ 

<a name="third"></a>

## Command Identification

```bash 

echo a b c echo 1 2 3

===
a b c echo 1 2 3
===

echo a b c; echo 1 2 3

===
a b c
1 2 3
===

```

------------------------ 

<a name="four"></a>

## Expansions

```bash 

x=10

echo {1..$x}

===
{1..10}
===

echo $name has $((1+2)) apples

===
alexandra has 3 apples
===

echo $name has {1..3} apples and $((5+2)) oranges

===
alexandra has 1 2 3 apples and 7 oranges
===

```

------------------------ 

<a name="five"></a>

## Word Splitting

* default value of IFS is ( newline, space, tab )

```bash 

echo "${IFS}"

===
# nothing will be print because we don't take it anything to specific it for IFS
===

echo "${IFS@Q}"

===
$' \t\n'
===




number="1 2 3 4 5"

touch $number

ls 

===
1 2 3 4 5
===




rm {1..5}

touch "$number"

ls

===
'1 2 3 4 5'
===




rm '1,2,3,4,5'

number="1,2,3,4,5"

touch $number

ls 

===
'1,2,3,4,5'
===




rm '1,2,3,4,5'

IFS=","

touch $number

ls

===
1 2 3 4 5
===

rm {1..5}

```

------------------  

<a name="six"></a>

## Using Expression Calling File or Folder

```bash 

ls

===
our_first_program  script_test  t  time_c
===

# * mans all
ls *

===
our_first_program  script_test  time_c

t:
hello.txt
===

# * means anycharacter with out limitation
ls *.txt

===
hello10.txt  hello2.txt  hello4.txt  hello6.txt  hello8.txt  hello.txt
hello1.txt   hello3.txt  hello5.txt  hello7.txt  hello9.txt
===

ls *.pdf

===
hello1.pdf  hello2.pdf  hello3.pdf  hello4.pdf  hello5.pdf
===

ls hello*.txt

===
hello10.txt  hello2.txt  hello4.txt  hello6.txt  hello8.txt  hello.txt
hello1.txt   hello3.txt  hello5.txt  hello7.txt  hello9.txt
===

# ? means one character
ls hello?.txt

===
hello1.txt  hello2.txt  hello3.txt  hello4.txt  hello5.txt  hello6.txt  hello7.txt  hello8.txt  hello9.txt
===

ls hello??.txt

===
hello10.txt
===

# after hello if we have ( 0 or 1 ) take it but not boss of it
ls hello[01].txt

===
hello1.txt
===

ls hello[01][01].txt

===
hello10.txt
===

ls hello[0-4].txt

===
hello1.txt  hello2.txt  hello3.txt  hello4.txt
===

touch hello[a-d].txt

===
'hello[a-d].txt'
===

touch hello{a..d}.txt

ls

===
helloa.txt  hellob.txt  helloc.txt  hellod.txt
===

ls hello[a-c].txt

===
helloa.txt  hellob.txt  helloc.txt
===

# delete all jpg in this directory
rm ~/Downloads/*.jpg

```

--------------------- 

<a name="seven"></a>

## Step 4 Quote Removal

```bash 

echo $HOME 

===
/home/soyansoon
===

echo \$HOME

===
$HOME
===

echo '\$HOME'

===
\$HOME
===

path="C:\Users\Alex\Documents"

echo $path
===
C:\Users\Alex\Documents
===

path=C:\Users\Alex\Documents

echo $path 

===
C:UsersAlexDocuments
===

```

--------------------- 

<a name="eight"></a>

## Redirection

* Data Streams

	- Stream 0 = Standard Input (stdin)
	- Stream 1 = Standard Output (stdout)
	- Stream 2 = Standard Error (stderr)

```bash 

cat

===
# wait for input
===

cat < hello.txt

===
hello, world!
===

echo "this is input with override using >" > hello.txt

cat hello.txt

===
this is input with override using >
===

echo "this is input with non override using >>" > hello.txt

cat hello.txt

===
this is input with non override using >>
===





cd /root

===
bash: cd: /root: Permission denied
===

cd /root > error.txt

===
# this is happen because this > sybmol will cut this error and put it in text 
bash: cd: /root: Permission denied
===

cd /root >> error.txt

===
# this is also take you error because this >> sybmol will just cut the error and past it in next line in the end if we have next line if not will past it in the first
bash: cd: /root: Permission denied
===

cd /root 2> error.txt

cat error.txt

===
# this is not happen because this 2> symbol use method copy instaid of cut
bash: cd: /root: Permission denied
===

# &> standard input and standard output in the same time
# cd /root &> /dev/null

cd /root &> hello.txt

cat hello.txt

===
bash: cd: /root: Permission denied
===

```

---------------------- 

<a name="eight"></a>

## Worked Example

```bash 

name=simon.smith

out=output.txt

echo $name > $out

===
simon.smith
===

name=simon smith

===
Command 'smith' not found, did you mean:

  command 'csmith' from deb csmith (2.3.0-6build1)

Try: sudo apt install <deb name>
===

name='simon smith'

out=output.txt

echo $name > $out

===
simon smith
===

```

----------------- 

<a name="nine"></a>

## Worked Example

```bash 

#!/bin/bash 

IFS="."

name="Alex.Andra"

out="output.txt"

echo $name > "$HOME/Documents/test/bash/first_lesson/$out"

# wrong practic 
echo $name > "~/Documents/test/bash/first_lesson/$out"

```

* you can use this bracket ( ) with star of $ means $( ) to put it other command bash 

```bash 

echo "$(ls *.txt)"

===
hello1.txt
hello2.txt
hello3.txt
hello4.txt
hello5.txt
output.txt
===

```
