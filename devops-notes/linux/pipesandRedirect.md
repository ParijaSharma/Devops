#input out and pipes in linux
linux allows output of one command to be output of another command

#pipe command : {|}
pipes the output of the previous command as an input to the next command
for example:
when we run a command like:
cat /var/log/syslog
then the output is quite large so to see it all in a compact way .. page by page ...we can use pipe command |
> `cat /var/log/syslog | less`
> `ls /usr/bin | less`
- less is used to display the contents of the file or a command output one page at a time 
allow us to move forward and backward

> `history | grep sudo` 
-> this command will give history with sudo in it...like it traces history of sudo commands 
here grep stands for globally search for regular expression and print out 
searches for particular pattern of characters and displays all lines that contain that pattern

we also do it like this 
`history | grep sudo | less`
`ls | grep python | less`

# redirects in linux
we redirect the result of a command execution into a file 
- {>} this character is the redirect operator 
- takes the output from the previous command and sends it to a file that you give

example:
`history | grep sudo > sudo-comments.txt`
this command will first take the list with sudo in it and direct it to text file 

# you can give like a list of tasks to be done using sleep
`clear; sleep 1; echo "this is a statement"`
this command will first clear the terminal then wait for 1 sec and echo the statement
