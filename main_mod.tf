provider "aws" {

    region = "us-east-1"
}

variable "ami" {

    description = "value"

}

variable "instance_type" {

    description = "value"
    type = map(string)

    default = {

        dev = "t2.micro"
        stage = "t2.medium"
        prod = "t2.xlarge"
    }
}

variable "name" {

    description = "value"
    type =map(string)

    default = {

        "dev" = "dev environment"
        "stage" = "staging environment"
        "prod" = "production environment"
    }
}

module "ec2-instance" {
    source = "./modules/ec2-instance"
    ami = var.ami
    instance_type = lookup(var.instance_type, terraform.workspace, "select instance type")
    name=var.name
   }