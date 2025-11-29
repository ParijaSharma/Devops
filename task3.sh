#!/bin/bash

#Archive a specific directory (/var/www/html or /home/)
#Use scp to transfer it securely to a remote backup server using SSH key auth
#Set up a cronjob for daily execution and log rotation
echo "-----------------------------"
echo "daily automated backup system"
echo "-----------------------------"
SourceDir="/var/www/html"
BackupDir="/tmp"
RemoteUser="backupuser"
RemoteHost="parisUbuntu"
RemoteDir="/home/backup/backups"
Date=$(date +"%Y-%m-%d")
BackupFile="backup_$Date.tar.gz"
LogFile="/var/log/task3.log"
SSHKey="/home/parija/.ssh/id_rsa"

if [ ! -f "$SSHKey" ]; then
    echo "ERROR: SSH key not found at $SSHKey" >> $LogFile
    exit 1
fi

echo "[$(date)] backup started." >> $LogFile
tar czf $BackupDir/$BackupFile $SourceDir 2>> $LogFile
if [ $? -ne 0 ]; then
	echo "Error - failed to archieve" >> $LogFile

	exit 1
fi
echo " Archieve created: $BackupFile" >> $LogFile

echo " coping file to the remote server..." >> $LogFile

scp -i $SSHKey  $BackupDir/$BackupFile $RemoteUser@$RemoteHost:$RemoteDir >> $LogFile 2>&1

if [ $? -ne 0 ] 
then
	echo "Error: scp transfer failed" >> $LogFile
	exit 1
fi
echo "SCP transfer successful!" >> $LogFile







