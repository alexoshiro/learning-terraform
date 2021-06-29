resource "aws_security_group" "ssh-access" {
    name        = "ssh-access"
    description = "ssh-access"

    ingress {
        description      = "SSH"
        from_port        = 22
        to_port          = 22
        protocol         = "tcp"
        cidr_blocks      = var.cdirs_acesso_remoto
    }

    tags = {
        Name = "ssh"
    }
}
/*
resource "aws_security_group" "ssh-access-us-east-2" {
    provider = aws.provider2
    name        = "ssh-access"
    description = "ssh-access"

    ingress {
        description      = "SSH"
        from_port        = 22
        to_port          = 22
        protocol         = "tcp"
        cidr_blocks      = var.cdirs_acesso_remoto
    }

    tags = {
        Name = "ssh"
    }
}
*/