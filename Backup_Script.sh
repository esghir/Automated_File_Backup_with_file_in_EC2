#!/bin/bash
# Directory to backup
BACKIP_DIR="/home/ubuntu/remote_dev/backups"

# S3 bucket name 
S3_BUCKET="s3ec2backups/buckup_folder"

# generate Timestamp for file naming
TIMESTAMP=$(date +"%Y-%m-%d8%H-%M-%S")

# Archive file name
ARCHIVE_FILE="/tmp/backup_$TIMESTAMP.tar.gz"

#Compress the file
tar -czf $ARCHIVE_FILE -C $BACKIP_DIR .

# upload to S3
aws s3 cp $ARCHIVE_FILE s3://$S3_BUCKET/

# remove local archive to save space
rm $ARCHIVE_FILE