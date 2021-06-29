variable "amis" {
    type = map(string)

    default = {
        "ami-us-east-1" = "ami-0747bdcabd34c712a"
        "ami-us-east-2" = "ami-0b9064170e32bde34"
    }
}

variable "cdirs_acesso_remoto" {
    type = list(string)

    default = ["177.204.165.72/32"]
}

variable "key_name" {
    default = "terraform-aws"
}

variable "instance_type" {
    default = "t2.micro"
}