terraform {
  backend "s3" {
    bucket                  = "terraform-state-file-testproject "
    dynamodb_table          = "terraform-locks"
    key                     = "terraform.tfstate"
    region                  = "us-east-1"
  }
}

provider "aws" {
  region = us-east-1
}
