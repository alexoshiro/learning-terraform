provider "aws" {
    version = "~> 2.0"
    region  = "us-east-1"
}

resource "aws_instance" "dev" {
    count = 3
    ami = "ami-0747bdcabd34c712a"
    instance_type = "t2.micro"
    key_name = "terraform-aws"
    tags = { 
        Name = "devs${count.index}"
    }
    vpc_security_group_ids = ["${aws_security_group.ssh-access.id}"]
}

resource "aws_security_group" "ssh-access" {
  name        = "ssh-access"
  description = "ssh-access"

  ingress {
    description      = "SSH"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["177.204.165.72/32"]
  }

  tags = {
    Name = "ssh"
  }
}

resource "aws_instance" "dev4" {
  ami = "ami-0747bdcabd34c712a"
  instance_type = "t2.micro"
  key_name = "terraform-aws"
  tags = { 
      Name = "devs4"
  }
  vpc_security_group_ids = ["${aws_security_group.ssh-access.id}"]
  depends_on = [aws_s3_bucket.dev4]
}


resource "aws_s3_bucket" "dev4" {
  bucket = "test-dev4"
  acl    = "private"

  tags = {
    Name        = "test-dev4"
  }
}