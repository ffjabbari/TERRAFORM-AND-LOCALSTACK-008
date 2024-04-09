terraform {
  backend "s3" {
    bucket = "tf-state"
    key    = "terraform.tfstate"
  }

  required_version = "= 1.6.6"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
}
