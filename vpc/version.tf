terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.93.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}
terraform {
  backend "s3" {
    bucket = "fg-w7-terraformstatebucket"
    key    = "qa/terraform.tfstate"
    region = "us-east-1"
    use_lockfile = true
  }
}