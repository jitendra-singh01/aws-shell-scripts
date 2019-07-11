aws ec2 describe-volumes --region us-east-1 --query "Volumes[*].{ID:VolumeId}" > volume-id.txt
a=1
for i in $(cat volume-id.txt)
{
aws ec2 create-snapshot --volume-id $i --description "This is my root volume snapshot" --tag-specifications --tag-specifications 'ResourceType=snapshot,Tags=[{Key=Name,Value=snap'$a-$i'},{Key=snap,Value=backup}]'
a=$((a+1))
sleep 60
}
aws ec2 describe-snapshots --region us-east-1 --filter Name=tag:snap,Values=backup --query "Snapshots[*].{ID:SnapshotId}" > snap-tag.txt
for s in $(cat snap-tag.txt)
{
aws --region us-west-2 ec2 copy-snapshot --source-region us-east-1 --source-snapshot-id $s --description "This is my copied snapshot."
}
