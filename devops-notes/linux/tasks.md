##tasks


//////////////////////////////////////
### task realted to user management
\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

\\QUESTION

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
    
    
    
    
///////////////////////////////    
### task related to awk command
\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\


\\QUESTION 
1. Print the Whole File 
2. Print while file but skip the Header 
3. Print Only Names and Marks
4. Filter: Students with Marks > 70
5. Count How Many Students Scored > 60
6. Print Names of Students Who Failed
7. Calculate Average Marks
8. Print a Message Based on Grade
9. Rename the Grades 
10. Count Students Per Grade
11. Print Names of Students Aged 18 or Younger
12. Show Only Students with a Grade of A or
13. Highlight Students with Marks Between 50 and 75
14. Print a Custom Message per Student with Name and Result
15. Print the Length of Each Student’s Name
16. Find the Student with the Highest Marks
17. Add a Pass/Fail Column to Output
18. Format Output Using printf for Alignment
19. Sort Students by Marks (requires sort)
20. Group Students by Age and Count How Many per Age



#1
`awk '{print}' student.data`

Name	Age	Marks	Grade
Alice	18	85	A
Bob	    19	58	C
Charlie	17	72	B
David	18	91	A
Eva	    20	40	F
Frank	21	66	B
Grace	19	78	B
Henry	18	33	F
Ivy	    20	95	A
Jake	17	49	D
Kara	22	82	A
Leo	    21	60	C
Mona	18	71	B
Nina	20	88	A
Oscar	19	55	C
Paul	20	47	D
Quinn	18	59	C
Rita	21	93	A
Sam	    22	36	F
Tina	19	74	B

#2
`awk 'NR>=2' student.data`

Alice	18	85	A
Bob	19	58	C
Charlie	17	72	B
David	18	91	A
Eva	    20	40	F
Frank	21	66	B
Grace	19	78	B
Henry	18	33	F
Ivy	    20	95	A
Jake	17	49	D
Kara	22	82	A
Leo	    21	60	C
Mona	18	71	B
Nina	20	88	A
Oscar	19	55	C
Paul	20	47	D
Quinn	18	59	C
Rita	21	93	A
Sam	    22	36	F
Tina	19	74	B


#3
`awk '{print $1,$3}' student.data`

Name Marks
Alice 85
Bob 58
Charlie 72
David 91
Eva 40
Frank 66
Grace 78
Henry 33
Ivy 95
Jake 49
Kara 82
Leo 60
Mona 71
Nina 88
Oscar 55
Paul 47
Quinn 59
Rita 93
Sam 36
Tina 74


#4
`awk '$3 > 70 { print $0}' student.data`

Name	Age	Marks	Grade
Alice	18	85	A
Charlie	17	72	B
David	18	91	A
Grace	19	78	B
Ivy	20	95	A
Kara	22	82	A
Mona	18	71	B
Nina	20	88	A
Rita	21	93	A
Tina	19	74	B

#5

`awk '$3 > 60 {count++}  END { print count }' student.data`
12

#6
`awk '$4 == "F" { print $1 }' student.data`

Eva
Henry
Sam

#7

`awk '{sum += $3; count++ } END { print sum/count  }' student.data`
63.4286

#8

$ awk '{
> if ($4 == "A") {
> print $1 ": Excellent"
> }else if ($4 == "B") {
> print $1 ": very good"
> }else if ($4 == "C") {
> print $1 ": good"
> } else if ($4 == "D") {
> print $1 ": need improvement"
> } else if ($4 == "F"){
> print $1 ": fail"
> }
> }' student.data
Alice: Excellent
Bob: good
Charlie: very good
David: Excellent
Eva: fail
Frank: very good
Grace: very good
Henry: fail
Ivy: Excellent
Jake: need improvement
Kara: Excellent
Leo: good
Mona: very good
Nina: Excellent
Oscar: good
Paul: need improvement
Quinn: good
Rita: Excellent
Sam: fail
Tina: very good


#9
awk '{if ($4 == "A") $4 = "Excellent"
else if ($4 == "B") $4 = "Good"
else if ($4 == "C") $4 = "Average"
else if ($4 == "F") $4 = "Fail"
print                          
}' student.data
Name	Age	Marks	Grade
Alice 18 85 Excellent
Bob 19 58 Average
Charlie 17 72 Good
David 18 91 Excellent
Eva 20 40 Fail
Frank 21 66 Good
Grace 19 78 Good
Henry 18 33 Fail
Ivy 20 95 Excellent
Jake	17	49	D
Kara 22 82 Excellent
Leo 21 60 Average
Mona 18 71 Good
Nina 20 88 Excellent
Oscar 19 55 Average
Paul	20	47	D
Quinn 18 59 Average
Rita 21 93 Excellent
Sam 22 36 Fail
Tina 19 74 Good
parija@parisUbuntu:~$ 

#10
parija@parisUbuntu:~$ awk '{count[$4]++} END{for (Grade in count) print "Grade " Grade ": " count[Grade]}' student.data 
Grade B: 5
Grade A: 6
Grade D: 2
Grade Grade: 1
Grade C: 4
Grade F: 3

#11
parija@parisUbuntu:~$  awk '$2 <= 18 {print $1}' student.data 
Alice
Charlie
David
Henry
Jake
Mona
Quinn

#12
parija@parisUbuntu:~$ awk '$4 == "A" {print $1}' student.data
Alice
David
Ivy
Kara
Nina
Rita

#13 

parija@parisUbuntu:~$ awk '$3 > 50 && $3 < 75 {print $1, $3}' student.data
Bob 58
Charlie 72
Frank 66
Leo 60
Mona 71
Oscar 55
Quinn 59
Tina 74

#14
parija@parisUbuntu:~$ awk '{ name = $1 " " $2;
if ($3 >=33) {
print " you have passed with grade : " $4 
} else { 
print " keep trying you have failed"
}
}' student.data
 you have passed with grade : Grade
 you have passed with grade : A
 you have passed with grade : C
 you have passed with grade : B
 you have passed with grade : A
 you have passed with grade : F
 you have passed with grade : B
 you have passed with grade : B
 you have passed with grade : F
 you have passed with grade : A
 you have passed with grade : D
 you have passed with grade : A
 you have passed with grade : C
 you have passed with grade : B
 you have passed with grade : A
 you have passed with grade : C
 you have passed with grade : D
 you have passed with grade : C
 you have passed with grade : A
 you have passed with grade : F
 you have passed with grade : B

#15
parija@parisUbuntu:~$ awk '{ name = $1;
> print name, length(name);
> }' student.data
Name 4
Alice 5
Bob 3
Charlie 7
David 5
Eva 3
Frank 5
Grace 5
Henry 5
Ivy 3
Jake 4
Kara 4
Leo 3
Mona 4
Nina 4
Oscar 5
Paul 4
Quinn 5
Rita 4
Sam 3
Tina 4

#16




Q You’re adding a stopwatch function to the assistant that counts up from 1 to a given number (e.g., 5 seconds) to track how long something has been running.

Use a while loop to start from 1 and count up to 5.
Print each second like: "Stopwatch: 1 second elapsed"
At the end, print: "Stopwatch complete!"

Sample output:
Stopwatch: 1 second elapsed
Stopwatch: 2 seconds elapsed
Stopwatch: 3 seconds elapsed
Stopwatch: 4 seconds elapsed
Stopwatch: 5 seconds elapsed
Stopwatch complete!

#!/bin/sh
logfile="/home/parija/script.log"
datetime=$(date "+Y-%m-%d %H:%M:%S")
echo " this will tell you the number of times this script executes "
echo "------------------------------------------------------------"
echo "This script was executed on $datetime"
if [ ! -f "$logfile" ]; then
        count=1;
else
        count=$(( $(wc -l < "$logfile") + 1 ))
fi

echo "$count | $datetime" >> "$logfile"
echo "This script has been executed $count times."



Q Create a shell script to generate a star, it will take 2 arguments size & type
            -> in pattern.sh


#### random 10 tasks to be done :
            Task 1:
            Write a bash script that:
            Creates a new user
            Adds the user to a specific group
            Sets up SSH access for the user (with public key authentication)
            Sets custom umask and shell configs
            Restricts sudo privileges to a minimal set
            Logs all actions to a log file


            Task 2:
            Monitor disk, memory, and CPU usage using a cronjob every 10 minutes.
            If disk usage > 85%, RAM < 200MB, or CPU > 90%, send an email (or log the issue).
            Output logs to a dedicated /var/log/sys_monitor.log.

            Task 3:
            Archive a specific directory (/var/www/html or /home/)
            Use scp to transfer it securely to a remote backup server using SSH key auth
            Set up a cronjob for daily execution and log rotation


            Task 4: 
            Write a bash script that:
            Checks if a website is up (via curl)
            Logs response codes, page load times
            Sends an alert email or logs if the site is unreachable


            Task 5: Implement a Mini Firewall using iptables or ufw
            Set up basic iptables or ufw rules:
            Allow SSH only from specific IP
            Block all incoming connections except HTTP/HTTPS
            Rate-limit connections on SSH to prevent brute force attacks
            Save and persist the configuration


            Task 6: 
            Simulate a Zombie & Orphan Process Tree 
            Write a small bash script to:
            Spawn child processes
            Terminate the parent prematurely to create orphan
            Use signals (kill -9) to generate zombie processes
            Monitor with ps -el | grep Z or top


            Task 7: 
            Create a Log Analyzer Script 
            Analyze /var/log/auth.log or /var/log/syslog Extract:
            Failed login attempts
            IP addresses trying brute-force attacks
            Usernames targeted
            Generate a summarized report with top IPs, usernames, and timestamps
            Optional: Block IPs using iptables or fail2ban


            Task 8. 
            Build a Local Package Installer Tool 
            Create a bash script:
            Reads a list of packages from packages.txt
            Checks if each is installed
            Installs missing packages
            Logs the status (success/failure) of each


            Task 9. 
            Deploy a Custom Service with systemd 
            Write a custom bash script or Python app (e.g., a dummy logging service)
            Create a .service file under /etc/systemd/system/
            Enable, start, and monitor the service using systemctl
            Set it to restart on failure and log to journald


            Task 10. 
            Host a Static Website with Nginx + SSH Deployment 
            Install and configure Nginx to serve a static HTML site
            Use scp to deploy HTML files to the server
            Set up directory permissions
            Automate deployment via bash or Makefile
            Secure Nginx with firewall rules and fail2ban
            
            jello
