terraform {
  backend "remote" {
    hostname = "app.terraform.io"
    organization = "estudos-alura"

    workspaces {
      name = "aws-test"
    }
  }
}