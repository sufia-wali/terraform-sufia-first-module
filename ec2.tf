provider "aws" {
 region = "us-east-1"
}
terraform {
  backend "remote" {
    organization = "tech-1sep"

    workspaces {
      name = "first-space"
    }
  }
}
variable "username" {
 type = string
 default = "demo"
}
variable "i_type" {
 type = string
 default = "t2.micro"
}
variable "ami" {
 type = string
 default = "ami-087c17d1fe0178315"
}

variable "key" {
 type = string
 default = "sufia-test1"
}

resource "aws_instance" "myawsserver" {
  ami = var.ami
  instance_type = var.i_type
  key_name = var.key
 #user_data = templatefile("/home/sufia/terraform/aws/first-demo/user_data.tftpl", { user = var.username})

  tags = {
    Name = upper("sufia-aws-ec2-instance")
    Env = lower("Dev")
  }
}





output "myawsserver-ip" {
  value = "${aws_instance.myawsserver.public_ip}"
}
