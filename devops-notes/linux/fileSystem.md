#### FILE SYSTEM

        os store and manage data on disk or partitions using a structure called FileSystem
        FileSystem inludes files directories and related permissions
        
                   / (root directory)
                   |
   -------------------------------------------------
   |       |        |        |       |       |     |
 /bin    /boot    /dev     /etc    /home   /lib   /media
   |                |        |       |       |
   |                |        |       |       |----> Removable media
   |                |        |       |              (USB, CD-ROM)
   |                |        |       |
   |                |        |       |----> User directories
   |                |        |              (/home/user1, /home/user2)
   |                |        |
   |                |        |----> Configuration files
   |                |
   |                |----> Kernel & boot loader files
   |
   -------------------------------------------------
   |       |         |         |         |         |
 /mnt    /opt     /proc     /root     /run     /sbin
   |                 |         |         |         |
   |----> Mount pts  |         |         |----> System binaries
                     |         |
                     |         |----> Root user home
                     |
                     |----> Kernel & process info
   -------------------------------------------------
   |        |          |           |
 /srv     /sys       /tmp        /usr
             |                     |
             |                     |----> User binaries, docs, libraries
             |
             |----> System devices info
   -------------------------------------------------
               |
             /var
               |
               |----> Logs, spool files, mail, etc.

# types of file system 
        . ext3
        . ext4
        . XFS
        . FAT
        
# how to check your linux FileSystem?
        . isblk -f
        . df -Th
        . cat /etc/fstab
        
#XFS vs ext4  
EXT4 → Reliable, simple, and widely compatible — good for most users.

XFS → Optimized for high performance and large FileSystems, ideal for enterprise and server environments.

### What is inode?
        an inode in linux is a data structure that stores metadeta about a file or directory .
        the filesystem uses inode number to locate the inode which contains pointers to the data blocks where the actual file data is stored
        
#FileStructure ;
1. root directory (/) :
from which all the other files and directories branch out /bin 
The only root user has the right to write under this directory.
/root is the root user’s home directory, which is not the same as /
For example, if you attempt to create a file in / as a non-root user, you’ll encounter a "Permission Denied" error.

2. /bin : 
it contains essential commands and binaries needed by all users, including cp, ls, ssh, and kill.
Common linux commands you need to use in single-user modes are located under this directory.

3. /boot :
This directory stores all files required for booting the system. It includes the GRUB bootloader configuration and essential kernel files that are loaded during startup. 

4. /dev :
Device files in Linux are stored in the /dev directory. These are special files These are special files that act as interfaces between hardware and software

5. /etc :
Short for "Editable Text Configuration," /etc contains configuration files for system applications, users, services, and tools or it contains the Host-specific system-wide configuration files.

6. /home :
Every non-root user has a personal directory inside /home. 
Home directories for all users to store their personal files, containing saved files, personal settings, etc..

7. /lib:
Applications require shared libraries to run, which are stored in /lib.

8. /media:
Devices like USBs, CDs, and pen drives are mounted under /media.

9. /mnt :
When external drives are connected, they are temporarily mounted in /mnt. 

10. /opt : 
Third-party software and packages not part of the default system installation are stored in /opt.
