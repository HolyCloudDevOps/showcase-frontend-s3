terraform {
  backend "s3" {
    bucket                  = "terraform-state-file-testproject"
    dynamodb_table          = "terraform-locks"
    key                     = "terraform.tfstate"
    region                  = "us-east-1"
  }
}

provider "aws" {
  region = us-east-1
}


resource "aws_s3_bucket" "testbucket" {
  bucket = "agsdgdsgsdjrsrgvsdgc"
  acl    = "private"

  tags = {
    Name = "test"
  }
}