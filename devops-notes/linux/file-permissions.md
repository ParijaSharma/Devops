`id` Display user identity
`chmod` Change a file’s mode
`umask` Set the default file permissions
`su` Run a shell as another user
`sudo` Execute a command as another user
`chown` Change a file’s owner
`chgrp` Change a file’s group ownership
`passwd` Change a user’s password
`usermod` modify user permissions 
`sudo groupadd group_name`- to add a group
he groupadd command is used. This command requires root privileges or sudo access to execute. 

#Owners, Group Members, and Everybody Else
when we try to examine things like
`[me@linuxbox ~]$ file /etc/shadow`
/etc/shadow: regular file, no read permission
`[me@linuxbox ~]$ less /etc/shadow`
/etc/shadow: Permission denied
**as a regular user we don't have the permission to read this

**when user accounts are created, users are assigned a number called a user ID (uid), which is then, for the sake of the humans, mapped to a username. The user is assigned a group ID (gid) and may belong to additional groups.

**User accounts are defined in `the /etc/passwd` file, and groups are defined in the `/etc/group file`

##Reading, Writing, and Executing
`{me@linuxbox ~]$ > foo.txt                    }`
`{[me@linuxbox ~]$ ls -l foo.txt               }`
`{-rw-rw-r-- 1 me me 0 2018-03-06 14:52 foo.txt}`
%The first 10 characters of the listing are the file attributes. 

`-` > A regular file.
`d` > A directory.


[Q] Create a User <user> using "adduser"
Login to the user <user>
Create a shell script to print some value using "echo" in his home dir
login to the default user
add user to the "group" of the dir
execute the shell script being default user

1st make a user - sudo adduser tomy
                  [cd ~ ]->to go to home dir
                  [nano myscript.sh]
                  [exit]
                  [sudo usermod -aG tomy parija] giving tomy - group parija
                  [cat /etc/group] -> to check if group is added
                  [sudo su parija]
                  -After giving executable permission to the group , if you are facing “permission denied” issue then follow these steps→
                    1. give permission using sudo chmod .
                    2. After that , relogin into the same user  using sudo su -<your_username>
                    3. Then finally execute the file without errors.
                    
                  [sudo chmode 750 /home/tomy/myscript.sh] -> giving required permissions to file
                  [/home/tomy/myscript.sh] -> shows the out put whatever is written in the file.
                  
#When you create users and groups in Linux, there are two things to manage separately:

User account → created with useradd and deleted with userdel.
Group → created with groupadd and deleted with groupdel.

sudo groupdel neha
If a group neha exists, this deletes it.
But if a user neha still exists with primary group = neha, then you cannot delete it before removing the user.

sudo userdel vipul
This removes the user vipul.
If you didn’t use -r, the home directory and mail spool remain.
The group vipul might also remain if it wasn’t the primary group or had other members.

sudo userdel tomy
Error: userdel: group tomy not removed because it has other members.
    Every user has a primary group (usually the same name as the user).
    When you delete the user, Linux tries to remove their primary group too.
    But here, tomy’s group had other members besides tomy.
    👉 So userdel removed the user, but kept the group.
    That’s why you had to run sudo groupdel tomy.
           
#Correct way to ensure ownership
To fix ownership of a user’s home: 
sudo chown -R USER:GROUP /home/USER
      

* -g sets primary; -aG appends to secondary.

#tasks:
sudo groupadd linux
parija@parisUbuntu:~$ sudo groupadd sigma
parija@parisUbuntu:~$ sudo usermod -g sigma neha
parija@parisUbuntu:~$ sudo usermod -g sigma abhishek
parija@parisUbuntu:~$ sudo usermod -aG linux neha
parija@parisUbuntu:~$  sudo usermod -aG linux abhishek
parija@parisUbuntu:~$ sudo groupadd alpha
parija@parisUbuntu:~$ sudo adduser nikhil

parija@parisUbuntu:~$ sudo usermod -aG linux nikhil
parija@parisUbuntu:~$ sudo usermod -aG alpha priyanshi
parija@parisUbuntu:~$ cat /etc/group



>To change the permissions of a user's home directory so that the user has read, write, and execute access, while other users have no access, the following command can be used:
Code
chmod 700 /home/username

sudo chmod 700 /home/neha
parija@parisUbuntu:~$ sudo chmod 700 /home/vipul
parija@parisUbuntu:~$ sudo chmod 700 /home/abhishek
parija@parisUbuntu:~$ sudo chmod 700 /home/nikhil
parija@parisUbuntu:~$ sudo chmod 700 /home/priyanshi




parija@parisUbuntu:~$ sudo groupdel neha
parija@parisUbuntu:~$ sudo userdel vipul
parija@parisUbuntu:~$ sudo userdel tomy
userdel: group tomy not removed because it has other members.
parija@parisUbuntu:~$ sudo groupdel tomy
parija@parisUbuntu:~$ sudo userdel priyanshi
parija@parisUbuntu:~$ sudo userdel nikhil
parija@parisUbuntu:~$ sudo userdel abhishek
userdel: group abhishek not removed because it is not the primary group of user abhishek.
parija@parisUbuntu:~$ sudo groupdel abhishek
parija@parisUbuntu:~$ ^C
parija@parisUbuntu:~$ sudo adduser neha
info: Adding user `neha' ...
info: Selecting UID/GID from range 1000 to 59999 ...
info: Adding new group `neha' (1002) ...
info: Adding new user `neha' (1002) with group `neha (1002)' ...
warn: The home directory `/home/neha' already exists.  Not touching this directory.
warn: Warning: The home directory `/home/neha' does not belong to the user you are currently creating.
New password: 
BAD PASSWORD: The password is shorter than 8 characters
Retype new password: 
passwd: password updated successfully
Changing the user information for neha
Enter the new value, or press ENTER for the default
	Full Name []: neha
	Room Number []: 
	Work Phone []: 
	Home Phone []: 
	Other []: 
Is the information correct? [Y/n] y
info: Adding new user `neha' to supplemental / extra groups `users' ...
info: Adding user `neha' to group `users' ...
parija@parisUbuntu:~$ sudo adduser vipul
info: Adding user `vipul' ...
info: Selecting UID/GID from range 1000 to 59999 ...
info: Adding new group `vipul' (1003) ...
info: Adding new user `vipul' (1003) with group `vipul (1003)' ...
warn: The home directory `/home/vipul' already exists.  Not touching this directory.
warn: Warning: The home directory `/home/vipul' does not belong to the user you are currently creating.
New password: 
BAD PASSWORD: The password contains the user name in some form
Retype new password: 
passwd: password updated successfully
Changing the user information for vipul
Enter the new value, or press ENTER for the default
	Full Name []: vipul
	Room Number []: 
	Work Phone []: 
	Home Phone []: 
	Other []: 
Is the information correct? [Y/n] y
info: Adding new user `vipul' to supplemental / extra groups `users' ...
info: Adding user `vipul' to group `users' ...
parija@parisUbuntu:~$ sudo adduser abhishek
info: Adding user `abhishek' ...
info: Selecting UID/GID from range 1000 to 59999 ...
info: Adding new group `abhishek' (1004) ...
info: Adding new user `abhishek' (1004) with group `abhishek (1004)' ...
warn: The home directory `/home/abhishek' already exists.  Not touching this directory.
New password: 
BAD PASSWORD: The password contains the user name in some form
Retype new password: 
passwd: password updated successfully
Changing the user information for abhishek
Enter the new value, or press ENTER for the default
	Full Name []: abhishek
	Room Number []: 
	Work Phone []: 
	Home Phone []: 
	Other []: 
Is the information correct? [Y/n] 
info: Adding new user `abhishek' to supplemental / extra groups `users' ...
info: Adding user `abhishek' to group `users' ...
parija@parisUbuntu:~$ sudo groupadd linux
groupadd: group 'linux' already exists
parija@parisUbuntu:~$ cut -d: -f1 /etc/passwrd
cut: /etc/passwrd: No such file or directory
parija@parisUbuntu:~$ cut -d: -f1 /etc/passwd
root
daemon
bin
sys
sync
games
man
lp
mail
news
uucp
proxy
www-data
backup
list
irc
_apt
nobody
systemd-network
systemd-timesync
dhcpcd
messagebus
syslog
systemd-resolve
uuidd
usbmux
tss
systemd-oom
kernoops
whoopsie
dnsmasq
avahi
tcpdump
sssd
speech-dispatcher
cups-pk-helper
fwupd-refresh
saned
geoclue
cups-browsed
hplip
gnome-remote-desktop
polkitd
rtkit
colord
gnome-initial-setup
gdm
nm-openvpn
parija
palak
tom
snapd-range-524288-root
snap_daemon
sshd
neha
vipul
abhishek
parija@parisUbuntu:~$ getent passwd
root:x:0:0:root:/root:/bin/bash
daemon:x:1:1:daemon:/usr/sbin:/usr/sbin/nologin
bin:x:2:2:bin:/bin:/usr/sbin/nologin
sys:x:3:3:sys:/dev:/usr/sbin/nologin
sync:x:4:65534:sync:/bin:/bin/sync
games:x:5:60:games:/usr/games:/usr/sbin/nologin
man:x:6:12:man:/var/cache/man:/usr/sbin/nologin
lp:x:7:7:lp:/var/spool/lpd:/usr/sbin/nologin
mail:x:8:8:mail:/var/mail:/usr/sbin/nologin
news:x:9:9:news:/var/spool/news:/usr/sbin/nologin
uucp:x:10:10:uucp:/var/spool/uucp:/usr/sbin/nologin
proxy:x:13:13:proxy:/bin:/usr/sbin/nologin
www-data:x:33:33:www-data:/var/www:/usr/sbin/nologin
backup:x:34:34:backup:/var/backups:/usr/sbin/nologin
list:x:38:38:Mailing List Manager:/var/list:/usr/sbin/nologin
irc:x:39:39:ircd:/run/ircd:/usr/sbin/nologin
_apt:x:42:65534::/nonexistent:/usr/sbin/nologin
nobody:x:65534:65534:nobody:/nonexistent:/usr/sbin/nologin
systemd-network:x:998:998:systemd Network Management:/:/usr/sbin/nologin
systemd-timesync:x:996:996:systemd Time Synchronization:/:/usr/sbin/nologin
dhcpcd:x:100:65534:DHCP Client Daemon,,,:/usr/lib/dhcpcd:/bin/false
messagebus:x:101:101::/nonexistent:/usr/sbin/nologin
syslog:x:102:102::/nonexistent:/usr/sbin/nologin
systemd-resolve:x:991:991:systemd Resolver:/:/usr/sbin/nologin
uuidd:x:103:103::/run/uuidd:/usr/sbin/nologin
usbmux:x:104:46:usbmux daemon,,,:/var/lib/usbmux:/usr/sbin/nologin
tss:x:105:105:TPM software stack,,,:/var/lib/tpm:/bin/false
systemd-oom:x:990:990:systemd Userspace OOM Killer:/:/usr/sbin/nologin
kernoops:x:106:65534:Kernel Oops Tracking Daemon,,,:/:/usr/sbin/nologin
whoopsie:x:107:109::/nonexistent:/bin/false
dnsmasq:x:999:65534:dnsmasq:/var/lib/misc:/usr/sbin/nologin
avahi:x:108:111:Avahi mDNS daemon,,,:/run/avahi-daemon:/usr/sbin/nologin
tcpdump:x:109:112::/nonexistent:/usr/sbin/nologin
sssd:x:110:113:SSSD system user,,,:/var/lib/sss:/usr/sbin/nologin
speech-dispatcher:x:111:29:Speech Dispatcher,,,:/run/speech-dispatcher:/bin/false
cups-pk-helper:x:112:114:user for cups-pk-helper service,,,:/nonexistent:/usr/sbin/nologin
fwupd-refresh:x:989:989:Firmware update daemon:/var/lib/fwupd:/usr/sbin/nologin
saned:x:113:116::/var/lib/saned:/usr/sbin/nologin
geoclue:x:114:117::/var/lib/geoclue:/usr/sbin/nologin
cups-browsed:x:115:114::/nonexistent:/usr/sbin/nologin
hplip:x:116:7:HPLIP system user,,,:/run/hplip:/bin/false
gnome-remote-desktop:x:988:988:GNOME Remote Desktop:/var/lib/gnome-remote-desktop:/usr/sbin/nologin
polkitd:x:987:987:User for polkitd:/:/usr/sbin/nologin
rtkit:x:117:119:RealtimeKit,,,:/proc:/usr/sbin/nologin
colord:x:118:120:colord colour management daemon,,,:/var/lib/colord:/usr/sbin/nologin
gnome-initial-setup:x:119:65534::/run/gnome-initial-setup/:/bin/false
gdm:x:120:121:Gnome Display Manager:/var/lib/gdm3:/bin/false
nm-openvpn:x:121:122:NetworkManager OpenVPN,,,:/var/lib/openvpn/chroot:/usr/sbin/nologin
parija:x:1000:1000:parija:/home/parija:/bin/bash
palak:x:1001:1005:palak rawat,813,2739,2737,student:/home/palak:/bin/bash
tom:x:1006:1006:tom,67,80,89,student:/home/tom:/bin/bash
snapd-range-524288-root:x:524288:524288::/nonexistent:/usr/bin/false
snap_daemon:x:584788:584788::/nonexistent:/usr/bin/false
sshd:x:122:65534::/run/sshd:/usr/sbin/nologin
neha:x:1002:1002:neha,,,:/home/neha:/bin/bash
vipul:x:1003:1003:vipul,,,:/home/vipul:/bin/bash
abhishek:x:1004:1004:abhishek,,,:/home/abhishek:/bin/bash
parija@parisUbuntu:~$ id neha
uid=1002(neha) gid=1002(neha) groups=1002(neha),100(users)
parija@parisUbuntu:~$ ls -ld /home/*
dr-x------  2 abhishek abhishek 4096 Aug 25 09:31 /home/abhishek
drwxr-x---  2 abhishek abhishek 4096 Aug 13 12:20 /home/aniket
drwxr-x---  3 abhishek abhishek 4096 Aug 14 22:52 /home/dev1
drwxr-x---  2 abhishek abhishek 4096 Aug 14 22:52 /home/dev2
dr-x------  2 abhishek abhishek 4096 Aug 25 09:30 /home/neha
dr-x------  2     1011     1011 4096 Aug 25 09:42 /home/nikhil
drwxr-x---  3 abhishek abhishek 4096 Aug 11 10:24 /home/palak
drwxr-x---  2 abhishek abhishek 4096 Aug 11 09:39 /home/pari
drwxr-x--- 22 parija   parija   4096 Aug 25 16:43 /home/parija
dr--------  2     1012     1012 4096 Aug 25 09:42 /home/priyanshi
drwxr-x---  3 abhishek abhishek 4096 Aug 12 10:56 /home/rachna
drwxr-x---  3 abhishek abhishek 4096 Aug 14 10:23 /home/stuti
drwxr-x---  3 abhishek abhishek 4096 Aug 16 17:07 /home/tom
drwxr-x---  3 abhishek abhishek 4096 Aug 16 23:17 /home/tomy
dr--------  2 abhishek abhishek 4096 Aug 25 09:30 /home/vipul
parija@parisUbuntu:~$ ^C
parija@parisUbuntu:~$ sudo groupdel linux
[sudo] password for parija: 
parija@parisUbuntu:~$ sudo groupdel sigma
parija@parisUbuntu:~$ sudo groupadd linux
parija@parisUbuntu:~$ sudo groupadd sigma
parija@parisUbuntu:~$ sudo usermod -g sigma neha
parija@parisUbuntu:~$ sudo usermod -g linux abhishek
parija@parisUbuntu:~$ sudo usermod -aG linux neha
parija@parisUbuntu:~$ sudo usermod -aG linux abhishek
parija@parisUbuntu:~$ sudo usermod -g sigma abhishek
parija@parisUbuntu:~$ sudo groupadd alpha
groupadd: group 'alpha' already exists
parija@parisUbuntu:~$ sudo adduser nikhil
[sudo] password for parija: 
Sorry, try again.
[sudo] password for parija: 
Sorry, try again.
[sudo] password for parija: 
info: Adding user `nikhil' ...
info: Selecting UID/GID from range 1000 to 59999 ...
info: Adding new group `nikhil' (1007) ...
info: Adding new user `nikhil' (1007) with group `nikhil (1007)' ...
warn: The home directory `/home/nikhil' already exists.  Not touching this directory.
warn: Warning: The home directory `/home/nikhil' does not belong to the user you are currently creating.
New password: 
BAD PASSWORD: The password contains the user name in some form
Retype new password: 
passwd: password updated successfully
Changing the user information for nikhil
Enter the new value, or press ENTER for the default
	Full Name []: nikhil
	Room Number []: 
	Work Phone []: 
	Home Phone []: 
	Other []: 
Is the information correct? [Y/n] y
info: Adding new user `nikhil' to supplemental / extra groups `users' ...
info: Adding user `nikhil' to group `users' ...
parija@parisUbuntu:~$ sudo adduser priyanshi
info: Adding user `priyanshi' ...
info: Selecting UID/GID from range 1000 to 59999 ...
info: Adding new group `priyanshi' (1008) ...
info: Adding new user `priyanshi' (1008) with group `priyanshi (1008)' ...
warn: The home directory `/home/priyanshi' already exists.  Not touching this directory.
warn: Warning: The home directory `/home/priyanshi' does not belong to the user you are currently creating.
New password: 
BAD PASSWORD: The password contains the user name in some form
Retype new password: 
passwd: password updated successfully
Changing the user information for priyanshi
Enter the new value, or press ENTER for the default
	Full Name []: priyanshi
	Room Number []: 
	Work Phone []: 
	Home Phone []: 
	Other []: 
Is the information correct? [Y/n] y
info: Adding new user `priyanshi' to supplemental / extra groups `users' ...
info: Adding user `priyanshi' to group `users' ...
parija@parisUbuntu:~$ sudo usermod -g alpha -aG linux nikhil
parija@parisUbuntu:~$ sudo usermod -g alpha -aG linux priyanshi
parija@parisUbuntu:~$ id nikhil
uid=1007(nikhil) gid=1010(alpha) groups=1010(alpha),100(users),1011(linux)
parija@parisUbuntu:~$ id priyanshi
uid=1008(priyanshi) gid=1010(alpha) groups=1010(alpha),100(users),1011(linux)
parija@parisUbuntu:~$ id vipul
uid=1003(vipul) gid=1003(vipul) groups=1003(vipul),100(users)
parija@parisUbuntu:~$ id neha
uid=1002(neha) gid=1012(sigma) groups=1012(sigma),100(users),1011(linux)
parija@parisUbuntu:~$ sudo chgrp sigma /home/neha
parija@parisUbuntu:~$ sudo chgrp sigma /home/abhishek
parija@parisUbuntu:~$ sudo chgrp alpha /home/nikhil
parija@parisUbuntu:~$ sudo chgrp alpha /home/priyanshi
parija@parisUbuntu:~$ sudo chmod 751 /home/neha /home/abhishek /home/nikhil /home/priyanshi
parija@parisUbuntu:~$ ls -ld /home/*
drwxr-x--x  2 abhishek sigma    4096 Aug 25 09:31 /home/abhishek
drwxr-x---  2 abhishek abhishek 4096 Aug 13 12:20 /home/aniket
drwxr-x---  3 abhishek abhishek 4096 Aug 14 22:52 /home/dev1
drwxr-x---  2 abhishek abhishek 4096 Aug 14 22:52 /home/dev2
drwxr-x--x  2 abhishek sigma    4096 Aug 25 09:30 /home/neha
drwxr-x--x  2     1011 alpha    4096 Aug 25 09:42 /home/nikhil
drwxr-x---  3 abhishek abhishek 4096 Aug 11 10:24 /home/palak
drwxr-x---  2 abhishek abhishek 4096 Aug 11 09:39 /home/pari
drwxr-x--- 22 parija   parija   4096 Aug 25 16:43 /home/parija
drwxr-x--x  2     1012 alpha    4096 Aug 25 09:42 /home/priyanshi
drwxr-x---  3 abhishek abhishek 4096 Aug 12 10:56 /home/rachna
drwxr-x---  3 abhishek abhishek 4096 Aug 14 10:23 /home/stuti
drwxr-x---  3 abhishek abhishek 4096 Aug 16 17:07 /home/tom
drwxr-x---  3 abhishek abhishek 4096 Aug 16 23:17 /home/tomy
dr--------  2 abhishek abhishek 4096 Aug 25 09:30 /home/vipul
parija@parisUbuntu:~$ sudo mkdir -p /teams/sigma /teams/alpha
parija@parisUbuntu:~$ sudo mkdir -p /linux
parija@parisUbuntu:~$ sudo chgrp sigma /teams/sigma
parija@parisUbuntu:~$ sudo chgrp slpha /teams/alpha
chgrp: invalid group: ‘slpha’
parija@parisUbuntu:~$ sudo chgrp alpha /teams/alpha
parija@parisUbuntu:~$ sudo chmod 2770 /teams/sigma
parija@parisUbuntu:~$ sudo chmod 2770 /teams/alpha
parija@parisUbuntu:~$ sudo chmod 2770 /linux
parija@parisUbuntu:~$ ls -ld /teams/* 
drwxrws--- 2 root alpha 4096 Aug 25 18:41 /teams/alpha
drwxrws--- 2 root sigma 4096 Aug 25 18:41 /teams/sigma
parija@parisUbuntu:~$ ls -ld /linux*
drwxrws--- 2 root root 4096 Aug 25 18:41 /linux
parija@parisUbuntu:~$ ^C
parija@parisUbuntu:~$ getent group linux
linux:x:1011:neha,abhishek,nikhil,priyanshi
parija@parisUbuntu:~$ sudo -u nikhil ls /teams/sigma
ls: cannot open directory '/teams/sigma': Permission denied
parija@parisUbuntu:~$ sudo -u neha ls /teams/sigma
parija@parisUbuntu:~$ sudo -u vipul ls /teams/sigma || echo "not accessible"
ls: cannot open directory '/teams/sigma': Permission denied
not accessible
parija@parisUbuntu:~$ sudo usermod -s /usr/sbin/nologin vipul
[sudo] password for parija: 
parija@parisUbuntu:~$ sudo chage -d 0 abhishek
parija@parisUbuntu:~$ sudo passwd nikhil
New password: 
BAD PASSWORD: The password fails the dictionary check - it is too simplistic/systematic
Retype new password: 
Sorry, passwords do not match.
New password: 
BAD PASSWORD: The password contains the user name in some form
Retype new password: 
passwd: password updated successfully
parija@parisUbuntu:~$ getent passwd neha vipul abhishek nikhil priyanshi
neha:x:1002:1012:neha,,,:/home/neha:/bin/bash
vipul:x:1003:1003:vipul,,,:/home/vipul:/usr/sbin/nologin
abhishek:x:1004:1012:abhishek,,,:/home/abhishek:/bin/bash
nikhil:x:1007:1010:nikhil,,,:/home/nikhil:/bin/bash
priyanshi:x:1008:1010:priyanshi,,,:/home/priyanshi:/bin/bash
parija@parisUbuntu:~$ 


