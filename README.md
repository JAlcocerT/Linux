## Useful Shell commands


head -n 5 seasonal/winter.csv > top.csv
tail -n 3 top.csv

The pipe symbol tells the shell to use the output of the command on the left as the input to the command on the right:
head -n 5 seasonal/summer.csv | tail -n 3

cut -d , -f 2 seasonal/summer.csv | grep -v Tooth

The command wc (short for "word count") prints the number of characters, words, and lines in a file. 
You can make it print only one of these using -c, -w, or -l respectively.


# wildcards
To make your life better, the shell allows you to use wildcards to specify a list of files with a single expression. The most common wildcard is *, which means "match zero or more characters". Using it, we can shorten the cut command above to this:

cut -d , -f 1 seasonal/*
or:

cut -d , -f 1 seasonal/*.csv

head -n 3 seasonal/s*

The shell has other wildcards as well, though they are less commonly used:

? matches a single character, so 201?.txt will match 2017.txt or 2018.txt, but not 2017-01.txt.
[...] matches any one of the characters inside the square brackets, so 201[78].txt matches 2017.txt or 2018.txt, but not 2016.txt.
{...} matches any of the comma-separated patterns inside the curly brackets, so {*.txt, *.csv} matches any file whose name ends with .txt or .csv, but not files whose names end with .pdf.

# sort lines of text
As its name suggests, sort puts data in order. By default it does this in ascending alphabetical order, but the flags -n and -r can be used to sort numerically and reverse the order of its output, while -b tells it to ignore leading blanks and -f tells it to fold case (i.e., be case-insensitive).
Pipelines often use grep to get rid of unwanted records and then sort to put the remaining records in order.

cut -d , -f 2 seasonal/summer.csv | grep -v Tooth | sort -r

# uniq
Another command that is often used with sort is uniq, whose job is to remove duplicated lines. More specifically, it removes adjacent duplicated lines

# set
How does the shell store information?
Like other programs, the shell stores information in variables. Some of these, called environment variables, are available all the time. Environment variables' names are conventionally written in upper case


To get a complete list (which is quite long), you can type set in the shell.

Use set | grep HISTFILESIZE to get the line you need.
Use set | grep USER to get the line you need.

To get the variable's value, you must put a dollar sign $ in front of it. Typing

echo $USER

The other kind of variable is called a shell variable, which is like a local variable in a programming language.

To create a shell variable, you simply assign a value to a name:

training=seasonal/summer.csv
without any spaces before or after the = sign. Once you have done this, you can check the variable's value with:
echo $training

# loops

How can I repeat a command many times?
Shell variables are also used in loops, which repeat commands many times. If we run this command:

for filetype in gif jpg png; do echo $filetype; done

Notice these things about the loop:

The structure is for …variable… in …list… ; do …body… ; done
The list of things the loop is to process (in our case, the words gif, jpg, and png).
The variable that keeps track of which thing the loop is currently processing (in our case, filetype).
The body of the loop that does the processing (in our case, echo $filetype).

for filename in seasonal/*.csv; do echo $filename; done

# nano

f you type nano filename, it will open filename for editing (or create it if it doesn't already exist). You can move around with the arrow keys, delete characters using backspace, and do other operations with control-key combinations:

Ctrl + K: delete a line.
Ctrl + U: un-delete a line.
Ctrl + O: save the file ('O' stands for 'output'). You will also need to press Enter to confirm the filename!
Ctrl + X: exit the editor.

# save commands to rerun

You have been using the shell interactively so far. But since the commands you type in are just text, you can store them in files for the shell to run over and over again. To start exploring this powerful capability, put the following command in a file called headers.sh:

head -n 1 seasonal/*.csv
This command selects the first row from each of the CSV files in the seasonal directory. Once you have created this file, you can run it by typing:

bash headers.sh
This tells the shell (which is just a program called bash) to run the commands contained in the file headers.sh, which produces the same output as running the commands directly

# pass filenames to scripts


A script that processes specific files is useful as a record of what you did, but one that allows you to process any files you want is more useful. To support this, you can use the special expression $@ (dollar sign immediately followed by at-sign) to mean "all of the command-line parameters given to the script".

For example, if unique-lines.sh contains sort $@ | uniq, when you run:

bash unique-lines.sh seasonal/summer.csv
the shell replaces $@ with seasonal/summer.csv and processes one file. If you run this:

bash unique-lines.sh seasonal/summer.csv seasonal/autumn.csv
it processes two data files, and so on.


How can I process a single argument?
As well as $@, the shell lets you use $1, $2, and so on to refer to specific command-line parameters. You can use this to write commands that feel simpler or more natural than the shell's. For example, you can create a script called column.sh that selects a single column from a CSV file when the user provides the filename as the first parameter and the column as the second:

cut -d , -f $2 $1
and then run it using:

bash column.sh seasonal/autumn.csv 1

# How can I write loops in a shell script?
Shell scripts can also contain loops. You can write them using semi-colons, or split them across lines without semi-colons to make them more readable:

#Print the first and last data records of each file.
for filename in $@
do
    head -n 2 $filename | tail -n 1
    tail -n 1 $filename
done