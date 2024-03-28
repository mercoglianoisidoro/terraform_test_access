
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "eu-west-1"
}


# Find the latest available AMI
data "aws_ami" "test" {
  filter {
    name   = "state"
    values = ["available"]
  }
  most_recent = true
}

output "test" {
  value = data.aws_ami.test
}

