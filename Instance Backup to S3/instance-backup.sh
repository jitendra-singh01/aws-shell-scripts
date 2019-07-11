#script 2 - Creates backup of /var and /etc dir and upload it to s3 (works with crontab (i.e script1))

date=$(date "+%d-%b-20%y")
# date variable contains the date on which backup is being created in the format of date - month - year.

tar -cvzf $date-backup.tar.gz /var /etc 
# Creates tar ball of /var and /etc dir.

sudo rm -rf /home/ec2-user/backup/*
# Removes the old backup's stored in /home/ec2-user/backup dir.

sudo mv $date-backup.tar.gz /home/ec2-user/backup
# moving the backup to /home/ec2-user/backup dir.

aws s3 cp /home/ec2-user/backup s3://bucket-name/ --recursive

