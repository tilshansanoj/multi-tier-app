# General Variables

variable "region" {
  description = "Default region for provider"
  type = string
  default = "us-east-1"
}

variable "environment_name" {
    description = "Deployment environment (dev/staging/production)"
    type = string
    default = "dev"  
}

variable "app_name" {
  description = "Name of the web application"
  type        = string
  default     = "web-app"
}

# EC2 variables
variable "ami" {
  description = "Amazon machine image for ec2 instance"
  type = string
  default     = "ami-011899242bb902164" # Ubuntu 20.04 LTS // us-east-1
}

variable "instance_type" {
  description = "ec2 instance type"
  type        = string
  default     = "t2.micro"
}