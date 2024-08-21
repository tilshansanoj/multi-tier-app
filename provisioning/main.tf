terraform {
    required_providers {
     aws = {
        source = "hashicorp/aws"
        version = "~> 3.0"
     }
   }
}

provider "aws" {
  region = "us-east-1"
}

# Define the key pair 
resource "aws_key_pair" "deployer" {
  key_name   = "deployer-key"
  public_key = tls_private_key.rsa.public_key_openssh
}


# RSA key of size 4096 bits
resource "tls_private_key" "rsa" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "local_file" "deployer" {
  content  = tls_private_key.rsa.private_key_pem
  filename = "tfkey"
}


# Define the EC2 instance
resource "aws_instance" "ec2-instance" {
  ami           = var.ami
  instance_type = var.instance_type

  key_name = aws_key_pair.deployer.key_name

  vpc_security_group_ids = [aws_security_group.instance.id]

  associate_public_ip_address = true

  tags = {
    Name = "terraform-ec2-Instance"
  }
}

#use of default vpc
data "aws_vpc" "default_vpc" {
    default = true
}

#use of default subnet ids
data "aws_subnet_ids" "default_subnet" {
  vpc_id = data.aws_vpc.default_vpc.id
}


# Define the security group
resource "aws_security_group" "instance" {
  name = "instance-security-group"

  # Allow SSH access (port 22)
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow HTTP access (port 80)
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow HTTPS access (port 443)
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow all outbound traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

output "instance_ip_addr" {
  description = "The public IP of the EC2 instance"
  value       = aws_instance.ec2-instance.public_ip
}


