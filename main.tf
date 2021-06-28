provider "aws" {
    version = "~> 2.0"
    region  = "us-east-1"
}

provider "aws" {
    alias = "provider2"
    version = "~> 2.0"
    region  = "us-east-2"
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

resource "aws_instance" "dev6" {
    provider = aws.provider2
    ami = "ami-0b9064170e32bde34"
    instance_type = "t2.micro"
    key_name = "terraform-aws"
    tags = { 
        Name = "devs6"
    }
    vpc_security_group_ids = ["${aws_security_group.ssh-access-us-east-2.id}"]
    depends_on = [aws_dynamodb_table.dynamodb-homologacao]
}

resource "aws_dynamodb_table" "dynamodb-homologacao" {
    provider = aws.provider2
    name           = "GameScores"
    billing_mode   = "PAY_PER_REQUEST"
    read_capacity  = 20
    write_capacity = 20
    hash_key       = "UserId"
    range_key      = "GameTitle"

    attribute {
        name = "UserId"
        type = "S"
    }

    attribute {
        name = "GameTitle"
        type = "S"
    }
}

resource "aws_s3_bucket" "dev4" {
    bucket = "test-dev4"
    acl    = "private"

    tags = {
        Name        = "test-dev4"
    }
}