provider "aws" {

    region ="us-east-1"
}

variable "ami" {

    description ="value"

}

variable "instance_type" {

    description = "value"
}

variable "name" {

    description = "value"
    
}

resource "aws_instance" "new_instance" {

    ami=var.ami
    instance_type=var.instance_type

    tags = {

        Name = lookup(var.name, terraform.workspace, "select instance tag name")

    }
}