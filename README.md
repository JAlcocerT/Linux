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


