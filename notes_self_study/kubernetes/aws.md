# AWS with EKS

## Connect to EC2 via SSH

1. Generate key pair from the AWS console, and cd to whereever it's downloaded
2. Run `chmod go-rwx <key-pair-filename>.pem`
3. Run `ssh -i <key-pair-filename>.pem ec2-user@<EC2-IPv4>`
