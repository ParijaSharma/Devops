# Linux Basics

## File System Navigation
 - `pwd` → Print current working directory.
 - `ls` → List files.
 - `ls -l` → Long format.
 - `ls -lt`  → last time modified , which date it was made , size etc;
 - `ls -ltr`  → it sorts the file in reverse order so you will see latest file at the lowest 
 - `ls -lth`  → for more human readable form we use this 
 - `ls -a` → Show hidden files.
 - `cd <directory>` → Change directory.
 - `cd ..` → Go up one level.
 - `whoami` → to check current user logged in
 - `cd ~` → to go to the home directory
 - `date` → to check system date or time 
        if want to see only date then {date + %D}
        if want to see only time then {date + %T}
        customized time = {date + %H +%M}
  - `cd ~` → to go to the home directory
   - `clear`  → for clearing the terminal
## File & Directory Management
- `touch file.txt` → Create file (this also changes the time of file that has been already created if touch it).
- `cat file.txt` → to read the file
        for searching anything first write {less <file> then / ..... whatever you want to search}
        * shift+G - last line reached
        * P - first line reached
        if you are at end of the file then for searching anything use {?} and not {/}
        press q for quitting
- `more<file>` to view the content of file page by page
- `mkdir new_folder` → Create directory.
- `cp source.txt dest.txt` → Copy file.
- `mv file.txt folder/` → Move file.
- `rm file.txt` → Delete file.
- `rm -r folder/` → Delete folder recursively.

## Viewing Files
- `cat file.txt` → Display file content.
- `less file.txt` → Scroll through file.
- `head -n 10 file.txt` → First 10 lines.
- `tail -f file.txt` → Follow live updates.

---
#changing password
- `sudo passwd <username>`

💡 **Tip:** Use `man <command>` to see manual pages.


#cron command :
The cron command in Linux refers to a utility and daemon that allows users to schedule commands or scripts to run automatically at specific intervals. These scheduled tasks are known as "cron jobs."
- scheduling 
- eg alarms system update , notifications , backup,reminders
syntax:
 *    *   *   *   * <command /shell script>
 min  hr DoM  M  DoW
 0-59
 -crontab -e edit dcrontab 
 -crontab -l listing existing cron jobs 
 -config file - etc/crontab
**Directory structure is important
root -is a home directory of root user 
bin - system binaries
temp - stores temporary files

#User Management:
1. The basic syntax for the `useradd` command is as follows.
`useradd [options] [User_name]`

2. How to Add User by Specifying a home directory path for the new user
To give a home directory path for new users, we use the following command in Linux.
`sudo useradd -d /home/test_user test_user`

3. How to Create a User with a Specific User ID (UID)
To create a new user with a custom UID, we use the following command.
`sudo useradd -u 1234 test_user`

4. How to Create a User with a Specific Group ID (GID)
To create a new user and assign a specific group ID
`sudo useradd -g 1000 test_user`

5. How to Create a User Without a Home Directory
To create a user without a home directory
`sudo useradd -M test_user`

6. How to Create User with an Expiry Date
To set an expiry date for a user account
`sudo useradd -e 2020-05-30 test_user`

7. How to Create User with a Comment
To add a comment or description for a user
`sudo useradd -c "This is a test user" test_user`

8. How to Create a User with Changed Login Shell
To create a user with a different login shell
`sudo useradd -s /bin/sh test_user`

9. How to Set an Unencrypted Password for the User
To set an unencrypted password for the user
`sudo useradd -p test_password test_user`

10. Displaying Help
To display help
`sudo useradd --help`
