#script 2 - Creates backup of /var and /etc dir and stores it to EFS (works with crontab (i.e script1))

date=$(date "+%d-%b-20%y")
# date variable contains the date on which backup is being created in the format of date - month - year.

tar -cvzf $date-backup.tar.gz /var /etc 
# Creates tar ball of /var and /etc dir.

sudo rm -rf /home/ec2-user/backup/*
# Removes the old backup's stored in /home/ec2-user/backup dir.

sudo mv $date-backup.tar.gz /mnt/efs/instance1
# moving the backup to the EFS Mounted file system
# If we have more than one instance we can create a seprate dir to store the backup.

