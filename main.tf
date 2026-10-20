terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

provider "aws" {
  region = "eu-north-1"
}

resource "aws_instance" "level3_webserver" {
  ami                         = "ami-0fd9576cca965bd19"
  instance_type               = "t3.micro"
  subnet_id                   = "subnet-0d8c3ee724fe55203"
  vpc_security_group_ids      = ["sg-0cea6f6e12939a51a"]
  key_name                    = "devops.school.level3.apl-aws-cli-user"
  associate_public_ip_address = true
  user_data                   = file("user-data.web.sh")
  user_data_replace_on_change = true

  tags = {
    Name = "APL-Level3-WebServer"
  }
}
