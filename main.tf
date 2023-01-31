provider "aws" {
  region = "us-east-2"
}

terraform {
  required_version = "<= 2.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "<= 5.0.0"
    }
  }
}

terraform {
  backend "s3" {
    bucket = "deemumbais3"
    key    = "deemumbais3/terraformmodules.tfstate"
    region = "ap-south-1"
  }
}
