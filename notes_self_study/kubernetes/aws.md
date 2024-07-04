# AWS with EKS

## Connect to EC2 via SSH

1. Generate key pair from the AWS console, and cd to whereever it's downloaded
2. Run `chmod go-rwx <key-pair-filename>.pem`
3. Run `ssh -i <key-pair-filename>.pem ec2-user@<EC2-IPv4>`

## Install eksctl on Linux

```
curl --silent --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp
```
```
sudo mv /tmp/eksctl /usr/local/bin
```
```
eksctl version
```
