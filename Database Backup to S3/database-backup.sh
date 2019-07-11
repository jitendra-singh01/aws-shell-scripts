#script 2 - Exports database and upload it to s3 (works with crontab (i.e script1))

date=$(date "+%d-%b-20%y")
# date variable contains the date on which backup is being created in the format of date - month - year.

rm -rf /home/ec2-user/backup/*
# Remove old backup present in the backup dir which was created by older backup.

dbname=mysqldb
# database name to export.

mysqldump  $dbname1 > /home/ec2-user/backup/$dbname1-$date.sql
# using mysqldump to export database

aws s3 cp /home/ec2-user/backup/ s3://bucket-name --recursive
# copying the backup to s3 bucket.