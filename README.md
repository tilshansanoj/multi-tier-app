

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
## Step 2: Basic Server Setup with a Bash Script.

To perform a basic server setup using a Bash script, you can automate the installation of necessary packages and perform common configurations on your EC2 instance. Below is an example of a Bash script that:

1.  Updates the package manager.
2.  Installs essential packages like nginx, git, and curl.
3.  Starts the nginx service.
4. Install docker and docker-compose

Upload the script using `scp`command

`scp  -i  /path/to/sshkey  setup.sh  ubuntu@<instance_ip>:/home/ubuntu/`

Login again to the virtual machine and run the following commands to execute the script.

`chmod  +x  setup.sh &&
./setup.sh`
## Step 3: Setting up the Containers
1. Clone the repository by running the following code in the terminal.
2. Create Dockerfiles on both api and web. Make sure to navigate into respective folders before creating each Dockerfile using
3. Build and Create the containers using docker-compose. We’ll have to create a Postgres database for the application in addition to the two Dockerfiles we created. Click here to view the [docker-compose.yml](https://github.com/tilshansanoj/wa-technical-assessment/blob/main/docker-compose.yml)

5. Start the application by using the following code in the terminal.

`docker-compose  up`

6. Open the ports 3000 and 3001 using Amazon security groups. (or the ports that expose in Dockerfile) 




If everything is done correctly you can check it by accessing *<ip_address_vm>:3000/api/status* . This will show you the current time from database. If you access the *<ip_address_vm>:3001* .

## Step 4: Nginx Host-Based Routing Configuration



1. Create a new configuration file  in /etc/nginx/sites-available/.

`sudo  nano  /etc/nginx/sites-available/web_example`

2. Add a new server block for api.example.com and web.example.com

```
server {
    listen 80;

    server_name web.example.com;

    location / {
        proxy_pass http://localhost:3000;
    }
}

server {
    listen 80;

    server_name api.example.com;

    location / {
        proxy_pass http://localhost:3001;
    }
}
``` 


3. Test and reload Nginx
```
sudo  nginx  -t
sudo  systemctl  reload  nginx
```

4. Finally update the DNS settings to ensure that the DNS record for api.example.com and web.example.com points to the public IP address of your Virtual machine.
