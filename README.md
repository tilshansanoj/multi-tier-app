

# Introduction

This is a simple multi-tier application written with Node JS. The architecture of the web-application can be found [here](https://github.com/tilshansanoj/wa-technical-assessment/blob/main/architecture/Architecture.png)


# Prerequisites 

1.  **AWS Account**: Ensure you have an AWS account.
2.  **Terraform Installed**: Ensure Terraform is installed on your local machine. If not, download and install it from the Terraform website.
3.  **AWS CLI Configured**: Ensure your AWS CLI is configured with your credentials.

## Getting started with the Virtual Machine

 1. **Create a Terraform Configuration File**: Create a file named [main.tf](https://github.com/tilshansanoj/wa-technical-assessment/blob/main/provisioning/main.tf) in your directory. This file will contain the configuration for your EC2 instance.
 2. . **Initialize Terraform**: Run the following command to initialize your Terraform directory. This will download the necessary provider plugins (in this case, AWS).
 `terraform init`
 3. **Create the execution plan**: Run this command to create an execution plan, which previews the changes Terraform will make to your infrastructure.
 `terraform plan`
 4. **Apply the configuration**: Run this command to apply the configuration and provision the EC2 instance.
 `terraform apply -auto-approve`
 5. **Access the EC2 Instance**: After the instance is created, Terraform will output the public IP address and the private ssh key of the EC2 instance. You can use this to connect to the instance.
 `ssh -i /path/to/ssh/key ubuntu@<instance_ip>`
