#!/bin/bash
#This script will list the resources in the AWS account
# Author : Dharani/Devops Team
#Version: v0.0.1

#Following are the supported AWS services by the script 
# 1. EC2
# 2. RDS
# 3. S3
# 4. CloudFront
# 5. VPC
# 6. IAM
# 7. Route53
# 8. CloudWatch
# 9. CloudFormation
# 10. Lambda
# 11. SNS
# 12. SQS
# 13. DynamoDB
# 14. VPC
# 15. EBS

# Usage: ./aws_resouces_list.sh <region> <service_name>
# Example: ./aws_resources_list.sh us-east-1 ec2
# Check if the required number of arguments are passed
if [ $# -ne 2 ]; then
    echo "Usage: ./aws_resources_list.sh  <1> <aws_service>"
    echo "Example: ./aws_resources_list.sh us-east-1 ec2"
    exit 1
fi

# Check if the AWS CLI is installed
if ! command -v aws &> /dev/null; then
    echo "AWS CLI is not installed. Please install the AWS CLI and try again."
    exit 1
fi
# Check if the AWS CLI is configured
if [ ! -d ~/.aws ]; then
    echo "AWS CLI is not configured. Please configure the AWS CLI and try again."
    exit 1
fi
# List the resources based on the service
case $aws_service in 
    ec2)
        aws ec2 describe-instances --region $1
        ;;
    rds)
        aws rds describe-db-instances --region $1
        ;;
    s3)
        aws s3api list-buckets --region $1
        ;;
    cloudfront)
        aws cloudfront list-distributions --region $1
        ;;
    vpc)
        aws ec2 describe-vpcs --region $1
        ;;
    iam)
        aws iam list-users --region $1
        ;;
    route5)
        aws route53 list-hosted-zones --region $1
        ;;
    cloudwatch)
        aws cloudwatch describe-alarms --region $1
        ;;
    cloudformation)
        aws cloudformation describe-stacks --region $1
        ;;
    lambda)
        aws lambda list-functions --region $1
        ;;
    sns)
        aws sns list-topics --region $1
        ;;
    sqs)
        aws sqs list-queues --region $1
        ;;
    dynamodb)
        aws dynamodb list-tables --region $1
        ;;
    ebs)
        aws ec2 describe-volumes --region $1
        ;;
    *)
        echo "Invalid service. Please enter a valid service."
        exit 1
        ;;
esac