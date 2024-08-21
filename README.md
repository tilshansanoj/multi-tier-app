# Devops Exercises
This repo contains code for a multi-tier application.

The application overview is as follows

```
web <=> api <=> db
```

The folders `web` and `api` respectively describe how to install and run each app.

# Required knowledge
1. **Terraform**:  
Suggested course: https://www.linkedin.com/learning/learning-terraform-2
1. **Ansible**:  
Suggested course: https://www.linkedin.com/learning/ansible-essential-training-14199798
1. **Docker**:  
Suggested course: https://www.linkedin.com/learning/learning-docker-2018
1. **Kubernetes**:  
Suggested course: https://www.linkedin.com/learning/learning-kubernetes

# Exercise 1
#### Objective
Create the scripts (Terraform and Ansible) to deploy the multi-tier application with source code hosted here on 2 machines and a managed DB instance.

#### Functional Requirements
1. The web and api tiers should be deployed on 2 different virtual machines. The 2 VMs should be provisioned using Terraform.
2. A managed postgres DB to use in the application on AWS RDS for example should be provisioned using Terraform.
4. On each machine, using Ansible:
    1.  Setup docker and docker-compose and set them to auto start as OS services.
    2.  Clone this repo and start the tier, either web or api.
7. The solution scripts should allow to be easily added to a repo and trigger the deployment pipline on any commit, using Jenkins or AWS code build or the like.

# Exercise 2
### Objective
Create the scripts (Terraform and Kubernets) to deploy the multi-tier application with source code hosted here as a fully containerized service on a Kubernetes cluster.

#### Functional Requirements
1. The web and api tiers must have multiple container instances.
1. The API needs one database (PostgreSQL) and this service needs be in a container.
1. The solution should support docker image versioning
1. The solution should write all application logs to a remote Rsyslog service
1. The solution must handle instance and container failures
1. The result of running the scripts should be two publicly available tiers: web and api
1. The script should be able to run against any AWS infrastructure and be able to launch the same tiers with minimal custom configuration or install steps.
