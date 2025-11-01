provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "one" {
  count                  = 3
  ami                    = "ami-02b8269d5e85954ef"
  instance_type          = "t3.small"
  key_name               = "jenkins"
  vpc_security_group_ids = ["sg-0f1be3cd35f7885a1"]
  tags = {
    Name = var.instance_names[count.index]
  }
}

variable "instance_names" {
  default = ["jenkins","tomcat-1","Monitoring server"]
}
