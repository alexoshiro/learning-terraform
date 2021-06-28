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

resource "aws_security_group" "ssh-access-us-east-2" {
    provider = aws.provider2
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