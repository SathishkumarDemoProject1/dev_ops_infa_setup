provider "aws" {
  region = var.aws_region
  version = "4.14"
}

resource "aws_security_group" "jenkins_sg" {
  name        = "jenkins_sg"
  description = "Allow Jenkins Traffic"
  vpc_id      = var.vpc_id

  ingress {
    description      = "Allow from Personal CIDR block"
    from_port        = 8080
    to_port          = 8080
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  ingress {
    description      = "Allow from Personal CIDR block"
    from_port        = 50000
    to_port          = 50000
    protocol         = "tcp"
    cidr_blocks      = ["172.31.0.0/16"]
  }

  ingress {
    description      = "Allow from Personal CIDR block"
    from_port        = 9000
    to_port          = 9000
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  ingress {
    description      = "Allow SSH from Personal CIDR block"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "Jenkins Master"
  }
}

resource "aws_instance" "jenkins_master" {
  ami             = "ami-05fa00d4c63e32376"
  instance_type   = "t2.micro"
  key_name        = "terraform_key"
  security_groups = [aws_security_group.jenkins_sg.name]
  user_data       = "${file("install_jenkins.sh")}"
  tags = {
    Name = "Jenkins Master"
  }
}


resource "aws_instance" "sonar_machine" {
  ami             = "ami-05fa00d4c63e32376"
  instance_type   = "t3.medium"
  key_name        = "terraform_key"
  security_groups = [aws_security_group.jenkins_sg.name]
  user_data       = "${file("install_sonar.sh")}"
  tags = {
    Name = "SonarQube Server"
  }
}