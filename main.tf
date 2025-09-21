provider "aws" {
  region = var.region
}

data "aws_vpc" "default" {
  default = true
}

# Security Group (allow SSH & HTTP)
resource "aws_security_group" "ec2_sg" {
  name        = "ec2_sg"
  description = "Allow SSH and HTTP"
  vpc_id      = data.aws_vpc.default.id

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTP"
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# EC2 Instance with User Data
resource "aws_instance" "java_app" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_pair             

  vpc_security_group_ids = [aws_security_group.ec2_sg.id]

  user_data = <<-EOF
              #!/bin/bash
              apt update -y

              # Install Git & Java
              apt install -y git openjdk-17-jdk maven

              # Clone your repo
              cd /home/ubuntu
              git clone https://github.com/Trainings-TechEazy/test-repo-for-devops.git
              cd test-repo-for-devops

              mvn clean package
              sudo apt update
              sudo apt install -y net-tools
              nohup java -jar target/hellomvc-0.0.1-SNAPSHOT.jar --server.address=0.0.0.0 --server.port=8080 > app.log 2>&1 &
             
              EOF

  tags = {
    Name = "JavaAppServer"
  }
}
