each user has its own environment 
each user can configure its own environment/account by setting preferences
these os configurations should be isolated from other environments 
where does os stores all these configurations?
ans - environment variables

- user can change these environment variable values
#command for displaying all the environment variables 
`printenv`
`printenv | less`

access specific environment variable :
`printenv USER`
`printenv | grep USER` 

#use cases of environment variables:
os stores information about the environment 
we can create our own environment varibles
sensitive data for application :
-> set these data as env vars on server
-> Apps can read those env vars
-> by creating these env vars, we make them availablle in the environment
-> All apps and processes can now access vars
-> every programming lanuage allows you to access evn vars

cmd :
export DB_USERNAME=dbuser
* when we use export for setting env variable so that will stay only till that particular session (not permanent)

#delete env variable
command: `unset name_of_variable`

#persisting env variables:
[.bashrc - shell specific configuration file . per-user shell specific configuration file]
eg - if you are using Bash you can declare variables on ./bashrc file and var set in this file are loaded whenever bash login shell is entered 

so for permanent addition of  env vars:
vim .bashrc
[add this in eof]
export DB_USER=dbuser

[reload]
source ~/.bashrc
printenv | grep DB

#Path Environment variable :
list of dir to executable files, separated by :
Tells the shell which directories to search in the executablein response to our executed command

* if we make script file and then make a path variable inside bashrc file then we dont have oh write the whole path of file to execute it ... we can just execute it by giving permissions first and then executing it with the file's name itself
eg:
vim welcom.sh
parija@parisUbuntu:~$ chmod a+x welcome.sh
chmod: cannot access 'welcome.sh': No such file or directory
parija@parisUbuntu:~$ chmod a+x welcom.sh
parija@parisUbuntu:~$ vim .bashrc
parija@parisUbuntu:~$ source .bashrc
parija@parisUbuntu:~$ welcome.sh
welcome.sh: command not found
parija@parisUbuntu:~$ welcom.sh
Welcome





