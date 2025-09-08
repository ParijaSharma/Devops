##tasks

    {Create user named neha, vipul and abhishek
    create group named linux
    Create group named sigma
    Change neha and abhishek primary group to sigma
    change neha and abhishek secondary group to linux
    create group named alpha
    create user nkhil and priyashi and add them to linux and aplha group with single command
    Change all user home directory permission to
    A user should have read,write, execute access to home directory
    All the users of same team should have read and excute access to home directory of fellow team members.
    others should have only execute permission to user's home directory
    create these directory structure for all user
    home directory of user
    team
    linux
    change permission for team directory only team members have full access
    change permission for linux directory only linux trainer have full access
    check if alpha team user can access sigma team directory.
    check vipul user can access sigma or
    change vipul user shell to make it service user.
    force abhishek user to change its password on next login.
    change nikhil user password.
    list all user and group you have created
    check which shell is added to neha user as default.
    check the deafult permission of file and directory and how to change it
    now delete vipul user.
    delete linux group.}

* User Management
Create users:
        sudo useradd -m neha
        sudo useradd -m vipul
        sudo useradd -m abhishek
        sudo useradd -m nikhil
        sudo useradd -m priyashigv
Modify users:
1. Change primary group of neha and abhishek → sigma
        sudo usermod -g sigma neha
        id neha
        uid=1007(neha) gid=1012(sigma) groups=1012(sigma)
        
        sudo usermod -g sigma abhishek
        id abhishek
        uid=1009(abhishek) gid=1012(sigma) groups=1012(sigma)
        
    Add secondary group linux to neha and abhishek
        sudo usermod -aG linux neha
        id neha
        uid=1007(neha) gid=1012(sigma) groups=1012(sigma),1015(linux)
        sudo usermod -aG linux abhishek
        id abhishek
        uid=1009(abhishek) gid=1012(sigma) groups=1012(sigma),1015(linux)

    Add nikhil and priyashi to groups linux and alpha in single command
        sudo usermod -aG linux,alpha nikhil
        id nikhil
        uid=1011(nikhil) gid=1007(nikhil) groups=1007(nikhil),1010(alpha),1015(linux)
        sudo usermod -aG linux,alpha priyanshi
        id priyanshi
        uid=1010(priyanshi) gid=1014(priyanshi) groups=1014(priyanshi),1010(alpha),1015(linux)
        
    Change shell of vipul to make it service user
        sudo chsh -s /sbin/nologin vipul
        grep vipul /etc/passwd
        vipul:x:1008:1008::/home/vipul:/sbin/nologin

    force abhishek to reset password on next login
         sudo -i
        [sudo] password for parija: 
        root@parisUbuntu:~# passwd -e abhishek
        passwd: password changed.
        root@parisUbuntu:~# exit
        logout

2. Group Management:
    create groups: linux sigma alpha
    Delete groups:
    linux

        sudo groupadd linux
        groupadd: group 'linux' already exists
        parija@parisUbuntu:~$ sudo groupadd sigma
        groupadd: group 'sigma' already exists
        parija@parisUbuntu:~$ sudo groupadd alpha
        groupadd: group 'alpha' already exists
        parija@parisUbuntu:~$ sudo groupdel linux
        
3. Permissions & Directory Setup

Change home directory permissions:

User: rwx
Team members (same group): r-x
Others: --x
        parija@parisUbuntu:~$ sudo groupdel linux
        parija@parisUbuntu:~$ sudo chmod 751 /home/neha
        parija@parisUbuntu:~$ sudo chmod 751 /home/vipul
        parija@parisUbuntu:~$ sudo chmod 751 /home/abhishek
        parija@parisUbuntu:~$ sudo chmod 751 /home/priyanshi
        parija@parisUbuntu:~$ sudo chmod 751 /home/nikhil

Create directory structure inside each user’s home:
        sudo mkdir -p /home/neha/team 
        parija@parisUbuntu:~$ sudo mkdir -p /home/neha/linux
        parija@parisUbuntu:~$ sudo mkdir -p /home/abhishek/team /home/abhishek/linux 
        parija@parisUbuntu:~$ sudo mkdir -p /home/vipul/team /home/vipul/linux
        parija@parisUbuntu:~$ sudo mkdir -p /home/priyanshi/team /home/priyanshi/linux
        parija@parisUbuntu:~$ sudo mkdir -p /home/nikhil/team /home/nikhil/linux 
        
Set directory permissions:
team: only team members → full access
linux: only linux trainer → full access

            id -a  neha vipul abhishek priyanshi nikhil
            uid=1007(neha) gid=1012(sigma) groups=1012(sigma)
            uid=1008(vipul) gid=1008(vipul) groups=1008(vipul)
            uid=1009(abhishek) gid=1012(sigma) groups=1012(sigma)
            uid=1010(priyanshi) gid=1014(priyanshi) groups=1014(priyanshi),1010(alpha)
            uid=1011(nikhil) gid=1007(nikhil) groups=1007(nikhil),1010(alpha)

            parija@parisUbuntu:~$ sudo chown neha:sigma /home/neha/team
            [sudo] password for parija: 
            parija@parisUbuntu:~$ sudo chmod 770 /home/neha/team
            parija@parisUbuntu:~$ sudo chown vipul:linux /home/vipul/team
            chown: invalid group: ‘vipul:linux’
            parija@parisUbuntu:~$ sudo chown abhishek:sigma /home/abhishek/team
            parija@parisUbuntu:~$ sudo chmod 770 /home/abhishek/team
            parija@parisUbuntu:~$ sudo chown priyanshi:alpha /home/priyanshi/team
            parija@parisUbuntu:~$ sudo chown nikhil:alpha /home/nikhil/team
            parija@parisUbuntu:~$ sudo chmod 770 /home/nikhil/team
            parija@parisUbuntu:~$ sudo chown vipul:linux /home/neha/linux
            chown: invalid group: ‘vipul:linux’
            parija@parisUbuntu:~$ sudo usermod -aG linux vipul
            usermod: group 'linux' does not exist
            parija@parisUbuntu:~$ sudo groupadd linux
            parija@parisUbuntu:~$ sudo usermod -aG linux vipul
            parija@parisUbuntu:~$ sudo chown vipul:linux /home/neha/linux
            parija@parisUbuntu:~$ sudo chmod 770 /home/priyanshi/team
            parija@parisUbuntu:~$ sudo chown vipul:vipul /home/neha/linux
            parija@parisUbuntu:~$ sudo chmod 700 /home/neha/linux
            parija@parisUbuntu:~$ sudo chown vipul:vipul /home/abhishek/linux
            parija@parisUbuntu:~$ sudo chmod 700 /home/abhishek/linux
            parija@parisUbuntu:~$ sudo chown vipul:vipul /home/priyanshi/linux
            parija@parisUbuntu:~$ sudo chmod 700 /home/priyanshi/linux
            parija@parisUbuntu:~$ sudo chown vipul:vipul /home/nikhil/linux
            parija@parisUbuntu:~$ sudo chmod 700 /home/nikhil/linux
            parija@parisUbuntu:~$  sudo chown vipul:vipul /home/vipul/linux
            parija@parisUbuntu:~$ sudo chmod 700 /home/vipul/linux


4. Verification Tasks

    Check if alpha team user can access sigma team directory
            sudo -u priyanshi ls /home/neha/team
        ls: cannot open directory '/home/neha/team': Permission denied
    
    Check if vipul can access sigma directory
        sudo -u vipul ls /home/abhishek/team
        ls: cannot open directory '/home/abhishek/team': Permission denied

    List all created users and groups
        id -a  neha vipul abhishek priyanshi nikhil
        uid=1007(neha) gid=1012(sigma) groups=1012(sigma)
        uid=1008(vipul) gid=1008(vipul) groups=1008(vipul),1015(linux)
        uid=1009(abhishek) gid=1012(sigma) groups=1012(sigma)
        uid=1010(priyanshi) gid=1014(priyanshi) groups=1014(priyanshi),1010(alpha)
        uid=1011(nikhil) gid=1007(nikhil) groups=1007(nikhil),1010(alpha)
        
    Check which shell is assigned to neha
        parija@parisUbuntu:~$ grep "neha" /etc/passwd
        neha:x:1007:1012::/home/neha:/bin/sh

    Check default permissions (umask) for new files and directories, and how to change it
#The umask command in Linux is used to set default permissions for files or directories the user creates.



5. Cleanup

    Delete user vipul
    Delete group linux
    
