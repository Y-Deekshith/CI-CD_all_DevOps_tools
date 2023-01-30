provider "aws" {
  region = "us-east-1"
}

terraform {
required_version = "~> 2.0.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

terraform {
  backend "s3" {
    bucket = "dees3devops"
    key    = "dees3devops/terraformmodules.tfstate"
  }
}
