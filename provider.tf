terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}

# Create a VPC
resource "aws_vpc" "mgmain"{
    cidr_block = "192.168.0.0/20"
    instance_tenancy = "default"

    tags={
        Name="mgmain"
    }
}