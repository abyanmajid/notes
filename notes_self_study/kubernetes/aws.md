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

## IAM inline policy for EKS full access

```json
{
	"Version": "2012-10-17",
	"Statement": [
		{
			"Effect": "Allow",
			"Action": "eks:*",
			"Resource": "*"
		},
		{
			"Action": [
				"ssm:GetParameter",
				"ssm:GetParameters"
			],
			"Resource": "*",
			"Effect": "Allow"
		}
	]
}
```

## Installing `kubectl` on AWS EC2 CLI

MAKE SURE 1.30.0 is as per the version in EC2, replace it where necessary

```
export RELEASE=1.30.0
curl -LO https://storage.googleapis.com/kubernetes-release/release/v$RELEASE/bin/linux/amd64/kubectl
chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl
```

## `eksctl` commands

- `eksctl create cluster --name <cluster-name> --nodes-min=<# nodes>` : create a new cluster
