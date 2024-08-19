# Define the EC2 instance
resource "aws_instance" "ec2-instance" {
  ami           = var.ami
  instance_type = var.instance_type

  vpc_security_group_ids = [aws_security_group.instance.id]

  # Associate a public IP address
  associate_public_ip_address = true

  tags = {
    Name = "Terraform-EC2-Instance"
  }
}